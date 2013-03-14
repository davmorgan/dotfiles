# replicate the bash have() function.
have() {
  unset have
  (( ${+commands[$1]} )) && have=yes
}
