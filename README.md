lab1

1、在内核中实现函数调用堆栈跟踪函数。
......
ebp:0x00007b28	eip:0x00100992	args:0x00010094	0x00010094	0x00007b58	0x00100096
				kern/debug/kdebug.c:305:	print_stackframe+22
ebp:0x00007b38	eip:0x00100c79	args:0x00000000	0x00000000	0x00000000	0x00007ba8
				kern/debug/kmonitor.c:125:	mon_backtrace+10
ebp:0x00007b58	eip:0x00100096	args:0x00000000	0x00007b80	0xffff0000	0x00007b84
				kern/init/init.c:48:	grade_backtrace2+33
ebp:0x00007b78	eip:0x001000bf	args:0x00000000	0xffff0000	0x00007ba4	0x00000029
				kern/init/init.c:53:	grade_backtrace1+38
ebp:0x00007b98	eip:0x001000dd	args:0x00000000	0x00100000	0xffff0000	0x0000001d
				kern/init/init.c:58:	grade_backtrace0+23
ebp:0x00007bb8	eip:0x00100102	args:0x0010353c	0x00103520	0x00001308	0x00000000
				kern/init/init.c:63:	grade_backtrace+34
ebp:0x00007be8	eip:0x00100059	args:0x00000000	0x00000000	0x00000000	0x00007c53
				kern/init/init.c:28:	kern_init+88
ebp:0x00007bf8	eip:0x00007d73	args:0xc031fcfa	0xc08ed88e	0x64e4d08e	0xfa7502a8
<unknow>:	--	0x00007d72	–
......

2、完善中断初始化和处理程序

challenge 1：

增加syscall功能,即增加一用户态函数(可执行一特定系统调用:获得时钟计数值),当内核初始完毕后,可从内
核态返回到用户态的函数,而用户态的函数又通过系统调用得到内核态的服务。

challenge 2:

用键盘实现用户模式内核模式切换。具体目标是:“键盘输入3时切换到用户模式,键盘输入0时切换到内核模式”。	基本思路
是借鉴软中断(syscall功能)的代码,并且把trap.c中软中断处理的设置语句拿过来。
