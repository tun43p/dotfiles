#!/usr/bin/fish

function shortcuts -d "Display shortcuts."
  set file $HOME/.shortcuts.txt
  cat $file | read -za lines

  if test (count $argv) -lt 1
    echo "Display shortucts."
    echo "Usage: shortcuts [regex]"
    echo "Example: shortcuts close window" 
    echo -e "\nAll shortcuts:\n"
    for line in $lines; echo $line; end
  end

  for line in $lines
    if string match -r -q $argv[1] $line
      echo $line | tail -n +1
    end
  end
end
