#!/bin/sh

# Function to get the top IP addresses with the most requests
get_top_ip() {
    log_file=$1
    top_n=$2
    awk '{print $1}' $log_file | sort | uniq -c | sort -nr | awk '{print $2 " - " $1 " requests"}' | head -n $top_n
}

# Function to get the top requested URLs
get_top_urls() {
    log_file=$1
    top_n=$2
    awk '{print $7}' $log_file | sort | uniq -c | sort -nr | awk '{print $2 " - " $1 " requests"}' | head -n $top_n
}

# Function to get the top status codes
get_status_codes() {
    log_file=$1
    top_n=$2
    awk '{print $9}' $log_file | sort | uniq -c | sort -nr | awk '{print $2 " - " $1 " requests"}' | head -n $top_n
}

# Function to get the top user agents
get_user_agents() {
    log_file=$1
    top_n=$2
    awk -F'"' '{print $6}' $log_file | sort | uniq -c | sort -nr | awk '{for(i=2;i<=NF;++i) printf $i " "; print "- " $1 " requests"}' | head -n $top_n
}

# Function to display usage instructions
usage() {
    echo "Usage: nginx-log-analyser -f <log_file> -t <top_n>"
}

# Main function
# nginx-log-analyser -f <log_file> -t <top_n> 
main() {
    while getopts "f:t:" opt; do
        case $opt in
            f)
                log_file=$OPTARG
                ;;
            t)
                top_n=$OPTARG
                ;;
            \?)
                usage
                exit 1
                ;;
        esac
    done

    if [ -z "$log_file" ] || [ -z "$top_n" ]; then
        usage
        exit 1
    fi

    echo "Top $top_n IP addresses with the most requests:"
    get_top_ip $log_file $top_n

    echo -e "\nTop $top_n most requested paths:"
    get_top_urls $log_file $top_n

    echo -e "\nTop $top_n response status codes:"
    get_status_codes $log_file $top_n

    echo -e "\nTop $top_n user agents:"
    get_user_agents $log_file $top_n
}

main "$@"