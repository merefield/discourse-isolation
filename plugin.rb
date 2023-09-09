# name: discourse-isolation
# authors: gerhard, merefield
# about: Enables isolation mode after restoring backup.
# version: 0.3
# url: https://github.com/merefield/discourse-isolation

after_initialize do
  on(:site_settings_restored) do # fork and configure how you see fit
    SiteSetting.disable_emails = "yes" # prevent all outgoing email traffic
    SiteSetting.login_required = true # block anon access so site is completely private
    SiteSetting.pop3_polling_enabled = false # disable polling for incoming mail
    WebHook.update_all(active: false) # prevent Discourse from triggering webhooks
  end
end
