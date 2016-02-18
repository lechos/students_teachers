require_relative 'spec_helper'

describe Teacher, 'Sample data' do
  before :each do
    teachers_fixture_path = File.absolute_path('fixtures/teachers.csv', File.dirname(__FILE__))
    TeachersImporter.new(teachers_fixture_path).import
  end

  it 'should contain one of the teachers from the CSV' do
    expect(Teacher.where('first_name = ? AND last_name = ?', 'Bender', 'Rodriquez').exists?).to be(true)
  end
end
