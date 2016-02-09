class App < Sinatra::Base
  get '/' do
    content_type 'html'
    erb :home
  end

  post '/subscribe' do
    email = params['email']
    if email
      subscribe_signup(email)
    end
    halt 200
  end

  def log(msg)
    @log ||= Logger.new(STDOUT)
    @log.error(msg)
  end

  def subscribe_signup(email)
    gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])
    arg =  {
      body: {
        email_address: email,
        status: 'subscribed'
      }
    }
    begin
      gibbon.lists(ENV['MAILCHIMP_LIST']).members.create(arg)
    rescue Gibbon::MailChimpError => e
      log "'#{email}' already signed up" if e.status_code == 400
    end
  end
end
