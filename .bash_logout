if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi

if [ "`wc -w < "$HOME/TODO"`" -ne "0" ]; then
  echo -e "${_GREEN}Where are you going?${_YELLOW}";
  cat "$HOME/TODO" | sed "s/^/  /";
  echo -ne "${_NC}" && sleep 1;
fi
