class Api::CommonCodesController < ApplicationController
  respond_to :html, :json

  def index
  	@common_codes = CommonCode.all
  	respond_with(@common_codes)
  end
end
