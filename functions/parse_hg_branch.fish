function parse_hg_branch
  if is-hg
    if test (count (hg status)) = 0
      set_color blue
    else
      set_color red
    end
    hg branch | sed -e 's/\(.*\)/ \/hg:\1/'
  end
end
