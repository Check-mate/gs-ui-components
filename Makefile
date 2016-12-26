MAKE = @make --no-print-directory

all:
	@echo "~~~~~~~~~ gs-ui-components ~~~~~~~~~~"
	$(MAKE) css
	$(MAKE) html
	@echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

html:
	@echo -n "* HTML ............... "
	@handlebars `find src -name "*.handlebars"` -f bin/__templates.js
	@echo __templates.js
	$(MAKE) js

js:
	@echo -n "* JS ........ "
	@uglifyjs $(JS_FILES) -o bin/gs-ui-components.min.js --compress --mangle
	@echo gs-ui-components.min.js

css:
	@echo -n "* CSS ...... "
	@sass -I src src/main.scss bin/gs-ui-components.min.css --style compressed
	@echo gs-ui-components.min.css


.PHONY: all html css js

JS_FILES = \
	bin/__templates.js                       \
	src/span-editable/gs-ui-span-editable.js \
	src/toggle/gs-ui-toggle.js               \
	src/waveform/gs-ui-waveform.js
