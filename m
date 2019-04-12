From: shuah@kernel.org (shuah)
Date: Fri, 12 Apr 2019 13:06:21 -0600
Subject: [PATCH] selftests: livepatch use TEST_PROGS for test shell scripts
In-Reply-To: <6f97800f-e78f-7d16-32b2-96ee5260321c@redhat.com>
References: <20190412011823.26884-1-shuah@kernel.org>
 <alpine.LSU.2.21.1904120901490.773@pobox.suse.cz>
 <8967c9aa-7eb1-7e6d-a371-f29a2be24c84@kernel.org>
 <alpine.LSU.2.21.1904121535100.773@pobox.suse.cz>
 <ad936df6-ab14-6bff-322a-c9d34d23c1f5@kernel.org>
 <6f97800f-e78f-7d16-32b2-96ee5260321c@redhat.com>
Message-ID: <1e07dae8-6699-6b72-1508-2b6b89d3d92d@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190412190621.iOJJZzs44FF_-A3K3IeervEATLX2JpYez4htj1FjO4A@z>

On 4/12/19 12:51 PM, Joe Lawrence wrote:
> On 4/12/19 1:05 PM, shuah wrote:
>> On 4/12/19 7:37 AM, Miroslav Benes wrote:
>>> On Fri, 12 Apr 2019, shuah wrote:
>>>
>>>> On 4/12/19 1:03 AM, Miroslav Benes wrote:
>>>>> On Thu, 11 Apr 2019, Shuah Khan wrote:
>>>>>
>>>>>> TEST_PROGS variable is for test shell scripts and common clean target
>>>>>> in lib.mk doesn't touch them. TEST_GEN_PROGS are removed by it.
>>>>>>
>>>>>> Fix it to use TEST_PROGS for test shell scripts and 
>>>>>> TEST_PROGS_EXTENDED
>>>>>> for common functions.sh.
>>>>>>
>>>>>> Signed-off-by: Shuah Khan <shuah at kernel.org>
>>>>>> ---
>>>>>>     tools/testing/selftests/livepatch/Makefile | 3 ++-
>>>>>>     1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/tools/testing/selftests/livepatch/Makefile
>>>>>> b/tools/testing/selftests/livepatch/Makefile
>>>>>> index af4aee79bebb..fd405402c3ff 100644
>>>>>> --- a/tools/testing/selftests/livepatch/Makefile
>>>>>> +++ b/tools/testing/selftests/livepatch/Makefile
>>>>>> @@ -1,6 +1,7 @@
>>>>>>     # SPDX-License-Identifier: GPL-2.0
>>>>>> -TEST_GEN_PROGS := \
>>>>>> +TEST_PROGS_EXTENDED := functions.sh
>>>>>> +TEST_PROGS := \
>>>>>>      test-livepatch.sh \
>>>>>>      test-callbacks.sh \
>>>>>>      test-shadow-vars.sh
>>>>>
>>>>> Hi Shuah,
>>>>>
>>>>> thanks for the patch. We have already something similar queued in 
>>>>> our git
>>>>> tree. See
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/livepatching/livepatching.git/commit/?h=for-5.1/upstream-fixes&id=abfe3c4560684864f66641438fee3075de098e89 
>>>>>
>>>>>
>>>>> It is missing TEST_PROGS_EXTENDED though. Should we add it?
>>>>>
>>>>
>>>> Please do. What that does is when selftests are installed, functions.h
>>>> gets installed as well so the the test can run from installed location.
>>>>
>>>> Did I miss reviewing the original? I maintain the framework and try to
>>>> catch these if patch gets sent to me.
>>>
>>> Unfortunately you did and it was our fault. You were not CCed, no one
>>> noticed and we were a bit trigger happy. Sorry about that. It should not
>>> have happened.
>>>
>>> Would this work for you?
>>
>> Looks good to me.
>>
> 
> Hi Shuah,
> 
> Thanks for spotting this and apologies for missing your CC on my earlier 
> patch post.  For future reference, do you prefer a direct CC, 
> linux-kselftest, or both?

No worries. Happy to report the problem. Couldn't have missed it with
all the deleted lines showing up whenever I ran diff on my changes. :)

Direct to or cc to me and cc linux-kselftest list is preferred Same as
any other patch really, everybody getmaintainer.pl recommends.

thanks,
-- Shuah
