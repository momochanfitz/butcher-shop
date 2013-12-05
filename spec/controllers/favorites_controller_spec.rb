require 'spec_helper'

describe FavoritesController do

  let! (:favorite_attrs) {{:format => :json, :favorite => attributes_for(:favorite), :user_id => 9999}}

  let(:bad_favorite_attrs) {{:format => :json, :favorite => {:name => nil}, :user_id => 9999 }}

  subject   { response }

  describe "GET 'index'" do
  before(:each) { get :index, :format => :json, :user_id => 1}

  its(:body) { should_not be_empty}
  its(:status) { should be 200}
  end

  describe "POST 'create'" do
    before(:each) { post :create, favorite_attrs }

    its(:body)    { should_not be_empty }
    its(:status)  { should be 201 }

    context "with bad params" do
      before(:each) {post :create, bad_favorite_attrs}

      its(:body) { should_not be_empty}
      its(:status) {should be 422}
    end
  end

context "existing favorite" do
  let!(:favorite) {create :favorite}
  let(:favorite_attrs) {{ :id => favorite.id, :format => :json, :favorite => {:name => "random favorite", :user_id => favorite.user_id}}}

  describe "GET 'show'" do
    before(:each) { get :show, :id => favorite.id, :format => :json }

    its(:body)    { should_not be_empty }
    its(:status)  { should be 200}

    context "with an unknown favorite" do
      before(:each) { get :show, :id => 9999, :format => :json }

      its("body.strip") { should be_empty }
      its(:status)      { should be 404 }
    end
  end

  describe "PUT 'update'" do
    before(:each) { put :update, favorite_attrs }

    its("body.strip") { should be_empty }
    its(:status)      { should be 204 }

    it "updates the favorite" do
      Favorite.find(favorite.id).name.should eq(favorite_attrs[:favorite][:name])
      Favorite.find(favorite.id).user_id.should eq(favorite_attrs[:favorite][:user_id])
    end

    context "with bad params" do
      before(:each) {put :update, {:id => favorite.id, :favorite => {:name => nil, :user_id => nil}, :format => :json}}

      its(:body) {should_not be_empty}
      its(:status) {should be 422}
    end
  end

  describe "DELETE 'destroy'" do
    before(:each) { delete :destroy, :id => favorite.id, :format => :json }

    its("body.strip") { should be_empty }
    its(:status)      { should be 204 }
  end
end
end
