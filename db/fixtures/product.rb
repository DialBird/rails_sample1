Product.seed(:id, { id: 1, stripe_id: 'main_service', name: 'Main Service', type: 'service' })
Plan.seed(:id,
          { id: 1, product_id: 1, stripe_id: 'plan_a', amount: 3000, currency: 'jpy', interval: 'month', interval_count: 1, nickname: 'Plan A', usage_type: 'licensed'},
          { id: 2, product_id: 1, stripe_id: 'plan_b', amount: 5000, currency: 'jpy', interval: 'month', interval_count: 1, nickname: 'Plan B', usage_type: 'licensed'},
          { id: 3, product_id: 1, stripe_id: 'plan_c', amount: 10000, currency: 'jpy', interval: 'month', interval_count: 1, nickname: 'Plan C', usage_type: 'licensed'})
