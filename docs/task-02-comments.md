# Task 2: Turbo Streams for Comments

## Goal

Make comment creation use Turbo Frames + Turbo Streams with inline errors rendered inside the comments frame.

## What to implement

- Wrap the comments list + form in `turbo-frame#comments` on `spots#show`.
- On success, append the new comment via Turbo Stream.
- On failure, re-render the form with validation errors inside the same Turbo Frame.
- Clear the form after successful submission.

## Files to look at

- `app/controllers/comments_controller.rb`
- `app/views/spots/show.html.erb`
- (create new) `app/views/comments/_comment.html.erb`
- (create new) `app/views/comments/create.turbo_stream.erb`

## Tests to pass

- `spec/system/comments_spec.rb`

## Acceptance criteria

- `turbo-frame#comments` exists and handles the form.
- New comments appear without a full-page reload.
- Validation errors render inline inside the frame.
