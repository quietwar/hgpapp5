# hgp_App5.app_id = ENV["MY_APP_ID"]
# Hgp_App5.key = ENV["MY_APP_KEY"]
# Hgp_App5.secret = ENV["MY_APP_SECRET"]
# api_key: AIzaSyB49uC_ZAuE5ef0ouy5DuVJ1qroP7qN6Ss
#
# # Environmental secrets are only available for that specific environment.
#
# development:
#   secret_key_base: 1783c597c0a466191edee0d07839c1d2240de63b1e4d41f2bde67d0771a859e4c9a92db198fe982d7359681ed23d741d5e79c28a5ede7c86f8818b8955810c79
#   google_client_id: 542001295987-2c25ggf2nr758jd99an6umt16ceou1b4.apps.googleusercontent.com
#   google_client_secret: xFv13v2FEtdUW8vSUJudX9CO
#   mail_username: hodari@hiddengeniusproject.org
#   mail_password: kittycat76
# test:
#   secret_key_base: ee2b799a25718cc52516c29fa2ed8b239b9cd65124d3ffd02f5e72922b178dca9adf0a08f9ceb29ff93c786c427f02e4af297b9946f69548bbf5454613f95c3c
#
# # Do not keep production secrets in the unencrypted secrets file.
# # Instead, either read values from the environment.
# # Or, use `bin/rails secrets:setup` to configure encrypted  secrets
# # and move the `production:` environment over there.
#
# production:
#   secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>
