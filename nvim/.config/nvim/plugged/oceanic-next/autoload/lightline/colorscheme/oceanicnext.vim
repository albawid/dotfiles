" ============================================================
" oceanicnext
" Author: Mike Hartington
" Edited By: albawid, 
" [["#1B2B34", 15], ["#65737E", 243], 'bold' ]]
" ============================================================

let s:p = {"normal": {}, "inactive": {}, "insert": {}, "replace": {}, "visual": {}, "tabline": {} }

let s:p.normal.left = [[["#1B2B34", 15], ["#6699cc", 68], 'bold' ], [["#1B2B34", 15], ["#A7ADBA", 243], 'bold' ]]
let s:p.normal.middle = [[["#A7ADBA", 15], ["#343d46", 237]]]
let s:p.normal.right = [[["#1B2B34", 15], ["#A7ADBA", 243], 'bold' ], [["#1B2B34", 15], ["#65737E", 243], 'bold' ]]
let s:p.normal.error = [[["#EC5F67", 15], ["#1B2B34", 203], 'bold' ]]
let s:p.normal.warning = [[["#FAC863", 15], ["#1B2B34", 221], 'bold' ]]

let s:p.inactive.left = [[["#1B2B34", 253], ["#A6ACB9", 243]], [["#d8dee9", 253], ["#343d46", 237]]]
let s:p.inactive.middle = [[["#1B2B34", 243], ["#343d46", 237]]]
let s:p.inactive.right = [[["#1B2B34", 253], ["#A6ACB9", 237]], [["#1B2B34", 253], ["#A6ACB9", 243]]]

let s:p.insert.left = [[["#1B2B34", 15], ["#99c794", 114], 'bold' ], [["#1B2B34", 15], ["#A7ADBA", 243], 'bold' ]]
let s:p.insert.middle = [[["#A7ADBA", 15], ["#343d46", 237]]]
let s:p.insert.right = [[["#1B2B34", 15], ["#A7ADBA", 243], 'bold' ], [["#1B2B34", 15], ["#A7ADBA", 114], 'bold' ]]

let s:p.replace.left = [[["#1B2B34", 15], ["#F9C762", 203], 'bold' ], [["#1B2B34", 15], ["#A7ADBA", 243], 'bold' ]]
let s:p.replace.middle = [[["#A7ADBA", 15], ["#343d46", 237]]]
let s:p.replace.right = [[["#1B2B34", 15], ["#A7ADBA", 243], 'bold' ], [["#1B2B34", 15], ["#A7ADBA", 203], 'bold' ]]

let s:p.visual.left = [[["#1B2B34", 15], ["#C594C5", 209], 'bold' ], [["#1B2B34", 15], ["#A7ADBA", 243], 'bold' ]]
let s:p.visual.middle = [[["#A7ADBA", 15], ["#343d46", 237]]]
let s:p.visual.right = [[["#1B2B34", 15], ["#A7ADBA", 243], 'bold' ], [["#1B2B34", 15], ["#A7ADBA", 209], 'bold' ]]

let s:p.tabline.left = [[["#1B2B34", 243], ["#64727D", 237]]]
let s:p.tabline.tabsel = [[["#1B2B34", 15], ["#A7ADBA", 243], 'bold' ]]
let s:p.tabline.middle = [[["#A7ADBA", 243], ["#343d46", 237]]]
let s:p.tabline.right = [[["#1B2B34", 243], ["#A7ADBA", 237], 'bold' ], [["#1B2B34", 15], ["#65737E", 243], 'bold' ]]

let g:lightline#colorscheme#oceanicnext#palette = lightline#colorscheme#flatten(s:p)
