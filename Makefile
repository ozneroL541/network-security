.PHONY: all_clean all report presentation clean

.DEFAULT_GOAL := all_clean

all: report presentation

report:
	$(MAKE) -C report

presentation:
	$(MAKE) -C presentation

clean:
	$(MAKE) -C report clean
	$(MAKE) -C presentation clean

delete:
	$(MAKE) -C report delete
	$(MAKE) -C presentation delete

all_clean:
	$(MAKE) -C report all_clean
	$(MAKE) -C presentation all_clean
