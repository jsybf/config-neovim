;; extends

; 빌트인 명령어 구분
((command
   name: (word) @function.builtin)
 (#any-of? @function.builtin
   "set" "echo" "read" "string" "test" "math" "count" "printf"
   "status" "abbr" "alias" "bind" "source" "type" "contains" "argparse"))

; -f, --flag 같은 옵션을 인자와 분리
(command
  argument: (word) @variable.parameter
  (#match? @variable.parameter "^-"))

; 논리 연산자
[ "and" "or" "not" ] @keyword.operator

; 파이프/리다이렉션이 눈에 띄게
(pipe) @operator
(file_redirect) @operator
(stream_redirect) @operator
