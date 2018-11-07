FROM python:3

COPY requirements.txt ./

RUN pip3 install --no-cache-dir -r requirements.txt

COPY my_book.ipynb ./

COPY entrypoint.sh ./

EXPOSE 8082  

ENTRYPOINT ["jupyter-notebook", "--allow-root", "--ip=0.0.0.0", "--port=8082"]



