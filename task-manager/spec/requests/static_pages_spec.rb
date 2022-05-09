require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "root" do
    it "正常なレスポンスが返ってくること" do
      get root_path
      expect(response).to have_http_status :success
    end
  end
end
