class Application

  @@items = []

  def call(env)
    req = Rack::Request.new(env)
    resp = Rack::Response.new

    if req.path.match{/items/}
      item_name = req.path.split("/items/").last
      item = @@items.find{|i| i.title == item_name}
      resp.write item.price

    elsif !@@items.include?(item)
      resp.write "Item not found"
      resp.status = 404


    end
  end

end
