require 'spec_helper'

describe FavoritesController do

  let! (:favorite_attrs) {{:format => :json, :favorite => attributes_for(:favorite), :user_id => 9999}}

  let(:bad_favorite_attrs) {{:format => :json, :favorite => {:name => nil}, :user_id => 9999 }}

  subject   { response }

describe "POST 'create'" do
  before(:each) { post :create, {:user_id => favorite.user_id, :name => "rando"}, :format => :json}
end

context "existing favorite" do

  let!(:favorite) {create :favorite}
  let(:favorite_attrs) {{ :id => favorite.id, :format => :json, :favorite => {:name => "random favorite", :user_id => favorite.user_id}}}
  let(:bad_favorite_attrs) {{ :id => favorite.id, :favorite => { :name => nil}, :format => :json}}

  describe "GET 'show'" do
    before(:each) { get :show, :id => favorite.id, :format => :json }

    its(:body)    { should_not be_empty }
    its(:status)  { should be 200}

    context "unknown favorite" do
      before(:each) { get :show, :id => 9999, :format => :json }

      its("body.strip") { should be_empty }
      its(:status)      { should be 404 }
    end
  end

  describe "PUT 'update'" do
    before(:each) { put :update, favorite_attrs }

    context "with bad parameters" do
      before(:each) {put :update, bad_favorite_attrs}

      its(:body) { should_not be_empty }
      its(:status) { should be 422 }
    end
  end

  describe "DELETE 'destroy'" do
    before(:each) { delete :destroy, :id => favorite.id, :format => :json }

    its("body.strip") { should be_empty }
    its(:status)      { should be 204 }
  end
end
end
