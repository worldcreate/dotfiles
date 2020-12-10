# vim:fileencoding=utf-8:noet
from __future__ import (unicode_literals,
                        division,
                        absolute_import,
                        print_function)

from powerline.theme import requires_segment_info
from powerline.segments import Segment, with_docstring
from datetime import datetime
from requests import get
import pytz
import json


@requires_segment_info
class CurrentTogglTask(Segment):
    pl = None

    def format_toggl_task(self, data):
        if data is None:
            return None

        start_dt = datetime.strptime(data['start'], '%Y-%m-%dT%H:%M:%S%z')
        start_dt = start_dt.astimezone(pytz.timezone('Asia/Tokyo'))
        self.pl.debug("{}/{}", start_dt.hour, start_dt.minute)

        now_dt = datetime.now().astimezone(pytz.timezone('Asia/Tokyo'))
        delta_dt = (now_dt - start_dt)
        elapsed_hour = int(delta_dt.total_seconds() // 3600)
        elapsed_minute = int(delta_dt.total_seconds() % 3600 // 60)
        elapsed_second = int(delta_dt.total_seconds() % 3600 % 60)
        self.pl.debug("{} / {} / {}",
                      elapsed_hour, elapsed_minute, elapsed_second)

        task_title = data['description']
        if len(task_title) > 10:
            task_title = '{}...'.format(task_title[:10])

        pjcode = self.get_tag_pjcode(data)
        if pjcode is not None:
            task_title = '{}({})'.format(task_title, pjcode)

        self.pl.debug(task_title)

        return '{}[{}:{}:{}]'.format(task_title,
                                     elapsed_hour,
                                     elapsed_minute,
                                     elapsed_second)

    def get_tag_pjcode(self, data):
        if 'tags' not in data:
            return None
        tags = data['tags']

        self.pl.debug(tags)

        tag = tags[0]
        split_tag = tag.split(':')
        pj_code = split_tag[0]

        return pj_code

    def __call__(self, pl, segment_info,
                 dir_shorten_len=None,
                 dir_limit_depth=None,
                 use_path_separator=False,
                 ellipsis='...',
                 **kwargs):
        self.pl = pl

        tmp_file_path = "/tmp/current-toggl-task"

        second = datetime.now().second
        if second % 5 == 0:
            with open(tmp_file_path, "w") as f:

                r = get('https://www.toggl.com/api/v8/time_entries/current',
                        auth=('2cacf74d55e4a7b7ee265f08102fe82c', 'api_token'))
                pl.debug(r.json()['data'])
                f.write(r.text)
                data = r.json()['data']
                return self.format_toggl_task(data)
        else:
            with open(tmp_file_path, "r") as f:
                pl.debug("read from file")
                data = json.load(f)['data']
                return self.format_toggl_task(data)


current_toggl_task = with_docstring(CurrentTogglTask(),
                                    '''Return toggl current task''')
