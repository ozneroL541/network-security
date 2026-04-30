USER := ${shell whoami}
PWD := $(shell pwd)
SERVICE_FILE := docker-vulnet.service

.PHONY: clean release install

clean:
	@echo "Cleaning up Docker Vulnet Service..."
	@rm -f $(SERVICE_FILE)
	@echo "Cleanup completed."

release:
	@echo '[Unit]'  															>  $(SERVICE_FILE)
	@echo 'Description=Docker Vulnet Service'									>> $(SERVICE_FILE)
	@echo 'After=network.target docker.service docker.socket multi-user.target' >> $(SERVICE_FILE)
	@echo 'Requires=docker.service'												>> $(SERVICE_FILE)
	@echo 'StartLimitIntervalSec=0'												>> $(SERVICE_FILE)
	@echo '' 																	>> $(SERVICE_FILE)
	@echo '[Service]'															>> $(SERVICE_FILE)
	@echo 'Type=simple'															>> $(SERVICE_FILE)
	@echo 'Restart=on-failure'													>> $(SERVICE_FILE)
	@echo 'RestartSec=5'														>> $(SERVICE_FILE)
	@echo 'RemainAfterExit=yes'													>> $(SERVICE_FILE)
	@echo 'User=root'															>> $(SERVICE_FILE)
	@echo 'WorkingDirectory=$(PWD)'												>> $(SERVICE_FILE)
	@echo 'ExecStart=/bin/bash -v $(PWD)/hardcore-setup.sh'						>> $(SERVICE_FILE)
	@echo ''																	>> $(SERVICE_FILE)
	@echo '[Install]'															>> $(SERVICE_FILE)
	@echo 'WantedBy=multi-user.target'											>> $(SERVICE_FILE)

install:
	@echo "Installing Docker Vulnet Service..."
	@make release
	@cp $(SERVICE_FILE) /etc/systemd/system/
	@systemctl daemon-reload
	@systemctl enable $(SERVICE_FILE)
	@systemctl restart $(SERVICE_FILE)
	@echo "Docker Vulnet Service installed and started successfully."
