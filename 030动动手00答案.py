import os

all_files = os.listdir(os.curdir)   # 使用os.curdir表示当前目录更标准
type_dict = dict()                  #  初始化字典

for each_file in all_files:         #  使用迭代检验每一个文件
    if os.path.isdir(each_file):    # os.path.isdir(path) 判断指定路径是否存在且是一个目录
        type_dict.setdefault('文件夹', 0)  #setdefault给字典增加一个item，setdefault(k[,d])，返回k对应的value值，当k不在字典内时则返回d的值，如果d没提供则返回空；同时如果k不存在字典内时，将d作为value映射给k
        type_dict['文件夹'] += 1
    else:
        ext = os.path.splitext(each_file)[1]#splitext(path)分离文件名与扩展名,返回(f_path,f_name)元组
        type_dict.setdefault(ext, 0)
        type_dict[ext] += 1

for each_type in type_dict.keys():
    print('该文件夹下共有类型为【%s】的文件 %d 个' % (each_type, type_dict[each_type]))
