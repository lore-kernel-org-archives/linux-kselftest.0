From: kraxel@redhat.com (Gerd Hoffmann)
Date: Wed, 4 Jul 2018 07:53:38 +0200
Subject: [PATCH v6] Add udmabuf misc device
In-Reply-To: <20180703083757.GG7880@phenom.ffwll.local>
References: <20180703075359.30349-1-kraxel@redhat.com>
 <20180703083757.GG7880@phenom.ffwll.local>
Message-ID: <20180704055338.n3b7oexltaejqmcd@sirius.home.kraxel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180704055338.Nw9PyHImyqLR-ZvRP0ZmpXN84FpxbIN57ftDpvRsI_Y@z>

On Tue, Jul 03, 2018@10:37:57AM +0200, Daniel Vetter wrote:
> On Tue, Jul 03, 2018@09:53:58AM +0200, Gerd Hoffmann wrote:
> > A driver to let userspace turn memfd regions into dma-bufs.
> > 
> > Use case:  Allows qemu create dmabufs for the vga framebuffer or
> > virtio-gpu ressources.  Then they can be passed around to display
> > those guest things on the host.  To spice client for classic full
> > framebuffer display, and hopefully some day to wayland server for
> > seamless guest window display.
> > 
> > qemu test branch:
> >   https://git.kraxel.org/cgit/qemu/log/?h=sirius/udmabuf
> > 
> > Cc: David Airlie <airlied at linux.ie>
> > Cc: Tomeu Vizoso <tomeu.vizoso at collabora.com>
> > Cc: Laurent Pinchart <laurent.pinchart at ideasonboard.com>
> > Cc: Daniel Vetter <daniel at ffwll.ch>
> > Signed-off-by: Gerd Hoffmann <kraxel at redhat.com>
> 
> I think some ack for a 2nd use-case, like virtio-wl or whatever would be
> really cool. To give us some assurance that this is generically useful.

Tomeu?  Laurent?

> Plus an ack from dma-buf folks (nag them on irc, you don't have them on Cc
> here).

Hmm, does MAINTAINERS need an update then?  Maintainer and mailing lists
listed in the "DMA BUFFER SHARING FRAMEWORK" entry are on Cc.

Who should be Cc'ed?

> Then this is imo good to go.
> 
> I assume you'll push it to drm-misc, like all the other dma-buf stuff?

Can do that, sure, after collecting the acks ...

thanks,
  Gerd

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
