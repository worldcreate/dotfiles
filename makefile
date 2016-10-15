DOTFILES_EXCLUDES := .git $(wildcard .??*.swp)
DOTFILES_TARGET   := $(wildcard .??*)
DOTFILES_DIR      := $(PWD)
DOTFILES_FILES    := $(filter-out $(DOTFILES_EXCLUDES), $(DOTFILES_TARGET))

deploy:
	@$(foreach val, $(DOTFILES_FILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)
	@echo 'complete!'

init:
	@$(foreach val, $(wildcard ./etc/init/*.sh), bash $(val);)
