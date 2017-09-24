<!--- GENERATED FILE, DO NOT EDIT --->
[Prev](./Sections.md) [Next](./Volatility.md)

# Verdicts

## Test Source Code

This page introduces verdicts.

Each verdict method returns a boolean value, and therefore follows the ruby convention of ending the method name with *?*.

There are many verdict methods.  See [Log](../../../../lib/log/Log.md).

<code>verdicts_test.rb</code>
```ruby
require_relative '../../base_classes/base_class_for_test'

class VerdictsTest < BaseClassForTest

  def test_verdicts
    prelude do |client, log|
      # Using extra variables in these verdicts, to make usage clear.
      log.section('These verdicts should pass') do
        log.section('An assertion verdict that should pass') do
          log.verdict_assert?(
              verdict_id = 'assertion should pass',
              actual = true,
              message = 'True is truthy'
          )
        end
        log.section('A refutation verdict that should pass') do
          log.verdict_refute?(
              verdict_id = 'refutation should pass',
              actual = false,
              message = 'False is not truthy'
          )
        end
      end
      log.section('These verdicts should fail') do
        log.section('An assert verdict that should fail') do
          log.verdict_assert?(
              verdict_id = 'assertion should fail',
              actual = false,
              message = 'False is not truthy'
          )
        end
        log.section('A refutation verdict that should fail') do
          log.verdict_refute?(
              verdict_id = 'refutation should fail',
              actual = true,
              message = 'True is truthy'
          )
        end
      end
    end
  end

end
```

Notes:

- Each verdict has:
  - A verdict identifier, which must be unique within the test.
  - A message string.
- Use an assert verdict to express a positive expectation.
- Use a refute verdict to express a negative expectation.


##  Test Log

<code>test_verdicts.xml</code>
```xml
<verdicts_test>
  <summary errors='0' failures='2' verdicts='5'/>
  <test_method duration_seconds='0.005' name='verdicts_test' timestamp='2017-09-23-Sat-16.57.52.831'>
    <section name='With ExampleRestClient'>
      <section name='These verdicts should pass'>
        <section name='An assertion verdict that should pass'>
          <verdict id='assertion should pass' message='True is truthy' method='verdict_assert?' outcome='passed' volatile='false'>
            <act_value>true</act_value>
          </verdict>
        </section>
        <section name='A refutation verdict that should pass'>
          <verdict id='refutation should pass' message='False is not truthy' method='verdict_refute?' outcome='passed' volatile='false'>
            <act_value>false</act_value>
          </verdict>
        </section>
      </section>
      <section name='These verdicts should fail'>
        <section name='An assert verdict that should fail'>
          <verdict id='assertion should fail' message='False is not truthy' method='verdict_assert?' outcome='failed' volatile='false'>
            <act_value>false</act_value>
            <exception>
              <class>Minitest::Assertion</class>
              <message>Expected false to be truthy.</message>
              <backtrace>
                <![CDATA[c:/Users/Burdette/Documents/GitHub/RubyTest/examples/rest_api/tour/tests/verdicts_test.rb:26:in `block (3 levels) in test_verdicts'
c:/Users/Burdette/Documents/GitHub/RubyTest/examples/rest_api/tour/tests/verdicts_test.rb:25:in `block (2 levels) in test_verdicts'
c:/Users/Burdette/Documents/GitHub/RubyTest/examples/rest_api/tour/tests/verdicts_test.rb:24:in `block in test_verdicts'
c:/Users/Burdette/Documents/GitHub/RubyTest/examples/rest_api/base_classes/base_class_for_test.rb:13:in `block (2 levels) in prelude'
c:/Users/Burdette/Documents/GitHub/RubyTest/examples/rest_api/example_rest_client.rb:18:in `block in with'
c:/Users/Burdette/Documents/GitHub/RubyTest/examples/rest_api/example_rest_client.rb:14:in `with'
c:/Users/Burdette/Documents/GitHub/RubyTest/examples/rest_api/base_classes/base_class_for_test.rb:12:in `block in prelude'
c:/Users/Burdette/Documents/GitHub/RubyTest/lib/helpers/test_helper.rb:23:in `block (2 levels) in test'
c:/Users/Burdette/Documents/GitHub/RubyTest/lib/helpers/test_helper.rb:22:in `block in test'
c:/Users/Burdette/Documents/GitHub/RubyTest/lib/helpers/test_helper.rb:21:in `test'
c:/Users/Burdette/Documents/GitHub/RubyTest/examples/rest_api/base_classes/base_class_for_test.rb:11:in `prelude'
c:/Users/Burdette/Documents/GitHub/RubyTest/examples/rest_api/tour/tests/verdicts_test.rb:6:in `test_verdicts']]>
              </backtrace>
            </exception>
          </verdict>
        </section>
        <section name='A refutation verdict that should fail'>
          <verdict id='refutation should fail' message='True is truthy' method='verdict_refute?' outcome='failed' volatile='false'>
            <act_value>true</act_value>
            <exception>
              <class>Minitest::Assertion</class>
              <message>Expected true to not be truthy.</message>
              <backtrace>
                <![CDATA[c:/Users/Burdette/Documents/GitHub/RubyTest/examples/rest_api/tour/tests/verdicts_test.rb:33:in `block (3 levels) in test_verdicts'
c:/Users/Burdette/Documents/GitHub/RubyTest/examples/rest_api/tour/tests/verdicts_test.rb:32:in `block (2 levels) in test_verdicts'
c:/Users/Burdette/Documents/GitHub/RubyTest/examples/rest_api/tour/tests/verdicts_test.rb:24:in `block in test_verdicts'
c:/Users/Burdette/Documents/GitHub/RubyTest/examples/rest_api/base_classes/base_class_for_test.rb:13:in `block (2 levels) in prelude'
c:/Users/Burdette/Documents/GitHub/RubyTest/examples/rest_api/example_rest_client.rb:18:in `block in with'
c:/Users/Burdette/Documents/GitHub/RubyTest/examples/rest_api/example_rest_client.rb:14:in `with'
c:/Users/Burdette/Documents/GitHub/RubyTest/examples/rest_api/base_classes/base_class_for_test.rb:12:in `block in prelude'
c:/Users/Burdette/Documents/GitHub/RubyTest/lib/helpers/test_helper.rb:23:in `block (2 levels) in test'
c:/Users/Burdette/Documents/GitHub/RubyTest/lib/helpers/test_helper.rb:22:in `block in test'
c:/Users/Burdette/Documents/GitHub/RubyTest/lib/helpers/test_helper.rb:21:in `test'
c:/Users/Burdette/Documents/GitHub/RubyTest/examples/rest_api/base_classes/base_class_for_test.rb:11:in `prelude'
c:/Users/Burdette/Documents/GitHub/RubyTest/examples/rest_api/tour/tests/verdicts_test.rb:6:in `test_verdicts']]>
              </backtrace>
            </exception>
          </verdict>
        </section>
      </section>
    </section>
  </test_method>
  <section name='Count of errors (unexpected exceptions)'>
    <verdict id='error count' message='error count' method='verdict_assert_equal?' outcome='passed' volatile='true'>
      <exp_value>0</exp_value>
      <act_value>0</act_value>
    </verdict>
  </section>
</verdicts_test>
```

Notes:

- A failed verdict logs an exception, including the message and backtrace.

[Prev](./Sections.md) [Next](./Volatility.md)