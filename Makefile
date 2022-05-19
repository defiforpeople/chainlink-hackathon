install:
	@echo "[install] Installing yarn..."
	@npm install -g yarn
	@yarn config set workspaces-experimental true
	@echo "[blockchain]"
	@yarn
	@cd packages/blockchain && npm install --save-dev ts-node
	@echo "[frontend]"
	@cd packages/frontend && make install

frontend:
	@echo "[frontend]"
	@cd packages/frontend && $(MAKE) dev

blockchain:
	@echo "[blockchain:start]"
	@cd packages/blockchain && $(MAKE) compile
	@cd packages/blockchain && $(MAKE) node

blockchain\:stop:
	@echo "[blockchain:stop]"
	@cd packages/blockchain && $(MAKE) stop

.PHONY: install frontend