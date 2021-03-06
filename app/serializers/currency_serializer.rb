class CurrencySerializer < ActiveModel::Serializer
  attributes(
    :id,
    :rank,
    :symbol,
    :name,
    :price,
    :volume_24h,
    :market_cap,
    :percent_change_1h,
    :percent_change_24h,
    :percent_change_7d,
    :total_supply,
    :available_supply,
    :max_supply,
    :max_price,
    :liquidity,
    :inflationary,
    :growth_potential
  )

  def liquidity
    object.liquidity[:description] || ''
  end

  def inflationary
    object.inflationary?
  end
end
