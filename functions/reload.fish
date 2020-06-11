function reload
    for env_var in (env)
        set key (string split = "$env_var")[1]
        if not contains "$key" $RELOAD_PROTECTED_ENV_VARS
            set args $args -u $key
        end
    end

    exec env $args /usr/bin/env bash -i -c "exec fish"
end
