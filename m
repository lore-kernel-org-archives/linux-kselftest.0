From: shuah at kernel.org (shuah)
Date: Fri, 12 Apr 2019 11:05:55 -0600
Subject: [PATCH] selftests: livepatch use TEST_PROGS for test shell scripts
In-Reply-To: <alpine.LSU.2.21.1904121535100.773@pobox.suse.cz>
References: <20190412011823.26884-1-shuah@kernel.org>
 <alpine.LSU.2.21.1904120901490.773@pobox.suse.cz>
 <8967c9aa-7eb1-7e6d-a371-f29a2be24c84@kernel.org>
 <alpine.LSU.2.21.1904121535100.773@pobox.suse.cz>
Message-ID: <ad936df6-ab14-6bff-322a-c9d34d23c1f5@kernel.org>

On 4/12/19 7:37 AM, Miroslav Benes wrote:
> On Fri, 12 Apr 2019, shuah wrote:
> 
>> On 4/12/19 1:03 AM, Miroslav Benes wrote:
>>> On Thu, 11 Apr 2019, Shuah Khan wrote:
>>>
>>>> TEST_PROGS variable is for test shell scripts and common clean target
>>>> in lib.mk doesn't touch them. TEST_GEN_PROGS are removed by it.
>>>>
>>>> Fix it to use TEST_PROGS for test shell scripts and TEST_PROGS_EXTENDED
>>>> for common functions.sh.
>>>>
>>>> Signed-off-by: Shuah Khan <shuah at kernel.org>
>>>> ---
>>>>    tools/testing/selftests/livepatch/Makefile | 3 ++-
>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/tools/testing/selftests/livepatch/Makefile
>>>> b/tools/testing/selftests/livepatch/Makefile
>>>> index af4aee79bebb..fd405402c3ff 100644
>>>> --- a/tools/testing/selftests/livepatch/Makefile
>>>> +++ b/tools/testing/selftests/livepatch/Makefile
>>>> @@ -1,6 +1,7 @@
>>>>    # SPDX-License-Identifier: GPL-2.0
>>>>    
>>>> -TEST_GEN_PROGS := \
>>>> +TEST_PROGS_EXTENDED := functions.sh
>>>> +TEST_PROGS := \
>>>>     test-livepatch.sh \
>>>>     test-callbacks.sh \
>>>>     test-shadow-vars.sh
>>>
>>> Hi Shuah,
>>>
>>> thanks for the patch. We have already something similar queued in our git
>>> tree. See
>>> https://git.kernel.org/pub/scm/linux/kernel/git/livepatching/livepatching.git/commit/?h=for-5.1/upstream-fixes&id=abfe3c4560684864f66641438fee3075de098e89
>>>
>>> It is missing TEST_PROGS_EXTENDED though. Should we add it?
>>>
>>
>> Please do. What that does is when selftests are installed, functions.h
>> gets installed as well so the the test can run from installed location.
>>
>> Did I miss reviewing the original? I maintain the framework and try to
>> catch these if patch gets sent to me.
> 
> Unfortunately you did and it was our fault. You were not CCed, no one
> noticed and we were a bit trigger happy. Sorry about that. It should not
> have happened.
> 
> Would this work for you?

Looks good to me.

> 
> -->8--
> 
>>From c158f5595286dba46f096cc7cc4bcef5ad8b6c16 Mon Sep 17 00:00:00 2001
> From: Miroslav Benes <mbenes at suse.cz>
> Date: Fri, 12 Apr 2019 15:31:42 +0200
> Subject: [PATCH] selftests/livepatch: Add functions.sh to TEST_PROGS_EXTENDED
> 
> Add functions.sh to TEST_PROGS_EXTENDED so that it is installed along
> with the rest of the selftests and they can be run.
> 
> Originally-by: Shuah Khan <shuah at kernel.org>
> Signed-off-by: Miroslav Benes <mbenes at suse.cz>
> ---
>   tools/testing/selftests/livepatch/Makefile | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/livepatch/Makefile b/tools/testing/selftests/livepatch/Makefile
> index 114f43e2081a..fd405402c3ff 100644
> --- a/tools/testing/selftests/livepatch/Makefile
> +++ b/tools/testing/selftests/livepatch/Makefile
> @@ -1,5 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0
>   
> +TEST_PROGS_EXTENDED := functions.sh
>   TEST_PROGS := \
>   	test-livepatch.sh \
>   	test-callbacks.sh \
> 

thanks,
-- Shuah
