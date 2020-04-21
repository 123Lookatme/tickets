# frozen_string_literal: true

# Tickets web controller
class TicketsController < ApplicationController
  def index
    @tickets = Ticket.with_full_info.page params[:page]
  end

  def show
    @ticket = Ticket.find(params[:id])
  end
end
