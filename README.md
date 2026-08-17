# homebrew-lbzip2

Homebrew tap for [caius72/lbzip2](https://github.com/caius72/lbzip2), a
maintained fork of [kjn/lbzip2](https://github.com/kjn/lbzip2) — a parallel,
SMP-based, bzip2-compatible compression utility.

## How do I install these formulae?

```sh
brew trust --formula caius72/lbzip2/lbzip2
brew install caius72/lbzip2/lbzip2
```

Homebrew will not load formulae from third-party taps until they are trusted.
Installing by the fully qualified name trusts this one implicitly; tapping
first and installing by short name does not, so run `brew trust` for that
route:

```sh
brew trust caius72/lbzip2
brew tap caius72/lbzip2
brew install lbzip2
```

Homebrew core also ships an `lbzip2` formula (upstream 2.5).  The two cannot be
installed at the same time; `brew uninstall lbzip2` first if you already have
core's.

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "caius72/lbzip2"
brew "lbzip2"
```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
