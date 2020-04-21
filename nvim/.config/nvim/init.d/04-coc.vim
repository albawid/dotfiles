" --[ coc_extensions ]------------------------------------------------------------------
let g:coc_global_extensions = [
  \ 'coc-sh',
  \ 'coc-highlight',
  \ 'coc_xml',
  \ 'coc_tsserver',
  \ 'coc_python',
  \ 'coc_phpls',
  \ 'coc_json',
  \ 'coc_html',
  \ 'coc_css'
  \ ]
let g:LanguageClient_serverCommands = {
    \ 'sh': ['bash-language-server', 'start']
    \ }
