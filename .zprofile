# .z_profile

# .zshrcが存在する場合
if [ -f ~/.zshrc ]; then
    . ~/.zshrc
fi

export PATH="/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Setting PATH for Python 3.5
    # The orginal version is saved in .bash_profile.pysave
    PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"

# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

# Python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# nodebrewの設定
export PATH="$HOME/.nodebrew/current/bin:$PATH"

case ${OSTYPE} in
    linux*)
        ;;
    darwin*)
        # openssl
        export LDFLAGS="-L/usr/local/opt/openssl/lib"
        ;;
esac
