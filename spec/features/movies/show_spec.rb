require 'rails_helper'
RSpec.describe 'it can display a show page for a movie along with with the actors associated with this title' do
  before :each do
    @studio1 = Studio.create!(name: "Warner Brothers", location: "Los Angeles, California")
    @studio2 = Studio.create!(name: "Paramount Picture Studios", location: "Los Angeles, California")

    @movie1 = Movie.create!(title: "John Wick", creation_year: 2014, genre: "Action" , studio_id: @studio1.id)
    @movie2 = Movie.create!(title: "Commando", creation_year: 1985, genre: "Action" , studio_id: @studio1.id)

    @actor1 = Actor.create!(name: "Arnold Schwarzenegger", age: 73)
    @actor2 = Actor.create!(name: "Keanu Reeves", age: 50)
    @actor3 = Actor.create!(name: "John Leguizamo", age: 56)

    @role1 = Role.create!(movie_id: @movie1.id, actor_id: @actor1.id)
    @role2 = Role.create!(movie_id: @movie1.id, actor_id: @actor2.id)
    @role3 = Role.create!(movie_id: @movie1.id, actor_id: @actor3.id)
    @role4 = Role.create!(movie_id: @movie2.id, actor_id: @actor1.id)
    @role5 = Role.create!(movie_id: @movie2.id, actor_id: @actor2.id)

    visit "/movies/#{@movie1.id}"
  end

  it 'can go to the show page' do

    expect(current_path).to eq("/movies/#{@movie1.id}")
  end

  it 'can see the movies attributes' do
    
    expect(page).to have_content(@movie1.title)
    expect(page).to have_content(@movie1.creation_year)
    expect(page).to have_content(@movie1.genre)

    expect(page).to_not have_content(@movie2.title)
  end

  it 'can list all the actors associated with this movie is order of youngest to oldest' do

    expect(@actor2.name).to appear_before(@actor3.name)
    expect(@actor3.name).to appear_before(@actor1.name) 
  end

  it 'can show the average age of all the movie actors' do

    expect(page).to have_content("Average Age of Actors: 59.67 years old")
  end

  it 'can fill out a form on the movies show page and be redirected to see that actor created and associated with this movie' do
      
    fill_in("Name", with: "Ian McShane")
    fill_in("Age", with: 78)

    click_button('Create Actor')

    expect(current_path).to eq("/movies/#{@movie1.id}")
    expect(page).to have_content("Ian McShane")
  end
end