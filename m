Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2150399007
	for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 20:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781643486; cv=none; b=L1Lkn4Q8T2BtjfWDTsIieU6rLlKcNbvP5oOUcuoEHGxzFoRarKF5t9ACQALJdX+p+vllaP0KGkmAXStvyUWGDrztdrZJg70bLri27cRjjmqngKVgaqUe0BNW5HQDeCQ+YmlqGzL+15lBMvM94ArQxKWksDqb8INg7800dUb3rcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781643486; c=relaxed/simple;
	bh=MUmT4WQ8gikQW/FOLoONsetD5u39tuO3VxiIsFbd268=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wl6vK6Gv8LMig/kx98ZbpSzrpDBOLcOhPZLiXdEuz+EXiCMmVMH/ienvRB1mdC3uc34QDtNaq/dgeAj3ZhWSy68Lsmmv8GxCfsMGsP4GJnjilS9ovglMzSJRL1V1nxONdSCOcyIUe2NOSdcThol/WoKQfrn3UpZQIjbsEsp8ErI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sD26MNSY; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sD26MNSY"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-486b93fc7c8so2054981b6e.3
        for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 13:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781643484; x=1782248284; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rG4yjs4p+4H4P31U7PQCtrU7WZ2EeT+JyZMQJymeW5U=;
        b=sD26MNSYv9ZLMxqb1P8qI+3XPTH8FSD8SWooLHUuiCQ1s6THX8h2d9oZK9otgepkmZ
         L+7vw5kRLiFhMm4ptzIFb5v7SpJrr4VPdidEvKSkm3rQM7zsNu16TuLbxqzbvApfenPl
         Bc92wTJuZwFBksaYq+LNEJtqL8qMNArEaK/atLfBq4M5ys37Mkq3NJqEO3nDsQ3RjZnm
         uAZgzEI+ZYytvvmatKMEPQNndEF5C7AER/T55UeFVWLeLPCZqneogbKrZrNsOsahY1JO
         gpRzR0Fuf69BQoin4mtTuxrSj23kj93piIP2Ibn1fjn5ZOkwXSlYiw7aRLu3ADWyY4e5
         CTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781643484; x=1782248284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rG4yjs4p+4H4P31U7PQCtrU7WZ2EeT+JyZMQJymeW5U=;
        b=tY2aKdXcnOswUeeLCaJZTDnfL3xHbSfqSbTgAH8blR5qyMmwSJ2krds2xL56tqD8n2
         kTT9Zagz/KcG1zwAfzZxgYi/f9GpVm6mJRXq9eGok8gTIX4eRseW2mLnbhciB8vfWUWU
         +h1gAucnop2O7m+OmecrOxVmqvHvqHe3Cywz3VIg0S3otDKYvXbwhdoCrbBkTx7oxQp7
         k8/+6C+dcL3goGb5PFjwOP9idEIGVaQg/uZntcDxaMp6tBhfrIK350GVzI8dJoKa+Hac
         lJ2doJjPdIWlbst8agOHOsIqInMdFKfAY5ZWG6V29Y6Limq8BSL7IwszzuKuD3wIovMu
         xxwQ==
X-Forwarded-Encrypted: i=1; AFNElJ/FWBbt77zy2uG7HMLmxuPgq46xjt58Ic8ib8zN0kBO/SvoGGVtmUztuxGmd8ExGJvnJgCgklfHre4sxzcU80Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhFCtDMZIuq6y5uxx9jBWkene5FPZxqfbE+Fy0NutwhGH/+AyF
	EdKC8qlcsc2JUN8Gt66UD8S4Vfbhl/NVb0VZmCiQFa61Bx2FvBS2yd4u
X-Gm-Gg: Acq92OEAR1h5dS4UfH4sakrEPgV1SYuF8FACMKf/GnRyIivtrqv2ndp/48yKCI7K9CW
	RFcAqKi5TAn7gDYuriUKk22/2AZt6QVm702K0Usw2X/b51AJGB6B5B4ngaqlgzqwCgjuNDWwG7K
	0BbwT2iJSKFakO1Ww6rq07/dhlvvy3pQ1IXbo6CsPoqP1FDPIB9EO7yP0AVy52LjHHlY0F8VOwU
	5NS4x4Ecwu+zMG2u0m0ojCAvDIFNdJXjShnEcC0Ht59Wmp4ppj3EI/CglLNlrlvSSFHT/S7OPNM
	5A0IbOJ7Ky5m/yjScw4Mvvf/YAYUXoUk5QdVhZj5FKXHbQWYJLZ2XspNHJQC4uKe8ku3/z1fk3k
	uZ3wOI2HCf1uEe7eTklXMCo0efYPkoQTUzOnEmEfIhQ/a6ceLB+h2yzo6imQYfflZoyVGyh9W69
	1cA4aroe0dfDtr3RHWGhrBIA/SZ8JoeA4FO1ivKqYkPYo=
X-Received: by 2002:a05:6808:2f0f:b0:479:f7e7:4a81 with SMTP id 5614622812f47-489425d7d4cmr1016628b6e.0.1781643483758;
        Tue, 16 Jun 2026 13:58:03 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:8::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4875df7fc36sm5099675b6e.9.2026.06.16.13.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:58:03 -0700 (PDT)
Date: Tue, 16 Jun 2026 13:57:49 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Shuah Khan <shuah@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"sdf@fomichev.me" <sdf@fomichev.me>,
	"razor@blackwall.org" <razor@blackwall.org>,
	"daniel@iogearbox.net" <daniel@iogearbox.net>,
	"almasrymina@google.com" <almasrymina@google.com>,
	"matttbe@kernel.org" <matttbe@kernel.org>,
	"skhawaja@google.com" <skhawaja@google.com>,
	"dw@davidwei.uk" <dw@davidwei.uk>,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v2 2/4] udmabuf: emit one sg entry per pinned
 folio
Message-ID: <ajG4zaK9zu7qZT1+@devvm29614.prn0.facebook.com>
References: <20260611-tcpdm-large-niovs-v2-0-ee2bf15e7523@meta.com>
 <20260611-tcpdm-large-niovs-v2-2-ee2bf15e7523@meta.com>
 <IA0PR11MB71852246277F773AC41DAAA3F8E52@IA0PR11MB7185.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA0PR11MB71852246277F773AC41DAAA3F8E52@IA0PR11MB7185.namprd11.prod.outlook.com>

On Tue, Jun 16, 2026 at 06:04:03AM +0000, Kasireddy, Vivek wrote:
> Adding Jason to this discussion.
> 
> Hi Bobby,
> 
> > Subject: [PATCH net-next v2 2/4] udmabuf: emit one sg entry per pinned
> > folio
> > 
> > From: Bobby Eshleman <bobbyeshleman@meta.com>
> > 
> > get_sg_table() emitted one PAGE_SIZE sg entry per page even when the
> > underlying folio was larger.
> > 
> > Instead, walk folios[] and emit one sg entry per folio. When folios
> We have recently merged a patch (that will make it into 7.2) from Jason that
> replaced sg_set_folio() with sg_alloc_table_from_pages() in udmabuf driver:
> https://gitlab.freedesktop.org/drm/tip/-/commit/5bf888673e0dda5a53220fa0c4956271a46c353c
> 
> Since you are relying on sg_set_folio(), the core argument against its usage
> in udmabuf is that it doesn't work well with offsets > PAGE_SIZE, resulting
> in a malformed scatterlist. Not sure if this can be fixed easily.
> 
> > represent large pages (as is for MFD_HUGETLB), each sg entry is a large
> > page. Normal PAGE_SIZE sg tables are unchanged.
> > 
> > This is helpful for importers like net/core/devmem that expect dmabuf sg
> IMO, udmabuf needs to detect whether importers can handle segments that
> are > PAGE_SIZE and set the entries appropriately. Please look into how the
> GPU drivers and other dmabuf exporters/importers handle this situation, so
> that we can adopt best practices to address this issue.
> 
> Thanks,
> Vivek

Hey Vivek,

It sounds looks like that patch might solve my problem. I'll apply and
troubleshoot from there.

Thanks!

Best,
Bobby

> 
> > entries to be size and length aligned. Prior to this patch udmabuf
> > handed over one PAGE_SIZE sg entry per page, so devmem only saw
> > PAGE_SIZE chunks regardless of the underlying folio size.
> > 
> > dma_map_sgtable() does not always merge contiguous pages for us, so we
> > do this internally before exporting.
> > 
> > Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
> > ---
> >  drivers/dma-buf/udmabuf.c | 52
> > ++++++++++++++++++++++++++++++++++++++++++-----
> >  1 file changed, 47 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> > index 94b8ecb892bb..9b751dd98b12 100644
> > --- a/drivers/dma-buf/udmabuf.c
> > +++ b/drivers/dma-buf/udmabuf.c
> > @@ -141,26 +141,68 @@ static void vunmap_udmabuf(struct dma_buf
> > *buf, struct iosys_map *map)
> >  	vm_unmap_ram(map->vaddr, ubuf->pagecount);
> >  }
> > 
> > +/* Return the number of contiguous pages backed by the folio at @i.
> > + * A udmabuf may map only part of a folio, or reference the same folio
> > + * in multiple non-contiguous runs, so folio_nr_pages() can't be used.
> > + */
> > +static pgoff_t udmabuf_folio_nr_pages(struct udmabuf *ubuf, pgoff_t i)
> > +{
> > +	struct folio *f = ubuf->folios[i];
> > +	pgoff_t j;
> > +
> > +	for (j = 1; i + j < ubuf->pagecount; j++) {
> > +		if (ubuf->folios[i + j] != f)
> > +			break;
> > +		/* Same folio, but not a sequential offset within it. */
> > +		if (ubuf->offsets[i + j] != ubuf->offsets[i] + j * PAGE_SIZE)
> > +			break;
> > +	}
> > +	return j;
> > +}
> > +
> > +/* Count the contiguous folio runs in @ubuf, one sg entry per run.
> > + *
> > + * Coalescing folios into a single sg entry up front lets importers actually
> > + * see large chunks. We can't rely on dma_map_sgtable() to do this for us
> > as
> > + * the dma_map_direct() path preserves the input scatterlist lengths
> > verbatim.
> > + */
> > +static unsigned int udmabuf_sg_nents(struct udmabuf *ubuf)
> > +{
> > +	unsigned int nents = 0;
> > +	pgoff_t i;
> > +
> > +	for (i = 0; i < ubuf->pagecount; i += udmabuf_folio_nr_pages(ubuf,
> > i))
> > +		nents++;
> > +	return nents;
> > +}
> > +
> >  static struct sg_table *get_sg_table(struct device *dev, struct dma_buf
> > *buf,
> >  				     enum dma_data_direction direction)
> >  {
> >  	struct udmabuf *ubuf = buf->priv;
> > -	struct sg_table *sg;
> >  	struct scatterlist *sgl;
> > -	unsigned int i = 0;
> > +	struct sg_table *sg;
> > +	pgoff_t i, run;
> > +	unsigned int nents;
> >  	int ret;
> > 
> > +	nents = udmabuf_sg_nents(ubuf);
> > +
> >  	sg = kzalloc_obj(*sg);
> >  	if (!sg)
> >  		return ERR_PTR(-ENOMEM);
> > 
> > -	ret = sg_alloc_table(sg, ubuf->pagecount, GFP_KERNEL);
> > +	ret = sg_alloc_table(sg, nents, GFP_KERNEL);
> >  	if (ret < 0)
> >  		goto err_alloc;
> > 
> > -	for_each_sg(sg->sgl, sgl, ubuf->pagecount, i)
> > -		sg_set_folio(sgl, ubuf->folios[i], PAGE_SIZE,
> > +	sgl = sg->sgl;
> > +	for (i = 0; i < ubuf->pagecount; i += run) {
> > +		run = udmabuf_folio_nr_pages(ubuf, i);
> > +		sg_set_folio(sgl, ubuf->folios[i], run << PAGE_SHIFT,
> >  			     ubuf->offsets[i]);
> > +		sgl = sg_next(sgl);
> > +	}
> > 
> >  	ret = dma_map_sgtable(dev, sg, direction, 0);
> >  	if (ret < 0)
> > 
> > --
> > 2.53.0-Meta
> 
