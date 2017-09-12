Rails.configuration.stripe = {
  :publishable_key => "pk_test_xERRz74AG88MR3u4ZAqQyABB",
  :secret_key      => "sk_test_HyRs8EInki172vqAWYI7pIFj"
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
# Rails.configuration.stripe = {
#   :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
#   :secret_key      => ENV['STRIPE_SECRET_KEY']
# }
