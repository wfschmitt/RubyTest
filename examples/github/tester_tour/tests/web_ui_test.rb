require_relative '../../base_classes/base_class_for_test'

require_relative '../../data/label'

require_relative '../../ui/pages/labels_page'

class WebUiTest < BaseClassForTest

  def test_web_ui

    prelude do |log|

      with_ui_client(log) do |ui_client|

        label_to_create = nil

        ui_client.login
        labels_page = LabelsPage.new(ui_client).visit

        log.section('Create label') do
          label_to_create = Label.provisioned
          # The value for field :default is not available in the web UI.
          label_to_create.default = nil
          labels_page.create_label!(label_to_create)
          labels_page.wait_for_label(label_to_create)
          labels_page.verdict_assert_exist?(log, :label_created, label_to_create)
        end

        log.section('Read label') do
          label_to_read = label_to_create
          label_read = labels_page.read_label(label_to_read)
          Label.verdict_equal?(log, :label_read, label_to_read, label_read)
        end

        label_source = nil
        log.section('Update label') do
          label_source = label_to_create.perturb
          # The value for field :default is not available in the web UI.
          label_source.default = nil
          labels_page.update_label(label_to_create, label_source)
          labels_page.wait_for_label(label_source)
          labels_page.verdict_assert_exist?(log, :label_updated, label_source)
        end

        log.section('Delete label') do
          label_to_delete = label_source
          labels_page.delete_label(label_to_delete)
          ui_client.browser.refresh
          labels_page.verdict_refute_exist?(log, :label_deleted, label_to_delete)
        end

      end
    end
  end

end