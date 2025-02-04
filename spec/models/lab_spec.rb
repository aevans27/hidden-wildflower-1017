require 'rails_helper'

RSpec.describe Lab do
  it {should have_many :scientists}
  it {should have_many(:experiments).through(:scientists)}

  before(:each) do 
    @lab1 = Lab.create!(name: "Bob's lab")
    @scientist1 = @lab1.scientists.create!(name:"Bob", specialty:"Makin stuff", university:"Oxford")
    @scientist2 = @lab1.scientists.create!(name:"Joe", specialty:"Makin stuff", university:"Cambridge")
    @scientist3 = @lab1.scientists.create!(name:"Jimmy", specialty:"Makin stuff", university:"A barn")
    @experiment1 = Experiment.create!(name: "Timmy", objective:"To grow", num_months: 10)
    @experiment2 = Experiment.create!(name: "Doggo", objective:"To find snacks", num_months: 2)
    @experiment3 = Experiment.create!(name: "Draco", objective:"Become a wizard", num_months: 60)
    @scientist_experiment1 = ScientistExperiment.create!(scientist:@scientist1, experiment:@experiment1)
    @scientist_experiment2 = ScientistExperiment.create!(scientist:@scientist2, experiment:@experiment2)
    @scientist_experiment3 = ScientistExperiment.create!(scientist:@scientist2, experiment:@experiment3)
    @scientist_experiment4 = ScientistExperiment.create!(scientist:@scientist3, experiment:@experiment1)
    @scientist_experiment5 = ScientistExperiment.create!(scientist:@scientist3, experiment:@experiment2)
    @scientist_experiment6 = ScientistExperiment.create!(scientist:@scientist3, experiment:@experiment3)
  end

  it "#scientist_with_experiment_count" do
    expect(@lab1.scientist_with_experiment_count).to eq([@scientist3, @scientist2, @scientist1])
  end
end