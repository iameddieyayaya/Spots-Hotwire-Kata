# Task 1: Turbo CRUD for Spots

## Goal

Make Spots CRUD Hotwire-first using Turbo Frames + Turbo Streams. Validation errors should render inline inside the Turbo Frame that contains the form.

## What to implement

- Wrap the Spots form in a Turbo Frame with id `spot_form` for both `new` and `edit`.
- Render validation errors inside the same Turbo Frame (no full-page reload).
- Use Turbo Streams for create/update to keep the user in-place (no redirect flashes).
- Keep authorization intact (owner-only edit/delete).

## Files to look at

- `app/controllers/spots_controller.rb`
- `app/views/spots/_form.html.erb`
- `app/views/spots/new.html.erb`
- `app/views/spots/edit.html.erb`
- `app/views/spots/index.html.erb`

## Tests to pass

- `spec/system/spot_crud_spec.rb`

## Acceptance criteria

- Submitting an invalid form shows inline errors inside `turbo-frame#spot_form`.
- Creating/updating a spot uses Turbo Streams (no full page reload).
- Specs pass without changing expectations.
