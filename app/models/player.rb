class Player < ApplicationRecord
  belongs_to :team
  validates :name, presence: true

  DATATABLE_COLUMNS = %w[name team_id pos att att_g yds avg yds_g td lng first first_p twenty_plus forty_plus fum].freeze
  class << self
    def datatable_filter(search_value)
      return all if search_value.blank?

      result = none
      filter = where("name LIKE ?", "%#{search_value}%")
      result = result.or(filter)
      result
    end

    def datatable_order(order_column_index, order_dir)
      #sanitize input
      order(Arel.sql("CAST(#{DATATABLE_COLUMNS[order_column_index]} AS INTEGER) #{order_dir}"))
    end
  end
end
