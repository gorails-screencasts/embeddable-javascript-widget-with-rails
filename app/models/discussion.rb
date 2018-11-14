class Discussion < ApplicationRecord
  has_many :comments

  # http://example.com
  # http://example.com/asdf
  # http://example.com/asdf/
  # http://example.com/asdf?foo=1
  # http://example.com/asdf/?foo=1
  # http://example.com/asdf#anchor
  # http://example.com/asdf/#anchor
  # http://example.com/asdf?foo=1#anchor
  # http://example.com/asdf/?foo=1#anchor
  def self.by_url(url)
    uri = url.split("?").first
    uri = uri.split("#").first
    uri.sub!(/\/$/, '')

    where(url: uri).first_or_create
  end
end
