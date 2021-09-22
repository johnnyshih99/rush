class PlayersController < ApplicationController
  def index
  end

  def get_data
    players = Player.datatable_filter(params['search']['value'])
    players_filtered = players.count
    if params['order']
      players = players.datatable_order(
        params['order']['0']['column'].to_i,
        params['order']['0']['dir']
      )
    end

    page_n = params['start'].to_i/params['length'].to_i + 1
    players = players.page(page_n).per(params['length'])
    
    render json: {
      data: players.as_json(include: :team),
      draw: params['draw'].to_i,
      recordsTotal: Player.count,
      recordsFiltered: players_filtered
    }
  end
end
