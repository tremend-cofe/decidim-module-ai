# frozen_string_literal: true

require "decidim/ai/engine"

module Decidim
  module Ai
    autoload :StrategyRegistry, "decidim/ai/strategy_registry"
    autoload :SpamDetection, "decidim/ai/spam_detection/spam_detection"
    autoload :Language, "decidim/ai/language/language"

    module Overrides
      autoload :UpdateAccount, "decidim/ai/overrides/update_account"
      autoload :UpdateUserGroup, "decidim/ai/overrides/update_user_group"
      autoload :CreateUserGroup, "decidim/ai/overrides/create_user_group"
    end

    include ActiveSupport::Configurable
  end
end
