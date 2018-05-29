From: kraxel at redhat.com (Gerd Hoffmann)
Date: Tue, 29 May 2018 10:48:45 +0200
Subject: [PATCH v3] Add udmabuf misc device
In-Reply-To: <20180529082327.GF3438@phenom.ffwll.local>
References: <20180525140808.12714-1-kraxel@redhat.com>
 <20180529082327.GF3438@phenom.ffwll.local>
Message-ID: <20180529084845.2al2dmpvjpz6eexp@sirius.home.kraxel.org>

  Hi,

> > +static void *kmap_atomic_udmabuf(struct dma_buf *buf, unsigned long page_num)
> > +{
> > +	struct udmabuf *ubuf = buf->priv;
> > +	struct page *page = ubuf->pages[page_num];
> > +
> > +	return kmap_atomic(page);
> > +}
> > +
> > +static void *kmap_udmabuf(struct dma_buf *buf, unsigned long page_num)
> > +{
> > +	struct udmabuf *ubuf = buf->priv;
> > +	struct page *page = ubuf->pages[page_num];
> > +
> > +	return kmap(page);
> > +}
> 
> The above leaks like mad since no kunamp?

/me checks code.  Oops.  Yes.

The docs say map() is required and unmap() is not (for both atomic and
non-atomic cases), so I assumed there is a default implementation just
doing kunmap(page).  Which is not the case.  /me looks a bit surprised.

I'll fix it for v4.

> Also I think we have 0 users of the kmap atomic interfaces ... so not sure
> whether it's worth it to implement those.

Well, the docs are correct.  kmap_atomic() is required, dma-buf.c calls
the function pointer without checking it exists beforehand ...

cheers,
  Gerd

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
