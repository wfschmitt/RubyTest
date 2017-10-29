<!--- GENERATED FILE, DO NOT EDIT --->
**Prev Stop:** [GetLabels Test](./GetLabels.md#getlabels-test)

**Next Stop:** [GetLabelsName Test](./GetLabelsName.md#getlabelsname-test)


# PostLabels Test

This is a test for endpoint `POST /labels`, which creates a label.

## Example Test

<code>post_labels_test.rb</code>
```ruby
require_relative '../../base_classes/base_class_for_test'

require_relative '../../endpoints/labels/post_labels'

class PostLabelsTest < BaseClassForTest

  def test_post_labels

    prelude do |client, log|

      label_to_create = Label.new(
          :id => nil,
          :url => nil,
          :name => 'test_label',
          :color => '000000',
          :default => false,
      )
      log.section('Test PostLabels') do
        Label.delete_if_exist?(client, label_to_create)
        PostLabels.verdict_call_and_verify_success(client, 'create label', label_to_create)
      end
      log.section('Clean up') do
        Label.delete_if_exist?(client, label_to_create)
      end

    end

  end

end
```

Notes:

- The test calls method `Label.delete_if_exist?` before the creation, to avoid collision with an existing label.
- Class `PostLabels` encapsulates endpoint `POST /labels`.
- Its method `PostLabels.verdict_call_and_verify_success`:
  - Accepts the client, a verdict id, and the label to be created.
  - Accesses the endpoint.
  - Forms the returned data into a `Label` object.
  - Performs verifications on the label object.
  - Returns the label object.
- The test calls method `Label.delete_if_exist?` after the creation, to clean up.

## Log

<code>test_post_labels.xml</code>
```xml
<post_labels_test>
  <summary errors='0' failures='0' verdicts='11'/>
  <test_method name='post_labels_test' timestamp='2017-10-29-Sun-05.56.49.083'>
    <section duration_seconds='3.324' name='With GithubClient'>
      <section name='Test PostLabels'>
        <GithubClient method='GET' url='https://api.github.com/repos/BurdetteLamar/CrashDummy/labels/test_label'>
          <execution duration_seconds='1.827' timestamp='2017-10-29-Sun-05.56.49.103'/>
        </GithubClient>
        <section name='create label' timestamp='2017-10-29-Sun-05.56.50.930'>
          <GithubClient method='POST' url='https://api.github.com/repos/BurdetteLamar/CrashDummy/labels'>
            <parameters color='000000' name='test_label'/>
            <execution duration_seconds='0.362' timestamp='2017-10-29-Sun-05.56.50.933'/>
          </GithubClient>
          <section name='Evaluation'>
            <section name='Returned label correct'>
              <verdict id='create label name' message='Label name' method='verdict_assert_equal?' outcome='passed' volatile='false'>
                <exp_value>test_label</exp_value>
                <act_value>test_label</act_value>
              </verdict>
              <verdict id='create label color' message='Label color' method='verdict_assert_equal?' outcome='passed' volatile='false'>
                <exp_value>000000</exp_value>
                <act_value>000000</act_value>
              </verdict>
            </section>
            <section name='Returned label valid'>
              <section name='verdict_assert_integer_positive?'>
                <verdict id='create label valid id - integer' message='id is positive integer' method='verdict_assert_kind_of?' outcome='passed' volatile='false'>
                  <exp_value>Integer</exp_value>
                  <act_value>734249521</act_value>
                </verdict>
                <verdict id='create label valid id - positive' message='id is positive integer' method='verdict_assert_operator?' outcome='passed' volatile='false'>
                  <object_1>734249521</object_1>
                  <operator>:&gt;</operator>
                  <object_2>0</object_2>
                </verdict>
              </section>
              <verdict id='create label valid url' message='url starts with' method='verdict_assert_match?' outcome='passed' volatile='false'>
                <exp_value>/^https:\/\/api.github.com\/repos/</exp_value>
                <act_value>https://api.github.com/repos/BurdetteLamar/CrashDummy/labels/test_label</act_value>
              </verdict>
              <section name='verdict_assert_string_not_empty?'>
                <verdict id='create label valid name - string' message='name is nonempty string' method='verdict_assert_kind_of?' outcome='passed' volatile='false'>
                  <exp_value>String</exp_value>
                  <act_value>test_label</act_value>
                </verdict>
                <verdict id='create label valid name - not empty' message='name is nonempty string' method='verdict_refute_empty?' outcome='passed' volatile='false'>
                  <act_value>test_label</act_value>
                </verdict>
              </section>
              <verdict id='create label valid color' message='color is hex color' method='verdict_assert_match?' outcome='passed' volatile='false'>
                <exp_value>/[0-9a-f]{6}/i</exp_value>
                <act_value>000000</act_value>
              </verdict>
              <verdict id='create label valid default' message='default is boolean' method='verdict_assert_includes?' outcome='passed' volatile='false'>
                <exp_value>[TrueClass, FalseClass]</exp_value>
                <act_value>FalseClass</act_value>
              </verdict>
            </section>
            <section name='Label created'>
              <GithubClient method='GET' url='https://api.github.com/repos/BurdetteLamar/CrashDummy/labels/test_label'>
                <execution duration_seconds='0.367' timestamp='2017-10-29-Sun-05.56.51.305'/>
              </GithubClient>
              <verdict id='create label exists' message='Label exists' method='verdict_assert?' outcome='passed' volatile='false'>
                <act_value>true</act_value>
              </verdict>
            </section>
          </section>
        </section>
        <section name='Clean up'>
          <GithubClient method='GET' url='https://api.github.com/repos/BurdetteLamar/CrashDummy/labels/test_label'>
            <execution duration_seconds='0.342' timestamp='2017-10-29-Sun-05.56.51.672'/>
          </GithubClient>
          <GithubClient method='DELETE' url='https://api.github.com/repos/BurdetteLamar/CrashDummy/labels/test_label'>
            <execution duration_seconds='0.372' timestamp='2017-10-29-Sun-05.56.52.034'/>
          </GithubClient>
        </section>
      </section>
    </section>
    <section name='Count of errors (unexpected exceptions)'>
      <verdict id='error count' message='error count' method='verdict_assert_equal?' outcome='passed' volatile='true'>
        <exp_value>0</exp_value>
        <act_value>0</act_value>
      </verdict>
    </section>
  </test_method>
</post_labels_test>
```

Notes:

- Section `GithubClient` shows the endpoint access, including the parameters.
- In section `Evaluation`:
  - Section `Returned label correct` verifies the created label: `:name` and `:color`.
  - Section `Returned label valid` validates the created label: all fields.
  - Section `Label exists` fetches the new label and verifies all its fields.

**Prev Stop:** [GetLabels Test](./GetLabels.md#getlabels-test)

**Next Stop:** [GetLabelsName Test](./GetLabelsName.md#getlabelsname-test)
