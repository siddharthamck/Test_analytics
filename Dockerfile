FROM python:3

COPY requirements.txt ./

COPY my_book.ipynb ./

RUN pip3 install --no-cache-dir -r requirements.txt

EXPOSE 8081

ENTRYPOINT [ "sh", "-c"]


