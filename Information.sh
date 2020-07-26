#! /bin/bash

# Note: The result of Information.sh is saved in information.vim
#       Browse information.vim for more detailed information

#== operating system info
operating_system_update()
{
    uname -n > tmp && uname -r >> tmp
    sed -i 'h;n;H;x; s/\n/ /' tmp && sed -i '1d' tmp
    sed -i 's/^/" /' tmp
    sed -i '/Operating System/ r tmp' information.vim
    stat /boot/initramfs-5.4-x86_64.img | sed -n '/^Modify/ p' > tmp
    sed -i 's/^/" /' tmp
    sed -i '/Operating System/ r tmp' information.vim && rm tmp
}

operating_system_delete()
{
    upper_limit=$(($(sed -n -e '/Operating System/=' information.vim)+1))
    lower_limit=$(($(sed -n -e '/Vim Version/=' information.vim)-1))
    sed -i "$upper_limit,$lower_limit d" information.vim
    sed -i '/Operating System/ a \\n' information.vim
}


#== vim version info
vim_version_update()
{
    stat /bin/vim | sed -n '/^Modify/ p' > tmp
    vim --version | sed -n '1,3p' >> tmp
    sed -i 's/^/" /' tmp
    sed -i '/Vim Version/ r tmp' information.vim && rm tmp
}

vim_version_delete()
{
    upper_limit=$(($(sed -n -e '/Vim Version/=' information.vim)+1))
    lower_limit=$(($(sed -n -e '/Vim Plugins/=' information.vim)-1))
    sed -i "$upper_limit,$lower_limit d" information.vim
    sed -i '/Vim Version/ a \\n' information.vim
}


#== vim plugins info
vim_plugins_update()
{
    sed -n '/^Plug/ p' vimrc | sed '=' > tmp
    sed -i 'N;s/\n/: /' tmp &&  sed -i 's/^/" /' tmp
    sed -i '/Vim Plugins/ r tmp' information.vim
    stat plugged | sed -n '/^Modify/ p' > tmp
    sed -i 's/^/" /' tmp
    sed -i '/Vim Plugins/ r tmp' information.vim && rm tmp
}

vim_plugins_delete()
{
    upper_limit=$(($(sed -n -e '/Vim Plugins/=' information.vim)+1))
    lower_limit=$(($(sed -n -e '/Required Programs/=' information.vim)-1))
    sed -i "$upper_limit,$lower_limit d" information.vim
    sed -i '/Vim Plugins/ a \\n' information.vim
}


#== information run
information_run()
{
    operating_system_time_number=$(($(sed -n -e '/Operating System/=' information.vim)+1))
    operating_system_old_time="$(sed -n "$operating_system_time_number p" information.vim)"
    operating_system_new_time="$(stat /boot/initramfs-5.4-x86_64.img | sed -n '/^Modify/ p')"
    if test "$operating_system_old_time" != "$operating_system_new_time"
    then
        operating_system_delete && operating_system_update
    fi

    vim_version_time_number=$(($(sed -n -e '/Vim Version/=' information.vim)+1))
    vim_version_old_time=$(sed -n "$vim_version_time_number p" information.vim)
    vim_version_new_time=$(stat /bin/vim | sed -n '/^Modify/ p')
    if test "$vim_version_old_time" != "$vim_version_new_time"
    then
        vim_version_delete && vim_version_update
    fi

    vim_plugins_time_number=$(($(sed -n -e '/Vim Plugins/=' information.vim)+1))
    vim_plugins_old_time=$(sed -n "$vim_plugins_time_number p" information.vim)
    vim_plugins_new_time=$(stat /home/antoine/.vim/plugged | sed -n '/^Modify/ p')
    if test "$vim_plugins_old_time" != "$vim_plugins_new_time"
    then
        vim_plugins_delete && vim_plugins_update
    fi
}


# run to get info
information_run
