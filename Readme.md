# Work Environment Configuration
Scripts to setup a work environment for git, vim, buildroot, and more.

## Scripts
* buildroot_download_pkgs.sh: run to install packages necessary for working with buildroot
  * setup_bsp_env.sh: sets up a 'bsp' environment
    * bsp folder for BR2_EXTERNAL
    * buildroot repo
    * linux and linux-stable repos
    * u-boot repo
    * builds folder
* setup_git.sh: configures certain git settings; assumes git is install (such as in buildroot_download_pkgs.sh)
* setup_dotfiles.sh: links configuration dotfiles (such as .vimrc and .screenrc) to the dotfiles in this repo
* setup_vim.sh: installs Vundle and other plugins for Vim as well as installing needed packages (must be run after setup_dotfiles.sh)
