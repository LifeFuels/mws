class Mws::Apis::Orders

  def initialize(connection, overrides={})
    @connection = connection
    @param_defaults = {
      market: 'ATVPDKIKX0DER'
    }.merge overrides
    @option_defaults = {
      version: '2013-09-01',
      list_pattern: '%{key}.%{ext}.%<index>d'
    }
  end

  def list(params={})
    params[:markets] ||= [ params.delete(:markets) || params.delete(:market) || @param_defaults[:market] ].flatten.compact
    options = @option_defaults.merge action: 'ListOrders'
    @connection.get "/Orders/#{options[:version]}", params, options
  end

  def list_by_next_token(params={})
    params[:markets] ||= [ params.delete(:markets) || params.delete(:market) || @param_defaults[:market] ].flatten.compact
    options = @option_defaults.merge action: 'ListOrdersByNextToken'
    @connection.get "/Orders/#{options[:version]}", params, options
  end

  def order_items(params={})
    params[:markets] ||= [ params.delete(:markets) || params.delete(:market) || @param_defaults[:market] ].flatten.compact
    options = @option_defaults.merge action: 'ListOrderItems'
    @connection.get "/Orders/#{options[:version]}", params, options
  end
end