# frozen_string_literal: true

module Decidim
  module Ai
    module Overrides
      module CreateUserGroup
        def call
          return broadcast(:invalid) if form.invalid?

          with_events(with_transaction: true) do
            create_user_group
            create_membership
          end
          notify_admins

          broadcast(:ok, @user_group)
        end

        def event_arguments
          { resource: @user_group }
        end
      end
    end
  end
end
