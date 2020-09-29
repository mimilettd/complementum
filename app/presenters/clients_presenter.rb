class ClientsPresenter
  def self.present_collection(clients)
    new(clients).present_collection
  end

  def initialize(clients)
    @clients = clients
  end

  def present_collection
    clients.map do |client|
      ClientPresenter.present(client)
    end
  end

  private

  attr_reader :clients
end
