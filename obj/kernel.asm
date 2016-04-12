
bin/kernel：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 28             	sub    $0x28,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100006:	ba 40 fd 10 00       	mov    $0x10fd40,%edx
  10000b:	b8 16 ea 10 00       	mov    $0x10ea16,%eax
  100010:	29 c2                	sub    %eax,%edx
  100012:	89 d0                	mov    %edx,%eax
  100014:	89 44 24 08          	mov    %eax,0x8(%esp)
  100018:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10001f:	00 
  100020:	c7 04 24 16 ea 10 00 	movl   $0x10ea16,(%esp)
  100027:	e8 43 32 00 00       	call   10326f <memset>

    cons_init();                // init the console
  10002c:	e8 3a 15 00 00       	call   10156b <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  100031:	c7 45 f4 00 34 10 00 	movl   $0x103400,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100038:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10003b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10003f:	c7 04 24 1c 34 10 00 	movl   $0x10341c,(%esp)
  100046:	e8 c7 02 00 00       	call   100312 <cprintf>

    print_kerninfo();
  10004b:	e8 f6 07 00 00       	call   100846 <print_kerninfo>

    grade_backtrace();
  100050:	e8 86 00 00 00       	call   1000db <grade_backtrace>

    pmm_init();                 // init physical memory management
  100055:	e8 5b 28 00 00       	call   1028b5 <pmm_init>

    pic_init();                 // init interrupt controller
  10005a:	e8 4f 16 00 00       	call   1016ae <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005f:	e8 a1 17 00 00       	call   101805 <idt_init>

    clock_init();               // init clock interrupt
  100064:	e8 f5 0c 00 00       	call   100d5e <clock_init>
    intr_enable();              // enable irq interrupt
  100069:	e8 ae 15 00 00       	call   10161c <intr_enable>
    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    //lab1_switch_test();

    /* do nothing */
    while (1);
  10006e:	eb fe                	jmp    10006e <kern_init+0x6e>

00100070 <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100070:	55                   	push   %ebp
  100071:	89 e5                	mov    %esp,%ebp
  100073:	83 ec 18             	sub    $0x18,%esp
    mon_backtrace(0, NULL, NULL);
  100076:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  10007d:	00 
  10007e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  100085:	00 
  100086:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10008d:	e8 fe 0b 00 00       	call   100c90 <mon_backtrace>
}
  100092:	c9                   	leave  
  100093:	c3                   	ret    

00100094 <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  100094:	55                   	push   %ebp
  100095:	89 e5                	mov    %esp,%ebp
  100097:	53                   	push   %ebx
  100098:	83 ec 14             	sub    $0x14,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  10009b:	8d 5d 0c             	lea    0xc(%ebp),%ebx
  10009e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1000a1:	8d 55 08             	lea    0x8(%ebp),%edx
  1000a4:	8b 45 08             	mov    0x8(%ebp),%eax
  1000a7:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  1000ab:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  1000af:	89 54 24 04          	mov    %edx,0x4(%esp)
  1000b3:	89 04 24             	mov    %eax,(%esp)
  1000b6:	e8 b5 ff ff ff       	call   100070 <grade_backtrace2>
}
  1000bb:	83 c4 14             	add    $0x14,%esp
  1000be:	5b                   	pop    %ebx
  1000bf:	5d                   	pop    %ebp
  1000c0:	c3                   	ret    

001000c1 <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000c1:	55                   	push   %ebp
  1000c2:	89 e5                	mov    %esp,%ebp
  1000c4:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace1(arg0, arg2);
  1000c7:	8b 45 10             	mov    0x10(%ebp),%eax
  1000ca:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000ce:	8b 45 08             	mov    0x8(%ebp),%eax
  1000d1:	89 04 24             	mov    %eax,(%esp)
  1000d4:	e8 bb ff ff ff       	call   100094 <grade_backtrace1>
}
  1000d9:	c9                   	leave  
  1000da:	c3                   	ret    

001000db <grade_backtrace>:

void
grade_backtrace(void) {
  1000db:	55                   	push   %ebp
  1000dc:	89 e5                	mov    %esp,%ebp
  1000de:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000e1:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000e6:	c7 44 24 08 00 00 ff 	movl   $0xffff0000,0x8(%esp)
  1000ed:	ff 
  1000ee:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000f2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1000f9:	e8 c3 ff ff ff       	call   1000c1 <grade_backtrace0>
}
  1000fe:	c9                   	leave  
  1000ff:	c3                   	ret    

00100100 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  100100:	55                   	push   %ebp
  100101:	89 e5                	mov    %esp,%ebp
  100103:	83 ec 28             	sub    $0x28,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  100106:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  100109:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  10010c:	8c 45 f2             	mov    %es,-0xe(%ebp)
  10010f:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  100112:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100116:	0f b7 c0             	movzwl %ax,%eax
  100119:	83 e0 03             	and    $0x3,%eax
  10011c:	89 c2                	mov    %eax,%edx
  10011e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100123:	89 54 24 08          	mov    %edx,0x8(%esp)
  100127:	89 44 24 04          	mov    %eax,0x4(%esp)
  10012b:	c7 04 24 21 34 10 00 	movl   $0x103421,(%esp)
  100132:	e8 db 01 00 00       	call   100312 <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  100137:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10013b:	0f b7 d0             	movzwl %ax,%edx
  10013e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100143:	89 54 24 08          	mov    %edx,0x8(%esp)
  100147:	89 44 24 04          	mov    %eax,0x4(%esp)
  10014b:	c7 04 24 2f 34 10 00 	movl   $0x10342f,(%esp)
  100152:	e8 bb 01 00 00       	call   100312 <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  100157:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  10015b:	0f b7 d0             	movzwl %ax,%edx
  10015e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100163:	89 54 24 08          	mov    %edx,0x8(%esp)
  100167:	89 44 24 04          	mov    %eax,0x4(%esp)
  10016b:	c7 04 24 3d 34 10 00 	movl   $0x10343d,(%esp)
  100172:	e8 9b 01 00 00       	call   100312 <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  100177:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10017b:	0f b7 d0             	movzwl %ax,%edx
  10017e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100183:	89 54 24 08          	mov    %edx,0x8(%esp)
  100187:	89 44 24 04          	mov    %eax,0x4(%esp)
  10018b:	c7 04 24 4b 34 10 00 	movl   $0x10344b,(%esp)
  100192:	e8 7b 01 00 00       	call   100312 <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  100197:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  10019b:	0f b7 d0             	movzwl %ax,%edx
  10019e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001a3:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001a7:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001ab:	c7 04 24 59 34 10 00 	movl   $0x103459,(%esp)
  1001b2:	e8 5b 01 00 00       	call   100312 <cprintf>
    round ++;
  1001b7:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001bc:	83 c0 01             	add    $0x1,%eax
  1001bf:	a3 20 ea 10 00       	mov    %eax,0x10ea20
}
  1001c4:	c9                   	leave  
  1001c5:	c3                   	ret    

001001c6 <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001c6:	55                   	push   %ebp
  1001c7:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
}
  1001c9:	5d                   	pop    %ebp
  1001ca:	c3                   	ret    

001001cb <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001cb:	55                   	push   %ebp
  1001cc:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
}
  1001ce:	5d                   	pop    %ebp
  1001cf:	c3                   	ret    

001001d0 <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001d0:	55                   	push   %ebp
  1001d1:	89 e5                	mov    %esp,%ebp
  1001d3:	83 ec 18             	sub    $0x18,%esp
    lab1_print_cur_status();
  1001d6:	e8 25 ff ff ff       	call   100100 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001db:	c7 04 24 68 34 10 00 	movl   $0x103468,(%esp)
  1001e2:	e8 2b 01 00 00       	call   100312 <cprintf>
    lab1_switch_to_user();
  1001e7:	e8 da ff ff ff       	call   1001c6 <lab1_switch_to_user>
    lab1_print_cur_status();
  1001ec:	e8 0f ff ff ff       	call   100100 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  1001f1:	c7 04 24 88 34 10 00 	movl   $0x103488,(%esp)
  1001f8:	e8 15 01 00 00       	call   100312 <cprintf>
    lab1_switch_to_kernel();
  1001fd:	e8 c9 ff ff ff       	call   1001cb <lab1_switch_to_kernel>
    lab1_print_cur_status();
  100202:	e8 f9 fe ff ff       	call   100100 <lab1_print_cur_status>
}
  100207:	c9                   	leave  
  100208:	c3                   	ret    

00100209 <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  100209:	55                   	push   %ebp
  10020a:	89 e5                	mov    %esp,%ebp
  10020c:	83 ec 28             	sub    $0x28,%esp
    if (prompt != NULL) {
  10020f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100213:	74 13                	je     100228 <readline+0x1f>
        cprintf("%s", prompt);
  100215:	8b 45 08             	mov    0x8(%ebp),%eax
  100218:	89 44 24 04          	mov    %eax,0x4(%esp)
  10021c:	c7 04 24 a7 34 10 00 	movl   $0x1034a7,(%esp)
  100223:	e8 ea 00 00 00       	call   100312 <cprintf>
    }
    int i = 0, c;
  100228:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  10022f:	e8 66 01 00 00       	call   10039a <getchar>
  100234:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  100237:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10023b:	79 07                	jns    100244 <readline+0x3b>
            return NULL;
  10023d:	b8 00 00 00 00       	mov    $0x0,%eax
  100242:	eb 79                	jmp    1002bd <readline+0xb4>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100244:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  100248:	7e 28                	jle    100272 <readline+0x69>
  10024a:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100251:	7f 1f                	jg     100272 <readline+0x69>
            cputchar(c);
  100253:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100256:	89 04 24             	mov    %eax,(%esp)
  100259:	e8 da 00 00 00       	call   100338 <cputchar>
            buf[i ++] = c;
  10025e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100261:	8d 50 01             	lea    0x1(%eax),%edx
  100264:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100267:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10026a:	88 90 40 ea 10 00    	mov    %dl,0x10ea40(%eax)
  100270:	eb 46                	jmp    1002b8 <readline+0xaf>
        }
        else if (c == '\b' && i > 0) {
  100272:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  100276:	75 17                	jne    10028f <readline+0x86>
  100278:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10027c:	7e 11                	jle    10028f <readline+0x86>
            cputchar(c);
  10027e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100281:	89 04 24             	mov    %eax,(%esp)
  100284:	e8 af 00 00 00       	call   100338 <cputchar>
            i --;
  100289:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  10028d:	eb 29                	jmp    1002b8 <readline+0xaf>
        }
        else if (c == '\n' || c == '\r') {
  10028f:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  100293:	74 06                	je     10029b <readline+0x92>
  100295:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  100299:	75 1d                	jne    1002b8 <readline+0xaf>
            cputchar(c);
  10029b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10029e:	89 04 24             	mov    %eax,(%esp)
  1002a1:	e8 92 00 00 00       	call   100338 <cputchar>
            buf[i] = '\0';
  1002a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1002a9:	05 40 ea 10 00       	add    $0x10ea40,%eax
  1002ae:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1002b1:	b8 40 ea 10 00       	mov    $0x10ea40,%eax
  1002b6:	eb 05                	jmp    1002bd <readline+0xb4>
        }
    }
  1002b8:	e9 72 ff ff ff       	jmp    10022f <readline+0x26>
}
  1002bd:	c9                   	leave  
  1002be:	c3                   	ret    

001002bf <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  1002bf:	55                   	push   %ebp
  1002c0:	89 e5                	mov    %esp,%ebp
  1002c2:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  1002c5:	8b 45 08             	mov    0x8(%ebp),%eax
  1002c8:	89 04 24             	mov    %eax,(%esp)
  1002cb:	e8 c7 12 00 00       	call   101597 <cons_putc>
    (*cnt) ++;
  1002d0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002d3:	8b 00                	mov    (%eax),%eax
  1002d5:	8d 50 01             	lea    0x1(%eax),%edx
  1002d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002db:	89 10                	mov    %edx,(%eax)
}
  1002dd:	c9                   	leave  
  1002de:	c3                   	ret    

001002df <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  1002df:	55                   	push   %ebp
  1002e0:	89 e5                	mov    %esp,%ebp
  1002e2:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  1002e5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  1002ec:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002ef:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1002f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1002f6:	89 44 24 08          	mov    %eax,0x8(%esp)
  1002fa:	8d 45 f4             	lea    -0xc(%ebp),%eax
  1002fd:	89 44 24 04          	mov    %eax,0x4(%esp)
  100301:	c7 04 24 bf 02 10 00 	movl   $0x1002bf,(%esp)
  100308:	e8 7b 27 00 00       	call   102a88 <vprintfmt>
    return cnt;
  10030d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100310:	c9                   	leave  
  100311:	c3                   	ret    

00100312 <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  100312:	55                   	push   %ebp
  100313:	89 e5                	mov    %esp,%ebp
  100315:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  100318:	8d 45 0c             	lea    0xc(%ebp),%eax
  10031b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  10031e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100321:	89 44 24 04          	mov    %eax,0x4(%esp)
  100325:	8b 45 08             	mov    0x8(%ebp),%eax
  100328:	89 04 24             	mov    %eax,(%esp)
  10032b:	e8 af ff ff ff       	call   1002df <vcprintf>
  100330:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  100333:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100336:	c9                   	leave  
  100337:	c3                   	ret    

00100338 <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  100338:	55                   	push   %ebp
  100339:	89 e5                	mov    %esp,%ebp
  10033b:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  10033e:	8b 45 08             	mov    0x8(%ebp),%eax
  100341:	89 04 24             	mov    %eax,(%esp)
  100344:	e8 4e 12 00 00       	call   101597 <cons_putc>
}
  100349:	c9                   	leave  
  10034a:	c3                   	ret    

0010034b <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  10034b:	55                   	push   %ebp
  10034c:	89 e5                	mov    %esp,%ebp
  10034e:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  100351:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  100358:	eb 13                	jmp    10036d <cputs+0x22>
        cputch(c, &cnt);
  10035a:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  10035e:	8d 55 f0             	lea    -0x10(%ebp),%edx
  100361:	89 54 24 04          	mov    %edx,0x4(%esp)
  100365:	89 04 24             	mov    %eax,(%esp)
  100368:	e8 52 ff ff ff       	call   1002bf <cputch>
 * */
int
cputs(const char *str) {
    int cnt = 0;
    char c;
    while ((c = *str ++) != '\0') {
  10036d:	8b 45 08             	mov    0x8(%ebp),%eax
  100370:	8d 50 01             	lea    0x1(%eax),%edx
  100373:	89 55 08             	mov    %edx,0x8(%ebp)
  100376:	0f b6 00             	movzbl (%eax),%eax
  100379:	88 45 f7             	mov    %al,-0x9(%ebp)
  10037c:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  100380:	75 d8                	jne    10035a <cputs+0xf>
        cputch(c, &cnt);
    }
    cputch('\n', &cnt);
  100382:	8d 45 f0             	lea    -0x10(%ebp),%eax
  100385:	89 44 24 04          	mov    %eax,0x4(%esp)
  100389:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  100390:	e8 2a ff ff ff       	call   1002bf <cputch>
    return cnt;
  100395:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  100398:	c9                   	leave  
  100399:	c3                   	ret    

0010039a <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  10039a:	55                   	push   %ebp
  10039b:	89 e5                	mov    %esp,%ebp
  10039d:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  1003a0:	e8 1b 12 00 00       	call   1015c0 <cons_getc>
  1003a5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1003a8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1003ac:	74 f2                	je     1003a0 <getchar+0x6>
        /* do nothing */;
    return c;
  1003ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1003b1:	c9                   	leave  
  1003b2:	c3                   	ret    

001003b3 <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  1003b3:	55                   	push   %ebp
  1003b4:	89 e5                	mov    %esp,%ebp
  1003b6:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  1003b9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1003bc:	8b 00                	mov    (%eax),%eax
  1003be:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1003c1:	8b 45 10             	mov    0x10(%ebp),%eax
  1003c4:	8b 00                	mov    (%eax),%eax
  1003c6:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1003c9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  1003d0:	e9 d2 00 00 00       	jmp    1004a7 <stab_binsearch+0xf4>
        int true_m = (l + r) / 2, m = true_m;
  1003d5:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1003d8:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1003db:	01 d0                	add    %edx,%eax
  1003dd:	89 c2                	mov    %eax,%edx
  1003df:	c1 ea 1f             	shr    $0x1f,%edx
  1003e2:	01 d0                	add    %edx,%eax
  1003e4:	d1 f8                	sar    %eax
  1003e6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1003e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1003ec:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1003ef:	eb 04                	jmp    1003f5 <stab_binsearch+0x42>
            m --;
  1003f1:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)

    while (l <= r) {
        int true_m = (l + r) / 2, m = true_m;

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1003f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1003f8:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1003fb:	7c 1f                	jl     10041c <stab_binsearch+0x69>
  1003fd:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100400:	89 d0                	mov    %edx,%eax
  100402:	01 c0                	add    %eax,%eax
  100404:	01 d0                	add    %edx,%eax
  100406:	c1 e0 02             	shl    $0x2,%eax
  100409:	89 c2                	mov    %eax,%edx
  10040b:	8b 45 08             	mov    0x8(%ebp),%eax
  10040e:	01 d0                	add    %edx,%eax
  100410:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100414:	0f b6 c0             	movzbl %al,%eax
  100417:	3b 45 14             	cmp    0x14(%ebp),%eax
  10041a:	75 d5                	jne    1003f1 <stab_binsearch+0x3e>
            m --;
        }
        if (m < l) {    // no match in [l, m]
  10041c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10041f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100422:	7d 0b                	jge    10042f <stab_binsearch+0x7c>
            l = true_m + 1;
  100424:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100427:	83 c0 01             	add    $0x1,%eax
  10042a:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  10042d:	eb 78                	jmp    1004a7 <stab_binsearch+0xf4>
        }

        // actual binary search
        any_matches = 1;
  10042f:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  100436:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100439:	89 d0                	mov    %edx,%eax
  10043b:	01 c0                	add    %eax,%eax
  10043d:	01 d0                	add    %edx,%eax
  10043f:	c1 e0 02             	shl    $0x2,%eax
  100442:	89 c2                	mov    %eax,%edx
  100444:	8b 45 08             	mov    0x8(%ebp),%eax
  100447:	01 d0                	add    %edx,%eax
  100449:	8b 40 08             	mov    0x8(%eax),%eax
  10044c:	3b 45 18             	cmp    0x18(%ebp),%eax
  10044f:	73 13                	jae    100464 <stab_binsearch+0xb1>
            *region_left = m;
  100451:	8b 45 0c             	mov    0xc(%ebp),%eax
  100454:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100457:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100459:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10045c:	83 c0 01             	add    $0x1,%eax
  10045f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100462:	eb 43                	jmp    1004a7 <stab_binsearch+0xf4>
        } else if (stabs[m].n_value > addr) {
  100464:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100467:	89 d0                	mov    %edx,%eax
  100469:	01 c0                	add    %eax,%eax
  10046b:	01 d0                	add    %edx,%eax
  10046d:	c1 e0 02             	shl    $0x2,%eax
  100470:	89 c2                	mov    %eax,%edx
  100472:	8b 45 08             	mov    0x8(%ebp),%eax
  100475:	01 d0                	add    %edx,%eax
  100477:	8b 40 08             	mov    0x8(%eax),%eax
  10047a:	3b 45 18             	cmp    0x18(%ebp),%eax
  10047d:	76 16                	jbe    100495 <stab_binsearch+0xe2>
            *region_right = m - 1;
  10047f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100482:	8d 50 ff             	lea    -0x1(%eax),%edx
  100485:	8b 45 10             	mov    0x10(%ebp),%eax
  100488:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  10048a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10048d:	83 e8 01             	sub    $0x1,%eax
  100490:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100493:	eb 12                	jmp    1004a7 <stab_binsearch+0xf4>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  100495:	8b 45 0c             	mov    0xc(%ebp),%eax
  100498:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10049b:	89 10                	mov    %edx,(%eax)
            l = m;
  10049d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004a0:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  1004a3:	83 45 18 01          	addl   $0x1,0x18(%ebp)
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
    int l = *region_left, r = *region_right, any_matches = 0;

    while (l <= r) {
  1004a7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1004aa:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  1004ad:	0f 8e 22 ff ff ff    	jle    1003d5 <stab_binsearch+0x22>
            l = m;
            addr ++;
        }
    }

    if (!any_matches) {
  1004b3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1004b7:	75 0f                	jne    1004c8 <stab_binsearch+0x115>
        *region_right = *region_left - 1;
  1004b9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004bc:	8b 00                	mov    (%eax),%eax
  1004be:	8d 50 ff             	lea    -0x1(%eax),%edx
  1004c1:	8b 45 10             	mov    0x10(%ebp),%eax
  1004c4:	89 10                	mov    %edx,(%eax)
  1004c6:	eb 3f                	jmp    100507 <stab_binsearch+0x154>
    }
    else {
        // find rightmost region containing 'addr'
        l = *region_right;
  1004c8:	8b 45 10             	mov    0x10(%ebp),%eax
  1004cb:	8b 00                	mov    (%eax),%eax
  1004cd:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  1004d0:	eb 04                	jmp    1004d6 <stab_binsearch+0x123>
  1004d2:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
  1004d6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004d9:	8b 00                	mov    (%eax),%eax
  1004db:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004de:	7d 1f                	jge    1004ff <stab_binsearch+0x14c>
  1004e0:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004e3:	89 d0                	mov    %edx,%eax
  1004e5:	01 c0                	add    %eax,%eax
  1004e7:	01 d0                	add    %edx,%eax
  1004e9:	c1 e0 02             	shl    $0x2,%eax
  1004ec:	89 c2                	mov    %eax,%edx
  1004ee:	8b 45 08             	mov    0x8(%ebp),%eax
  1004f1:	01 d0                	add    %edx,%eax
  1004f3:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1004f7:	0f b6 c0             	movzbl %al,%eax
  1004fa:	3b 45 14             	cmp    0x14(%ebp),%eax
  1004fd:	75 d3                	jne    1004d2 <stab_binsearch+0x11f>
            /* do nothing */;
        *region_left = l;
  1004ff:	8b 45 0c             	mov    0xc(%ebp),%eax
  100502:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100505:	89 10                	mov    %edx,(%eax)
    }
}
  100507:	c9                   	leave  
  100508:	c3                   	ret    

00100509 <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  100509:	55                   	push   %ebp
  10050a:	89 e5                	mov    %esp,%ebp
  10050c:	83 ec 58             	sub    $0x58,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  10050f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100512:	c7 00 ac 34 10 00    	movl   $0x1034ac,(%eax)
    info->eip_line = 0;
  100518:	8b 45 0c             	mov    0xc(%ebp),%eax
  10051b:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  100522:	8b 45 0c             	mov    0xc(%ebp),%eax
  100525:	c7 40 08 ac 34 10 00 	movl   $0x1034ac,0x8(%eax)
    info->eip_fn_namelen = 9;
  10052c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10052f:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  100536:	8b 45 0c             	mov    0xc(%ebp),%eax
  100539:	8b 55 08             	mov    0x8(%ebp),%edx
  10053c:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  10053f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100542:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  100549:	c7 45 f4 0c 3d 10 00 	movl   $0x103d0c,-0xc(%ebp)
    stab_end = __STAB_END__;
  100550:	c7 45 f0 34 b4 10 00 	movl   $0x10b434,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  100557:	c7 45 ec 35 b4 10 00 	movl   $0x10b435,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  10055e:	c7 45 e8 1f d4 10 00 	movl   $0x10d41f,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  100565:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100568:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  10056b:	76 0d                	jbe    10057a <debuginfo_eip+0x71>
  10056d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100570:	83 e8 01             	sub    $0x1,%eax
  100573:	0f b6 00             	movzbl (%eax),%eax
  100576:	84 c0                	test   %al,%al
  100578:	74 0a                	je     100584 <debuginfo_eip+0x7b>
        return -1;
  10057a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10057f:	e9 c0 02 00 00       	jmp    100844 <debuginfo_eip+0x33b>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  100584:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10058b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10058e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100591:	29 c2                	sub    %eax,%edx
  100593:	89 d0                	mov    %edx,%eax
  100595:	c1 f8 02             	sar    $0x2,%eax
  100598:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  10059e:	83 e8 01             	sub    $0x1,%eax
  1005a1:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  1005a4:	8b 45 08             	mov    0x8(%ebp),%eax
  1005a7:	89 44 24 10          	mov    %eax,0x10(%esp)
  1005ab:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
  1005b2:	00 
  1005b3:	8d 45 e0             	lea    -0x20(%ebp),%eax
  1005b6:	89 44 24 08          	mov    %eax,0x8(%esp)
  1005ba:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  1005bd:	89 44 24 04          	mov    %eax,0x4(%esp)
  1005c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1005c4:	89 04 24             	mov    %eax,(%esp)
  1005c7:	e8 e7 fd ff ff       	call   1003b3 <stab_binsearch>
    if (lfile == 0)
  1005cc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005cf:	85 c0                	test   %eax,%eax
  1005d1:	75 0a                	jne    1005dd <debuginfo_eip+0xd4>
        return -1;
  1005d3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1005d8:	e9 67 02 00 00       	jmp    100844 <debuginfo_eip+0x33b>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1005dd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005e0:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1005e3:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1005e6:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1005e9:	8b 45 08             	mov    0x8(%ebp),%eax
  1005ec:	89 44 24 10          	mov    %eax,0x10(%esp)
  1005f0:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
  1005f7:	00 
  1005f8:	8d 45 d8             	lea    -0x28(%ebp),%eax
  1005fb:	89 44 24 08          	mov    %eax,0x8(%esp)
  1005ff:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100602:	89 44 24 04          	mov    %eax,0x4(%esp)
  100606:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100609:	89 04 24             	mov    %eax,(%esp)
  10060c:	e8 a2 fd ff ff       	call   1003b3 <stab_binsearch>

    if (lfun <= rfun) {
  100611:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100614:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100617:	39 c2                	cmp    %eax,%edx
  100619:	7f 7c                	jg     100697 <debuginfo_eip+0x18e>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  10061b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10061e:	89 c2                	mov    %eax,%edx
  100620:	89 d0                	mov    %edx,%eax
  100622:	01 c0                	add    %eax,%eax
  100624:	01 d0                	add    %edx,%eax
  100626:	c1 e0 02             	shl    $0x2,%eax
  100629:	89 c2                	mov    %eax,%edx
  10062b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10062e:	01 d0                	add    %edx,%eax
  100630:	8b 10                	mov    (%eax),%edx
  100632:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  100635:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100638:	29 c1                	sub    %eax,%ecx
  10063a:	89 c8                	mov    %ecx,%eax
  10063c:	39 c2                	cmp    %eax,%edx
  10063e:	73 22                	jae    100662 <debuginfo_eip+0x159>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  100640:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100643:	89 c2                	mov    %eax,%edx
  100645:	89 d0                	mov    %edx,%eax
  100647:	01 c0                	add    %eax,%eax
  100649:	01 d0                	add    %edx,%eax
  10064b:	c1 e0 02             	shl    $0x2,%eax
  10064e:	89 c2                	mov    %eax,%edx
  100650:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100653:	01 d0                	add    %edx,%eax
  100655:	8b 10                	mov    (%eax),%edx
  100657:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10065a:	01 c2                	add    %eax,%edx
  10065c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10065f:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  100662:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100665:	89 c2                	mov    %eax,%edx
  100667:	89 d0                	mov    %edx,%eax
  100669:	01 c0                	add    %eax,%eax
  10066b:	01 d0                	add    %edx,%eax
  10066d:	c1 e0 02             	shl    $0x2,%eax
  100670:	89 c2                	mov    %eax,%edx
  100672:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100675:	01 d0                	add    %edx,%eax
  100677:	8b 50 08             	mov    0x8(%eax),%edx
  10067a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10067d:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  100680:	8b 45 0c             	mov    0xc(%ebp),%eax
  100683:	8b 40 10             	mov    0x10(%eax),%eax
  100686:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  100689:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10068c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  10068f:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100692:	89 45 d0             	mov    %eax,-0x30(%ebp)
  100695:	eb 15                	jmp    1006ac <debuginfo_eip+0x1a3>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  100697:	8b 45 0c             	mov    0xc(%ebp),%eax
  10069a:	8b 55 08             	mov    0x8(%ebp),%edx
  10069d:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  1006a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006a3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  1006a6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1006a9:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  1006ac:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006af:	8b 40 08             	mov    0x8(%eax),%eax
  1006b2:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
  1006b9:	00 
  1006ba:	89 04 24             	mov    %eax,(%esp)
  1006bd:	e8 21 2a 00 00       	call   1030e3 <strfind>
  1006c2:	89 c2                	mov    %eax,%edx
  1006c4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006c7:	8b 40 08             	mov    0x8(%eax),%eax
  1006ca:	29 c2                	sub    %eax,%edx
  1006cc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006cf:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  1006d2:	8b 45 08             	mov    0x8(%ebp),%eax
  1006d5:	89 44 24 10          	mov    %eax,0x10(%esp)
  1006d9:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
  1006e0:	00 
  1006e1:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1006e4:	89 44 24 08          	mov    %eax,0x8(%esp)
  1006e8:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1006eb:	89 44 24 04          	mov    %eax,0x4(%esp)
  1006ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006f2:	89 04 24             	mov    %eax,(%esp)
  1006f5:	e8 b9 fc ff ff       	call   1003b3 <stab_binsearch>
    if (lline <= rline) {
  1006fa:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1006fd:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100700:	39 c2                	cmp    %eax,%edx
  100702:	7f 24                	jg     100728 <debuginfo_eip+0x21f>
        info->eip_line = stabs[rline].n_desc;
  100704:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100707:	89 c2                	mov    %eax,%edx
  100709:	89 d0                	mov    %edx,%eax
  10070b:	01 c0                	add    %eax,%eax
  10070d:	01 d0                	add    %edx,%eax
  10070f:	c1 e0 02             	shl    $0x2,%eax
  100712:	89 c2                	mov    %eax,%edx
  100714:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100717:	01 d0                	add    %edx,%eax
  100719:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  10071d:	0f b7 d0             	movzwl %ax,%edx
  100720:	8b 45 0c             	mov    0xc(%ebp),%eax
  100723:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  100726:	eb 13                	jmp    10073b <debuginfo_eip+0x232>
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
    if (lline <= rline) {
        info->eip_line = stabs[rline].n_desc;
    } else {
        return -1;
  100728:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10072d:	e9 12 01 00 00       	jmp    100844 <debuginfo_eip+0x33b>
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  100732:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100735:	83 e8 01             	sub    $0x1,%eax
  100738:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  10073b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10073e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100741:	39 c2                	cmp    %eax,%edx
  100743:	7c 56                	jl     10079b <debuginfo_eip+0x292>
           && stabs[lline].n_type != N_SOL
  100745:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100748:	89 c2                	mov    %eax,%edx
  10074a:	89 d0                	mov    %edx,%eax
  10074c:	01 c0                	add    %eax,%eax
  10074e:	01 d0                	add    %edx,%eax
  100750:	c1 e0 02             	shl    $0x2,%eax
  100753:	89 c2                	mov    %eax,%edx
  100755:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100758:	01 d0                	add    %edx,%eax
  10075a:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10075e:	3c 84                	cmp    $0x84,%al
  100760:	74 39                	je     10079b <debuginfo_eip+0x292>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  100762:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100765:	89 c2                	mov    %eax,%edx
  100767:	89 d0                	mov    %edx,%eax
  100769:	01 c0                	add    %eax,%eax
  10076b:	01 d0                	add    %edx,%eax
  10076d:	c1 e0 02             	shl    $0x2,%eax
  100770:	89 c2                	mov    %eax,%edx
  100772:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100775:	01 d0                	add    %edx,%eax
  100777:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10077b:	3c 64                	cmp    $0x64,%al
  10077d:	75 b3                	jne    100732 <debuginfo_eip+0x229>
  10077f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100782:	89 c2                	mov    %eax,%edx
  100784:	89 d0                	mov    %edx,%eax
  100786:	01 c0                	add    %eax,%eax
  100788:	01 d0                	add    %edx,%eax
  10078a:	c1 e0 02             	shl    $0x2,%eax
  10078d:	89 c2                	mov    %eax,%edx
  10078f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100792:	01 d0                	add    %edx,%eax
  100794:	8b 40 08             	mov    0x8(%eax),%eax
  100797:	85 c0                	test   %eax,%eax
  100799:	74 97                	je     100732 <debuginfo_eip+0x229>
        lline --;
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  10079b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10079e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1007a1:	39 c2                	cmp    %eax,%edx
  1007a3:	7c 46                	jl     1007eb <debuginfo_eip+0x2e2>
  1007a5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007a8:	89 c2                	mov    %eax,%edx
  1007aa:	89 d0                	mov    %edx,%eax
  1007ac:	01 c0                	add    %eax,%eax
  1007ae:	01 d0                	add    %edx,%eax
  1007b0:	c1 e0 02             	shl    $0x2,%eax
  1007b3:	89 c2                	mov    %eax,%edx
  1007b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007b8:	01 d0                	add    %edx,%eax
  1007ba:	8b 10                	mov    (%eax),%edx
  1007bc:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  1007bf:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1007c2:	29 c1                	sub    %eax,%ecx
  1007c4:	89 c8                	mov    %ecx,%eax
  1007c6:	39 c2                	cmp    %eax,%edx
  1007c8:	73 21                	jae    1007eb <debuginfo_eip+0x2e2>
        info->eip_file = stabstr + stabs[lline].n_strx;
  1007ca:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007cd:	89 c2                	mov    %eax,%edx
  1007cf:	89 d0                	mov    %edx,%eax
  1007d1:	01 c0                	add    %eax,%eax
  1007d3:	01 d0                	add    %edx,%eax
  1007d5:	c1 e0 02             	shl    $0x2,%eax
  1007d8:	89 c2                	mov    %eax,%edx
  1007da:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007dd:	01 d0                	add    %edx,%eax
  1007df:	8b 10                	mov    (%eax),%edx
  1007e1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1007e4:	01 c2                	add    %eax,%edx
  1007e6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007e9:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1007eb:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1007ee:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1007f1:	39 c2                	cmp    %eax,%edx
  1007f3:	7d 4a                	jge    10083f <debuginfo_eip+0x336>
        for (lline = lfun + 1;
  1007f5:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1007f8:	83 c0 01             	add    $0x1,%eax
  1007fb:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  1007fe:	eb 18                	jmp    100818 <debuginfo_eip+0x30f>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  100800:	8b 45 0c             	mov    0xc(%ebp),%eax
  100803:	8b 40 14             	mov    0x14(%eax),%eax
  100806:	8d 50 01             	lea    0x1(%eax),%edx
  100809:	8b 45 0c             	mov    0xc(%ebp),%eax
  10080c:	89 50 14             	mov    %edx,0x14(%eax)
    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
  10080f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100812:	83 c0 01             	add    $0x1,%eax
  100815:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100818:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10081b:	8b 45 d8             	mov    -0x28(%ebp),%eax
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
  10081e:	39 c2                	cmp    %eax,%edx
  100820:	7d 1d                	jge    10083f <debuginfo_eip+0x336>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100822:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100825:	89 c2                	mov    %eax,%edx
  100827:	89 d0                	mov    %edx,%eax
  100829:	01 c0                	add    %eax,%eax
  10082b:	01 d0                	add    %edx,%eax
  10082d:	c1 e0 02             	shl    $0x2,%eax
  100830:	89 c2                	mov    %eax,%edx
  100832:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100835:	01 d0                	add    %edx,%eax
  100837:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10083b:	3c a0                	cmp    $0xa0,%al
  10083d:	74 c1                	je     100800 <debuginfo_eip+0x2f7>
             lline ++) {
            info->eip_fn_narg ++;
        }
    }
    return 0;
  10083f:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100844:	c9                   	leave  
  100845:	c3                   	ret    

00100846 <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  100846:	55                   	push   %ebp
  100847:	89 e5                	mov    %esp,%ebp
  100849:	83 ec 18             	sub    $0x18,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  10084c:	c7 04 24 b6 34 10 00 	movl   $0x1034b6,(%esp)
  100853:	e8 ba fa ff ff       	call   100312 <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  100858:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  10085f:	00 
  100860:	c7 04 24 cf 34 10 00 	movl   $0x1034cf,(%esp)
  100867:	e8 a6 fa ff ff       	call   100312 <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  10086c:	c7 44 24 04 f8 33 10 	movl   $0x1033f8,0x4(%esp)
  100873:	00 
  100874:	c7 04 24 e7 34 10 00 	movl   $0x1034e7,(%esp)
  10087b:	e8 92 fa ff ff       	call   100312 <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  100880:	c7 44 24 04 16 ea 10 	movl   $0x10ea16,0x4(%esp)
  100887:	00 
  100888:	c7 04 24 ff 34 10 00 	movl   $0x1034ff,(%esp)
  10088f:	e8 7e fa ff ff       	call   100312 <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  100894:	c7 44 24 04 40 fd 10 	movl   $0x10fd40,0x4(%esp)
  10089b:	00 
  10089c:	c7 04 24 17 35 10 00 	movl   $0x103517,(%esp)
  1008a3:	e8 6a fa ff ff       	call   100312 <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  1008a8:	b8 40 fd 10 00       	mov    $0x10fd40,%eax
  1008ad:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1008b3:	b8 00 00 10 00       	mov    $0x100000,%eax
  1008b8:	29 c2                	sub    %eax,%edx
  1008ba:	89 d0                	mov    %edx,%eax
  1008bc:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1008c2:	85 c0                	test   %eax,%eax
  1008c4:	0f 48 c2             	cmovs  %edx,%eax
  1008c7:	c1 f8 0a             	sar    $0xa,%eax
  1008ca:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008ce:	c7 04 24 30 35 10 00 	movl   $0x103530,(%esp)
  1008d5:	e8 38 fa ff ff       	call   100312 <cprintf>
}
  1008da:	c9                   	leave  
  1008db:	c3                   	ret    

001008dc <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  1008dc:	55                   	push   %ebp
  1008dd:	89 e5                	mov    %esp,%ebp
  1008df:	81 ec 48 01 00 00    	sub    $0x148,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  1008e5:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1008e8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008ec:	8b 45 08             	mov    0x8(%ebp),%eax
  1008ef:	89 04 24             	mov    %eax,(%esp)
  1008f2:	e8 12 fc ff ff       	call   100509 <debuginfo_eip>
  1008f7:	85 c0                	test   %eax,%eax
  1008f9:	74 15                	je     100910 <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  1008fb:	8b 45 08             	mov    0x8(%ebp),%eax
  1008fe:	89 44 24 04          	mov    %eax,0x4(%esp)
  100902:	c7 04 24 5a 35 10 00 	movl   $0x10355a,(%esp)
  100909:	e8 04 fa ff ff       	call   100312 <cprintf>
  10090e:	eb 6d                	jmp    10097d <print_debuginfo+0xa1>
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100910:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100917:	eb 1c                	jmp    100935 <print_debuginfo+0x59>
            fnname[j] = info.eip_fn_name[j];
  100919:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  10091c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10091f:	01 d0                	add    %edx,%eax
  100921:	0f b6 00             	movzbl (%eax),%eax
  100924:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  10092a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10092d:	01 ca                	add    %ecx,%edx
  10092f:	88 02                	mov    %al,(%edx)
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100931:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100935:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100938:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  10093b:	7f dc                	jg     100919 <print_debuginfo+0x3d>
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
  10093d:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  100943:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100946:	01 d0                	add    %edx,%eax
  100948:	c6 00 00             	movb   $0x0,(%eax)
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
  10094b:	8b 45 ec             	mov    -0x14(%ebp),%eax
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  10094e:	8b 55 08             	mov    0x8(%ebp),%edx
  100951:	89 d1                	mov    %edx,%ecx
  100953:	29 c1                	sub    %eax,%ecx
  100955:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100958:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10095b:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  10095f:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100965:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100969:	89 54 24 08          	mov    %edx,0x8(%esp)
  10096d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100971:	c7 04 24 76 35 10 00 	movl   $0x103576,(%esp)
  100978:	e8 95 f9 ff ff       	call   100312 <cprintf>
                fnname, eip - info.eip_fn_addr);
    }
}
  10097d:	c9                   	leave  
  10097e:	c3                   	ret    

0010097f <read_eip>:

static __noinline uint32_t
read_eip(void) {
  10097f:	55                   	push   %ebp
  100980:	89 e5                	mov    %esp,%ebp
  100982:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100985:	8b 45 04             	mov    0x4(%ebp),%eax
  100988:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  10098b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  10098e:	c9                   	leave  
  10098f:	c3                   	ret    

00100990 <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100990:	55                   	push   %ebp
  100991:	89 e5                	mov    %esp,%ebp
  100993:	83 ec 38             	sub    $0x38,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100996:	89 e8                	mov    %ebp,%eax
  100998:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    return ebp;
  10099b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
	uint32_t ebp=read_ebp(),eip=read_eip();
  10099e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1009a1:	e8 d9 ff ff ff       	call   10097f <read_eip>
  1009a6:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int i;
	for(i=0;i<STACKFRAME_DEPTH&&ebp>0;i++)
  1009a9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  1009b0:	e9 8e 00 00 00       	jmp    100a43 <print_stackframe+0xb3>
	{
		cprintf("ebp:0x%08x eip:0x%08x ",ebp,eip);
  1009b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1009b8:	89 44 24 08          	mov    %eax,0x8(%esp)
  1009bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009bf:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009c3:	c7 04 24 88 35 10 00 	movl   $0x103588,(%esp)
  1009ca:	e8 43 f9 ff ff       	call   100312 <cprintf>
		cprintf("args:");
  1009cf:	c7 04 24 9f 35 10 00 	movl   $0x10359f,(%esp)
  1009d6:	e8 37 f9 ff ff       	call   100312 <cprintf>
		int j;
		for(j=0;j<4;j++)
  1009db:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  1009e2:	eb 28                	jmp    100a0c <print_stackframe+0x7c>
			cprintf("0x%08x ",((uint32_t *)ebp)[2+j]);
  1009e4:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1009e7:	83 c0 02             	add    $0x2,%eax
  1009ea:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  1009f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009f4:	01 d0                	add    %edx,%eax
  1009f6:	8b 00                	mov    (%eax),%eax
  1009f8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009fc:	c7 04 24 a5 35 10 00 	movl   $0x1035a5,(%esp)
  100a03:	e8 0a f9 ff ff       	call   100312 <cprintf>
	for(i=0;i<STACKFRAME_DEPTH&&ebp>0;i++)
	{
		cprintf("ebp:0x%08x eip:0x%08x ",ebp,eip);
		cprintf("args:");
		int j;
		for(j=0;j<4;j++)
  100a08:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
  100a0c:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
  100a10:	7e d2                	jle    1009e4 <print_stackframe+0x54>
			cprintf("0x%08x ",((uint32_t *)ebp)[2+j]);
		cprintf("\n");
  100a12:	c7 04 24 ad 35 10 00 	movl   $0x1035ad,(%esp)
  100a19:	e8 f4 f8 ff ff       	call   100312 <cprintf>
		print_debuginfo(eip-1);
  100a1e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100a21:	83 e8 01             	sub    $0x1,%eax
  100a24:	89 04 24             	mov    %eax,(%esp)
  100a27:	e8 b0 fe ff ff       	call   1008dc <print_debuginfo>
		eip=((uint32_t *)ebp)[1];
  100a2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a2f:	83 c0 04             	add    $0x4,%eax
  100a32:	8b 00                	mov    (%eax),%eax
  100a34:	89 45 f0             	mov    %eax,-0x10(%ebp)
		ebp=((uint32_t *)ebp)[0];
  100a37:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a3a:	8b 00                	mov    (%eax),%eax
  100a3c:	89 45 f4             	mov    %eax,-0xc(%ebp)
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
	uint32_t ebp=read_ebp(),eip=read_eip();
	int i;
	for(i=0;i<STACKFRAME_DEPTH&&ebp>0;i++)
  100a3f:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  100a43:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
  100a47:	7f 0a                	jg     100a53 <print_stackframe+0xc3>
  100a49:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100a4d:	0f 85 62 ff ff ff    	jne    1009b5 <print_stackframe+0x25>
		cprintf("\n");
		print_debuginfo(eip-1);
		eip=((uint32_t *)ebp)[1];
		ebp=((uint32_t *)ebp)[0];
	}
}
  100a53:	c9                   	leave  
  100a54:	c3                   	ret    

00100a55 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100a55:	55                   	push   %ebp
  100a56:	89 e5                	mov    %esp,%ebp
  100a58:	83 ec 28             	sub    $0x28,%esp
    int argc = 0;
  100a5b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a62:	eb 0c                	jmp    100a70 <parse+0x1b>
            *buf ++ = '\0';
  100a64:	8b 45 08             	mov    0x8(%ebp),%eax
  100a67:	8d 50 01             	lea    0x1(%eax),%edx
  100a6a:	89 55 08             	mov    %edx,0x8(%ebp)
  100a6d:	c6 00 00             	movb   $0x0,(%eax)
static int
parse(char *buf, char **argv) {
    int argc = 0;
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a70:	8b 45 08             	mov    0x8(%ebp),%eax
  100a73:	0f b6 00             	movzbl (%eax),%eax
  100a76:	84 c0                	test   %al,%al
  100a78:	74 1d                	je     100a97 <parse+0x42>
  100a7a:	8b 45 08             	mov    0x8(%ebp),%eax
  100a7d:	0f b6 00             	movzbl (%eax),%eax
  100a80:	0f be c0             	movsbl %al,%eax
  100a83:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a87:	c7 04 24 30 36 10 00 	movl   $0x103630,(%esp)
  100a8e:	e8 1d 26 00 00       	call   1030b0 <strchr>
  100a93:	85 c0                	test   %eax,%eax
  100a95:	75 cd                	jne    100a64 <parse+0xf>
            *buf ++ = '\0';
        }
        if (*buf == '\0') {
  100a97:	8b 45 08             	mov    0x8(%ebp),%eax
  100a9a:	0f b6 00             	movzbl (%eax),%eax
  100a9d:	84 c0                	test   %al,%al
  100a9f:	75 02                	jne    100aa3 <parse+0x4e>
            break;
  100aa1:	eb 67                	jmp    100b0a <parse+0xb5>
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100aa3:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100aa7:	75 14                	jne    100abd <parse+0x68>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100aa9:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
  100ab0:	00 
  100ab1:	c7 04 24 35 36 10 00 	movl   $0x103635,(%esp)
  100ab8:	e8 55 f8 ff ff       	call   100312 <cprintf>
        }
        argv[argc ++] = buf;
  100abd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ac0:	8d 50 01             	lea    0x1(%eax),%edx
  100ac3:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100ac6:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100acd:	8b 45 0c             	mov    0xc(%ebp),%eax
  100ad0:	01 c2                	add    %eax,%edx
  100ad2:	8b 45 08             	mov    0x8(%ebp),%eax
  100ad5:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100ad7:	eb 04                	jmp    100add <parse+0x88>
            buf ++;
  100ad9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
        // save and scan past next arg
        if (argc == MAXARGS - 1) {
            cprintf("Too many arguments (max %d).\n", MAXARGS);
        }
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100add:	8b 45 08             	mov    0x8(%ebp),%eax
  100ae0:	0f b6 00             	movzbl (%eax),%eax
  100ae3:	84 c0                	test   %al,%al
  100ae5:	74 1d                	je     100b04 <parse+0xaf>
  100ae7:	8b 45 08             	mov    0x8(%ebp),%eax
  100aea:	0f b6 00             	movzbl (%eax),%eax
  100aed:	0f be c0             	movsbl %al,%eax
  100af0:	89 44 24 04          	mov    %eax,0x4(%esp)
  100af4:	c7 04 24 30 36 10 00 	movl   $0x103630,(%esp)
  100afb:	e8 b0 25 00 00       	call   1030b0 <strchr>
  100b00:	85 c0                	test   %eax,%eax
  100b02:	74 d5                	je     100ad9 <parse+0x84>
            buf ++;
        }
    }
  100b04:	90                   	nop
static int
parse(char *buf, char **argv) {
    int argc = 0;
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b05:	e9 66 ff ff ff       	jmp    100a70 <parse+0x1b>
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
            buf ++;
        }
    }
    return argc;
  100b0a:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100b0d:	c9                   	leave  
  100b0e:	c3                   	ret    

00100b0f <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100b0f:	55                   	push   %ebp
  100b10:	89 e5                	mov    %esp,%ebp
  100b12:	83 ec 68             	sub    $0x68,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100b15:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100b18:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b1c:	8b 45 08             	mov    0x8(%ebp),%eax
  100b1f:	89 04 24             	mov    %eax,(%esp)
  100b22:	e8 2e ff ff ff       	call   100a55 <parse>
  100b27:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100b2a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100b2e:	75 0a                	jne    100b3a <runcmd+0x2b>
        return 0;
  100b30:	b8 00 00 00 00       	mov    $0x0,%eax
  100b35:	e9 85 00 00 00       	jmp    100bbf <runcmd+0xb0>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100b3a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100b41:	eb 5c                	jmp    100b9f <runcmd+0x90>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100b43:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100b46:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b49:	89 d0                	mov    %edx,%eax
  100b4b:	01 c0                	add    %eax,%eax
  100b4d:	01 d0                	add    %edx,%eax
  100b4f:	c1 e0 02             	shl    $0x2,%eax
  100b52:	05 00 e0 10 00       	add    $0x10e000,%eax
  100b57:	8b 00                	mov    (%eax),%eax
  100b59:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100b5d:	89 04 24             	mov    %eax,(%esp)
  100b60:	e8 ac 24 00 00       	call   103011 <strcmp>
  100b65:	85 c0                	test   %eax,%eax
  100b67:	75 32                	jne    100b9b <runcmd+0x8c>
            return commands[i].func(argc - 1, argv + 1, tf);
  100b69:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b6c:	89 d0                	mov    %edx,%eax
  100b6e:	01 c0                	add    %eax,%eax
  100b70:	01 d0                	add    %edx,%eax
  100b72:	c1 e0 02             	shl    $0x2,%eax
  100b75:	05 00 e0 10 00       	add    $0x10e000,%eax
  100b7a:	8b 40 08             	mov    0x8(%eax),%eax
  100b7d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100b80:	8d 4a ff             	lea    -0x1(%edx),%ecx
  100b83:	8b 55 0c             	mov    0xc(%ebp),%edx
  100b86:	89 54 24 08          	mov    %edx,0x8(%esp)
  100b8a:	8d 55 b0             	lea    -0x50(%ebp),%edx
  100b8d:	83 c2 04             	add    $0x4,%edx
  100b90:	89 54 24 04          	mov    %edx,0x4(%esp)
  100b94:	89 0c 24             	mov    %ecx,(%esp)
  100b97:	ff d0                	call   *%eax
  100b99:	eb 24                	jmp    100bbf <runcmd+0xb0>
    int argc = parse(buf, argv);
    if (argc == 0) {
        return 0;
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100b9b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100b9f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ba2:	83 f8 02             	cmp    $0x2,%eax
  100ba5:	76 9c                	jbe    100b43 <runcmd+0x34>
        if (strcmp(commands[i].name, argv[0]) == 0) {
            return commands[i].func(argc - 1, argv + 1, tf);
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100ba7:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100baa:	89 44 24 04          	mov    %eax,0x4(%esp)
  100bae:	c7 04 24 53 36 10 00 	movl   $0x103653,(%esp)
  100bb5:	e8 58 f7 ff ff       	call   100312 <cprintf>
    return 0;
  100bba:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100bbf:	c9                   	leave  
  100bc0:	c3                   	ret    

00100bc1 <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100bc1:	55                   	push   %ebp
  100bc2:	89 e5                	mov    %esp,%ebp
  100bc4:	83 ec 28             	sub    $0x28,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100bc7:	c7 04 24 6c 36 10 00 	movl   $0x10366c,(%esp)
  100bce:	e8 3f f7 ff ff       	call   100312 <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100bd3:	c7 04 24 94 36 10 00 	movl   $0x103694,(%esp)
  100bda:	e8 33 f7 ff ff       	call   100312 <cprintf>

    if (tf != NULL) {
  100bdf:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100be3:	74 0b                	je     100bf0 <kmonitor+0x2f>
        print_trapframe(tf);
  100be5:	8b 45 08             	mov    0x8(%ebp),%eax
  100be8:	89 04 24             	mov    %eax,(%esp)
  100beb:	e8 4d 0d 00 00       	call   10193d <print_trapframe>
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100bf0:	c7 04 24 b9 36 10 00 	movl   $0x1036b9,(%esp)
  100bf7:	e8 0d f6 ff ff       	call   100209 <readline>
  100bfc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100bff:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100c03:	74 18                	je     100c1d <kmonitor+0x5c>
            if (runcmd(buf, tf) < 0) {
  100c05:	8b 45 08             	mov    0x8(%ebp),%eax
  100c08:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c0c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c0f:	89 04 24             	mov    %eax,(%esp)
  100c12:	e8 f8 fe ff ff       	call   100b0f <runcmd>
  100c17:	85 c0                	test   %eax,%eax
  100c19:	79 02                	jns    100c1d <kmonitor+0x5c>
                break;
  100c1b:	eb 02                	jmp    100c1f <kmonitor+0x5e>
            }
        }
    }
  100c1d:	eb d1                	jmp    100bf0 <kmonitor+0x2f>
}
  100c1f:	c9                   	leave  
  100c20:	c3                   	ret    

00100c21 <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100c21:	55                   	push   %ebp
  100c22:	89 e5                	mov    %esp,%ebp
  100c24:	83 ec 28             	sub    $0x28,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c27:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100c2e:	eb 3f                	jmp    100c6f <mon_help+0x4e>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100c30:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c33:	89 d0                	mov    %edx,%eax
  100c35:	01 c0                	add    %eax,%eax
  100c37:	01 d0                	add    %edx,%eax
  100c39:	c1 e0 02             	shl    $0x2,%eax
  100c3c:	05 00 e0 10 00       	add    $0x10e000,%eax
  100c41:	8b 48 04             	mov    0x4(%eax),%ecx
  100c44:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c47:	89 d0                	mov    %edx,%eax
  100c49:	01 c0                	add    %eax,%eax
  100c4b:	01 d0                	add    %edx,%eax
  100c4d:	c1 e0 02             	shl    $0x2,%eax
  100c50:	05 00 e0 10 00       	add    $0x10e000,%eax
  100c55:	8b 00                	mov    (%eax),%eax
  100c57:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100c5b:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c5f:	c7 04 24 bd 36 10 00 	movl   $0x1036bd,(%esp)
  100c66:	e8 a7 f6 ff ff       	call   100312 <cprintf>

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c6b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100c6f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c72:	83 f8 02             	cmp    $0x2,%eax
  100c75:	76 b9                	jbe    100c30 <mon_help+0xf>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
    }
    return 0;
  100c77:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c7c:	c9                   	leave  
  100c7d:	c3                   	ret    

00100c7e <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100c7e:	55                   	push   %ebp
  100c7f:	89 e5                	mov    %esp,%ebp
  100c81:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100c84:	e8 bd fb ff ff       	call   100846 <print_kerninfo>
    return 0;
  100c89:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c8e:	c9                   	leave  
  100c8f:	c3                   	ret    

00100c90 <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100c90:	55                   	push   %ebp
  100c91:	89 e5                	mov    %esp,%ebp
  100c93:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100c96:	e8 f5 fc ff ff       	call   100990 <print_stackframe>
    return 0;
  100c9b:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100ca0:	c9                   	leave  
  100ca1:	c3                   	ret    

00100ca2 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  100ca2:	55                   	push   %ebp
  100ca3:	89 e5                	mov    %esp,%ebp
  100ca5:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  100ca8:	a1 40 ee 10 00       	mov    0x10ee40,%eax
  100cad:	85 c0                	test   %eax,%eax
  100caf:	74 02                	je     100cb3 <__panic+0x11>
        goto panic_dead;
  100cb1:	eb 48                	jmp    100cfb <__panic+0x59>
    }
    is_panic = 1;
  100cb3:	c7 05 40 ee 10 00 01 	movl   $0x1,0x10ee40
  100cba:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  100cbd:	8d 45 14             	lea    0x14(%ebp),%eax
  100cc0:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  100cc3:	8b 45 0c             	mov    0xc(%ebp),%eax
  100cc6:	89 44 24 08          	mov    %eax,0x8(%esp)
  100cca:	8b 45 08             	mov    0x8(%ebp),%eax
  100ccd:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cd1:	c7 04 24 c6 36 10 00 	movl   $0x1036c6,(%esp)
  100cd8:	e8 35 f6 ff ff       	call   100312 <cprintf>
    vcprintf(fmt, ap);
  100cdd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ce0:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ce4:	8b 45 10             	mov    0x10(%ebp),%eax
  100ce7:	89 04 24             	mov    %eax,(%esp)
  100cea:	e8 f0 f5 ff ff       	call   1002df <vcprintf>
    cprintf("\n");
  100cef:	c7 04 24 e2 36 10 00 	movl   $0x1036e2,(%esp)
  100cf6:	e8 17 f6 ff ff       	call   100312 <cprintf>
    va_end(ap);

panic_dead:
    intr_disable();
  100cfb:	e8 22 09 00 00       	call   101622 <intr_disable>
    while (1) {
        kmonitor(NULL);
  100d00:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100d07:	e8 b5 fe ff ff       	call   100bc1 <kmonitor>
    }
  100d0c:	eb f2                	jmp    100d00 <__panic+0x5e>

00100d0e <__warn>:
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100d0e:	55                   	push   %ebp
  100d0f:	89 e5                	mov    %esp,%ebp
  100d11:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  100d14:	8d 45 14             	lea    0x14(%ebp),%eax
  100d17:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100d1a:	8b 45 0c             	mov    0xc(%ebp),%eax
  100d1d:	89 44 24 08          	mov    %eax,0x8(%esp)
  100d21:	8b 45 08             	mov    0x8(%ebp),%eax
  100d24:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d28:	c7 04 24 e4 36 10 00 	movl   $0x1036e4,(%esp)
  100d2f:	e8 de f5 ff ff       	call   100312 <cprintf>
    vcprintf(fmt, ap);
  100d34:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d37:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d3b:	8b 45 10             	mov    0x10(%ebp),%eax
  100d3e:	89 04 24             	mov    %eax,(%esp)
  100d41:	e8 99 f5 ff ff       	call   1002df <vcprintf>
    cprintf("\n");
  100d46:	c7 04 24 e2 36 10 00 	movl   $0x1036e2,(%esp)
  100d4d:	e8 c0 f5 ff ff       	call   100312 <cprintf>
    va_end(ap);
}
  100d52:	c9                   	leave  
  100d53:	c3                   	ret    

00100d54 <is_kernel_panic>:

bool
is_kernel_panic(void) {
  100d54:	55                   	push   %ebp
  100d55:	89 e5                	mov    %esp,%ebp
    return is_panic;
  100d57:	a1 40 ee 10 00       	mov    0x10ee40,%eax
}
  100d5c:	5d                   	pop    %ebp
  100d5d:	c3                   	ret    

00100d5e <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100d5e:	55                   	push   %ebp
  100d5f:	89 e5                	mov    %esp,%ebp
  100d61:	83 ec 28             	sub    $0x28,%esp
  100d64:	66 c7 45 f6 43 00    	movw   $0x43,-0xa(%ebp)
  100d6a:	c6 45 f5 34          	movb   $0x34,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d6e:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100d72:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100d76:	ee                   	out    %al,(%dx)
  100d77:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100d7d:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
  100d81:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100d85:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100d89:	ee                   	out    %al,(%dx)
  100d8a:	66 c7 45 ee 40 00    	movw   $0x40,-0x12(%ebp)
  100d90:	c6 45 ed 2e          	movb   $0x2e,-0x13(%ebp)
  100d94:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100d98:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100d9c:	ee                   	out    %al,(%dx)
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100d9d:	c7 05 28 f9 10 00 00 	movl   $0x0,0x10f928
  100da4:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100da7:	c7 04 24 02 37 10 00 	movl   $0x103702,(%esp)
  100dae:	e8 5f f5 ff ff       	call   100312 <cprintf>
    pic_enable(IRQ_TIMER);
  100db3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100dba:	e8 c1 08 00 00       	call   101680 <pic_enable>
}
  100dbf:	c9                   	leave  
  100dc0:	c3                   	ret    

00100dc1 <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100dc1:	55                   	push   %ebp
  100dc2:	89 e5                	mov    %esp,%ebp
  100dc4:	83 ec 10             	sub    $0x10,%esp
  100dc7:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100dcd:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100dd1:	89 c2                	mov    %eax,%edx
  100dd3:	ec                   	in     (%dx),%al
  100dd4:	88 45 fd             	mov    %al,-0x3(%ebp)
  100dd7:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100ddd:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100de1:	89 c2                	mov    %eax,%edx
  100de3:	ec                   	in     (%dx),%al
  100de4:	88 45 f9             	mov    %al,-0x7(%ebp)
  100de7:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100ded:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100df1:	89 c2                	mov    %eax,%edx
  100df3:	ec                   	in     (%dx),%al
  100df4:	88 45 f5             	mov    %al,-0xb(%ebp)
  100df7:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
  100dfd:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100e01:	89 c2                	mov    %eax,%edx
  100e03:	ec                   	in     (%dx),%al
  100e04:	88 45 f1             	mov    %al,-0xf(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100e07:	c9                   	leave  
  100e08:	c3                   	ret    

00100e09 <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  100e09:	55                   	push   %ebp
  100e0a:	89 e5                	mov    %esp,%ebp
  100e0c:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;   //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  100e0f:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  100e16:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e19:	0f b7 00             	movzwl (%eax),%eax
  100e1c:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  100e20:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e23:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  100e28:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e2b:	0f b7 00             	movzwl (%eax),%eax
  100e2e:	66 3d 5a a5          	cmp    $0xa55a,%ax
  100e32:	74 12                	je     100e46 <cga_init+0x3d>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  100e34:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  100e3b:	66 c7 05 66 ee 10 00 	movw   $0x3b4,0x10ee66
  100e42:	b4 03 
  100e44:	eb 13                	jmp    100e59 <cga_init+0x50>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  100e46:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e49:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100e4d:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  100e50:	66 c7 05 66 ee 10 00 	movw   $0x3d4,0x10ee66
  100e57:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  100e59:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e60:	0f b7 c0             	movzwl %ax,%eax
  100e63:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  100e67:	c6 45 f1 0e          	movb   $0xe,-0xf(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e6b:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100e6f:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100e73:	ee                   	out    %al,(%dx)
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  100e74:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e7b:	83 c0 01             	add    $0x1,%eax
  100e7e:	0f b7 c0             	movzwl %ax,%eax
  100e81:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e85:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100e89:	89 c2                	mov    %eax,%edx
  100e8b:	ec                   	in     (%dx),%al
  100e8c:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  100e8f:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100e93:	0f b6 c0             	movzbl %al,%eax
  100e96:	c1 e0 08             	shl    $0x8,%eax
  100e99:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100e9c:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100ea3:	0f b7 c0             	movzwl %ax,%eax
  100ea6:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
  100eaa:	c6 45 e9 0f          	movb   $0xf,-0x17(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100eae:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100eb2:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100eb6:	ee                   	out    %al,(%dx)
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  100eb7:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100ebe:	83 c0 01             	add    $0x1,%eax
  100ec1:	0f b7 c0             	movzwl %ax,%eax
  100ec4:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ec8:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
  100ecc:	89 c2                	mov    %eax,%edx
  100ece:	ec                   	in     (%dx),%al
  100ecf:	88 45 e5             	mov    %al,-0x1b(%ebp)
    return data;
  100ed2:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100ed6:	0f b6 c0             	movzbl %al,%eax
  100ed9:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  100edc:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100edf:	a3 60 ee 10 00       	mov    %eax,0x10ee60
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  100ee4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ee7:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
}
  100eed:	c9                   	leave  
  100eee:	c3                   	ret    

00100eef <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100eef:	55                   	push   %ebp
  100ef0:	89 e5                	mov    %esp,%ebp
  100ef2:	83 ec 48             	sub    $0x48,%esp
  100ef5:	66 c7 45 f6 fa 03    	movw   $0x3fa,-0xa(%ebp)
  100efb:	c6 45 f5 00          	movb   $0x0,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100eff:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100f03:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100f07:	ee                   	out    %al,(%dx)
  100f08:	66 c7 45 f2 fb 03    	movw   $0x3fb,-0xe(%ebp)
  100f0e:	c6 45 f1 80          	movb   $0x80,-0xf(%ebp)
  100f12:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100f16:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100f1a:	ee                   	out    %al,(%dx)
  100f1b:	66 c7 45 ee f8 03    	movw   $0x3f8,-0x12(%ebp)
  100f21:	c6 45 ed 0c          	movb   $0xc,-0x13(%ebp)
  100f25:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100f29:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100f2d:	ee                   	out    %al,(%dx)
  100f2e:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100f34:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
  100f38:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100f3c:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100f40:	ee                   	out    %al,(%dx)
  100f41:	66 c7 45 e6 fb 03    	movw   $0x3fb,-0x1a(%ebp)
  100f47:	c6 45 e5 03          	movb   $0x3,-0x1b(%ebp)
  100f4b:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100f4f:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100f53:	ee                   	out    %al,(%dx)
  100f54:	66 c7 45 e2 fc 03    	movw   $0x3fc,-0x1e(%ebp)
  100f5a:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
  100f5e:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100f62:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100f66:	ee                   	out    %al,(%dx)
  100f67:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100f6d:	c6 45 dd 01          	movb   $0x1,-0x23(%ebp)
  100f71:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100f75:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100f79:	ee                   	out    %al,(%dx)
  100f7a:	66 c7 45 da fd 03    	movw   $0x3fd,-0x26(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f80:	0f b7 45 da          	movzwl -0x26(%ebp),%eax
  100f84:	89 c2                	mov    %eax,%edx
  100f86:	ec                   	in     (%dx),%al
  100f87:	88 45 d9             	mov    %al,-0x27(%ebp)
    return data;
  100f8a:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100f8e:	3c ff                	cmp    $0xff,%al
  100f90:	0f 95 c0             	setne  %al
  100f93:	0f b6 c0             	movzbl %al,%eax
  100f96:	a3 68 ee 10 00       	mov    %eax,0x10ee68
  100f9b:	66 c7 45 d6 fa 03    	movw   $0x3fa,-0x2a(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100fa1:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
  100fa5:	89 c2                	mov    %eax,%edx
  100fa7:	ec                   	in     (%dx),%al
  100fa8:	88 45 d5             	mov    %al,-0x2b(%ebp)
  100fab:	66 c7 45 d2 f8 03    	movw   $0x3f8,-0x2e(%ebp)
  100fb1:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
  100fb5:	89 c2                	mov    %eax,%edx
  100fb7:	ec                   	in     (%dx),%al
  100fb8:	88 45 d1             	mov    %al,-0x2f(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  100fbb:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  100fc0:	85 c0                	test   %eax,%eax
  100fc2:	74 0c                	je     100fd0 <serial_init+0xe1>
        pic_enable(IRQ_COM1);
  100fc4:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  100fcb:	e8 b0 06 00 00       	call   101680 <pic_enable>
    }
}
  100fd0:	c9                   	leave  
  100fd1:	c3                   	ret    

00100fd2 <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  100fd2:	55                   	push   %ebp
  100fd3:	89 e5                	mov    %esp,%ebp
  100fd5:	83 ec 20             	sub    $0x20,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fd8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100fdf:	eb 09                	jmp    100fea <lpt_putc_sub+0x18>
        delay();
  100fe1:	e8 db fd ff ff       	call   100dc1 <delay>
}

static void
lpt_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fe6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100fea:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  100ff0:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100ff4:	89 c2                	mov    %eax,%edx
  100ff6:	ec                   	in     (%dx),%al
  100ff7:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  100ffa:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  100ffe:	84 c0                	test   %al,%al
  101000:	78 09                	js     10100b <lpt_putc_sub+0x39>
  101002:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  101009:	7e d6                	jle    100fe1 <lpt_putc_sub+0xf>
        delay();
    }
    outb(LPTPORT + 0, c);
  10100b:	8b 45 08             	mov    0x8(%ebp),%eax
  10100e:	0f b6 c0             	movzbl %al,%eax
  101011:	66 c7 45 f6 78 03    	movw   $0x378,-0xa(%ebp)
  101017:	88 45 f5             	mov    %al,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10101a:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  10101e:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101022:	ee                   	out    %al,(%dx)
  101023:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  101029:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
  10102d:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101031:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101035:	ee                   	out    %al,(%dx)
  101036:	66 c7 45 ee 7a 03    	movw   $0x37a,-0x12(%ebp)
  10103c:	c6 45 ed 08          	movb   $0x8,-0x13(%ebp)
  101040:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101044:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101048:	ee                   	out    %al,(%dx)
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  101049:	c9                   	leave  
  10104a:	c3                   	ret    

0010104b <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  10104b:	55                   	push   %ebp
  10104c:	89 e5                	mov    %esp,%ebp
  10104e:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  101051:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101055:	74 0d                	je     101064 <lpt_putc+0x19>
        lpt_putc_sub(c);
  101057:	8b 45 08             	mov    0x8(%ebp),%eax
  10105a:	89 04 24             	mov    %eax,(%esp)
  10105d:	e8 70 ff ff ff       	call   100fd2 <lpt_putc_sub>
  101062:	eb 24                	jmp    101088 <lpt_putc+0x3d>
    }
    else {
        lpt_putc_sub('\b');
  101064:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  10106b:	e8 62 ff ff ff       	call   100fd2 <lpt_putc_sub>
        lpt_putc_sub(' ');
  101070:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  101077:	e8 56 ff ff ff       	call   100fd2 <lpt_putc_sub>
        lpt_putc_sub('\b');
  10107c:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101083:	e8 4a ff ff ff       	call   100fd2 <lpt_putc_sub>
    }
}
  101088:	c9                   	leave  
  101089:	c3                   	ret    

0010108a <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  10108a:	55                   	push   %ebp
  10108b:	89 e5                	mov    %esp,%ebp
  10108d:	53                   	push   %ebx
  10108e:	83 ec 34             	sub    $0x34,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  101091:	8b 45 08             	mov    0x8(%ebp),%eax
  101094:	b0 00                	mov    $0x0,%al
  101096:	85 c0                	test   %eax,%eax
  101098:	75 07                	jne    1010a1 <cga_putc+0x17>
        c |= 0x0700;
  10109a:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  1010a1:	8b 45 08             	mov    0x8(%ebp),%eax
  1010a4:	0f b6 c0             	movzbl %al,%eax
  1010a7:	83 f8 0a             	cmp    $0xa,%eax
  1010aa:	74 4c                	je     1010f8 <cga_putc+0x6e>
  1010ac:	83 f8 0d             	cmp    $0xd,%eax
  1010af:	74 57                	je     101108 <cga_putc+0x7e>
  1010b1:	83 f8 08             	cmp    $0x8,%eax
  1010b4:	0f 85 88 00 00 00    	jne    101142 <cga_putc+0xb8>
    case '\b':
        if (crt_pos > 0) {
  1010ba:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010c1:	66 85 c0             	test   %ax,%ax
  1010c4:	74 30                	je     1010f6 <cga_putc+0x6c>
            crt_pos --;
  1010c6:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010cd:	83 e8 01             	sub    $0x1,%eax
  1010d0:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  1010d6:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1010db:	0f b7 15 64 ee 10 00 	movzwl 0x10ee64,%edx
  1010e2:	0f b7 d2             	movzwl %dx,%edx
  1010e5:	01 d2                	add    %edx,%edx
  1010e7:	01 c2                	add    %eax,%edx
  1010e9:	8b 45 08             	mov    0x8(%ebp),%eax
  1010ec:	b0 00                	mov    $0x0,%al
  1010ee:	83 c8 20             	or     $0x20,%eax
  1010f1:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  1010f4:	eb 72                	jmp    101168 <cga_putc+0xde>
  1010f6:	eb 70                	jmp    101168 <cga_putc+0xde>
    case '\n':
        crt_pos += CRT_COLS;
  1010f8:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010ff:	83 c0 50             	add    $0x50,%eax
  101102:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  101108:	0f b7 1d 64 ee 10 00 	movzwl 0x10ee64,%ebx
  10110f:	0f b7 0d 64 ee 10 00 	movzwl 0x10ee64,%ecx
  101116:	0f b7 c1             	movzwl %cx,%eax
  101119:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
  10111f:	c1 e8 10             	shr    $0x10,%eax
  101122:	89 c2                	mov    %eax,%edx
  101124:	66 c1 ea 06          	shr    $0x6,%dx
  101128:	89 d0                	mov    %edx,%eax
  10112a:	c1 e0 02             	shl    $0x2,%eax
  10112d:	01 d0                	add    %edx,%eax
  10112f:	c1 e0 04             	shl    $0x4,%eax
  101132:	29 c1                	sub    %eax,%ecx
  101134:	89 ca                	mov    %ecx,%edx
  101136:	89 d8                	mov    %ebx,%eax
  101138:	29 d0                	sub    %edx,%eax
  10113a:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
        break;
  101140:	eb 26                	jmp    101168 <cga_putc+0xde>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  101142:	8b 0d 60 ee 10 00    	mov    0x10ee60,%ecx
  101148:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10114f:	8d 50 01             	lea    0x1(%eax),%edx
  101152:	66 89 15 64 ee 10 00 	mov    %dx,0x10ee64
  101159:	0f b7 c0             	movzwl %ax,%eax
  10115c:	01 c0                	add    %eax,%eax
  10115e:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  101161:	8b 45 08             	mov    0x8(%ebp),%eax
  101164:	66 89 02             	mov    %ax,(%edx)
        break;
  101167:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  101168:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10116f:	66 3d cf 07          	cmp    $0x7cf,%ax
  101173:	76 5b                	jbe    1011d0 <cga_putc+0x146>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  101175:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  10117a:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  101180:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  101185:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  10118c:	00 
  10118d:	89 54 24 04          	mov    %edx,0x4(%esp)
  101191:	89 04 24             	mov    %eax,(%esp)
  101194:	e8 15 21 00 00       	call   1032ae <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  101199:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  1011a0:	eb 15                	jmp    1011b7 <cga_putc+0x12d>
            crt_buf[i] = 0x0700 | ' ';
  1011a2:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1011a7:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1011aa:	01 d2                	add    %edx,%edx
  1011ac:	01 d0                	add    %edx,%eax
  1011ae:	66 c7 00 20 07       	movw   $0x720,(%eax)

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011b3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1011b7:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  1011be:	7e e2                	jle    1011a2 <cga_putc+0x118>
            crt_buf[i] = 0x0700 | ' ';
        }
        crt_pos -= CRT_COLS;
  1011c0:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011c7:	83 e8 50             	sub    $0x50,%eax
  1011ca:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  1011d0:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  1011d7:	0f b7 c0             	movzwl %ax,%eax
  1011da:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  1011de:	c6 45 f1 0e          	movb   $0xe,-0xf(%ebp)
  1011e2:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1011e6:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1011ea:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos >> 8);
  1011eb:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011f2:	66 c1 e8 08          	shr    $0x8,%ax
  1011f6:	0f b6 c0             	movzbl %al,%eax
  1011f9:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  101200:	83 c2 01             	add    $0x1,%edx
  101203:	0f b7 d2             	movzwl %dx,%edx
  101206:	66 89 55 ee          	mov    %dx,-0x12(%ebp)
  10120a:	88 45 ed             	mov    %al,-0x13(%ebp)
  10120d:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101211:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101215:	ee                   	out    %al,(%dx)
    outb(addr_6845, 15);
  101216:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  10121d:	0f b7 c0             	movzwl %ax,%eax
  101220:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
  101224:	c6 45 e9 0f          	movb   $0xf,-0x17(%ebp)
  101228:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  10122c:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101230:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos);
  101231:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101238:	0f b6 c0             	movzbl %al,%eax
  10123b:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  101242:	83 c2 01             	add    $0x1,%edx
  101245:	0f b7 d2             	movzwl %dx,%edx
  101248:	66 89 55 e6          	mov    %dx,-0x1a(%ebp)
  10124c:	88 45 e5             	mov    %al,-0x1b(%ebp)
  10124f:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101253:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101257:	ee                   	out    %al,(%dx)
}
  101258:	83 c4 34             	add    $0x34,%esp
  10125b:	5b                   	pop    %ebx
  10125c:	5d                   	pop    %ebp
  10125d:	c3                   	ret    

0010125e <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  10125e:	55                   	push   %ebp
  10125f:	89 e5                	mov    %esp,%ebp
  101261:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101264:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10126b:	eb 09                	jmp    101276 <serial_putc_sub+0x18>
        delay();
  10126d:	e8 4f fb ff ff       	call   100dc1 <delay>
}

static void
serial_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101272:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  101276:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10127c:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101280:	89 c2                	mov    %eax,%edx
  101282:	ec                   	in     (%dx),%al
  101283:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101286:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10128a:	0f b6 c0             	movzbl %al,%eax
  10128d:	83 e0 20             	and    $0x20,%eax
  101290:	85 c0                	test   %eax,%eax
  101292:	75 09                	jne    10129d <serial_putc_sub+0x3f>
  101294:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  10129b:	7e d0                	jle    10126d <serial_putc_sub+0xf>
        delay();
    }
    outb(COM1 + COM_TX, c);
  10129d:	8b 45 08             	mov    0x8(%ebp),%eax
  1012a0:	0f b6 c0             	movzbl %al,%eax
  1012a3:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  1012a9:	88 45 f5             	mov    %al,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012ac:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1012b0:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1012b4:	ee                   	out    %al,(%dx)
}
  1012b5:	c9                   	leave  
  1012b6:	c3                   	ret    

001012b7 <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  1012b7:	55                   	push   %ebp
  1012b8:	89 e5                	mov    %esp,%ebp
  1012ba:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  1012bd:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  1012c1:	74 0d                	je     1012d0 <serial_putc+0x19>
        serial_putc_sub(c);
  1012c3:	8b 45 08             	mov    0x8(%ebp),%eax
  1012c6:	89 04 24             	mov    %eax,(%esp)
  1012c9:	e8 90 ff ff ff       	call   10125e <serial_putc_sub>
  1012ce:	eb 24                	jmp    1012f4 <serial_putc+0x3d>
    }
    else {
        serial_putc_sub('\b');
  1012d0:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1012d7:	e8 82 ff ff ff       	call   10125e <serial_putc_sub>
        serial_putc_sub(' ');
  1012dc:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1012e3:	e8 76 ff ff ff       	call   10125e <serial_putc_sub>
        serial_putc_sub('\b');
  1012e8:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1012ef:	e8 6a ff ff ff       	call   10125e <serial_putc_sub>
    }
}
  1012f4:	c9                   	leave  
  1012f5:	c3                   	ret    

001012f6 <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  1012f6:	55                   	push   %ebp
  1012f7:	89 e5                	mov    %esp,%ebp
  1012f9:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  1012fc:	eb 33                	jmp    101331 <cons_intr+0x3b>
        if (c != 0) {
  1012fe:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  101302:	74 2d                	je     101331 <cons_intr+0x3b>
            cons.buf[cons.wpos ++] = c;
  101304:	a1 84 f0 10 00       	mov    0x10f084,%eax
  101309:	8d 50 01             	lea    0x1(%eax),%edx
  10130c:	89 15 84 f0 10 00    	mov    %edx,0x10f084
  101312:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101315:	88 90 80 ee 10 00    	mov    %dl,0x10ee80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  10131b:	a1 84 f0 10 00       	mov    0x10f084,%eax
  101320:	3d 00 02 00 00       	cmp    $0x200,%eax
  101325:	75 0a                	jne    101331 <cons_intr+0x3b>
                cons.wpos = 0;
  101327:	c7 05 84 f0 10 00 00 	movl   $0x0,0x10f084
  10132e:	00 00 00 
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
    int c;
    while ((c = (*proc)()) != -1) {
  101331:	8b 45 08             	mov    0x8(%ebp),%eax
  101334:	ff d0                	call   *%eax
  101336:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101339:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  10133d:	75 bf                	jne    1012fe <cons_intr+0x8>
            if (cons.wpos == CONSBUFSIZE) {
                cons.wpos = 0;
            }
        }
    }
}
  10133f:	c9                   	leave  
  101340:	c3                   	ret    

00101341 <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  101341:	55                   	push   %ebp
  101342:	89 e5                	mov    %esp,%ebp
  101344:	83 ec 10             	sub    $0x10,%esp
  101347:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10134d:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101351:	89 c2                	mov    %eax,%edx
  101353:	ec                   	in     (%dx),%al
  101354:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101357:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  10135b:	0f b6 c0             	movzbl %al,%eax
  10135e:	83 e0 01             	and    $0x1,%eax
  101361:	85 c0                	test   %eax,%eax
  101363:	75 07                	jne    10136c <serial_proc_data+0x2b>
        return -1;
  101365:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10136a:	eb 2a                	jmp    101396 <serial_proc_data+0x55>
  10136c:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101372:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  101376:	89 c2                	mov    %eax,%edx
  101378:	ec                   	in     (%dx),%al
  101379:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  10137c:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  101380:	0f b6 c0             	movzbl %al,%eax
  101383:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  101386:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  10138a:	75 07                	jne    101393 <serial_proc_data+0x52>
        c = '\b';
  10138c:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  101393:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  101396:	c9                   	leave  
  101397:	c3                   	ret    

00101398 <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  101398:	55                   	push   %ebp
  101399:	89 e5                	mov    %esp,%ebp
  10139b:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  10139e:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  1013a3:	85 c0                	test   %eax,%eax
  1013a5:	74 0c                	je     1013b3 <serial_intr+0x1b>
        cons_intr(serial_proc_data);
  1013a7:	c7 04 24 41 13 10 00 	movl   $0x101341,(%esp)
  1013ae:	e8 43 ff ff ff       	call   1012f6 <cons_intr>
    }
}
  1013b3:	c9                   	leave  
  1013b4:	c3                   	ret    

001013b5 <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  1013b5:	55                   	push   %ebp
  1013b6:	89 e5                	mov    %esp,%ebp
  1013b8:	83 ec 38             	sub    $0x38,%esp
  1013bb:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013c1:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  1013c5:	89 c2                	mov    %eax,%edx
  1013c7:	ec                   	in     (%dx),%al
  1013c8:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  1013cb:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  1013cf:	0f b6 c0             	movzbl %al,%eax
  1013d2:	83 e0 01             	and    $0x1,%eax
  1013d5:	85 c0                	test   %eax,%eax
  1013d7:	75 0a                	jne    1013e3 <kbd_proc_data+0x2e>
        return -1;
  1013d9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1013de:	e9 59 01 00 00       	jmp    10153c <kbd_proc_data+0x187>
  1013e3:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013e9:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  1013ed:	89 c2                	mov    %eax,%edx
  1013ef:	ec                   	in     (%dx),%al
  1013f0:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  1013f3:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  1013f7:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  1013fa:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  1013fe:	75 17                	jne    101417 <kbd_proc_data+0x62>
        // E0 escape character
        shift |= E0ESC;
  101400:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101405:	83 c8 40             	or     $0x40,%eax
  101408:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  10140d:	b8 00 00 00 00       	mov    $0x0,%eax
  101412:	e9 25 01 00 00       	jmp    10153c <kbd_proc_data+0x187>
    } else if (data & 0x80) {
  101417:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10141b:	84 c0                	test   %al,%al
  10141d:	79 47                	jns    101466 <kbd_proc_data+0xb1>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  10141f:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101424:	83 e0 40             	and    $0x40,%eax
  101427:	85 c0                	test   %eax,%eax
  101429:	75 09                	jne    101434 <kbd_proc_data+0x7f>
  10142b:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10142f:	83 e0 7f             	and    $0x7f,%eax
  101432:	eb 04                	jmp    101438 <kbd_proc_data+0x83>
  101434:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101438:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  10143b:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10143f:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  101446:	83 c8 40             	or     $0x40,%eax
  101449:	0f b6 c0             	movzbl %al,%eax
  10144c:	f7 d0                	not    %eax
  10144e:	89 c2                	mov    %eax,%edx
  101450:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101455:	21 d0                	and    %edx,%eax
  101457:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  10145c:	b8 00 00 00 00       	mov    $0x0,%eax
  101461:	e9 d6 00 00 00       	jmp    10153c <kbd_proc_data+0x187>
    } else if (shift & E0ESC) {
  101466:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10146b:	83 e0 40             	and    $0x40,%eax
  10146e:	85 c0                	test   %eax,%eax
  101470:	74 11                	je     101483 <kbd_proc_data+0xce>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  101472:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  101476:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10147b:	83 e0 bf             	and    $0xffffffbf,%eax
  10147e:	a3 88 f0 10 00       	mov    %eax,0x10f088
    }

    shift |= shiftcode[data];
  101483:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101487:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  10148e:	0f b6 d0             	movzbl %al,%edx
  101491:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101496:	09 d0                	or     %edx,%eax
  101498:	a3 88 f0 10 00       	mov    %eax,0x10f088
    shift ^= togglecode[data];
  10149d:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014a1:	0f b6 80 40 e1 10 00 	movzbl 0x10e140(%eax),%eax
  1014a8:	0f b6 d0             	movzbl %al,%edx
  1014ab:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014b0:	31 d0                	xor    %edx,%eax
  1014b2:	a3 88 f0 10 00       	mov    %eax,0x10f088

    c = charcode[shift & (CTL | SHIFT)][data];
  1014b7:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014bc:	83 e0 03             	and    $0x3,%eax
  1014bf:	8b 14 85 40 e5 10 00 	mov    0x10e540(,%eax,4),%edx
  1014c6:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014ca:	01 d0                	add    %edx,%eax
  1014cc:	0f b6 00             	movzbl (%eax),%eax
  1014cf:	0f b6 c0             	movzbl %al,%eax
  1014d2:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  1014d5:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014da:	83 e0 08             	and    $0x8,%eax
  1014dd:	85 c0                	test   %eax,%eax
  1014df:	74 22                	je     101503 <kbd_proc_data+0x14e>
        if ('a' <= c && c <= 'z')
  1014e1:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  1014e5:	7e 0c                	jle    1014f3 <kbd_proc_data+0x13e>
  1014e7:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  1014eb:	7f 06                	jg     1014f3 <kbd_proc_data+0x13e>
            c += 'A' - 'a';
  1014ed:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  1014f1:	eb 10                	jmp    101503 <kbd_proc_data+0x14e>
        else if ('A' <= c && c <= 'Z')
  1014f3:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  1014f7:	7e 0a                	jle    101503 <kbd_proc_data+0x14e>
  1014f9:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  1014fd:	7f 04                	jg     101503 <kbd_proc_data+0x14e>
            c += 'a' - 'A';
  1014ff:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  101503:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101508:	f7 d0                	not    %eax
  10150a:	83 e0 06             	and    $0x6,%eax
  10150d:	85 c0                	test   %eax,%eax
  10150f:	75 28                	jne    101539 <kbd_proc_data+0x184>
  101511:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  101518:	75 1f                	jne    101539 <kbd_proc_data+0x184>
        cprintf("Rebooting!\n");
  10151a:	c7 04 24 1d 37 10 00 	movl   $0x10371d,(%esp)
  101521:	e8 ec ed ff ff       	call   100312 <cprintf>
  101526:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  10152c:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101530:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  101534:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
  101538:	ee                   	out    %al,(%dx)
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  101539:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10153c:	c9                   	leave  
  10153d:	c3                   	ret    

0010153e <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  10153e:	55                   	push   %ebp
  10153f:	89 e5                	mov    %esp,%ebp
  101541:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  101544:	c7 04 24 b5 13 10 00 	movl   $0x1013b5,(%esp)
  10154b:	e8 a6 fd ff ff       	call   1012f6 <cons_intr>
}
  101550:	c9                   	leave  
  101551:	c3                   	ret    

00101552 <kbd_init>:

static void
kbd_init(void) {
  101552:	55                   	push   %ebp
  101553:	89 e5                	mov    %esp,%ebp
  101555:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  101558:	e8 e1 ff ff ff       	call   10153e <kbd_intr>
    pic_enable(IRQ_KBD);
  10155d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  101564:	e8 17 01 00 00       	call   101680 <pic_enable>
}
  101569:	c9                   	leave  
  10156a:	c3                   	ret    

0010156b <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  10156b:	55                   	push   %ebp
  10156c:	89 e5                	mov    %esp,%ebp
  10156e:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  101571:	e8 93 f8 ff ff       	call   100e09 <cga_init>
    serial_init();
  101576:	e8 74 f9 ff ff       	call   100eef <serial_init>
    kbd_init();
  10157b:	e8 d2 ff ff ff       	call   101552 <kbd_init>
    if (!serial_exists) {
  101580:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  101585:	85 c0                	test   %eax,%eax
  101587:	75 0c                	jne    101595 <cons_init+0x2a>
        cprintf("serial port does not exist!!\n");
  101589:	c7 04 24 29 37 10 00 	movl   $0x103729,(%esp)
  101590:	e8 7d ed ff ff       	call   100312 <cprintf>
    }
}
  101595:	c9                   	leave  
  101596:	c3                   	ret    

00101597 <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  101597:	55                   	push   %ebp
  101598:	89 e5                	mov    %esp,%ebp
  10159a:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  10159d:	8b 45 08             	mov    0x8(%ebp),%eax
  1015a0:	89 04 24             	mov    %eax,(%esp)
  1015a3:	e8 a3 fa ff ff       	call   10104b <lpt_putc>
    cga_putc(c);
  1015a8:	8b 45 08             	mov    0x8(%ebp),%eax
  1015ab:	89 04 24             	mov    %eax,(%esp)
  1015ae:	e8 d7 fa ff ff       	call   10108a <cga_putc>
    serial_putc(c);
  1015b3:	8b 45 08             	mov    0x8(%ebp),%eax
  1015b6:	89 04 24             	mov    %eax,(%esp)
  1015b9:	e8 f9 fc ff ff       	call   1012b7 <serial_putc>
}
  1015be:	c9                   	leave  
  1015bf:	c3                   	ret    

001015c0 <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  1015c0:	55                   	push   %ebp
  1015c1:	89 e5                	mov    %esp,%ebp
  1015c3:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  1015c6:	e8 cd fd ff ff       	call   101398 <serial_intr>
    kbd_intr();
  1015cb:	e8 6e ff ff ff       	call   10153e <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1015d0:	8b 15 80 f0 10 00    	mov    0x10f080,%edx
  1015d6:	a1 84 f0 10 00       	mov    0x10f084,%eax
  1015db:	39 c2                	cmp    %eax,%edx
  1015dd:	74 36                	je     101615 <cons_getc+0x55>
        c = cons.buf[cons.rpos ++];
  1015df:	a1 80 f0 10 00       	mov    0x10f080,%eax
  1015e4:	8d 50 01             	lea    0x1(%eax),%edx
  1015e7:	89 15 80 f0 10 00    	mov    %edx,0x10f080
  1015ed:	0f b6 80 80 ee 10 00 	movzbl 0x10ee80(%eax),%eax
  1015f4:	0f b6 c0             	movzbl %al,%eax
  1015f7:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  1015fa:	a1 80 f0 10 00       	mov    0x10f080,%eax
  1015ff:	3d 00 02 00 00       	cmp    $0x200,%eax
  101604:	75 0a                	jne    101610 <cons_getc+0x50>
            cons.rpos = 0;
  101606:	c7 05 80 f0 10 00 00 	movl   $0x0,0x10f080
  10160d:	00 00 00 
        }
        return c;
  101610:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101613:	eb 05                	jmp    10161a <cons_getc+0x5a>
    }
    return 0;
  101615:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10161a:	c9                   	leave  
  10161b:	c3                   	ret    

0010161c <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  10161c:	55                   	push   %ebp
  10161d:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  10161f:	fb                   	sti    
    sti();
}
  101620:	5d                   	pop    %ebp
  101621:	c3                   	ret    

00101622 <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  101622:	55                   	push   %ebp
  101623:	89 e5                	mov    %esp,%ebp
}

static inline void
cli(void) {
    asm volatile ("cli");
  101625:	fa                   	cli    
    cli();
}
  101626:	5d                   	pop    %ebp
  101627:	c3                   	ret    

00101628 <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  101628:	55                   	push   %ebp
  101629:	89 e5                	mov    %esp,%ebp
  10162b:	83 ec 14             	sub    $0x14,%esp
  10162e:	8b 45 08             	mov    0x8(%ebp),%eax
  101631:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  101635:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101639:	66 a3 50 e5 10 00    	mov    %ax,0x10e550
    if (did_init) {
  10163f:	a1 8c f0 10 00       	mov    0x10f08c,%eax
  101644:	85 c0                	test   %eax,%eax
  101646:	74 36                	je     10167e <pic_setmask+0x56>
        outb(IO_PIC1 + 1, mask);
  101648:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  10164c:	0f b6 c0             	movzbl %al,%eax
  10164f:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  101655:	88 45 fd             	mov    %al,-0x3(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101658:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  10165c:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  101660:	ee                   	out    %al,(%dx)
        outb(IO_PIC2 + 1, mask >> 8);
  101661:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101665:	66 c1 e8 08          	shr    $0x8,%ax
  101669:	0f b6 c0             	movzbl %al,%eax
  10166c:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
  101672:	88 45 f9             	mov    %al,-0x7(%ebp)
  101675:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101679:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  10167d:	ee                   	out    %al,(%dx)
    }
}
  10167e:	c9                   	leave  
  10167f:	c3                   	ret    

00101680 <pic_enable>:

void
pic_enable(unsigned int irq) {
  101680:	55                   	push   %ebp
  101681:	89 e5                	mov    %esp,%ebp
  101683:	83 ec 04             	sub    $0x4,%esp
    pic_setmask(irq_mask & ~(1 << irq));
  101686:	8b 45 08             	mov    0x8(%ebp),%eax
  101689:	ba 01 00 00 00       	mov    $0x1,%edx
  10168e:	89 c1                	mov    %eax,%ecx
  101690:	d3 e2                	shl    %cl,%edx
  101692:	89 d0                	mov    %edx,%eax
  101694:	f7 d0                	not    %eax
  101696:	89 c2                	mov    %eax,%edx
  101698:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  10169f:	21 d0                	and    %edx,%eax
  1016a1:	0f b7 c0             	movzwl %ax,%eax
  1016a4:	89 04 24             	mov    %eax,(%esp)
  1016a7:	e8 7c ff ff ff       	call   101628 <pic_setmask>
}
  1016ac:	c9                   	leave  
  1016ad:	c3                   	ret    

001016ae <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  1016ae:	55                   	push   %ebp
  1016af:	89 e5                	mov    %esp,%ebp
  1016b1:	83 ec 44             	sub    $0x44,%esp
    did_init = 1;
  1016b4:	c7 05 8c f0 10 00 01 	movl   $0x1,0x10f08c
  1016bb:	00 00 00 
  1016be:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  1016c4:	c6 45 fd ff          	movb   $0xff,-0x3(%ebp)
  1016c8:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  1016cc:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1016d0:	ee                   	out    %al,(%dx)
  1016d1:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
  1016d7:	c6 45 f9 ff          	movb   $0xff,-0x7(%ebp)
  1016db:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1016df:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1016e3:	ee                   	out    %al,(%dx)
  1016e4:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  1016ea:	c6 45 f5 11          	movb   $0x11,-0xb(%ebp)
  1016ee:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1016f2:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1016f6:	ee                   	out    %al,(%dx)
  1016f7:	66 c7 45 f2 21 00    	movw   $0x21,-0xe(%ebp)
  1016fd:	c6 45 f1 20          	movb   $0x20,-0xf(%ebp)
  101701:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101705:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101709:	ee                   	out    %al,(%dx)
  10170a:	66 c7 45 ee 21 00    	movw   $0x21,-0x12(%ebp)
  101710:	c6 45 ed 04          	movb   $0x4,-0x13(%ebp)
  101714:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101718:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10171c:	ee                   	out    %al,(%dx)
  10171d:	66 c7 45 ea 21 00    	movw   $0x21,-0x16(%ebp)
  101723:	c6 45 e9 03          	movb   $0x3,-0x17(%ebp)
  101727:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  10172b:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  10172f:	ee                   	out    %al,(%dx)
  101730:	66 c7 45 e6 a0 00    	movw   $0xa0,-0x1a(%ebp)
  101736:	c6 45 e5 11          	movb   $0x11,-0x1b(%ebp)
  10173a:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  10173e:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101742:	ee                   	out    %al,(%dx)
  101743:	66 c7 45 e2 a1 00    	movw   $0xa1,-0x1e(%ebp)
  101749:	c6 45 e1 28          	movb   $0x28,-0x1f(%ebp)
  10174d:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  101751:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  101755:	ee                   	out    %al,(%dx)
  101756:	66 c7 45 de a1 00    	movw   $0xa1,-0x22(%ebp)
  10175c:	c6 45 dd 02          	movb   $0x2,-0x23(%ebp)
  101760:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  101764:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  101768:	ee                   	out    %al,(%dx)
  101769:	66 c7 45 da a1 00    	movw   $0xa1,-0x26(%ebp)
  10176f:	c6 45 d9 03          	movb   $0x3,-0x27(%ebp)
  101773:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  101777:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  10177b:	ee                   	out    %al,(%dx)
  10177c:	66 c7 45 d6 20 00    	movw   $0x20,-0x2a(%ebp)
  101782:	c6 45 d5 68          	movb   $0x68,-0x2b(%ebp)
  101786:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  10178a:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  10178e:	ee                   	out    %al,(%dx)
  10178f:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  101795:	c6 45 d1 0a          	movb   $0xa,-0x2f(%ebp)
  101799:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  10179d:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  1017a1:	ee                   	out    %al,(%dx)
  1017a2:	66 c7 45 ce a0 00    	movw   $0xa0,-0x32(%ebp)
  1017a8:	c6 45 cd 68          	movb   $0x68,-0x33(%ebp)
  1017ac:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  1017b0:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  1017b4:	ee                   	out    %al,(%dx)
  1017b5:	66 c7 45 ca a0 00    	movw   $0xa0,-0x36(%ebp)
  1017bb:	c6 45 c9 0a          	movb   $0xa,-0x37(%ebp)
  1017bf:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  1017c3:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  1017c7:	ee                   	out    %al,(%dx)
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  1017c8:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017cf:	66 83 f8 ff          	cmp    $0xffff,%ax
  1017d3:	74 12                	je     1017e7 <pic_init+0x139>
        pic_setmask(irq_mask);
  1017d5:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017dc:	0f b7 c0             	movzwl %ax,%eax
  1017df:	89 04 24             	mov    %eax,(%esp)
  1017e2:	e8 41 fe ff ff       	call   101628 <pic_setmask>
    }
}
  1017e7:	c9                   	leave  
  1017e8:	c3                   	ret    

001017e9 <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  1017e9:	55                   	push   %ebp
  1017ea:	89 e5                	mov    %esp,%ebp
  1017ec:	83 ec 18             	sub    $0x18,%esp
    cprintf("%d ticks\n",TICK_NUM);
  1017ef:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
  1017f6:	00 
  1017f7:	c7 04 24 60 37 10 00 	movl   $0x103760,(%esp)
  1017fe:	e8 0f eb ff ff       	call   100312 <cprintf>
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
}
  101803:	c9                   	leave  
  101804:	c3                   	ret    

00101805 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  101805:	55                   	push   %ebp
  101806:	89 e5                	mov    %esp,%ebp
  101808:	83 ec 10             	sub    $0x10,%esp
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
	extern uintptr_t __vectors[];
	int i;
	for( i=0;i<256;i++){
  10180b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101812:	e9 c3 00 00 00       	jmp    1018da <idt_init+0xd5>
		SETGATE(idt[i],0,KERNEL_CS,__vectors[i],0);       //用法：SETGATE(gate, istrap, sel, off, dpl)
  101817:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10181a:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  101821:	89 c2                	mov    %eax,%edx
  101823:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101826:	66 89 14 c5 c0 f0 10 	mov    %dx,0x10f0c0(,%eax,8)
  10182d:	00 
  10182e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101831:	66 c7 04 c5 c2 f0 10 	movw   $0x8,0x10f0c2(,%eax,8)
  101838:	00 08 00 
  10183b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10183e:	0f b6 14 c5 c4 f0 10 	movzbl 0x10f0c4(,%eax,8),%edx
  101845:	00 
  101846:	83 e2 e0             	and    $0xffffffe0,%edx
  101849:	88 14 c5 c4 f0 10 00 	mov    %dl,0x10f0c4(,%eax,8)
  101850:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101853:	0f b6 14 c5 c4 f0 10 	movzbl 0x10f0c4(,%eax,8),%edx
  10185a:	00 
  10185b:	83 e2 1f             	and    $0x1f,%edx
  10185e:	88 14 c5 c4 f0 10 00 	mov    %dl,0x10f0c4(,%eax,8)
  101865:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101868:	0f b6 14 c5 c5 f0 10 	movzbl 0x10f0c5(,%eax,8),%edx
  10186f:	00 
  101870:	83 e2 f0             	and    $0xfffffff0,%edx
  101873:	83 ca 0e             	or     $0xe,%edx
  101876:	88 14 c5 c5 f0 10 00 	mov    %dl,0x10f0c5(,%eax,8)
  10187d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101880:	0f b6 14 c5 c5 f0 10 	movzbl 0x10f0c5(,%eax,8),%edx
  101887:	00 
  101888:	83 e2 ef             	and    $0xffffffef,%edx
  10188b:	88 14 c5 c5 f0 10 00 	mov    %dl,0x10f0c5(,%eax,8)
  101892:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101895:	0f b6 14 c5 c5 f0 10 	movzbl 0x10f0c5(,%eax,8),%edx
  10189c:	00 
  10189d:	83 e2 9f             	and    $0xffffff9f,%edx
  1018a0:	88 14 c5 c5 f0 10 00 	mov    %dl,0x10f0c5(,%eax,8)
  1018a7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018aa:	0f b6 14 c5 c5 f0 10 	movzbl 0x10f0c5(,%eax,8),%edx
  1018b1:	00 
  1018b2:	83 ca 80             	or     $0xffffff80,%edx
  1018b5:	88 14 c5 c5 f0 10 00 	mov    %dl,0x10f0c5(,%eax,8)
  1018bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018bf:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  1018c6:	c1 e8 10             	shr    $0x10,%eax
  1018c9:	89 c2                	mov    %eax,%edx
  1018cb:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018ce:	66 89 14 c5 c6 f0 10 	mov    %dx,0x10f0c6(,%eax,8)
  1018d5:	00 
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
	extern uintptr_t __vectors[];
	int i;
	for( i=0;i<256;i++){
  1018d6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1018da:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
  1018e1:	0f 8e 30 ff ff ff    	jle    101817 <idt_init+0x12>
  1018e7:	c7 45 f8 60 e5 10 00 	movl   $0x10e560,-0x8(%ebp)
    return ebp;
}

static inline void
lidt(struct pseudodesc *pd) {
    asm volatile ("lidt (%0)" :: "r" (pd));
  1018ee:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1018f1:	0f 01 18             	lidtl  (%eax)
		SETGATE(idt[i],0,KERNEL_CS,__vectors[i],0);       //用法：SETGATE(gate, istrap, sel, off, dpl)
	}
	lidt(&idt_pd);

}
  1018f4:	c9                   	leave  
  1018f5:	c3                   	ret    

001018f6 <trapname>:

static const char *
trapname(int trapno) {
  1018f6:	55                   	push   %ebp
  1018f7:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  1018f9:	8b 45 08             	mov    0x8(%ebp),%eax
  1018fc:	83 f8 13             	cmp    $0x13,%eax
  1018ff:	77 0c                	ja     10190d <trapname+0x17>
        return excnames[trapno];
  101901:	8b 45 08             	mov    0x8(%ebp),%eax
  101904:	8b 04 85 c0 3a 10 00 	mov    0x103ac0(,%eax,4),%eax
  10190b:	eb 18                	jmp    101925 <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  10190d:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  101911:	7e 0d                	jle    101920 <trapname+0x2a>
  101913:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  101917:	7f 07                	jg     101920 <trapname+0x2a>
        return "Hardware Interrupt";
  101919:	b8 6a 37 10 00       	mov    $0x10376a,%eax
  10191e:	eb 05                	jmp    101925 <trapname+0x2f>
    }
    return "(unknown trap)";
  101920:	b8 7d 37 10 00       	mov    $0x10377d,%eax
}
  101925:	5d                   	pop    %ebp
  101926:	c3                   	ret    

00101927 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  101927:	55                   	push   %ebp
  101928:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  10192a:	8b 45 08             	mov    0x8(%ebp),%eax
  10192d:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101931:	66 83 f8 08          	cmp    $0x8,%ax
  101935:	0f 94 c0             	sete   %al
  101938:	0f b6 c0             	movzbl %al,%eax
}
  10193b:	5d                   	pop    %ebp
  10193c:	c3                   	ret    

0010193d <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  10193d:	55                   	push   %ebp
  10193e:	89 e5                	mov    %esp,%ebp
  101940:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  101943:	8b 45 08             	mov    0x8(%ebp),%eax
  101946:	89 44 24 04          	mov    %eax,0x4(%esp)
  10194a:	c7 04 24 be 37 10 00 	movl   $0x1037be,(%esp)
  101951:	e8 bc e9 ff ff       	call   100312 <cprintf>
    print_regs(&tf->tf_regs);
  101956:	8b 45 08             	mov    0x8(%ebp),%eax
  101959:	89 04 24             	mov    %eax,(%esp)
  10195c:	e8 a1 01 00 00       	call   101b02 <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  101961:	8b 45 08             	mov    0x8(%ebp),%eax
  101964:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  101968:	0f b7 c0             	movzwl %ax,%eax
  10196b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10196f:	c7 04 24 cf 37 10 00 	movl   $0x1037cf,(%esp)
  101976:	e8 97 e9 ff ff       	call   100312 <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  10197b:	8b 45 08             	mov    0x8(%ebp),%eax
  10197e:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101982:	0f b7 c0             	movzwl %ax,%eax
  101985:	89 44 24 04          	mov    %eax,0x4(%esp)
  101989:	c7 04 24 e2 37 10 00 	movl   $0x1037e2,(%esp)
  101990:	e8 7d e9 ff ff       	call   100312 <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  101995:	8b 45 08             	mov    0x8(%ebp),%eax
  101998:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  10199c:	0f b7 c0             	movzwl %ax,%eax
  10199f:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019a3:	c7 04 24 f5 37 10 00 	movl   $0x1037f5,(%esp)
  1019aa:	e8 63 e9 ff ff       	call   100312 <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  1019af:	8b 45 08             	mov    0x8(%ebp),%eax
  1019b2:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  1019b6:	0f b7 c0             	movzwl %ax,%eax
  1019b9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019bd:	c7 04 24 08 38 10 00 	movl   $0x103808,(%esp)
  1019c4:	e8 49 e9 ff ff       	call   100312 <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  1019c9:	8b 45 08             	mov    0x8(%ebp),%eax
  1019cc:	8b 40 30             	mov    0x30(%eax),%eax
  1019cf:	89 04 24             	mov    %eax,(%esp)
  1019d2:	e8 1f ff ff ff       	call   1018f6 <trapname>
  1019d7:	8b 55 08             	mov    0x8(%ebp),%edx
  1019da:	8b 52 30             	mov    0x30(%edx),%edx
  1019dd:	89 44 24 08          	mov    %eax,0x8(%esp)
  1019e1:	89 54 24 04          	mov    %edx,0x4(%esp)
  1019e5:	c7 04 24 1b 38 10 00 	movl   $0x10381b,(%esp)
  1019ec:	e8 21 e9 ff ff       	call   100312 <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  1019f1:	8b 45 08             	mov    0x8(%ebp),%eax
  1019f4:	8b 40 34             	mov    0x34(%eax),%eax
  1019f7:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019fb:	c7 04 24 2d 38 10 00 	movl   $0x10382d,(%esp)
  101a02:	e8 0b e9 ff ff       	call   100312 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101a07:	8b 45 08             	mov    0x8(%ebp),%eax
  101a0a:	8b 40 38             	mov    0x38(%eax),%eax
  101a0d:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a11:	c7 04 24 3c 38 10 00 	movl   $0x10383c,(%esp)
  101a18:	e8 f5 e8 ff ff       	call   100312 <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101a1d:	8b 45 08             	mov    0x8(%ebp),%eax
  101a20:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101a24:	0f b7 c0             	movzwl %ax,%eax
  101a27:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a2b:	c7 04 24 4b 38 10 00 	movl   $0x10384b,(%esp)
  101a32:	e8 db e8 ff ff       	call   100312 <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101a37:	8b 45 08             	mov    0x8(%ebp),%eax
  101a3a:	8b 40 40             	mov    0x40(%eax),%eax
  101a3d:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a41:	c7 04 24 5e 38 10 00 	movl   $0x10385e,(%esp)
  101a48:	e8 c5 e8 ff ff       	call   100312 <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101a4d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101a54:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101a5b:	eb 3e                	jmp    101a9b <print_trapframe+0x15e>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101a5d:	8b 45 08             	mov    0x8(%ebp),%eax
  101a60:	8b 50 40             	mov    0x40(%eax),%edx
  101a63:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101a66:	21 d0                	and    %edx,%eax
  101a68:	85 c0                	test   %eax,%eax
  101a6a:	74 28                	je     101a94 <print_trapframe+0x157>
  101a6c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101a6f:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101a76:	85 c0                	test   %eax,%eax
  101a78:	74 1a                	je     101a94 <print_trapframe+0x157>
            cprintf("%s,", IA32flags[i]);
  101a7a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101a7d:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101a84:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a88:	c7 04 24 6d 38 10 00 	movl   $0x10386d,(%esp)
  101a8f:	e8 7e e8 ff ff       	call   100312 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
    cprintf("  flag 0x%08x ", tf->tf_eflags);

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101a94:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  101a98:	d1 65 f0             	shll   -0x10(%ebp)
  101a9b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101a9e:	83 f8 17             	cmp    $0x17,%eax
  101aa1:	76 ba                	jbe    101a5d <print_trapframe+0x120>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
            cprintf("%s,", IA32flags[i]);
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101aa3:	8b 45 08             	mov    0x8(%ebp),%eax
  101aa6:	8b 40 40             	mov    0x40(%eax),%eax
  101aa9:	25 00 30 00 00       	and    $0x3000,%eax
  101aae:	c1 e8 0c             	shr    $0xc,%eax
  101ab1:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ab5:	c7 04 24 71 38 10 00 	movl   $0x103871,(%esp)
  101abc:	e8 51 e8 ff ff       	call   100312 <cprintf>

    if (!trap_in_kernel(tf)) {
  101ac1:	8b 45 08             	mov    0x8(%ebp),%eax
  101ac4:	89 04 24             	mov    %eax,(%esp)
  101ac7:	e8 5b fe ff ff       	call   101927 <trap_in_kernel>
  101acc:	85 c0                	test   %eax,%eax
  101ace:	75 30                	jne    101b00 <print_trapframe+0x1c3>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101ad0:	8b 45 08             	mov    0x8(%ebp),%eax
  101ad3:	8b 40 44             	mov    0x44(%eax),%eax
  101ad6:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ada:	c7 04 24 7a 38 10 00 	movl   $0x10387a,(%esp)
  101ae1:	e8 2c e8 ff ff       	call   100312 <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101ae6:	8b 45 08             	mov    0x8(%ebp),%eax
  101ae9:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101aed:	0f b7 c0             	movzwl %ax,%eax
  101af0:	89 44 24 04          	mov    %eax,0x4(%esp)
  101af4:	c7 04 24 89 38 10 00 	movl   $0x103889,(%esp)
  101afb:	e8 12 e8 ff ff       	call   100312 <cprintf>
    }
}
  101b00:	c9                   	leave  
  101b01:	c3                   	ret    

00101b02 <print_regs>:

void
print_regs(struct pushregs *regs) {
  101b02:	55                   	push   %ebp
  101b03:	89 e5                	mov    %esp,%ebp
  101b05:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101b08:	8b 45 08             	mov    0x8(%ebp),%eax
  101b0b:	8b 00                	mov    (%eax),%eax
  101b0d:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b11:	c7 04 24 9c 38 10 00 	movl   $0x10389c,(%esp)
  101b18:	e8 f5 e7 ff ff       	call   100312 <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101b1d:	8b 45 08             	mov    0x8(%ebp),%eax
  101b20:	8b 40 04             	mov    0x4(%eax),%eax
  101b23:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b27:	c7 04 24 ab 38 10 00 	movl   $0x1038ab,(%esp)
  101b2e:	e8 df e7 ff ff       	call   100312 <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101b33:	8b 45 08             	mov    0x8(%ebp),%eax
  101b36:	8b 40 08             	mov    0x8(%eax),%eax
  101b39:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b3d:	c7 04 24 ba 38 10 00 	movl   $0x1038ba,(%esp)
  101b44:	e8 c9 e7 ff ff       	call   100312 <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101b49:	8b 45 08             	mov    0x8(%ebp),%eax
  101b4c:	8b 40 0c             	mov    0xc(%eax),%eax
  101b4f:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b53:	c7 04 24 c9 38 10 00 	movl   $0x1038c9,(%esp)
  101b5a:	e8 b3 e7 ff ff       	call   100312 <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101b5f:	8b 45 08             	mov    0x8(%ebp),%eax
  101b62:	8b 40 10             	mov    0x10(%eax),%eax
  101b65:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b69:	c7 04 24 d8 38 10 00 	movl   $0x1038d8,(%esp)
  101b70:	e8 9d e7 ff ff       	call   100312 <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101b75:	8b 45 08             	mov    0x8(%ebp),%eax
  101b78:	8b 40 14             	mov    0x14(%eax),%eax
  101b7b:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b7f:	c7 04 24 e7 38 10 00 	movl   $0x1038e7,(%esp)
  101b86:	e8 87 e7 ff ff       	call   100312 <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101b8b:	8b 45 08             	mov    0x8(%ebp),%eax
  101b8e:	8b 40 18             	mov    0x18(%eax),%eax
  101b91:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b95:	c7 04 24 f6 38 10 00 	movl   $0x1038f6,(%esp)
  101b9c:	e8 71 e7 ff ff       	call   100312 <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101ba1:	8b 45 08             	mov    0x8(%ebp),%eax
  101ba4:	8b 40 1c             	mov    0x1c(%eax),%eax
  101ba7:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bab:	c7 04 24 05 39 10 00 	movl   $0x103905,(%esp)
  101bb2:	e8 5b e7 ff ff       	call   100312 <cprintf>
}
  101bb7:	c9                   	leave  
  101bb8:	c3                   	ret    

00101bb9 <trap_dispatch>:
int tick_count=0;
/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101bb9:	55                   	push   %ebp
  101bba:	89 e5                	mov    %esp,%ebp
  101bbc:	83 ec 28             	sub    $0x28,%esp
    char c;

    switch (tf->tf_trapno) {
  101bbf:	8b 45 08             	mov    0x8(%ebp),%eax
  101bc2:	8b 40 30             	mov    0x30(%eax),%eax
  101bc5:	83 f8 2f             	cmp    $0x2f,%eax
  101bc8:	77 21                	ja     101beb <trap_dispatch+0x32>
  101bca:	83 f8 2e             	cmp    $0x2e,%eax
  101bcd:	0f 83 05 01 00 00    	jae    101cd8 <trap_dispatch+0x11f>
  101bd3:	83 f8 21             	cmp    $0x21,%eax
  101bd6:	0f 84 82 00 00 00    	je     101c5e <trap_dispatch+0xa5>
  101bdc:	83 f8 24             	cmp    $0x24,%eax
  101bdf:	74 57                	je     101c38 <trap_dispatch+0x7f>
  101be1:	83 f8 20             	cmp    $0x20,%eax
  101be4:	74 16                	je     101bfc <trap_dispatch+0x43>
  101be6:	e9 b5 00 00 00       	jmp    101ca0 <trap_dispatch+0xe7>
  101beb:	83 e8 78             	sub    $0x78,%eax
  101bee:	83 f8 01             	cmp    $0x1,%eax
  101bf1:	0f 87 a9 00 00 00    	ja     101ca0 <trap_dispatch+0xe7>
  101bf7:	e9 88 00 00 00       	jmp    101c84 <trap_dispatch+0xcb>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
    cprintf("^_^\n");
  101bfc:	c7 04 24 14 39 10 00 	movl   $0x103914,(%esp)
  101c03:	e8 0a e7 ff ff       	call   100312 <cprintf>
    tick_count++;
  101c08:	a1 a0 f0 10 00       	mov    0x10f0a0,%eax
  101c0d:	83 c0 01             	add    $0x1,%eax
  101c10:	a3 a0 f0 10 00       	mov    %eax,0x10f0a0
    if(tick_count==TICK_NUM){
  101c15:	a1 a0 f0 10 00       	mov    0x10f0a0,%eax
  101c1a:	83 f8 64             	cmp    $0x64,%eax
  101c1d:	75 14                	jne    101c33 <trap_dispatch+0x7a>
    	print_ticks();
  101c1f:	e8 c5 fb ff ff       	call   1017e9 <print_ticks>
    	tick_count=0;
  101c24:	c7 05 a0 f0 10 00 00 	movl   $0x0,0x10f0a0
  101c2b:	00 00 00 
    }
        break;
  101c2e:	e9 a6 00 00 00       	jmp    101cd9 <trap_dispatch+0x120>
  101c33:	e9 a1 00 00 00       	jmp    101cd9 <trap_dispatch+0x120>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101c38:	e8 83 f9 ff ff       	call   1015c0 <cons_getc>
  101c3d:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101c40:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101c44:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101c48:	89 54 24 08          	mov    %edx,0x8(%esp)
  101c4c:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c50:	c7 04 24 19 39 10 00 	movl   $0x103919,(%esp)
  101c57:	e8 b6 e6 ff ff       	call   100312 <cprintf>
        break;
  101c5c:	eb 7b                	jmp    101cd9 <trap_dispatch+0x120>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101c5e:	e8 5d f9 ff ff       	call   1015c0 <cons_getc>
  101c63:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101c66:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101c6a:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101c6e:	89 54 24 08          	mov    %edx,0x8(%esp)
  101c72:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c76:	c7 04 24 2b 39 10 00 	movl   $0x10392b,(%esp)
  101c7d:	e8 90 e6 ff ff       	call   100312 <cprintf>
        break;
  101c82:	eb 55                	jmp    101cd9 <trap_dispatch+0x120>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
    case T_SWITCH_TOK:
        panic("T_SWITCH_** ??\n");
  101c84:	c7 44 24 08 3a 39 10 	movl   $0x10393a,0x8(%esp)
  101c8b:	00 
  101c8c:	c7 44 24 04 af 00 00 	movl   $0xaf,0x4(%esp)
  101c93:	00 
  101c94:	c7 04 24 4a 39 10 00 	movl   $0x10394a,(%esp)
  101c9b:	e8 02 f0 ff ff       	call   100ca2 <__panic>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101ca0:	8b 45 08             	mov    0x8(%ebp),%eax
  101ca3:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101ca7:	0f b7 c0             	movzwl %ax,%eax
  101caa:	83 e0 03             	and    $0x3,%eax
  101cad:	85 c0                	test   %eax,%eax
  101caf:	75 28                	jne    101cd9 <trap_dispatch+0x120>
            print_trapframe(tf);
  101cb1:	8b 45 08             	mov    0x8(%ebp),%eax
  101cb4:	89 04 24             	mov    %eax,(%esp)
  101cb7:	e8 81 fc ff ff       	call   10193d <print_trapframe>
            panic("unexpected trap in kernel.\n");
  101cbc:	c7 44 24 08 5b 39 10 	movl   $0x10395b,0x8(%esp)
  101cc3:	00 
  101cc4:	c7 44 24 04 b9 00 00 	movl   $0xb9,0x4(%esp)
  101ccb:	00 
  101ccc:	c7 04 24 4a 39 10 00 	movl   $0x10394a,(%esp)
  101cd3:	e8 ca ef ff ff       	call   100ca2 <__panic>
        panic("T_SWITCH_** ??\n");
        break;
    case IRQ_OFFSET + IRQ_IDE1:
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
  101cd8:	90                   	nop
        if ((tf->tf_cs & 3) == 0) {
            print_trapframe(tf);
            panic("unexpected trap in kernel.\n");
        }
    }
}
  101cd9:	c9                   	leave  
  101cda:	c3                   	ret    

00101cdb <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101cdb:	55                   	push   %ebp
  101cdc:	89 e5                	mov    %esp,%ebp
  101cde:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101ce1:	8b 45 08             	mov    0x8(%ebp),%eax
  101ce4:	89 04 24             	mov    %eax,(%esp)
  101ce7:	e8 cd fe ff ff       	call   101bb9 <trap_dispatch>
}
  101cec:	c9                   	leave  
  101ced:	c3                   	ret    

00101cee <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  101cee:	1e                   	push   %ds
    pushl %es
  101cef:	06                   	push   %es
    pushl %fs
  101cf0:	0f a0                	push   %fs
    pushl %gs
  101cf2:	0f a8                	push   %gs
    pushal
  101cf4:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  101cf5:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  101cfa:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  101cfc:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  101cfe:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  101cff:	e8 d7 ff ff ff       	call   101cdb <trap>

    # pop the pushed stack pointer
    popl %esp
  101d04:	5c                   	pop    %esp

00101d05 <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  101d05:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  101d06:	0f a9                	pop    %gs
    popl %fs
  101d08:	0f a1                	pop    %fs
    popl %es
  101d0a:	07                   	pop    %es
    popl %ds
  101d0b:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  101d0c:	83 c4 08             	add    $0x8,%esp
    iret
  101d0f:	cf                   	iret   

00101d10 <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101d10:	6a 00                	push   $0x0
  pushl $0
  101d12:	6a 00                	push   $0x0
  jmp __alltraps
  101d14:	e9 d5 ff ff ff       	jmp    101cee <__alltraps>

00101d19 <vector1>:
.globl vector1
vector1:
  pushl $0
  101d19:	6a 00                	push   $0x0
  pushl $1
  101d1b:	6a 01                	push   $0x1
  jmp __alltraps
  101d1d:	e9 cc ff ff ff       	jmp    101cee <__alltraps>

00101d22 <vector2>:
.globl vector2
vector2:
  pushl $0
  101d22:	6a 00                	push   $0x0
  pushl $2
  101d24:	6a 02                	push   $0x2
  jmp __alltraps
  101d26:	e9 c3 ff ff ff       	jmp    101cee <__alltraps>

00101d2b <vector3>:
.globl vector3
vector3:
  pushl $0
  101d2b:	6a 00                	push   $0x0
  pushl $3
  101d2d:	6a 03                	push   $0x3
  jmp __alltraps
  101d2f:	e9 ba ff ff ff       	jmp    101cee <__alltraps>

00101d34 <vector4>:
.globl vector4
vector4:
  pushl $0
  101d34:	6a 00                	push   $0x0
  pushl $4
  101d36:	6a 04                	push   $0x4
  jmp __alltraps
  101d38:	e9 b1 ff ff ff       	jmp    101cee <__alltraps>

00101d3d <vector5>:
.globl vector5
vector5:
  pushl $0
  101d3d:	6a 00                	push   $0x0
  pushl $5
  101d3f:	6a 05                	push   $0x5
  jmp __alltraps
  101d41:	e9 a8 ff ff ff       	jmp    101cee <__alltraps>

00101d46 <vector6>:
.globl vector6
vector6:
  pushl $0
  101d46:	6a 00                	push   $0x0
  pushl $6
  101d48:	6a 06                	push   $0x6
  jmp __alltraps
  101d4a:	e9 9f ff ff ff       	jmp    101cee <__alltraps>

00101d4f <vector7>:
.globl vector7
vector7:
  pushl $0
  101d4f:	6a 00                	push   $0x0
  pushl $7
  101d51:	6a 07                	push   $0x7
  jmp __alltraps
  101d53:	e9 96 ff ff ff       	jmp    101cee <__alltraps>

00101d58 <vector8>:
.globl vector8
vector8:
  pushl $8
  101d58:	6a 08                	push   $0x8
  jmp __alltraps
  101d5a:	e9 8f ff ff ff       	jmp    101cee <__alltraps>

00101d5f <vector9>:
.globl vector9
vector9:
  pushl $9
  101d5f:	6a 09                	push   $0x9
  jmp __alltraps
  101d61:	e9 88 ff ff ff       	jmp    101cee <__alltraps>

00101d66 <vector10>:
.globl vector10
vector10:
  pushl $10
  101d66:	6a 0a                	push   $0xa
  jmp __alltraps
  101d68:	e9 81 ff ff ff       	jmp    101cee <__alltraps>

00101d6d <vector11>:
.globl vector11
vector11:
  pushl $11
  101d6d:	6a 0b                	push   $0xb
  jmp __alltraps
  101d6f:	e9 7a ff ff ff       	jmp    101cee <__alltraps>

00101d74 <vector12>:
.globl vector12
vector12:
  pushl $12
  101d74:	6a 0c                	push   $0xc
  jmp __alltraps
  101d76:	e9 73 ff ff ff       	jmp    101cee <__alltraps>

00101d7b <vector13>:
.globl vector13
vector13:
  pushl $13
  101d7b:	6a 0d                	push   $0xd
  jmp __alltraps
  101d7d:	e9 6c ff ff ff       	jmp    101cee <__alltraps>

00101d82 <vector14>:
.globl vector14
vector14:
  pushl $14
  101d82:	6a 0e                	push   $0xe
  jmp __alltraps
  101d84:	e9 65 ff ff ff       	jmp    101cee <__alltraps>

00101d89 <vector15>:
.globl vector15
vector15:
  pushl $0
  101d89:	6a 00                	push   $0x0
  pushl $15
  101d8b:	6a 0f                	push   $0xf
  jmp __alltraps
  101d8d:	e9 5c ff ff ff       	jmp    101cee <__alltraps>

00101d92 <vector16>:
.globl vector16
vector16:
  pushl $0
  101d92:	6a 00                	push   $0x0
  pushl $16
  101d94:	6a 10                	push   $0x10
  jmp __alltraps
  101d96:	e9 53 ff ff ff       	jmp    101cee <__alltraps>

00101d9b <vector17>:
.globl vector17
vector17:
  pushl $17
  101d9b:	6a 11                	push   $0x11
  jmp __alltraps
  101d9d:	e9 4c ff ff ff       	jmp    101cee <__alltraps>

00101da2 <vector18>:
.globl vector18
vector18:
  pushl $0
  101da2:	6a 00                	push   $0x0
  pushl $18
  101da4:	6a 12                	push   $0x12
  jmp __alltraps
  101da6:	e9 43 ff ff ff       	jmp    101cee <__alltraps>

00101dab <vector19>:
.globl vector19
vector19:
  pushl $0
  101dab:	6a 00                	push   $0x0
  pushl $19
  101dad:	6a 13                	push   $0x13
  jmp __alltraps
  101daf:	e9 3a ff ff ff       	jmp    101cee <__alltraps>

00101db4 <vector20>:
.globl vector20
vector20:
  pushl $0
  101db4:	6a 00                	push   $0x0
  pushl $20
  101db6:	6a 14                	push   $0x14
  jmp __alltraps
  101db8:	e9 31 ff ff ff       	jmp    101cee <__alltraps>

00101dbd <vector21>:
.globl vector21
vector21:
  pushl $0
  101dbd:	6a 00                	push   $0x0
  pushl $21
  101dbf:	6a 15                	push   $0x15
  jmp __alltraps
  101dc1:	e9 28 ff ff ff       	jmp    101cee <__alltraps>

00101dc6 <vector22>:
.globl vector22
vector22:
  pushl $0
  101dc6:	6a 00                	push   $0x0
  pushl $22
  101dc8:	6a 16                	push   $0x16
  jmp __alltraps
  101dca:	e9 1f ff ff ff       	jmp    101cee <__alltraps>

00101dcf <vector23>:
.globl vector23
vector23:
  pushl $0
  101dcf:	6a 00                	push   $0x0
  pushl $23
  101dd1:	6a 17                	push   $0x17
  jmp __alltraps
  101dd3:	e9 16 ff ff ff       	jmp    101cee <__alltraps>

00101dd8 <vector24>:
.globl vector24
vector24:
  pushl $0
  101dd8:	6a 00                	push   $0x0
  pushl $24
  101dda:	6a 18                	push   $0x18
  jmp __alltraps
  101ddc:	e9 0d ff ff ff       	jmp    101cee <__alltraps>

00101de1 <vector25>:
.globl vector25
vector25:
  pushl $0
  101de1:	6a 00                	push   $0x0
  pushl $25
  101de3:	6a 19                	push   $0x19
  jmp __alltraps
  101de5:	e9 04 ff ff ff       	jmp    101cee <__alltraps>

00101dea <vector26>:
.globl vector26
vector26:
  pushl $0
  101dea:	6a 00                	push   $0x0
  pushl $26
  101dec:	6a 1a                	push   $0x1a
  jmp __alltraps
  101dee:	e9 fb fe ff ff       	jmp    101cee <__alltraps>

00101df3 <vector27>:
.globl vector27
vector27:
  pushl $0
  101df3:	6a 00                	push   $0x0
  pushl $27
  101df5:	6a 1b                	push   $0x1b
  jmp __alltraps
  101df7:	e9 f2 fe ff ff       	jmp    101cee <__alltraps>

00101dfc <vector28>:
.globl vector28
vector28:
  pushl $0
  101dfc:	6a 00                	push   $0x0
  pushl $28
  101dfe:	6a 1c                	push   $0x1c
  jmp __alltraps
  101e00:	e9 e9 fe ff ff       	jmp    101cee <__alltraps>

00101e05 <vector29>:
.globl vector29
vector29:
  pushl $0
  101e05:	6a 00                	push   $0x0
  pushl $29
  101e07:	6a 1d                	push   $0x1d
  jmp __alltraps
  101e09:	e9 e0 fe ff ff       	jmp    101cee <__alltraps>

00101e0e <vector30>:
.globl vector30
vector30:
  pushl $0
  101e0e:	6a 00                	push   $0x0
  pushl $30
  101e10:	6a 1e                	push   $0x1e
  jmp __alltraps
  101e12:	e9 d7 fe ff ff       	jmp    101cee <__alltraps>

00101e17 <vector31>:
.globl vector31
vector31:
  pushl $0
  101e17:	6a 00                	push   $0x0
  pushl $31
  101e19:	6a 1f                	push   $0x1f
  jmp __alltraps
  101e1b:	e9 ce fe ff ff       	jmp    101cee <__alltraps>

00101e20 <vector32>:
.globl vector32
vector32:
  pushl $0
  101e20:	6a 00                	push   $0x0
  pushl $32
  101e22:	6a 20                	push   $0x20
  jmp __alltraps
  101e24:	e9 c5 fe ff ff       	jmp    101cee <__alltraps>

00101e29 <vector33>:
.globl vector33
vector33:
  pushl $0
  101e29:	6a 00                	push   $0x0
  pushl $33
  101e2b:	6a 21                	push   $0x21
  jmp __alltraps
  101e2d:	e9 bc fe ff ff       	jmp    101cee <__alltraps>

00101e32 <vector34>:
.globl vector34
vector34:
  pushl $0
  101e32:	6a 00                	push   $0x0
  pushl $34
  101e34:	6a 22                	push   $0x22
  jmp __alltraps
  101e36:	e9 b3 fe ff ff       	jmp    101cee <__alltraps>

00101e3b <vector35>:
.globl vector35
vector35:
  pushl $0
  101e3b:	6a 00                	push   $0x0
  pushl $35
  101e3d:	6a 23                	push   $0x23
  jmp __alltraps
  101e3f:	e9 aa fe ff ff       	jmp    101cee <__alltraps>

00101e44 <vector36>:
.globl vector36
vector36:
  pushl $0
  101e44:	6a 00                	push   $0x0
  pushl $36
  101e46:	6a 24                	push   $0x24
  jmp __alltraps
  101e48:	e9 a1 fe ff ff       	jmp    101cee <__alltraps>

00101e4d <vector37>:
.globl vector37
vector37:
  pushl $0
  101e4d:	6a 00                	push   $0x0
  pushl $37
  101e4f:	6a 25                	push   $0x25
  jmp __alltraps
  101e51:	e9 98 fe ff ff       	jmp    101cee <__alltraps>

00101e56 <vector38>:
.globl vector38
vector38:
  pushl $0
  101e56:	6a 00                	push   $0x0
  pushl $38
  101e58:	6a 26                	push   $0x26
  jmp __alltraps
  101e5a:	e9 8f fe ff ff       	jmp    101cee <__alltraps>

00101e5f <vector39>:
.globl vector39
vector39:
  pushl $0
  101e5f:	6a 00                	push   $0x0
  pushl $39
  101e61:	6a 27                	push   $0x27
  jmp __alltraps
  101e63:	e9 86 fe ff ff       	jmp    101cee <__alltraps>

00101e68 <vector40>:
.globl vector40
vector40:
  pushl $0
  101e68:	6a 00                	push   $0x0
  pushl $40
  101e6a:	6a 28                	push   $0x28
  jmp __alltraps
  101e6c:	e9 7d fe ff ff       	jmp    101cee <__alltraps>

00101e71 <vector41>:
.globl vector41
vector41:
  pushl $0
  101e71:	6a 00                	push   $0x0
  pushl $41
  101e73:	6a 29                	push   $0x29
  jmp __alltraps
  101e75:	e9 74 fe ff ff       	jmp    101cee <__alltraps>

00101e7a <vector42>:
.globl vector42
vector42:
  pushl $0
  101e7a:	6a 00                	push   $0x0
  pushl $42
  101e7c:	6a 2a                	push   $0x2a
  jmp __alltraps
  101e7e:	e9 6b fe ff ff       	jmp    101cee <__alltraps>

00101e83 <vector43>:
.globl vector43
vector43:
  pushl $0
  101e83:	6a 00                	push   $0x0
  pushl $43
  101e85:	6a 2b                	push   $0x2b
  jmp __alltraps
  101e87:	e9 62 fe ff ff       	jmp    101cee <__alltraps>

00101e8c <vector44>:
.globl vector44
vector44:
  pushl $0
  101e8c:	6a 00                	push   $0x0
  pushl $44
  101e8e:	6a 2c                	push   $0x2c
  jmp __alltraps
  101e90:	e9 59 fe ff ff       	jmp    101cee <__alltraps>

00101e95 <vector45>:
.globl vector45
vector45:
  pushl $0
  101e95:	6a 00                	push   $0x0
  pushl $45
  101e97:	6a 2d                	push   $0x2d
  jmp __alltraps
  101e99:	e9 50 fe ff ff       	jmp    101cee <__alltraps>

00101e9e <vector46>:
.globl vector46
vector46:
  pushl $0
  101e9e:	6a 00                	push   $0x0
  pushl $46
  101ea0:	6a 2e                	push   $0x2e
  jmp __alltraps
  101ea2:	e9 47 fe ff ff       	jmp    101cee <__alltraps>

00101ea7 <vector47>:
.globl vector47
vector47:
  pushl $0
  101ea7:	6a 00                	push   $0x0
  pushl $47
  101ea9:	6a 2f                	push   $0x2f
  jmp __alltraps
  101eab:	e9 3e fe ff ff       	jmp    101cee <__alltraps>

00101eb0 <vector48>:
.globl vector48
vector48:
  pushl $0
  101eb0:	6a 00                	push   $0x0
  pushl $48
  101eb2:	6a 30                	push   $0x30
  jmp __alltraps
  101eb4:	e9 35 fe ff ff       	jmp    101cee <__alltraps>

00101eb9 <vector49>:
.globl vector49
vector49:
  pushl $0
  101eb9:	6a 00                	push   $0x0
  pushl $49
  101ebb:	6a 31                	push   $0x31
  jmp __alltraps
  101ebd:	e9 2c fe ff ff       	jmp    101cee <__alltraps>

00101ec2 <vector50>:
.globl vector50
vector50:
  pushl $0
  101ec2:	6a 00                	push   $0x0
  pushl $50
  101ec4:	6a 32                	push   $0x32
  jmp __alltraps
  101ec6:	e9 23 fe ff ff       	jmp    101cee <__alltraps>

00101ecb <vector51>:
.globl vector51
vector51:
  pushl $0
  101ecb:	6a 00                	push   $0x0
  pushl $51
  101ecd:	6a 33                	push   $0x33
  jmp __alltraps
  101ecf:	e9 1a fe ff ff       	jmp    101cee <__alltraps>

00101ed4 <vector52>:
.globl vector52
vector52:
  pushl $0
  101ed4:	6a 00                	push   $0x0
  pushl $52
  101ed6:	6a 34                	push   $0x34
  jmp __alltraps
  101ed8:	e9 11 fe ff ff       	jmp    101cee <__alltraps>

00101edd <vector53>:
.globl vector53
vector53:
  pushl $0
  101edd:	6a 00                	push   $0x0
  pushl $53
  101edf:	6a 35                	push   $0x35
  jmp __alltraps
  101ee1:	e9 08 fe ff ff       	jmp    101cee <__alltraps>

00101ee6 <vector54>:
.globl vector54
vector54:
  pushl $0
  101ee6:	6a 00                	push   $0x0
  pushl $54
  101ee8:	6a 36                	push   $0x36
  jmp __alltraps
  101eea:	e9 ff fd ff ff       	jmp    101cee <__alltraps>

00101eef <vector55>:
.globl vector55
vector55:
  pushl $0
  101eef:	6a 00                	push   $0x0
  pushl $55
  101ef1:	6a 37                	push   $0x37
  jmp __alltraps
  101ef3:	e9 f6 fd ff ff       	jmp    101cee <__alltraps>

00101ef8 <vector56>:
.globl vector56
vector56:
  pushl $0
  101ef8:	6a 00                	push   $0x0
  pushl $56
  101efa:	6a 38                	push   $0x38
  jmp __alltraps
  101efc:	e9 ed fd ff ff       	jmp    101cee <__alltraps>

00101f01 <vector57>:
.globl vector57
vector57:
  pushl $0
  101f01:	6a 00                	push   $0x0
  pushl $57
  101f03:	6a 39                	push   $0x39
  jmp __alltraps
  101f05:	e9 e4 fd ff ff       	jmp    101cee <__alltraps>

00101f0a <vector58>:
.globl vector58
vector58:
  pushl $0
  101f0a:	6a 00                	push   $0x0
  pushl $58
  101f0c:	6a 3a                	push   $0x3a
  jmp __alltraps
  101f0e:	e9 db fd ff ff       	jmp    101cee <__alltraps>

00101f13 <vector59>:
.globl vector59
vector59:
  pushl $0
  101f13:	6a 00                	push   $0x0
  pushl $59
  101f15:	6a 3b                	push   $0x3b
  jmp __alltraps
  101f17:	e9 d2 fd ff ff       	jmp    101cee <__alltraps>

00101f1c <vector60>:
.globl vector60
vector60:
  pushl $0
  101f1c:	6a 00                	push   $0x0
  pushl $60
  101f1e:	6a 3c                	push   $0x3c
  jmp __alltraps
  101f20:	e9 c9 fd ff ff       	jmp    101cee <__alltraps>

00101f25 <vector61>:
.globl vector61
vector61:
  pushl $0
  101f25:	6a 00                	push   $0x0
  pushl $61
  101f27:	6a 3d                	push   $0x3d
  jmp __alltraps
  101f29:	e9 c0 fd ff ff       	jmp    101cee <__alltraps>

00101f2e <vector62>:
.globl vector62
vector62:
  pushl $0
  101f2e:	6a 00                	push   $0x0
  pushl $62
  101f30:	6a 3e                	push   $0x3e
  jmp __alltraps
  101f32:	e9 b7 fd ff ff       	jmp    101cee <__alltraps>

00101f37 <vector63>:
.globl vector63
vector63:
  pushl $0
  101f37:	6a 00                	push   $0x0
  pushl $63
  101f39:	6a 3f                	push   $0x3f
  jmp __alltraps
  101f3b:	e9 ae fd ff ff       	jmp    101cee <__alltraps>

00101f40 <vector64>:
.globl vector64
vector64:
  pushl $0
  101f40:	6a 00                	push   $0x0
  pushl $64
  101f42:	6a 40                	push   $0x40
  jmp __alltraps
  101f44:	e9 a5 fd ff ff       	jmp    101cee <__alltraps>

00101f49 <vector65>:
.globl vector65
vector65:
  pushl $0
  101f49:	6a 00                	push   $0x0
  pushl $65
  101f4b:	6a 41                	push   $0x41
  jmp __alltraps
  101f4d:	e9 9c fd ff ff       	jmp    101cee <__alltraps>

00101f52 <vector66>:
.globl vector66
vector66:
  pushl $0
  101f52:	6a 00                	push   $0x0
  pushl $66
  101f54:	6a 42                	push   $0x42
  jmp __alltraps
  101f56:	e9 93 fd ff ff       	jmp    101cee <__alltraps>

00101f5b <vector67>:
.globl vector67
vector67:
  pushl $0
  101f5b:	6a 00                	push   $0x0
  pushl $67
  101f5d:	6a 43                	push   $0x43
  jmp __alltraps
  101f5f:	e9 8a fd ff ff       	jmp    101cee <__alltraps>

00101f64 <vector68>:
.globl vector68
vector68:
  pushl $0
  101f64:	6a 00                	push   $0x0
  pushl $68
  101f66:	6a 44                	push   $0x44
  jmp __alltraps
  101f68:	e9 81 fd ff ff       	jmp    101cee <__alltraps>

00101f6d <vector69>:
.globl vector69
vector69:
  pushl $0
  101f6d:	6a 00                	push   $0x0
  pushl $69
  101f6f:	6a 45                	push   $0x45
  jmp __alltraps
  101f71:	e9 78 fd ff ff       	jmp    101cee <__alltraps>

00101f76 <vector70>:
.globl vector70
vector70:
  pushl $0
  101f76:	6a 00                	push   $0x0
  pushl $70
  101f78:	6a 46                	push   $0x46
  jmp __alltraps
  101f7a:	e9 6f fd ff ff       	jmp    101cee <__alltraps>

00101f7f <vector71>:
.globl vector71
vector71:
  pushl $0
  101f7f:	6a 00                	push   $0x0
  pushl $71
  101f81:	6a 47                	push   $0x47
  jmp __alltraps
  101f83:	e9 66 fd ff ff       	jmp    101cee <__alltraps>

00101f88 <vector72>:
.globl vector72
vector72:
  pushl $0
  101f88:	6a 00                	push   $0x0
  pushl $72
  101f8a:	6a 48                	push   $0x48
  jmp __alltraps
  101f8c:	e9 5d fd ff ff       	jmp    101cee <__alltraps>

00101f91 <vector73>:
.globl vector73
vector73:
  pushl $0
  101f91:	6a 00                	push   $0x0
  pushl $73
  101f93:	6a 49                	push   $0x49
  jmp __alltraps
  101f95:	e9 54 fd ff ff       	jmp    101cee <__alltraps>

00101f9a <vector74>:
.globl vector74
vector74:
  pushl $0
  101f9a:	6a 00                	push   $0x0
  pushl $74
  101f9c:	6a 4a                	push   $0x4a
  jmp __alltraps
  101f9e:	e9 4b fd ff ff       	jmp    101cee <__alltraps>

00101fa3 <vector75>:
.globl vector75
vector75:
  pushl $0
  101fa3:	6a 00                	push   $0x0
  pushl $75
  101fa5:	6a 4b                	push   $0x4b
  jmp __alltraps
  101fa7:	e9 42 fd ff ff       	jmp    101cee <__alltraps>

00101fac <vector76>:
.globl vector76
vector76:
  pushl $0
  101fac:	6a 00                	push   $0x0
  pushl $76
  101fae:	6a 4c                	push   $0x4c
  jmp __alltraps
  101fb0:	e9 39 fd ff ff       	jmp    101cee <__alltraps>

00101fb5 <vector77>:
.globl vector77
vector77:
  pushl $0
  101fb5:	6a 00                	push   $0x0
  pushl $77
  101fb7:	6a 4d                	push   $0x4d
  jmp __alltraps
  101fb9:	e9 30 fd ff ff       	jmp    101cee <__alltraps>

00101fbe <vector78>:
.globl vector78
vector78:
  pushl $0
  101fbe:	6a 00                	push   $0x0
  pushl $78
  101fc0:	6a 4e                	push   $0x4e
  jmp __alltraps
  101fc2:	e9 27 fd ff ff       	jmp    101cee <__alltraps>

00101fc7 <vector79>:
.globl vector79
vector79:
  pushl $0
  101fc7:	6a 00                	push   $0x0
  pushl $79
  101fc9:	6a 4f                	push   $0x4f
  jmp __alltraps
  101fcb:	e9 1e fd ff ff       	jmp    101cee <__alltraps>

00101fd0 <vector80>:
.globl vector80
vector80:
  pushl $0
  101fd0:	6a 00                	push   $0x0
  pushl $80
  101fd2:	6a 50                	push   $0x50
  jmp __alltraps
  101fd4:	e9 15 fd ff ff       	jmp    101cee <__alltraps>

00101fd9 <vector81>:
.globl vector81
vector81:
  pushl $0
  101fd9:	6a 00                	push   $0x0
  pushl $81
  101fdb:	6a 51                	push   $0x51
  jmp __alltraps
  101fdd:	e9 0c fd ff ff       	jmp    101cee <__alltraps>

00101fe2 <vector82>:
.globl vector82
vector82:
  pushl $0
  101fe2:	6a 00                	push   $0x0
  pushl $82
  101fe4:	6a 52                	push   $0x52
  jmp __alltraps
  101fe6:	e9 03 fd ff ff       	jmp    101cee <__alltraps>

00101feb <vector83>:
.globl vector83
vector83:
  pushl $0
  101feb:	6a 00                	push   $0x0
  pushl $83
  101fed:	6a 53                	push   $0x53
  jmp __alltraps
  101fef:	e9 fa fc ff ff       	jmp    101cee <__alltraps>

00101ff4 <vector84>:
.globl vector84
vector84:
  pushl $0
  101ff4:	6a 00                	push   $0x0
  pushl $84
  101ff6:	6a 54                	push   $0x54
  jmp __alltraps
  101ff8:	e9 f1 fc ff ff       	jmp    101cee <__alltraps>

00101ffd <vector85>:
.globl vector85
vector85:
  pushl $0
  101ffd:	6a 00                	push   $0x0
  pushl $85
  101fff:	6a 55                	push   $0x55
  jmp __alltraps
  102001:	e9 e8 fc ff ff       	jmp    101cee <__alltraps>

00102006 <vector86>:
.globl vector86
vector86:
  pushl $0
  102006:	6a 00                	push   $0x0
  pushl $86
  102008:	6a 56                	push   $0x56
  jmp __alltraps
  10200a:	e9 df fc ff ff       	jmp    101cee <__alltraps>

0010200f <vector87>:
.globl vector87
vector87:
  pushl $0
  10200f:	6a 00                	push   $0x0
  pushl $87
  102011:	6a 57                	push   $0x57
  jmp __alltraps
  102013:	e9 d6 fc ff ff       	jmp    101cee <__alltraps>

00102018 <vector88>:
.globl vector88
vector88:
  pushl $0
  102018:	6a 00                	push   $0x0
  pushl $88
  10201a:	6a 58                	push   $0x58
  jmp __alltraps
  10201c:	e9 cd fc ff ff       	jmp    101cee <__alltraps>

00102021 <vector89>:
.globl vector89
vector89:
  pushl $0
  102021:	6a 00                	push   $0x0
  pushl $89
  102023:	6a 59                	push   $0x59
  jmp __alltraps
  102025:	e9 c4 fc ff ff       	jmp    101cee <__alltraps>

0010202a <vector90>:
.globl vector90
vector90:
  pushl $0
  10202a:	6a 00                	push   $0x0
  pushl $90
  10202c:	6a 5a                	push   $0x5a
  jmp __alltraps
  10202e:	e9 bb fc ff ff       	jmp    101cee <__alltraps>

00102033 <vector91>:
.globl vector91
vector91:
  pushl $0
  102033:	6a 00                	push   $0x0
  pushl $91
  102035:	6a 5b                	push   $0x5b
  jmp __alltraps
  102037:	e9 b2 fc ff ff       	jmp    101cee <__alltraps>

0010203c <vector92>:
.globl vector92
vector92:
  pushl $0
  10203c:	6a 00                	push   $0x0
  pushl $92
  10203e:	6a 5c                	push   $0x5c
  jmp __alltraps
  102040:	e9 a9 fc ff ff       	jmp    101cee <__alltraps>

00102045 <vector93>:
.globl vector93
vector93:
  pushl $0
  102045:	6a 00                	push   $0x0
  pushl $93
  102047:	6a 5d                	push   $0x5d
  jmp __alltraps
  102049:	e9 a0 fc ff ff       	jmp    101cee <__alltraps>

0010204e <vector94>:
.globl vector94
vector94:
  pushl $0
  10204e:	6a 00                	push   $0x0
  pushl $94
  102050:	6a 5e                	push   $0x5e
  jmp __alltraps
  102052:	e9 97 fc ff ff       	jmp    101cee <__alltraps>

00102057 <vector95>:
.globl vector95
vector95:
  pushl $0
  102057:	6a 00                	push   $0x0
  pushl $95
  102059:	6a 5f                	push   $0x5f
  jmp __alltraps
  10205b:	e9 8e fc ff ff       	jmp    101cee <__alltraps>

00102060 <vector96>:
.globl vector96
vector96:
  pushl $0
  102060:	6a 00                	push   $0x0
  pushl $96
  102062:	6a 60                	push   $0x60
  jmp __alltraps
  102064:	e9 85 fc ff ff       	jmp    101cee <__alltraps>

00102069 <vector97>:
.globl vector97
vector97:
  pushl $0
  102069:	6a 00                	push   $0x0
  pushl $97
  10206b:	6a 61                	push   $0x61
  jmp __alltraps
  10206d:	e9 7c fc ff ff       	jmp    101cee <__alltraps>

00102072 <vector98>:
.globl vector98
vector98:
  pushl $0
  102072:	6a 00                	push   $0x0
  pushl $98
  102074:	6a 62                	push   $0x62
  jmp __alltraps
  102076:	e9 73 fc ff ff       	jmp    101cee <__alltraps>

0010207b <vector99>:
.globl vector99
vector99:
  pushl $0
  10207b:	6a 00                	push   $0x0
  pushl $99
  10207d:	6a 63                	push   $0x63
  jmp __alltraps
  10207f:	e9 6a fc ff ff       	jmp    101cee <__alltraps>

00102084 <vector100>:
.globl vector100
vector100:
  pushl $0
  102084:	6a 00                	push   $0x0
  pushl $100
  102086:	6a 64                	push   $0x64
  jmp __alltraps
  102088:	e9 61 fc ff ff       	jmp    101cee <__alltraps>

0010208d <vector101>:
.globl vector101
vector101:
  pushl $0
  10208d:	6a 00                	push   $0x0
  pushl $101
  10208f:	6a 65                	push   $0x65
  jmp __alltraps
  102091:	e9 58 fc ff ff       	jmp    101cee <__alltraps>

00102096 <vector102>:
.globl vector102
vector102:
  pushl $0
  102096:	6a 00                	push   $0x0
  pushl $102
  102098:	6a 66                	push   $0x66
  jmp __alltraps
  10209a:	e9 4f fc ff ff       	jmp    101cee <__alltraps>

0010209f <vector103>:
.globl vector103
vector103:
  pushl $0
  10209f:	6a 00                	push   $0x0
  pushl $103
  1020a1:	6a 67                	push   $0x67
  jmp __alltraps
  1020a3:	e9 46 fc ff ff       	jmp    101cee <__alltraps>

001020a8 <vector104>:
.globl vector104
vector104:
  pushl $0
  1020a8:	6a 00                	push   $0x0
  pushl $104
  1020aa:	6a 68                	push   $0x68
  jmp __alltraps
  1020ac:	e9 3d fc ff ff       	jmp    101cee <__alltraps>

001020b1 <vector105>:
.globl vector105
vector105:
  pushl $0
  1020b1:	6a 00                	push   $0x0
  pushl $105
  1020b3:	6a 69                	push   $0x69
  jmp __alltraps
  1020b5:	e9 34 fc ff ff       	jmp    101cee <__alltraps>

001020ba <vector106>:
.globl vector106
vector106:
  pushl $0
  1020ba:	6a 00                	push   $0x0
  pushl $106
  1020bc:	6a 6a                	push   $0x6a
  jmp __alltraps
  1020be:	e9 2b fc ff ff       	jmp    101cee <__alltraps>

001020c3 <vector107>:
.globl vector107
vector107:
  pushl $0
  1020c3:	6a 00                	push   $0x0
  pushl $107
  1020c5:	6a 6b                	push   $0x6b
  jmp __alltraps
  1020c7:	e9 22 fc ff ff       	jmp    101cee <__alltraps>

001020cc <vector108>:
.globl vector108
vector108:
  pushl $0
  1020cc:	6a 00                	push   $0x0
  pushl $108
  1020ce:	6a 6c                	push   $0x6c
  jmp __alltraps
  1020d0:	e9 19 fc ff ff       	jmp    101cee <__alltraps>

001020d5 <vector109>:
.globl vector109
vector109:
  pushl $0
  1020d5:	6a 00                	push   $0x0
  pushl $109
  1020d7:	6a 6d                	push   $0x6d
  jmp __alltraps
  1020d9:	e9 10 fc ff ff       	jmp    101cee <__alltraps>

001020de <vector110>:
.globl vector110
vector110:
  pushl $0
  1020de:	6a 00                	push   $0x0
  pushl $110
  1020e0:	6a 6e                	push   $0x6e
  jmp __alltraps
  1020e2:	e9 07 fc ff ff       	jmp    101cee <__alltraps>

001020e7 <vector111>:
.globl vector111
vector111:
  pushl $0
  1020e7:	6a 00                	push   $0x0
  pushl $111
  1020e9:	6a 6f                	push   $0x6f
  jmp __alltraps
  1020eb:	e9 fe fb ff ff       	jmp    101cee <__alltraps>

001020f0 <vector112>:
.globl vector112
vector112:
  pushl $0
  1020f0:	6a 00                	push   $0x0
  pushl $112
  1020f2:	6a 70                	push   $0x70
  jmp __alltraps
  1020f4:	e9 f5 fb ff ff       	jmp    101cee <__alltraps>

001020f9 <vector113>:
.globl vector113
vector113:
  pushl $0
  1020f9:	6a 00                	push   $0x0
  pushl $113
  1020fb:	6a 71                	push   $0x71
  jmp __alltraps
  1020fd:	e9 ec fb ff ff       	jmp    101cee <__alltraps>

00102102 <vector114>:
.globl vector114
vector114:
  pushl $0
  102102:	6a 00                	push   $0x0
  pushl $114
  102104:	6a 72                	push   $0x72
  jmp __alltraps
  102106:	e9 e3 fb ff ff       	jmp    101cee <__alltraps>

0010210b <vector115>:
.globl vector115
vector115:
  pushl $0
  10210b:	6a 00                	push   $0x0
  pushl $115
  10210d:	6a 73                	push   $0x73
  jmp __alltraps
  10210f:	e9 da fb ff ff       	jmp    101cee <__alltraps>

00102114 <vector116>:
.globl vector116
vector116:
  pushl $0
  102114:	6a 00                	push   $0x0
  pushl $116
  102116:	6a 74                	push   $0x74
  jmp __alltraps
  102118:	e9 d1 fb ff ff       	jmp    101cee <__alltraps>

0010211d <vector117>:
.globl vector117
vector117:
  pushl $0
  10211d:	6a 00                	push   $0x0
  pushl $117
  10211f:	6a 75                	push   $0x75
  jmp __alltraps
  102121:	e9 c8 fb ff ff       	jmp    101cee <__alltraps>

00102126 <vector118>:
.globl vector118
vector118:
  pushl $0
  102126:	6a 00                	push   $0x0
  pushl $118
  102128:	6a 76                	push   $0x76
  jmp __alltraps
  10212a:	e9 bf fb ff ff       	jmp    101cee <__alltraps>

0010212f <vector119>:
.globl vector119
vector119:
  pushl $0
  10212f:	6a 00                	push   $0x0
  pushl $119
  102131:	6a 77                	push   $0x77
  jmp __alltraps
  102133:	e9 b6 fb ff ff       	jmp    101cee <__alltraps>

00102138 <vector120>:
.globl vector120
vector120:
  pushl $0
  102138:	6a 00                	push   $0x0
  pushl $120
  10213a:	6a 78                	push   $0x78
  jmp __alltraps
  10213c:	e9 ad fb ff ff       	jmp    101cee <__alltraps>

00102141 <vector121>:
.globl vector121
vector121:
  pushl $0
  102141:	6a 00                	push   $0x0
  pushl $121
  102143:	6a 79                	push   $0x79
  jmp __alltraps
  102145:	e9 a4 fb ff ff       	jmp    101cee <__alltraps>

0010214a <vector122>:
.globl vector122
vector122:
  pushl $0
  10214a:	6a 00                	push   $0x0
  pushl $122
  10214c:	6a 7a                	push   $0x7a
  jmp __alltraps
  10214e:	e9 9b fb ff ff       	jmp    101cee <__alltraps>

00102153 <vector123>:
.globl vector123
vector123:
  pushl $0
  102153:	6a 00                	push   $0x0
  pushl $123
  102155:	6a 7b                	push   $0x7b
  jmp __alltraps
  102157:	e9 92 fb ff ff       	jmp    101cee <__alltraps>

0010215c <vector124>:
.globl vector124
vector124:
  pushl $0
  10215c:	6a 00                	push   $0x0
  pushl $124
  10215e:	6a 7c                	push   $0x7c
  jmp __alltraps
  102160:	e9 89 fb ff ff       	jmp    101cee <__alltraps>

00102165 <vector125>:
.globl vector125
vector125:
  pushl $0
  102165:	6a 00                	push   $0x0
  pushl $125
  102167:	6a 7d                	push   $0x7d
  jmp __alltraps
  102169:	e9 80 fb ff ff       	jmp    101cee <__alltraps>

0010216e <vector126>:
.globl vector126
vector126:
  pushl $0
  10216e:	6a 00                	push   $0x0
  pushl $126
  102170:	6a 7e                	push   $0x7e
  jmp __alltraps
  102172:	e9 77 fb ff ff       	jmp    101cee <__alltraps>

00102177 <vector127>:
.globl vector127
vector127:
  pushl $0
  102177:	6a 00                	push   $0x0
  pushl $127
  102179:	6a 7f                	push   $0x7f
  jmp __alltraps
  10217b:	e9 6e fb ff ff       	jmp    101cee <__alltraps>

00102180 <vector128>:
.globl vector128
vector128:
  pushl $0
  102180:	6a 00                	push   $0x0
  pushl $128
  102182:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  102187:	e9 62 fb ff ff       	jmp    101cee <__alltraps>

0010218c <vector129>:
.globl vector129
vector129:
  pushl $0
  10218c:	6a 00                	push   $0x0
  pushl $129
  10218e:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  102193:	e9 56 fb ff ff       	jmp    101cee <__alltraps>

00102198 <vector130>:
.globl vector130
vector130:
  pushl $0
  102198:	6a 00                	push   $0x0
  pushl $130
  10219a:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  10219f:	e9 4a fb ff ff       	jmp    101cee <__alltraps>

001021a4 <vector131>:
.globl vector131
vector131:
  pushl $0
  1021a4:	6a 00                	push   $0x0
  pushl $131
  1021a6:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  1021ab:	e9 3e fb ff ff       	jmp    101cee <__alltraps>

001021b0 <vector132>:
.globl vector132
vector132:
  pushl $0
  1021b0:	6a 00                	push   $0x0
  pushl $132
  1021b2:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  1021b7:	e9 32 fb ff ff       	jmp    101cee <__alltraps>

001021bc <vector133>:
.globl vector133
vector133:
  pushl $0
  1021bc:	6a 00                	push   $0x0
  pushl $133
  1021be:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  1021c3:	e9 26 fb ff ff       	jmp    101cee <__alltraps>

001021c8 <vector134>:
.globl vector134
vector134:
  pushl $0
  1021c8:	6a 00                	push   $0x0
  pushl $134
  1021ca:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  1021cf:	e9 1a fb ff ff       	jmp    101cee <__alltraps>

001021d4 <vector135>:
.globl vector135
vector135:
  pushl $0
  1021d4:	6a 00                	push   $0x0
  pushl $135
  1021d6:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  1021db:	e9 0e fb ff ff       	jmp    101cee <__alltraps>

001021e0 <vector136>:
.globl vector136
vector136:
  pushl $0
  1021e0:	6a 00                	push   $0x0
  pushl $136
  1021e2:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  1021e7:	e9 02 fb ff ff       	jmp    101cee <__alltraps>

001021ec <vector137>:
.globl vector137
vector137:
  pushl $0
  1021ec:	6a 00                	push   $0x0
  pushl $137
  1021ee:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  1021f3:	e9 f6 fa ff ff       	jmp    101cee <__alltraps>

001021f8 <vector138>:
.globl vector138
vector138:
  pushl $0
  1021f8:	6a 00                	push   $0x0
  pushl $138
  1021fa:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  1021ff:	e9 ea fa ff ff       	jmp    101cee <__alltraps>

00102204 <vector139>:
.globl vector139
vector139:
  pushl $0
  102204:	6a 00                	push   $0x0
  pushl $139
  102206:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  10220b:	e9 de fa ff ff       	jmp    101cee <__alltraps>

00102210 <vector140>:
.globl vector140
vector140:
  pushl $0
  102210:	6a 00                	push   $0x0
  pushl $140
  102212:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  102217:	e9 d2 fa ff ff       	jmp    101cee <__alltraps>

0010221c <vector141>:
.globl vector141
vector141:
  pushl $0
  10221c:	6a 00                	push   $0x0
  pushl $141
  10221e:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  102223:	e9 c6 fa ff ff       	jmp    101cee <__alltraps>

00102228 <vector142>:
.globl vector142
vector142:
  pushl $0
  102228:	6a 00                	push   $0x0
  pushl $142
  10222a:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  10222f:	e9 ba fa ff ff       	jmp    101cee <__alltraps>

00102234 <vector143>:
.globl vector143
vector143:
  pushl $0
  102234:	6a 00                	push   $0x0
  pushl $143
  102236:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  10223b:	e9 ae fa ff ff       	jmp    101cee <__alltraps>

00102240 <vector144>:
.globl vector144
vector144:
  pushl $0
  102240:	6a 00                	push   $0x0
  pushl $144
  102242:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  102247:	e9 a2 fa ff ff       	jmp    101cee <__alltraps>

0010224c <vector145>:
.globl vector145
vector145:
  pushl $0
  10224c:	6a 00                	push   $0x0
  pushl $145
  10224e:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  102253:	e9 96 fa ff ff       	jmp    101cee <__alltraps>

00102258 <vector146>:
.globl vector146
vector146:
  pushl $0
  102258:	6a 00                	push   $0x0
  pushl $146
  10225a:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  10225f:	e9 8a fa ff ff       	jmp    101cee <__alltraps>

00102264 <vector147>:
.globl vector147
vector147:
  pushl $0
  102264:	6a 00                	push   $0x0
  pushl $147
  102266:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  10226b:	e9 7e fa ff ff       	jmp    101cee <__alltraps>

00102270 <vector148>:
.globl vector148
vector148:
  pushl $0
  102270:	6a 00                	push   $0x0
  pushl $148
  102272:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  102277:	e9 72 fa ff ff       	jmp    101cee <__alltraps>

0010227c <vector149>:
.globl vector149
vector149:
  pushl $0
  10227c:	6a 00                	push   $0x0
  pushl $149
  10227e:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  102283:	e9 66 fa ff ff       	jmp    101cee <__alltraps>

00102288 <vector150>:
.globl vector150
vector150:
  pushl $0
  102288:	6a 00                	push   $0x0
  pushl $150
  10228a:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  10228f:	e9 5a fa ff ff       	jmp    101cee <__alltraps>

00102294 <vector151>:
.globl vector151
vector151:
  pushl $0
  102294:	6a 00                	push   $0x0
  pushl $151
  102296:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  10229b:	e9 4e fa ff ff       	jmp    101cee <__alltraps>

001022a0 <vector152>:
.globl vector152
vector152:
  pushl $0
  1022a0:	6a 00                	push   $0x0
  pushl $152
  1022a2:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  1022a7:	e9 42 fa ff ff       	jmp    101cee <__alltraps>

001022ac <vector153>:
.globl vector153
vector153:
  pushl $0
  1022ac:	6a 00                	push   $0x0
  pushl $153
  1022ae:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  1022b3:	e9 36 fa ff ff       	jmp    101cee <__alltraps>

001022b8 <vector154>:
.globl vector154
vector154:
  pushl $0
  1022b8:	6a 00                	push   $0x0
  pushl $154
  1022ba:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  1022bf:	e9 2a fa ff ff       	jmp    101cee <__alltraps>

001022c4 <vector155>:
.globl vector155
vector155:
  pushl $0
  1022c4:	6a 00                	push   $0x0
  pushl $155
  1022c6:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  1022cb:	e9 1e fa ff ff       	jmp    101cee <__alltraps>

001022d0 <vector156>:
.globl vector156
vector156:
  pushl $0
  1022d0:	6a 00                	push   $0x0
  pushl $156
  1022d2:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  1022d7:	e9 12 fa ff ff       	jmp    101cee <__alltraps>

001022dc <vector157>:
.globl vector157
vector157:
  pushl $0
  1022dc:	6a 00                	push   $0x0
  pushl $157
  1022de:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  1022e3:	e9 06 fa ff ff       	jmp    101cee <__alltraps>

001022e8 <vector158>:
.globl vector158
vector158:
  pushl $0
  1022e8:	6a 00                	push   $0x0
  pushl $158
  1022ea:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  1022ef:	e9 fa f9 ff ff       	jmp    101cee <__alltraps>

001022f4 <vector159>:
.globl vector159
vector159:
  pushl $0
  1022f4:	6a 00                	push   $0x0
  pushl $159
  1022f6:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  1022fb:	e9 ee f9 ff ff       	jmp    101cee <__alltraps>

00102300 <vector160>:
.globl vector160
vector160:
  pushl $0
  102300:	6a 00                	push   $0x0
  pushl $160
  102302:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  102307:	e9 e2 f9 ff ff       	jmp    101cee <__alltraps>

0010230c <vector161>:
.globl vector161
vector161:
  pushl $0
  10230c:	6a 00                	push   $0x0
  pushl $161
  10230e:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  102313:	e9 d6 f9 ff ff       	jmp    101cee <__alltraps>

00102318 <vector162>:
.globl vector162
vector162:
  pushl $0
  102318:	6a 00                	push   $0x0
  pushl $162
  10231a:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  10231f:	e9 ca f9 ff ff       	jmp    101cee <__alltraps>

00102324 <vector163>:
.globl vector163
vector163:
  pushl $0
  102324:	6a 00                	push   $0x0
  pushl $163
  102326:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  10232b:	e9 be f9 ff ff       	jmp    101cee <__alltraps>

00102330 <vector164>:
.globl vector164
vector164:
  pushl $0
  102330:	6a 00                	push   $0x0
  pushl $164
  102332:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  102337:	e9 b2 f9 ff ff       	jmp    101cee <__alltraps>

0010233c <vector165>:
.globl vector165
vector165:
  pushl $0
  10233c:	6a 00                	push   $0x0
  pushl $165
  10233e:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  102343:	e9 a6 f9 ff ff       	jmp    101cee <__alltraps>

00102348 <vector166>:
.globl vector166
vector166:
  pushl $0
  102348:	6a 00                	push   $0x0
  pushl $166
  10234a:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  10234f:	e9 9a f9 ff ff       	jmp    101cee <__alltraps>

00102354 <vector167>:
.globl vector167
vector167:
  pushl $0
  102354:	6a 00                	push   $0x0
  pushl $167
  102356:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  10235b:	e9 8e f9 ff ff       	jmp    101cee <__alltraps>

00102360 <vector168>:
.globl vector168
vector168:
  pushl $0
  102360:	6a 00                	push   $0x0
  pushl $168
  102362:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  102367:	e9 82 f9 ff ff       	jmp    101cee <__alltraps>

0010236c <vector169>:
.globl vector169
vector169:
  pushl $0
  10236c:	6a 00                	push   $0x0
  pushl $169
  10236e:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  102373:	e9 76 f9 ff ff       	jmp    101cee <__alltraps>

00102378 <vector170>:
.globl vector170
vector170:
  pushl $0
  102378:	6a 00                	push   $0x0
  pushl $170
  10237a:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  10237f:	e9 6a f9 ff ff       	jmp    101cee <__alltraps>

00102384 <vector171>:
.globl vector171
vector171:
  pushl $0
  102384:	6a 00                	push   $0x0
  pushl $171
  102386:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  10238b:	e9 5e f9 ff ff       	jmp    101cee <__alltraps>

00102390 <vector172>:
.globl vector172
vector172:
  pushl $0
  102390:	6a 00                	push   $0x0
  pushl $172
  102392:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  102397:	e9 52 f9 ff ff       	jmp    101cee <__alltraps>

0010239c <vector173>:
.globl vector173
vector173:
  pushl $0
  10239c:	6a 00                	push   $0x0
  pushl $173
  10239e:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  1023a3:	e9 46 f9 ff ff       	jmp    101cee <__alltraps>

001023a8 <vector174>:
.globl vector174
vector174:
  pushl $0
  1023a8:	6a 00                	push   $0x0
  pushl $174
  1023aa:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  1023af:	e9 3a f9 ff ff       	jmp    101cee <__alltraps>

001023b4 <vector175>:
.globl vector175
vector175:
  pushl $0
  1023b4:	6a 00                	push   $0x0
  pushl $175
  1023b6:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  1023bb:	e9 2e f9 ff ff       	jmp    101cee <__alltraps>

001023c0 <vector176>:
.globl vector176
vector176:
  pushl $0
  1023c0:	6a 00                	push   $0x0
  pushl $176
  1023c2:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  1023c7:	e9 22 f9 ff ff       	jmp    101cee <__alltraps>

001023cc <vector177>:
.globl vector177
vector177:
  pushl $0
  1023cc:	6a 00                	push   $0x0
  pushl $177
  1023ce:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  1023d3:	e9 16 f9 ff ff       	jmp    101cee <__alltraps>

001023d8 <vector178>:
.globl vector178
vector178:
  pushl $0
  1023d8:	6a 00                	push   $0x0
  pushl $178
  1023da:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  1023df:	e9 0a f9 ff ff       	jmp    101cee <__alltraps>

001023e4 <vector179>:
.globl vector179
vector179:
  pushl $0
  1023e4:	6a 00                	push   $0x0
  pushl $179
  1023e6:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  1023eb:	e9 fe f8 ff ff       	jmp    101cee <__alltraps>

001023f0 <vector180>:
.globl vector180
vector180:
  pushl $0
  1023f0:	6a 00                	push   $0x0
  pushl $180
  1023f2:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  1023f7:	e9 f2 f8 ff ff       	jmp    101cee <__alltraps>

001023fc <vector181>:
.globl vector181
vector181:
  pushl $0
  1023fc:	6a 00                	push   $0x0
  pushl $181
  1023fe:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  102403:	e9 e6 f8 ff ff       	jmp    101cee <__alltraps>

00102408 <vector182>:
.globl vector182
vector182:
  pushl $0
  102408:	6a 00                	push   $0x0
  pushl $182
  10240a:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  10240f:	e9 da f8 ff ff       	jmp    101cee <__alltraps>

00102414 <vector183>:
.globl vector183
vector183:
  pushl $0
  102414:	6a 00                	push   $0x0
  pushl $183
  102416:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  10241b:	e9 ce f8 ff ff       	jmp    101cee <__alltraps>

00102420 <vector184>:
.globl vector184
vector184:
  pushl $0
  102420:	6a 00                	push   $0x0
  pushl $184
  102422:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  102427:	e9 c2 f8 ff ff       	jmp    101cee <__alltraps>

0010242c <vector185>:
.globl vector185
vector185:
  pushl $0
  10242c:	6a 00                	push   $0x0
  pushl $185
  10242e:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  102433:	e9 b6 f8 ff ff       	jmp    101cee <__alltraps>

00102438 <vector186>:
.globl vector186
vector186:
  pushl $0
  102438:	6a 00                	push   $0x0
  pushl $186
  10243a:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  10243f:	e9 aa f8 ff ff       	jmp    101cee <__alltraps>

00102444 <vector187>:
.globl vector187
vector187:
  pushl $0
  102444:	6a 00                	push   $0x0
  pushl $187
  102446:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  10244b:	e9 9e f8 ff ff       	jmp    101cee <__alltraps>

00102450 <vector188>:
.globl vector188
vector188:
  pushl $0
  102450:	6a 00                	push   $0x0
  pushl $188
  102452:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  102457:	e9 92 f8 ff ff       	jmp    101cee <__alltraps>

0010245c <vector189>:
.globl vector189
vector189:
  pushl $0
  10245c:	6a 00                	push   $0x0
  pushl $189
  10245e:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  102463:	e9 86 f8 ff ff       	jmp    101cee <__alltraps>

00102468 <vector190>:
.globl vector190
vector190:
  pushl $0
  102468:	6a 00                	push   $0x0
  pushl $190
  10246a:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  10246f:	e9 7a f8 ff ff       	jmp    101cee <__alltraps>

00102474 <vector191>:
.globl vector191
vector191:
  pushl $0
  102474:	6a 00                	push   $0x0
  pushl $191
  102476:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  10247b:	e9 6e f8 ff ff       	jmp    101cee <__alltraps>

00102480 <vector192>:
.globl vector192
vector192:
  pushl $0
  102480:	6a 00                	push   $0x0
  pushl $192
  102482:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  102487:	e9 62 f8 ff ff       	jmp    101cee <__alltraps>

0010248c <vector193>:
.globl vector193
vector193:
  pushl $0
  10248c:	6a 00                	push   $0x0
  pushl $193
  10248e:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  102493:	e9 56 f8 ff ff       	jmp    101cee <__alltraps>

00102498 <vector194>:
.globl vector194
vector194:
  pushl $0
  102498:	6a 00                	push   $0x0
  pushl $194
  10249a:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  10249f:	e9 4a f8 ff ff       	jmp    101cee <__alltraps>

001024a4 <vector195>:
.globl vector195
vector195:
  pushl $0
  1024a4:	6a 00                	push   $0x0
  pushl $195
  1024a6:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  1024ab:	e9 3e f8 ff ff       	jmp    101cee <__alltraps>

001024b0 <vector196>:
.globl vector196
vector196:
  pushl $0
  1024b0:	6a 00                	push   $0x0
  pushl $196
  1024b2:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  1024b7:	e9 32 f8 ff ff       	jmp    101cee <__alltraps>

001024bc <vector197>:
.globl vector197
vector197:
  pushl $0
  1024bc:	6a 00                	push   $0x0
  pushl $197
  1024be:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  1024c3:	e9 26 f8 ff ff       	jmp    101cee <__alltraps>

001024c8 <vector198>:
.globl vector198
vector198:
  pushl $0
  1024c8:	6a 00                	push   $0x0
  pushl $198
  1024ca:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  1024cf:	e9 1a f8 ff ff       	jmp    101cee <__alltraps>

001024d4 <vector199>:
.globl vector199
vector199:
  pushl $0
  1024d4:	6a 00                	push   $0x0
  pushl $199
  1024d6:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  1024db:	e9 0e f8 ff ff       	jmp    101cee <__alltraps>

001024e0 <vector200>:
.globl vector200
vector200:
  pushl $0
  1024e0:	6a 00                	push   $0x0
  pushl $200
  1024e2:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  1024e7:	e9 02 f8 ff ff       	jmp    101cee <__alltraps>

001024ec <vector201>:
.globl vector201
vector201:
  pushl $0
  1024ec:	6a 00                	push   $0x0
  pushl $201
  1024ee:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  1024f3:	e9 f6 f7 ff ff       	jmp    101cee <__alltraps>

001024f8 <vector202>:
.globl vector202
vector202:
  pushl $0
  1024f8:	6a 00                	push   $0x0
  pushl $202
  1024fa:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  1024ff:	e9 ea f7 ff ff       	jmp    101cee <__alltraps>

00102504 <vector203>:
.globl vector203
vector203:
  pushl $0
  102504:	6a 00                	push   $0x0
  pushl $203
  102506:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  10250b:	e9 de f7 ff ff       	jmp    101cee <__alltraps>

00102510 <vector204>:
.globl vector204
vector204:
  pushl $0
  102510:	6a 00                	push   $0x0
  pushl $204
  102512:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  102517:	e9 d2 f7 ff ff       	jmp    101cee <__alltraps>

0010251c <vector205>:
.globl vector205
vector205:
  pushl $0
  10251c:	6a 00                	push   $0x0
  pushl $205
  10251e:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  102523:	e9 c6 f7 ff ff       	jmp    101cee <__alltraps>

00102528 <vector206>:
.globl vector206
vector206:
  pushl $0
  102528:	6a 00                	push   $0x0
  pushl $206
  10252a:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  10252f:	e9 ba f7 ff ff       	jmp    101cee <__alltraps>

00102534 <vector207>:
.globl vector207
vector207:
  pushl $0
  102534:	6a 00                	push   $0x0
  pushl $207
  102536:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  10253b:	e9 ae f7 ff ff       	jmp    101cee <__alltraps>

00102540 <vector208>:
.globl vector208
vector208:
  pushl $0
  102540:	6a 00                	push   $0x0
  pushl $208
  102542:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  102547:	e9 a2 f7 ff ff       	jmp    101cee <__alltraps>

0010254c <vector209>:
.globl vector209
vector209:
  pushl $0
  10254c:	6a 00                	push   $0x0
  pushl $209
  10254e:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  102553:	e9 96 f7 ff ff       	jmp    101cee <__alltraps>

00102558 <vector210>:
.globl vector210
vector210:
  pushl $0
  102558:	6a 00                	push   $0x0
  pushl $210
  10255a:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  10255f:	e9 8a f7 ff ff       	jmp    101cee <__alltraps>

00102564 <vector211>:
.globl vector211
vector211:
  pushl $0
  102564:	6a 00                	push   $0x0
  pushl $211
  102566:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  10256b:	e9 7e f7 ff ff       	jmp    101cee <__alltraps>

00102570 <vector212>:
.globl vector212
vector212:
  pushl $0
  102570:	6a 00                	push   $0x0
  pushl $212
  102572:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  102577:	e9 72 f7 ff ff       	jmp    101cee <__alltraps>

0010257c <vector213>:
.globl vector213
vector213:
  pushl $0
  10257c:	6a 00                	push   $0x0
  pushl $213
  10257e:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  102583:	e9 66 f7 ff ff       	jmp    101cee <__alltraps>

00102588 <vector214>:
.globl vector214
vector214:
  pushl $0
  102588:	6a 00                	push   $0x0
  pushl $214
  10258a:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  10258f:	e9 5a f7 ff ff       	jmp    101cee <__alltraps>

00102594 <vector215>:
.globl vector215
vector215:
  pushl $0
  102594:	6a 00                	push   $0x0
  pushl $215
  102596:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  10259b:	e9 4e f7 ff ff       	jmp    101cee <__alltraps>

001025a0 <vector216>:
.globl vector216
vector216:
  pushl $0
  1025a0:	6a 00                	push   $0x0
  pushl $216
  1025a2:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  1025a7:	e9 42 f7 ff ff       	jmp    101cee <__alltraps>

001025ac <vector217>:
.globl vector217
vector217:
  pushl $0
  1025ac:	6a 00                	push   $0x0
  pushl $217
  1025ae:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  1025b3:	e9 36 f7 ff ff       	jmp    101cee <__alltraps>

001025b8 <vector218>:
.globl vector218
vector218:
  pushl $0
  1025b8:	6a 00                	push   $0x0
  pushl $218
  1025ba:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  1025bf:	e9 2a f7 ff ff       	jmp    101cee <__alltraps>

001025c4 <vector219>:
.globl vector219
vector219:
  pushl $0
  1025c4:	6a 00                	push   $0x0
  pushl $219
  1025c6:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  1025cb:	e9 1e f7 ff ff       	jmp    101cee <__alltraps>

001025d0 <vector220>:
.globl vector220
vector220:
  pushl $0
  1025d0:	6a 00                	push   $0x0
  pushl $220
  1025d2:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  1025d7:	e9 12 f7 ff ff       	jmp    101cee <__alltraps>

001025dc <vector221>:
.globl vector221
vector221:
  pushl $0
  1025dc:	6a 00                	push   $0x0
  pushl $221
  1025de:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  1025e3:	e9 06 f7 ff ff       	jmp    101cee <__alltraps>

001025e8 <vector222>:
.globl vector222
vector222:
  pushl $0
  1025e8:	6a 00                	push   $0x0
  pushl $222
  1025ea:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  1025ef:	e9 fa f6 ff ff       	jmp    101cee <__alltraps>

001025f4 <vector223>:
.globl vector223
vector223:
  pushl $0
  1025f4:	6a 00                	push   $0x0
  pushl $223
  1025f6:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  1025fb:	e9 ee f6 ff ff       	jmp    101cee <__alltraps>

00102600 <vector224>:
.globl vector224
vector224:
  pushl $0
  102600:	6a 00                	push   $0x0
  pushl $224
  102602:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  102607:	e9 e2 f6 ff ff       	jmp    101cee <__alltraps>

0010260c <vector225>:
.globl vector225
vector225:
  pushl $0
  10260c:	6a 00                	push   $0x0
  pushl $225
  10260e:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  102613:	e9 d6 f6 ff ff       	jmp    101cee <__alltraps>

00102618 <vector226>:
.globl vector226
vector226:
  pushl $0
  102618:	6a 00                	push   $0x0
  pushl $226
  10261a:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  10261f:	e9 ca f6 ff ff       	jmp    101cee <__alltraps>

00102624 <vector227>:
.globl vector227
vector227:
  pushl $0
  102624:	6a 00                	push   $0x0
  pushl $227
  102626:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  10262b:	e9 be f6 ff ff       	jmp    101cee <__alltraps>

00102630 <vector228>:
.globl vector228
vector228:
  pushl $0
  102630:	6a 00                	push   $0x0
  pushl $228
  102632:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  102637:	e9 b2 f6 ff ff       	jmp    101cee <__alltraps>

0010263c <vector229>:
.globl vector229
vector229:
  pushl $0
  10263c:	6a 00                	push   $0x0
  pushl $229
  10263e:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  102643:	e9 a6 f6 ff ff       	jmp    101cee <__alltraps>

00102648 <vector230>:
.globl vector230
vector230:
  pushl $0
  102648:	6a 00                	push   $0x0
  pushl $230
  10264a:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  10264f:	e9 9a f6 ff ff       	jmp    101cee <__alltraps>

00102654 <vector231>:
.globl vector231
vector231:
  pushl $0
  102654:	6a 00                	push   $0x0
  pushl $231
  102656:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  10265b:	e9 8e f6 ff ff       	jmp    101cee <__alltraps>

00102660 <vector232>:
.globl vector232
vector232:
  pushl $0
  102660:	6a 00                	push   $0x0
  pushl $232
  102662:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  102667:	e9 82 f6 ff ff       	jmp    101cee <__alltraps>

0010266c <vector233>:
.globl vector233
vector233:
  pushl $0
  10266c:	6a 00                	push   $0x0
  pushl $233
  10266e:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  102673:	e9 76 f6 ff ff       	jmp    101cee <__alltraps>

00102678 <vector234>:
.globl vector234
vector234:
  pushl $0
  102678:	6a 00                	push   $0x0
  pushl $234
  10267a:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  10267f:	e9 6a f6 ff ff       	jmp    101cee <__alltraps>

00102684 <vector235>:
.globl vector235
vector235:
  pushl $0
  102684:	6a 00                	push   $0x0
  pushl $235
  102686:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  10268b:	e9 5e f6 ff ff       	jmp    101cee <__alltraps>

00102690 <vector236>:
.globl vector236
vector236:
  pushl $0
  102690:	6a 00                	push   $0x0
  pushl $236
  102692:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  102697:	e9 52 f6 ff ff       	jmp    101cee <__alltraps>

0010269c <vector237>:
.globl vector237
vector237:
  pushl $0
  10269c:	6a 00                	push   $0x0
  pushl $237
  10269e:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  1026a3:	e9 46 f6 ff ff       	jmp    101cee <__alltraps>

001026a8 <vector238>:
.globl vector238
vector238:
  pushl $0
  1026a8:	6a 00                	push   $0x0
  pushl $238
  1026aa:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  1026af:	e9 3a f6 ff ff       	jmp    101cee <__alltraps>

001026b4 <vector239>:
.globl vector239
vector239:
  pushl $0
  1026b4:	6a 00                	push   $0x0
  pushl $239
  1026b6:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  1026bb:	e9 2e f6 ff ff       	jmp    101cee <__alltraps>

001026c0 <vector240>:
.globl vector240
vector240:
  pushl $0
  1026c0:	6a 00                	push   $0x0
  pushl $240
  1026c2:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  1026c7:	e9 22 f6 ff ff       	jmp    101cee <__alltraps>

001026cc <vector241>:
.globl vector241
vector241:
  pushl $0
  1026cc:	6a 00                	push   $0x0
  pushl $241
  1026ce:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  1026d3:	e9 16 f6 ff ff       	jmp    101cee <__alltraps>

001026d8 <vector242>:
.globl vector242
vector242:
  pushl $0
  1026d8:	6a 00                	push   $0x0
  pushl $242
  1026da:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  1026df:	e9 0a f6 ff ff       	jmp    101cee <__alltraps>

001026e4 <vector243>:
.globl vector243
vector243:
  pushl $0
  1026e4:	6a 00                	push   $0x0
  pushl $243
  1026e6:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  1026eb:	e9 fe f5 ff ff       	jmp    101cee <__alltraps>

001026f0 <vector244>:
.globl vector244
vector244:
  pushl $0
  1026f0:	6a 00                	push   $0x0
  pushl $244
  1026f2:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  1026f7:	e9 f2 f5 ff ff       	jmp    101cee <__alltraps>

001026fc <vector245>:
.globl vector245
vector245:
  pushl $0
  1026fc:	6a 00                	push   $0x0
  pushl $245
  1026fe:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  102703:	e9 e6 f5 ff ff       	jmp    101cee <__alltraps>

00102708 <vector246>:
.globl vector246
vector246:
  pushl $0
  102708:	6a 00                	push   $0x0
  pushl $246
  10270a:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  10270f:	e9 da f5 ff ff       	jmp    101cee <__alltraps>

00102714 <vector247>:
.globl vector247
vector247:
  pushl $0
  102714:	6a 00                	push   $0x0
  pushl $247
  102716:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  10271b:	e9 ce f5 ff ff       	jmp    101cee <__alltraps>

00102720 <vector248>:
.globl vector248
vector248:
  pushl $0
  102720:	6a 00                	push   $0x0
  pushl $248
  102722:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  102727:	e9 c2 f5 ff ff       	jmp    101cee <__alltraps>

0010272c <vector249>:
.globl vector249
vector249:
  pushl $0
  10272c:	6a 00                	push   $0x0
  pushl $249
  10272e:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  102733:	e9 b6 f5 ff ff       	jmp    101cee <__alltraps>

00102738 <vector250>:
.globl vector250
vector250:
  pushl $0
  102738:	6a 00                	push   $0x0
  pushl $250
  10273a:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  10273f:	e9 aa f5 ff ff       	jmp    101cee <__alltraps>

00102744 <vector251>:
.globl vector251
vector251:
  pushl $0
  102744:	6a 00                	push   $0x0
  pushl $251
  102746:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  10274b:	e9 9e f5 ff ff       	jmp    101cee <__alltraps>

00102750 <vector252>:
.globl vector252
vector252:
  pushl $0
  102750:	6a 00                	push   $0x0
  pushl $252
  102752:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  102757:	e9 92 f5 ff ff       	jmp    101cee <__alltraps>

0010275c <vector253>:
.globl vector253
vector253:
  pushl $0
  10275c:	6a 00                	push   $0x0
  pushl $253
  10275e:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  102763:	e9 86 f5 ff ff       	jmp    101cee <__alltraps>

00102768 <vector254>:
.globl vector254
vector254:
  pushl $0
  102768:	6a 00                	push   $0x0
  pushl $254
  10276a:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  10276f:	e9 7a f5 ff ff       	jmp    101cee <__alltraps>

00102774 <vector255>:
.globl vector255
vector255:
  pushl $0
  102774:	6a 00                	push   $0x0
  pushl $255
  102776:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  10277b:	e9 6e f5 ff ff       	jmp    101cee <__alltraps>

00102780 <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  102780:	55                   	push   %ebp
  102781:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  102783:	8b 45 08             	mov    0x8(%ebp),%eax
  102786:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  102789:	b8 23 00 00 00       	mov    $0x23,%eax
  10278e:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  102790:	b8 23 00 00 00       	mov    $0x23,%eax
  102795:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  102797:	b8 10 00 00 00       	mov    $0x10,%eax
  10279c:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  10279e:	b8 10 00 00 00       	mov    $0x10,%eax
  1027a3:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  1027a5:	b8 10 00 00 00       	mov    $0x10,%eax
  1027aa:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  1027ac:	ea b3 27 10 00 08 00 	ljmp   $0x8,$0x1027b3
}
  1027b3:	5d                   	pop    %ebp
  1027b4:	c3                   	ret    

001027b5 <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  1027b5:	55                   	push   %ebp
  1027b6:	89 e5                	mov    %esp,%ebp
  1027b8:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  1027bb:	b8 40 f9 10 00       	mov    $0x10f940,%eax
  1027c0:	05 00 04 00 00       	add    $0x400,%eax
  1027c5:	a3 c4 f8 10 00       	mov    %eax,0x10f8c4
    ts.ts_ss0 = KERNEL_DS;
  1027ca:	66 c7 05 c8 f8 10 00 	movw   $0x10,0x10f8c8
  1027d1:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  1027d3:	66 c7 05 08 ea 10 00 	movw   $0x68,0x10ea08
  1027da:	68 00 
  1027dc:	b8 c0 f8 10 00       	mov    $0x10f8c0,%eax
  1027e1:	66 a3 0a ea 10 00    	mov    %ax,0x10ea0a
  1027e7:	b8 c0 f8 10 00       	mov    $0x10f8c0,%eax
  1027ec:	c1 e8 10             	shr    $0x10,%eax
  1027ef:	a2 0c ea 10 00       	mov    %al,0x10ea0c
  1027f4:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1027fb:	83 e0 f0             	and    $0xfffffff0,%eax
  1027fe:	83 c8 09             	or     $0x9,%eax
  102801:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102806:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  10280d:	83 c8 10             	or     $0x10,%eax
  102810:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102815:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  10281c:	83 e0 9f             	and    $0xffffff9f,%eax
  10281f:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102824:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  10282b:	83 c8 80             	or     $0xffffff80,%eax
  10282e:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102833:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  10283a:	83 e0 f0             	and    $0xfffffff0,%eax
  10283d:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102842:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102849:	83 e0 ef             	and    $0xffffffef,%eax
  10284c:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102851:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102858:	83 e0 df             	and    $0xffffffdf,%eax
  10285b:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102860:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102867:	83 c8 40             	or     $0x40,%eax
  10286a:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  10286f:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102876:	83 e0 7f             	and    $0x7f,%eax
  102879:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  10287e:	b8 c0 f8 10 00       	mov    $0x10f8c0,%eax
  102883:	c1 e8 18             	shr    $0x18,%eax
  102886:	a2 0f ea 10 00       	mov    %al,0x10ea0f
    gdt[SEG_TSS].sd_s = 0;
  10288b:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102892:	83 e0 ef             	and    $0xffffffef,%eax
  102895:	a2 0d ea 10 00       	mov    %al,0x10ea0d

    // reload all segment registers
    lgdt(&gdt_pd);
  10289a:	c7 04 24 10 ea 10 00 	movl   $0x10ea10,(%esp)
  1028a1:	e8 da fe ff ff       	call   102780 <lgdt>
  1028a6:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)
    asm volatile ("cli");
}

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  1028ac:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  1028b0:	0f 00 d8             	ltr    %ax

    // load the TSS
    ltr(GD_TSS);     //LTR指令只需要装载段选择符即可，基地址、界限、TSS描述符会自动装载入任务寄存器TR
}
  1028b3:	c9                   	leave  
  1028b4:	c3                   	ret    

001028b5 <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  1028b5:	55                   	push   %ebp
  1028b6:	89 e5                	mov    %esp,%ebp
    gdt_init();
  1028b8:	e8 f8 fe ff ff       	call   1027b5 <gdt_init>
}
  1028bd:	5d                   	pop    %ebp
  1028be:	c3                   	ret    

001028bf <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  1028bf:	55                   	push   %ebp
  1028c0:	89 e5                	mov    %esp,%ebp
  1028c2:	83 ec 58             	sub    $0x58,%esp
  1028c5:	8b 45 10             	mov    0x10(%ebp),%eax
  1028c8:	89 45 d0             	mov    %eax,-0x30(%ebp)
  1028cb:	8b 45 14             	mov    0x14(%ebp),%eax
  1028ce:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  1028d1:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1028d4:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1028d7:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1028da:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  1028dd:	8b 45 18             	mov    0x18(%ebp),%eax
  1028e0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1028e3:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1028e6:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1028e9:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1028ec:	89 55 f0             	mov    %edx,-0x10(%ebp)
  1028ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1028f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1028f5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  1028f9:	74 1c                	je     102917 <printnum+0x58>
  1028fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1028fe:	ba 00 00 00 00       	mov    $0x0,%edx
  102903:	f7 75 e4             	divl   -0x1c(%ebp)
  102906:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102909:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10290c:	ba 00 00 00 00       	mov    $0x0,%edx
  102911:	f7 75 e4             	divl   -0x1c(%ebp)
  102914:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102917:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10291a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10291d:	f7 75 e4             	divl   -0x1c(%ebp)
  102920:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102923:	89 55 dc             	mov    %edx,-0x24(%ebp)
  102926:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102929:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10292c:	89 45 e8             	mov    %eax,-0x18(%ebp)
  10292f:	89 55 ec             	mov    %edx,-0x14(%ebp)
  102932:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102935:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  102938:	8b 45 18             	mov    0x18(%ebp),%eax
  10293b:	ba 00 00 00 00       	mov    $0x0,%edx
  102940:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  102943:	77 56                	ja     10299b <printnum+0xdc>
  102945:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  102948:	72 05                	jb     10294f <printnum+0x90>
  10294a:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  10294d:	77 4c                	ja     10299b <printnum+0xdc>
        printnum(putch, putdat, result, base, width - 1, padc);
  10294f:	8b 45 1c             	mov    0x1c(%ebp),%eax
  102952:	8d 50 ff             	lea    -0x1(%eax),%edx
  102955:	8b 45 20             	mov    0x20(%ebp),%eax
  102958:	89 44 24 18          	mov    %eax,0x18(%esp)
  10295c:	89 54 24 14          	mov    %edx,0x14(%esp)
  102960:	8b 45 18             	mov    0x18(%ebp),%eax
  102963:	89 44 24 10          	mov    %eax,0x10(%esp)
  102967:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10296a:	8b 55 ec             	mov    -0x14(%ebp),%edx
  10296d:	89 44 24 08          	mov    %eax,0x8(%esp)
  102971:	89 54 24 0c          	mov    %edx,0xc(%esp)
  102975:	8b 45 0c             	mov    0xc(%ebp),%eax
  102978:	89 44 24 04          	mov    %eax,0x4(%esp)
  10297c:	8b 45 08             	mov    0x8(%ebp),%eax
  10297f:	89 04 24             	mov    %eax,(%esp)
  102982:	e8 38 ff ff ff       	call   1028bf <printnum>
  102987:	eb 1c                	jmp    1029a5 <printnum+0xe6>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  102989:	8b 45 0c             	mov    0xc(%ebp),%eax
  10298c:	89 44 24 04          	mov    %eax,0x4(%esp)
  102990:	8b 45 20             	mov    0x20(%ebp),%eax
  102993:	89 04 24             	mov    %eax,(%esp)
  102996:	8b 45 08             	mov    0x8(%ebp),%eax
  102999:	ff d0                	call   *%eax
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
        printnum(putch, putdat, result, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
  10299b:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  10299f:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  1029a3:	7f e4                	jg     102989 <printnum+0xca>
            putch(padc, putdat);
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  1029a5:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1029a8:	05 90 3b 10 00       	add    $0x103b90,%eax
  1029ad:	0f b6 00             	movzbl (%eax),%eax
  1029b0:	0f be c0             	movsbl %al,%eax
  1029b3:	8b 55 0c             	mov    0xc(%ebp),%edx
  1029b6:	89 54 24 04          	mov    %edx,0x4(%esp)
  1029ba:	89 04 24             	mov    %eax,(%esp)
  1029bd:	8b 45 08             	mov    0x8(%ebp),%eax
  1029c0:	ff d0                	call   *%eax
}
  1029c2:	c9                   	leave  
  1029c3:	c3                   	ret    

001029c4 <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  1029c4:	55                   	push   %ebp
  1029c5:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  1029c7:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  1029cb:	7e 14                	jle    1029e1 <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  1029cd:	8b 45 08             	mov    0x8(%ebp),%eax
  1029d0:	8b 00                	mov    (%eax),%eax
  1029d2:	8d 48 08             	lea    0x8(%eax),%ecx
  1029d5:	8b 55 08             	mov    0x8(%ebp),%edx
  1029d8:	89 0a                	mov    %ecx,(%edx)
  1029da:	8b 50 04             	mov    0x4(%eax),%edx
  1029dd:	8b 00                	mov    (%eax),%eax
  1029df:	eb 30                	jmp    102a11 <getuint+0x4d>
    }
    else if (lflag) {
  1029e1:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1029e5:	74 16                	je     1029fd <getuint+0x39>
        return va_arg(*ap, unsigned long);
  1029e7:	8b 45 08             	mov    0x8(%ebp),%eax
  1029ea:	8b 00                	mov    (%eax),%eax
  1029ec:	8d 48 04             	lea    0x4(%eax),%ecx
  1029ef:	8b 55 08             	mov    0x8(%ebp),%edx
  1029f2:	89 0a                	mov    %ecx,(%edx)
  1029f4:	8b 00                	mov    (%eax),%eax
  1029f6:	ba 00 00 00 00       	mov    $0x0,%edx
  1029fb:	eb 14                	jmp    102a11 <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  1029fd:	8b 45 08             	mov    0x8(%ebp),%eax
  102a00:	8b 00                	mov    (%eax),%eax
  102a02:	8d 48 04             	lea    0x4(%eax),%ecx
  102a05:	8b 55 08             	mov    0x8(%ebp),%edx
  102a08:	89 0a                	mov    %ecx,(%edx)
  102a0a:	8b 00                	mov    (%eax),%eax
  102a0c:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  102a11:	5d                   	pop    %ebp
  102a12:	c3                   	ret    

00102a13 <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  102a13:	55                   	push   %ebp
  102a14:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102a16:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102a1a:	7e 14                	jle    102a30 <getint+0x1d>
        return va_arg(*ap, long long);
  102a1c:	8b 45 08             	mov    0x8(%ebp),%eax
  102a1f:	8b 00                	mov    (%eax),%eax
  102a21:	8d 48 08             	lea    0x8(%eax),%ecx
  102a24:	8b 55 08             	mov    0x8(%ebp),%edx
  102a27:	89 0a                	mov    %ecx,(%edx)
  102a29:	8b 50 04             	mov    0x4(%eax),%edx
  102a2c:	8b 00                	mov    (%eax),%eax
  102a2e:	eb 28                	jmp    102a58 <getint+0x45>
    }
    else if (lflag) {
  102a30:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102a34:	74 12                	je     102a48 <getint+0x35>
        return va_arg(*ap, long);
  102a36:	8b 45 08             	mov    0x8(%ebp),%eax
  102a39:	8b 00                	mov    (%eax),%eax
  102a3b:	8d 48 04             	lea    0x4(%eax),%ecx
  102a3e:	8b 55 08             	mov    0x8(%ebp),%edx
  102a41:	89 0a                	mov    %ecx,(%edx)
  102a43:	8b 00                	mov    (%eax),%eax
  102a45:	99                   	cltd   
  102a46:	eb 10                	jmp    102a58 <getint+0x45>
    }
    else {
        return va_arg(*ap, int);
  102a48:	8b 45 08             	mov    0x8(%ebp),%eax
  102a4b:	8b 00                	mov    (%eax),%eax
  102a4d:	8d 48 04             	lea    0x4(%eax),%ecx
  102a50:	8b 55 08             	mov    0x8(%ebp),%edx
  102a53:	89 0a                	mov    %ecx,(%edx)
  102a55:	8b 00                	mov    (%eax),%eax
  102a57:	99                   	cltd   
    }
}
  102a58:	5d                   	pop    %ebp
  102a59:	c3                   	ret    

00102a5a <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  102a5a:	55                   	push   %ebp
  102a5b:	89 e5                	mov    %esp,%ebp
  102a5d:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  102a60:	8d 45 14             	lea    0x14(%ebp),%eax
  102a63:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  102a66:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102a69:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102a6d:	8b 45 10             	mov    0x10(%ebp),%eax
  102a70:	89 44 24 08          	mov    %eax,0x8(%esp)
  102a74:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a77:	89 44 24 04          	mov    %eax,0x4(%esp)
  102a7b:	8b 45 08             	mov    0x8(%ebp),%eax
  102a7e:	89 04 24             	mov    %eax,(%esp)
  102a81:	e8 02 00 00 00       	call   102a88 <vprintfmt>
    va_end(ap);
}
  102a86:	c9                   	leave  
  102a87:	c3                   	ret    

00102a88 <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  102a88:	55                   	push   %ebp
  102a89:	89 e5                	mov    %esp,%ebp
  102a8b:	56                   	push   %esi
  102a8c:	53                   	push   %ebx
  102a8d:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102a90:	eb 18                	jmp    102aaa <vprintfmt+0x22>
            if (ch == '\0') {
  102a92:	85 db                	test   %ebx,%ebx
  102a94:	75 05                	jne    102a9b <vprintfmt+0x13>
                return;
  102a96:	e9 d1 03 00 00       	jmp    102e6c <vprintfmt+0x3e4>
            }
            putch(ch, putdat);
  102a9b:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a9e:	89 44 24 04          	mov    %eax,0x4(%esp)
  102aa2:	89 1c 24             	mov    %ebx,(%esp)
  102aa5:	8b 45 08             	mov    0x8(%ebp),%eax
  102aa8:	ff d0                	call   *%eax
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102aaa:	8b 45 10             	mov    0x10(%ebp),%eax
  102aad:	8d 50 01             	lea    0x1(%eax),%edx
  102ab0:	89 55 10             	mov    %edx,0x10(%ebp)
  102ab3:	0f b6 00             	movzbl (%eax),%eax
  102ab6:	0f b6 d8             	movzbl %al,%ebx
  102ab9:	83 fb 25             	cmp    $0x25,%ebx
  102abc:	75 d4                	jne    102a92 <vprintfmt+0xa>
            }
            putch(ch, putdat);
        }

        // Process a %-escape sequence
        char padc = ' ';
  102abe:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  102ac2:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  102ac9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102acc:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  102acf:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  102ad6:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102ad9:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  102adc:	8b 45 10             	mov    0x10(%ebp),%eax
  102adf:	8d 50 01             	lea    0x1(%eax),%edx
  102ae2:	89 55 10             	mov    %edx,0x10(%ebp)
  102ae5:	0f b6 00             	movzbl (%eax),%eax
  102ae8:	0f b6 d8             	movzbl %al,%ebx
  102aeb:	8d 43 dd             	lea    -0x23(%ebx),%eax
  102aee:	83 f8 55             	cmp    $0x55,%eax
  102af1:	0f 87 44 03 00 00    	ja     102e3b <vprintfmt+0x3b3>
  102af7:	8b 04 85 b4 3b 10 00 	mov    0x103bb4(,%eax,4),%eax
  102afe:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  102b00:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  102b04:	eb d6                	jmp    102adc <vprintfmt+0x54>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  102b06:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  102b0a:	eb d0                	jmp    102adc <vprintfmt+0x54>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102b0c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  102b13:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102b16:	89 d0                	mov    %edx,%eax
  102b18:	c1 e0 02             	shl    $0x2,%eax
  102b1b:	01 d0                	add    %edx,%eax
  102b1d:	01 c0                	add    %eax,%eax
  102b1f:	01 d8                	add    %ebx,%eax
  102b21:	83 e8 30             	sub    $0x30,%eax
  102b24:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  102b27:	8b 45 10             	mov    0x10(%ebp),%eax
  102b2a:	0f b6 00             	movzbl (%eax),%eax
  102b2d:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  102b30:	83 fb 2f             	cmp    $0x2f,%ebx
  102b33:	7e 0b                	jle    102b40 <vprintfmt+0xb8>
  102b35:	83 fb 39             	cmp    $0x39,%ebx
  102b38:	7f 06                	jg     102b40 <vprintfmt+0xb8>
            padc = '0';
            goto reswitch;

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102b3a:	83 45 10 01          	addl   $0x1,0x10(%ebp)
                precision = precision * 10 + ch - '0';
                ch = *fmt;
                if (ch < '0' || ch > '9') {
                    break;
                }
            }
  102b3e:	eb d3                	jmp    102b13 <vprintfmt+0x8b>
            goto process_precision;
  102b40:	eb 33                	jmp    102b75 <vprintfmt+0xed>

        case '*':
            precision = va_arg(ap, int);
  102b42:	8b 45 14             	mov    0x14(%ebp),%eax
  102b45:	8d 50 04             	lea    0x4(%eax),%edx
  102b48:	89 55 14             	mov    %edx,0x14(%ebp)
  102b4b:	8b 00                	mov    (%eax),%eax
  102b4d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  102b50:	eb 23                	jmp    102b75 <vprintfmt+0xed>

        case '.':
            if (width < 0)
  102b52:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102b56:	79 0c                	jns    102b64 <vprintfmt+0xdc>
                width = 0;
  102b58:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  102b5f:	e9 78 ff ff ff       	jmp    102adc <vprintfmt+0x54>
  102b64:	e9 73 ff ff ff       	jmp    102adc <vprintfmt+0x54>

        case '#':
            altflag = 1;
  102b69:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  102b70:	e9 67 ff ff ff       	jmp    102adc <vprintfmt+0x54>

        process_precision:
            if (width < 0)
  102b75:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102b79:	79 12                	jns    102b8d <vprintfmt+0x105>
                width = precision, precision = -1;
  102b7b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102b7e:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102b81:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  102b88:	e9 4f ff ff ff       	jmp    102adc <vprintfmt+0x54>
  102b8d:	e9 4a ff ff ff       	jmp    102adc <vprintfmt+0x54>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  102b92:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
            goto reswitch;
  102b96:	e9 41 ff ff ff       	jmp    102adc <vprintfmt+0x54>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  102b9b:	8b 45 14             	mov    0x14(%ebp),%eax
  102b9e:	8d 50 04             	lea    0x4(%eax),%edx
  102ba1:	89 55 14             	mov    %edx,0x14(%ebp)
  102ba4:	8b 00                	mov    (%eax),%eax
  102ba6:	8b 55 0c             	mov    0xc(%ebp),%edx
  102ba9:	89 54 24 04          	mov    %edx,0x4(%esp)
  102bad:	89 04 24             	mov    %eax,(%esp)
  102bb0:	8b 45 08             	mov    0x8(%ebp),%eax
  102bb3:	ff d0                	call   *%eax
            break;
  102bb5:	e9 ac 02 00 00       	jmp    102e66 <vprintfmt+0x3de>

        // error message
        case 'e':
            err = va_arg(ap, int);
  102bba:	8b 45 14             	mov    0x14(%ebp),%eax
  102bbd:	8d 50 04             	lea    0x4(%eax),%edx
  102bc0:	89 55 14             	mov    %edx,0x14(%ebp)
  102bc3:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  102bc5:	85 db                	test   %ebx,%ebx
  102bc7:	79 02                	jns    102bcb <vprintfmt+0x143>
                err = -err;
  102bc9:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  102bcb:	83 fb 06             	cmp    $0x6,%ebx
  102bce:	7f 0b                	jg     102bdb <vprintfmt+0x153>
  102bd0:	8b 34 9d 74 3b 10 00 	mov    0x103b74(,%ebx,4),%esi
  102bd7:	85 f6                	test   %esi,%esi
  102bd9:	75 23                	jne    102bfe <vprintfmt+0x176>
                printfmt(putch, putdat, "error %d", err);
  102bdb:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  102bdf:	c7 44 24 08 a1 3b 10 	movl   $0x103ba1,0x8(%esp)
  102be6:	00 
  102be7:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bea:	89 44 24 04          	mov    %eax,0x4(%esp)
  102bee:	8b 45 08             	mov    0x8(%ebp),%eax
  102bf1:	89 04 24             	mov    %eax,(%esp)
  102bf4:	e8 61 fe ff ff       	call   102a5a <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  102bf9:	e9 68 02 00 00       	jmp    102e66 <vprintfmt+0x3de>
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
                printfmt(putch, putdat, "error %d", err);
            }
            else {
                printfmt(putch, putdat, "%s", p);
  102bfe:	89 74 24 0c          	mov    %esi,0xc(%esp)
  102c02:	c7 44 24 08 aa 3b 10 	movl   $0x103baa,0x8(%esp)
  102c09:	00 
  102c0a:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c0d:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c11:	8b 45 08             	mov    0x8(%ebp),%eax
  102c14:	89 04 24             	mov    %eax,(%esp)
  102c17:	e8 3e fe ff ff       	call   102a5a <printfmt>
            }
            break;
  102c1c:	e9 45 02 00 00       	jmp    102e66 <vprintfmt+0x3de>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  102c21:	8b 45 14             	mov    0x14(%ebp),%eax
  102c24:	8d 50 04             	lea    0x4(%eax),%edx
  102c27:	89 55 14             	mov    %edx,0x14(%ebp)
  102c2a:	8b 30                	mov    (%eax),%esi
  102c2c:	85 f6                	test   %esi,%esi
  102c2e:	75 05                	jne    102c35 <vprintfmt+0x1ad>
                p = "(null)";
  102c30:	be ad 3b 10 00       	mov    $0x103bad,%esi
            }
            if (width > 0 && padc != '-') {
  102c35:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102c39:	7e 3e                	jle    102c79 <vprintfmt+0x1f1>
  102c3b:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  102c3f:	74 38                	je     102c79 <vprintfmt+0x1f1>
                for (width -= strnlen(p, precision); width > 0; width --) {
  102c41:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  102c44:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102c47:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c4b:	89 34 24             	mov    %esi,(%esp)
  102c4e:	e8 15 03 00 00       	call   102f68 <strnlen>
  102c53:	29 c3                	sub    %eax,%ebx
  102c55:	89 d8                	mov    %ebx,%eax
  102c57:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102c5a:	eb 17                	jmp    102c73 <vprintfmt+0x1eb>
                    putch(padc, putdat);
  102c5c:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  102c60:	8b 55 0c             	mov    0xc(%ebp),%edx
  102c63:	89 54 24 04          	mov    %edx,0x4(%esp)
  102c67:	89 04 24             	mov    %eax,(%esp)
  102c6a:	8b 45 08             	mov    0x8(%ebp),%eax
  102c6d:	ff d0                	call   *%eax
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
                p = "(null)";
            }
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
  102c6f:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102c73:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102c77:	7f e3                	jg     102c5c <vprintfmt+0x1d4>
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102c79:	eb 38                	jmp    102cb3 <vprintfmt+0x22b>
                if (altflag && (ch < ' ' || ch > '~')) {
  102c7b:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  102c7f:	74 1f                	je     102ca0 <vprintfmt+0x218>
  102c81:	83 fb 1f             	cmp    $0x1f,%ebx
  102c84:	7e 05                	jle    102c8b <vprintfmt+0x203>
  102c86:	83 fb 7e             	cmp    $0x7e,%ebx
  102c89:	7e 15                	jle    102ca0 <vprintfmt+0x218>
                    putch('?', putdat);
  102c8b:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c8e:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c92:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  102c99:	8b 45 08             	mov    0x8(%ebp),%eax
  102c9c:	ff d0                	call   *%eax
  102c9e:	eb 0f                	jmp    102caf <vprintfmt+0x227>
                }
                else {
                    putch(ch, putdat);
  102ca0:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ca3:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ca7:	89 1c 24             	mov    %ebx,(%esp)
  102caa:	8b 45 08             	mov    0x8(%ebp),%eax
  102cad:	ff d0                	call   *%eax
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102caf:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102cb3:	89 f0                	mov    %esi,%eax
  102cb5:	8d 70 01             	lea    0x1(%eax),%esi
  102cb8:	0f b6 00             	movzbl (%eax),%eax
  102cbb:	0f be d8             	movsbl %al,%ebx
  102cbe:	85 db                	test   %ebx,%ebx
  102cc0:	74 10                	je     102cd2 <vprintfmt+0x24a>
  102cc2:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102cc6:	78 b3                	js     102c7b <vprintfmt+0x1f3>
  102cc8:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  102ccc:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102cd0:	79 a9                	jns    102c7b <vprintfmt+0x1f3>
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  102cd2:	eb 17                	jmp    102ceb <vprintfmt+0x263>
                putch(' ', putdat);
  102cd4:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cd7:	89 44 24 04          	mov    %eax,0x4(%esp)
  102cdb:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  102ce2:	8b 45 08             	mov    0x8(%ebp),%eax
  102ce5:	ff d0                	call   *%eax
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  102ce7:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102ceb:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102cef:	7f e3                	jg     102cd4 <vprintfmt+0x24c>
                putch(' ', putdat);
            }
            break;
  102cf1:	e9 70 01 00 00       	jmp    102e66 <vprintfmt+0x3de>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  102cf6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102cf9:	89 44 24 04          	mov    %eax,0x4(%esp)
  102cfd:	8d 45 14             	lea    0x14(%ebp),%eax
  102d00:	89 04 24             	mov    %eax,(%esp)
  102d03:	e8 0b fd ff ff       	call   102a13 <getint>
  102d08:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102d0b:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  102d0e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d11:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102d14:	85 d2                	test   %edx,%edx
  102d16:	79 26                	jns    102d3e <vprintfmt+0x2b6>
                putch('-', putdat);
  102d18:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d1b:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d1f:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  102d26:	8b 45 08             	mov    0x8(%ebp),%eax
  102d29:	ff d0                	call   *%eax
                num = -(long long)num;
  102d2b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d2e:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102d31:	f7 d8                	neg    %eax
  102d33:	83 d2 00             	adc    $0x0,%edx
  102d36:	f7 da                	neg    %edx
  102d38:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102d3b:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  102d3e:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102d45:	e9 a8 00 00 00       	jmp    102df2 <vprintfmt+0x36a>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  102d4a:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102d4d:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d51:	8d 45 14             	lea    0x14(%ebp),%eax
  102d54:	89 04 24             	mov    %eax,(%esp)
  102d57:	e8 68 fc ff ff       	call   1029c4 <getuint>
  102d5c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102d5f:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  102d62:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102d69:	e9 84 00 00 00       	jmp    102df2 <vprintfmt+0x36a>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  102d6e:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102d71:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d75:	8d 45 14             	lea    0x14(%ebp),%eax
  102d78:	89 04 24             	mov    %eax,(%esp)
  102d7b:	e8 44 fc ff ff       	call   1029c4 <getuint>
  102d80:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102d83:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  102d86:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  102d8d:	eb 63                	jmp    102df2 <vprintfmt+0x36a>

        // pointer
        case 'p':
            putch('0', putdat);
  102d8f:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d92:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d96:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  102d9d:	8b 45 08             	mov    0x8(%ebp),%eax
  102da0:	ff d0                	call   *%eax
            putch('x', putdat);
  102da2:	8b 45 0c             	mov    0xc(%ebp),%eax
  102da5:	89 44 24 04          	mov    %eax,0x4(%esp)
  102da9:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  102db0:	8b 45 08             	mov    0x8(%ebp),%eax
  102db3:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  102db5:	8b 45 14             	mov    0x14(%ebp),%eax
  102db8:	8d 50 04             	lea    0x4(%eax),%edx
  102dbb:	89 55 14             	mov    %edx,0x14(%ebp)
  102dbe:	8b 00                	mov    (%eax),%eax
  102dc0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102dc3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  102dca:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  102dd1:	eb 1f                	jmp    102df2 <vprintfmt+0x36a>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  102dd3:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102dd6:	89 44 24 04          	mov    %eax,0x4(%esp)
  102dda:	8d 45 14             	lea    0x14(%ebp),%eax
  102ddd:	89 04 24             	mov    %eax,(%esp)
  102de0:	e8 df fb ff ff       	call   1029c4 <getuint>
  102de5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102de8:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  102deb:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  102df2:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  102df6:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102df9:	89 54 24 18          	mov    %edx,0x18(%esp)
  102dfd:	8b 55 e8             	mov    -0x18(%ebp),%edx
  102e00:	89 54 24 14          	mov    %edx,0x14(%esp)
  102e04:	89 44 24 10          	mov    %eax,0x10(%esp)
  102e08:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e0b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102e0e:	89 44 24 08          	mov    %eax,0x8(%esp)
  102e12:	89 54 24 0c          	mov    %edx,0xc(%esp)
  102e16:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e19:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e1d:	8b 45 08             	mov    0x8(%ebp),%eax
  102e20:	89 04 24             	mov    %eax,(%esp)
  102e23:	e8 97 fa ff ff       	call   1028bf <printnum>
            break;
  102e28:	eb 3c                	jmp    102e66 <vprintfmt+0x3de>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  102e2a:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e2d:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e31:	89 1c 24             	mov    %ebx,(%esp)
  102e34:	8b 45 08             	mov    0x8(%ebp),%eax
  102e37:	ff d0                	call   *%eax
            break;
  102e39:	eb 2b                	jmp    102e66 <vprintfmt+0x3de>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  102e3b:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e3e:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e42:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  102e49:	8b 45 08             	mov    0x8(%ebp),%eax
  102e4c:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  102e4e:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102e52:	eb 04                	jmp    102e58 <vprintfmt+0x3d0>
  102e54:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102e58:	8b 45 10             	mov    0x10(%ebp),%eax
  102e5b:	83 e8 01             	sub    $0x1,%eax
  102e5e:	0f b6 00             	movzbl (%eax),%eax
  102e61:	3c 25                	cmp    $0x25,%al
  102e63:	75 ef                	jne    102e54 <vprintfmt+0x3cc>
                /* do nothing */;
            break;
  102e65:	90                   	nop
        }
    }
  102e66:	90                   	nop
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102e67:	e9 3e fc ff ff       	jmp    102aaa <vprintfmt+0x22>
            for (fmt --; fmt[-1] != '%'; fmt --)
                /* do nothing */;
            break;
        }
    }
}
  102e6c:	83 c4 40             	add    $0x40,%esp
  102e6f:	5b                   	pop    %ebx
  102e70:	5e                   	pop    %esi
  102e71:	5d                   	pop    %ebp
  102e72:	c3                   	ret    

00102e73 <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  102e73:	55                   	push   %ebp
  102e74:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  102e76:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e79:	8b 40 08             	mov    0x8(%eax),%eax
  102e7c:	8d 50 01             	lea    0x1(%eax),%edx
  102e7f:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e82:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  102e85:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e88:	8b 10                	mov    (%eax),%edx
  102e8a:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e8d:	8b 40 04             	mov    0x4(%eax),%eax
  102e90:	39 c2                	cmp    %eax,%edx
  102e92:	73 12                	jae    102ea6 <sprintputch+0x33>
        *b->buf ++ = ch;
  102e94:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e97:	8b 00                	mov    (%eax),%eax
  102e99:	8d 48 01             	lea    0x1(%eax),%ecx
  102e9c:	8b 55 0c             	mov    0xc(%ebp),%edx
  102e9f:	89 0a                	mov    %ecx,(%edx)
  102ea1:	8b 55 08             	mov    0x8(%ebp),%edx
  102ea4:	88 10                	mov    %dl,(%eax)
    }
}
  102ea6:	5d                   	pop    %ebp
  102ea7:	c3                   	ret    

00102ea8 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  102ea8:	55                   	push   %ebp
  102ea9:	89 e5                	mov    %esp,%ebp
  102eab:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  102eae:	8d 45 14             	lea    0x14(%ebp),%eax
  102eb1:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  102eb4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102eb7:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102ebb:	8b 45 10             	mov    0x10(%ebp),%eax
  102ebe:	89 44 24 08          	mov    %eax,0x8(%esp)
  102ec2:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ec5:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ec9:	8b 45 08             	mov    0x8(%ebp),%eax
  102ecc:	89 04 24             	mov    %eax,(%esp)
  102ecf:	e8 08 00 00 00       	call   102edc <vsnprintf>
  102ed4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  102ed7:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  102eda:	c9                   	leave  
  102edb:	c3                   	ret    

00102edc <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  102edc:	55                   	push   %ebp
  102edd:	89 e5                	mov    %esp,%ebp
  102edf:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  102ee2:	8b 45 08             	mov    0x8(%ebp),%eax
  102ee5:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102ee8:	8b 45 0c             	mov    0xc(%ebp),%eax
  102eeb:	8d 50 ff             	lea    -0x1(%eax),%edx
  102eee:	8b 45 08             	mov    0x8(%ebp),%eax
  102ef1:	01 d0                	add    %edx,%eax
  102ef3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102ef6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  102efd:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102f01:	74 0a                	je     102f0d <vsnprintf+0x31>
  102f03:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102f06:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f09:	39 c2                	cmp    %eax,%edx
  102f0b:	76 07                	jbe    102f14 <vsnprintf+0x38>
        return -E_INVAL;
  102f0d:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  102f12:	eb 2a                	jmp    102f3e <vsnprintf+0x62>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  102f14:	8b 45 14             	mov    0x14(%ebp),%eax
  102f17:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102f1b:	8b 45 10             	mov    0x10(%ebp),%eax
  102f1e:	89 44 24 08          	mov    %eax,0x8(%esp)
  102f22:	8d 45 ec             	lea    -0x14(%ebp),%eax
  102f25:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f29:	c7 04 24 73 2e 10 00 	movl   $0x102e73,(%esp)
  102f30:	e8 53 fb ff ff       	call   102a88 <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  102f35:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102f38:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  102f3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  102f3e:	c9                   	leave  
  102f3f:	c3                   	ret    

00102f40 <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  102f40:	55                   	push   %ebp
  102f41:	89 e5                	mov    %esp,%ebp
  102f43:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102f46:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  102f4d:	eb 04                	jmp    102f53 <strlen+0x13>
        cnt ++;
  102f4f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
    size_t cnt = 0;
    while (*s ++ != '\0') {
  102f53:	8b 45 08             	mov    0x8(%ebp),%eax
  102f56:	8d 50 01             	lea    0x1(%eax),%edx
  102f59:	89 55 08             	mov    %edx,0x8(%ebp)
  102f5c:	0f b6 00             	movzbl (%eax),%eax
  102f5f:	84 c0                	test   %al,%al
  102f61:	75 ec                	jne    102f4f <strlen+0xf>
        cnt ++;
    }
    return cnt;
  102f63:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102f66:	c9                   	leave  
  102f67:	c3                   	ret    

00102f68 <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  102f68:	55                   	push   %ebp
  102f69:	89 e5                	mov    %esp,%ebp
  102f6b:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102f6e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102f75:	eb 04                	jmp    102f7b <strnlen+0x13>
        cnt ++;
  102f77:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
    size_t cnt = 0;
    while (cnt < len && *s ++ != '\0') {
  102f7b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102f7e:	3b 45 0c             	cmp    0xc(%ebp),%eax
  102f81:	73 10                	jae    102f93 <strnlen+0x2b>
  102f83:	8b 45 08             	mov    0x8(%ebp),%eax
  102f86:	8d 50 01             	lea    0x1(%eax),%edx
  102f89:	89 55 08             	mov    %edx,0x8(%ebp)
  102f8c:	0f b6 00             	movzbl (%eax),%eax
  102f8f:	84 c0                	test   %al,%al
  102f91:	75 e4                	jne    102f77 <strnlen+0xf>
        cnt ++;
    }
    return cnt;
  102f93:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102f96:	c9                   	leave  
  102f97:	c3                   	ret    

00102f98 <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  102f98:	55                   	push   %ebp
  102f99:	89 e5                	mov    %esp,%ebp
  102f9b:	57                   	push   %edi
  102f9c:	56                   	push   %esi
  102f9d:	83 ec 20             	sub    $0x20,%esp
  102fa0:	8b 45 08             	mov    0x8(%ebp),%eax
  102fa3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102fa6:	8b 45 0c             	mov    0xc(%ebp),%eax
  102fa9:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  102fac:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102faf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102fb2:	89 d1                	mov    %edx,%ecx
  102fb4:	89 c2                	mov    %eax,%edx
  102fb6:	89 ce                	mov    %ecx,%esi
  102fb8:	89 d7                	mov    %edx,%edi
  102fba:	ac                   	lods   %ds:(%esi),%al
  102fbb:	aa                   	stos   %al,%es:(%edi)
  102fbc:	84 c0                	test   %al,%al
  102fbe:	75 fa                	jne    102fba <strcpy+0x22>
  102fc0:	89 fa                	mov    %edi,%edx
  102fc2:	89 f1                	mov    %esi,%ecx
  102fc4:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102fc7:	89 55 e8             	mov    %edx,-0x18(%ebp)
  102fca:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  102fcd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  102fd0:	83 c4 20             	add    $0x20,%esp
  102fd3:	5e                   	pop    %esi
  102fd4:	5f                   	pop    %edi
  102fd5:	5d                   	pop    %ebp
  102fd6:	c3                   	ret    

00102fd7 <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  102fd7:	55                   	push   %ebp
  102fd8:	89 e5                	mov    %esp,%ebp
  102fda:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  102fdd:	8b 45 08             	mov    0x8(%ebp),%eax
  102fe0:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  102fe3:	eb 21                	jmp    103006 <strncpy+0x2f>
        if ((*p = *src) != '\0') {
  102fe5:	8b 45 0c             	mov    0xc(%ebp),%eax
  102fe8:	0f b6 10             	movzbl (%eax),%edx
  102feb:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102fee:	88 10                	mov    %dl,(%eax)
  102ff0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102ff3:	0f b6 00             	movzbl (%eax),%eax
  102ff6:	84 c0                	test   %al,%al
  102ff8:	74 04                	je     102ffe <strncpy+0x27>
            src ++;
  102ffa:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
        }
        p ++, len --;
  102ffe:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  103002:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
    char *p = dst;
    while (len > 0) {
  103006:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10300a:	75 d9                	jne    102fe5 <strncpy+0xe>
        if ((*p = *src) != '\0') {
            src ++;
        }
        p ++, len --;
    }
    return dst;
  10300c:	8b 45 08             	mov    0x8(%ebp),%eax
}
  10300f:	c9                   	leave  
  103010:	c3                   	ret    

00103011 <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  103011:	55                   	push   %ebp
  103012:	89 e5                	mov    %esp,%ebp
  103014:	57                   	push   %edi
  103015:	56                   	push   %esi
  103016:	83 ec 20             	sub    $0x20,%esp
  103019:	8b 45 08             	mov    0x8(%ebp),%eax
  10301c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10301f:	8b 45 0c             	mov    0xc(%ebp),%eax
  103022:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCMP
#define __HAVE_ARCH_STRCMP
static inline int
__strcmp(const char *s1, const char *s2) {
    int d0, d1, ret;
    asm volatile (
  103025:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103028:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10302b:	89 d1                	mov    %edx,%ecx
  10302d:	89 c2                	mov    %eax,%edx
  10302f:	89 ce                	mov    %ecx,%esi
  103031:	89 d7                	mov    %edx,%edi
  103033:	ac                   	lods   %ds:(%esi),%al
  103034:	ae                   	scas   %es:(%edi),%al
  103035:	75 08                	jne    10303f <strcmp+0x2e>
  103037:	84 c0                	test   %al,%al
  103039:	75 f8                	jne    103033 <strcmp+0x22>
  10303b:	31 c0                	xor    %eax,%eax
  10303d:	eb 04                	jmp    103043 <strcmp+0x32>
  10303f:	19 c0                	sbb    %eax,%eax
  103041:	0c 01                	or     $0x1,%al
  103043:	89 fa                	mov    %edi,%edx
  103045:	89 f1                	mov    %esi,%ecx
  103047:	89 45 ec             	mov    %eax,-0x14(%ebp)
  10304a:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  10304d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            "orb $1, %%al;"
            "3:"
            : "=a" (ret), "=&S" (d0), "=&D" (d1)
            : "1" (s1), "2" (s2)
            : "memory");
    return ret;
  103050:	8b 45 ec             	mov    -0x14(%ebp),%eax
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  103053:	83 c4 20             	add    $0x20,%esp
  103056:	5e                   	pop    %esi
  103057:	5f                   	pop    %edi
  103058:	5d                   	pop    %ebp
  103059:	c3                   	ret    

0010305a <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  10305a:	55                   	push   %ebp
  10305b:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  10305d:	eb 0c                	jmp    10306b <strncmp+0x11>
        n --, s1 ++, s2 ++;
  10305f:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  103063:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103067:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  10306b:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10306f:	74 1a                	je     10308b <strncmp+0x31>
  103071:	8b 45 08             	mov    0x8(%ebp),%eax
  103074:	0f b6 00             	movzbl (%eax),%eax
  103077:	84 c0                	test   %al,%al
  103079:	74 10                	je     10308b <strncmp+0x31>
  10307b:	8b 45 08             	mov    0x8(%ebp),%eax
  10307e:	0f b6 10             	movzbl (%eax),%edx
  103081:	8b 45 0c             	mov    0xc(%ebp),%eax
  103084:	0f b6 00             	movzbl (%eax),%eax
  103087:	38 c2                	cmp    %al,%dl
  103089:	74 d4                	je     10305f <strncmp+0x5>
        n --, s1 ++, s2 ++;
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  10308b:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10308f:	74 18                	je     1030a9 <strncmp+0x4f>
  103091:	8b 45 08             	mov    0x8(%ebp),%eax
  103094:	0f b6 00             	movzbl (%eax),%eax
  103097:	0f b6 d0             	movzbl %al,%edx
  10309a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10309d:	0f b6 00             	movzbl (%eax),%eax
  1030a0:	0f b6 c0             	movzbl %al,%eax
  1030a3:	29 c2                	sub    %eax,%edx
  1030a5:	89 d0                	mov    %edx,%eax
  1030a7:	eb 05                	jmp    1030ae <strncmp+0x54>
  1030a9:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1030ae:	5d                   	pop    %ebp
  1030af:	c3                   	ret    

001030b0 <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  1030b0:	55                   	push   %ebp
  1030b1:	89 e5                	mov    %esp,%ebp
  1030b3:	83 ec 04             	sub    $0x4,%esp
  1030b6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030b9:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  1030bc:	eb 14                	jmp    1030d2 <strchr+0x22>
        if (*s == c) {
  1030be:	8b 45 08             	mov    0x8(%ebp),%eax
  1030c1:	0f b6 00             	movzbl (%eax),%eax
  1030c4:	3a 45 fc             	cmp    -0x4(%ebp),%al
  1030c7:	75 05                	jne    1030ce <strchr+0x1e>
            return (char *)s;
  1030c9:	8b 45 08             	mov    0x8(%ebp),%eax
  1030cc:	eb 13                	jmp    1030e1 <strchr+0x31>
        }
        s ++;
  1030ce:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
    while (*s != '\0') {
  1030d2:	8b 45 08             	mov    0x8(%ebp),%eax
  1030d5:	0f b6 00             	movzbl (%eax),%eax
  1030d8:	84 c0                	test   %al,%al
  1030da:	75 e2                	jne    1030be <strchr+0xe>
        if (*s == c) {
            return (char *)s;
        }
        s ++;
    }
    return NULL;
  1030dc:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1030e1:	c9                   	leave  
  1030e2:	c3                   	ret    

001030e3 <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  1030e3:	55                   	push   %ebp
  1030e4:	89 e5                	mov    %esp,%ebp
  1030e6:	83 ec 04             	sub    $0x4,%esp
  1030e9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030ec:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  1030ef:	eb 11                	jmp    103102 <strfind+0x1f>
        if (*s == c) {
  1030f1:	8b 45 08             	mov    0x8(%ebp),%eax
  1030f4:	0f b6 00             	movzbl (%eax),%eax
  1030f7:	3a 45 fc             	cmp    -0x4(%ebp),%al
  1030fa:	75 02                	jne    1030fe <strfind+0x1b>
            break;
  1030fc:	eb 0e                	jmp    10310c <strfind+0x29>
        }
        s ++;
  1030fe:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
    while (*s != '\0') {
  103102:	8b 45 08             	mov    0x8(%ebp),%eax
  103105:	0f b6 00             	movzbl (%eax),%eax
  103108:	84 c0                	test   %al,%al
  10310a:	75 e5                	jne    1030f1 <strfind+0xe>
        if (*s == c) {
            break;
        }
        s ++;
    }
    return (char *)s;
  10310c:	8b 45 08             	mov    0x8(%ebp),%eax
}
  10310f:	c9                   	leave  
  103110:	c3                   	ret    

00103111 <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  103111:	55                   	push   %ebp
  103112:	89 e5                	mov    %esp,%ebp
  103114:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  103117:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  10311e:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  103125:	eb 04                	jmp    10312b <strtol+0x1a>
        s ++;
  103127:	83 45 08 01          	addl   $0x1,0x8(%ebp)
strtol(const char *s, char **endptr, int base) {
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  10312b:	8b 45 08             	mov    0x8(%ebp),%eax
  10312e:	0f b6 00             	movzbl (%eax),%eax
  103131:	3c 20                	cmp    $0x20,%al
  103133:	74 f2                	je     103127 <strtol+0x16>
  103135:	8b 45 08             	mov    0x8(%ebp),%eax
  103138:	0f b6 00             	movzbl (%eax),%eax
  10313b:	3c 09                	cmp    $0x9,%al
  10313d:	74 e8                	je     103127 <strtol+0x16>
        s ++;
    }

    // plus/minus sign
    if (*s == '+') {
  10313f:	8b 45 08             	mov    0x8(%ebp),%eax
  103142:	0f b6 00             	movzbl (%eax),%eax
  103145:	3c 2b                	cmp    $0x2b,%al
  103147:	75 06                	jne    10314f <strtol+0x3e>
        s ++;
  103149:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  10314d:	eb 15                	jmp    103164 <strtol+0x53>
    }
    else if (*s == '-') {
  10314f:	8b 45 08             	mov    0x8(%ebp),%eax
  103152:	0f b6 00             	movzbl (%eax),%eax
  103155:	3c 2d                	cmp    $0x2d,%al
  103157:	75 0b                	jne    103164 <strtol+0x53>
        s ++, neg = 1;
  103159:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  10315d:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  103164:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103168:	74 06                	je     103170 <strtol+0x5f>
  10316a:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  10316e:	75 24                	jne    103194 <strtol+0x83>
  103170:	8b 45 08             	mov    0x8(%ebp),%eax
  103173:	0f b6 00             	movzbl (%eax),%eax
  103176:	3c 30                	cmp    $0x30,%al
  103178:	75 1a                	jne    103194 <strtol+0x83>
  10317a:	8b 45 08             	mov    0x8(%ebp),%eax
  10317d:	83 c0 01             	add    $0x1,%eax
  103180:	0f b6 00             	movzbl (%eax),%eax
  103183:	3c 78                	cmp    $0x78,%al
  103185:	75 0d                	jne    103194 <strtol+0x83>
        s += 2, base = 16;
  103187:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  10318b:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  103192:	eb 2a                	jmp    1031be <strtol+0xad>
    }
    else if (base == 0 && s[0] == '0') {
  103194:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103198:	75 17                	jne    1031b1 <strtol+0xa0>
  10319a:	8b 45 08             	mov    0x8(%ebp),%eax
  10319d:	0f b6 00             	movzbl (%eax),%eax
  1031a0:	3c 30                	cmp    $0x30,%al
  1031a2:	75 0d                	jne    1031b1 <strtol+0xa0>
        s ++, base = 8;
  1031a4:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1031a8:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  1031af:	eb 0d                	jmp    1031be <strtol+0xad>
    }
    else if (base == 0) {
  1031b1:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1031b5:	75 07                	jne    1031be <strtol+0xad>
        base = 10;
  1031b7:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  1031be:	8b 45 08             	mov    0x8(%ebp),%eax
  1031c1:	0f b6 00             	movzbl (%eax),%eax
  1031c4:	3c 2f                	cmp    $0x2f,%al
  1031c6:	7e 1b                	jle    1031e3 <strtol+0xd2>
  1031c8:	8b 45 08             	mov    0x8(%ebp),%eax
  1031cb:	0f b6 00             	movzbl (%eax),%eax
  1031ce:	3c 39                	cmp    $0x39,%al
  1031d0:	7f 11                	jg     1031e3 <strtol+0xd2>
            dig = *s - '0';
  1031d2:	8b 45 08             	mov    0x8(%ebp),%eax
  1031d5:	0f b6 00             	movzbl (%eax),%eax
  1031d8:	0f be c0             	movsbl %al,%eax
  1031db:	83 e8 30             	sub    $0x30,%eax
  1031de:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1031e1:	eb 48                	jmp    10322b <strtol+0x11a>
        }
        else if (*s >= 'a' && *s <= 'z') {
  1031e3:	8b 45 08             	mov    0x8(%ebp),%eax
  1031e6:	0f b6 00             	movzbl (%eax),%eax
  1031e9:	3c 60                	cmp    $0x60,%al
  1031eb:	7e 1b                	jle    103208 <strtol+0xf7>
  1031ed:	8b 45 08             	mov    0x8(%ebp),%eax
  1031f0:	0f b6 00             	movzbl (%eax),%eax
  1031f3:	3c 7a                	cmp    $0x7a,%al
  1031f5:	7f 11                	jg     103208 <strtol+0xf7>
            dig = *s - 'a' + 10;
  1031f7:	8b 45 08             	mov    0x8(%ebp),%eax
  1031fa:	0f b6 00             	movzbl (%eax),%eax
  1031fd:	0f be c0             	movsbl %al,%eax
  103200:	83 e8 57             	sub    $0x57,%eax
  103203:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103206:	eb 23                	jmp    10322b <strtol+0x11a>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  103208:	8b 45 08             	mov    0x8(%ebp),%eax
  10320b:	0f b6 00             	movzbl (%eax),%eax
  10320e:	3c 40                	cmp    $0x40,%al
  103210:	7e 3d                	jle    10324f <strtol+0x13e>
  103212:	8b 45 08             	mov    0x8(%ebp),%eax
  103215:	0f b6 00             	movzbl (%eax),%eax
  103218:	3c 5a                	cmp    $0x5a,%al
  10321a:	7f 33                	jg     10324f <strtol+0x13e>
            dig = *s - 'A' + 10;
  10321c:	8b 45 08             	mov    0x8(%ebp),%eax
  10321f:	0f b6 00             	movzbl (%eax),%eax
  103222:	0f be c0             	movsbl %al,%eax
  103225:	83 e8 37             	sub    $0x37,%eax
  103228:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  10322b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10322e:	3b 45 10             	cmp    0x10(%ebp),%eax
  103231:	7c 02                	jl     103235 <strtol+0x124>
            break;
  103233:	eb 1a                	jmp    10324f <strtol+0x13e>
        }
        s ++, val = (val * base) + dig;
  103235:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103239:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10323c:	0f af 45 10          	imul   0x10(%ebp),%eax
  103240:	89 c2                	mov    %eax,%edx
  103242:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103245:	01 d0                	add    %edx,%eax
  103247:	89 45 f8             	mov    %eax,-0x8(%ebp)
        // we don't properly detect overflow!
    }
  10324a:	e9 6f ff ff ff       	jmp    1031be <strtol+0xad>

    if (endptr) {
  10324f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  103253:	74 08                	je     10325d <strtol+0x14c>
        *endptr = (char *) s;
  103255:	8b 45 0c             	mov    0xc(%ebp),%eax
  103258:	8b 55 08             	mov    0x8(%ebp),%edx
  10325b:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  10325d:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  103261:	74 07                	je     10326a <strtol+0x159>
  103263:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103266:	f7 d8                	neg    %eax
  103268:	eb 03                	jmp    10326d <strtol+0x15c>
  10326a:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  10326d:	c9                   	leave  
  10326e:	c3                   	ret    

0010326f <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  10326f:	55                   	push   %ebp
  103270:	89 e5                	mov    %esp,%ebp
  103272:	57                   	push   %edi
  103273:	83 ec 24             	sub    $0x24,%esp
  103276:	8b 45 0c             	mov    0xc(%ebp),%eax
  103279:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  10327c:	0f be 45 d8          	movsbl -0x28(%ebp),%eax
  103280:	8b 55 08             	mov    0x8(%ebp),%edx
  103283:	89 55 f8             	mov    %edx,-0x8(%ebp)
  103286:	88 45 f7             	mov    %al,-0x9(%ebp)
  103289:	8b 45 10             	mov    0x10(%ebp),%eax
  10328c:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  10328f:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  103292:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  103296:	8b 55 f8             	mov    -0x8(%ebp),%edx
  103299:	89 d7                	mov    %edx,%edi
  10329b:	f3 aa                	rep stos %al,%es:(%edi)
  10329d:	89 fa                	mov    %edi,%edx
  10329f:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  1032a2:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  1032a5:	8b 45 f8             	mov    -0x8(%ebp),%eax
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  1032a8:	83 c4 24             	add    $0x24,%esp
  1032ab:	5f                   	pop    %edi
  1032ac:	5d                   	pop    %ebp
  1032ad:	c3                   	ret    

001032ae <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  1032ae:	55                   	push   %ebp
  1032af:	89 e5                	mov    %esp,%ebp
  1032b1:	57                   	push   %edi
  1032b2:	56                   	push   %esi
  1032b3:	53                   	push   %ebx
  1032b4:	83 ec 30             	sub    $0x30,%esp
  1032b7:	8b 45 08             	mov    0x8(%ebp),%eax
  1032ba:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1032bd:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032c0:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1032c3:	8b 45 10             	mov    0x10(%ebp),%eax
  1032c6:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  1032c9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1032cc:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  1032cf:	73 42                	jae    103313 <memmove+0x65>
  1032d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1032d4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1032d7:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1032da:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1032dd:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1032e0:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  1032e3:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1032e6:	c1 e8 02             	shr    $0x2,%eax
  1032e9:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  1032eb:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1032ee:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1032f1:	89 d7                	mov    %edx,%edi
  1032f3:	89 c6                	mov    %eax,%esi
  1032f5:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1032f7:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  1032fa:	83 e1 03             	and    $0x3,%ecx
  1032fd:	74 02                	je     103301 <memmove+0x53>
  1032ff:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103301:	89 f0                	mov    %esi,%eax
  103303:	89 fa                	mov    %edi,%edx
  103305:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  103308:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  10330b:	89 45 d0             	mov    %eax,-0x30(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  10330e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  103311:	eb 36                	jmp    103349 <memmove+0x9b>
    asm volatile (
            "std;"
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  103313:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103316:	8d 50 ff             	lea    -0x1(%eax),%edx
  103319:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10331c:	01 c2                	add    %eax,%edx
  10331e:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103321:	8d 48 ff             	lea    -0x1(%eax),%ecx
  103324:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103327:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
        return __memcpy(dst, src, n);
    }
    int d0, d1, d2;
    asm volatile (
  10332a:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10332d:	89 c1                	mov    %eax,%ecx
  10332f:	89 d8                	mov    %ebx,%eax
  103331:	89 d6                	mov    %edx,%esi
  103333:	89 c7                	mov    %eax,%edi
  103335:	fd                   	std    
  103336:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103338:	fc                   	cld    
  103339:	89 f8                	mov    %edi,%eax
  10333b:	89 f2                	mov    %esi,%edx
  10333d:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  103340:	89 55 c8             	mov    %edx,-0x38(%ebp)
  103343:	89 45 c4             	mov    %eax,-0x3c(%ebp)
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
            : "memory");
    return dst;
  103346:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  103349:	83 c4 30             	add    $0x30,%esp
  10334c:	5b                   	pop    %ebx
  10334d:	5e                   	pop    %esi
  10334e:	5f                   	pop    %edi
  10334f:	5d                   	pop    %ebp
  103350:	c3                   	ret    

00103351 <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  103351:	55                   	push   %ebp
  103352:	89 e5                	mov    %esp,%ebp
  103354:	57                   	push   %edi
  103355:	56                   	push   %esi
  103356:	83 ec 20             	sub    $0x20,%esp
  103359:	8b 45 08             	mov    0x8(%ebp),%eax
  10335c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10335f:	8b 45 0c             	mov    0xc(%ebp),%eax
  103362:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103365:	8b 45 10             	mov    0x10(%ebp),%eax
  103368:	89 45 ec             	mov    %eax,-0x14(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  10336b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10336e:	c1 e8 02             	shr    $0x2,%eax
  103371:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  103373:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103376:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103379:	89 d7                	mov    %edx,%edi
  10337b:	89 c6                	mov    %eax,%esi
  10337d:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10337f:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  103382:	83 e1 03             	and    $0x3,%ecx
  103385:	74 02                	je     103389 <memcpy+0x38>
  103387:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103389:	89 f0                	mov    %esi,%eax
  10338b:	89 fa                	mov    %edi,%edx
  10338d:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  103390:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  103393:	89 45 e0             	mov    %eax,-0x20(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  103396:	8b 45 f4             	mov    -0xc(%ebp),%eax
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  103399:	83 c4 20             	add    $0x20,%esp
  10339c:	5e                   	pop    %esi
  10339d:	5f                   	pop    %edi
  10339e:	5d                   	pop    %ebp
  10339f:	c3                   	ret    

001033a0 <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  1033a0:	55                   	push   %ebp
  1033a1:	89 e5                	mov    %esp,%ebp
  1033a3:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  1033a6:	8b 45 08             	mov    0x8(%ebp),%eax
  1033a9:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  1033ac:	8b 45 0c             	mov    0xc(%ebp),%eax
  1033af:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  1033b2:	eb 30                	jmp    1033e4 <memcmp+0x44>
        if (*s1 != *s2) {
  1033b4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1033b7:	0f b6 10             	movzbl (%eax),%edx
  1033ba:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1033bd:	0f b6 00             	movzbl (%eax),%eax
  1033c0:	38 c2                	cmp    %al,%dl
  1033c2:	74 18                	je     1033dc <memcmp+0x3c>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  1033c4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1033c7:	0f b6 00             	movzbl (%eax),%eax
  1033ca:	0f b6 d0             	movzbl %al,%edx
  1033cd:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1033d0:	0f b6 00             	movzbl (%eax),%eax
  1033d3:	0f b6 c0             	movzbl %al,%eax
  1033d6:	29 c2                	sub    %eax,%edx
  1033d8:	89 d0                	mov    %edx,%eax
  1033da:	eb 1a                	jmp    1033f6 <memcmp+0x56>
        }
        s1 ++, s2 ++;
  1033dc:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1033e0:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
    const char *s1 = (const char *)v1;
    const char *s2 = (const char *)v2;
    while (n -- > 0) {
  1033e4:	8b 45 10             	mov    0x10(%ebp),%eax
  1033e7:	8d 50 ff             	lea    -0x1(%eax),%edx
  1033ea:	89 55 10             	mov    %edx,0x10(%ebp)
  1033ed:	85 c0                	test   %eax,%eax
  1033ef:	75 c3                	jne    1033b4 <memcmp+0x14>
        if (*s1 != *s2) {
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
        }
        s1 ++, s2 ++;
    }
    return 0;
  1033f1:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1033f6:	c9                   	leave  
  1033f7:	c3                   	ret    
