Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793652052;
	b=mJsmC6oscllFDao4OH1VrTkYHCu2BNutgCVukSiyqOpUZRZbtuq1J8xq2ppwufCtNMTW
	 0cVv9PqrBAYLAgUWLDYF7gJToOLOfEqRxn6Ftn1wpuA/QZCn8qwgDVErGUZ8IsG6Gca1O
	 52XHGmvNfd44IPudMrcyBhbnEcLj6JinkTzVCwUvZoDarWJpzXZ+GaUO0gg1ocVVHbPp7
	 N4Iue71Izggzixxlb3QDJAC2v49l23uFF3bQnBlhCQ8kctYuTpXNbGzKGK8Wz5UkGOzun
	 H6XkbKV2wL4QnqSs8RichukRXNZOCO+WnketB4ynyGSZKGUfmxqe3nj1j/qDe3RXiWA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793652052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rii+FZ54nJeZhKcJyKsTY7JZApppPOKhEtvxZ28gkHM=;
	b=EOieJLQeYhCuh6Jf+esUylmNwzZgMkH6FIKacfhm8eNdmg/W3yIGb0Vm0myjSTjAJx1L
	 TjxPi22dNd5i/relbJ8BFw0r6yld1LLgaEiSanUJehsGRSIgNwlbVw5JwcaTeIeKoUMyy
	 qJCeQOBqWJqEqVBBi+e9QWT7uwBNRKSvDdaa+Rsr84p2twwFLRFLuyQM2KpJfc9rI9XmU
	 9SQortPD1I/Ghrd1sLSR0fSlCy6VMj12LJYFmJvdyqjXZYHMSeNCQSknqW8xqlUVyiVjq
	 FSe8dCUIGGigEmRV2CfK8p6kJvuI4WmOclrMY0czLUqrU++ZInb3/QYpXz1Njverlag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eHNNvP4g;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F84A606A326
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 20:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F84A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eHNNvP4g
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso2222a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 12:40:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793652049; cv=none;
        d=google.com; s=arc-20260327;
        b=Lpp62W9WXollqWAW1+tLWgeW45IzW34ZRzRcecyoWCE9GQpRRosv3ZVGtE1C7j70UC
         qd/FN+NlJ5xowOlpc02NCN9JuGjbQnHnHyVP7y6N0CoD6pxCCA4VDDJk1HFY+xUDsF8q
         NDXvaZwAJ07dKb6A5CYmIDKvqoQJ0lx04eeoIuNTcRZTKvPq9mlQoGPF91h5A2zaYUWy
         ehlwwhsbFJCqubCgP0GuOhcDN3+KR8kAbtGS/5MZ26JTAtUvzrLUzJHzhF3jkSISWFFj
         tMdwODqDbf+/ysCOO2m+3U+4pPO69/BdZm3a4YEVScg7QR+vpuT+1JPxa7YZxzteK0Gb
         6KHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rii+FZ54nJeZhKcJyKsTY7JZApppPOKhEtvxZ28gkHM=;
        fh=nR8zx8EWgEkBJMDNjRCxCab6YJYO3Mh11GoYz45aVcw=;
        b=EC0AkcJlzgV4X8yZAVyeedRJutKzTUzVmA7BQ5sezh4YNuKqSYoEyPLaIxLOEgP0Qv
         zaQ1+UZ9NbIMRZIb+dG32fW3TrMCSdOYNBjNHMN9aEf4mUbK8Oh3Cfv2crtAH6wDiXth
         AlZH98jWNrFJeESS7n1KlB9pizd05BBDbjUFyKvAZNp4IZ4Uz1MoN02eQm0iiuYqXhZw
         hOwGY8z8BI7eOZyWlNmiau17LLGD/Q8LB/xpP/Hgqp8ka1pdtikEP2/B4kVh/FJUhPfV
         hlwiBOWDDQ6GxbmOsCLY6n51qC4eO8P9DPlaypg7r8qyDooesmzMwspURrMCeEDxptdT
         kxJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793652049; x=1794256849; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rii+FZ54nJeZhKcJyKsTY7JZApppPOKhEtvxZ28gkHM=;
        b=eHNNvP4gkD3jFrnE5uUMmnf91GgojEokCRr1Bj8d750eNexMgmZ8rGFlp4Hy8j4QU2
         xzu+6K68aQBmEtnDWqzd2xBxnjfoqOQ8PH0wixFaMipd+67kkunJQyI6z3wo0lQZU2dF
         vEBKFm1epjhZioAbdqRyYFTxMrL2WVzTSB+oUws9P3VLC66DjXIVql5kKhWMRhk0VQ7i
         V35M8A8pUeQhtTRXE+rpgK0B2hzGSr305ImakHHS7UF7KMWlRVgXzGQhqJnXZBzKrPC5
         8JhoSOur9ZOawQyQJJieWAXSotbOjJ39U4r9M+6lnW/94pEbAlntuJC12wSYGCi4e0vp
         hAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652049; x=1794256849;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rii+FZ54nJeZhKcJyKsTY7JZApppPOKhEtvxZ28gkHM=;
        b=vZcaczRzZ6tWXsYQ34+uxwleZybujk02qJI1tNZ+RLeXLXUxv1VGLjp68zypB3rmqZ
         yLAdkb502DulLfA6PXIjLf1y2GqEBSMLFVwbNbyBKmGGb7uMkB8IjDLymv19y4PNzvQu
         IymkKBsC3T8CfTtDDRijjGF67Vi5fakvQ+zrKgyb8vlHjFpPUvB+jVTVYHrdSHU6xqG9
         TuwnPMx3yHkymbME+QTbP+lwl8dVC7un5p4nKvHgRuF6yYQg4gUNo8V6iiKNHKOW8k1B
         uiV271Q8GExxzdF2YNEb9NXuZcQ7FV+/dy2+sSJJ5RQcx1grxREHG6nwQMCbBWEwFEmD
         aI5A==
X-Forwarded-Encrypted: i=1; AKwUvBxL84HO9684G7CanYiFOFSCjljG3gLpukP9Ltf0UFIcqA+GhDMVn+nKiGWRtz4wO8hhKhxVnqGtk1prT4um4iU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sbhj6X2eKo/fl2ohlhZYA0XVcVhzV/ePkMY9ntQjwBbNyKNTM
	p44sPuwbjMBiCGLy7Z4NUtVxaHbOC/EsT3vMHq5oQeSWm92NfGPhWzxWQRzCGYH/oqnWp5q+e6B
	/KWZFS89q6gl4LzVOEubJ1yKyD31M3I6EiTYRg0+h
X-Gm-Gg: AYBFou1/gqZvOZvEcEVOlvFaJdEi5dtKnEDGM0xFtGPNYXzOZvqjWAzwbeUmBapFWLg
	/XDIlYxSHSvsAt9ZumrZGhqYozjttgd+9SdpY+bg0PLb8+ZYtq62YmBx4lIuq5mf+AYDklazxxn
	+IrtM2YrRkAQqnTTClR61Dpant2/M5vBjltzKwPYRkyXnSb7tzkRuLaUYW8aulIj1upC7i0HyJ9
	8aBhR55CBkNRWB0tqteLPCrsrg7h8Fjm69PqNgwiswzjbzmGNVMSOqhz9NtEsM0pL3OmEP5dtIF
	+/EgdXFM7SpKr4GQUSVlRVJqejC7ssfIrjUiv5F1x0G4Vk27PGw8UGSYWXYn8U1RVV4QvFA5O7d
	OLiHTPyLgvMMOQ36BZPjURgdPgHyD0fcNC9qeNegxYeJIkP2WOSEsUNYhxTKRE1LYQkc=
X-Received: by 2002:aa7:d794:0:b0:6b4:2188:97d0 with SMTP id
 4fb4d7f45d1cf-6b539d22220mr5870a12.6.1793652049063; Mon, 02 Nov 2026 12:40:49
 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102191438.1059771-1-sdf@fomichev.me> <20261102191438.1059771-7-sdf@fomichev.me>
In-Reply-To: <20261102191438.1059771-7-sdf@fomichev.me>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 2 Nov 2026 12:40:37 -0800
X-Gm-Features: AclHuK-QHSUFwb7InxS-A8g0MGgfg1Hp3eU1afIQI3kknV9M7EMlKPAHYQ2ow5c
Message-ID: <CAHS8izMRtaL=kZaM29XQBodT8e+srppnK_DjNSTJnxFfNgG9aw@mail.gmail.com>
Subject: Re: [PATCH net-next 6/7] net: devmem: size TX net_iovs from the
 dmabuf sg table
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch, 
	edumazet@kernel.org, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, michael.chan@broadcom.com, 
	pavan.chebbi@broadcom.com, sdf@fomichev.me, bobbyeshleman@meta.com, 
	asml.silence@gmail.com, daniel@iogearbox.net, razor@blackwall.org, 
	leitao@debian.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 11:14=E2=80=AFAM Stanislav Fomichev <sdf.kernel@gmai=
l.com> wrote:
>
> PAGE_SIZE TX net_iovs cap devmem skbs at MAX_SKB_FRAGS pages (~68KB),
> which makes BIG TCP ineffective.
>
> TX net_iovs only need to be DMA contiguous. Use the largest power of 2,
> up to 2MB, which aligns every DMA segment of the dmabuf:
> - 2MB hugepage-backed udmabufs get 2MB net_iovs
> - no UAPI change, TX addresses are dmabuf offsets
> - skbs are still bounded by TCP's size_goal, only frags get larger
>
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
> ---
>  net/core/devmem.c      | 28 ++++++++++++++++++++++++++--
>  net/core/netdev-genl.c |  2 +-
>  2 files changed, 27 insertions(+), 3 deletions(-)
>
> diff --git a/net/core/devmem.c b/net/core/devmem.c
> index 19c039ed2cb2..98c9594dbf99 100644
> --- a/net/core/devmem.c
> +++ b/net/core/devmem.c
> @@ -181,6 +181,20 @@ int net_devmem_bind_dmabuf_to_queue(struct net_devic=
e *dev, u32 rxq_idx,
>         return err;
>  }
>
> +static bool net_devmem_sgt_aligned(struct sg_table *sgt, size_t size)
> +{
> +       struct scatterlist *sg;
> +       unsigned int i;
> +
> +       for_each_sgtable_dma_sg(sgt, sg, i) {
> +               if (!IS_ALIGNED(sg_dma_address(sg), size) ||
> +                   !IS_ALIGNED(sg_dma_len(sg), size))
> +                       return false;
> +       }
> +       return true;
> +}
> +
> +/* niov_shift =3D=3D 0 picks the net_iov size from the dmabuf, TX only *=
/
>  struct net_devmem_dmabuf_binding *
>  net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
>                        struct device *dma_dev,
> @@ -191,11 +205,11 @@ net_devmem_bind_dmabuf(struct net_device *dev, void=
 *vdev,
>                        struct netlink_ext_ack *extack)
>  {
>         struct net_devmem_dmabuf_binding *binding;
> -       size_t niov_size =3D 1UL << niov_shift;
>         static u32 id_alloc_next;
>         struct scatterlist *sg;
>         struct dma_buf *dmabuf;
>         unsigned int sg_idx;
> +       size_t niov_size;
>         size_t niov_idx;
>         size_t i;
>         long err;
> @@ -221,7 +235,6 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *=
vdev,
>         binding->tx_max_frag_size =3D dev->netmem_tx_max_frag_size;
>         write_pnet(&binding->net, sock_net(nl_sk));
>         binding->uid =3D sk_uid(nl_sk);
> -       binding->niov_shift =3D niov_shift;
>         xa_init_flags(&binding->bound_rxqs, XA_FLAGS_ALLOC);
>
>         err =3D percpu_ref_init(&binding->ref,
> @@ -266,6 +279,17 @@ net_devmem_bind_dmabuf(struct net_device *dev, void =
*vdev,
>                 goto err_unmap;
>         }
>
> +       if (!niov_shift) {
> +               niov_size =3D SZ_2M;
> +               while (niov_size > PAGE_SIZE &&
> +                      (!IS_ALIGNED(dmabuf->size, niov_size) ||
> +                       !net_devmem_sgt_aligned(binding->sgt, niov_size))=
)
> +                       niov_size /=3D 2;
> +               niov_shift =3D ilog2(niov_size);
> +       }
> +       binding->niov_shift =3D niov_shift;
> +       niov_size =3D 1UL << niov_shift;
> +

How come we're not checknig the largest supported size of the netdev here?

Also, maybe should clarify in the cl with the largest supported size,
is it actually only powers of 2 up to that power of 2? Or all sizes up
to that (not-necassirly) power of 2 size?

--=20
Thanks,
Mina
