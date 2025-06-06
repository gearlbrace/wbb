FROM python:3.12-slim-bullseye

WORKDIR /wbb
RUN chmod 777 /wbb

RUN apt-get -qq update && apt-get -qq -y upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y git gcc build-essential zip

RUN pip3 install -U pip
COPY requirements.txt .
RUN pip3 install --no-cache-dir -U -r requirements.txt

# If u want to use /update feature, uncomment the following and edit
#RUN git config --global user.email "your_email"
#RUN git config --global user.name "git_username"

# Copying All Source
COPY . .
RUN mv mongodb-database-tools/* /usr/local/bin && rmdir mongodb-database-tools

# Starting Bot
CMD ["python3", "-m", "wbb"]
