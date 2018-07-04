From: daniel at ffwll.ch (Daniel Vetter)
Date: Wed, 4 Jul 2018 11:19:54 +0200
Subject: [PATCH v6] Add udmabuf misc device
In-Reply-To: <20180704085825.nfkv5i7ultaavjve@sirius.home.kraxel.org>
References: <20180703075359.30349-1-kraxel@redhat.com>
 <20180703083757.GG7880@phenom.ffwll.local>
 <20180704055338.n3b7oexltaejqmcd@sirius.home.kraxel.org>
 <20180704080807.GH3891@phenom.ffwll.local>
 <20180704085825.nfkv5i7ultaavjve@sirius.home.kraxel.org>
Message-ID: <20180704091954.GQ3891@phenom.ffwll.local>

On Wed, Jul 04, 2018 at 10:58:25AM +0200, Gerd Hoffmann wrote:
>   Hi,
> 
> > > Hmm, does MAINTAINERS need an update then?  Maintainer and mailing lists
> > > listed in the "DMA BUFFER SHARING FRAMEWORK" entry are on Cc.
> > 
> > Yeah, maintainers entry with you as maintainer plus dri-devel as mailing
> > list plus drm-misc as repo would be good. Just grep for drm-misc.git for
> > tons of examples.
> 
> There is an *existing* entry covering drivers/dma-buf/, and I've dropped
> udmabuf.c into that directory, so I've assumed get_maintainers.pl picks
> up all relevant dma-buf folks ...
> 
> Covering udmabuf.c maintainance is a different issue.  I could just add
> myself to the existing entry, or create a new one specifically for
> udmabuf.

That's what I meant, do a more specific entry to add yourself just for
udmabuf.

> > > Who should be Cc'ed?
> > 
> > dim add-missing-cc ftw :-)
> 
> That just uses get_maintainer.pl according to the docs, so that wouldn't
> change things as that is wired up as sendemail.cccmd already.  Except
> that dim would probably add the list of people to the commit message.

Ah right, I totally missed that you have more on the mail's Cc: than on
the patch. I never do that, so always miss them :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
