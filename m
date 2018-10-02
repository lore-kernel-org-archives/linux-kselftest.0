From: shuah@kernel.org (Shuah Khan)
Date: Tue, 2 Oct 2018 14:55:24 -0600
Subject: [PATCH v3 1/2] selftests: gpio: restructure Makefile
In-Reply-To: <CAEUSe79yNJ_2FsLsxKW6J0dfrJ2HoVvk+_NZGWHCsy_Kc0+pQw@mail.gmail.com>
References: <1536330895-8391-1-git-send-email-daniel.diaz@linaro.org>
 <CAEUSe79yNJ_2FsLsxKW6J0dfrJ2HoVvk+_NZGWHCsy_Kc0+pQw@mail.gmail.com>
Message-ID: <aee2d946-eecb-ca39-0802-9755a01a7312@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181002205524.QcLUN100QB3pj9-7W91gvI-dRtd8-XAYZMnNQ5jia4c@z>

On 10/02/2018 02:48 PM, Daniel Díaz wrote:
> Hello!
> 
> On Fri, 7 Sep 2018@09:35, Daniel Díaz <daniel.diaz@linaro.org> wrote:
>> From: Fathi Boudra <fathi.boudra at linaro.org>
>>
>> This patch cleans up the Makefile by restructuring a couple of
>> things, namely:
>> 1) change explicit paths in targets for variables
>> 2) substitute a variable (BINARIES) for another, part of the
>>    selftests build system (TEST_PROGS_EXTENDED)
>> 3) proper cleaning up of the EXTRA objects
>>
>> The resulting Makefile is much more readable and manageable.
>>
>> Signed-off-by: Fathi Boudra <fathi.boudra at linaro.org>
>> Signed-off-by: Daniel Díaz <daniel.diaz at linaro.org>
>> ---
>>  tools/testing/selftests/gpio/Makefile | 32 +++++++++++++++-----------------
>>  1 file changed, 15 insertions(+), 17 deletions(-)
>>
>> diff --git a/tools/testing/selftests/gpio/Makefile b/tools/testing/selftests/gpio/Makefile
>> index 4665cdb..a4a01ec8 100644
>> --- a/tools/testing/selftests/gpio/Makefile
>> +++ b/tools/testing/selftests/gpio/Makefile
>> @@ -1,28 +1,26 @@
>>  # SPDX-License-Identifier: GPL-2.0
>>
>> +CFLAGS += -O2 -g -std=gnu99 -Wall -I../../../../usr/include/
>> +LDLIBS += -lmount -I/usr/include/libmount
>> +
>>  TEST_PROGS := gpio-mockup.sh
>> -TEST_FILES := gpio-mockup-sysfs.sh $(BINARIES)
>> -BINARIES := gpio-mockup-chardev
>> -EXTRA_PROGS := ../gpiogpio-event-mon ../gpiogpio-hammer ../gpiolsgpio
>> -EXTRA_DIRS := ../gpioinclude/
>> -EXTRA_OBJS := ../gpiogpio-event-mon-in.o ../gpiogpio-event-mon.o
>> -EXTRA_OBJS += ../gpiogpio-hammer-in.o ../gpiogpio-utils.o ../gpiolsgpio-in.o
>> -EXTRA_OBJS += ../gpiolsgpio.o
>> +TEST_FILES := gpio-mockup-sysfs.sh
>> +TEST_PROGS_EXTENDED := gpio-mockup-chardev
>> +
>> +GPIODIR := ../../../gpio
>> +GPIOOBJ := gpio-utils.o
>>
>>  include ../lib.mk
>>
>> -all: $(BINARIES)
>> +all: $(TEST_PROGS_EXTENDED)
>>
>>  override define CLEAN
>> -       $(RM) $(BINARIES) $(EXTRA_PROGS) $(EXTRA_OBJS)
>> -       $(RM) -r $(EXTRA_DIRS)
>> +       $(RM) $(TEST_PROGS_EXTENDED)
>> +       $(MAKE) -C $(GPIODIR) clean
>>  endef
>>
>> -CFLAGS += -O2 -g -std=gnu99 -Wall -I../../../../usr/include/
>> -LDLIBS += -lmount -I/usr/include/libmount
>> -
>> -$(BINARIES):| khdr
>> -$(BINARIES): ../../../gpio/gpio-utils.o
>> +$(TEST_PROGS_EXTENDED):| khdr
>> +$(TEST_PROGS_EXTENDED): $(GPIODIR)/$(GPIOOBJ)
>>
>> -../../../gpio/gpio-utils.o:
>> -       make ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C ../../../gpio
>> +$(GPIODIR)/$(GPIOOBJ):
>> +       $(MAKE) -C $(GPIODIR)
>> --
>> 2.7.4
> 
> Ping on this series.
> 

Thanks for the ping. I will queue these up for 4.20-rc1.

thanks,
-- Shuah
