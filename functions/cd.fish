function cd --description "Change working directory"

  set dir_record ~/.config/fish/current_dir
  set dir_previous (cat $dir_record)
  set dir_current (realpath .)

  # cd
  if [ "0$argv" = "0-" ]
    set dir_next $dir_previous
    builtin cd $dir_previous
  else
    if [ "0$argv" = "0"  ] 
      set argv ~
    end
    set dir_next (realpath $argv)
    builtin cd $argv
  end

  #update record
  if [ "$dir_current" = "$dir_next" ]
  else
    echo $dir_current > $dir_record
  end

  if [ -e "./.ruby-version" ]
    echo "start-up rvm script"
    rvm > /dev/null 2>&1
  end

  if [ -e "./.rvmrc" ]
    echo "start-up .rvmrc script"
    . ./.rvmrc
  end

end
