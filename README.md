	i) Build the Docker container image
	docker build -t nodejs-sample .

    ii)  Tag the image
	docker tag nodejs-sample:latest xxxxxxxxxx.dkr.ecr.us-east-1.amazonaws.com/nodejs-sample:latest

   iii)  Authenticate Docker to ECR
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin xxxxxxxxxxxx.dkr.ecr.us-east-1.amazonaws.com

  iv)  Push the Docker image
docker push xxxxxxxxxxxxxx.dkr.ecr.us-east-1.amazonaws.com/dev-cymbiose-backend:latest
