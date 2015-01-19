FactoryGirl.define do
  factory :report do
    factory :filled_in_report do
      development ['Develop as an Agile practitioner'] + [] * 9
      smart [
        { what: 'Learn Ruby language', how: 'Join a weekly Ruby club' }
      ] + [{ what: '', how: '' }] * 9

      factory :approved_report do
        approved_at { 1.day.ago }
      end
    end
  end
end
