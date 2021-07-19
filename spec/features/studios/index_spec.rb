require 'rails_helper'
RSpec.describe 'it displays the index page and all the studios created on this index page' do
  before :each do
    @studio1 = Studio.create!(name: "Warner Brothers", location: "Los Angeles, California")
    @studio2 = Studio.create!(name: "Paramount Picture Studios", location: "Los Angeles, California")

    @movie1 = Movie.create!(title: "John Wick", creation_year: 2014, genre: "Action" , studio_id: @studio1.id)
    @movie2 = Movie.create!(title: "Commando", creation_year: 1985, genre: "Action" , studio_id: @studio1.id)

    @actor1 = Actor.create!(name: "Arnold Schwarzenegger", age: 73)
    @actor2 = Actor.create!(name: "Keanu Reeves", age: 56)
    @actor3 = Actor.create!(name: "John Leguizamo", age: 56)

    @role1 = Role.create!(movie_id: @movie1.id, actor_id: @actor1.id)
    @role2 = Role.create!(movie_id: @movie1.id, actor_id: @actor2.id)
    @role3 = Role.create!(movie_id: @movie1.id, actor_id: @actor3.id)
    @role4 = Role.create!(movie_id: @movie2.id, actor_id: @actor1.id)
    @role5 = Role.create!(movie_id: @movie2.id, actor_id: @actor2.id)

    visit "/studios"
  end
  it 'the path to visit works' do
    
    expect(current_path).to eq("/studios")
  end
  
  it 'can display all the studios and the movies also' do
    
    expect(page).to have_content(@studio1.name)
    expect(page).to have_content(@studio1.location)
    expect(page).to have_content(@movie1.title)
    expect(page).to have_content(@movie2.title)

    expect(page).to have_content(@studio2.name)
    expect(page).to have_content(@studio2.location)

    expect(@movie1.title).to appear_before(@studio2.name)
  end
end