# Defined in /var/folders/m9/l5tv1cy93kx2x5bqv8rv46j40000gn/T//fish.bPm4uA/fish_prompt.fish @ line 2
function fish_prompt --description 'Write out the prompt'
	set -l last_status $status

    # kube-prompt
    set_color blue
    __kube_prompt
    set_color normal

    echo -n ' '

    # PWD
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    set_color normal

    __terlar_git_prompt
    echo

    if not test $last_status -eq 0
        set_color $fish_color_error
    end

    # virtualfish
    if set -q VIRTUAL_ENV
        echo -n -s "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
    end

    echo -n '➤ '
    set_color normal
end
