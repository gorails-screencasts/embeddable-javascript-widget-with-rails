class Discussion < ApplicationRecord
  has_many :comments

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
    # Remove query parameters
    uri = url.split("?").first

    # Remove anchor
    uri = uri.split("#").first

    # Remove trailing slash
    uri.sub!(/\/$/, '')

    # Strip the protocol (ie. http://, https://, ftp://, etc)
    uri.sub!(/\A.*:\/\//, '')

    where(url: uri).first_or_create
  end
end
