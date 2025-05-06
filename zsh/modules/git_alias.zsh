# Git
alias g='git'

# Log (l)
git_log_format_medium='--pretty=format:%C(bold)Commit:%C(reset) %C(green)%H%C(red)%d%n%C(bold)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B'
git_log_format_oneline='--pretty=format:%C(green)%h%C(reset) %s%n'
git_log_format_brief='--pretty=format:%C(green)%h%C(reset) %s%n%C(blue)(%ar by %an)%C(red)%d%C(reset)%n'

alias gl='git log --topo-order ${git_log_format_medium}'
alias gls='git log --topo-order --stat ${git_log_format_medium}'
alias gld='git log --topo-order --stat --patch --full-diff ${git_log_format_medium}'
alias glo='git log --topo-order ${git_log_format_oneline}'
alias glg='git log --topo-order --all --graph ${git_log_format_oneline}'
alias glb='git log --topo-order ${git_log_format_brief}'
alias glc='git shortlog --summary --numbered'

# Working Copy (w)
alias gws='git status --short'
alias gwS='git status'
alias gwd='git diff --no-ext-diff'
alias gwD='git diff --no-ext-diff --word-diff'
alias gwr='git reset --soft'
alias gwR='git reset --hard'
alias gwc='git clean -n'
alias gwC='git clean -f'
alias gwx='git rm -r'
alias gwX='git rm -rf'
alias gwg='git grep'