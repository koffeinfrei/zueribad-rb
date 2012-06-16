require 'zueribad'

module Zueribad
  describe Bath do

    before do
      # stub to load xml from fixtures instead of server
      path = File.join(File.dirname(__FILE__), 'fixtures', 'baths.xml')
      data = File.read(path)
      Bath.stub(:download => data)
    end

    context '#fetch' do
      context 'no param' do

        before do
          @baths = Bath.fetch
        end
        it 'should return all baths' do
          @baths.length.should be > 1
        end

        context 'the first element' do
          it 'should have a name' do
            @baths[0].name.should_not be_nil
          end

          it 'should have a temperature' do
            @baths[0].temperature.should_not be_nil
          end

          it 'should have a open_status' do
            @baths[0].open_status.should_not be_nil
          end

          it 'should have a modified_at' do
            @baths[0].modified_at.should_not be_nil
          end
        end
      end

      context 'name param given' do
        it 'should return baths that contain the name' do
          Bath.fetch('letten').length.should be == 2
        end
      end
    end
  end
end
