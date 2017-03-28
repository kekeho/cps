# CPS
Easy to set the CPU frequency
## Usage:
```
cps low :       Set cpu frequency low (@ 800Mhz). CpuFan will be quiet.
cps max :       Set cpu frequency max. there is no limmit.
cps [number] :  Set cpu frequency [number]Ghz.
cps now :       See your cpu frequency at now
cps --help :    THIS IS IT (by Michael Jackson)
```

# Japanese:
- - - - 
CPUの周波数を`max`か`low`で簡単に設定して、ファンの音を抑えたり出来ます。  
任意の数字を入力して適当な値を設定することも可能。  

- 必須アプリ
    cpufreq  
    > `sudo apt-get install cpufreq`してインストールしておきましょう。

# English:
- - - -
You can easily set the frequency of the CPU with `max` or `low` to suppress the sound of the fan.  
It is also possible to enter an arbitrary number and set an appropriate value.  

- Required application
    cpufreq  
    > install command: `sudo apt-get install cpufreq`
