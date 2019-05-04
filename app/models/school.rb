class School < ApplicationRecord

    validates :name,
        presence: true

    has_many :students, dependent: :destroy
    accepts_nested_attributes_for :students,reject_if: :students_is_empty,allow_destroy: true

    # 入力データがから文字のとき、attributeに_destroyを設定
    # _destroyが設定されると、allow_destroy:trueにしているときにRailsがデータを削除してくれる
    # この仕組みを通して、データが入力されていないときにnestされたレコードを削除できる
    def students_is_empty(attributes)
        exists = attributes[:id].present?
        empty = attributes[:name].blank?
        attributes.merge!(_destroy: 1) if exists && empty
        !exists && empty
    end

end
