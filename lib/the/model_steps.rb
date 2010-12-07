Given /^there is a (#{Match::DomainEntity}) named "([^"]*)"$/ do |type, name|
  Factory(type.underscore.to_sym, :name => name)
end

Given /^the following (#{Match::DomainEntity}):$/ do |type, attributes_table|
  attributes_table.hashes.each do |attributes|
    Factory(type.underscore.singularize.to_sym, attributes)
  end
end

Then /^there should be (\d+) (#{Match::DomainEntity})$/ do |num, type|
  type.singularize.constantize.count.should == num.to_i
end

Then /^the (#{Match::DomainEntity}) should have the following attributes:$/ do |type, table|
  table.rows_hash.each do |key, value|
    the(type).send(key).should == value
  end
end

Then /^the (#{Match::DomainEntity}) should belong to the (#{Match::DomainEntity})$/ do |child_type, parent_type|
  child = the(child_type)
  parent = the(parent_type)
  association_name = child_type.underscore.pluralize
  parent.send(association_name).should include(child)
end

Then /^the following (#{Match::DomainEntity}) (should|should not) belong to the (#{Match::DomainEntity}):$/ do
  |children_type, should, parent_type, children_table|
  parent = the(parent_type)
  association_name = children_type.underscore
  child_type = children_type.singularize
  children_table.hashes.each do |child_attributes|
    child = the(child_type, child_attributes)
    if should == 'should'
      parent.send(association_name).should include(child)
    else
      parent.send(association_name).should_not include(child)
    end
  end
end