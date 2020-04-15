#!/usr/bin/env bash

# -W = wordlist & dothis = program for which this completion will be used
# -A = action
# complete -W "now tomorrow never" dothis
# complete -A directory dothis

_dothis_completions() {
	# COMPREPLY+=("now")
	# COMPREPLY+=("tomorrow")
	# COMPREPLY+=("never")
	# COMPREPLY=($(compgen -W "now tomorrow never" "${COMP_WORDS[1]}"))
	COMPREPLY=($(compgen -W "$(fc -l -50)" -- "${COMP_WORDS[1]}"))
}

complete -F _dothis_completions dothis
