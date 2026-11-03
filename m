Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793673199;
	b=OK283yeLjR56/yVMXTFC4ooppmPOjSaMFyuCwgKJsjQHOmHRHJnYIfmaG7NXf8YrVvBF
	 Jf8EVIKcQlLTXZMqL9wrldKbuQeVbbdFJ8DBGvVDf/jUGaOvzuOg6hKlYGUqhrmVZogj+
	 03GfXk4qW0klBgjMgm8foLVw5ofSnkSy5Z3BM+vowAs9s8o+ZL017ipy1YxHXSkH/ugZL
	 Iwn+uIVCUdVCFLAmdxVx5Y/AFLl9G3y2F+PF8RttbgwY6MTgLFqvhLBIulfQYzIOlo7F1
	 BFrR4zB4h3U9A63SqBeR0xERfzi05cMdLcg5IVWY71CY0vPThoZcK8skXO3ppCP4Thw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793673199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ej64xMS8kGq5PBAWKWEJuwz7p+48gcc+V/GA+vPZ96I=;
	b=VytdgBT6YhFGJ90vozfwWb0chPSmRmbMDHhQLRVaz+5ZzGAdWYeLrCjWGfttGJtmRmfj
	 OzwSWeol9k8LNaQ5xx2W5jR2iNNj1ItPa01HV5YzVkXa2dMVxC8g+pakC9A9L2lT0Kupr
	 EQtGupiANVGYQN2d/xwmq/nCqc7UAl2qPS5i6l3q/FyanhRMIdBldRFXMhmUl/Cgw9LV7
	 aKXAvG+JG5WbV5kFs/lD6m0ro+7gvaAQnlZk9wNk1zOS/yHm0PYRYtxlFUiV5UuDOaMgd
	 g78nLlr/Kx3cn3SPL9ZH5CWYEMp33kWqJuU8T41uIs+oE7mqXK41bh2AW43hKN/QO1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aP7uz2Om;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280BB606A326
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 02:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 280BB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aP7uz2Om
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so2454a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 18:33:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793673198; cv=none;
        d=google.com; s=arc-20260327;
        b=fSEYAHIO7qcQToPYfOv9S2EzWvzFJVbt9rn7F6U0IPwC6HP5whATi00eHIVKL9VF9U
         2rU7Xlx4B0KdbYhwJ7xFIle8C2LeJFaJ5XX+mPqM5i5VI4sRqVaUNkoIWkvTQvOb30aN
         EFgrvF9sjlbu4DsSGbT9kgRvJq/6hh75nt2k7whvZoOdfDMtpCXuhbomX/3g+zqJ7nYm
         YWkaBALeDRnguaIW7g0MEiRIzo5dK97L7L288V31bOJIlypK4RhREDT9BtbMluf0SfPR
         Xb53eVewrvTVKYXjfcJ/tZ6+h/UmC+RSQzvzqDctBWk3nm8Jf6iNnVNjO8oRoDtvgB+v
         ZdqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ej64xMS8kGq5PBAWKWEJuwz7p+48gcc+V/GA+vPZ96I=;
        fh=QvFtGwtOYRJTkkARmL5RX/TbutJvzyaOVAQVdwaI75s=;
        b=cRtJLG9TCncZPQKGxBFwr+p8Agg1M0o94o5Z8LenxIW/jAKPYr3oOpo1SqWWkH/2Y7
         hqN3Q4taUgtvZQIot09+QzruzULjLSLmfj5HpslRJyjv6ecwy+FnDqEyNEQRJz7OV1j+
         AcouACcPFNIPQS95gGmt3Uvnfk7TTpBLHjYJNZ92C9HmcraeBuqBpmVNWV6N3t7SM7ag
         l+SBuiEg1Sm6h48SC3CnqAbgxd6LL9DiKOdguQkxYKymvOKTq7Q6HictvCYptMlHc6Qz
         Mer7LBCcGNtrbb2IXFtA92EseIOXpZlqnwT6sUIMG4z0FZDIP2iFCJ7265c/ZobHclvq
         +QKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793673198; x=1794277998; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ej64xMS8kGq5PBAWKWEJuwz7p+48gcc+V/GA+vPZ96I=;
        b=aP7uz2OmRA366Y7n9msqhOyDzDPafOc6NuaJIHe8CPpvpEwOFC78yoDGFWKW3ICX7b
         UEOXjcWGjsaAxyyNh+sXS0qnsgRINxK2wvhAsFC8Ewgr5INKEFWrgAy2bSbTSwpc65M2
         ghVtal0Tp74sHWEZ75IvZgr2K3Pns830Y1rCeN9hbYPFAYdk7rJe56GOrLi6JBnDS8wf
         KiZmhwBi2Fweh/etFynSmiXKzedaE5lymgHnFHIg4H7VSo5dvDeA3kyAZzY60aZVJGXX
         2oyp4laWZ584nHI+Cw+/8nYG4Q9Blhy3rkZuPeww2ldQnT0GSgsuRO3BLUjlBy+ffimQ
         /FEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793673198; x=1794277998;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ej64xMS8kGq5PBAWKWEJuwz7p+48gcc+V/GA+vPZ96I=;
        b=bRYOR9IibWdrRk0xXWkYT9NGGLK2ruACFnyRH8NeVvBw48aenwi+Na4zwcaPFJK95t
         XTYvbRpGtqh/Kbe7rlPg+POCr4rg2x0uNT3I0UYt4KA4N/WnZ7tCKqg0L2IByJCYAibG
         l/PYPzfDMrX1kRakyjsUrGzyGZHQMSNAWQyPzTBe+kcJ9nJZYrGXd7LCW+57MKiC1Ucq
         yK8wqBsHDLckB9vskcHvXkjpO1YZ8JbNNMC5Gom9kC11ECyk7/VtX88p2G38hYsh3vm6
         UYpVdvKmXRirYb2JD+X7TuDaF4H41xFfXytWB0FxZCtyQf5yAG/8z7/n3b0e89QPUbUa
         Bayw==
X-Forwarded-Encrypted: i=1; AKwUvBybUfSnfuntXYuW28JqWsPaCOKQks9Dqc9Rzz9z6Vo5klRUBSGMvfvKFzbZQ04tg3vZNbvR8caR3/TUQ5fAWBE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+guy7e4PorqlV7xxlehGwm0TME2dECaqnz4AspAoNEYNVJCUss
	bqcvJkh6J+FyoX37N0t1yfIw6YHlh/1fgzz3YM3nuYPOskD+cU3kJdp97uwWSisnvn10DulyHs5
	qW409Qk8hgsf6hvLCjf2z/Bgt2mN6L+uMp11c47w5
X-Gm-Gg: AYBFou20Zck7d3fzZdqGqb/Jblr3ic8P2caDr/9fX+8ds7mN65YUchpZ8XNmPFh4nv2
	LkZffmKsx2zWWAGr7xUQgEoSf/3OO24CYcoLDGvYLNRTMup6qt6KloGbbH0hltgOnuCj1sUT09Y
	m2nfpXvpw+FisbByNuKHkpwO/e+agLPm/Raq/WOfAwg1EKhBoxq5/oVrYv6U1zgL2CSEfu8FxPO
	az81OfAulCMEEvtIkKOKp/po+BFEQMeEY9QoVDiwt1ltrot61KXs4ScrBUJNu11SKKWkJuwTwfJ
	AyLtAPziizxJyVRq5g2nG3OyGLnZORfYPXTUQ/RRnG2WPNXGWU5FrdhMQ5mRPMctZTxtw3xXArj
	8AHWdsaSh07OkihgdAWhyyPu4OhsBdR4HWNKHkuc=
X-Received: by 2002:a05:6402:312c:b0:6b4:597f:50ed with SMTP id
 4fb4d7f45d1cf-6b539d10cc7mr27911a12.5.1793673197149; Mon, 02 Nov 2026
 18:33:17 -0800 (PST)
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
 <CAHS8izMRtaL=kZaM29XQBodT8e+srppnK_DjNSTJnxFfNgG9aw@mail.gmail.com> <aukcZBLBir_91hPr@devvm16445.scu0.facebook.com>
In-Reply-To: <aukcZBLBir_91hPr@devvm16445.scu0.facebook.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 2 Nov 2026 18:33:05 -0800
X-Gm-Features: AclHuK821CTY_RbKAnEbXzfa7MUQLlmGp2kVuevnXDs5zsd5kldlK8Q3AHE6hIM
Message-ID: <CAHS8izMSpG-ng8WFi6K5oAuJP=Jq=vuxshuktObe3AM_iJRgvg@mail.gmail.com>
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

On Mon, Nov 2, 2026 at 3:38=E2=80=AFPM Stanislav Fomichev <sdf.kernel@gmail=
.com> wrote:
>
> On 11/02, Mina Almasry wrote:
> > On Mon, Nov 2, 2026 at 11:14=E2=80=AFAM Stanislav Fomichev <sdf.kernel@=
gmail.com> wrote:
> > >
> > > PAGE_SIZE TX net_iovs cap devmem skbs at MAX_SKB_FRAGS pages (~68KB),
> > > which makes BIG TCP ineffective.
> > >
> > > TX net_iovs only need to be DMA contiguous. Use the largest power of =
2,
> > > up to 2MB, which aligns every DMA segment of the dmabuf:
> > > - 2MB hugepage-backed udmabufs get 2MB net_iovs
> > > - no UAPI change, TX addresses are dmabuf offsets
> > > - skbs are still bounded by TCP's size_goal, only frags get larger
> > >
> > > Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
> > > ---
> > >  net/core/devmem.c      | 28 ++++++++++++++++++++++++++--
> > >  net/core/netdev-genl.c |  2 +-
> > >  2 files changed, 27 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/net/core/devmem.c b/net/core/devmem.c
> > > index 19c039ed2cb2..98c9594dbf99 100644
> > > --- a/net/core/devmem.c
> > > +++ b/net/core/devmem.c
> > > @@ -181,6 +181,20 @@ int net_devmem_bind_dmabuf_to_queue(struct net_d=
evice *dev, u32 rxq_idx,
> > >         return err;
> > >  }
> > >
> > > +static bool net_devmem_sgt_aligned(struct sg_table *sgt, size_t size=
)
> > > +{
> > > +       struct scatterlist *sg;
> > > +       unsigned int i;
> > > +
> > > +       for_each_sgtable_dma_sg(sgt, sg, i) {
> > > +               if (!IS_ALIGNED(sg_dma_address(sg), size) ||
> > > +                   !IS_ALIGNED(sg_dma_len(sg), size))
> > > +                       return false;
> > > +       }
> > > +       return true;
> > > +}
> > > +
> > > +/* niov_shift =3D=3D 0 picks the net_iov size from the dmabuf, TX on=
ly */
> > >  struct net_devmem_dmabuf_binding *
> > >  net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
> > >                        struct device *dma_dev,
> > > @@ -191,11 +205,11 @@ net_devmem_bind_dmabuf(struct net_device *dev, =
void *vdev,
> > >                        struct netlink_ext_ack *extack)
> > >  {
> > >         struct net_devmem_dmabuf_binding *binding;
> > > -       size_t niov_size =3D 1UL << niov_shift;
> > >         static u32 id_alloc_next;
> > >         struct scatterlist *sg;
> > >         struct dma_buf *dmabuf;
> > >         unsigned int sg_idx;
> > > +       size_t niov_size;
> > >         size_t niov_idx;
> > >         size_t i;
> > >         long err;
> > > @@ -221,7 +235,6 @@ net_devmem_bind_dmabuf(struct net_device *dev, vo=
id *vdev,
> > >         binding->tx_max_frag_size =3D dev->netmem_tx_max_frag_size;
> > >         write_pnet(&binding->net, sock_net(nl_sk));
> > >         binding->uid =3D sk_uid(nl_sk);
> > > -       binding->niov_shift =3D niov_shift;
> > >         xa_init_flags(&binding->bound_rxqs, XA_FLAGS_ALLOC);
> > >
> > >         err =3D percpu_ref_init(&binding->ref,
> > > @@ -266,6 +279,17 @@ net_devmem_bind_dmabuf(struct net_device *dev, v=
oid *vdev,
> > >                 goto err_unmap;
> > >         }
> > >
> > > +       if (!niov_shift) {
> > > +               niov_size =3D SZ_2M;
> > > +               while (niov_size > PAGE_SIZE &&
> > > +                      (!IS_ALIGNED(dmabuf->size, niov_size) ||
> > > +                       !net_devmem_sgt_aligned(binding->sgt, niov_si=
ze)))
> > > +                       niov_size /=3D 2;
> > > +               niov_shift =3D ilog2(niov_size);
> > > +       }
> > > +       binding->niov_shift =3D niov_shift;
> > > +       niov_size =3D 1UL << niov_shift;
> > > +
> >
> > How come we're not checknig the largest supported size of the netdev he=
re?
> >
> > Also, maybe should clarify in the cl with the largest supported size,
> > is it actually only powers of 2 up to that power of 2? Or all sizes up
> > to that (not-necassirly) power of 2 size?
>
> I think these are a bit orthogonal, no? We can have niovs larger than
> the HW can tx. If that's the case, we'll just sub-divide when we build
> the skb. If we limit to the same chunk the device can handle here,
> we might use 2 frags to send single chunk worth of data more often (offse=
t
> doesn't have to be aligned to the chunk size).
>
>
> Assuming device can only send 16K, current patch:
>
> [       2MB        ] 2BM niov
>      [ 16K ]         sending 16K from that 2MB will use one chunk
>
>
> Limiting chunks to device's chunk size:
>
> [ 16K ][ 16K ]       16K niov
>     [ 16K ]          sending 16K from offset 8K will have to use 2 frags
>
> (obviously, the same thing can happen with 2MB chunks, but less often)
>
> LMK if it does not sound convincing.

Ah, I see, the skb gets segmented somewhere else of course. Derp

Reviewed-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina
