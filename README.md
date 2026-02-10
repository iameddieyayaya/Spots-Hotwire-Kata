# Spots Hotwire Kata

Spots is a lightweight Rails + Hotwire practice app designed for interview prep. It focuses on Turbo Frames/Streams, small Stimulus interactions, and idiomatic Rails patterns with a clean Tailwind UI.

Repo created by Codex; was prompted with `init.text` via terminal.

## Purpose

- Practice Hotwire-first CRUD flows with inline validation errors.
- Work with nested resources (comments) and interactive actions (likes).
- Build pagination + search + filters that update inside Turbo Frames.
- Reinforce Rails conventions with authorization baselines (Pundit).

## Setup

### Install dependencies

```sh
bundle install
bin/rails tailwindcss:build
```

### Prepare the database

```sh
bin/rails db:prepare
bin/rails db:seed
```

### Run the app

```sh
bin/rails server
```

Optional: keep Tailwind watching in another terminal:

```sh
bin/rails tailwindcss:watch
```

### Run the test suite

```sh
bundle exec rspec
```

## Tasks

The practice tasks are listed in `PRACTICE.md`, with a short doc for each task in `docs/`.

Recommended order:

1. `docs/task-01-spots-crud.md`
2. `docs/task-02-comments.md`
3. `docs/task-03-likes.md`
4. `docs/task-04-pagination-search.md`
5. `docs/task-05-stimulus.md`

Each task has failing specs in `spec/system/` that should pass once you complete the implementation.

## Default credentials

- `demo@example.com` / `password`
- `owner@example.com` / `password`

## Troubleshooting

- Tailwind styles not showing: run `bin/rails tailwindcss:build` or `bin/rails tailwindcss:watch`.
- System specs failing with Selenium: ensure Chrome is installed and rerun `bundle exec rspec spec/system`.
- Database state weird: reset with `bin/rails db:reset` then `bin/rails db:seed`.
# Spots-Hotwire-Kata
