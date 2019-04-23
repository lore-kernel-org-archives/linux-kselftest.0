From: shuah at kernel.org (shuah)
Date: Tue, 23 Apr 2019 16:47:37 -0600
Subject: [PATCH 1/6] selftests: Extract single-test shell logic from lib.mk
In-Reply-To: <CAGXu5jKLmX5wX1Qb0hYkn1oBhWNgJUYARoEn2JmioJUn5hiW4A@mail.gmail.com>
References: <20190409235556.3967-1-keescook@chromium.org>
 <20190409235556.3967-2-keescook@chromium.org>
 <714c1bf0-63a5-9cec-ccd6-7f3abb020574@kernel.org>
 <CAGXu5jJOG9Or_==aa0AMtv6n2=_MT_etLX7OCm22NpzT6d7W4g@mail.gmail.com>
 <6610ef83-b3e0-28b5-b976-5a5f68ca492d@kernel.org>
 <CAGXu5jKLmX5wX1Qb0hYkn1oBhWNgJUYARoEn2JmioJUn5hiW4A@mail.gmail.com>
Message-ID: <ca4605d5-9423-542e-5a10-2b681293baf9@kernel.org>

On 4/23/19 4:31 PM, Kees Cook wrote:
> On Tue, Apr 16, 2019 at 4:21 PM shuah <shuah at kernel.org> wrote:
>>
>> On 4/16/19 5:16 PM, Kees Cook wrote:
>>> On Tue, Apr 16, 2019 at 6:11 PM shuah <shuah at kernel.org> wrote:
>>>>
>>>> Hi Kees,
>>>>
>>>> Thanks for the patch.
>>>>
>>>> On 4/9/19 5:55 PM, Kees Cook wrote:
>>>>> In order to improve the reusability of the kselftest test running logic,
>>>>> this extracts the single-test logic from lib.mk into kselftest/runner.sh
>>>>> which lib.mk can call directly. No changes in output.
>>>>>
>>>>> As part of the change, this removes the unused "summary" Makefile variable
>>>>> (and tests). However, future merging with the "emit_tests" target needs
>>>>> to be able to redirect output, so a new "logfile" variable is introduced.
>>>>
>>>> Shouldn't the selftests/Makefile need update for "summary" removal??
>>>>
>>>
>>> I didn't see anything using "summary" except as a --summary argument
>>> to the run_kselftests.sh script. Maybe I missed it?
>>>
>>
>> It is in the selftests/Makefile install target.
> 
> Right: it's used only by the run_kselftest.sh script:
> 
> ALL_SCRIPT := $(INSTALL_PATH)/run_kselftest.sh
> 
> install:
> ...
>          echo "if [ \"\$$1\" = \"--summary\" ]; then" >> $(ALL_SCRIPT)
> 
> 
> So, I think this entire series can land. Is there other feedback I
> should incorporate? I'd like to see it get some -next testing...
> 
> Thanks!
> 


Kees,

Yes I was planning to get this into next and did some testing. I found
that the first patch breaks the summary option.

You can see it by running

make summary=1 TARGETS="breakpoints" kselftest

with and without your first patch. Ca you fix the regression and send
me revised patches. Sorry, I didn't get back to you sooner. A few bugs
I found kept me busy.

While I was testing your patch series, I found test build failures due
to circular dependency that needed fixing. In addition, the same
headers_install dependency, also broke O= and KBUILD_OUTPUT builds
and fixed those as well. Long story short, these fixes might conflict
with your work.

thanks,
-- Shuah
