BIN := $(CURDIR)/.bin
CONFIG := $(CURDIR)/config
DATABASE := $(CURDIR)/database

$(BIN):
	mkdir -p $(BIN)

BOILER := $(BIN)/sqlboiler
$(BOILER): | $(BIN)
	go mod download; \
	go build -o $(BIN)/sqlboiler github.com/volatiletech/sqlboiler/v4;

BOILER_MYSQL := $(BIN)/sqlboiler-mysql
$(BOILER_MYSQL): | $(BIN)
	go mod download; \
	go build -o $(BIN)/sqlboiler-mysql github.com/volatiletech/sqlboiler/v4/drivers/sqlboiler-mysql;

.PHONY: gen/boiler
gen/boiler: $(BOILER) $(BOILER_MYSQL)
	cd $(BIN) && ./sqlboiler --no-tests --add-global-variants=false --wipe mysql -c $(CONFIG)/sqlboiler.toml -o $(DATABASE)/boiler

.PHONY: mod
mod:
	go mod download

.PHONY: test
test:
	go test ./...

.PHONY: run
run:
	go run cmd/orm/main.go

.PHONY: db/up
db/up:
	cd build; \
	docker-compose -p orm up -d --build

.PHONY: db/down
db/down:
	cd build; \
	docker-compose -p orm down

.PHONY: db/exec
db/exec:
	docker exec -it db /bin/bash

.PHONY: tools/install
tools/install: $(BOILER) $(BOILER_MYSQL)

.PHONY: tools/uninstall
tools/uninstall:
	rm -rf $(BIN)