# Start from the official Ruby image
FROM ruby:3.2.3

# Install Node.js and Yarn (needed for Rails asset compilation)
RUN apt-get update -qq && apt-get install -y nodejs sqlite3 yarn

# Set the working directory
WORKDIR /library

# Add the Gemfile and Gemfile.lock to the image
COPY Gemfile /library/Gemfile
COPY Gemfile.lock /library/Gemfile.lock

# Install gems
RUN bundle install

# Assets
RUN rails assets:precompile

# Copy the rest of the application into the image
COPY . /library

# Expose the port that the Rails server will run on
EXPOSE 3000

# Define the command to start the server
CMD ["rails", "server", "-b", "0.0.0.0"]