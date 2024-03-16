#!/bin/bash

# 圖片位置路徑
IMGPATH=/mnt/c/Users/kawa/Desktop/pic

# 輸出圖片的資料夾名稱
OUTPUTNAME=output_dir

# 在 wsl 中要儲存輸出圖片的位置
OUTPUTDIR=$PWD/$OUTPUTNAME

# 使用第一個參數做為要處理的 input 圖片名稱

# 檢查是否只提供一個參數
if [ $# -ne 1 ]; then
    echo "Usage: bash $0 <IMAGENAME>"
    exit 1
fi

# 獲取檔案類型
file_type=$(file -b --mime-type "$IMGPATH/$1")

# 檢查檔案類型是否為圖片
if [[ $file_type == image/* ]]; then
    echo "通過圖片檢查"
else
    echo "The file $IMGPATH/$1 is not an image."
    exit 1
fi

# 通過以上檢查開始動作
echo "開始處理圖片"
mkdir -p $OUTPUTNAME

# 取第一個參數
docker run \
    --rm \
    -v $IMGPATH:/rembg \
    -v $OUTPUTDIR:/output_dir \
    danielgatis/rembg i $1 /output_dir/$1
