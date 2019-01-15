From: shuah@kernel.org (shuah)
Date: Tue, 15 Jan 2019 13:46:24 -0700
Subject: [PATCH] selftests/vm/gup_benchmark.c: match gup struct to kernel
In-Reply-To: <20190115174521.GA3602@alison-desk.jf.intel.com>
References: <20181208020645.GA28467@alison-desk.jf.intel.com>
 <20190115174521.GA3602@alison-desk.jf.intel.com>
Message-ID: <ad317f98-f5de-a3bb-463b-32bb56a822fe@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190115204624._5CjRb8eh6-RV7kffwj6GTnpAo2hZekO7Hj35RPoLZU@z>

On 1/15/19 10:45 AM, Alison Schofield wrote:
> Hi Shauh,
> 
> Ping on this one. It has Kirill's ACK. Without this fix the
> gup_benchmark fails to run (at all).
> 
> Thanks!
> Alison
> 
> On Fri, Dec 07, 2018@06:06:45PM -0800, Alison Schofield wrote:
>> An expansion field was added to the kernel copy of this structure for
>> future use. See mm/gup_benchmark.c.
>>
>> Add the same expansion field here, so that the IOCTL command decodes
>> correctly. Otherwise, it fails with EINVAL.
>>
>> Signed-off-by: Alison Schofield <alison.schofield at intel.com>
> Acked-by: Kirill A. Shutemov <kirill.shutemov at linux.intel.com>
> 

Sorry for the delay and thanks for the ping. I will apply this for
linux-kselftest fixes for 5.0-rc3

thanks,
-- Shuah
