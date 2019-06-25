class Product < ApplicationRecord
    scope :available, -> { where(in_stock: true) }
    scope :cheap, -> { where(price: 0..1) }
    scope :cheaper_than, ->(price) { where("price < ?", price) }


    validates :name,
            presence: true,
            length: { in: 2..20 },
            uniqueness: true
        # tokenizer: lambda {|str| str.scan(/\w+/)}

    validates :price,
            presence: true

    validates :weight,
            numericality: true
    
    validates :in_stock,
            inclusion: { in: [true, false] }
end
