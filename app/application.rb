class Application

  @@items = []

  def call(env)
    req = Rack::Request.new(env)
    resp = Rack::Response.new

    if req.path.match{/items/}
      item_name = req.path.split("/items/").last
      item = @@items.find{|i| i.title == item_name}
      resp.write item.price
    end
  end

end
