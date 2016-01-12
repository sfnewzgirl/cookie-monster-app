class Desert

  attr_reader :img_url, :id


  def initialize(args={})
    @id = args[:id]
    @img_url = args[:img_url]
  end

  @@all = [
      Desert.new({id: "1", img_url: "http://i.imgur.com/irvtyXG.gif"}),
      Desert.new({id: "2", img_url: "http://i.imgur.com/pB4MEQP.jpg"}),
      Desert.new({id: "3", img_url: "http://i.imgur.com/RbdlzzL.jpg"})
  ]

  def self.all
    @@all
  end

  def self.find(id)
    all.find {|c| c.id == id.to_s }
  end

end
