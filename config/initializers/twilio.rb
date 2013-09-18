# Load Twilio account keys from environment variables, in this case we are using Figaro to set them.
# Run rake firago:heroku to push kets to heroku

TWILIO_SID =        ENV["TWILIO_SID"]
TWILIO_AUTH_TOKEN = ENV["TWILIO_AUTH_TOKEN"]

# Alternatively, this could look like:
# TWILIO_SID =        Figaro.env.twilio_sid
# TWILIO_AUTH_TOKEN = Figaro.env.twilio_auth_token