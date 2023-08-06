FROM ubuntu:20.04
RUN apt update
RUN apt install -y ruby-full
RUN apt-get install -y build-essential zlib1g-dev
RUN gem update --system
RUN gem install sass-embedded -v 1.63.3
RUN gem install jekyll bundler

ENV HOME=/home/user
ENV GEM_HOME=/home/user/gems
ENV PATH=/home/user/gems/bin:$PATH
EXPOSE 4000
RUN ruby --version
RUN gem --version
WORKDIR /home/user/
RUN mkdir -p /home/user/online-cv
COPY . /home/user/online-cv/
RUN jekyll new online-cv
RUN ls /home/user
WORKDIR /home/user/online-cv

CMD [ "bundle", "exec", "jekyll", "serve", "--force_polling", "-H", "0.0.0.0", "-P", "4000" ]