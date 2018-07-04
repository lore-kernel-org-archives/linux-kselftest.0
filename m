From: kraxel@redhat.com (Gerd Hoffmann)
Date: Wed, 4 Jul 2018 10:58:25 +0200
Subject: [PATCH v6] Add udmabuf misc device
In-Reply-To: <20180704080807.GH3891@phenom.ffwll.local>
References: <20180703075359.30349-1-kraxel@redhat.com>
 <20180703083757.GG7880@phenom.ffwll.local>
 <20180704055338.n3b7oexltaejqmcd@sirius.home.kraxel.org>
 <20180704080807.GH3891@phenom.ffwll.local>
Message-ID: <20180704085825.nfkv5i7ultaavjve@sirius.home.kraxel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180704085825.iOYb_9u5RE-HHLlVE05SukRHq6aP8V2394U2n5S4XDY@z>

  Hi,

> > Hmm, does MAINTAINERS need an update then?  Maintainer and mailing lists
> > listed in the "DMA BUFFER SHARING FRAMEWORK" entry are on Cc.
> 
> Yeah, maintainers entry with you as maintainer plus dri-devel as mailing
> list plus drm-misc as repo would be good. Just grep for drm-misc.git for
> tons of examples.

There is an *existing* entry covering drivers/dma-buf/, and I've dropped
udmabuf.c into that directory, so I've assumed get_maintainers.pl picks
up all relevant dma-buf folks ...

Covering udmabuf.c maintainance is a different issue.  I could just add
myself to the existing entry, or create a new one specifically for
udmabuf.

> > Who should be Cc'ed?
> 
> dim add-missing-cc ftw :-)

That just uses get_maintainer.pl according to the docs, so that wouldn't
change things as that is wired up as sendemail.cccmd already.  Except
that dim would probably add the list of people to the commit message.

cheers,
  Gerd

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
