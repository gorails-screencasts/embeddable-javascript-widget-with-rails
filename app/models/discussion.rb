class Discussion < ApplicationRecord
  belongs_to :site
  has_many :comments, dependent: :destroy

  # http://example.com
  # https://example.com
  # http://example.com/asdf
  # https://example.com/asdf
  # http://example.com/asdf/
  # https://example.com/asdf/
  # http://example.com/asdf?foo=1
  # http://example.com/asdf/?foo=1
  # http://example.com/asdf#anchor
  # http://example.com/asdf/#anchor
  # http://example.com/asdf?foo=1#anchor
  # http://example.com/asdf/?foo=1#anchor
  # https://example.com/asdf/?foo=1#anchor
  def self.by_url(url)
    uri = URI.parse(url)
    where(url: uri.path).first_or_create
  end
end
