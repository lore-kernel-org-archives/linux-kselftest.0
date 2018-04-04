From: mike.kravetz@oracle.com (Mike Kravetz)
Date: Wed, 4 Apr 2018 08:32:35 -0700
Subject: [PATCH 1/2] selftests/memfd/memfd_test.c: fix implicit declaration
In-Reply-To: <CADYN=9K-=7jOHGmUP+GT9uz7Nwcc801tam+6wf6hUjsKhGEndQ@mail.gmail.com>
References: <20180313114205.27714-1-anders.roxell@linaro.org>
 <c3341eb3-623a-b5dd-e0d1-e7b9b6650932@oracle.com>
 <CADYN=9K-=7jOHGmUP+GT9uz7Nwcc801tam+6wf6hUjsKhGEndQ@mail.gmail.com>
Message-ID: <204aed15-390c-f8eb-a248-d0f8305ab694@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180404153235.bd15a8BJ6l3c4ooPby72Q8aX_22LufY5k02F-b3zb5I@z>

On 04/04/2018 04:36 AM, Anders Roxell wrote:
> On 14 March 2018@02:09, Mike Kravetz <mike.kravetz@oracle.com> wrote:
>> On 03/13/2018 04:42 AM, Anders Roxell wrote:
>>> gcc warns about implicit declaration.
>>>
>>> gcc -D_FILE_OFFSET_BITS=64 -I../../../../include/uapi/
>>>     -I../../../../include/ -I../../../../usr/include/
>>>     memfd_test.c common.o  -o memfd_test
>>> memfd_test.c: In function ‘mfd_assert_get_seals’:
>>> memfd_test.c:74:6: warning: implicit declaration of function ‘fcntl’
>>>     [-Wimplicit-function-declaration]
>>>   r = fcntl(fd, F_GET_SEALS);
>>>       ^~~~~
>>> memfd_test.c: In function ‘mfd_assert_open’:
>>> memfd_test.c:197:6: warning: implicit declaration of function ‘open’
>>>     [-Wimplicit-function-declaration]
>>>   r = open(buf, flags, mode);
>>>       ^~~~
>>> memfd_test.c: In function ‘mfd_assert_write’:
>>> memfd_test.c:328:6: warning: implicit declaration of function ‘fallocate’
>>>     [-Wimplicit-function-declaration]
>>>   r = fallocate(fd,
>>>       ^~~~~~~~~
>>>
>>> In the current code, we include the headers that the functions want
>>> according to the man pages, and we add some defines that will be used if
>>> they isn't found in glibc.  The defines was added into the kernel source
>>> in kernel >= 3.16 and glibc requires kernel header files >= 3.2.
>>>
>>> Fixes: 4f5ce5e8d7e2 ("selftests: add memfd_create() + sealing tests")
>>> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
>>> ---
>>>  tools/testing/selftests/memfd/memfd_test.c | 25 ++++++++++++++++++++++++-
>>>  1 file changed, 24 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/tools/testing/selftests/memfd/memfd_test.c b/tools/testing/selftests/memfd/memfd_test.c
>>> index 10baa1652fc2..0dbeb29c094c 100644
>>> --- a/tools/testing/selftests/memfd/memfd_test.c
>>> +++ b/tools/testing/selftests/memfd/memfd_test.c
>>> @@ -6,7 +6,6 @@
>>>  #include <inttypes.h>
>>>  #include <limits.h>
>>>  #include <linux/falloc.h>
>>> -#include <linux/fcntl.h>
>>>  #include <linux/memfd.h>
>>>  #include <sched.h>
>>>  #include <stdio.h>
>>> @@ -14,13 +13,37 @@
>>>  #include <signal.h>
>>>  #include <string.h>
>>>  #include <sys/mman.h>
>>> +#include <sys/types.h>
>>>  #include <sys/stat.h>
>>>  #include <sys/syscall.h>
>>>  #include <sys/wait.h>
>>> +#include <fcntl.h>
>>>  #include <unistd.h>
>>
>> I suspect there is some guiding philosophy for selftests that I am
>> unfamiliar with.  However, it seems that tests should use as much
>> of the header files in the current kernel source tree as possible.
>> This change removes the include of a header in the current source
>> tree <linux/fcntl.h>.  It replaces that with the header <fcntl.h>
>> from the host system (and some other changes).
>>
>> To me, this seems like step in the wrong direction.  But, I could
>> be totally wrong and perhaps self tests should primarily target the
>> host system header files.
> 
> So in a way I agree with you. However, what was the design decisions
> internal kernel headers vs. headers from Host System ?
> For me it isn't clear how/when we use them, its a mix today is it not?

I am unsure as well.  Was hoping someone who was more involved in the
development/design philosophy of self tests would chime in and comment.

My thought that the tests should use more of the associated kernel header
files is based on the fact that those header files 'should' be more
aligned with the tests.  The host system header files could be very
different than those of the running kernel we are testing.

> To ignore warnings with -Wno-implicit-function-declaration wont be an
> alternative I think.

I am not opposed to your changes.  Again, was just hoping to discover
what should be the direction/philosophy for header file use.

-- 
Mike Kravetz
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
