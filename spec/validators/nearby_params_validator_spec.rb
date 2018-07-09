require 'rails_helper'

describe NearbyParamsValidator, type: :model do
  describe 'nearby params' do
    describe '#lng' do
      it { should allow_value(13.4236807).for(:lng) }
      it { should allow_value('13.4236807').for(:lng) }
      it { should_not allow_value('lng').for(:lng) }
      it { should_not allow_value('lorem').for(:lng) }
    end

    describe '#lat' do
      it { should allow_value(52.5342963).for(:lat) }
      it { should allow_value('52.5342963').for(:lat) }
      it { should_not allow_value('lat').for(:lat) }
      it { should_not allow_value('ipsum').for(:lng) }
    end

    describe '#marketing_type' do
      it { should allow_value('sell').for(:marketing_type) }
      it { should allow_value('rent').for(:marketing_type) }
      it { should_not allow_value(10).for(:marketing_type) }
      it { should_not allow_value('buy').for(:marketing_type) }
    end

    describe '#property_type' do
      it { should allow_value('apartment').for(:property_type) }
      it { should allow_value('apartment_roof_storey').for(:property_type) }
      it { should allow_value('apartment_maisonette').for(:property_type) }
      it { should allow_value('penthouse').for(:property_type) }
      it { should allow_value('villa').for(:property_type) }
      it { should allow_value('multi_family_house').for(:property_type) }
      it { should allow_value('single_family_house').for(:property_type) }
      it { should allow_value('mid_terrace_house').for(:property_type) }
      it { should allow_value('semi_detached_house').for(:property_type) }
      it { should allow_value('end_terrace_house').for(:property_type) }
      it { should_not allow_value(10).for(:property_type) }
      it { should_not allow_value('house').for(:property_type) }
    end
  end
end
