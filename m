From: naresh.kamboju@linaro.org (Naresh Kamboju)
Date: Wed, 7 Feb 2018 23:47:16 +0530
Subject: [Linux-kselftest-mirror] [PATCH] selftests: bpf: test_kmod.sh:
 check the module path before insmod
In-Reply-To: <429eeaf2-06ba-3f50-1e3e-b0e32c60817b@iogearbox.net>
References: <1517951243-10003-1-git-send-email-naresh.kamboju@linaro.org>
 <429eeaf2-06ba-3f50-1e3e-b0e32c60817b@iogearbox.net>
Message-ID:
 <CA+G9fYvL5Hzn54DxmLbgRaprHgifpoPQoiLF4jNvzZe-=W82-g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180207181716.Yxazu9QLiKEHsW4TEedAr1iZpKAvQymWR7GqqrNUy1U@z>

Hi Daniel,

On 7 February 2018@19:02, Daniel Borkmann <daniel@iogearbox.net> wrote:
> Hi Naresh,
>
> On 02/06/2018 10:07 PM, Naresh Kamboju wrote:
>> test_kmod.sh reported false failure when module not present.
>> Check test_bpf.ko is present in the path before loading it.
>>
>> Stop using "insmod $SRC_TREE/lib/test_bpf.ko" instead use
>> "modprobe test_bpf"
>>
>> Signed-off-by: Naresh Kamboju <naresh.kamboju at linaro.org>
>
> Thanks for looking into this! Could we have a way to be able to
> support both? Say, when test_bpf.ko from SRC_TREE is not present,
> we try with modprobe -q fallback? I would still like to support
> the case where you can make local changes and add new tests to
> test_bpf.c, recompile and then just rerun the test_kmod.sh w/o
> having to install it first.

Thanks for the review comments.
I have sent patch v2 with your comments addressed.

- Naresh

>
> Thanks,
> Daniel
>
>>  tools/testing/selftests/bpf/test_kmod.sh | 11 +++++++----
>>  1 file changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/tools/testing/selftests/bpf/test_kmod.sh b/tools/testing/selftests/bpf/test_kmod.sh
>> index ed4774d..54177b1 100755
>> --- a/tools/testing/selftests/bpf/test_kmod.sh
>> +++ b/tools/testing/selftests/bpf/test_kmod.sh
>> @@ -1,8 +1,6 @@
>>  #!/bin/sh
>>  # SPDX-License-Identifier: GPL-2.0
>>
>> -SRC_TREE=../../../../
>> -
>>  test_run()
>>  {
>>       sysctl -w net.core.bpf_jit_enable=$1 2>&1 > /dev/null
>> @@ -10,8 +8,13 @@ test_run()
>>
>>       echo "[ JIT enabled:$1 hardened:$2 ]"
>>       dmesg -C
>> -     insmod $SRC_TREE/lib/test_bpf.ko 2> /dev/null
>> -     if [ $? -ne 0 ]; then
>> +     # Use modprobe dry run to check for missing test_bpf module
>> +     if ! /sbin/modprobe -q -n test_bpf; then
>> +             echo "test_bpf: [SKIP]"
>> +     elif /sbin/modprobe -q test_bpf; then
>> +             echo "test_bpf: ok"
>> +     else
>> +             echo "test_bpf: [FAIL]"
>>               rc=1
>>       fi
>>       rmmod  test_bpf 2> /dev/null
>>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
