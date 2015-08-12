##
## Build procedure for www.openssl.org

##  Snapshot directory
SNAP = /var/cache/openssl/checkouts/openssl

# All simple generated files.
SIMPLE = newsflash.inc news/newsflash.inc \
	 news/changelog.txt news/changelog.inc

all: simple

simple: $(SIMPLE)

clean:
	rm -f $(SIMPLE)


newsflash.inc: news/newsflash.inc
	head -6 $? >$@
news/newsflash.inc: news/newsflash.txt
	sed <$? >$@ \
	    -e 's@^@<tr><td class="d">@' \
	    -e 's@: @</td><td class="t">@' \
	    -e 's@$$@</td></tr>@'

news/changelog.inc: news/changelog.txt bin/mk-changelog
	./bin/mk-changelog <news/changelog.txt >$@
news/changelog.txt: $(SNAP)/CHANGES
	cp $? $@
