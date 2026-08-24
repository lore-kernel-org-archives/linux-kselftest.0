Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BB8355819
	for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 14:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787583039; cv=none; b=VD9P/ChyUFKe9n7e96Xve0RKRETd07Fn37yLnJ3S74Ut2l8RPoxEO+90Pu1P9xW9PnsLgeYWalPRfYEZS1A1jOyVYEa/UKs5JiKLb01sbV296RSvNs+jb5dIfTW6QWLyeLvM9OO1lMK36DpajGdGjbIjf7Va+uIx1VtllIsUbeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787583039; c=relaxed/simple;
	bh=I23WUa4D0fxNI60jxg7r3OOEvFfD4AqzaqYsn9xB+Cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tTV5A9ciPuNqfHOQFHK72OTxHWdx1SYBmb9Z7LPl9i3EhapSSyr6Np4k9FNLh11lTUPkNbr6o4vDa3XEU+5TDc1U4lQ+eQMvItLBWzPOWXrenoTsl9uQfahm89WcsWInJAaD0PnKOq5HBzFrydjEPDhoyPLwApju2pmmReJt2CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fmO8zEfi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RVpwQLVR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fmO8zEfi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RVpwQLVR"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OD9IEN3102861
	for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 14:50:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SeHo63Wd/OtGI4cJSscidaJS
	OuY4t/o+zNGeXodUdoU=; b=fmO8zEfitYHqkp1ITpslu0YXOykB5AqV4VMtU52T
	/U4qI2UZsPRvomarLYVFPTg3Jiv523J6kKXEfqrQZlLhj0peTFxBNFnqWnXqmQdp
	T/27xh+pFEnGUzytzHLRKRsisM9ji/OsPZHJvnVE5LsdRO40a3a4eTu0fG8FtHwt
	KFNMwgquT7pqnVLqaZ7oAOD9JYeP6tduTXjA92DOhxjjoZtjB3kRqImz9PWE71BR
	Bg8RGwvoUT0LIg5NWwH0Y3s253X2KwP7cVx37TxAGXFzTBdDA1VbdSx42uZH13aY
	mOWSjZu53sjYsI8hrF18Lgw58Qc+yFAflf9irByW2UBOsg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8pkdgdfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 14:50:35 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7563011591bso278884137.0
        for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 07:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787583035; x=1788187835; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SeHo63Wd/OtGI4cJSscidaJSOuY4t/o+zNGeXodUdoU=;
        b=RVpwQLVRoBYnG6UQeDl5duVcR/xOQyncGejnlxExtGgIEt300WYOy47U7dKZBdmxhw
         swvxDt7wNQn2rwY6Yd1JsZfOILSYmLNDjHqEw4346fCFf+X8hsOfvoPOQDoxQ23npLSG
         V3UQcdouNRu5Uom0edxsr+CvOWdsCaKtVBCFhedTwiaWB4LiUkja5uJlJPReC+ae1pNo
         dVsBT2tPr+x3DZNQBAXpCVBwxcC1KJwfNO+Cjpou+bBP/f7capWICiY9x9HjZKinPwcj
         LER+SotJOsCXmf4XtTq/TiUT+6z95Zv0XIEHZW1UXi77u+uBsyYr/wasfWn6Zx4VtSdT
         hVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787583035; x=1788187835;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SeHo63Wd/OtGI4cJSscidaJSOuY4t/o+zNGeXodUdoU=;
        b=o9xN7wJl51T9y7gkvPPWk8oxedMDlh8P5UASBO4hsLCy46hz5ZMTLu+gP1P24fguYN
         G8uCbeAaRVrqDwVGIp9XXBVzSOt72MXY/tNl+kltEsqMibSm5Zo7cVx/HauuBNB1hpn1
         l6jli0K/V5d6gzIOP9yhO2XH8S6dKWPHO8sD9s53MCh3FVpT37vuLlFPKUpbXh5KCf/u
         Ps4pyahbindr7if9cJOKtNmnge4Ptz49y6fyGtdJ1HubB8uYhaNqhwmChsiq56Lv1esq
         nORFJhQtF6FhUAEnGhGyI6bKKEnQ/3rNYHU3A/LlGI29O4uFjmWrBgEYS8Um8hSV5tVR
         GhRw==
X-Forwarded-Encrypted: i=1; AHgh+RrZKB04HPXzMkKM3TGCSqXCJCNvDrlZj9cNdlyUq8z1IVqkos3WVPQARlzBu0yWnwSfk/+Mj5NnqBKvFcT7waQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nq/UDmiz4DJLjIL+SbJJEOdX0i6HEGTutEYMqHqoBd7+amIoyU
	wyCtuiMpwoElnUwP0I96xScXQsUfhWvaDbvr+C1GG0LqUmLkKjxGJ4efb9OFvPUurLWSdXcRtay
	l2AGPq1DDqXTFljVitFhLdqb68vJahAz9XnO8JSTUfSos6vDeeqkR50mwO7mbnCk4/x1n2oA=
X-Gm-Gg: AR+sD10NCcCpDFOSii+z4vKjIxNjQFcVaqiK/8Qa5wH0tDXuJhcT+b0Ua3zltMb/mtn
	6CHgDMVqbX6ODT0PSssFj5dpN2bvfkPA6Z+QyLoWAApk5vpGIZbks4hMq2HTrxyzIuKpEEWazJz
	o7Ai9J/uwM8DFD2rdkmdE8SIV5570RO+cvpBio+1026WiXPXSAFCBRo2imvdENKih8i0rfk7Mmd
	VEMDNqPuhCutH2hO3H8QaCLrnpTF0r0rdp8z0VggrR7DiYqr+hfdUqK5Zjj6b+6YkSN54reWGqK
	dXhSamxVn5UjtJzp5RZQBjqk72zeLt6yEA42/OqFj4Ptl5BCGx8pqMbuek+Awd5EVzOYE68glkg
	lwobiu0w9dVitcGw=
X-Received: by 2002:a05:6102:442a:b0:779:78ae:9a94 with SMTP id ada2fe7eead31-77bd0ab7564mr5231198137.2.1787583034628;
        Mon, 24 Aug 2026 07:50:34 -0700 (PDT)
X-Received: by 2002:a05:6102:442a:b0:779:78ae:9a94 with SMTP id ada2fe7eead31-77bd0ab7564mr5231190137.2.1787583034123;
        Mon, 24 Aug 2026 07:50:34 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e02a8fbsm13047052a12.13.2026.08.24.07.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 07:50:32 -0700 (PDT)
Date: Mon, 24 Aug 2026 16:50:31 +0200
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
Message-ID: <aoxaNy4ep6ntUyR7@lore-desk>
References: <20260824030257.263179-1-jiayuan.chen@linux.dev>
 <20260824030705.266049-1-jiayuan.chen@linux.dev>
 <aowdem3KQVfvocE7@lore-desk>
 <01fd251d-1134-4251-9c11-79943e367ffe@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tHMPWeVfOj+opxOp"
Content-Disposition: inline
In-Reply-To: <01fd251d-1134-4251-9c11-79943e367ffe@linux.dev>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEyNCBTYWx0ZWRfX8MDINBxTnbe7
 VCbTzcnCNgmpU5QQIDxCE3fpHq4XoZSvNkT5KSeIF/mM0uYmXSAIWs+YXwAgg+juBCx18H9tnDj
 2DSDPWww755f0ytvogTvh1+7YvMnbzs=
X-Proofpoint-ORIG-GUID: sULmyZwh9mVn1uE3YkGmeG7vv6k1VEQl
X-Proofpoint-GUID: sULmyZwh9mVn1uE3YkGmeG7vv6k1VEQl
X-Authority-Analysis: v=2.4 cv=Kq19H2WN c=1 sm=1 tr=0 ts=6a8c5a3b cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=Gt1XUFrZ_eV22qhX_CwA:9
 a=wPNLvfGTeEIA:10 a=iBSP9r1S6SrDrSm2r-sA:9 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEyNCBTYWx0ZWRfX6HyjKwC0D7B4
 p+t9caXOfcmthKQulPcF2maBaiH/v1CQ+eljgGJKSHJWJSqEHPjp5hBVGY4l6z6MUaVryMUmiZD
 yjLkSVbhLSvOrpBIPpxierobfsdomM2c0ez7rocHZLdOLvRFPdybdFF7VQrkkjZ7sqNDOOMZ8zs
 5GvsBMoO/JmeuSN+S2/3+P4I4xImIdT1v0I41N5sxsyyOoqr+gbH2P3FxHJXw01bruRPFTXfEEJ
 bUrz7xREsslMZUARKZ0/CJe98hOioFhh3Bne9ioUjbKxk8E3v4jzLfvOTxEFYHa0xQkQMYnU4D3
 eWRLiyyZ/uM2DVifoJzYMsOwqkGNzPfas789GBqOA6TvmIRiiQfaRmQ9lyFpoHn4oEIt4Vxe2sW
 2zgMVBmYg9M5srCU5HhiBHQ9DqNyAyVIuJmMMnkoTkqVVYtYjbu4Z81UDnDdm5WR1LcfyaWPn3U
 kPe+MDD3/ZAwlsEWnzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240124

--tHMPWeVfOj+opxOp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

>=20
> On 8/24/26 6:31 PM, Lorenzo Bianconi wrote:
> > > bpf_xdp_shrink_data() frees a released frag via __xdp_return() using
> > > xdp->rxq->mem.type, but that type is wrong for skb-backed XDP: the sk=
b is
> > > cow'd into page_pool memory while the rxq still says MEM_TYPE_PAGE_SH=
ARED,
> > > so the page_pool page is freed with page_frag_free() and we hit
> > > "Bad page state ... page_pool leak".
> > >=20
> > > Both generic XDP and veth are affected. A non-linear skb is cow'd into
> > > page_pool memory (skb_cow_data_for_xdp() -> skb_pp_cow_data() for gen=
eric
> > > XDP, veth_convert_skb_to_xdp_buff() for veth), so its frags become
> > > page_pool pages while the rxq keeps MEM_TYPE_PAGE_SHARED.
> > >=20
> > > We can't just fix rxq->mem.type in place:
> > > - generic XDP: xdp->rxq is dev->_rx[queue].xdp_rxq (see
> > >    bpf_prog_run_generic_xdp()), a shared rxq that other CPUs may acce=
ss in
> > >    parallel, so we must not write to it.
> > > - veth: rq->xdp_rxq.mem is shared per-queue state that veth resets on=
 XDP
> > >    teardown, and with GRO that reset runs without stopping in-flight =
NAPI,
> > >    so a type stashed there can be clobbered under a packet still in f=
light.
> > >=20
> > > Adding a check in __xdp_return() or bpf_xdp_shrink_data() itself is n=
ot an
> > > option either: without recording it somewhere, both can only guess the
> > > frag's memory type, which quickly gets confusing.
> > >=20
> > > So record it in the xdp_buff. Add a XDP_FLAGS_FRAGS_PAGE_POOL flag; t=
he two
> > > skb-cow sites set it, and bpf_xdp_shrink_data() frees the frag to the
> > > page_pool when it is set, otherwise it keeps falling back to
> > > xdp->rxq->mem.type unchanged. No other path changes behaviour.
> > >=20
> > > Fixes: e6d5dbdd20aa ("xdp: add multi-buff support for xdp running in =
generic mode")
> > > Fixes: 0ebab78cbcbf ("net: veth: add page_pool for page recycling")
> > Hi Jiayuan Chen,
> >=20
> > thx for fixing it. Can we do something like the patch below instead?
> >=20
> > Regards,
> > Lorenzo
> >=20
> > diff --git a/net/core/xdp.c b/net/core/xdp.c
> > index 1d679e8fd649..4ed659b58141 100644
> > --- a/net/core/xdp.c
> > +++ b/net/core/xdp.c
> > @@ -433,16 +433,16 @@ EXPORT_SYMBOL_GPL(xdp_rxq_info_attach_page_pool);
> >   void __xdp_return(netmem_ref netmem, enum xdp_mem_type mem_type,
> >   		  bool napi_direct, struct xdp_buff *xdp)
> >   {
> > +	netmem_ref head_netmem =3D netmem_compound_head(netmem);
> > +	if (netmem_is_pp(head_netmem))
> > +		mem_type =3D MEM_TYPE_PAGE_POOL;
> > +
> >   	switch (mem_type) {
> >   	case MEM_TYPE_PAGE_POOL:
> > -		netmem =3D netmem_compound_head(netmem);
> >   		if (napi_direct && xdp_return_frame_no_direct())
> >   			napi_direct =3D false;
> > -		/* No need to check netmem_is_pp() as mem->type knows this a
> > -		 * page_pool page
> > -		 */
> > -		page_pool_put_full_netmem(netmem_get_pp(netmem), netmem,
> > -					  napi_direct);
> > +		page_pool_put_full_netmem(netmem_get_pp(head_netmem),
> > +					  head_netmem, napi_direct);
> >   		break;
> >   	case MEM_TYPE_PAGE_SHARED:
> >   		page_frag_free(__netmem_address(netmem));
>=20
>=20
> Hi Lorenzo,
>=20
> I tried this, but it regresses the bpf selftest with a page_pool ref
> underflow (0 warns on master, 45 with the patch):
>=20
> =A0 =A0 WARNING: include/net/page_pool/helpers.h:297 at
> page_pool_alloc_frag_netmem
> =A0 =A0 skb_pp_cow_data
> =A0 =A0 veth_xdp_rcv_skb
>=20
>=20
> On XDP_TX/XDP_REDIRECT veth has to take plain page refs via get_page()
> (veth_xdp_get()) and then
> consume_skb(): the skb itself must be freed while the data pages stay ali=
ve
> for the frame. consume_skb()
> already returns the skb's page_pool ref, so what the frame holds afterwar=
ds
> is a plain page ref, to be
> dropped with page_frag_free().
>=20
> netmem_is_pp() can't see that: it only says the page still belongs to a p=
ool
> (other users may still hold pool refs on the same page),
> not what kind of ref we're dropping. So __xdp_return() turns those plain-=
ref
> drops into a second pool
> put and pp_ref goes negative.
>=20
> That's why I kept the type in the xdp_buff and only override it in the
> shrink path, where we know the
> frag ref is the cow'd page_pool one.
>=20
> Regards,
> Jiayuan
>=20

Right. I can see the point now :). IIUC we are currently able to trigger
the issue just on xdp fragments running bpf_xdp_shrink_data() but the probl=
em
theoretically occurs even for the xdp->data, right? (it is rallocated using=
 the
page_pool in skb_pp_cow_data()). Is it better to always set this new flag w=
hen
the buffers are reallocated via skb_pp_cow_data()? (Maybe renaming it in
something like XDP_FLAGS_DATA_FROM_PP).

Regards,
Lorenzo

--tHMPWeVfOj+opxOp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaoxaNwAKCRA6cBh0uS2t
rCKCAQDseefeWsVXJ0KzuyfbLK9uybyfIa5mbdtdOP4v4YbQcwD/e8Ud3ODbWBdn
JkVwvJpcdcBWjAMTAKcbTSu5+KEhyw8=
=VJ6I
-----END PGP SIGNATURE-----

--tHMPWeVfOj+opxOp--
