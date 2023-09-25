require "rails_helper" 

RSpec.describe "Experiments index Page" do 
  before(:each) do 
    @lab1 = Lab.create!(name: "Bob's lab")
    @scientist1 = @lab1.scientists.create!(name:"Bob", specialty:"Makin stuff", university:"Oxford")
    @scientist2 = @lab1.scientists.create!(name:"Joe", specialty:"Makin stuff", university:"Cambridge")
    @experiment1 = Experiment.create!(name: "Timmy", objective:"To grow", num_months: 10)
    @experiment2 = Experiment.create!(name: "Doggo", objective:"To find snacks", num_months: 2)
    @experiment3 = Experiment.create!(name: "Draco", objective:"Become a wizard", num_months: 60)
    @scientist_experiment1 = ScientistExperiment.create!(scientist:@scientist1, experiment:@experiment1)
    @scientist_experiment2 = ScientistExperiment.create!(scientist:@scientist1, experiment:@experiment2)
    @scientist_experiment3 = ScientistExperiment.create!(scientist:@scientist1, experiment:@experiment3)
    @scientist_experiment4 = ScientistExperiment.create!(scientist:@scientist2, experiment:@experiment1)
    @scientist_experiment5 = ScientistExperiment.create!(scientist:@scientist2, experiment:@experiment2)
    @scientist_experiment6 = ScientistExperiment.create!(scientist:@scientist2, experiment:@experiment3)
  end

  it "visit experiments index page and show names decending by month with 6 months or longer duration" do
    visit "/experiments"

    expect(page).to have_content(@experiment1.name)
    expect(page).not_to have_content(@experiment2.name)
    expect(page).to have_content(@experiment3.name)

    expect(@experiment3.name).to appear_before(@experiment1.name)
  end
end