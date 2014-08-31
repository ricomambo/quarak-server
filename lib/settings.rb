class Settings
  SETTINGS_FILE_DIR = File.join(Rails.root, 'config', 'settings').freeze

  @settings = {}

  class << self

    def load!
      @settings = env_settings
      @settings.deep_merge!(yml_settings)
      @settings.freeze
    end

    def [](key)
      @settings[key]
    end

    def env_settings
      TenderHash.map(ENV) do
        scope :cors do
          map_key 'CORS_ALLOWED_ORIGINS', :allowed_origins, default: ''
        end
      end
    end

    def yml_settings
      YAML.load_file(yml_settings_path).deep_symbolize_keys!
    rescue Errno::ENOENT
      puts "Could not load settings from settings.yml file for #{Rails.env} environment"
      {}
    end

    def yml_settings_path
      File.join(SETTINGS_FILE_DIR, "#{Rails.env}.yml")
    end

  end

end

