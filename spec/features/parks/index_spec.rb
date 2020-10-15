require 'rails_helper'

require "rails_helper"

RSpec.describe "Dashboard" do
  # @description=
  #  "Andrew Johnson's complex presidency (1865-69) illustrates the Constitution at work following the Civil War. As the President and Congress disagreed on Reconstruction methods, the Constitution served as their guide on balance of powers, vetoes, and impeachment. In the end, it evolved as a living document with pivotal amendments on freedom, citizenship, and voting rights - topics still vital today.",
  # @directions=
  #  "GPS The GPS setting for Andrew Johnson NHS may be listed as 121 Monument Ave, which is the park HQ in the National Cemetery. To arrive at the Visitor Center, use 101 North College Street, Greeneville, TN. Plane The closest airport is the Tri-Cities Regional Airport, 43 miles NE of Greeneville. From the airport, take I-81 South to exit 36 and follow the signs to Greeneville. Car From I-81S take exit 36 to Rt. 172 south to Greeneville. From I-81N take exit 23 to Rt. 11E north to Greeneville.",
  # @directions_url="http://www.nps.gov/anjo/planyourvisit/directions.htm",
  # @hours=
  #  {:wednesday=>"10:00AM - 3:00PM",
  #   :monday=>"10:00AM - 3:00PM",
  #   :thursday=>"10:00AM - 3:00PM",
  #   :sunday=>"Closed",
  #   :tuesday=>"10:00AM - 3:00PM",
  #   :friday=>"10:00AM - 3:00PM",
  #   :saturday=>"Closed"},
  # @id="2ED6E071-57AA-4B08-8DDA-5CB09FBB75C8",
  # @name="Andrew Johnson National Historic Site">
  #
  describe "As an user" do
    it "gives me the count of parks for a selected state" do
      
      hours = {:wednesday=>"10:00AM - 3:00PM",
                :monday=>"10:00AM - 3:00PM",
                :thursday=>"10:00AM - 3:00PM",
                :sunday=>"Closed",
                :tuesday=>"10:00AM - 3:00PM",
                :friday=>"10:00AM - 3:00PM",
                :saturday=>"Closed"
              }
      
      visit "/"
      select "Tennessee", from: :state
      click_on "Find Parks"
      expect(current_path).to eq("/parks")
      expect(page).to have_content("Total parks for the state of TN is 16")
      
      within("#park-2ED6E071-57AA-4B08-8DDA-5CB09FBB75C8") do
        expect(page).to have_content("Andrew Johnson's complex presidency (1865-69) illustrates the Constitution at work following the Civil War. As the President and Congress disagreed on Reconstruction methods, the Constitution served as their guide on balance of powers, vetoes, and impeachment. In the end, it evolved as a living document with pivotal amendments on freedom, citizenship, and voting rights - topics still vital today.")
        expect(page).to have_content("GPS The GPS setting for Andrew Johnson NHS may be listed as 121 Monument Ave, which is the park HQ in the National Cemetery. To arrive at the Visitor Center, use 101 North College Street, Greeneville, TN. Plane The closest airport is the Tri-Cities Regional Airport, 43 miles NE of Greeneville. From the airport, take I-81 South to exit 36 and follow the signs to Greeneville. Car From I-81S take exit 36 to Rt. 172 south to Greeneville. From I-81N take exit 23 to Rt. 11E north to Greeneville.")
        expect(page).to have_content(hours)
      end
    end
  end
end