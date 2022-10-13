# CHANGELOG

## 1.1.1

* Use `Time.zone.now` if possible.

## 1.1.0

* Add `formats` option to `respond_for`.
* Add `status` and `failure_status` option to `respond_for`.
* Support `any` and `turbo_stream` format.
* Make `RespondForHelper.config` more configurable.
`formats` option is renamed with `formatters` and introduce new `formats` option.
`default_behaviours` is renamed with `behaviours` and all of its configuration values are changed.
* The block of `respond_for` now takes format option like `respond_to`.
If you want to call some process after respond, use `after_success` callback instead.

## 1.0.2

* Change redirect status to 303 (see other).

## 1.0.1

* Fix render status.

## 1.0.0

* First release.
