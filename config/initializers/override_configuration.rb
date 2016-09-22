Rails.application.config.to_prepare do
  Dir.glob(File.join(Rails.root, 'app/**/*_decorator*.rb')) do |c|
    Rails.configuration.cache_classes ? require(c) : load(c)
  end
end