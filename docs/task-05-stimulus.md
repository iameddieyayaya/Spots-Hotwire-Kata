# Task 5: Stimulus UI Interactions

## Goal

Use Stimulus for small UI behaviors that complement Turbo.

## What to implement

- Toggle the filters panel on the index page using a Stimulus controller.
- Reset the comment form after successful Turbo Stream submission.
- Add a loading state for the like button while the request is in-flight.

## Files to look at

- `app/javascript/controllers/toggle_controller.js`
- `app/javascript/controllers/reset_form_controller.js`
- `app/javascript/controllers/loading_state_controller.js`
- `app/views/spots/index.html.erb`
- `app/views/spots/show.html.erb`

## Tests to pass

- `spec/system/filters_spec.rb`

## Acceptance criteria

- Clicking "Filters" reveals the hidden panel.
- Comment form clears after Turbo Stream submit.
- Like button shows a loading state during requests.
