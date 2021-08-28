import Config

config :kowch, KowchWeb.Endpoint,
  http: [port: 3000],
  server: true

config :phoenix, :json_library, Jason

import_config "#{config_env()}.exs"
