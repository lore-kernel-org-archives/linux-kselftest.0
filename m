From: bauerman@linux.ibm.com (Thiago Jung Bauermann)
Date: Mon, 30 Jul 2018 20:53:30 -0300
Subject: [PATCH 1/3] userfaultfd: selftest: Fix checking of
 userfaultfd_open() result
In-Reply-To: <20180725135942.GC25188@rapoport-lnx>
References: <20180725024209.32586-1-bauerman@linux.ibm.com>
 <20180725024209.32586-2-bauerman@linux.ibm.com>
 <20180725135942.GC25188@rapoport-lnx>
Message-ID: <8736w0b7r9.fsf@morokweng.localdomain>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180730235330.p57OvbgdY_1ThKz2CgF0zGtdOzS09shKg9j9GHwwAWo@z>


Hello Mike,

Thanks for promptly reviewing the patches.

Mike Rapoport <rppt at linux.vnet.ibm.com> writes:

> Hi,
>
> On Tue, Jul 24, 2018@11:42:07PM -0300, Thiago Jung Bauermann wrote:
>> If the userfaultfd test is run on a kernel with CONFIG_USERFAULTFD=n, it
>> will report that the system call is not available yet go ahead and continue
>> anyway:
>>
>>   # ./userfaultfd anon 30 1
>>   nr_pages: 480, nr_pages_per_cpu: 120
>>   userfaultfd syscall not available in this kernel
>>   bounces: 0, mode:, register failure
>>
>> This is because userfaultfd_open() returns 0 on success and 1 on error but
>> all callers assume that it returns < 0 on error.
>>
>> Since the convention of the test as a whole is the one used by
>> userfault_open(), fix its callers instead. Now the test behaves correctly:
>>
>>   # ./userfaultfd anon 30 1
>>   nr_pages: 480, nr_pages_per_cpu: 120
>>   userfaultfd syscall not available in this kernel
>>
>> Signed-off-by: Thiago Jung Bauermann <bauerman at linux.ibm.com>
>
> It seems that this patch is superseded by the second patch in this series.

Yes, but since this is a simple bugfix while the other patch is a
proposed improvement which can be debated, I think it's worthwhile to
keep them separate.

--
Thiago Jung Bauermann
IBM Linux Technology Center

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
