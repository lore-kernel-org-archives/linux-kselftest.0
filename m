From: christian.koenig at amd.com (=?UTF-8?Q?Christian_K=c3=b6nig?=)
Date: Fri, 6 Apr 2018 14:24:46 +0200
Subject: [PATCH v2] Add udmabuf misc device
In-Reply-To: <20180406093307.s7wkhpmddd5d4r7a@sirius.home.kraxel.org>
References: <20180316074650.5415-1-kraxel@redhat.com>
 <7547e99b-0e3c-264e-e52b-40ad5d52b49a@gmail.com>
 <20180406093307.s7wkhpmddd5d4r7a@sirius.home.kraxel.org>
Message-ID: <5d88baad-a956-6bd5-e0d6-aabae6647f3e@amd.com>

Am 06.04.2018 um 11:33 schrieb Gerd Hoffmann:
>    Hi,
>
>> The pages backing a DMA-buf are not allowed to move (at least not without a
>> patch set I'm currently working on), but for certain MM operations to work
>> correctly you must be able to modify the page tables entries and move the
>> pages backing them around.
>>
>> For example try to use fork() with some copy on write pages with this
>> approach. You will find that you have only two options to correctly handle
>> this.
> The fork() issue should go away with shared memory pages (no cow).
> I guess this is the reason why vgem is internally backed by shmem.

Yes, exactly that is also an approach which should work fine. Just don't 
try to get this working with get_user_pages().

>
> Hmm.  So I could try to limit the udmabuf driver to shmem too (i.e.
> have the ioctl take a shmem filehandle and offset instead of a virtual
> address).
>
> But maybe it is better then to just extend vgem, i.e. add support to
> create gem objects from existing shmem.
>
> Comments?

Yes, extending vgem instead of creating something new sounds like a good 
idea to me as well.

Regards,
Christian.

>
> cheers,
>    Gerd
>

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
