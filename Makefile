PREFIX := /usr/local
.PHONY: install clean uninstall all

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
