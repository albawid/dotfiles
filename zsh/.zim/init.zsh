zimfw() { source /home/albawid/.zim/zimfw.zsh "${@}" }
fpath=(/home/albawid/.zim/modules/git/functions /home/albawid/.zim/modules/utility/functions /home/albawid/.zim/modules/git-info/functions ${fpath})
autoload -Uz git-alias-lookup git-branch-current git-branch-delete-interactive git-dir git-ignore-add git-root git-stash-clear-interactive git-stash-recover git-submodule-move git-submodule-remove mkcd mkpw coalesce git-action git-info
source /home/albawid/.zim/modules/environment/init.zsh
source /home/albawid/.zim/modules/git/init.zsh
source /home/albawid/.zim/modules/input/init.zsh
source /home/albawid/.zim/modules/termtitle/init.zsh
source /home/albawid/.zim/modules/utility/init.zsh
source /home/albawid/.zim/modules/steeef/steeef.zsh-theme
source /home/albawid/.zim/modules/zsh-completions/zsh-completions.plugin.zsh
source /home/albawid/.zim/modules/completion/init.zsh
source /home/albawid/.zim/modules/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/albawid/.zim/modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/albawid/.zim/modules/zsh-history-substring-search/zsh-history-substring-search.zsh