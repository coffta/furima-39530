FactoryBot.define do
  factory :order_form do
    postal_code { '123-4567' }
    prefecture { 1 }
    city { '横浜市' }
    block { '青山1-1-1' }
    phone_number { '09012345678' }
    item_id { create(:item).id }
    user_id { create(:user).id }

    token {"tok_abcdefghijk00000000000000000"}

  end
end