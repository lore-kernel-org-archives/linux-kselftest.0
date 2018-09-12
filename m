From: alexey.skidanov@intel.com (Alexey Skidanov)
Date: Wed, 12 Sep 2018 22:27:03 +0300
Subject: ion selftest compilation failed
In-Reply-To: <c37cbcfb-6a1c-faa3-7f93-d1529035fe24@kernel.org>
References: <d81022fe-7fa6-2371-d6c2-057bb552d125@intel.com>
 <c37cbcfb-6a1c-faa3-7f93-d1529035fe24@kernel.org>
Message-ID: <6198d7db-a731-e9b8-6586-b401392ffd73@intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180912192703.yUd1Wjtwv_ERxipH6IAndw_5KbCXGBf3PB98eizp_ws@z>



On 09/12/2018 09:53 PM, Shuah Khan wrote:
> On 09/11/2018 11:29 AM, Alexey Skidanov wrote:
>> Hi,
>>
>> ION selftest compilation failed with the following error on my machine:
>>
>> ionmap_test.c:12:27: fatal error: linux/dma-buf.h: No such file or directory
>>
>> I have resolved it by exporting kernel headers for user space:
>>
>> make headers_install INSTALL_HDR_PATH=/usr
>>
>> Probably it should be part of the make file?
>>
>> Tthanks,
>> Alexey
>>
> 
> Hi Alexey,
> 
> Is this on the mainline or linux-next? Can you give me more details on how your
> are compiling and code base etc.

I use mainline 4.19-rc2. Compilation is done by:

cd tools/testing/selftests/android/ion
make

as it's described  in README file
> 
> thanks,
> -- Shuah
> 

Thanks,
Alexey
