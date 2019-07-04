Stripe.api_key = Rails.application.credentials.stripe[:secret]

if Rails.env.production?
  # Product
  begin
    Stripe::Product.retrieve('main_service')
  rescue
    product = Product.find_by(stripe_id: 'main_service')
    Stripe::Product.create(
      id: product.stripe_id,
      name: product.name,
      type: product.type
    )
  end

  # Plan
  Plan.all.each do |plan|
    begin
      Stripe::Plan.retrieve(plan.stripe_id)
    rescue
      Stripe::Plan.create(
        id: plan.stripe_id,
        nickname: plan.nickname,
        amount: plan.amount,
        currency: plan.currency,
        interval: plan.interval,
        interval_count: plan.interval_count,
        usage_type: plan.usage_type,
        product: plan.product.stripe_id
      )
    end
  end
end
