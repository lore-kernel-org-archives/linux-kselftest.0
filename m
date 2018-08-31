From: kraxel at redhat.com (Gerd Hoffmann)
Date: Fri, 31 Aug 2018 09:04:24 +0200
Subject: [PATCH v6] Add udmabuf misc device
In-Reply-To: <06d8aa8d-5eac-64e2-f21e-43fe7ca96cc2@collabora.com>
References: <20180703075359.30349-1-kraxel@redhat.com>
 <20180703083757.GG7880@phenom.ffwll.local>
 <20180704055338.n3b7oexltaejqmcd@sirius.home.kraxel.org>
 <9818b301-9c9d-c703-d4fe-7c2d4d43ed66@collabora.com>
 <20180704080005.juutrwri4kxm7yim@sirius.home.kraxel.org>
 <06d8aa8d-5eac-64e2-f21e-43fe7ca96cc2@collabora.com>
Message-ID: <20180831070424.3xoxfy54vyxbdfzd@sirius.home.kraxel.org>

  Hi,

> > qemu can use memfd to allocate guest ram.  Now, with the help of
> > udmabuf, qemu can create a *host* dma-buf for the *guest* graphics
> > buffer.
> 
> Guess each physical address in the iovec in
> VIRTIO_GPU_CMD_RESOURCE_ATTACH_BACKING can be passed as the offset in the
> udmabuf_create_item struct?

Exactly.

https://git.kraxel.org/cgit/qemu/commit/?h=sirius/udmabuf&id=515a5b9f1215ea668a992e39d66993a17a940801

> Are you thinking of anything else besides passing the winsrv protocol across
> the guest/host boundary? Just wondering if I'm missing something.

The patch above uses the dmabuf internally in qemu.  It simply mmaps it,
so qemu has a linear representation of the resource and can use it as
pixman image backing storage without copying the pixel data.

So it is useful even without actually exporting the dmabuf to other
processes.

cheers,
  Gerd

PS: Any chance you can review the v7 patch?
