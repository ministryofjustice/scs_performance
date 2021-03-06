class User < ActiveRecord::Base
  include EmailNormalization

  belongs_to :manager, class_name: :User
  has_many :employees, class_name: :User, foreign_key: :manager_id

  has_many :tokens
  has_many :reports, class: ManagementReport
  has_many :agreements
  has_many :employees_reports, through: :employees, source: :reports

  validates :email, presence: true, format: /\A.+@.+\z/, uniqueness: true

  def report_open?
    open_report.present?
  end

  def open_report
    reports.detect { |r| !r.end_year_approved? }
  end

  def email=(e)
    super normalize_email(e)
  end

  def to_s
    [name, email].reject(&:blank?).first
  end
end
