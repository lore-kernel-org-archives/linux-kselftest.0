From: shuah at kernel.org (Shuah Khan)
Date: Wed, 10 Oct 2018 14:25:31 -0600
Subject: [PATCH] selftests/gpio: fix compiling errors
In-Reply-To: <1372e275-d276-7982-127e-dd339ead1b67@cn.fujitsu.com>
References: <1537524021-3371-1-git-send-email-lizhijian@cn.fujitsu.com>
 <1372e275-d276-7982-127e-dd339ead1b67@cn.fujitsu.com>
Message-ID: <ae288c01-5350-5b95-8157-dd377e6738b1@kernel.org>

On 10/07/2018 08:32 AM, Li Zhijian wrote:
> ping
> 
> 
> On 09/21/2018 06:00 PM, Li Zhijian wrote:
>> lizhijian at haswell-OptiPlex-9020:/home/lizj/linux/tools/testing/selftests$ make
>> [...snip...]
>> make ARCH=x86 CROSS_COMPILE= -C ../../../gpio
>> make[2]: Entering directory '/home/lizj/linux/tools/gpio'
>> [...snip...]
>> make[3]: Leaving directory '/home/lizj/linux/tools/gpio'
>>    LINK     /home/lizj/linux/tools/testing/selftests/gpiogpio-event-mon
>> make[2]: Leaving directory '/home/lizj/linux/tools/gpio'
>> gcc -O2 -g -std=gnu99 -Wall -I../../../../usr/include/ gpio-mockup-chardev.c ../../../gpio/gpio-utils.o  -lmount -I/usr/include/libmount -o gpio-mockup-chardev
>> gcc: error: ../../../gpio/gpio-utils.o: No such file or directory
>> <builtin>: recipe for target 'gpio-mockup-chardev' failed
>> make[1]: *** [gpio-mockup-chardev] Error 1
>> make[1]: Leaving directory
>> '/home/lizj/linux/tools/testing/selftests/gpio'
>> Makefile:85: recipe for target 'all' failed
>> make: *** [all] Error 2
>>
>> in this patch
>> - correct target name to $OUTPUTgpio-utils.o
>> - pass OUTPUT to tools/gpio/Makefile
>> - support cleanup ../gpiogpio-hammer.o
>>
>> CC: Bamvor Jian Zhang <bamv2005 at gmail.com>
>> CC: Bartosz Golaszewski <brgl at bgdev.pl>
>> CC: Shuah Khan <shuah at kernel.org>
>> CC: linux-gpio at vger.kernel.org
>> Signed-off-by: Li Zhijian <lizhijian at cn.fujitsu.com>
>> ---
>>   tools/testing/selftests/gpio/Makefile | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/tools/testing/selftests/gpio/Makefile b/tools/testing/selftests/gpio/Makefile
>> index 4665cdb..7f9354a 100644
>> --- a/tools/testing/selftests/gpio/Makefile
>> +++ b/tools/testing/selftests/gpio/Makefile
>> @@ -7,7 +7,7 @@ EXTRA_PROGS := ../gpiogpio-event-mon ../gpiogpio-hammer ../gpiolsgpio
>>   EXTRA_DIRS := ../gpioinclude/
>>   EXTRA_OBJS := ../gpiogpio-event-mon-in.o ../gpiogpio-event-mon.o
>>   EXTRA_OBJS += ../gpiogpio-hammer-in.o ../gpiogpio-utils.o ../gpiolsgpio-in.o
>> -EXTRA_OBJS += ../gpiolsgpio.o
>> +EXTRA_OBJS += ../gpiolsgpio.o ../gpiogpio-hammer.o
>>     include ../lib.mk
>>   @@ -22,7 +22,7 @@ CFLAGS += -O2 -g -std=gnu99 -Wall -I../../../../usr/include/
>>   LDLIBS += -lmount -I/usr/include/libmount
>>     $(BINARIES):| khdr
>> -$(BINARIES): ../../../gpio/gpio-utils.o
>> +$(BINARIES): ../gpiogpio-utils.o
>>   -../../../gpio/gpio-utils.o:
>> -    make ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C ../../../gpio
>> +../gpiogpio-utils.o:
>> +    make OUTPUT=$(OUTPUT) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C ../../../gpio
> 
Is this still an issue in linux-kselftest next. I applied a few patches
from Fathi Boudra

Please check and let me know if this is till an issue.

thanks,
-- Shuah
