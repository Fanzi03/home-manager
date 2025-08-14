{
	programs.waybar = { 
		enable = true;
		settings.main = {
			modules-right = ["clock"  "custom/lang" ];
			layer = "top";
			position = "top";


			"custom/lang" = {
				exec = "hyprctl devices | awk '/semico-usb-keyboard$/{flag=1; next} flag && /active keymap:/{if(/English/) print \"EN\"; else if(/Russian/) print \"RU\"; flag=0}'";
				interval = 1;
				format = "🌐 {}";
				tooltip = false;
				on-click = "hyprctl switchxkblayout semico-usb-keyboard next";
			};
		};
	};
}
