import Config

# Set ports based on environment variables in the release,
# fall back to ports defined in config (for dev and test)
http_default = Application.get_env(:my_app, MyAppWeb.Endpoint)[:http][:port] || 4000
https_default = Application.get_env(:my_app, MyAppWeb.Endpoint)[:https][:port] || 4040

config :my_app, MyAppWeb.Endpoint,
  http: [port: String.to_integer(System.get_env("HTTP_PORT", http_default))],
  https: [port: String.to_integer(System.get_env("HTTPS_PORT", https_default))]
