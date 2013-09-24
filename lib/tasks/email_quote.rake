task email_quote: :environment do
  include ActionView::Helpers::TextHelper
  quote = Quote.all.sample

  Subscriber.all.each do |subscriber|
    Pony.mail(
      to: subscriber.email,
      from: 'quotes@kevinbongart.net',
      subject: "Quote from: #{quote.movie.title}",
      html_body: simple_format(quote.text),
      body: quote.text
    )
  end
end
