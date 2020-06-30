CarrierWave.configure do |config|
  config.storage    = :aws
  config.aws_bucket = "alibulut-blog"
  config.aws_acl    = 'private'

  config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7

  config.aws_attributes = -> { {
      expires: 1.week.from_now.httpdate,
      cache_control: 'max-age=604800'
  } }

  config.aws_credentials = {
      access_key_id:     "AKIAICE5OWOWAXFGUNJQ",
      secret_access_key: "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",
      region:            "us-east-2",
      stub_responses:    Rails.env.test?
  }
end