class JwtService
    def self.encode_token(payload, exp = 10.hours.from_now)
        payload[:exp] = exp.to_i
        JWT.encode(payload, 'secret')
      end

      def self.decode_token
        # Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiMTIzIn0.AOXUao_6a_LbIcwkaZU574fPqvW6mPvHhwKC7Fatuws

        auth_header = request.headers['Authorization']
        return unless auth_header

        token = auth_header.split[1]

        begin
          JWT.decode(token, 'secret', true, algorithm: 'HS256')
        rescue JWT::DecodeError
          nil
        end
      end

end