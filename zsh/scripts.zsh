# List projects
fwork() {
    result=$(find ~/repos/* -mindepth 1 -maxdepth 1 -type d | awk -F/ '{print $(NF-1)"/"$NF}' | sort | uniq | nl | fzf | cut -f 2)
    [ -n "$result" ] && cd ~/repo/$result
}