# name: discourse-isolation
# authors: gerhard, merefield
# about: Enables isolation mode after restoring backup.
# version: 0.1

after_initialize do
  on(:site_settings_restored) do
    SiteSetting.disable_emails = "yes"
    SiteSetting.pop3_polling_enabled = false
    WebHook.update_all(active: false)
  end
end
