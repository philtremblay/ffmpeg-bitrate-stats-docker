# Usage

## Build
Requires `make` and `Docker` (or other OCI compliant image builder)
```sh
make build
```

## Run 
The run target assumes that a `file.mp4` exists in the current working directory.
```sh 
make run
```
To override
```sh
make run FILE="filename.mp4"
```
