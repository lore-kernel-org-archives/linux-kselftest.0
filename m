Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646F636655D
	for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 10:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787567490; cv=none; b=fc3/kEFdkJrEIN3IgnNWgcLXHJn4D/q+1mNVEf1+CyAympozASz6jx0GPcpC5ZCTc+yXScqbxxvaQTfox4SpJQmwVv6OZzlmXseULvE5clwPcFtHKZbYQ7wmYUK5sXEM68mSffrd502cGwccvmxYPiwrTq09Ks/200UB4t/8CTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787567490; c=relaxed/simple;
	bh=LHsuwi5wr8Wn/lWzmx79XyU/0DpMMKJs2KNquDLlIKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u99RGnZwFT2O1DJyMB1p1Jn9KChmuJly1s7VpJ16N678fTaNDDwYMPGvapfOlh9YebR3QD/3Z7Sw5nnpZ2rDyfItA4rJNIZY+K458uilMF+hUm/VlGfjjwMWLohI9m5t5j+xUkDi7FLIkyaxy1Tr3NKJl9BgZqxov5wyJ9NxY+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eU7IMq+h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RDACqO1j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eU7IMq+h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RDACqO1j"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O99Buf2082056
	for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 10:31:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HlvDuI9BkqCNqqwLhQdUP/gB
	QLcwTMgLu7ompPtRaSA=; b=eU7IMq+hyKffrNtpZvme5OIjUhncrC13GDVaQdY1
	0OX0CNGD6jlN0I0QgtoJcpjdW0OcQGqeAs+Z2IXHUmXF+z7re8HII2gX5t53o1Xz
	zZ6MUPluHTx15H6SUwCag169FkhVoGxbSf+/w8tm0iLJ+Ok/kyuQwepS7G/n82vN
	MZgyxAUiiHFFdfxOiG86a3ExLG09aNehpb6mb8+zGXAQbHd+sjHYjxnuxy2niet4
	2ESwQbTNOnh8Ht2lr6KUxdcAONc12QfgMgm5yTefsaKNcCvy8W0om0eifx+a3d3K
	P7NoRU/U4CKMOspwdR4tMhRDV+xYVIt7GpeYazGiv0N/FQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gdsh65f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 10:31:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5174a23afcbso47050411cf.3
        for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 03:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787567485; x=1788172285; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HlvDuI9BkqCNqqwLhQdUP/gBQLcwTMgLu7ompPtRaSA=;
        b=RDACqO1jn9R/RNBbvbkpD92h2gwVonqTQ6IzBHZHWA2BGilcmCCisWs3oKDjBkEXbY
         3q7+zeAypJnPb9mW6xTKWzKJjNQcI22Lorpvn1p/vR98zebhWwTqeN4Wpuc61VShtYsH
         g/pjrWSapcnkvxOe2TQNzM3UkaEHzFIYtBMu5ZhJhbW6XLqv5J5qH+ItEeGh889lxd8t
         rQN7BTPcxXIt/z9nAe3/W5pXii3KW4L83FFeGvQ2YtvyCGOGLJIBi8EXgq7zWq8hvelS
         cyyT8lewlFKCFwXcfcbnSJkg5u59Dhu5gnrN6D3kALFCC839kQcv6bSHHvqOsQZ6Bqa2
         wk4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787567485; x=1788172285;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HlvDuI9BkqCNqqwLhQdUP/gBQLcwTMgLu7ompPtRaSA=;
        b=WIdSquqE5qsfeCTWnUtX8e98owULOXVG16AHTq6ZXzD1PU4obimevlXrrUx9jqRWSu
         z6yHqSjGbD9k7sKmdHTqAaR8AcBuZZaopWikdD2znk4mpQw72ockNLYHkox1zPqAKUgR
         NXHmyfpGbDpqYZ99LPgsDrY9sTmUVHLAjFNb8EJILgtapi9AcoUVsj7jDsjwGIMa8Npi
         ZrDbmOwIUWxP3I5fAkl3W7pOXWQgGwazXSwSWrN4BpgupbWFzJFuV745m+5ZRQl5mr7m
         BM9fos89gZsrcfSmOM+i239od/B1BWoWmvYXNUsQZlZQw2NinMzLWf68cqIOwhPFYEAj
         5I4Q==
X-Forwarded-Encrypted: i=1; AHgh+RpHqTjyTcWn0hNtnLnYpy/A38zk97REG4R1suYEOFXxkhbqFpdiDrK7FIw4BFWhdF4v/FYRSct9jDYYJ6zABz0=@vger.kernel.org
X-Gm-Message-State: AFuF++lGabIp/77FKbGfV6fsjK87h0FwDtGYHQI5nRBC9fCwzaIgHrkM
	M12ufv6yv25aM88bLXzSeS8s7SMEu39L+nVGZ388rxs0mO3OFNNc52ITtJypo8snRddoFPaFenT
	9/9Rf+N+Xw2I31KRaxbk2rzyLTf2Zdzpuc7+QQ0/5Tu/6GcXdIZhKeGENVRSUPBjtCiuKjkg=
X-Gm-Gg: AR+sD11z9dvi4aliP5eoQlwU7Gm7EX0epaeB58KzIXFi39go5j1cnNr2P1mJBYuSIF7
	hnxUSSYj3L7/IYXlUdJLHLUnMseNQ1xxY32E87dbRm1pxkC3FwXjwozQUh1hQekseqXg/toc5T2
	mw2Z0yIQjBXyI15Xtvk6txzovTJSx9BzRKdvjfrifdKmzFX92ohnfG2YPH50fq7xh3HyLuSev9z
	cMUr9pb3Kbn8s3hqpgCIG+PGyZ8/+eX1hMP0sjscTTmHz4E7zTCkR33x++b2n5oTyrw/3xhxr/d
	Y2jE7CPtin2vJcyh+9tjpalUHA4BQCKumTmqfKoUuemtylXwtydaejaSK6N8yu79K8V1rxmfrE+
	E543VZChJPoCfcek=
X-Received: by 2002:a05:622a:1f96:b0:52d:9637:554c with SMTP id d75a77b69052e-52df5bc7960mr268634951cf.43.1787567484585;
        Mon, 24 Aug 2026 03:31:24 -0700 (PDT)
X-Received: by 2002:a05:622a:1f96:b0:52d:9637:554c with SMTP id d75a77b69052e-52df5bc7960mr268634011cf.43.1787567483987;
        Mon, 24 Aug 2026 03:31:23 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24d6f203acsm166444066b.24.2026.08.24.03.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 03:31:23 -0700 (PDT)
Date: Mon, 24 Aug 2026 12:31:22 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: bpf@vger.kernel.org, netdev@vger.kernel.org,
        syzbot+237bbeed8dfe0699b7f5@syzkaller.appspotmail.com,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Stanislav Fomichev <sdf@fomichev.me>, Simon Horman <horms@kernel.org>,
        Martin KaFai Lau <martin.lau@linux.dev>,
        Andrii Nakryiko <andrii@kernel.org>,
        Eduard Zingerman <eddyz87@gmail.com>,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>,
        Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
        Emil Tsalapatis <emil@etsalapatis.com>,
        Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>,
        Kuniyuki Iwashima <kuniyu@google.com>,
        Hangbin Liu <liuhangbin@gmail.com>, Krishna Kumar <krikku@gmail.com>,
        Martin Karsten <mkarsten@uwaterloo.ca>,
        Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf v2 1/2] bpf, veth: xdp: fix page_pool page leak on
 skb-backed XDP
Message-ID: <aowdem3KQVfvocE7@lore-desk>
References: <20260824030257.263179-1-jiayuan.chen@linux.dev>
 <20260824030705.266049-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="upSIBUhSliXFFaM1"
Content-Disposition: inline
In-Reply-To: <20260824030705.266049-1-jiayuan.chen@linux.dev>
X-Proofpoint-GUID: 4zJDCQqzoJLLU0nvCx2mSoie_vTdlG6h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA4NyBTYWx0ZWRfXw+LjDK9+YQT+
 YT3grB3ArjEy1FmDHL/DwxclUsdvQu7dM9ikwNf5cfs3CyclfheuLGJXOWYtggn4lueyzStxbNN
 NDH16TPu6WAIrbvjTp56KLYsIz9x7C6P8HIv5oPUTyEmaqinDMxHe8GmqdbrA5++n1wyoC3w/JV
 eJNMQBzzg5T6l4hnkRAeahF9vaStqZoI4O66qmDv0pP4gSFvbVc1EESIff86DemV6Sf6T15TqBo
 LjQf1eYCSLGjzMaHZdCBv4ZgZBWhIE+7RhHA/pHd9Z8uP3mEdtMeLEHXgfCYpLQOVY97y0vFu+e
 rM6OgotPJhjhE3Yq8uMMIi3LD60/tzJ0kFQfoxI6zQofdayttX8RfC1ZT4QtyIbLE+13w9cGMRN
 3vfqfxvyq+rMfXA8RBV1eDQ3YHrrh1XSDOrFeZb1So41cQ2WaD6vNUeo8tmIblsgWFi9PNw50Sw
 PkkG8Axfm3y4D3NvkIg==
X-Authority-Analysis: v=2.4 cv=Fqo1OWrq c=1 sm=1 tr=0 ts=6a8c1d7d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=edf1wS77AAAA:8
 a=hSkVLCK3AAAA:8 a=McGmopZ3JXA0FyUL-jwA:9 a=CjuIK1q_8ugA:10
 a=kVLQuquJ2CynHSLU3hYA:9 a=a_PwQJl-kcHnX1M80qC6:22 a=DcSpbTIhAlouE1Uv7lRv:22
 a=cQPPKAXgyycSBL8etih5:22
X-Proofpoint-ORIG-GUID: 4zJDCQqzoJLLU0nvCx2mSoie_vTdlG6h
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA4NyBTYWx0ZWRfXyN3crNVkzPoH
 8kyAHeDfqHhVtf8Jcg1/X6b6k0E8YyOv97PT8/2dxsJUqAEbgqrIPf9lXyUIjE2Kst9YsbxsRM6
 rgVFAqdyKc6H0ib/ZuemJ7nUkxPL5dw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240087

--upSIBUhSliXFFaM1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> bpf_xdp_shrink_data() frees a released frag via __xdp_return() using
> xdp->rxq->mem.type, but that type is wrong for skb-backed XDP: the skb is
> cow'd into page_pool memory while the rxq still says MEM_TYPE_PAGE_SHARED,
> so the page_pool page is freed with page_frag_free() and we hit
> "Bad page state ... page_pool leak".
>=20
> Both generic XDP and veth are affected. A non-linear skb is cow'd into
> page_pool memory (skb_cow_data_for_xdp() -> skb_pp_cow_data() for generic
> XDP, veth_convert_skb_to_xdp_buff() for veth), so its frags become
> page_pool pages while the rxq keeps MEM_TYPE_PAGE_SHARED.
>=20
> We can't just fix rxq->mem.type in place:
> - generic XDP: xdp->rxq is dev->_rx[queue].xdp_rxq (see
>   bpf_prog_run_generic_xdp()), a shared rxq that other CPUs may access in
>   parallel, so we must not write to it.
> - veth: rq->xdp_rxq.mem is shared per-queue state that veth resets on XDP
>   teardown, and with GRO that reset runs without stopping in-flight NAPI,
>   so a type stashed there can be clobbered under a packet still in flight.
>=20
> Adding a check in __xdp_return() or bpf_xdp_shrink_data() itself is not an
> option either: without recording it somewhere, both can only guess the
> frag's memory type, which quickly gets confusing.
>=20
> So record it in the xdp_buff. Add a XDP_FLAGS_FRAGS_PAGE_POOL flag; the t=
wo
> skb-cow sites set it, and bpf_xdp_shrink_data() frees the frag to the
> page_pool when it is set, otherwise it keeps falling back to
> xdp->rxq->mem.type unchanged. No other path changes behaviour.
>=20
> Fixes: e6d5dbdd20aa ("xdp: add multi-buff support for xdp running in gene=
ric mode")
> Fixes: 0ebab78cbcbf ("net: veth: add page_pool for page recycling")

Hi Jiayuan Chen,

thx for fixing it. Can we do something like the patch below instead?

Regards,
Lorenzo

diff --git a/net/core/xdp.c b/net/core/xdp.c
index 1d679e8fd649..4ed659b58141 100644
--- a/net/core/xdp.c
+++ b/net/core/xdp.c
@@ -433,16 +433,16 @@ EXPORT_SYMBOL_GPL(xdp_rxq_info_attach_page_pool);
 void __xdp_return(netmem_ref netmem, enum xdp_mem_type mem_type,
 		  bool napi_direct, struct xdp_buff *xdp)
 {
+	netmem_ref head_netmem =3D netmem_compound_head(netmem);
+	if (netmem_is_pp(head_netmem))
+		mem_type =3D MEM_TYPE_PAGE_POOL;
+
 	switch (mem_type) {
 	case MEM_TYPE_PAGE_POOL:
-		netmem =3D netmem_compound_head(netmem);
 		if (napi_direct && xdp_return_frame_no_direct())
 			napi_direct =3D false;
-		/* No need to check netmem_is_pp() as mem->type knows this a
-		 * page_pool page
-		 */
-		page_pool_put_full_netmem(netmem_get_pp(netmem), netmem,
-					  napi_direct);
+		page_pool_put_full_netmem(netmem_get_pp(head_netmem),
+					  head_netmem, napi_direct);
 		break;
 	case MEM_TYPE_PAGE_SHARED:
 		page_frag_free(__netmem_address(netmem));


> Reported-by: syzbot+237bbeed8dfe0699b7f5@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D237bbeed8dfe0699b7f5
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> ---
>  drivers/net/veth.c |  5 +++++
>  include/net/xdp.h  | 14 ++++++++++++++
>  net/core/dev.c     |  5 +++++
>  net/core/filter.c  |  7 +++++++
>  4 files changed, 31 insertions(+)
>=20
> diff --git a/drivers/net/veth.c b/drivers/net/veth.c
> index 6ed3ee81153f..0afa0661ada1 100644
> --- a/drivers/net/veth.c
> +++ b/drivers/net/veth.c
> @@ -775,6 +775,11 @@ static int veth_convert_skb_to_xdp_buff(struct veth_=
rq *rq,
>  	if (skb_shinfo(skb)->nr_frags) {
>  		skb_shinfo(skb)->xdp_frags_size =3D skb->data_len;
>  		xdp_buff_set_frags_flag(xdp);
> +		/* A nonlinear skb was cow'd into rq->page_pool above, so the
> +		 * frags must be freed to that pool, not via the rxq's
> +		 * MEM_TYPE_PAGE_SHARED.
> +		 */
> +		xdp_buff_set_frag_pp(xdp);
>  	} else {
>  		xdp_buff_clear_frags_flag(xdp);
>  	}
> diff --git a/include/net/xdp.h b/include/net/xdp.h
> index aa742f413c35..b389dc527adc 100644
> --- a/include/net/xdp.h
> +++ b/include/net/xdp.h
> @@ -81,6 +81,10 @@ enum xdp_buff_flags {
>  	 * XDP program is not attached.
>  	 */
>  	XDP_FLAGS_FRAGS_UNREADABLE	=3D BIT(2),
> +	/* frags are page_pool memory even though rxq->mem.type is not: a
> +	 * skb-backed XDP buff (generic XDP, veth) is cow'd into a page_pool.
> +	 */
> +	XDP_FLAGS_FRAGS_PAGE_POOL	=3D BIT(3),
>  };
> =20
>  struct xdp_buff {
> @@ -131,6 +135,16 @@ static __always_inline void xdp_buff_set_frag_unread=
able(struct xdp_buff *xdp)
>  	xdp->flags |=3D XDP_FLAGS_FRAGS_UNREADABLE;
>  }
> =20
> +static __always_inline void xdp_buff_set_frag_pp(struct xdp_buff *xdp)
> +{
> +	xdp->flags |=3D XDP_FLAGS_FRAGS_PAGE_POOL;
> +}
> +
> +static __always_inline bool xdp_buff_is_frag_pp(const struct xdp_buff *x=
dp)
> +{
> +	return !!(xdp->flags & XDP_FLAGS_FRAGS_PAGE_POOL);
> +}
> +
>  static __always_inline u32 xdp_buff_get_skb_flags(const struct xdp_buff =
*xdp)
>  {
>  	return xdp->flags;
> diff --git a/net/core/dev.c b/net/core/dev.c
> index 38336858c168..be36020484b6 100644
> --- a/net/core/dev.c
> +++ b/net/core/dev.c
> @@ -5532,6 +5532,11 @@ u32 bpf_prog_run_generic_xdp(struct sk_buff *skb, =
struct xdp_buff *xdp,
>  	if (skb_is_nonlinear(skb)) {
>  		skb_shinfo(skb)->xdp_frags_size =3D skb->data_len;
>  		xdp_buff_set_frags_flag(xdp);
> +		/* A nonlinear skb was cow'd into page_pool memory by
> +		 * skb_cow_data_for_xdp() before we got here, so the frags must
> +		 * be freed to that pool, not via the rxq's MEM_TYPE_PAGE_SHARED.
> +		 */
> +		xdp_buff_set_frag_pp(xdp);
>  	} else {
>  		xdp_buff_clear_frags_flag(xdp);
>  	}
> diff --git a/net/core/filter.c b/net/core/filter.c
> index 61940e753552..d34ba56d79d8 100644
> --- a/net/core/filter.c
> +++ b/net/core/filter.c
> @@ -4378,6 +4378,13 @@ static bool bpf_xdp_shrink_data(struct xdp_buff *x=
dp, skb_frag_t *frag,
>  	if (mem_type =3D=3D MEM_TYPE_XSK_BUFF_POOL) {
>  		netmem =3D 0;
>  		zc_frag =3D bpf_xdp_shrink_data_zc(xdp, shrink, tail, release);
> +	} else if (xdp_buff_is_frag_pp(xdp)) {
> +		/*
> +		 * Skb-backed XDP (generic XDP, veth) cow's the frags into a
> +		 * page_pool while the rxq stays MEM_TYPE_PAGE_SHARED, so free
> +		 * the frag to the pool, not via page_frag_free().
> +		 */
> +		mem_type =3D MEM_TYPE_PAGE_POOL;
>  	}
> =20
>  	if (release) {
> --=20
> 2.43.0
>=20

--upSIBUhSliXFFaM1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaowdegAKCRA6cBh0uS2t
rJGbAP0TKzr2n3NCwgiDdeslVGC7scK/HYqht13htuRgE0ixHAEAwIsqgO3mN1D9
7ii7J90tRRebrB44+8j3U937MKgYjwQ=
=6sj/
-----END PGP SIGNATURE-----

--upSIBUhSliXFFaM1--
