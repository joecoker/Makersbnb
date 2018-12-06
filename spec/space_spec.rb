describe 'Space' do
  context '#list_spaces' do
    it 'returns a list of the spaces object with id numbers' do
      list_of_spaces = Space.list_spaces

      expect(list_of_spaces.length).to eq 1
      expect(list_of_spaces[0]).to be_a Space
      expect(list_of_spaces[0].id).to eq DEFAULT_SPACE[:id].to_s
      expect(list_of_spaces[0].spacename).to eq DEFAULT_SPACE[:spacename]
    end
  end

  context '#create_space' do
    it 'adds the space to the database' do
      Space.create_space(
        spacename: 'My House',
        ownerid: DEFAULT_USER[:id]
      )

      list_of_spaces = Space.list_spaces
      my_house = list_of_spaces.find { |space|
        space.spacename == 'My House'
      }
      expect(my_house).not_to be nil
    end
  end

  context '#view_space_details' do
    it 'returns the details for a given space id' do
      my_house = Space.create_space(
        spacename: 'My House',
        ownerid: DEFAULT_USER[:id]
      )
      house_details = Space.view_space_details(spaceid: my_house.id)
      expect(house_details[:spacename]).to eq 'My House'
    end
  end

  context '#view_availability' do
    it 'returns the list of available dates for a space' do
      expect(Space.view_availability(spaceid: DEFAULT_SPACE[:id]))
        .to include DEFAULT_AVAILABILITY[:formatted_date]
    end
  end

  context '#add_availability' do
    it 'adds an available date to the database ' do
      Space.add_availability(spaceid: DEFAULT_SPACE[:id], date: '2018-12-17')
      expect(Space.view_availability(spaceid: DEFAULT_SPACE[:id]))
        .to include '17/12/2018'
    end
  end

  context '#add_availability_range' do
    it 'adds all dates from start to end inclusive' do
      start_date = DEFAULT_START_AVAILABILITY
      end_date = DEFAULT_END_AVAILABILITY
      Space.add_availability_range(
        spaceid: DEFAULT_SPACE[:id],
        start_date: start_date,
        end_date: end_date
      )
      (start_date..end_date).each do |date|
        day = date.day.to_s.rjust(2, "0")
        month = date.month.to_s.rjust(2, "0")
        year = date.year
        expect(Space.view_availability(spaceid: DEFAULT_SPACE[:id]))
          .to include "#{day}/#{month}/#{year}"
      end
    end

    it 'can handle start and end dates in different months/years' do
      start_date = Date.new(2018, 12, 30)
      end_date = Date.new(2019, 01, 04)
      Space.add_availability_range(
        spaceid: DEFAULT_SPACE[:id],
        start_date: start_date,
        end_date: end_date
      )
      (start_date..end_date).each do |date|
        day = date.day.to_s.rjust(2, "0")
        month = date.month.to_s.rjust(2, "0")
        year = date.year
        expect(Space.view_availability(spaceid: DEFAULT_SPACE[:id]))
          .to include "#{day}/#{month}/#{year}"
      end
    end
  end

  describe '.check_availability' do
    it 'checks a day to get back true when the date is available' do
      expect(Space.check_availability(
        spaceid: DEFAULT_SPACE[:id],
        date: DEFAULT_AVAILABILITY[:date])
      ).to be(true)
    end

    it 'checks an unavailable day and returns false' do
      expect(Space.check_availability(
        spaceid: DEFAULT_SPACE[:id],
        date: '2017-02-02')
      ).to be(false)
    end
  end
end
