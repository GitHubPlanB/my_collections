# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;35m\]\u@\h\[\033[00m\]: \[\033[01;35m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
cdl(){
	\cd "$*"
	ls
}
alias cd='cdl'
alias c.='cd ..'
alias c..='cd ../..'
alias c...='cd ../../..'
alias c....='cd ../../../..'
alias c.....='cd ../../../../..'
alias c......='cd ../../../../../..'
alias sc='source ~/.bashrc'
alias vs='vncserver -geometry 2048x1152 :12345'
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
#    . /etc/bash_completion
#fi
export GOROOT=/usr/share/go-1.10
export PATH=$GOROOT/bin:$PATH
export GOPATH=/home/changhongming/go_dev

alias g=gvim
alias rtl='cd ~/repository/Accelor/hwace/fpga/project/rtl'


export XILINXD_LICENSE_FILE=/home/samba/shared/Xilinx.lic

export XILINX_VIVADO=/opt/Xilinx/Vivado/2018.3
if [ -n "${PATH}" ]; then
  export PATH=/opt/Xilinx/Vivado/2018.3/bin:$PATH
else
  export PATH=/opt/Xilinx/Vivado/2018.3/bin
fi


## add the synopsys LM 
export SYNOPSYS_HOME=/opt/synopsys

export PATH=$PATH:/opt/synopsys/scl2016/amd64/bin
#export LM_LICENSE_FILE=$SYNOPSYS_HOME/license/Synopsys.dat
export SNPSLMD_LICENSE_FILE=$SYNOPSYS_HOM/lincense/Synopsys.dat
export LM_LICENSE_FILE=27000@UBANTU
#export LM_LICENSE_FILE=27000@ubantu
# vcs
export VCS_HOME=$SYNOPSYS_HOME/vcs2016
export PATH=$PATH:$VCS_HOME/amd64/bin

export PATH=$PATH:/opt/synopsys/vcs2016/gui/dve/bin

#export VCS_ARCH_OVERRIDE=linux
#export VCS_TARGET_ARCH=amd64
#alias vcs=$VCS_PATH/linux64/bin/vcs

#verdi
export VERDI_HOME=$SYNOPSYS_HOME/verdi2016
export PATH=$VERDI_HOME/bin:$VERDI_HOME/platform/LINUXAMD64/bin:$PATH

alias verdi=$VERDI_HOME/bin/verdi

export VCS_COM=/opt/synopsys/vcs2016/amd64/bin/vcs1
export VCS_CC=gcc


source /opt/dsa/xilinx_vcu1525_dynamic_5_1/xbinst/setup.sh
export PATH=$PATH:/opt/dsa/xilinx_vcu1525_dynamic_5_1/xbinst/runtime/bin
#macchanger eno2 -m 00:11:22:33:44:55

export XILINX_XRT=/opt/xilinx/xrt
export SWERV_EH1_FPGA_PATH=~/Downloads/swerv_eh1_fpga-master

export RV_ROOT=$SWERV_EH1_FPGA_PATH/hardware/swerv_eh1

source $XILINX_XRT/setup.sh
source /opt/Xilinx/SDx/2018.3/settings64.sh*

# added by Anaconda3 5.3.0 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/home/zhangyy/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/home/zhangyy/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/zhangyy/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/home/zhangyy/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
#source /opt/Xilinx_SDx/SDx/2018.2/settings64.sh*

export PATH=/home/shenyaming/riscv/bin:$PATH
export RISCV_OPENOCD_PATH=~/Downloads/riscv-openocd-0.10.0-2019.02.0-x86_64-linux-ubuntu14
export RISCV_PATH=~/Downloads/riscv64-unknown-elf-gcc-8.2.0-2019.02.0-x86_64-linux-ubuntu14

PATH="/home/zhangyy/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/zhangyy/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/zhangyy/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/zhangyy/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/zhangyy/perl5"; export PERL_MM_OPT;
