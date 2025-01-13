#!/bin/bash

# Предыдущая раскладка
prev_layout=""

while true; do
  # Получаем текущую раскладку
  current_layout=$(hyprctl devices | grep -B5 'main: yes' | grep 'active keymap:' | awk '{print $3, $4}')

  # Если раскладка изменилась
  if [[ "$current_layout" != "$prev_layout" ]]; then
    # Обновляем предыдущую раскладку
    prev_layout=$current_layout
    
    # Показываем сообщение через swayosd
    swayosd-client --custom-message="Layout: $current_layout" --custom-icon=preferences-desktop-keyboard
  fi

  # Пауза перед следующей проверкой
  sleep 0.5
done
