module Match
  DomainEntity = /[A-z]\w+/
end

module The
  module Dsl
    def the(thing, conditions = {})
      type = case thing
      when Symbol
        thing.to_s.classify.constantize
      when String
        thing.classify.constantize
      when ActiveRecord::Base
        thing
      else
        raise ArgumentError, thing.inspect
      end
      type.count(:conditions => conditions).should == 1
      result = type.first(:conditions => conditions)
      return yield result if block_given?
      result
    end
  end
end

World(The::Dsl)