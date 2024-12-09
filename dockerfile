FROM ubuntu

WORKDIR /src

RUN apt-get update
RUN apt-get -y install python3
RUN apt-get -y install python3-tk

RUN apt-get install -y xorg dbus x11-apps

ENV DISPLAY=host.docker.internal:0

COPY notepad.py ./notepad.py

CMD ["python3", "notepad.py", "Notepad"]