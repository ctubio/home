if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi

if [ "`wc -w < "$HOME/TODO"`" -ne "0" ]; then
  echo -e "${GREEN}Where are you going?${YELLOW}";
  cat "$HOME/TODO" | sed "s/^/  /";
  echo -ne "${NC}" && sleep 3;
fi
