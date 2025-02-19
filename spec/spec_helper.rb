# frozen_string_literal: true

require "decidim/dev"

ENV["ENGINE_ROOT"] = File.dirname(__dir__)
ENV["DECIDIM_SPAM_DETECTION_BACKEND_USER"] ||= "memory"
ENV["DECIDIM_SPAM_DETECTION_BACKEND_RESOURCE"] ||= "memory"

Decidim::Dev.dummy_app_path = File.expand_path(File.join("spec", "decidim_dummy_app"))

require "decidim/dev/test/base_spec_helper"
require_relative "shared/events_examples"

require "decidim/debates/test/factories"
require "decidim/meetings/test/factories"
require "decidim/proposals/test/factories"
