# == Schema Information
#
# Table name: currency_updates
#
#  id                   :integer          not null, primary key
#  rank                 :integer
#  price                :decimal(25, 8)
#  volume_24h           :decimal(25, 2)
#  market_cap           :decimal(25, 2)
#  percent_change_1h    :decimal(, )
#  percent_change_24h   :decimal(, )
#  percent_change_7d    :decimal(, )
#  currency_id          :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  total_supply         :decimal(25, 2)
#  available_supply     :decimal(25, 2)
#  reference_price      :decimal(25, 8)
#  reference_market_cap :decimal(25, 2)
#  reference_max_supply :decimal(25, 2)
#
# Indexes
#
#  index_currency_updates_on_currency_id  (currency_id)
#
# Foreign Keys
#
#  fk_rails_...  (currency_id => currencies.id)
#

class CurrencyUpdate < ApplicationRecord
  belongs_to :currency

  scope :old_entries, -> { CurrencyUpdate.where("created_at < ?", DateTime.current - 15.minutes) }
end
