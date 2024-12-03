all:
	util/test.sh

clean:
	util/clean.sh

report: all
	cat */valgrind_report.txt

.PHONY: all clean report
