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
  end
end
