class Rating < ApplicationRecord
  belongs_to :advertise, optional: true
  belongs_to :combo, optional: true
  belongs_to :establishment
  belongs_to :event, optional: true
  belongs_to :product, optional: true

  validates :avaliation, numericality: {
    less_than_or_equal_to: 10, greater_than_or_equal_to: 0
  }

  def self.rating_model_chooser(rating)
    if rating.advertise_id
      Advertise.find(rating.advertise_id)
    elsif rating.combo_id
      Combo.find(rating.combo_id)
    elsif rating.event_id
      Event.find(rating.event_id)
    elsif rating.product_id
      Product.find(rating.product_id)
    else
      Establishment.find(rating.establishment_id)
    end
  end

  def self.rating_average(model, rating)
    new_rating = model.rating * model.rating_count
    model.rating_count += 1
    new_rating += rating.avaliation
    new_rating /= model.rating_count
    model.rating = new_rating
    model.save!
  end

  def self.delete_previous_rating(model, old_rating)
    aggregated = model.rating * model.rating_count
    aggregated -= old_rating
    model.rating_count -= 1
    aggregated /= model.rating_count unless model.rating_count.zero?
    model.rating = aggregated
    model.save!
  end

  def self.setting_owner(model)
    owner = (model.advertise || model.combo || model.event || model.product || model.establishment)
    model.owner = owner.class.to_s
    model.owner_id = owner.id
  end
end
