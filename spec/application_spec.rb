require 'zueribad'

module Zueribad
  describe Application do
    context '#options' do
      context 'no arguments given' do
        it 'should have default options' do
          Application.new.options.length.should be == 0
        end
      end

      context 'name argument given' do
        it 'should be in options' do
          ARGV << '-n' << 'letten'
          Application.new.options[:name].should be == 'letten'
        end
      end
    end

    context '#max_lengths' do
      before do
        @application = Application.new
        @application.stub(:baths => ['a', 'abc', 'ab'].map do |x|
          Bath.new(:name => x, :open_status => x)
        end)
      end

      it 'should return the length of the longest name' do
        @application.max_lengths[:name].should be == 3
      end

      it 'should return the length of the longest name' do
        @application.max_lengths[:open_status].should be == 3
      end
    end
  end
end
