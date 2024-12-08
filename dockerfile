FROM ubuntu

WORKDIR /src

# Cập nhật và cài đặt Python cùng với thư viện Tkinter (hoặc các thư viện GUI khác)
RUN apt-get update
RUN apt-get -y install python3
RUN apt-get -y install python3-tk

# Cài đặt các phần mềm hỗ trợ X11 (để chuyển tiếp giao diện đồ họa)
RUN apt-get install -y xorg dbus x11-apps

# Cấu hình môi trường DISPLAY để chuyển tiếp đến X Server trên Windows
ENV DISPLAY=host.docker.internal:0

# Sao chép mã nguồn của ứng dụng vào container
COPY notepad.py ./notepad.py

# Lệnh chạy ứng dụng
CMD ["python3", "notepad.py", "Notepad"]