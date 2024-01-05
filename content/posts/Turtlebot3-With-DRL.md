---
title : 'Turtlebot3 With DRL'
date : 2024-01-05T12:00:00+08:00
draft : false
author: ["ranqinghua"]
categories:
- Turtlebot3
math: true #启动公式
ShowWordCounts : true #统计字数
showToc: true # 显示目录
TocOpen: true # 自动展开目录
description: "搭建基于Turtlebot3的DRL仿真环境" # 文章描述，与搜索优化相关
summary: "搭建基于Turtlebot3的DRL仿真环境" # 文章简单描述，会展示在主页
---
> 基于Turtlebot3机器人进行一些仿真学习，主要是针对DRL方向，基于开源项目进行。   

# Turtlebot3安装

1. 在此已经默认已经安装好了ROS等相关内容，只需要安装Turtlebot3的相关依赖

   ```s
   sudo apt install ros-melodic-desktop-full ros-melodic-joy ros-melodic-teleop-twist-joy ros-melodic-teleop-twist-keyboard ros-melodic-laser-proc ros-melodic-rgbd-launch ros-melodic-depthimage-to-laserscan ros-melodic-rosserial-arduino ros-melodic-rosserial-python ros-melodic-rosserial-server ros-melodic-rosserial-client ros-melodic-rosserial-msgs ros-melodic-amcl ros-melodic-map-server ros-melodic-move-base ros-melodic-urdf ros-melodic-xacro ros-melodic-compressed-image-transport ros-melodic-rqt-image-view ros-melodic-gmapping ros-melodic-navigation ros-melodic-interactive-markers ros-melodic-turtlebot3-gazebo
   ```

2. 创建需要的工作空间，此处命名为catkin_ws

   ```s
   mkdir -p catkin_ws/src
   cd ~/catkin_ws/src/
   # 克隆相关的包
   git clone https://github.com/ROBOTIS-GIT/turtlebot3.git
   git clone https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
   git clone https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git
   cd ~/catkin_ws
   # 编译
   catkin_make
   ```

3. 设置相关的环境，将setup.bash文件写入.bashrc中，并添加Turtlebot3的模型(提供两种方式供选择)

   ```s
   # First
   sudo gedit .bashrc
   # 添加和修改内容
   source ~/catkin_ws/devel/setup.bash
   export TURTLEBOT3_MODEL = burger
   # 关闭.bashrc
   source .bashrc
   # Second
   echo "source  ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
   echo "export TURTLEBOT3_MODEL = burger" >> ~/.bashrc
   source .bashrc
   ```

4. 测试Turtlebot3是否安装成功（仿真测试）

   - 启动Gazebo仿真环境

     ```s
     roslaunch turtlebot3_gazebo turtlebot3_world.launch
     ```

     如出现如下错误：  
     {{< fancybox_figure align=center src="ttb3-drl-1.png" >}}   
     **解决如下：**在config.yaml文件中将servers下的url修改为https://api.ignitionrobotics.org，注意对齐。修改后保存，重启命令即可成功启动Gazebo。   
     ```bash
     sudo gedit ~/.ignition/fuel/config.yaml
     ```
     {{< fancybox_figure align=center src="ttb3-drl-2.png" >}}  
   - 启动SLAM

     ```s
     roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=gmapping
     ```   
   - 键盘控制

     ```s
     roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch
     ```

     注：如果出现没有**“rospkg”*则运行`pip install rospkg`即可。现在可以正常操作机器人进行建图。

   - 地图保存

     ```s
     rosrun map_server map_saver -f ~/map/map_name
     ```

   - 导航

     关闭以上所有终端，重新启动Gazebo环境，并运行导航节点：

     ```s
     roslaunch turtlebot3_navigation turtlebot3_navigation.launch map_file:=~/map/map_name.yaml
     ```
     {{< fancybox_figure align=center src="ttb3-drl-3.png" >}} 

     可以使用Rviz中的2D POSE Estimate进行初始的位置估计，等到位姿估计准确后，便可以用2D Nav Goal设置目标点的位姿，进行导航功能测试。
     {{< fancybox_figure align=center src="ttb3-drl-4.png" >}} 

     此时会根据起始位姿和终点位姿生成一条全局路径，也会在Turtlebot3的周围一定范围内进行局部路径规划，如上图所示。

# DRL环境搭建

> 系统为Ubuntu18.04，采用melodic的ros版本，当前版本支持Python2.7（到ubuntu20.04-neotic就支持Python3），而涉及到强化学习、深度学习部分大都以python3为主，因此要解决ros中关于两个不同版本的使用问题。**(目前已采用Ubuntu20.04)**

## 方法一：建立基于python2.7的pytorch环境

- 首先创建虚拟环境，并完成初始化

  ```
  conda create -n turtlebot3 python=2.7
  conda activate turtlebot3
  conda install numpy
  # 检测python版本
  python --version
  ```

- 安装ROS需要的包

  ```
  pip install catkin-tools
  pip install rospkg
  ```

- 安装Pytorch，详细参考[官网](https://pytorch.org/get-started/previous-versions/)，Python版本比较低，这个Pytorch可以使用

  ```
  pip install torch==1.4.0+cu92 torchvision==0.5.0+cu92 -f https://download.pytorch.org/whl/torch_stable.html
  ```

  测试Pytorch环境是否成功：

  ```
  # 进入python
  python
  torch.cuda.is_available()
  # 查看返回值 是否为 True 根据错误信息进行补充安装
  # 如下错误 根据错误修改即可
  pip install future 
  ```
  {{< fancybox_figure align=center src="ttb3-drl-5.png" >}} 
# Turtlebot3 with DDPG

> Code：[[Github](https://github.com/dovanhuong/project)]

1. 在catkin_ws/src下下载所需要的功能包，并进行重新编译，最后用VScode打开

   ```S
   cd ~/catkin_ws/src/
   # 克隆相关的包
   git clone https://github.com/dovanhuong/project.git
   cd ~/catkin_ws
   # 编译
   catkin_make
   # VScode
   code .
   ```

2. 修改Turtlebot3参数：

   ```S
   # 修改turtlebot3/turtlebot3_description/urdf/turtlebot3_burger.gazebo.xacro
   sudo gedit turtlebot3_burger.gazebo.xacro
   # 内容修改如下
   # 激光雷达可视化
   <xacro:arg name="laser_visual" default="false"/>   # Visualization of LDS. If you want to see LDS, set to `true`
   # 采样的数量
   <scan>
     <horizontal>
       <samples>360</samples> # The number of sample. Modify it to 10
       <resolution>1</resolution>
       <min_angle>0.0</min_angle>
       <max_angle>6.28319</max_angle>
     </horizontal>
   </scan>
   ```

3. 指定Python2.7编译运行ddpg_stage_1.py，在该文件开头加入如下代码

   ```s
   #! /usr/bin/env python2.7
   ```

4. 启动仿真环境，以stage_1为例

   ```s
   roslaunch project ddpg_stage_{number_of_stage}.launch
   ```
   {{< fancybox_figure align=center src="ttb3-drl-6.png" caption="ddpg_stage_1" >}} 

   1. 启动DDPG算法

      ```s
      roslaunch project ddpg_stage_{number_of_stage}.launch
      ```

      第一次可能会出现错误，可以根据错误对相关的库进行安装即可，比如

      ```s
      pip install pyyaml
      ```
      {{< fancybox_figure align=center src="ttb3-drl-7.png" >}} 

      最终运行效果如下：
      {{< fancybox_figure align=center src="turtlebot3_ddpg_state1.gif" caption="ddpg_stage_1" >}} 
      {{< fancybox_figure align=center src="turtlebot3_ddpg_state3.gif" caption="ddpg_stage_3" >}} 
      {{< fancybox_figure align=center src="turtlebot3_ddpg_state4.gif" caption="ddpg_stage_4" >}}          

以上都是训练的过程，训练结果与多方因素相关，需要深入研究代码和DDPG原理，后续根据需要进行修改。   

# Anaconda技巧

并不是每次都需要虚拟环境的，并且每次激活环境都需要输入对应命令，麻烦不够简单，为此提前在.bashrc中加入相应的`alias`命令。这样只需要在终端中输入`starte`即可激活anaconda虚拟环境，输入`turtlebot`即可进入turtlebot的虚拟环境中。

```s
sudo gedit .bashrc
alias turtlebot='source activate turtlebot'
alias close_env='conda deactivate'
# 需要注释前面关于conda initialize的内容
alias starte='source ~/anaconda3/bin/activate'
```
{{< fancybox_figure align=center src="ttb3-drl-8.png">}} 

# Reference
1. [Ubuntu18.04安装ROS Melodic+turtlebot3仿真配置](https://blog.csdn.net/longlongago2333/article/details/120986943#t16) 
2. [Python2.7与Python3版本兼容](https://blog.csdn.net/Cameron_Rin/article/details/117027106)
