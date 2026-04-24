# aroberts/homebrew-tap

A personal Homebrew tap.

## Usage

```sh
brew tap aroberts/tap https://github.com/aroberts/homebrew-tap
```

Then install any of the formulae below.

## Formulae

### keymaster

TouchID-protected keychain access for scripts. macOS only. Upstream: [aroberts/keymaster](https://github.com/aroberts/keymaster).

```sh
brew install aroberts/tap/keymaster
```

Also supports `--HEAD` to build from the latest `master`.

### grafana-cli

Agent-first CLI to control Grafana and Grafana Cloud. Upstream: [matiasvillaverde/grafana-cli](https://github.com/matiasvillaverde/grafana-cli).

```sh
brew install aroberts/tap/grafana-cli
```

Installs a binary called `grafana`. Note that Homebrew Core also ships a `grafana` formula (the server); the two cannot be linked simultaneously.

The formula is a verbatim mirror of the `grafana-cli.rb` that upstream publishes as a release asset. It is kept in sync by [`.github/workflows/update-grafana-cli.yml`](.github/workflows/update-grafana-cli.yml), which runs daily at 08:00 UTC, compares the committed version to upstream's latest release, and commits the new formula when they differ. The workflow can also be triggered manually:

```sh
gh workflow run update-grafana-cli.yml
```
