
CP := cp -a
MKDIR := mkdir -p

FILES := ~/.emacs ~/.emacs.d

all: install

install: $(FILES)

~/.emacs.d:
	$(MKDIR) ~/.emacs.d
	$(CP) emacs.d/banner.png ~/.emacs.d
~/.emacs:
	$(CP) emacs ~/.emacs
