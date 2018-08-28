From: bauerman at linux.ibm.com (Thiago Jung Bauermann)
Date: Mon, 27 Aug 2018 23:46:33 -0300
Subject: [PATCH v2 4/4] userfaultfd: selftest: Cope if shmem doesn't
 support zeropage
In-Reply-To: <20180807065642.GD20140@rapoport-lnx>
References: <20180803220046.4019-1-bauerman@linux.ibm.com>
 <20180803220046.4019-5-bauerman@linux.ibm.com>
 <20180807065642.GD20140@rapoport-lnx>
Message-ID: <87zhx7rywm.fsf@morokweng.localdomain>


Hello Mike,

Mike Rapoport <rppt at linux.vnet.ibm.com> writes:

> Hi,
>
> On Fri, Aug 03, 2018 at 07:00:46PM -0300, Thiago Jung Bauermann wrote:
>> If userfaultfd runs on a system that doesn't support UFFDIO_ZEROPAGE for
>> shared memory, it currently ends with error code 1 which indicates test
>> failure:
>>
>>   # ./userfaultfd shmem 10 10
>>   nr_pages: 160, nr_pages_per_cpu: 80
>>   bounces: 9, mode: rnd poll, unexpected missing ioctl for anon memory
>>   # echo $?
>>   1
>>
>> Change userfaultfd_zeropage_test() to return KSFT_SKIP to indicate that
>> the test is being skipped.
>
> I took a deeper look at what userfaultfd_zeropage_test() does and,
> apparently, I've mislead you. The test checks if the range has
> UFFDIO_ZEROPAGE and verifies that it works if yes; otherwise the test
> verifies that EINVAL is returned.
>
> Can you please check if the patch below works in your environment?
>
> From 7a34c84c0461b5073742275638c44b6535d19166 Mon Sep 17 00:00:00 2001
> From: Mike Rapoport <rppt at linux.vnet.ibm.com>
> Date: Tue, 7 Aug 2018 09:44:19 +0300
> Subject: [PATCH] userfaultfd: selftest: make supported range ioctl
>  verification more robust
>
> When userfaultfd tests runs on older kernel that does not support
> UFFDIO_ZEROPAGE for shared memory it fails at the ioctl verification.
>
> Split out the verification that supported ioctls are superset of the
> expected ioctls and relax the checks for UFFDIO_ZEROPAGE for shared memory
> areas.
>
> Signed-off-by: Mike Rapoport <rppt at linux.vnet.ibm.com>
> ---
>  tools/testing/selftests/vm/userfaultfd.c | 63 +++++++++++++++++---------------
>  1 file changed, 34 insertions(+), 29 deletions(-)

I'm sorry to take this long to respond, I was only able to get back to
this today.

Your patch does solve my problem. Thank you very much!

It has a trivial conflict in the second hunk with patch 3 in my series.
Should I repost the series with your patch in place of patch 4?

--
Thiago Jung Bauermann
IBM Linux Technology Center
