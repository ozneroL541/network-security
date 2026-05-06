.PHONY: all report presentation clean

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
