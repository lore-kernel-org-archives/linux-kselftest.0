From: tomeu.vizoso@collabora.com (Tomeu Vizoso)
Date: Wed, 4 Jul 2018 09:26:39 +0200
Subject: [PATCH v6] Add udmabuf misc device
In-Reply-To: <20180704055338.n3b7oexltaejqmcd@sirius.home.kraxel.org>
References: <20180703075359.30349-1-kraxel@redhat.com>
 <20180703083757.GG7880@phenom.ffwll.local>
 <20180704055338.n3b7oexltaejqmcd@sirius.home.kraxel.org>
Message-ID: <9818b301-9c9d-c703-d4fe-7c2d4d43ed66@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180704072639.yarZDd4bH_TioXh9tI0LKR1PG0btsSF3GcQ4BtH9Mpw@z>

On 07/04/2018 07:53 AM, Gerd Hoffmann wrote:
> On Tue, Jul 03, 2018@10:37:57AM +0200, Daniel Vetter wrote:
>> On Tue, Jul 03, 2018@09:53:58AM +0200, Gerd Hoffmann wrote:
>>> A driver to let userspace turn memfd regions into dma-bufs.
>>>
>>> Use case:  Allows qemu create dmabufs for the vga framebuffer or
>>> virtio-gpu ressources.  Then they can be passed around to display
>>> those guest things on the host.  To spice client for classic full
>>> framebuffer display, and hopefully some day to wayland server for
>>> seamless guest window display.
>>>
>>> qemu test branch:
>>>    https://git.kraxel.org/cgit/qemu/log/?h=sirius/udmabuf
>>>
>>> Cc: David Airlie <airlied at linux.ie>
>>> Cc: Tomeu Vizoso <tomeu.vizoso at collabora.com>
>>> Cc: Laurent Pinchart <laurent.pinchart at ideasonboard.com>
>>> Cc: Daniel Vetter <daniel at ffwll.ch>
>>> Signed-off-by: Gerd Hoffmann <kraxel at redhat.com>
>>
>> I think some ack for a 2nd use-case, like virtio-wl or whatever would be
>> really cool. To give us some assurance that this is generically useful.
> 
> Tomeu?  Laurent?

Sorry, but I think I will need some help to understand how this could 
help in the virtio-wl case [adding Zach Reizner to CC].

Any graphics buffers that are allocated with memfd will be shared with 
the compositor via wl_shm, without need for dmabufs.

Daniel Stone [added to CC] commented though that this could be useful for 
browsers that composite pages with a nested Wayland compositor, to avoid 
having to blit each layer so that the EGL platform notifies the 
compositor of new contents.

Cheers,

Tomeu

>> Plus an ack from dma-buf folks (nag them on irc, you don't have them on Cc
>> here).
> 
> Hmm, does MAINTAINERS need an update then?  Maintainer and mailing lists
> listed in the "DMA BUFFER SHARING FRAMEWORK" entry are on Cc.
> 
> Who should be Cc'ed?
> 
>> Then this is imo good to go.
>>
>> I assume you'll push it to drm-misc, like all the other dma-buf stuff?
> 
> Can do that, sure, after collecting the acks ...
> 
> thanks,
>    Gerd
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
