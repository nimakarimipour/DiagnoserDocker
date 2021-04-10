docker rmi --force diagnoser
docker build --no-cache -t diagnoser .
docker run diagnoser