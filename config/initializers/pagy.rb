# Pagy is lightweight and fast, making it ideal for interview exercises without heavy dependencies.
require "pagy/backend"
require "pagy/frontend"

Pagy::DEFAULT = Pagy::DEFAULT.merge(items: 6)
