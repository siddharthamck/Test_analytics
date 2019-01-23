FROM python:3

COPY requirements.txt ./

RUN pip3 install --upgrade pip

RUN pip3 install --no-cache-dir -r requirements.txt

COPY my_book.ipynb ./

COPY entrypoint.sh ./

EXPOSE 8081

RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]



