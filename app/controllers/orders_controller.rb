class OrdersController < ApplicationController
  has_one :address   
  belongs_to :user    
  belongs_to :movie
end