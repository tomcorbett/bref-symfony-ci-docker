# base image of PHP 7.4 and node 12
FROM thecodingmachine/php:7.4-v3-cli-node12

# install zip/unzip
RUN sudo apt-get update && sudo apt-get install -y zip unzip

# download AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip

# install AWS CLI for pushing assets
RUN sudo ./aws/install

# cleanup zip
RUN rm awscliv2.zip

# install yarn for using encore
RUN yarn install

# install serverless so we can deploy
RUN sudo npm install -g serverless