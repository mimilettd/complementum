module Api
  module V1
    class ClientsController < ActionController::Base
      def index
        render json: {
          count: clients.count,
          clients: presented_clients
        }
      end

      def clients
        Client.includes(:addresses, [policies: [carrier: :addresses]])
      end

      def presented_clients
        ClientsPresenter.present_collection(clients)
      end
    end
  end
end
