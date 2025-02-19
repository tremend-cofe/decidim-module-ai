# frozen_string_literal: true

module Decidim
  module Ai
    module Overrides
      module UpdateAccount
        def call
          return broadcast(:invalid, @form.password) unless @form.valid?

          update_personal_data
          update_avatar
          update_password

          if current_user.valid?
            with_events do
              changes = current_user.changed
              current_user.save!
              send_update_summary!(changes)
            end
            notify_followers
            broadcast(:ok, current_user.unconfirmed_email.present?)
          else
            [:avatar, :password].each do |key|
              @form.errors.add key, current_user.errors[key] if current_user.errors.has_key? key
            end
            broadcast(:invalid, @form.password)
          end
        end

        def event_arguments
          { resource: current_user }
        end
      end
    end
  end
end
