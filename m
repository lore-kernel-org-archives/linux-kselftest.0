From: shuah@kernel.org (Shuah Khan)
Date: Wed, 21 Mar 2018 10:52:17 -0600
Subject: [PATCH] selftests/android/ion: Makefile: fix build error
In-Reply-To: <CADYN=9LcM1N3xSEMq_AgF7=JmC-ZPif2=J2mY9X_yqg1gHMb7Q@mail.gmail.com>
References: <20180308143741.4415-1-anders.roxell@linaro.org>
 <9e41eb91-8bac-0bf0-987d-8d95c0bfce94@redhat.com>
 <CADYN=9LcM1N3xSEMq_AgF7=JmC-ZPif2=J2mY9X_yqg1gHMb7Q@mail.gmail.com>
Message-ID: <2cf8f691-0951-57bb-6670-53d762946d9d@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180321165217.Kx-yOlwXvh_1F3Mjw-f7qxnnDwasLHtuysvnalvYqCM@z>

On 03/08/2018 04:30 PM, Anders Roxell wrote:
> On 8 March 2018@20:32, Laura Abbott <labbott@redhat.com> wrote:
>> On 03/08/2018 06:37 AM, Anders Roxell wrote:
>>>
>>> Fails to build iomap_test.c due to missing include
>>>
>>> gcc  -I. -I../../../../../drivers/staging/android/uapi/ -Wall -O2 -g
>>> ionmap_test.c ipcsocket.c ionutils.c   -o ionmap_test
>>> ionmap_test.c:12:27: fatal error: linux/dma-buf.h: No such file or
>>> directory
>>>   #include <linux/dma-buf.h>
>>>                             ^
>>> compilation terminated.
>>> <builtin>: recipe for target 'ionmap_test' failed
>>> make[2]: *** [ionmap_test] Error 1
>>>
>>> In the current code, we add a new -I ../../../../../usr/include/ to the
>>> INCLUDEDIR variable. Also add ionmap_test to the .gitignore file.
>>>> Fixes: ac93f7046a53 ("selftests: ion: Add simple test with the vgem
>>>> driver")
>>
>>
>> Where is this hash from?
> 
> In linux-next.
> 
>> It's not in Linus' master branch.
>> Are the /usr/include header properly sanitized
> 
> That my understanding but please correct me if I'm wrong.
> 
> Cheers,
> Anders
> 
>> , if so that's nice
>> because there's been debates before about how best to pick up
>> the sanitized headers. I see that used several other places
>> around self-tests too. Anyway, you can add
>>
>> Acked-by: Laura Abbott <labbott at redhat.com>
>>

Thanks. Applied to linux-kselftest next for 4.17-rc1

-- Shuah

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
