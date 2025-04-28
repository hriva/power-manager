PREFIX := /usr/local
USER_PREFIX := ~/.local/lib

.PHONY: install clean uninstall all user-install user-uninstall

all: install

install:
	/usr/bin/cp -f ./libexec/power-profiler $(PREFIX)/libexec/power-profiler
	/usr/bin/cp -f ./systemd/power-profiler.service /etc/systemd/system/power-profiler.service
	/usr/bin/systemctl daemon-reload  && /usr/bin/systemctl enable --now power-profiler.service

clean:
	/usr/bin/systemctl disable --now power-profiler.service && /usr/bin/systemctl daemon-reload
	/usr/bin/rm -f /etc/systemd/system/power-profiler.service
	/usr/bin/rm -f $(PREFIX)/libexec/power-profiler

uninstall: clean

user-install:
	/usr/bin/cp -f ./libexec/power-profiler $(USER_PREFIX)/power-profiler
	/usr/bin/cp -f ./systemd/user-power-profiler.service ~/.config/systemd/user/power-profiler.service
	/usr/bin/systemctl --user daemon-reload  && /usr/bin/systemctl --user enable --now power-profiler.service

user-uninstall:
	/usr/bin/systemctl --user disable --now power-profiler.service && /usr/bin/systemctl --user daemon-reload
	/usr/bin/rm -f ~/.config/systemd/user/power-profiler.service
	/usr/bin/rm -f $(USER_PREFIX)/power-profiler
