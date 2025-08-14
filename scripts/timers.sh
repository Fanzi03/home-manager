#!/usr/bin/env bash
# timers: sleep + notify (very small, commented)
sleep "${1:-25m}"                    # ждать аргумент или 1s
notify-send "Таймер" "Готово — relax 5 min"  # показать уведомление через mako

