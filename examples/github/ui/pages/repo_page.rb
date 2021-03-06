require_relative '../base_classes/base_class_for_page'

class RepoPage < BaseClassForPage

  LOCATORS = {}

  Contract UiClient => nil
  def initialize(ui_client)
    relative_url = File.join(ui_client.username, ui_client.repo_name)
    super(ui_client, relative_url, LOCATORS)
  end

end
