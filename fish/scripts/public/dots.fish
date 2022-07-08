#!/usr/bin/fish

function dots -d "Edit dotfiles."
  if test (count $argv) -lt 1
    echo "Edit dotfiles."
    echo "Usage: dots [application]"
  end
end
