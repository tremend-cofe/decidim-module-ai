# frozen_string_literal: true

module Decidim
  module Ai
    module Overrides
      module UpdateUserGroup
        def update_user_group
          with_events do
            super
          end
        end

        def event_arguments
          { resource: user_group }
        end
      end
    end
  end
end
