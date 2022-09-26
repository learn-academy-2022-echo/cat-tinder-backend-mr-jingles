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

    it 'cannot create a cat without a cat name' do
      cat_params = {
        cat: {
          age: 7,
          enjoys: 'ramboing out and taking in on the crooked cats that curropt the system of the legion of cats',
          image: 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fi.redd.it%2F0jojnmgddmi31.png&imgrefurl=https%3A%2F%2Fwww.reddit.com%2Fr%2FONeillism%2Fcomments%2Fcvafie%2Fsylvester_stallone_the_cat%2F&tbnid=rlaLozk7k7uOdM&vet=12ahUKEwir8oC7y6z6AhXKBFMKHZhfBF4QMygSegUIARDPAQ..i&docid=u9xfJbnYZZQ5tM&w=512&h=527&q=sylvester%20stallone%20cat&ved=2ahUKEwir8oC7y6z6AhXKBFMKHZhfBF4QMygSegUIARDPAQ'
        }
      }
    
      post '/cats', params: cat_params
    
      expect(response.status).to eq(422)
    
      json = JSON.parse(response.body)
      p json
    expect(json['name']).to include "can't be blank"
  end

  it 'cannot create a cat without a cat age' do
    cat_params = {
      cat: {
        name: 'Rambo',
        enjoys: 'ramboing out and taking in on the crooked cats that curropt the system of the legion of cats',
        image: 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fi.redd.it%2F0jojnmgddmi31.png&imgrefurl=https%3A%2F%2Fwww.reddit.com%2Fr%2FONeillism%2Fcomments%2Fcvafie%2Fsylvester_stallone_the_cat%2F&tbnid=rlaLozk7k7uOdM&vet=12ahUKEwir8oC7y6z6AhXKBFMKHZhfBF4QMygSegUIARDPAQ..i&docid=u9xfJbnYZZQ5tM&w=512&h=527&q=sylvester%20stallone%20cat&ved=2ahUKEwir8oC7y6z6AhXKBFMKHZhfBF4QMygSegUIARDPAQ'
      }
    }
  
    post '/cats', params: cat_params
  
    expect(response.status).to eq(422)
  
    json = JSON.parse(response.body)
    p json
    expect(json['age']).to include "can't be blank"
  end

  it 'cannot create a cat without a cat enjoys' do
    cat_params = {
      cat: {
        name: 'Rambo',
        age: 7,
        image: 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fi.redd.it%2F0jojnmgddmi31.png&imgrefurl=https%3A%2F%2Fwww.reddit.com%2Fr%2FONeillism%2Fcomments%2Fcvafie%2Fsylvester_stallone_the_cat%2F&tbnid=rlaLozk7k7uOdM&vet=12ahUKEwir8oC7y6z6AhXKBFMKHZhfBF4QMygSegUIARDPAQ..i&docid=u9xfJbnYZZQ5tM&w=512&h=527&q=sylvester%20stallone%20cat&ved=2ahUKEwir8oC7y6z6AhXKBFMKHZhfBF4QMygSegUIARDPAQ'
      }
    }
  
    post '/cats', params: cat_params
  
    expect(response.status).to eq(422)
  
    json = JSON.parse(response.body)
    p json
    expect(json['enjoys']).to include "can't be blank"
  end

  it 'cannot create a cat without a cat image' do
    cat_params = {
      cat: {
        name: 'Rambo',
        age: 7,
        enjoys: 'ramboing out and taking in on the crooked cats that curropt the system of the legion of cats'
      }
    }
  
    post '/cats', params: cat_params
  
    expect(response.status).to eq(422)
  
    json = JSON.parse(response.body)
    p json
    expect(json['image']).to include "can't be blank"
  end

  it 'cannot create unless cat enjoys is minimum 10 characters' do
    cat_params = {
      cat: {
        name: 'Rambo',
        age: 7,
        enjoys: 'a cat',
        image: 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fi.redd.it%2F0jojnmgddmi31.png&imgrefurl=https%3A%2F%2Fwww.reddit.com%2Fr%2FONeillism%2Fcomments%2Fcvafie%2Fsylvester_stallone_the_cat%2F&tbnid=rlaLozk7k7uOdM&vet=12ahUKEwir8oC7y6z6AhXKBFMKHZhfBF4QMygSegUIARDPAQ..i&docid=u9xfJbnYZZQ5tM&w=512&h=527&q=sylvester%20stallone%20cat&ved=2ahUKEwir8oC7y6z6AhXKBFMKHZhfBF4QMygSegUIARDPAQ'
      }
    }
  
    post '/cats', params: cat_params
  
    expect(response.status).to eq(422)
  
    json = JSON.parse(response.body)
    p json
    expect(json['enjoys']).to include "is too short (minimum is 10 characters)"
  end
end
  
  describe 'PATCH /update' do 
    it 'updates a cat' do 
      cat_params ={
        cat: {
          name: 'rambo',
          age: 7,
          enjoys: 'ramboing out and taking in on the crooked cats that curropt the system of the legion of cats',
          image: 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fi.redd.it%2F0jojnmgddmi31.png&imgrefurl=https%3A%2F%2Fwww.reddit.com%2Fr%2FONeillism%2Fcomments%2Fcvafie%2Fsylvester_stallone_the_cat%2F&tbnid=rlaLozk7k7uOdM&vet=12ahUKEwir8oC7y6z6AhXKBFMKHZhfBF4QMygSegUIARDPAQ..i&docid=u9xfJbnYZZQ5tM&w=512&h=527&q=sylvester%20stallone%20cat&ved=2ahUKEwir8oC7y6z6AhXKBFMKHZhfBF4QMygSegUIARDPAQ'
        }
      }

      post '/cats', params: cat_params

      cat = Cat.first
  
      patch "/cats/#{cat.id}", params: {
        cat: {
          name: 'rambo',
          age: 3,
          enjoys: 'ramboing out and taking in on the crooked cats that curropt the system of the legion of cats',
          image: 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fi.redd.it%2F0jojnmgddmi31.png&imgrefurl=https%3A%2F%2Fwww.reddit.com%2Fr%2FONeillism%2Fcomments%2Fcvafie%2Fsylvester_stallone_the_cat%2F&tbnid=rlaLozk7k7uOdM&vet=12ahUKEwir8oC7y6z6AhXKBFMKHZhfBF4QMygSegUIARDPAQ..i&docid=u9xfJbnYZZQ5tM&w=512&h=527&q=sylvester%20stallone%20cat&ved=2ahUKEwir8oC7y6z6AhXKBFMKHZhfBF4QMygSegUIARDPAQ'
        }
      }
  
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body).deep_symbolize_keys

      p json


      expect(Cat.count).to eq(1)
      expect(json[:age]).to eq(3)
    end
  end

  describe 'DELETE /destroy' do 
    it 'deletes a cat' do 
      cat_params ={
        cat: {
          name: 'rambo',
          age: 7,
          enjoys: 'ramboing out and taking in on the crooked cats that curropt the system of the legion of cats',
          image: 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fi.redd.it%2F0jojnmgddmi31.png&imgrefurl=https%3A%2F%2Fwww.reddit.com%2Fr%2FONeillism%2Fcomments%2Fcvafie%2Fsylvester_stallone_the_cat%2F&tbnid=rlaLozk7k7uOdM&vet=12ahUKEwir8oC7y6z6AhXKBFMKHZhfBF4QMygSegUIARDPAQ..i&docid=u9xfJbnYZZQ5tM&w=512&h=527&q=sylvester%20stallone%20cat&ved=2ahUKEwir8oC7y6z6AhXKBFMKHZhfBF4QMygSegUIARDPAQ'
        }
      }

      post '/cats', params: cat_params
      expect(response.status).to eq(200)

      cat = Cat.first
      delete "/cats/#{cat.id}"
      expect(response.status).to eq(204)
      cats = Cat.all
      expect(cats).to be_empty
    end
  end 
end




