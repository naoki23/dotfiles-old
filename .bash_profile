# .bash_profile

# .bashrcが存在する場合
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# nodebrewの設定
export PATH="$HOME/.nodebrew/current/bin:$PATH"

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion


export PATH="$HOME/.cargo/bin:$PATH"
