# Task 3: Turbo Streams for Likes

## Goal

Implement a Turbo Stream like/unlike interaction that updates both the button state and the like count without a full reload.

## What to implement

- Add Turbo Frames for the like button and like count (ids: `like_button` and `like_count`).
- Use Turbo Stream responses in `LikesController` for create/destroy.
- Enforce uniqueness: a user can like a spot only once.

## Files to look at

- `app/controllers/likes_controller.rb`
- `app/views/spots/show.html.erb`
- (create new) `app/views/likes/create.turbo_stream.erb`
- (create new) `app/views/likes/destroy.turbo_stream.erb`

## Tests to pass

- `spec/system/likes_spec.rb`

## Acceptance criteria

- Clicking Like updates the count and the button text inside turbo frames.
- Unlike reverses the state without a full page reload.
- Specs pass without changing expectations.
