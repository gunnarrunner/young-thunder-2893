require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to(:studio) }
    it { should have_many(:roles) }
    it { should have_many(:actors).through(:roles) }
  end

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
  end

  # describe 'class methods' do
  #  describe '.' do
  #   end
  # end

  describe 'instance methods' do
    describe '#order_youngest_to_oldest' do
      it 'can list the actors from youngest to oldest' do
        
        expect(@movie1.order_youngest_to_oldest).to eq([@actor2, @actor3, @actor1])
      end
    end

    describe '#average_age' do
      it 'can list the average age of the actors assocaited with this movie' do
        
        expect(@movie1.average_age.round(2)).to eq(59.67)
      end
    end
  end
end