
module ActionDispatch
  module Session
    class RedisStore
      def get_cookie(request)
        cookie = cookie_jar(request)[key]
        puts "HERE HERE HERE HERE HERE HERE HERE HERE HERE HERE HERE HERE HERE HERE HERE HERE HERE "
        puts cookie
        cookie
      end

      def set_cookie(env, _session_id, cookie)
        puts "SETCOOKIE: SETCOOKIE: SETCOOKIE: SETCOOKIE:  #{_session_id}"
        request = wrap_in_request(env)
        cookie_jar(request)[key] = cookie.merge(cookie_options)
      end
    end
  end
end


Login::Application.config.session_store :redis_store,
  key: :user1_session,
  servers: [ 'redis://127.0.0.1:6379/4' ],
  expire_after: 90.minutes,
  threadsafe: true,
  secure: true
