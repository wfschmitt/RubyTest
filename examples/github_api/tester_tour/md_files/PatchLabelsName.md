<!--- GENERATED FILE, DO NOT EDIT --->
**Prev Stop:** [GetLabelsName Test](./GetLabelsName.md#getlabelsname-test)

**Next Stop:** [DeleteLabelsName Test](./DeleteLabelsName.md#deletelabelsname-test)


# PatchLabelsName Test

## Example Test

<code>patch_labels_name_test.rb</code>
```ruby
require_relative '../../base_classes/base_class_for_test'

require_relative '../../endpoints/labels/patch_labels_name'

class PatchLabelsNameTest < BaseClassForTest

  def test_patch_labels_name

    prelude do |client, log|

      log.section('Test PatchLabelsName') do
        label_to_create = Label.new(
            :id => nil,
            :url => nil,
            :name => 'test_label',
            :color => '000000',
            :default => false,
        )
        Label.delete_if_exist?(client, label_to_create)
        label_to_patch = Label.create(client, label_to_create)
        label_to_patch.color = 'ffffff'
        PatchLabelsName.verdict_call_and_verify_success(client, 'patch label', label_to_patch)
        Label.delete_if_exist?(client, label_to_patch)
      end

    end

  end

end
```

This test a test for endpoint `PATCH /labels/:name`, which updates a label.

Notes:

- Class `PatchLabelsName` encapsulates the endpoint.
- Its method `verdict_call_and_verify_success`:
  - Accepts the client, a verdict id, and the label to be patched.
  - Accesses the endpoint.
  - Forms the returned data into a `Label` object.
  - Performs verifications on the label object.
  - Returns the label object.

## Log

<code>test_patch_labels_name.xml</code>
```xml
<patch_labels_name_test>
  <summary errors='0' failures='0' verdicts='11'/>
  <test_method name='patch_labels_name_test' timestamp='2017-10-29-Sun-05.56.57.782'>
    <section duration_seconds='3.607' name='With GithubClient'>
      <section name='Test PatchLabelsName'>
        <GithubClient method='GET' url='https://api.github.com/repos/BurdetteLamar/CrashDummy/labels/test_label'>
          <execution duration_seconds='1.762' timestamp='2017-10-29-Sun-05.56.57.782'/>
        </GithubClient>
        <GithubClient method='POST' url='https://api.github.com/repos/BurdetteLamar/CrashDummy/labels'>
          <parameters color='000000' name='test_label'/>
          <execution duration_seconds='0.349' timestamp='2017-10-29-Sun-05.56.59.548'/>
        </GithubClient>
        <section name='patch label' timestamp='2017-10-29-Sun-05.56.59.898'>
          <GithubClient method='PATCH' url='https://api.github.com/repos/BurdetteLamar/CrashDummy/labels/test_label'>
            <parameters color='ffffff'/>
            <execution duration_seconds='0.333' timestamp='2017-10-29-Sun-05.56.59.901'/>
          </GithubClient>
          <section name='Evaluation'>
            <section name='Returned label correct'>
              <verdict id='patch label updated label-id' message='Updated label correct' method='verdict_assert_equal?' outcome='passed' volatile='false'>
                <exp_value>734249580</exp_value>
                <act_value>734249580</act_value>
              </verdict>
              <verdict id='patch label updated label-url' message='Updated label correct' method='verdict_assert_equal?' outcome='passed' volatile='false'>
                <exp_value>https://api.github.com/repos/BurdetteLamar/CrashDummy/labels/test_label</exp_value>
                <act_value>https://api.github.com/repos/BurdetteLamar/CrashDummy/labels/test_label</act_value>
              </verdict>
              <verdict id='patch label updated label-name' message='Updated label correct' method='verdict_assert_equal?' outcome='passed' volatile='false'>
                <exp_value>test_label</exp_value>
                <act_value>test_label</act_value>
              </verdict>
              <verdict id='patch label updated label-color' message='Updated label correct' method='verdict_assert_equal?' outcome='passed' volatile='false'>
                <exp_value>ffffff</exp_value>
                <act_value>ffffff</act_value>
              </verdict>
              <verdict id='patch label updated label-default' message='Updated label correct' method='verdict_assert_equal?' outcome='passed' volatile='false'>
                <exp_value>false</exp_value>
                <act_value>false</act_value>
              </verdict>
            </section>
            <section name='Label updated'>
              <GithubClient method='GET' url='https://api.github.com/repos/BurdetteLamar/CrashDummy/labels/test_label'>
                <execution duration_seconds='0.342' timestamp='2017-10-29-Sun-05.57.00.234'/>
              </GithubClient>
              <verdict id='patch label fetched label-id' message='Fetched label correct' method='verdict_assert_equal?' outcome='passed' volatile='false'>
                <exp_value>734249580</exp_value>
                <act_value>734249580</act_value>
              </verdict>
              <verdict id='patch label fetched label-url' message='Fetched label correct' method='verdict_assert_equal?' outcome='passed' volatile='false'>
                <exp_value>https://api.github.com/repos/BurdetteLamar/CrashDummy/labels/test_label</exp_value>
                <act_value>https://api.github.com/repos/BurdetteLamar/CrashDummy/labels/test_label</act_value>
              </verdict>
              <verdict id='patch label fetched label-name' message='Fetched label correct' method='verdict_assert_equal?' outcome='passed' volatile='false'>
                <exp_value>test_label</exp_value>
                <act_value>test_label</act_value>
              </verdict>
              <verdict id='patch label fetched label-color' message='Fetched label correct' method='verdict_assert_equal?' outcome='passed' volatile='false'>
                <exp_value>ffffff</exp_value>
                <act_value>ffffff</act_value>
              </verdict>
              <verdict id='patch label fetched label-default' message='Fetched label correct' method='verdict_assert_equal?' outcome='passed' volatile='false'>
                <exp_value>false</exp_value>
                <act_value>false</act_value>
              </verdict>
            </section>
          </section>
          <GithubClient method='GET' url='https://api.github.com/repos/BurdetteLamar/CrashDummy/labels/test_label'>
            <execution duration_seconds='0.329' timestamp='2017-10-29-Sun-05.57.00.582'/>
          </GithubClient>
          <GithubClient method='DELETE' url='https://api.github.com/repos/BurdetteLamar/CrashDummy/labels/test_label'>
            <execution duration_seconds='0.473' timestamp='2017-10-29-Sun-05.57.00.915'/>
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
</patch_labels_name_test>
```

Notes:

- In section `Evaluation`:
  - Section `Returned label correct` verifies the returned label.
  - Section `Label updated` verifies that the label was updated.

**Prev Stop:** [GetLabelsName Test](./GetLabelsName.md#getlabelsname-test)

**Next Stop:** [DeleteLabelsName Test](./DeleteLabelsName.md#deletelabelsname-test)
