# Gimbap - 김밥
A small build build system and to complement my laziness.

It’s small, cheap, delicious and never disappoints!

## Installation

**1.** Download the pre-built binary (linux only) or Clone Gimbap and build it from source.

**2.** Place Gimbap in /usr/bin (or /usr/local/bin - depending on your distro) or add it to your path.

## Usage

**1.** Create a Gimbap config file named `gimbap.toml`

**2.** Gimbap config file requires the following fields to successfully build project:
```toml
[config]
language = ""
mainfile = ""
flag = ""
```

### **The following flags are:**

**language** - The programming language used in the project. Meaning the binary name of the language or compiler used to build your project e.g. `gcc`, `rust`, `cargo` or `g++` etc.

**mainfile** - The entry point of your program.

**flag** - Compiler flags

Here is an example config file:

```toml
[config]
language = "nelua"
mainfile = "src/main.nelua"
flag = "--cflags=\"-L.\""
```

**3.** Run the Gimbap build command `gimbap --b`

**4.** Enjoy!

## Development

Go ham! Or don't. This project should never be taken seriously.

## Contributing

1. Fork it (<https://github.com/your-github-user/gimbap/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Kenta](https://github.com/Its-Kenta) - creator and maintainer
