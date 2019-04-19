From: mathieu.desnoyers at efficios.com (Mathieu Desnoyers)
Date: Fri, 19 Apr 2019 08:55:07 -0400 (EDT)
Subject: [PATCH for 5.1 3/3] rseq/selftests: Adapt number of threads to
 the number of detected cpus
In-Reply-To: <1444419838.71.1555677682502.JavaMail.zimbra@efficios.com>
References: <20190305194755.2602-1-mathieu.desnoyers@efficios.com>
 <20190305194755.2602-4-mathieu.desnoyers@efficios.com>
 <20190419103847.GA111210@gmail.com>
 <1444419838.71.1555677682502.JavaMail.zimbra@efficios.com>
Message-ID: <1266612341.87.1555678507226.JavaMail.zimbra@efficios.com>

----- On Apr 19, 2019, at 8:41 AM, Mathieu Desnoyers mathieu.desnoyers at efficios.com wrote:

> ----- On Apr 19, 2019, at 6:38 AM, Ingo Molnar mingo at kernel.org wrote:
> 
>> * Mathieu Desnoyers <mathieu.desnoyers at efficios.com> wrote:
>> 
>>> On smaller systems, running a test with 200 threads can take a long
>>> time on machines with smaller number of CPUs.
>>> 
>>> Detect the number of online cpus at test runtime, and multiply that
>>> by 6 to have 6 rseq threads per cpu preempting each other.
>>> 
>>> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers at efficios.com>
>>> Cc: Shuah Khan <shuah at kernel.org>
>>> Cc: Thomas Gleixner <tglx at linutronix.de>
>>> Cc: Joel Fernandes <joelaf at google.com>
>>> Cc: Peter Zijlstra <peterz at infradead.org>
>>> Cc: Catalin Marinas <catalin.marinas at arm.com>
>>> Cc: Dave Watson <davejwatson at fb.com>
>>> Cc: Will Deacon <will.deacon at arm.com>
>>> Cc: Andi Kleen <andi at firstfloor.org>
>>> Cc: linux-kselftest at vger.kernel.org
>>> Cc: "H . Peter Anvin" <hpa at zytor.com>
>>> Cc: Chris Lameter <cl at linux.com>
>>> Cc: Russell King <linux at arm.linux.org.uk>
>>> Cc: Michael Kerrisk <mtk.manpages at gmail.com>
>>> Cc: "Paul E . McKenney" <paulmck at linux.vnet.ibm.com>
>>> Cc: Paul Turner <pjt at google.com>
>>> Cc: Boqun Feng <boqun.feng at gmail.com>
>>> Cc: Josh Triplett <josh at joshtriplett.org>
>>> Cc: Steven Rostedt <rostedt at goodmis.org>
>>> Cc: Ben Maurer <bmaurer at fb.com>
>>> Cc: Andy Lutomirski <luto at amacapital.net>
>>> Cc: Andrew Morton <akpm at linux-foundation.org>
>>> Cc: Linus Torvalds <torvalds at linux-foundation.org>
>>> ---
>>>  tools/testing/selftests/rseq/run_param_test.sh | 7 +++++--
>>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>> 
>>> diff --git a/tools/testing/selftests/rseq/run_param_test.sh
>>> b/tools/testing/selftests/rseq/run_param_test.sh
>>> index 3acd6d75ff9f..e426304fd4a0 100755
>>> --- a/tools/testing/selftests/rseq/run_param_test.sh
>>> +++ b/tools/testing/selftests/rseq/run_param_test.sh
>>> @@ -1,6 +1,8 @@
>>>  #!/bin/bash
>>>  # SPDX-License-Identifier: GPL-2.0+ or MIT
>>>  
>>> +NR_CPUS=`grep '^processor' /proc/cpuinfo | wc -l`
>>> +
>>>  EXTRA_ARGS=${@}
>>>  
>>>  OLDIFS="$IFS"
>>> @@ -28,15 +30,16 @@ IFS="$OLDIFS"
>>>  
>>>  REPS=1000
>>>  SLOW_REPS=100
>>> +NR_THREADS=$((6*${NR_CPUS}))
>>>  
>>>  function do_tests()
>>>  {
>>>  	local i=0
>>>  	while [ "$i" -lt "${#TEST_LIST[@]}" ]; do
>>>  		echo "Running test ${TEST_NAME[$i]}"
>>> -		./param_test ${TEST_LIST[$i]} -r ${REPS} ${@} ${EXTRA_ARGS} || exit 1
>>> +		./param_test ${TEST_LIST[$i]} -r ${REPS} -t ${NR_THREADS} ${@} ${EXTRA_ARGS}
>>> || exit 1
>>>  		echo "Running compare-twice test ${TEST_NAME[$i]}"
>>> -		./param_test_compare_twice ${TEST_LIST[$i]} -r ${REPS} ${@} ${EXTRA_ARGS} ||
>>> exit 1
>>> +		./param_test_compare_twice ${TEST_LIST[$i]} -r ${REPS} -t ${NR_THREADS} ${@}
>>> ${EXTRA_ARGS} || exit 1
>>>  		let "i++"
>>>  	done
>>>  }
>> 
>> BTW., when trying to build the rseq self-tests I get this build failure:
>> 
>>  dagon:~/tip/tools/testing/selftests/rseq> make
>>  gcc -O2 -Wall -g -I./ -I../../../../usr/include/ -L./ -Wl,-rpath=./ -shared
>>  -fPIC rseq.c -lpthread -o
>>  /home/mingo/tip/tools/testing/selftests/rseq/librseq.so
>>  gcc -O2 -Wall -g -I./ -I../../../../usr/include/ -L./ -Wl,-rpath=./ basic_test.c
>>  -lpthread -lrseq -o /home/mingo/tip/tools/testing/selftests/rseq/basic_test
>>  gcc -O2 -Wall -g -I./ -I../../../../usr/include/ -L./ -Wl,-rpath=./
>>  basic_percpu_ops_test.c -lpthread -lrseq -o
>>  /home/mingo/tip/tools/testing/selftests/rseq/basic_percpu_ops_test
>>  /usr/bin/ld: /tmp/ccuHTWnZ.o: in function `rseq_cmpeqv_storev':
>>  /home/mingo/tip/tools/testing/selftests/rseq/./rseq-x86.h:84: undefined
>>  reference to `.L8'
>>  /usr/bin/ld: /home/mingo/tip/tools/testing/selftests/rseq/./rseq-x86.h:84:
>>  undefined reference to `.L49'
>>  /usr/bin/ld: /tmp/ccuHTWnZ.o: in function `rseq_cmpnev_storeoffp_load':
>>  /home/mingo/tip/tools/testing/selftests/rseq/./rseq-x86.h:141: undefined
>>  reference to `.L57'
>>  /usr/bin/ld: /tmp/ccuHTWnZ.o:(__rseq_failure+0x8): undefined reference to `.L8'
>>  /usr/bin/ld: /tmp/ccuHTWnZ.o:(__rseq_failure+0x14): undefined reference to
>>  `.L49'
>>  /usr/bin/ld: /tmp/ccuHTWnZ.o:(__rseq_failure+0x20): undefined reference to
>>  `.L55'
>>  collect2: error: ld returned 1 exit status
>>  make: *** [Makefile:22:
>>  /home/mingo/tip/tools/testing/selftests/rseq/basic_percpu_ops_test] Error 1
>> 
>> Is this a known problem, or do I miss something from my build environment
>> perhaps? Vanilla 64-bit Ubuntu 18.10 (Cosmic).
> 
> It works fine with gcc-7 (gcc version 7.3.0 (Ubuntu 7.3.0-16ubuntu3))
> but indeed I get the same failure with gcc-8 (gcc version 8.0.1 20180414
> (experimental) [trunk revision 259383] (Ubuntu 8-20180414-1ubuntu2)).
> 
> Thanks for reporting! I will investigate.

It looks like gcc-8 optimize away the target of asm goto labels when
there are more than one of them on x86-64. I'll try to come up with
a simpler reproducer.

Thanks,

Mathieu


-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
