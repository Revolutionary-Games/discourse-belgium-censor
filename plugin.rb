# frozen_string_literal: true

# name: discourse-belgium-censor
# about: Replace bad words with "belgium"
# version: 1.0.0
# authors: Revolutionary Games Studio
# url: https://github.com/Revolutionary-Games/discourse-belgium-censor
# required_version: 2.7.0

enabled_site_setting :plugin_belgium_censor_enabled

module ::BelgiumCensorPluginModule
  PLUGIN_NAME = "discourse-belgium-censor"
end

require_relative "lib/belgium_censor/engine"

after_initialize do
  # Code which should run after Rails has finished booting

  require_relative 'lib/belgium_censor/censor'

  censor = BelgiumCensorPluginModule::Censor.new

  Plugin::Filter.register(:after_post_cook) do |_, cooked|
    unless SiteSetting.plugin_belgium_censor_enabled
      return cooked
    end

    censor.filter cooked
  end
end
