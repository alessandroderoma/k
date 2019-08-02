# k

`K` is a tool for shortening down `kubectl` commands.

 > STILL WIP!

Supported:

 - `k my-ns` => `kubectl -n my-ns get po`
 - `k my-ns svc` => `kubectl -n my-ns get svc` - applies to `po`, `svc`, `cm`, etc
 - `k my-ns logs my-resource` => `kubectl -n my-ns logs my-resource`
 - `k my-ns fwd my-resource port` => `kubectl -n my-ns port-forward my-resource port`
 
#### Compiling

 - Download and install [`nim`](https://nim-lang.org/), v0.20+. Don't forget to add it to `$PATH`.
 - `cd src/`
 - Launch `make` to build the `k` binary
 - Launch `make install` ti install the binary to `/usr/local/bin/`
 - Enjoy!
