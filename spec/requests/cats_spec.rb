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
  end
  describe "POST /create" do
    it "creates a cat" do
      cat_params ={
        cat: {
          name: 'rambo',
          age: 7,
          enjoys: 'ramboing out and taking in on the crooked cats that curropt the system of the legion of cats',
          image: 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fi.redd.it%2F0jojnmgddmi31.png&imgrefurl=https%3A%2F%2Fwww.reddit.com%2Fr%2FONeillism%2Fcomments%2Fcvafie%2Fsylvester_stallone_the_cat%2F&tbnid=rlaLozk7k7uOdM&vet=12ahUKEwir8oC7y6z6AhXKBFMKHZhfBF4QMygSegUIARDPAQ..i&docid=u9xfJbnYZZQ5tM&w=512&h=527&q=sylvester%20stallone%20cat&ved=2ahUKEwir8oC7y6z6AhXKBFMKHZhfBF4QMygSegUIARDPAQ'
        }
      }
      
      cat = Cat.first
  
      post '/cats', params: cat_params
  
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body).deep_symbolize_keys

      p json


      expect(Cat.count).to eq(1)
      expect(json[:enjoys]).to eq("ramboing out and taking in on the crooked cats that curropt the system of the legion of cats")
      expect(json[:age]).to eq(7)


    end
  end
end



