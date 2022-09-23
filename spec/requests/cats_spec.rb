require 'rails_helper'


RSpec.describe "Cats", type: :request do
  describe "GET /index" do
    it "gets the list of all the cats in the database" do
      Cat.create(
        name: "Lindo",
        age: 4,
        enjoys: "Enjoys sleeping and being a bum. Don't expect much from him. Minimal effort type of catdude.",
        image: "https://images.unsplash.com/photo-1597237154674-1a0d2274cef4?ixlib=rb-1.2.1&ixid=MnwxM[…]jBjYXRzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"
      )

      get "/cats"

      cat = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(cat.length).to eq 1
  end
