.PHONY: all report slides clean

all: report slides

report:
	$(MAKE) -C report

slides:
	$(MAKE) -C slides

clean:
	$(MAKE) -C report clean
	$(MAKE) -C slides clean
