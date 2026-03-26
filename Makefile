BOOK_SOURCES:= book/book.typ \
			   book/hwe.typ \
			   book/frequencies.typ

TARGETS:= book/book.pdf

all: $(TARGETS)

clean:
	rm -f $(TARGETS)

book/book.pdf: $(BOOK_SOURCES)
	typst compile --pdf-standard ua-1 book/book.typ

