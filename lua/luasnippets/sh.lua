local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt

-- 選択されたテキストを取得するヘルパー関数
local function get_visual(_, parent)
    if (#parent.snippet.env.LS_SELECT_RAW > 0) then
        return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
    else
        return sn(nil, i(1))
    end
end

return {
   s("go_def", fmt([[
VERSION="0.1"
PROG=${0##/}
echo "$PROG"

parser_definition() {
  setup   REST help:usage -- "Usage: $PROG [options]... [arguments]..." ''
  msg -- 'Options:'
  flag    FLAG    -f --flag                 -- "takes no arguments"
  param   PARAM   -p --param init:="test"                -- "takes one argument"
  option  OPTION  -o --option init:="default"  -- "takes one optional argument"
  param   PATTERN  -p --patern init:="apple" pattern:'apple | orange | lemon' -- "select param default:apple"
  param   NUMBER  -n --number validate:number -- "number param"
  param   RANGE   -r  --range validate:'range 10 100' -- "range 10-100"
  param   REGEX -r  --regex validate:'regex "^[0-9]+$"' -- "regex"
  flag    VERBOSE -v --verbose counter:true init:=0 -- "verbose message"
  disp    :usage  -h --help
  disp    VERSION    --version
}
number() {
	case $OPTARG in (*[!0-9]*) return 1; esac
}
range() {
    number || return 1
    [[ $1 -le "$OPTARG" ]] && [[ $2 -ge "$OPTARG" ]] && return 0
    return 2
}
regex() {
	awk -v s="$OPTARG" -v r="$1" 'BEGIN{exit match(s, r)==0}'
}

eval "$(getoptions parser_definition) exit 1"
       
   ]])), 

}
