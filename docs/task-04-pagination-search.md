# Task 4: Turbo Pagination + Search/Filters

## Goal

Paginate spots with Pagy and make pagination + filtering work inside a Turbo Frame, so only the list updates.

## What to implement

- Add search/filter logic in `SpotsController#index` for:
  - `query` (name/city)
  - `status`
  - `state`
- Wrap the list + pagination in `turbo-frame#spots_list`.
- Ensure pagination links keep query params and update the Turbo Frame.

## Files to look at

- `app/controllers/spots_controller.rb`
- `app/views/spots/index.html.erb`
- `config/initializers/pagy.rb`

## Tests to pass

- `spec/system/pagination_spec.rb`

## Acceptance criteria

- Search/filter params reduce the dataset correctly.
- Pagination updates only the list frame.
- Specs pass without changing expectations.
