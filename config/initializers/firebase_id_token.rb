FirebaseIdToken.configure do |config|
    config.redis = Redis.new
    config.project_ids = ['typescript-app-30ad7']
  end