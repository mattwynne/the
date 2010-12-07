# The

**TLDR**: A simple little DSL for Cucumber tests that work with ActiveRecord models.

## Why?

I have a common pattern in my cukes whenever the step talks about "the User" or "the Fish". To me, the word "the" implies that there should only be one, so I always want to check:

    Then /^the User should be married to susan$/ do
      User.count.should == 1
      User.first.should be_married_to('susan')
    end

`The` is simple. It just gives you a nicer way to write that pattern:

    Then /^the User should be married to susan$/ do
      the(:user).should be_married_to('susan')
    end

It's quite flexible, so you can pass `#the` a **symbol**, like in the example above, or a **class**, or a **string of a class name**. So, for example:

    When /^the (\w+) eats the (\w+)$/ do |eater, eaten|
      the(eater).eat(eaten)
    end

Oh and it also understands a **hash of conditions**, just like `ActiveRecord::Base#find`, so you can do this:

    When /^the User named (\w+) eats the fish$/ do |name|
      the(:user, :name => name).eat(the(:fish))
    end

In fact, there are a few **step definitions** defined for you, which you can enjoy for yourself by calling...

    require 'the/model_steps'

...from somewhere inside your `features/step_definitions` folder. You'll have to look at the source for now if you want to know what they do.

If you just want the DSL, and none of these fancy step definitions, then try this for size:

    require 'the/cucumber'
