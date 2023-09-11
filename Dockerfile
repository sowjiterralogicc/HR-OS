FROM python:3.11-slim
WORKDIR /app
RUN apt-get update && apt-get install -y git
#RUN git clone https://github.com/sowjiterralogicc/repos_test.git
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/sowjiterralogicc/repos_test.git /app/HR-OS
RUN ls -la /app/repos_test  # Print the contents of the cloned directory
WORKDIR /app/HR-OS
RUN apt-get install -y libmariadb-dev pkg-config gcc
EXPOSE 8080
CMD ["python", "app.py"]
