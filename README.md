export GITHUB_USERNAME=ItzEmoji
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME
