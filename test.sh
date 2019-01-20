#!/bin/bash
# 查找脚本所在路径，并进入
#DIR="$( cd "$( dirname "$0"  )" && pwd  )"
DIR=$PWD
cd $DIR
echo current dir is $PWD

# 设置目录，避免module找不到的问题
export PYTHONPATH=$PYTHONPATH:$DIR:$DIR/slim:$DIR/object_detection

# 定义各目录
output_dir=./output  # 训练目录
dataset_dir=./data # 数据集目录，这里是写死的，记得修改

train_dir=$output_dir/train
checkpoint_dir=$train_dir
eval_dir=$output_dir/eval

# config文件
config=pipeline.config
pipeline_config_path=$output_dir/$config

# 先清空输出目录，本地运行会有效果，tinymind上运行这一行没有任何效果
# tinymind已经支持引用上一次的运行结果，这一行需要删掉，不然会出现上一次的运行结果被清空的状况。
# rm -rvf $output_dir/*

# 在test.jpg上验证导出的模型
python3 ./inference.py --output_dir=$output_dir --dataset_dir=$dataset_dir