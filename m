Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A5425A354
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Feb 2026 17:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770744368; cv=none; b=jxisoI1fce16HkWDSSdYXA2kyByqf6+KyPvIdPR85BALEgs72fTGj+crVh8hfq8dadtAzHsIxNVaK/icq2edH/KZz7AOmvFp9B4EsYm7Vu2Tzy529yZhlgUrKtIRRBXZXsAcFZqf0Ya6FrB8I0IuSfRGa46RaXAKgFZOIvYyjjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770744368; c=relaxed/simple;
	bh=bGZAvqDxEIu2N9ucVC96wgoTT6pCXw1PIhUB4cBYFnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j6D7J9SQh4LfW6y6Sp34rwFK9sNWM5LI8VgRr5EJAdn5C0kYYkr3jeg5es4VifKvU95+lSylo0FFcOhm0m2jTuBlHPDmEttqr2Yn3vjkSYYtXkvd3fTtU/Mvp0q3XY0lAVsDtxVu0Rxys3DKWEpKrpKI8M9o06GZdGcJ+Bv0GdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AExeIUdW; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tl1ZTJTO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AExeIUdW";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tl1ZTJTO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770744366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M6SXb5IczZILKvt9qVo3/THUDjn6esbNCNc+i/3NT+A=;
	b=AExeIUdWVlLw5oAW5HIUUvp9EIbn7CFrocDAwLNxOOsDx7OD8is5mBMN2+Tr4E9iQw9w+i
	ld7lQZgYTCQWPL8DaOe/Ge4vwqErLZ7i7Uwrt/NbeXY0ECdj4k5LOoQYaxspJtpe4pn6a1
	bOsFa7MFmCw0v5TYzsAHtu7n0euREXo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-MXupq6nPMe--94iKa6z75A-1; Tue, 10 Feb 2026 12:26:04 -0500
X-MC-Unique: MXupq6nPMe--94iKa6z75A-1
X-Mimecast-MFC-AGG-ID: MXupq6nPMe--94iKa6z75A_1770744363
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-43768e2aa4dso2482455f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Feb 2026 09:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770744363; x=1771349163; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M6SXb5IczZILKvt9qVo3/THUDjn6esbNCNc+i/3NT+A=;
        b=tl1ZTJTOg45iq6VrG0u5VwUFL4YNzUWIYDH3vVn8XghxoTq8Djq1qV9MRvHfxOIa4z
         dqZq5eJVgTL8NmKcM1ELVl6g/a67bKKZ5680EPiGYR39W/g8TXJrQpLOWMJ+xnB8/jNr
         XsnK++MDByMpI3EhFo7yG61dR8eY3zAcCvuG96mhy229oAX1BEd2HKeYZoxz3ORAujcK
         JATvzC7gJiyfTNwKmWp8tmkq5MG4aaFtmXfVujj9rfYr+A+/L5LaJFFj1IxU98LLml0L
         ZK2fzXy2vKQF3+aR7DDnSw54tTB+vAfidxPDiRdG/EhkIZWA2/BUBnaYgBQHsRlecpkW
         dP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770744363; x=1771349163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M6SXb5IczZILKvt9qVo3/THUDjn6esbNCNc+i/3NT+A=;
        b=S/3TD7TkE85Ktafi0PRk0bdaLyb38uPvh2SGilubT5bTIUspDs2EvNY7lnSjWSVPzK
         OzlDPP1+3s3r0wUq7WT+WWzoTV7R9qZbPOirZie4T0vSmue25RJT5tTDWyHTXcrRL+qP
         FvKKhAUK/ohMhmQbNDn3hxBqcU4qrO7/yPIgyb/RvhiP0y1Hd1rmt1ngoaaN4lank+fK
         ZJv/5xPW6w5VfGXdxTazAf2wPMjLWLku87jaGRR/ZUaC4VyWH+7EFAufrVlTBkAtkByE
         BSqIp8mKkk8M5gfeM56TZFZVLIMLN9NjcBVr6ANouhiKtoOu3HlK2iSSZsvndSxf6wMV
         3Iqg==
X-Forwarded-Encrypted: i=1; AJvYcCXHociVB/jPWEAzXhgIZtKlGFe+gVEucXWU3UfkcxpDJfimLac1Kjoxlq/HpwPVCWOZjv+KzgkS5GNZT/i+HBE=@vger.kernel.org
X-Gm-Message-State: AOJu0YySjPuJi3VadSJkt3hUUWr3cE6QZlwgGraesJQFNn0uwOHOwYPp
	8UXA/SslX7zgerr5ZD+BvgeEAGCZsYvybrZ8jSKe868g49fcmvpErzQl2lt+sxok6h7YLvz4lB0
	JnbokhTf0vf0RxZ1ScfkbSR7KHV1yWBG1SoV8xLnjSZ50xIxFwfptCRvQlUbDGgloR6OUxg==
X-Gm-Gg: AZuq6aKFHfPABEc/Xca4ekj9pU/mo5Xy4xd5BiRUpRFcjRLkCFKCriw0wmwskmUVYfT
	gNCdGAsO5AXoTh9q+bXR4SWsPhXCxon1UHWozoEFPRDgxo8Ygv3a7qu7nTNN8nk4Aq1oA7capur
	ZR6RKOtz3Dw+eAcCP9XRMRm+e7tyJH9iIgYGL9Wi8+K56si0wOi4gOpwu2+MbfSzsjaPPTef2oY
	J4HkXQgFmI4zEHygvRwA3qLsZ4NUfIKkBGb+Dausurm9Fl4KXg0BrvdnPUEcwVSwx97HF03wa5X
	ZRNrfeOc13OV+VOHxcEwSkSY+AnXgD5pn2AjsURipdt4dyYzvbjKUn01maIu8MJWJ89qrbHHLD4
	MbkEdv8hVpr1aaa9vaFh4KWUCXpJW1+lQg0CYh5D23w/ovWz9Wr/+B7FzqxZlQjlazYsXbg==
X-Received: by 2002:a05:6000:2287:b0:432:5d73:79a1 with SMTP id ffacd0b85a97d-4377a5a89c5mr4412122f8f.55.1770744363098;
        Tue, 10 Feb 2026 09:26:03 -0800 (PST)
X-Received: by 2002:a05:6000:2287:b0:432:5d73:79a1 with SMTP id ffacd0b85a97d-4377a5a89c5mr4412089f8f.55.1770744362668;
        Tue, 10 Feb 2026 09:26:02 -0800 (PST)
Received: from localhost (net-37-119-153-93.cust.vodafonedsl.it. [37.119.153.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd4a1sm35585372f8f.17.2026.02.10.09.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 09:26:01 -0800 (PST)
Date: Tue, 10 Feb 2026 18:26:01 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: Stanislav Fomichev <stfomichev@gmail.com>
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	KP Singh <kpsingh@kernel.org>, Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	netdev@vger.kernel.org, bpf@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC bpf-next v2 1/5] netlink: specs: Add XDP RX checksum
 capability to XDP metadata specs
Message-ID: <aYtqKfv0F0l2-hgy@lore-desk>
References: <20250925-bpf-xdp-meta-rxcksum-v2-0-6b3fe987ce91@kernel.org>
 <20250925-bpf-xdp-meta-rxcksum-v2-1-6b3fe987ce91@kernel.org>
 <aNYUqdaIJV1cvFCb@mini-arch>
 <e03d6d69-73ea-46dc-b632-149ef5831f85@kernel.org>
 <aNcZdfCivLR2slFw@mini-arch>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Kbaeu9Ugo55vjxdy"
Content-Disposition: inline
In-Reply-To: <aNcZdfCivLR2slFw@mini-arch>


--Kbaeu9Ugo55vjxdy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On 09/26, Jesper Dangaard Brouer wrote:
> >=20
> >=20
> > On 26/09/2025 06.20, Stanislav Fomichev wrote:
> > > On 09/25, Lorenzo Bianconi wrote:
> > > > Introduce XDP RX checksum capability to XDP metadata specs. XDP RX
> > > > checksum will be use by devices capable of exposing receive checksum
> > > > result via bpf_xdp_metadata_rx_checksum().
> > > > Moreover, introduce xmo_rx_checksum netdev callback in order allow =
the
> > > > eBPF program bounded to the device to retrieve the RX checksum resu=
lt
> > > > computed by the hw NIC.
> > > >=20
> > > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > > ---
> > > >   Documentation/netlink/specs/netdev.yaml |  5 +++++
> > > >   include/net/xdp.h                       | 14 ++++++++++++++
> > > >   net/core/xdp.c                          | 29 ++++++++++++++++++++=
+++++++++
> > > >   3 files changed, 48 insertions(+)
> > > >=20
> > > > diff --git a/Documentation/netlink/specs/netdev.yaml b/Documentatio=
n/netlink/specs/netdev.yaml
> > > > index e00d3fa1c152d7165e9485d6d383a2cc9cef7cfd..00699bf4a7fdb67c6b9=
ee3548098b0c933fd39a4 100644
> > > > --- a/Documentation/netlink/specs/netdev.yaml
> > > > +++ b/Documentation/netlink/specs/netdev.yaml
> > > > @@ -61,6 +61,11 @@ definitions:
> > > >           doc: |
> > > >             Device is capable of exposing receive packet VLAN tag v=
ia
> > > >             bpf_xdp_metadata_rx_vlan_tag().
> > > > +      -
> > > > +        name: checksum
> > > > +        doc: |
> > > > +          Device is capable of exposing receive checksum result via
> > > > +          bpf_xdp_metadata_rx_checksum().
> > > >     -
> > > >       type: flags
> > > >       name: xsk-flags
> > > > diff --git a/include/net/xdp.h b/include/net/xdp.h
> > > > index aa742f413c358575396530879af4570dc3fc18de..9ab9ac10ae2074b7061=
8a9d4f32544d8b9a30b63 100644
> > > > --- a/include/net/xdp.h
> > > > +++ b/include/net/xdp.h
> > > > @@ -586,6 +586,10 @@ void xdp_attachment_setup(struct xdp_attachmen=
t_info *info,
> > > >   			   NETDEV_XDP_RX_METADATA_VLAN_TAG, \
> > > >   			   bpf_xdp_metadata_rx_vlan_tag, \
> > > >   			   xmo_rx_vlan_tag) \
> > > > +	XDP_METADATA_KFUNC(XDP_METADATA_KFUNC_RX_CHECKSUM, \
> > > > +			   NETDEV_XDP_RX_METADATA_CHECKSUM, \
> > > > +			   bpf_xdp_metadata_rx_checksum, \
> > > > +			   xmo_rx_checksum)
> > > >   enum xdp_rx_metadata {
> > > >   #define XDP_METADATA_KFUNC(name, _, __, ___) name,
> > > > @@ -643,12 +647,22 @@ enum xdp_rss_hash_type {
> > > >   	XDP_RSS_TYPE_L4_IPV6_SCTP_EX =3D XDP_RSS_TYPE_L4_IPV6_SCTP | XDP=
_RSS_L3_DYNHDR,
> > > >   };
> > > > +enum xdp_checksum {
> > > > +	XDP_CHECKSUM_NONE		=3D CHECKSUM_NONE,
> > > > +	XDP_CHECKSUM_UNNECESSARY	=3D CHECKSUM_UNNECESSARY,
> > > > +	XDP_CHECKSUM_COMPLETE		=3D CHECKSUM_COMPLETE,
> > > > +	XDP_CHECKSUM_PARTIAL		=3D CHECKSUM_PARTIAL,
> > > > +};
> > >=20
> > > Btw, might be worth mentioning, awhile ago we had settled on a smalle=
r set of
> > > exposed types:
> > >=20
> > > https://lore.kernel.org/netdev/20230811161509.19722-13-larysa.zaremba=
@intel.com/
> > >=20
> > > Maybe go through the previous postings and check if the arguments are
> > > still relevant? (or explain why we want more checksum now)
> >=20
> > IHMO the linked proposal reduced the types too much.
>=20
> IIRC, PARTIAL was removed because it's mostly (or only) a TX feature?
> So no real need to expose it as an rx hint. And I think empty xdp_csum_st=
atus
> in that proposal might have indicated NONE?

Sorry for the (very) late reply. According to [0] CHECKSUM_PARTIAL can be u=
sed
even on Rx side, right?

Regards,
Lorenzo

[0] https://github.com/torvalds/linux/blob/master/include/linux/skbuff.h#L1=
48

>=20

--Kbaeu9Ugo55vjxdy
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaYtqKAAKCRA6cBh0uS2t
rFNfAP9IZ4RIoXiTgNfqdm61xXJO8X8DZttEjYppOw1iHdPLUAEAtTMcYDTh8p0A
ZFsUX/AZUM9EY7k2Fd9cdM0dbkaAKg8=
=ofYP
-----END PGP SIGNATURE-----

--Kbaeu9Ugo55vjxdy--

