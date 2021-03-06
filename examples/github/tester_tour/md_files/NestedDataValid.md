<!--- GENERATED FILE, DO NOT EDIT --->
**Prev Stop:** [Verifying Nested Data Objects](./NestedDataEqual.md#verifying-nested-data-objects)

**Next Stop:** [Resource Methods](./ResourceMethods.md#resource-methods)


# Validating Nested Data Objects

Nested data objects can be validated recursively.

## Example Test

<code>nested_data_valid_test.rb</code>
```ruby
require_relative '../../base_classes/base_class_for_test'

require_relative '../../data/rate_limit'

class NestedDataValidTest < BaseClassForTest

  def test_nested_data_valid
    prelude do |log|
      with_api_client(log) do |api_client|
        rate_limit = RateLimit.get(api_client)
        log.section('This is valid') do
          rate_limit.verdict_valid?(log, :rate_limit_valid)
        end
        log.section('This is not valid') do
          rate_limit.resources.core.reset = RateLimit::Core_.invalid_value_for(:reset)
          rate_limit.verdict_valid?(log, :rate_limit_not_valid)
        end
      end
    end
  end

end
```

Notes:

- Use method `verdict_valid?` to verify that a nested data object's values are valid.
- In section `This is valid`:
  - A new `RateLimit` with valid values is instantiated.
  - Method `RateLimit.verdict_valid? validates and logs each value in the rate limit.
- In section `This is not valid`:
  - A new `RateLimit` with invalid values is instantiated.
  - Method `RateLimit.verdict_valid? validates and logs each value in the rate limit.
  - The invalid value is not in the test itself, but instead comes from the data class.

## Log

<code>test_nested_data_valid.xml</code>
```xml
<nested_data_valid_test>
  <summary errors='0' failures='1' verdicts='49'/>
  <test_method duration_seconds='3.853' name='nested_data_valid_test' timestamp='2018-01-15-Mon-13.28.52.091'>
    <section name='Test'>
      <ApiClient method='GET' url='https://api.github.com/rate_limit'>
        <execution duration_seconds='3.775' timestamp='2018-01-15-Mon-13.28.52.107'/>
      </ApiClient>
      <section name='This is valid'>
        <section class='RateLimit' method='verdict_valid?' name='rate_limit_valid'>
          <section class='RateLimit::Resources' method='verdict_valid?' name='resources'>
            <section class='RateLimit::Core_' method='verdict_valid?' name='core'>
              <section name='verdict_assert_integer_positive?'>
                <verdict id='rate_limit_valid:resources:resources:core:core:limit:integer' method='verdict_assert_kind_of?' outcome='passed' volatile='false'>
                  <exp_value>Integer</exp_value>
                  <act_value>5000</act_value>
                </verdict>
                <verdict id='rate_limit_valid:resources:resources:core:core:limit:positive' method='verdict_assert_operator?' outcome='passed' volatile='false'>
                  <object_1>5000</object_1>
                  <operator>:&gt;</operator>
                  <object_2>0</object_2>
                </verdict>
              </section>
              <section name='verdict_assert_integer_positive?'>
                <verdict id='rate_limit_valid:resources:resources:core:core:remaining:integer' method='verdict_assert_kind_of?' outcome='passed' volatile='false'>
                  <exp_value>Integer</exp_value>
                  <act_value>4888</act_value>
                </verdict>
                <verdict id='rate_limit_valid:resources:resources:core:core:remaining:positive' method='verdict_assert_operator?' outcome='passed' volatile='false'>
                  <object_1>4888</object_1>
                  <operator>:&gt;</operator>
                  <object_2>0</object_2>
                </verdict>
              </section>
              <section name='verdict_assert_integer_positive?'>
                <verdict id='rate_limit_valid:resources:resources:core:core:reset:integer' method='verdict_assert_kind_of?' outcome='passed' volatile='false'>
                  <exp_value>Integer</exp_value>
                  <act_value>1516044999</act_value>
                </verdict>
                <verdict id='rate_limit_valid:resources:resources:core:core:reset:positive' method='verdict_assert_operator?' outcome='passed' volatile='false'>
                  <object_1>1516044999</object_1>
                  <operator>:&gt;</operator>
                  <object_2>0</object_2>
                </verdict>
              </section>
            </section>
            <section class='RateLimit::Search' method='verdict_valid?' name='search'>
              <section name='verdict_assert_integer_positive?'>
                <verdict id='rate_limit_valid:resources:resources:search:search:limit:integer' method='verdict_assert_kind_of?' outcome='passed' volatile='false'>
                  <exp_value>Integer</exp_value>
                  <act_value>30</act_value>
                </verdict>
                <verdict id='rate_limit_valid:resources:resources:search:search:limit:positive' method='verdict_assert_operator?' outcome='passed' volatile='false'>
                  <object_1>30</object_1>
                  <operator>:&gt;</operator>
                  <object_2>0</object_2>
                </verdict>
              </section>
              <section name='verdict_assert_integer_positive?'>
                <verdict id='rate_limit_valid:resources:resources:search:search:remaining:integer' method='verdict_assert_kind_of?' outcome='passed' volatile='false'>
                  <exp_value>Integer</exp_value>
                  <act_value>30</act_value>
                </verdict>
                <verdict id='rate_limit_valid:resources:resources:search:search:remaining:positive' method='verdict_assert_operator?' outcome='passed' volatile='false'>
                  <object_1>30</object_1>
                  <operator>:&gt;</operator>
                  <object_2>0</object_2>
                </verdict>
              </section>
              <section name='verdict_assert_integer_positive?'>
                <verdict id='rate_limit_valid:resources:resources:search:search:reset:integer' method='verdict_assert_kind_of?' outcome='passed' volatile='false'>
                  <exp_value>Integer</exp_value>
                  <act_value>1516044597</act_value>
                </verdict>
                <verdict id='rate_limit_valid:resources:resources:search:search:reset:positive' method='verdict_assert_operator?' outcome='passed' volatile='false'>
                  <object_1>1516044597</object_1>
                  <operator>:&gt;</operator>
                  <object_2>0</object_2>
                </verdict>
              </section>
            </section>
            <section class='RateLimit::Graphql' method='verdict_valid?' name='graphql'>
              <section name='verdict_assert_integer_positive?'>
                <verdict id='rate_limit_valid:resources:resources:graphql:graphql:limit:integer' method='verdict_assert_kind_of?' outcome='passed' volatile='false'>
                  <exp_value>Integer</exp_value>
                  <act_value>5000</act_value>
                </verdict>
                <verdict id='rate_limit_valid:resources:resources:graphql:graphql:limit:positive' method='verdict_assert_operator?' outcome='passed' volatile='false'>
                  <object_1>5000</object_1>
                  <operator>:&gt;</operator>
                  <object_2>0</object_2>
                </verdict>
              </section>
              <section name='verdict_assert_integer_positive?'>
                <verdict id='rate_limit_valid:resources:resources:graphql:graphql:remaining:integer' method='verdict_assert_kind_of?' outcome='passed' volatile='false'>
                  <exp_value>Integer</exp_value>
                  <act_value>5000</act_value>
                </verdict>
                <verdict id='rate_limit_valid:resources:resources:graphql:graphql:remaining:positive' method='verdict_assert_operator?' outcome='passed' volatile='false'>
                  <object_1>5000</object_1>
                  <operator>:&gt;</operator>
                  <object_2>0</object_2>
                </verdict>
              </section>
              <section name='verdict_assert_integer_positive?'>
                <verdict id='rate_limit_valid:resources:resources:graphql:graphql:reset:integer' method='verdict_assert_kind_of?' outcome='passed' volatile='false'>
                  <exp_value>Integer</exp_value>
                  <act_value>1516048137</act_value>
                </verdict>
                <verdict id='rate_limit_valid:resources:resources:graphql:graphql:reset:positive' method='verdict_assert_operator?' outcome='passed' volatile='false'>
                  <object_1>1516048137</object_1>
                  <operator>:&gt;</operator>
                  <object_2>0</object_2>
                </verdict>
              </section>
            </section>
          </section>
          <section class='RateLimit::Rate' method='verdict_valid?' name='rate'>
            <section name='verdict_assert_integer_positive?'>
              <verdict id='rate_limit_valid:rate:rate:limit:integer' method='verdict_assert_kind_of?' outcome='passed' volatile='false'>
                <exp_value>Integer</exp_value>
                <act_value>5000</act_value>
              </verdict>
              <verdict id='rate_limit_valid:rate:rate:limit:positive' method='verdict_assert_operator?' outcome='passed' volatile='false'>
                <object_1>5000</object_1>
                <operator>:&gt;</operator>
                <object_2>0</object_2>
              </verdict>
            </section>
            <section name='verdict_assert_integer_positive?'>
              <verdict id='rate_limit_valid:rate:rate:remaining:integer' method='verdict_assert_kind_of?' outcome='passed' volatile='false'>
                <exp_value>Integer</exp_value>
                <act_value>4888</act_value>
              </verdict>
              <verdict id='rate_limit_valid:rate:rate:remaining:positive' method='verdict_assert_operator?' outcome='passed' volatile='false'>
                <object_1>4888</object_1>
                <operator>:&gt;</operator>
                <object_2>0</object_2>
              </verdict>
            </section>
            <section name='verdict_assert_integer_positive?'>
              <verdict id='rate_limit_valid:rate:rate:reset:integer' method='verdict_assert_kind_of?' outcome='passed' volatile='false'>
                <exp_value>Integer</exp_value>
                <act_value>1516044999</act_value>
              </verdict>
              <verdict id='rate_limit_valid:rate:rate:reset:positive' method='verdict_assert_operator?' outcome='passed' volatile='false'>
                <object_1>1516044999</object_1>
                <operator>:&gt;</operator>
                <object_2>0</object_2>
              </verdict>
            </section>
          </section>
        </section>
      </section>
      <section name='This is not valid'>
        <section class='RateLimit' method='verdict_valid?' name='rate_limit_not_valid'>
          <section class='RateLimit::Resources' method='verdict_valid?' name='resources'>
            <section class='RateLimit::Core_' method='verdict_valid?' name='core'>
              <section name='verdict_assert_integer_positive?'>
                <verdict id='rate_limit_not_valid:resources:resources:core:core:limit:integer' method='verdict_assert_kind_of?' outcome='passed' volatile='false'>
                  <exp_value>Integer</exp_value>
                  <act_value>5000</act_value>
                </verdict>
                <verdict id='rate_limit_not_valid:resources:resources:core:core:limit:positive' method='verdict_assert_operator?' outcome='passed' volatile='false'>
                  <object_1>5000</object_1>
                  <operator>:&gt;</operator>
                  <object_2>0</object_2>
                </verdict>
              </section>
              <section name='verdict_assert_integer_positive?'>
                <verdict id='rate_limit_not_valid:resources:resources:core:core:remaining:integer' method='verdict_assert_kind_of?' outcome='passed' volatile='false'>
                  <exp_value>Integer</exp_value>
                  <act_value>4888</act_value>
                </verdict>
                <verdict id='rate_limit_not_valid:resources:resources:core:core:remaining:positive' method='verdict_assert_operator?' outcome='passed' volatile='false'>
                  <object_1>4888</object_1>
                  <operator>:&gt;</operator>
                  <object_2>0</object_2>
                </verdict>
              </section>
              <section name='verdict_assert_integer_positive?'>
                <verdict id='rate_limit_not_valid:resources:resources:core:core:reset:integer' method='verdict_assert_kind_of?' outcome='passed' volatile='false'>
                  <exp_value>Integer</exp_value>
                  <act_value>0</act_value>
                </verdict>
                <verdict id='rate_limit_not_valid:resources:resources:core:core:reset:positive' method='verdict_assert_operator?' outcome='failed' volatile='false'>
                  <object_1>0</object_1>
                  <operator>:&gt;</operator>
                  <object_2>0</object_2>
                  <exception>
                    <class>Minitest::Assertion</class>
                    <message>Expected 0 to be &gt; 0.</message>
                    <backtrace>
                      <![CDATA[
c:/Users/Burdette/Documents/GitHub/RubyTest/examples/github/data/rate_limit.rb:70:in `verdict_field_valid?'
c:/Users/Burdette/Documents/GitHub/RubyTest/lib/base_classes/base_class_for_data.rb:48:in `block (2 levels) in verdict_valid?'
c:/Users/Burdette/Documents/GitHub/RubyTest/lib/base_classes/base_class_for_data.rb:46:in `block in verdict_valid?'
c:/Users/Burdette/Documents/GitHub/RubyTest/lib/base_classes/base_class_for_data.rb:45:in `verdict_valid?'
c:/Users/Burdette/Documents/GitHub/RubyTest/examples/github/data/rate_limit.rb:112:in `verdict_field_valid?'
c:/Users/Burdette/Documents/GitHub/RubyTest/lib/base_classes/base_class_for_data.rb:48:in `block (2 levels) in verdict_valid?'
c:/Users/Burdette/Documents/GitHub/RubyTest/lib/base_classes/base_class_for_data.rb:46:in `block in verdict_valid?'
c:/Users/Burdette/Documents/GitHub/RubyTest/lib/base_classes/base_class_for_data.rb:45:in `verdict_valid?'
c:/Users/Burdette/Documents/GitHub/RubyTest/examples/github/data/rate_limit.rb:27:in `verdict_field_valid?'
c:/Users/Burdette/Documents/GitHub/RubyTest/lib/base_classes/base_class_for_data.rb:48:in `block (2 levels) in verdict_valid?'
c:/Users/Burdette/Documents/GitHub/RubyTest/lib/base_classes/base_class_for_data.rb:46:in `block in verdict_valid?'
c:/Users/Burdette/Documents/GitHub/RubyTest/lib/base_classes/base_class_for_data.rb:45:in `verdict_valid?'
c:/Users/Burdette/Documents/GitHub/RubyTest/examples/github/tester_tour/tests/nested_data_valid_test.rb:16:in `block (3 levels) in test_nested_data_valid'
c:/Users/Burdette/Documents/GitHub/RubyTest/examples/github/tester_tour/tests/nested_data_valid_test.rb:14:in `block (2 levels) in test_nested_data_valid'
c:/Users/Burdette/Documents/GitHub/RubyTest/examples/github/base_classes/base_class_for_test.rb:28:in `block in with_api_client'
c:/Users/Burdette/Documents/GitHub/RubyTest/examples/github/api/api_client.rb:19:in `with'
c:/Users/Burdette/Documents/GitHub/RubyTest/examples/github/base_classes/base_class_for_test.rb:27:in `with_api_client'
c:/Users/Burdette/Documents/GitHub/RubyTest/examples/github/tester_tour/tests/nested_data_valid_test.rb:9:in `block in test_nested_data_valid'
c:/Users/Burdette/Documents/GitHub/RubyTest/examples/github/base_classes/base_class_for_test.rb:21:in `block (2 levels) in prelude'
c:/Users/Burdette/Documents/GitHub/RubyTest/examples/github/base_classes/base_class_for_test.rb:20:in `block in prelude'
c:/Users/Burdette/Documents/GitHub/RubyTest/lib/helpers/test_helper.rb:23:in `block (2 levels) in test'
c:/Users/Burdette/Documents/GitHub/RubyTest/lib/helpers/test_helper.rb:22:in `block in test'
c:/Users/Burdette/Documents/GitHub/RubyTest/lib/helpers/test_helper.rb:21:in `test'
c:/Users/Burdette/Documents/GitHub/RubyTest/examples/github/base_classes/base_class_for_test.rb:12:in `prelude'
c:/Users/Burdette/Documents/GitHub/RubyTest/examples/github/tester_tour/tests/nested_data_valid_test.rb:8:in `test_nested_data_valid']]>
                    </backtrace>
                  </exception>
                </verdict>
              </section>
            </section>
            <section class='RateLimit::Search' method='verdict_valid?' name='search'>
              <section name='verdict_assert_integer_positive?'>
                <verdict id='rate_limit_not_valid:resources:resources:search:search:limit:integer' method='verdict_assert_kind_of?' outcome='passed' volatile='false'>
                  <exp_value>Integer</exp_value>
                  <act_value>30</act_value>
                </verdict>
                <verdict id='rate_limit_not_valid:resources:resources:search:search:limit:positive' method='verdict_assert_operator?' outcome='passed' volatile='false'>
                  <object_1>30</object_1>
                  <operator>:&gt;</operator>
                  <object_2>0</object_2>
                </verdict>
              </section>
              <section name='verdict_assert_integer_positive?'>
                <verdict id='rate_limit_not_valid:resources:resources:search:search:remaining:integer' method='verdict_assert_kind_of?' outcome='passed' volatile='false'>
                  <exp_value>Integer</exp_value>
                  <act_value>30</act_value>
                </verdict>
                <verdict id='rate_limit_not_valid:resources:resources:search:search:remaining:positive' method='verdict_assert_operator?' outcome='passed' volatile='false'>
                  <object_1>30</object_1>
                  <operator>:&gt;</operator>
                  <object_2>0</object_2>
                </verdict>
              </section>
              <section name='verdict_assert_integer_positive?'>
                <verdict id='rate_limit_not_valid:resources:resources:search:search:reset:integer' method='verdict_assert_kind_of?' outcome='passed' volatile='false'>
                  <exp_value>Integer</exp_value>
                  <act_value>1516044597</act_value>
                </verdict>
                <verdict id='rate_limit_not_valid:resources:resources:search:search:reset:positive' method='verdict_assert_operator?' outcome='passed' volatile='false'>
                  <object_1>1516044597</object_1>
                  <operator>:&gt;</operator>
                  <object_2>0</object_2>
                </verdict>
              </section>
            </section>
            <section class='RateLimit::Graphql' method='verdict_valid?' name='graphql'>
              <section name='verdict_assert_integer_positive?'>
                <verdict id='rate_limit_not_valid:resources:resources:graphql:graphql:limit:integer' method='verdict_assert_kind_of?' outcome='passed' volatile='false'>
                  <exp_value>Integer</exp_value>
                  <act_value>5000</act_value>
                </verdict>
                <verdict id='rate_limit_not_valid:resources:resources:graphql:graphql:limit:positive' method='verdict_assert_operator?' outcome='passed' volatile='false'>
                  <object_1>5000</object_1>
                  <operator>:&gt;</operator>
                  <object_2>0</object_2>
                </verdict>
              </section>
              <section name='verdict_assert_integer_positive?'>
                <verdict id='rate_limit_not_valid:resources:resources:graphql:graphql:remaining:integer' method='verdict_assert_kind_of?' outcome='passed' volatile='false'>
                  <exp_value>Integer</exp_value>
                  <act_value>5000</act_value>
                </verdict>
                <verdict id='rate_limit_not_valid:resources:resources:graphql:graphql:remaining:positive' method='verdict_assert_operator?' outcome='passed' volatile='false'>
                  <object_1>5000</object_1>
                  <operator>:&gt;</operator>
                  <object_2>0</object_2>
                </verdict>
              </section>
              <section name='verdict_assert_integer_positive?'>
                <verdict id='rate_limit_not_valid:resources:resources:graphql:graphql:reset:integer' method='verdict_assert_kind_of?' outcome='passed' volatile='false'>
                  <exp_value>Integer</exp_value>
                  <act_value>1516048137</act_value>
                </verdict>
                <verdict id='rate_limit_not_valid:resources:resources:graphql:graphql:reset:positive' method='verdict_assert_operator?' outcome='passed' volatile='false'>
                  <object_1>1516048137</object_1>
                  <operator>:&gt;</operator>
                  <object_2>0</object_2>
                </verdict>
              </section>
            </section>
          </section>
          <section class='RateLimit::Rate' method='verdict_valid?' name='rate'>
            <section name='verdict_assert_integer_positive?'>
              <verdict id='rate_limit_not_valid:rate:rate:limit:integer' method='verdict_assert_kind_of?' outcome='passed' volatile='false'>
                <exp_value>Integer</exp_value>
                <act_value>5000</act_value>
              </verdict>
              <verdict id='rate_limit_not_valid:rate:rate:limit:positive' method='verdict_assert_operator?' outcome='passed' volatile='false'>
                <object_1>5000</object_1>
                <operator>:&gt;</operator>
                <object_2>0</object_2>
              </verdict>
            </section>
            <section name='verdict_assert_integer_positive?'>
              <verdict id='rate_limit_not_valid:rate:rate:remaining:integer' method='verdict_assert_kind_of?' outcome='passed' volatile='false'>
                <exp_value>Integer</exp_value>
                <act_value>4888</act_value>
              </verdict>
              <verdict id='rate_limit_not_valid:rate:rate:remaining:positive' method='verdict_assert_operator?' outcome='passed' volatile='false'>
                <object_1>4888</object_1>
                <operator>:&gt;</operator>
                <object_2>0</object_2>
              </verdict>
            </section>
            <section name='verdict_assert_integer_positive?'>
              <verdict id='rate_limit_not_valid:rate:rate:reset:integer' method='verdict_assert_kind_of?' outcome='passed' volatile='false'>
                <exp_value>Integer</exp_value>
                <act_value>1516044999</act_value>
              </verdict>
              <verdict id='rate_limit_not_valid:rate:rate:reset:positive' method='verdict_assert_operator?' outcome='passed' volatile='false'>
                <object_1>1516044999</object_1>
                <operator>:&gt;</operator>
                <object_2>0</object_2>
              </verdict>
            </section>
          </section>
        </section>
      </section>
    </section>
  </test_method>
  <section name='Count of errors (unexpected exceptions)'>
    <verdict id='error_count' method='verdict_assert_equal?' outcome='passed' volatile='true'>
      <exp_value>0</exp_value>
      <act_value>0</act_value>
    </verdict>
  </section>
</nested_data_valid_test>
```

Notes:

- In section `This is valid`, all verdicts pass.
- When a value has multiple validation verdicts (as all of these do), the verdicts are logged into a separate subsection.
- In section `This is not valid`, three verdicts fail.

**Prev Stop:** [Verifying Nested Data Objects](./NestedDataEqual.md#verifying-nested-data-objects)

**Next Stop:** [Resource Methods](./ResourceMethods.md#resource-methods)

