Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5273E5EF8
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 18:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780685044; cv=none; b=POltRKCHdN7Q9XXatSA9NWxbh7yAGfITe6nC0RReRH5MvNgtZwD8NCevoPOKUe5oMzvKU3/tBXjkOm6tI5bD/u8FgDsZPXQLrnXRChTa04DlICnS7E9NiblMHDqEb9ya8KrI8tojvpk4qtaT78xb0hfbfKCJpSaFMX/XeG402kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780685044; c=relaxed/simple;
	bh=jptZDNz6y+ZlDE7Z2+X6vsmedleZEP/GgTVJ8MIVCV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mQQzAq/AodIZ4GMJzE3oQXJf7hxaHNK8EMkVBeCU1NHV0Ah7sx7NRQWOa0dlprdrxM/6o5WtQEcPomWWGtPAhSvubt+/wbFxtLMpFRsSz0WP3oi2STYQIOacsEMYRkebMptmDhZ097NRF41S+8jKjB/leybMpHe183XCNrTRFQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qUh+nclv; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qUh+nclv"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c0c3546924so15614675ad.3
        for <linux-kselftest@vger.kernel.org>; Fri, 05 Jun 2026 11:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780685043; x=1781289843; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VmToUT+A6qp8UgJ/VhXar74M6fIQJS1C/pR1f1V3ExQ=;
        b=qUh+nclvgiHYKzX3b/kDCvzXL/O6elBYjQ0Y2BtzxFxe6Q7xZG239BaIL2RKL8XZzL
         vpWhSBYMKiVYN/Z77EnauJ1L/pZIRV9cnLxjZav6YlpKNmSLAoqsL5a63WDyRdf2HZ5Z
         SDorrWNZX/kTLWwY5g0zdRVpmLfo2EH/+B6Qvag5sHDi/7gmLd6ARvd71WRiRVjPhgYJ
         f6yxBKbfC+XzSkRLourk6ogx2MDz8T70pAWO1IIrzJNsSbbQ7w+oN5p8MK0feSaZP7JQ
         WcNCA+aT8d9qbLYSx20PhXjlpUFL0y2DJrBbI0O1sy4YfyojDK0hkrTvmVaCaOrqVUgH
         ZWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780685043; x=1781289843;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VmToUT+A6qp8UgJ/VhXar74M6fIQJS1C/pR1f1V3ExQ=;
        b=cKqe+yxg+WZP+nKYWBoDtn81jMnxzpx/cCt4TJKFJfq6Y9PRAsutKvKxgN02SxvQUC
         GA6nmLiC4KIl4wjvLMB+CQ2k7zZIfGm9kyxz0t5hDOFj11fvH4y4kbWpp5aF6vBce2Bf
         2Va/Bp5mif7nxoZb0wi9mzm8Q2NkZjl9HnwjURJJlaU3dK1g8k7/yOcDW2uNIQDeY8tq
         p+7g9DDXXIyrNOuMDxe+QO7lGsRaujWu4Nj2U0z/kKPbTTUs0R9AsBe8x8j3yJgXVulx
         45n1HpMCRNZJlMosfOXEccP9KHLABXdOWDe0HE71r3UgCOUyimNnN83i1KiolWIWtsLx
         jK0w==
X-Forwarded-Encrypted: i=1; AFNElJ/2Ec+pyr5LxuhaQsUuBA2jM610gSW7P+O5ZUiQ8E6hua0EXYhX4hhL4NJWwrFGsSgTASoYKwzeTj9mxOQwugc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXtELggX2K4/XwOxOr1Um7oYqnG56mJI/t2BAUoLXesOSYz8Fa
	xvf/zqWmf70eSg08DpU87wNgmupiqU3++zMeiYt4D73kSgCOzLht1ZKb
X-Gm-Gg: Acq92OGGtWZighYw9b6upxPdNHKjO27wkqPblojApTH/JPIJ4KZZ/yihIpbrFJN6vI1
	9YMergO38WXgEer/xv9SFbDYIPIxQT2OUObE8+x6lKYlJ65lit59VAr3IFk00UI310C1gctLPXi
	PxFdFZNe7ZwyaCXlOBfhUzvx3fCu32K8CkeoSRIbdMW+2uwe3m0plWeZRG1GPTYJag4wJ6/0ZSg
	kHJl+hwA2JlFFdNmiAaXT2Rgukma5HYOns8ZZPuv2+jeWsrBNxsn1/9eZU5J8TA4CDUcMLK9Gx4
	NIsVNA2jB/D9mfhMLp1h/KcPiWFWkPovkTZWBh4HQAHyarv8guDma1VdghfNpJcZ1OYNHrHfo/Q
	o3H5ejoU807xELKj7oEa/zRSjpepQtd6u/eGD/MeUVtkEXFDZgRAdwY4oTDPZY6qL45+/DkYHwd
	vmBZQf+DcJQLsMjf10Fdd3kcW7qocLIb+mw9E9idb8Jo/WSNrJIBrYFmo=
X-Received: by 2002:a17:903:18c:b0:2c0:e5ee:f56c with SMTP id d9443c01a7336-2c1e881fefemr54368775ad.20.1780685042865;
        Fri, 05 Jun 2026 11:44:02 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:58::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1663981basm96908105ad.67.2026.06.05.11.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 11:44:02 -0700 (PDT)
Date: Fri, 5 Jun 2026 11:44:00 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	linux-kselftest@vger.kernel.org, sdf@fomichev.me,
	razor@blackwall.org, daniel@iogearbox.net, almasrymina@google.com,
	matttbe@kernel.org, skhawaja@google.com, dw@davidwei.uk,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next 2/4] udmabuf: emit one sg entry per pinned folio
Message-ID: <aiMY8CpckM8Jav0g@devvm29614.prn0.facebook.com>
References: <20260603-tcpdm-large-niovs-v1-0-f37a4ac6726c@meta.com>
 <20260603-tcpdm-large-niovs-v1-2-f37a4ac6726c@meta.com>
 <bdce2488-fe77-4f36-9ed6-dd2c785fa7c1@amd.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bdce2488-fe77-4f36-9ed6-dd2c785fa7c1@amd.com>

On Fri, Jun 05, 2026 at 11:30:07AM +0200, Christian König wrote:
> On 6/4/26 02:42, Bobby Eshleman wrote:
> > From: Bobby Eshleman <bobbyeshleman@meta.com>
> > 
> > get_sg_table() emitted one PAGE_SIZE sg entry per page even when the
> > underlying folio was larger.
> > 
> > Instead, walk folios[] and emit one sg entry per folio. When folios
> > represent large pages (as is for MFD_HUGETLB), each sg entry is a large
> > page. Normal PAGE_SIZE sg tables are unchanged.
> > 
> > Required by net/core/devmem to support rx-buf-size > PAGE_SIZE with
> > udmabuf.
> 
> That doesn't explain why this is required.

Sure, can definitely add. Devmem currently requires dmabuf sg entries to
be length and size aligned when it allocates niovs for NIC page pools.
Though udmabuf is not violating any dmabuf contract by emitting
PAGE_SIZE entries and the above restriction is probably more a
shortfalling of devmem, by emitting a single entry per folio this patch
allows udmabuf to be used by devmem for large pages.

> 
> Please note that accessing the pages/folio of an sg-table returned by DMA-buf is illegal and strictly forbidden!
> 
> Regards,
> Christian.

It seems both devmem and io_uring zcrx at least introspect through to
the sg-table to build NIC page pools (not accessing the memory itself,
however). Is there a better way?

Best,
Bobby

> 
> > Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
> > ---
> >  drivers/dma-buf/udmabuf.c | 47 ++++++++++++++++++++++++++++++++++++++++++-----
> >  1 file changed, 42 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> > index 94b8ecb892bb..f28dd3788ada 100644
> > --- a/drivers/dma-buf/udmabuf.c
> > +++ b/drivers/dma-buf/udmabuf.c
> > @@ -141,26 +141,63 @@ static void vunmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
> >         vm_unmap_ram(map->vaddr, ubuf->pagecount);
> >  }
> > 
> > +/* Return the number of contiguous pages backed by the folio at @i.
> > + * A udmabuf may map only part of a folio, or reference the same folio
> > + * in multiple non-contiguous runs, so folio_nr_pages() can't be used.
> > + */
> > +static pgoff_t udmabuf_folio_nr_pages(struct udmabuf *ubuf, pgoff_t i)
> > +{
> > +       struct folio *f = ubuf->folios[i];
> > +       pgoff_t j;
> > +
> > +       for (j = 1; i + j < ubuf->pagecount; j++) {
> > +               if (ubuf->folios[i + j] != f)
> > +                       break;
> > +               /* Same folio, but not a sequential offset within it. */
> > +               if (ubuf->offsets[i + j] != ubuf->offsets[i] + j * PAGE_SIZE)
> > +                       break;
> > +       }
> > +       return j;
> > +}
> > +
> > +/* Count the contiguous folio runs in @ubuf, one sg entry per run. */
> > +static unsigned int udmabuf_sg_nents(struct udmabuf *ubuf)
> > +{
> > +       unsigned int nents = 0;
> > +       pgoff_t i;
> > +
> > +       for (i = 0; i < ubuf->pagecount; i += udmabuf_folio_nr_pages(ubuf, i))
> > +               nents++;
> > +       return nents;
> > +}
> > +
> >  static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
> >                                      enum dma_data_direction direction)
> >  {
> >         struct udmabuf *ubuf = buf->priv;
> > -       struct sg_table *sg;
> >         struct scatterlist *sgl;
> > -       unsigned int i = 0;
> > +       struct sg_table *sg;
> > +       pgoff_t i, run;
> > +       unsigned int nents;
> >         int ret;
> > 
> > +       nents = udmabuf_sg_nents(ubuf);
> > +
> >         sg = kzalloc_obj(*sg);
> >         if (!sg)
> >                 return ERR_PTR(-ENOMEM);
> > 
> > -       ret = sg_alloc_table(sg, ubuf->pagecount, GFP_KERNEL);
> > +       ret = sg_alloc_table(sg, nents, GFP_KERNEL);
> >         if (ret < 0)
> >                 goto err_alloc;
> > 
> > -       for_each_sg(sg->sgl, sgl, ubuf->pagecount, i)
> > -               sg_set_folio(sgl, ubuf->folios[i], PAGE_SIZE,
> > +       sgl = sg->sgl;
> > +       for (i = 0; i < ubuf->pagecount; i += run) {
> > +               run = udmabuf_folio_nr_pages(ubuf, i);
> > +               sg_set_folio(sgl, ubuf->folios[i], run << PAGE_SHIFT,
> >                              ubuf->offsets[i]);
> > +               sgl = sg_next(sgl);
> > +       }
> > 
> >         ret = dma_map_sgtable(dev, sg, direction, 0);
> >         if (ret < 0)
> > 
> > --
> > 2.53.0-Meta
> > 
> 
