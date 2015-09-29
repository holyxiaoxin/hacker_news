require "rails_helper"

RSpec.describe LinksController do
  describe "#create" do
    let(:params) { title: "Google", url: "https://google.com" }

    def do_request
      post :create, link: params
    end

    before do
      do_request
    end
    
    it "creates a link" do
      link = Link.last
      expect(link.title).to eq params[:title]
      expect(link.url).to eq params[:url]
    end

    it { expect(response).to redirect_to Link.last }
  end

end
