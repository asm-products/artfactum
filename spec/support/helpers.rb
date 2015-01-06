module Artfactum
  module Api
    module Helpers

      def json_response
        JSON.parse(response.body)
      end

      def api_post action, params={}, use_token=true
        set_auth_headers if use_token
        post action, set_params(params)
      end

      def api_put action, params={}, use_token=true
        set_auth_headers if use_token
        put action, set_params(params)
      end

      def api_get action, params={}, use_token=true
        set_auth_headers if use_token
        get action, set_params(params)
      end

      def api_delete action, params={}, use_token=true
        set_auth_headers if use_token
        delete action, set_params(params)
      end

      def set_params params
        scope = defined?(resource_scope) ? resource_scope : {}
        params.merge(scope).reverse_merge!(use_route: :api, format: :json)
      end

      def set_auth_headers
        if defined? user
          request.headers["X-Artfactum-Token"] = user.authentication_token
          request.headers["X-Artfactum-Email"] = user.email
        end
      end
    end
  end
end
