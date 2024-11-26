#!/usr/bin/env zsh
set -e # abort when any command errors (prevents self-removing at the end)
this_file=$(basename "$0")
#───────────────────────────────────────────────────────────────────────────────
# VALUES

# plugin name is the same as the git repo name and can therefore be inferred
repo=$(git remote -v | head -n1 | sed -e 's/\.git.*//' -e 's/.*:\(.*\) .*/\1/')
name=$(echo "$repo" | cut -d/ -f2)
name_short=$(echo "$name" | sed -e 's/.nvim$//' -e 's/^nvim-//')
# shellcheck disable=2296 # valid in zsh to capitalize string
name_short_cap=${(C)name_short}
year=$(date +"%Y")

# desc can be inferred from github description (not using jq for portability)
desc=$(curl -sL "https://api.github.com/repos/$repo" |
	grep --max-count=1 "description" | cut -d'"' -f4)

#───────────────────────────────────────────────────────────────────────────────
# PLACEHOLDERS

# INFO macOS' sed requires `sed -i ''`, remove the `''` when on Linux
function replacePlaceholders() {
	LC_ALL=C # prevent byte sequence error
	find . -type f -not -path '*/\.git/*' -not -name ".DS_Store" -not -name "$this_file" -exec \
		sed -i '' "s|$1|$2|g" {} \;
}

# longer placeholders first
replacePlaceholders "PLACEHOLDER_plugin_name_short_capitalized" "$name_short_cap"
replacePlaceholders "PLACEHOLDER_plugin_name_short" "$name_short"
replacePlaceholders "PLACEHOLDER_plugin_repo" "$repo"
replacePlaceholders "PLACEHOLDER_plugin_desc" "$desc"
replacePlaceholders "PLACEHOLDER_plugin_name" "$name"
replacePlaceholders "PLACEHOLDER_year" "$year"

#───────────────────────────────────────────────────────────────────────────────
# FILES

# `panvimdoc` will generate the correctly named help file later
rm doc/nvim-pseudometa-plugin-template.txt

mv "./lua/PLACEHOLDER_plugin_name_short" "./lua/$name_short"
rm "$this_file"

#───────────────────────────────────────────────────────────────────────────────

git add --all && git commit -m "init: bootstrap"
print "\e[1;32mSuccess.\e[0m"
