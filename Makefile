ALL = newsflash.inc news/newsflash.inc

all: $(ALL)

clean:
	rm -f $(ALL)

newsflash.inc: news/newsflash.inc
	head -6 $? >$@
news/newsflash.inc: news/newsflash.txt
	sed <$? >$@ \
	    -e 's@^@<tr><td class="d">@' \
	    -e 's@: @</td><td class="t">@' \
	    -e 's@$$@</td></tr>@'

