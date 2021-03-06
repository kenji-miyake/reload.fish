function reload
    # Help
    function __help -d "show help"
        printf "usage: reload [-h] [-e env1=value1] [-e env2=value2]\n\n"

        printf "positional arguments:\n"
        printf "\n"

        printf "optional arguments:\n"
        printf "  -h, --help          show this help message and exit\n"
        printf "  -e, --env           environment variable to be set before reloading\n"
        printf "\n"

        return 0
    end

    # Parse arguments
    set -l options "h/help" "e/env=+"
    argparse $options -- $argv || return 1

    # Show help
    set -q _flag_help && __help && return 0

    # Create unset options
    for env_var in (env)
        set key (string split = "$env_var")[1]
        if not contains "$key" $RELOAD_PROTECTED_ENV_VARS
            set unset_options $unset_options -u $key
        end
    end

    # Reload shell
    exec env $unset_options /usr/bin/env $_flag_env bash -i -c "exec fish"
end
