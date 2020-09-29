module Api
  module V1
    class ClientsController < ActionController::Base
      def index
        render json: {
          policy_count: policies_count,
          carrier_count: carriers_count,
          client_count: clients.count,
          clients: presented_clients
        }
      end

      def clients
        Client.paginate(page: params[:page], per_page: 10)
      end

      def policies_count
        Policy.all.count
      end

      def carriers_count
        Carrier.all.count
      end

      def presented_clients
        ClientsPresenter.present_collection(clients)
      end
    end
  end
end
