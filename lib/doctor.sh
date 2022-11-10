doctor_init() {
    doctor_status=0
}

doctor_check() {
    type="$1"
    title="$2"
    cmd="$3"

    printf "Checking '%s'... " "$title"
    $cmd >/dev/null 2>&1
    status=$?

    if [ "$status" == 0 ]; then
        printf "${blue}OK${default}\n"
    else
        case "$type" in
            warn)
                printf "${yellow}WARN${default}\n"
                if (( "$doctor_status" < 1 )); then
                    doctor_status=1
                fi
                ;;

            error)
                printf "${red}ERROR${default}\n"
                doctor_status=2
                ;;
        esac
    fi

    return $status
}

doctor_finish() {
    echo

    case "$doctor_status" in
        0)
            printf "${blue}Doctor run successfully${default}\n"
            ;;
        1)
            printf "${yellow}Doctor finished with warnings${default}\n"
            ;;
        2)
            printf "${red}Doctor had failed checks${default}\n"
            ;;
    esac

    exit "$doctor_status"
}

doctor_check_warn() {
    doctor_check warn "$@"
}

doctor_check_err() {
    doctor_check error "$@"
}
