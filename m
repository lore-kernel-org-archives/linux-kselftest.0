From: kraxel at redhat.com (Gerd Hoffmann)
Date: Fri, 6 Apr 2018 11:33:07 +0200
Subject: [PATCH v2] Add udmabuf misc device
In-Reply-To: <7547e99b-0e3c-264e-e52b-40ad5d52b49a@gmail.com>
References: <20180316074650.5415-1-kraxel@redhat.com>
 <7547e99b-0e3c-264e-e52b-40ad5d52b49a@gmail.com>
Message-ID: <20180406093307.s7wkhpmddd5d4r7a@sirius.home.kraxel.org>

  Hi,

> The pages backing a DMA-buf are not allowed to move (at least not without a
> patch set I'm currently working on), but for certain MM operations to work
> correctly you must be able to modify the page tables entries and move the
> pages backing them around.
> 
> For example try to use fork() with some copy on write pages with this
> approach. You will find that you have only two options to correctly handle
> this.

The fork() issue should go away with shared memory pages (no cow).
I guess this is the reason why vgem is internally backed by shmem.

Hmm.  So I could try to limit the udmabuf driver to shmem too (i.e.
have the ioctl take a shmem filehandle and offset instead of a virtual
address).

But maybe it is better then to just extend vgem, i.e. add support to
create gem objects from existing shmem.

Comments?

cheers,
  Gerd

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
