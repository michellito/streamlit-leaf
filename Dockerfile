FROM python:3.9

RUN apt-get update && apt-get install -y \
	python3-opencv python3-dev zbar-tools

RUN pip install torch==1.10.2 torchvision==0.11.3 -f https://download.pytorch.org/whl/cu111/torch_stable.html
RUN pip install 'git+https://github.com/facebookresearch/fvcore'

# install detectron2
RUN git clone https://github.com/facebookresearch/detectron2 detectron2_repo

RUN pip install -e detectron2_repo

COPY . .
RUN pip install -r requirements.txt
EXPOSE 8501

ENTRYPOINT ["streamlit", "run"]

CMD ["app.py"]
