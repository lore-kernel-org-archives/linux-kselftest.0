From: lei.yang at windriver.com (lei yang)
Date: Wed, 8 Nov 2017 15:55:02 +0800
Subject: [Linux-kselftest-mirror] [PATCH] selftests: futex: fix
	compilation error
In-Reply-To: <3605f466-52f7-fdac-0d08-01361648b801@osg.samsung.com>
References: <1509941009-11521-1-git-send-email-Lei.Yang@windriver.com>
 <6b0b866a-b142-8c07-41e3-d561d4b91fb3@osg.samsung.com>
 <d83134db-ad68-cfa0-42ef-1db070b2c931@osg.samsung.com>
 <af4b1c56-4056-96dd-a4ef-825157c56361@windriver.com>
 <3605f466-52f7-fdac-0d08-01361648b801@osg.samsung.com>
Message-ID: <f8400076-9971-8108-1d0d-25280a7025d3@windriver.com>



On 2017年11月08日 06:57, Shuah Khan wrote:
> On 11/06/2017 06:18 PM, lei yang wrote:
>>
>> On 2017年11月07日 07:48, Shuah Khan wrote:
>>> On 11/06/2017 04:45 PM, Shuah Khan wrote:
>>>> On 11/05/2017 09:03 PM, Lei Yang wrote:
>>>>> I run into below error when building futext
>>>>> /bin/sh: -c: line 5: syntax error: unexpected end of file
>>>>>
>>>>> the closing ";" and "\" are necessary.
>>>>> My OS is "Ubuntu 14.04.5 LTS"
>>>>>
>>>>> Signed-off-by: Lei Yang <Lei.Yang at windriver.com>
>>>>> ---
>>>>>    tools/testing/selftests/futex/Makefile | 6 +++---
>>>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/tools/testing/selftests/futex/Makefile b/tools/testing/selftests/futex/Makefile
>>>>> index f0c0369..943f3a2 100644
>>>>> --- a/tools/testing/selftests/futex/Makefile
>>>>> +++ b/tools/testing/selftests/futex/Makefile
>>>>> @@ -11,9 +11,9 @@ all:
>>>>>            BUILD_TARGET=$(OUTPUT)/$$DIR;    \
>>>>>            mkdir $$BUILD_TARGET  -p;    \
>>>>>            make OUTPUT=$$BUILD_TARGET -C $$DIR $@;\
>>>>> -        if [ -e $$DIR/$(TEST_PROGS) ]; then
>>>>> -            rsync -a $$DIR/$(TEST_PROGS) $$BUILD_TARGET/;
>>>>> -        fi
>>>>> +        if [ -e $$DIR/$(TEST_PROGS) ]; then \
>>>>> +            rsync -a $$DIR/$(TEST_PROGS) $$BUILD_TARGET/; \
>>>>> +        fi \
>>>>>        done
>>>>>      override define RUN_TESTS
>>>>>
>>>> Hmm. I don't see this error on linux_4.14-rc8?
>>>>
>>>> Can you give more details on the gcc version you are using?
>>> I meant gnumake version? I am not seeing the failure with what I am
>>> using
>> $ make -v
>> GNU Make 3.81
>> Copyright (C) 2006  Free Software Foundation, Inc.
>> This is free software; see the source for copying conditions.
>> There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
>> PARTICULAR PURPOSE.
>>
>> This program built for x86_64-pc-linux-gnu
>>
>>
>> Lei
>>
> I can't take patches that aren't tested on the latest kernel release.
> 3.16 is very old. I am not going reply to other patches you sent.
>
> Please make sure the patches are based on the latest release and tested
> on it as well.

this error only happens when use old version "make", it has nothing to 
do with the new or old kernel.

so the question is  do we need to be compatible with old "make" ?

Lei



>
> thanks,
> -- Shuah
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
> the body of a message to majordomo at vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
