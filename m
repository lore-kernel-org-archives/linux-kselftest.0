Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793662689;
	b=fXhDmVt+Ys4PHD7PfgwtJa87ptoBKEj5Oa7tnX7XxNb7gnQNJNlv7GqQV0kydcNmN26f
	 HTCJKhCzTUivHB/EXMhQpdv+/MGoFcwj71fHiCQ2vHvLZt/n5vkdpURRCrL5CjCQGvSZo
	 9ipl82dbFfEb64jI+QWx/9K7G8sN6BDAdMR93rSC8bds60CB9zG1hi1bwAfOu2gvW4EP/
	 b9IROL3/6CHy8X2YID1Zz0AoU0yvY0w/Ov7zoDiNohtIOJKqqDHaU0P2NvwH66IgaDGii
	 NT/UJbITKf/vcU06wi4cM+9YM4lL2Cea5b3zG/riqj4QUHbeRMvg7rFzgR3ILDREM0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793662689;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=CpN0nyOlHAAHfSUiOBw/jygsiBzrfum7qcPzJKfy0Js=;
	b=m6iI5Gn2lqxxZFpDpJzJqry9EnAbSeQFGx1KD1Xkznov53Qsg/hL8LBnupNAH0ZSDOsN
	 UwQxBP3EtOWvMcs+UaSRt6Vy21l7NkBca41BQ1pvKa8o314egiPKvkD6D9SxsgvjANNoZ
	 cw32eMX0SS40hyocMl2ZRh05GGpmIJcVuygYIG7UvMCEYPIKEY69IlgWzCq4a5owNwaNX
	 5mlZPYZm6lncocQmro/Bubqcw8FcA8kDRmQT9A0tT/FJAeEhUUmD9aF+4BBcPxVjLZmEH
	 XK8BG+BkjeIQT29zh88NGR4EioyyIh5pFybKMki/3D8RS94QppJImYgtOp+VfOwLa/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=npq2+qmp;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734B2606D801
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 23:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 734B2606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=npq2+qmp
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-36a6ce64b95so845823eec.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 15:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793662687; x=1794267487; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CpN0nyOlHAAHfSUiOBw/jygsiBzrfum7qcPzJKfy0Js=;
        b=npq2+qmpq5UBVj3/fLPNaAEtiZsX+I+usrWfMdIJiPyxvpqaN6KTNnBj/Gxiokhb9U
         cz1BQpDAcWByapX4YJsWk+wnj5jyqb4re2eEcV3kRqJAyS1d9pNhCbJRD6+dPKUdJaNU
         b5uEEciepNPVX4EYXpaWjIyva23a438fCWxNH/08NriXyQDXO8dmAJ0h4umVYBMy1OK7
         E5iFPI1a6Ont6Q+jrRPFOrp30fh3eX8Ix1g3fETarH2jkCHwRA3LZKjKpASrWJWT+6TB
         r6Hxgfv1qEP+/lvZuMfR8Ht+MORI/VHkgXwFkujpSiO/9HI+GDL3JjQ+eM4wxCO5eqtq
         n57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793662688; x=1794267488;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CpN0nyOlHAAHfSUiOBw/jygsiBzrfum7qcPzJKfy0Js=;
        b=MBoACiCTE+VA6blP5BvcINfTGDr5raH6u4H7Zux+nRGaPwfGaCKgGoISYsbuvJuyYL
         UumGteOenaad6JVRqa2MgLEiu1/7bZdY2LFeV4OdftIRSANJ5L10GHHR+ftackXNKYvV
         89LRc7HqSu8mWFsaKalkDR5GouUgZ7jVvjtNJ8AX1Qhn1vu+V3TnHlkOqGAOdqQy2z+w
         FaQg+YWM55Y+X9NVI9zab7CIWazQ+xjDL1AB9SUm5KtEExetSwGpUSl0IwiAWdezvEA0
         q6IyT7vJm/71cXdOS+MmBPvFaBTzCQUXILViBs0bICVnZ0NdFHwUP9FII4TdytaSZtE1
         ngwA==
X-Forwarded-Encrypted: i=1; AKwUvBw7RCMN5VzkfRVmlzWjgexEtAwt4yF9oocA8SltWFHRYS9Y8UrcdddNXSxm0RHJ8M4DjK3l4S29FR36d7Ffb7A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfOMhNpaavWQsopsRatB5LG2JeXLCFuGjnm4deIsZlnWYqxdvz
	xRfVK3jbxwlErszou6+bb/ewYDO6PEbsiGxptHyYBXooj1vdjGdctXrG
X-Gm-Gg: AYBFou2DBn+UNvVnld+5/llvwpCV5m6xSdMwsfAgwjO9wGAHc5XvcHz2aGoo8vjBtt7
	MRN8QW1SBRGsvR7F14XK2+aIdlmz0QZpX+WeHkpZ/pURIGowEcJxEyEbdvFNDdgmSJfQNzqpDEN
	2EDUjmITyYLIKTUwyyIUhPGQPJbQqbIzIRgSXl9lAS0/KkDj5xg06dqoyrsmsFVe1HmKRWv4Krw
	UBPoUCiSZW+KTlu4g/Yp47BUxRjU399tUqFeaFdMAQGFRlfDvaaKHgc5ngd1Q6WnDlTQmdCNGK7
	c7qyQxa/JIMD1ZGu2YcO9z+E9vdKlqxtE6R1HHHLsOQwwxrUMOXrTniuWZvy2A7wSBZ6bBRzCfn
	PhNjQMQjcwg2BRxT6ODaeoUlbePzG9JgR1+3kC53u0Q4UsYXanm1mfs+RUPN2trkuUIQo5urDy5
	lpyCW05PermAZqi/kn7v3HA3mgVfOOWxRBvQr2seFvVC79Wp9Pvb2Qh67rETdXytucdZ6SnzlXo
	yABiYkEnvQStw6l6UpE3LDASvxA8FXdwkQBHPrziuDo0vi8uDnr6q6Cmv+/MzCNemq1kP8jJtrR
	Gn58Hpqeqxx4XHD4+D+eeQ==
X-Received: by 2002:a05:7022:3b88:b0:143:54c6:6a5 with SMTP id a92af1059eb24-1ac5c8379a3mr17375543c88.37.1793662687477;
        Mon, 02 Nov 2026 15:38:07 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:44::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b23f20d36csm580363c88.11.2026.11.02.15.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 15:38:07 -0800 (PST)
Date: Mon, 2 Nov 2026 15:37:54 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch, edumazet@kernel.org, 
	horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	michael.chan@broadcom.com, pavan.chebbi@broadcom.com, sdf@fomichev.me, 
	bobbyeshleman@meta.com, asml.silence@gmail.com, daniel@iogearbox.net, 
	razor@blackwall.org, leitao@debian.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 6/7] net: devmem: size TX net_iovs from the
 dmabuf sg table
Message-ID: <aukcZBLBir_91hPr@devvm16445.scu0.facebook.com>
References: <20261102191438.1059771-1-sdf@fomichev.me>
 <20261102191438.1059771-7-sdf@fomichev.me>
 <CAHS8izMRtaL=kZaM29XQBodT8e+srppnK_DjNSTJnxFfNgG9aw@mail.gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHS8izMRtaL=kZaM29XQBodT8e+srppnK_DjNSTJnxFfNgG9aw@mail.gmail.com>

On 11/02, Mina Almasry wrote:
> On Mon, Nov 2, 2026 at 11:14 AM Stanislav Fomichev <sdf.kernel@gmail.com> wrote:
> >
> > PAGE_SIZE TX net_iovs cap devmem skbs at MAX_SKB_FRAGS pages (~68KB),
> > which makes BIG TCP ineffective.
> >
> > TX net_iovs only need to be DMA contiguous. Use the largest power of 2,
> > up to 2MB, which aligns every DMA segment of the dmabuf:
> > - 2MB hugepage-backed udmabufs get 2MB net_iovs
> > - no UAPI change, TX addresses are dmabuf offsets
> > - skbs are still bounded by TCP's size_goal, only frags get larger
> >
> > Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
> > ---
> >  net/core/devmem.c      | 28 ++++++++++++++++++++++++++--
> >  net/core/netdev-genl.c |  2 +-
> >  2 files changed, 27 insertions(+), 3 deletions(-)
> >
> > diff --git a/net/core/devmem.c b/net/core/devmem.c
> > index 19c039ed2cb2..98c9594dbf99 100644
> > --- a/net/core/devmem.c
> > +++ b/net/core/devmem.c
> > @@ -181,6 +181,20 @@ int net_devmem_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
> >         return err;
> >  }
> >
> > +static bool net_devmem_sgt_aligned(struct sg_table *sgt, size_t size)
> > +{
> > +       struct scatterlist *sg;
> > +       unsigned int i;
> > +
> > +       for_each_sgtable_dma_sg(sgt, sg, i) {
> > +               if (!IS_ALIGNED(sg_dma_address(sg), size) ||
> > +                   !IS_ALIGNED(sg_dma_len(sg), size))
> > +                       return false;
> > +       }
> > +       return true;
> > +}
> > +
> > +/* niov_shift == 0 picks the net_iov size from the dmabuf, TX only */
> >  struct net_devmem_dmabuf_binding *
> >  net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
> >                        struct device *dma_dev,
> > @@ -191,11 +205,11 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
> >                        struct netlink_ext_ack *extack)
> >  {
> >         struct net_devmem_dmabuf_binding *binding;
> > -       size_t niov_size = 1UL << niov_shift;
> >         static u32 id_alloc_next;
> >         struct scatterlist *sg;
> >         struct dma_buf *dmabuf;
> >         unsigned int sg_idx;
> > +       size_t niov_size;
> >         size_t niov_idx;
> >         size_t i;
> >         long err;
> > @@ -221,7 +235,6 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
> >         binding->tx_max_frag_size = dev->netmem_tx_max_frag_size;
> >         write_pnet(&binding->net, sock_net(nl_sk));
> >         binding->uid = sk_uid(nl_sk);
> > -       binding->niov_shift = niov_shift;
> >         xa_init_flags(&binding->bound_rxqs, XA_FLAGS_ALLOC);
> >
> >         err = percpu_ref_init(&binding->ref,
> > @@ -266,6 +279,17 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
> >                 goto err_unmap;
> >         }
> >
> > +       if (!niov_shift) {
> > +               niov_size = SZ_2M;
> > +               while (niov_size > PAGE_SIZE &&
> > +                      (!IS_ALIGNED(dmabuf->size, niov_size) ||
> > +                       !net_devmem_sgt_aligned(binding->sgt, niov_size)))
> > +                       niov_size /= 2;
> > +               niov_shift = ilog2(niov_size);
> > +       }
> > +       binding->niov_shift = niov_shift;
> > +       niov_size = 1UL << niov_shift;
> > +
> 
> How come we're not checknig the largest supported size of the netdev here?
> 
> Also, maybe should clarify in the cl with the largest supported size,
> is it actually only powers of 2 up to that power of 2? Or all sizes up
> to that (not-necassirly) power of 2 size?

I think these are a bit orthogonal, no? We can have niovs larger than
the HW can tx. If that's the case, we'll just sub-divide when we build
the skb. If we limit to the same chunk the device can handle here,
we might use 2 frags to send single chunk worth of data more often (offset
doesn't have to be aligned to the chunk size).


Assuming device can only send 16K, current patch:

[       2MB        ] 2BM niov
     [ 16K ]         sending 16K from that 2MB will use one chunk


Limiting chunks to device's chunk size:

[ 16K ][ 16K ]       16K niov
    [ 16K ]          sending 16K from offset 8K will have to use 2 frags

(obviously, the same thing can happen with 2MB chunks, but less often)

LMK if it does not sound convincing.
