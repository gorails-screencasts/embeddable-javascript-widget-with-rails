class Site < ApplicationRecord
  belongs_to :user
  has_many :discussions, dependent: :destroy

  def self.by_url(url)
    uri = URI.parse(url)
    domain = uri.host
    domain += ":#{uri.port}" unless [80, 443].include?(uri.port)

    find_by(domain: domain)
  end
end
