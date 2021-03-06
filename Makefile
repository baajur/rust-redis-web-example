build:
	@cargo build

clean:
	@cargo clean

TESTS = ""
test:
	@RUN_ENV=Integrationtests cargo test $(TESTS) --offline --lib -- --color=always --test-threads=1 --nocapture

docs: build
	@cargo doc --no-deps

style-check:
	@rustup component add rustfmt 2> /dev/null
	cargo fmt --all -- --check

lint:
	@rustup component add clippy 2> /dev/null
	touch src/**
	cargo clippy --all-targets --all-features -- -D warnings

dev:
	@RUN_ENV=Development cargo run

local:
	@RUN_ENV=Local cargo run

.PHONY: build test docs style-check lint
