module ChargesHelper
  def pretty_amount(amount_in_cents)
    number_with_precision(amount_in_cents/100.0, precision: 2)
  end
end
