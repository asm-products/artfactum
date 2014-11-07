require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  it do
    is_expected.to rescue_from(ActiveRecord::RecordNotFound).with(:not_found)
  end
end
