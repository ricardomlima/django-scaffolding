# Assuming Python 3
FROM python:3

# Copy just the needed files to install your dependencies
COPY requirements.txt /home

# Directory inside the container where your app code will live.
# You probably won't need to change this
WORKDIR /home

# Now install dependencies. It's good to do this before copying the rest of the code
# so we take advantage of caching a docker layer that has the dependencies installed
# independently on whether the rest of the code changes.
RUN pip install -r requirements.txt

COPY ./app /home

# This will export the PORT environment variable to your application.
# It has 12345 as a default value, but when running the container we might pass
# any other port. You shouldn't change this unless you really know what you are doing.
ENV PORT 8000


# Avoid buffering the output from Python so
# the container shows the output in real-time
ENV PYTHONUNBUFFERED=1

# This will export the HOST environment variable
ENV HOST 0.0.0.0

# Avoid changing this too; it will expose the port so
# other containers can connect to your app.
EXPOSE $PORT

# Finally, tell the container how to run your app
# Binding to 0.0.0.0 is important so this container can receive requests from the
# network and not only from localhost (the tests will run in another container).
# Alternatively, you can configure ALLOWED_HOSTS using the HOST env variable we will
# also include when running the container
CMD python manage.py runserver $HOST:$PORT