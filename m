From: labbott@redhat.com (Laura Abbott)
Date: Wed, 12 Sep 2018 13:50:57 -0700
Subject: ion selftest compilation failed
In-Reply-To: <6198d7db-a731-e9b8-6586-b401392ffd73@intel.com>
References: <d81022fe-7fa6-2371-d6c2-057bb552d125@intel.com>
 <c37cbcfb-6a1c-faa3-7f93-d1529035fe24@kernel.org>
 <6198d7db-a731-e9b8-6586-b401392ffd73@intel.com>
Message-ID: <19a20392-a002-82d1-b966-346091de950d@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180912205057.1QAWkQGski7AtiYOU4mELxuI3EedCeKreIDe3xL-Xs4@z>

On 09/12/2018 12:27 PM, Alexey Skidanov wrote:
> 
> 
> On 09/12/2018 09:53 PM, Shuah Khan wrote:
>> On 09/11/2018 11:29 AM, Alexey Skidanov wrote:
>>> Hi,
>>>
>>> ION selftest compilation failed with the following error on my machine:
>>>
>>> ionmap_test.c:12:27: fatal error: linux/dma-buf.h: No such file or directory
>>>
>>> I have resolved it by exporting kernel headers for user space:
>>>
>>> make headers_install INSTALL_HDR_PATH=/usr
>>>
>>> Probably it should be part of the make file?
>>>
>>> Tthanks,
>>> Alexey
>>>
>>
>> Hi Alexey,
>>
>> Is this on the mainline or linux-next? Can you give me more details on how your
>> are compiling and code base etc.
> 
> I use mainline 4.19-rc2. Compilation is done by:
> 
> cd tools/testing/selftests/android/ion
> make
> 
> as it's described  in README file

So the test already does

INCLUDEDIR := -I. -I../../../../../drivers/staging/android/uapi/ -I../../../../../usr/include/

which should pick up the headers from the root of the kernel directory.
I don't know exactly how those get generated though.

>>
>> thanks,
>> -- Shuah
>>
> 
> Thanks,
> Alexey
> 
