.DEFAULT_GOAL := help
LOCAL_BIN=$(CURDIR)/bin

include bin-deps.mk

.PHONY: generateprotocode
run: ## generate proto code project
	$ protoc \
        -I auth-api/proto \
        --go_out=auth-api/gen/go --go_opt=paths=source_relative \
        --go-grpc_out=auth-api/gen/go --go-grpc_opt=paths=source_relative \
        --go-grpc_opt=require_unimplemented_servers=false \
        auth-api/proto/auth/package.proto \
        auth-api/proto/auth/rpc/register.proto \
        auth-api/proto/auth/rpc/login.proto \
        auth-api/proto/auth/common/errors.proto




