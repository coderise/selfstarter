if Settings.stripe_payments_mode == 'test'
  Stripe.api_key = ENV['STRIPE_LIVE_SECRET_KEY']
elsif Settings.stripe_payments_mode == 'live'
  Stripe.api_key = ENV['STRIPE_TEST_SECRET_KEY']
else
  raise "Stripe payments mode (live v. test) is not set in settings.yml."
end
