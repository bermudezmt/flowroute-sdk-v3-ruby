# This file was automatically generated by APIMATIC v2.0
# ( https://apimatic.io ).

module FlowrouteNumbersAndMessaging
  # NumbersController
  class NumbersController < BaseController
    @instance = NumbersController.new

    class << self
      attr_accessor :instance
    end

    def instance
      self.class.instance
    end

    # Returns a list of all phone numbers currently on your Flowroute account.
    # The response includes details such as the phone number's rate center,
    # state, number type, and whether CNAM Lookup is enabled for that number.
    # @param [Integer] starts_with Optional parameter: Retrieves phone numbers
    # that start with the specified value.
    # @param [Integer] ends_with Optional parameter: Retrieves phone numbers
    # that end with the specified value.
    # @param [Integer] contains Optional parameter: Retrieves phone numbers
    # containing the specified value.
    # @param [Integer] limit Optional parameter: Limits the number of items to
    # retrieve. A maximum of 200 items can be retrieved.
    # @param [Integer] offset Optional parameter: Offsets the list of phone
    # numbers by your specified value. For example, if you have 4 phone numbers
    # and you entered 1 as your offset value, then only 3 of your phone numbers
    # will be displayed in the response.
    # @return Mixed response from the API call
    def list_account_phone_numbers(starts_with = nil,
                                  ends_with = nil,
                                  contains = nil,
                                  limit = nil,
                                  offset = nil)
      # Prepare query url.
      _query_builder = Configuration.base_uri.dup
      _query_builder << '/v2/numbers'
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        {
          'starts_with' => starts_with,
          'ends_with' => ends_with,
          'contains' => contains,
          'limit' => limit,
          'offset' => offset
        },
        array_serialization: Configuration.array_serialization
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/vnd.api+json'
      }

      # Prepare and execute HttpRequest.
      _request = @http_client.get(
        _query_url,
        headers: _headers
      )
      BasicAuth.apply(_request)
      _context = execute_request(_request)
      puts _context.response.status_code

      # Validate response against endpoint and global error codes.
      if _context.response.status_code == 401
        raise ErrorException.new(
          'Unauthorized – There was an issue with your API credentials.',
          _context
        )
      elsif _context.response.status_code == 404
        raise ErrorException.new(
          'The specified resource was not found',
          _context
        )
      end
      validate_response(_context)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_context.response.raw_body) unless
        _context.response.raw_body.nil? ||
        _context.response.raw_body.to_s.strip.empty?
      decoded
    end

    # Lists all of the information associated with any of the phone numbers in
    # your account, including billing method, primary voice route, and failover
    # voice route.
    # @param [Integer] id Required parameter: Phone number to search for which
    # must be a number that you own. Must be in 11-digit E.164 format; e.g.
    # 12061231234.
    # @return Number26 response from the API call
    def list_phone_number_details(id)
      # Prepare query url.
      _query_builder = Configuration.base_uri.dup
      _query_builder << '/v2/numbers/{id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'id' => id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/vnd.api+json'
      }

      # Prepare and execute HttpRequest.
      _request = @http_client.get(
        _query_url,
        headers: _headers
      )
      BasicAuth.apply(_request)
      _context = execute_request(_request)
      puts _context.response.status_code

      # Validate response against endpoint and global error codes.
      if _context.response.status_code == 401
        raise APIException.new(
          'Unauthorized',
          _context
        )
      elsif _context.response.status_code == 404
        raise APIException.new(
          'Not Found',
          _context
        )
      end
      validate_response(_context)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_context.response.raw_body) unless
        _context.response.raw_body.nil? ||
        _context.response.raw_body.to_s.strip.empty?
      decoded
    end

    # Lets you purchase a phone number from available Flowroute inventory.
    # @param [Integer] id Required parameter: Phone number to purchase. Must be
    # in 11-digit E.164 format; e.g. 12061231234.
    # @return Number26 response from the API call
    def purchase_a_phone_number(id)
      # Prepare query url.
      _query_builder = Configuration.base_uri.dup
      _query_builder << '/v2/numbers/{id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        'id' => id
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/vnd.api+json'
      }

      # Prepare and execute HttpRequest.
      _request = @http_client.post(
        _query_url,
        headers: _headers
      )
      BasicAuth.apply(_request)
      _context = execute_request(_request)
      puts _context.response.status_code

      # Validate response against endpoint and global error codes.
      if _context.response.status_code == 401
        raise ErrorException.new(
          'Unauthorized – There was an issue with your API credentials.',
          _context
        )
      elsif _context.response.status_code == 404
        raise ErrorException.new(
          'The specified resource was not found',
          _context
        )
      end
      validate_response(_context)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_context.response.raw_body) unless
        _context.response.raw_body.nil? ||
        _context.response.raw_body.to_s.strip.empty?
      decoded
    end

    # This endpoint lets you search for phone numbers by state or rate center,
    # or by your specified search value.
    # @param [Integer] starts_with Optional parameter: Retrieve phone numbers
    # that start with the specified value.
    # @param [Integer] contains Optional parameter: Retrieve phone numbers
    # containing the specified value.
    # @param [Integer] ends_with Optional parameter: Retrieve phone numbers that
    # end with the specified value.
    # @param [Integer] limit Optional parameter: Limits the number of items to
    # retrieve. A maximum of 200 items can be retrieved.
    # @param [Integer] offset Optional parameter: Offsets the list of phone
    # numbers by your specified value. For example, if you have 4 phone numbers
    # and you entered 1 as your offset value, then only 3 of your phone numbers
    # will be displayed in the response.
    # @param [String] rate_center Optional parameter: Filters by and displays
    # phone numbers in the specified rate center.
    # @param [String] state Optional parameter: Filters by and displays phone
    # numbers in the specified state. Optional unless a ratecenter is
    # specified.
    # @return Mixed response from the API call
    def search_for_purchasable_phone_numbers(starts_with = nil,
                                             contains = nil,
                                             ends_with = nil,
                                             limit = nil,
                                             offset = nil,
                                             rate_center = nil,
                                             state = nil)
      # Prepare query url.
      _query_builder = Configuration.base_uri.dup
      _query_builder << '/v2/numbers/available'
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        {
          'starts_with' => starts_with,
          'contains' => contains,
          'ends_with' => ends_with,
          'limit' => limit,
          'offset' => offset,
          'rate_center' => rate_center,
          'state' => state
        },
        array_serialization: Configuration.array_serialization
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/vnd.api+json'
      }

      # Prepare and execute HttpRequest.
      _request = @http_client.get(
        _query_url,
        headers: _headers
      )
      BasicAuth.apply(_request)
      _context = execute_request(_request)
      puts _context.response.status_code

      # Validate response against endpoint and global error codes.
      if _context.response.status_code == 401
        raise ErrorException.new(
          'Unauthorized – There was an issue with your API credentials.',
          _context
        )
      elsif _context.response.status_code == 404
        raise ErrorException.new(
          'The specified resource was not found',
          _context
        )
      end
      validate_response(_context)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_context.response.raw_body) unless
        _context.response.raw_body.nil? ||
        _context.response.raw_body.to_s.strip.empty?
      decoded
    end

    # Returns a list of all Numbering Plan Area (NPA) codes containing
    # purchasable phone numbers.
    # @param [Integer] limit Optional parameter: Limits the number of items to
    # retrieve. A maximum of 400 items can be retrieved.
    # @param [Integer] offset Optional parameter: Offsets the list of phone
    # numbers by your specified value. For example, if you have 4 phone numbers
    # and you entered 1 as your offset value, then only 3 of your phone numbers
    # will be displayed in the response.
    # @param [Float] max_setup_cost Optional parameter: Restricts the results to
    # the specified maximum non-recurring setup cost.
    # @return mixed response from the API call
    def list_available_area_codes(limit = nil,
                                  offset = nil,
                                  max_setup_cost = nil)
      # Prepare query url.
      _query_builder = Configuration.base_uri.dup
      _query_builder << '/v2/numbers/available/areacodes'
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        {
          'limit' => limit,
          'offset' => offset,
          'max_setup_cost' => max_setup_cost
        },
        array_serialization: Configuration.array_serialization
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare and execute HttpRequest.
      _request = @http_client.get(
        _query_url
      )
      BasicAuth.apply(_request)
      _context = execute_request(_request)
      puts _context.response.status_code

      # Validate response against endpoint and global error codes.
      if _context.response.status_code == 401
        raise ErrorException.new(
          'Unauthorized – There was an issue with your API credentials.',
          _context
        )
      elsif _context.response.status_code == 404
        raise ErrorException.new(
          'The specified resource was not found',
          _context
        )
      end
      validate_response(_context)
      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_context.response.raw_body) unless
        _context.response.raw_body.nil? ||
        _context.response.raw_body.to_s.strip.empty?
      decoded
    end

    # Returns a list of all Central Office (exchange) codes containing
    # purchasable phone numbers.
    # @param [Integer] limit Optional parameter: Limits the number of items to
    # retrieve. A maximum of 200 items can be retrieved.
    # @param [Integer] offset Optional parameter: Offsets the list of phone
    # numbers by your specified value. For example, if you have 4 phone numbers
    # and you entered 1 as your offset value, then only 3 of your phone numbers
    # will be displayed in the response.
    # @param [Float] max_setup_cost Optional parameter: Restricts the results to
    # the specified maximum non-recurring setup cost.
    # @param [Integer] areacode Optional parameter: Restricts the results to the
    # specified area code.
    # @return mixed response from the API call
    def list_available_exchange_codes(limit = nil,
                                      offset = nil,
                                      max_setup_cost = nil,
                                      areacode = nil)
      # Prepare query url.
      _query_builder = Configuration.base_uri.dup
      _query_builder << '/v2/numbers/available/exchanges'
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        {
          'limit' => limit,
          'offset' => offset,
          'max_setup_cost' => max_setup_cost,
          'areacode' => areacode
        },
        array_serialization: Configuration.array_serialization
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare and execute HttpRequest.
      _request = @http_client.get(
        _query_url
      )
      BasicAuth.apply(_request)
      _context = execute_request(_request)
      puts _context.response.status_code

      # Validate response against endpoint and global error codes.
      if _context.response.status_code == 401
        raise ErrorException.new(
          'Unauthorized – There was an issue with your API credentials.',
          _context
        )
      elsif _context.response.status_code == 404
        raise ErrorException.new(
          'The specified resource was not found',
          _context
        )
      end
      validate_response(_context)
      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_context.response.raw_body) unless
        _context.response.raw_body.nil? ||
        _context.response.raw_body.to_s.strip.empty?
      decoded
    end
  end
end
