# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

export PATH=/usr/local/bin:$PATH
export PATH=$PATH:~/.local/bin
