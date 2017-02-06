module OmniAuth
  module Strategies
    class Ninthdecimal < OmniAuth::Strategies::OAuth2
      option :name, :ninthdecimal

      option :client_options, {:site => ENV["OAUTH_HOST"]}

      uid { raw_info['id'] }

      info do
        {
          id: raw_info['id'],
          first_name: raw_info['first_name'],
          last_name: raw_info['last_name'],
          email: raw_info['email']
        }
      end

      extra do
        { 'raw_info' => raw_info }
      end

      def raw_info
        # @raw_info ||= {
        #   'id' => '1234567890',
        #   'first_name' => 'Vladimir',
        #   'last_name' => 'Kurnavenkov',
        #   'email' => 'vkurnavenkov@ninthdecimal.com'
        # }
        @raw_info ||= access_token.get('api/users/me').parsed
      end

      # def callback_url
      #   full_host + script_name + callback_path
      # end
    end
  end
end

# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :ninthdecimal, ENV["OAUTH_KEY"], ENV["OAUTH_SECRET"]
# end
