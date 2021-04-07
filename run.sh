docker rmi --force diagnoser
docker build -t diagnoser .
docker run diagnoser