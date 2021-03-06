require_relative '../../../lib/base_classes/base_class_for_data'
require_relative '../../../lib/helpers/object_helper'

class BaseClassForResource < BaseClassForData

  Contract ApiClient => Bool
  # RubyMine cannot find RestClient::NotFound
  # noinspection RubyResolve
  def exist?(client)
    begin
      read(client)
      return true
    rescue
      return false
    end
  end

  Contract ApiClient, Log, VERDICT_ID => Bool
  def verdict_assert_exist?(client, log, verdict_id)
    log.va?(verdict_id, exist?(client))
  end
  alias va_exist? verdict_assert_exist?

  Contract ApiClient, Log, VERDICT_ID => Bool
  def verdict_refute_exist?(client, log, verdict_id)
    log.vr?(verdict_id, exist?(client))
  end
  alias vr_exist? verdict_refute_exist?

  Contract ApiClient => Bool
  def delete_if_exist?(client)
    if exist?(client)
      delete(client)
      return true
    end
    false
  end

  Contract ApiClient => self
  def self.get_first(client)
    all = self.get_all(client)
    raise RuntimeError.new('No %s available' % self.name) unless all.size > 0
    all.first
  end

end