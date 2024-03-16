# source
* https://github.com/danielgatis/rembg#usage-as-a-docker

# img path
* windows 10 下的資料夾路徑轉換成 wsl 中的路徑對照
```shell
# C:\Users\kawa\Desktop\pic
/mnt/c/Users/kawa/Desktop/pic
```

# 用法
* 先設定好 app.sh 中的圖片路徑資料夾 & 儲存資料夾名稱
```shell
# 先使用以下指令建立 rembg server
docker-compose up -d

# 等待 server 建立完成後(大概 30s)

# 再使用以下指令即可簡單去背
bash app.sh IMAGENAME
```
