From: alexey.skidanov@intel.com (Alexey Skidanov)
Date: Fri, 14 Sep 2018 22:53:08 +0300
Subject: [PATCH] Fix compilation error
In-Reply-To: <CAEUSe796puVCHcxNO35Wb1jD6YutXyzU35ofP1Tp-XTLu-TBLQ@mail.gmail.com>
References: <1536918418-5016-1-git-send-email-alexey.skidanov@intel.com>
 <2108af5b-7877-5675-50d9-cbda82eed48d@redhat.com>
 <CAEUSe796puVCHcxNO35Wb1jD6YutXyzU35ofP1Tp-XTLu-TBLQ@mail.gmail.com>
Message-ID: <c0963b7b-9a70-2c03-c8f3-0aa34fec62f6@intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180914195308.9_7XwW7Dfm9SRX0L0lOX62roCNnsmBAeb-qRQrdGO60@z>



On 09/14/2018 10:02 PM, Daniel Díaz wrote:
> Hello!
> 
> On Fri, 14 Sep 2018@13:30, Laura Abbott <labbott@redhat.com> wrote:
>>
>> On 09/14/2018 02:46 AM, Alexey Skidanov wrote:
>>> ionmap_test compilation failed because there is no dma_buf.h on any of
>>> include paths. Moreover, it's better to use the dma_buf.h file of
>>> kernel under test and not the currently running one.
>>>
>>> To fix this, add new target to the Makefile, installing Kernel headers
>>> for user space and direct compiler to look for dma_buf.h file there.
>>>
>>
>> This is what gpio has:
>>
>> ../../../../usr/include/linux/gpio.h:
>>          make -C ../../../.. headers_install INSTALL_HDR_PATH=$(shell pwd)/../../../../usr/
>>
>> I'd like to be consistent with other selftests. Shuah, what's
>> your opinion on the best way to get the headers?
> 
> Please consider Anders' patch, which is already in Shuah's next branch:
>   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/commit/?h=next&id=b2d35fa5fc80c27e868e393dcab4c94a0d71737f
> 
> Greetings!
> 
> Daniel Díaz
> daniel.diaz at linaro.org
> 
> 

Looks like the issue is already resolved :)
>> Thanks,
>> Laura
>>
>>> Signed-off-by: Alexey Skidanov <alexey.skidanov at intel.com>
>>> ---
>>>   tools/testing/selftests/android/ion/Makefile | 8 ++++++--
>>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/tools/testing/selftests/android/ion/Makefile b/tools/testing/selftests/android/ion/Makefile
>>> index e036952..a4aac0e 100644
>>> --- a/tools/testing/selftests/android/ion/Makefile
>>> +++ b/tools/testing/selftests/android/ion/Makefile
>>> @@ -1,10 +1,14 @@
>>>
>>> -INCLUDEDIR := -I. -I../../../../../drivers/staging/android/uapi/ -I../../../../../usr/include/
>>> +INCLUDEDIR := -I. -I../../../../../drivers/staging/android/uapi/ -I../../../../../uapi/include
>>>   CFLAGS := $(CFLAGS) $(INCLUDEDIR) -Wall -O2 -g
>>>
>>>   TEST_GEN_FILES := ionapp_export ionapp_import ionmap_test
>>>
>>> -all: $(TEST_GEN_FILES)
>>> +all: usr_headers $(TEST_GEN_FILES)
>>> +
>>> +usr_headers:
>>> +     cd ../../../../../
>>> +     make headers_install INSTALL_HDR_PATH=./uapi
>>>
>>>   $(TEST_GEN_FILES): ipcsocket.c ionutils.c
>>>
>>>
>>
