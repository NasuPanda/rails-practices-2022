module UserPresenter
  def masked_email
    email.sub(/\A(?<init>.).+(?<tld>\.[^.]+)\z/, '\k<init>****@****\k<tld>')
  end
end
