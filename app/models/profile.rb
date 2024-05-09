require 'yaml'
class Profile < ApplicationRecord
  belongs_to :user
  accepts_nested_attributes_for :user
  mount_uploader :avatar, AvatarUploader

  serialize :strengths, Array, coder: YAML
  serialize :weakness, Array, coder: YAML

  def translated_strengths
    strengths.map do |s_id|
      category = Category.find_by(id: s_id)
      category ? I18n.t("categories.#{category.name}", default: category.name) : nil
    end.compact
  end

  def translated_weaknesses
    weakness.map do |w_id|
      category = Category.find_by(id: w_id)
      category ? I18n.t("categories.#{category.name}", default: category.name) : nil
    end.compact 
  end

  private

  def translate_category_name(name)
    I18n.t("categories.#{name}", default: name)
  end
end
