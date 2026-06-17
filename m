Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD4C39280C
	for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 09:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781689381; cv=none; b=DbyD/T1tTXfpEA9C3giGKgM88zYxdH6ZIHJ28hITcKFSBMA17BeMlxSCchV65KKyef+mQsrk990WkXzRlDc25W3yxY2rx7caTRn13JHFQXoB7bv6f3FWoPG+c0S0wNp8f9C41VSe85+sBf9NT01aXMd+ludzCQ5qzJhjIZINOB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781689381; c=relaxed/simple;
	bh=6dk1V2FkwIjUDraVd9ebLKZ6skrFu0NoYQrzqg9QeDE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LVxNizZBqzKL0CKi+6TMCBTG9dq5Psv4ZFw9aHeo0xGk4FFLMrSzinAGkKyi865Mh8QqBR5xAWvR/2HzJGOK4o0KFDzEyGW64OpXcZWqjBgctz8knKZ/wYnnIDFlnqCPp1WaeRKd7oRdeI3/Oq++v9vKtn7DzzOMkaG0x/TOoOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hIWmu4s9; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ExKhtE1L; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hIWmu4s9";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ExKhtE1L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781689379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ozmBpImS8oeWooI3eg5F7+EjraI/5E3NnIle2PdR8uw=;
	b=hIWmu4s9Rxruex8hxqgHpz9ZxtezH5DE6NhzkCOXv7x4UslDLrRdMoS2+nf1IWYvniSiQu
	KUL4Cj1n0kc6VqV6nZTy+iEDxItCWUPIRLgtuD+slJd4t7Y/eU6UnBBKTJfGV34nwNz64X
	BNS+NZQHi7DA6t/JsyuOyBgrnnMjUyI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-7cxsupzWNUW5Jk6rOff-qg-1; Wed, 17 Jun 2026 05:42:58 -0400
X-MC-Unique: 7cxsupzWNUW5Jk6rOff-qg-1
X-Mimecast-MFC-AGG-ID: 7cxsupzWNUW5Jk6rOff-qg_1781689377
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-490c840efe6so7174565e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 02:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781689377; x=1782294177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ozmBpImS8oeWooI3eg5F7+EjraI/5E3NnIle2PdR8uw=;
        b=ExKhtE1LQVvWuOJR+cmR/EVFSOQuYdEGrodZfVZ0P0/AEM35HQep2W4Jra0kkFagGy
         LRdD9nmY/mlIvtPM8vqcw6eV/WmOfAIi15FcYVp1ELeXhmth3kesItjJW01n0sR3Ja1f
         x3iVpwDU+SIci+9fo6+Oj+t797ibT8PVcHuHPZ1XoWqEoWcMtxiUeoeQjwMdP23WSAHu
         KBRooVSupDi91wmsKJM6r+MYHX/D7pv2GYy+GFzVIzZlKrD/PFYkfgtAhio3v3oE/vdr
         GSS7UkkbgJ6Ivx9av4ceOes3MM/4stPEybdw1NtTmc1DjQb9pahB9jcv54JrpLUrjS8n
         nNqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781689377; x=1782294177;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ozmBpImS8oeWooI3eg5F7+EjraI/5E3NnIle2PdR8uw=;
        b=BMYW3jsEoXsv2G+/GV1Vs81P4M/z8/lOgTCGW4L97SuXHrtvW/8J8KdnpOd6bIEQK0
         HHCr0/fBxC+UtMopgExH2AZKXwzAm52e0DG5b3AX0lDTRw2qloHdn3qynSF6A+yzeiOl
         zhW+RP0JIKWQvVMjqSPiQo9amva1TvaXiL8QG0fJ/s4wfQMN26iwAuxAkSd/qiNidp6H
         M0QfnLI8ZHi2yqgLZUVya4FQOpGHXZxhulUvlV+WmN8vFWv6VsRZi1Hh+6s0eYve/19E
         DZG2elFfucfZEhlurKAxFmH+S93YOG49JuUaUQFJTc84BT064AA72Ys3toVgAxVJ2qAe
         H7zg==
X-Forwarded-Encrypted: i=1; AFNElJ96YH8ggjQU6M9RQUHyThhQTDXaAIcCZ5qFUgGy0vSf9hI3UO1iRDzRRFLc0hEYmYWsk6w1PBwtcGbO9ML41jw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH9vNNEN3MjpXGNau/sJ1Vp+TT7j/nflRPby9aukqWZrVAaqd/
	A2cPa1nKuh6qNZXXBwvYffhygv81GmWvyD4VgA6TFq69XA4wNINgBtzXTERHUdE6S+RJZUvjRWt
	tXoG0KCDpMNDr3DrQgRcfmksrhDvAu/4nKS7jgC1dF856Kean+d4KmaQl87WlmV+rekP4PQ==
X-Gm-Gg: Acq92OFVcNQ/4hcNF6vUT4c/fsgHcw5JnoEMjNL9fUkSexp5MSmoLKtschVeMMk0bxo
	F8h+vQoNFkT203tXpkldTKS7ZQq9F7ZYui8G2VIo0P0rQRy0H4nKJcLk9254O+QksrOmcIQFeNK
	B9Om5rCLpPgeAhra9DyEAW+XjqkoLpMpfkL1+Gr3GuLSLe5yxsSx7Tlq9O68v0gYiVF5K29RghX
	uKUbh++MsYBrm93O9qtsPnLArfbn0x+TSg/C6GUFHk7ct4QW+Pkt1EISWQ3a4sESmcFduqk0rtX
	3UVaFaGB3e7PQq5ywghlgzYXmco7XQKqzf8e9T6JgQ42dR9rUg/uRpDFLcdqKsG2EilCmN5B1hX
	c1eFL37TOE0lmxNNZTHegcUGsYjDHn5+4C5XAOA==
X-Received: by 2002:a05:600c:46cf:b0:490:b4cb:3866 with SMTP id 5b1f17b1804b1-492340e7632mr28942795e9.10.1781689376572;
        Wed, 17 Jun 2026 02:42:56 -0700 (PDT)
X-Received: by 2002:a05:600c:46cf:b0:490:b4cb:3866 with SMTP id 5b1f17b1804b1-492340e7632mr28942185e9.10.1781689375972;
        Wed, 17 Jun 2026 02:42:55 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk (alrua-x1.borgediget.toke.dk. [2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa8b423sm146401065e9.11.2026.06.17.02.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 02:42:55 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id D20C38074C9; Wed, 17 Jun 2026 11:42:53 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Avinash Duduskar <avinash.duduskar@gmail.com>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>
Cc: Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi
 <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa
 <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, John Fastabend
 <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>, Shuah Khan
 <shuah@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, Mykyta
 Yatsenko <yatsenko@meta.com>, Leon Hwang <leon.hwang@linux.dev>, KP Singh
 <kpsingh@kernel.org>, Anton Protopopov <a.s.protopopov@gmail.com>, Amery
 Hung <ameryhung@gmail.com>, Eyal Birger <eyal.birger@gmail.com>, Rong Tao
 <rongtao@cestc.cn>, bpf@vger.kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 3/4] bpf: Add BPF_FIB_LOOKUP_VLAN_INPUT flag
 to bpf_fib_lookup() helper
In-Reply-To: <20260616223426.3568080-4-avinash.duduskar@gmail.com>
References: <20260616223426.3568080-1-avinash.duduskar@gmail.com>
 <20260616223426.3568080-4-avinash.duduskar@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Wed, 17 Jun 2026 11:42:53 +0200
Message-ID: <874ij1h59e.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Avinash Duduskar <avinash.duduskar@gmail.com> writes:

> BPF_FIB_LOOKUP_VLAN resolves a VLAN egress. The reverse is also
> useful: an XDP program receiving a VLAN-tagged frame on a physical
> device wants the lookup to behave as if the packet had arrived on the
> corresponding VLAN subinterface, so iif-based policy routing and VRF
> table selection use the right ingress.
>
> Add BPF_FIB_LOOKUP_VLAN_INPUT. When set, params->h_vlan_proto and
> params->h_vlan_TCI are read as an input VLAN tag and the matching VLAN
> device of params->ifindex is resolved with __vlan_find_dev_deep_rcu().
> The device must be up and in the same network namespace as
> params->ifindex (a VLAN device can be moved to another netns while
> registered on its parent; receive would deliver into that other
> namespace, which a lookup here cannot represent). If params->ifindex
> is itself a VLAN device, its inner (QinQ) subinterface is matched.
> For a bond or team, a tag on a port matches no device and returns
> NOT_FWDED; pass the master's ifindex.
> The lookup then runs with the resolved device as the ingress;
> params->ifindex itself is not modified on the input side. When the
> resolved device is enslaved to a VRF, both the full lookup (via the
> l3mdev rule) and BPF_FIB_LOOKUP_DIRECT (via l3mdev_fib_table_rcu())
> select the VRF's table from the resolved ingress. That follows from
> feeding the resolved device to the flow as the ingress
> (fl4.flowi4_iif =3D dev->ifindex), which is what makes l3mdev resolve
> the VRF master from the subinterface rather than from
> params->ifindex.
>
> The two failure classes get different treatment on purpose. A
> h_vlan_proto other than 802.1Q/802.1ad is API misuse and returns
> -EINVAL, since it would otherwise reach the WARN in vlan_proto_idx()
> with a program-controlled value. An unmatched VID, a device that is
> down, or one in another namespace is a data outcome and returns
> BPF_FIB_LKUP_RET_NOT_FWDED, matching the DIRECT path when
> fib_get_table() finds no table and mirroring real ingress, where the
> receive path drops such frames. A VID of 0 (a priority tag) is looked
> up literally and normally fails the same way; receive instead
> processes such frames untagged, so callers should not set the flag for
> priority tags. Proceeding on the physical device for any of these
> would be fail-open for the policy-routing cases above.
>
> The h_vlan fields share a union with tbid, so the flag cannot be
> combined with BPF_FIB_LOOKUP_TBID. It describes ingress, so it also
> cannot be combined with BPF_FIB_LOOKUP_OUTPUT. Both combinations
> return -EINVAL; restricting now keeps a later relaxation backward
> compatible. Combining with BPF_FIB_LOOKUP_VLAN is allowed: the tag is
> consumed on the ingress side and the egress tag is written on
> success.
>
> Under !CONFIG_VLAN_8021Q the __vlan_find_dev_deep_rcu() stub returns
> NULL, so every lookup with the flag returns NOT_FWDED, which is
> correct since no VLAN device can exist.
>
> Suggested-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>
> Signed-off-by: Avinash Duduskar <avinash.duduskar@gmail.com>
> ---
>  include/uapi/linux/bpf.h       | 34 ++++++++++++++-
>  net/core/filter.c              | 80 +++++++++++++++++++++++++++++++---
>  tools/include/uapi/linux/bpf.h | 34 ++++++++++++++-
>  3 files changed, 141 insertions(+), 7 deletions(-)
>
> diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
> index f77aa9472bf1..57e28da3336a 100644
> --- a/include/uapi/linux/bpf.h
> +++ b/include/uapi/linux/bpf.h
> @@ -3552,6 +3552,35 @@ union bpf_attr {
>   *			reports the route mtu in *params*->mtu_result, and on
>   *			the tc path without tot_len the mtu check runs after
>   *			the swap, against the parent device.
> + *		**BPF_FIB_LOOKUP_VLAN_INPUT**
> + *			Treat *params*->h_vlan_proto and *params*->h_vlan_TCI
> + *			as an input VLAN tag (e.g. parsed from the packet) and
> + *			run the lookup as if ingress had happened on the VLAN
> + *			subinterface carrying that tag for *params*->ifindex,
> + *			rather than on *params*->ifindex itself. The VID is the
> + *			low 12 bits of *params*->h_vlan_TCI;
> + *			*params*->h_vlan_proto must be ETH_P_8021Q or
> + *			ETH_P_8021AD in network byte order (any other value
> + *			returns **-EINVAL**). The
> + *			subinterface is the one configured for that tag on
> + *			*params*->ifindex; if *params*->ifindex is itself a
> + *			VLAN device, its inner (QinQ) subinterface is matched.
> + *			For a bond or team, a tag on a port matches no
> + *			device and returns NOT_FWDED; pass the master's
> + *			ifindex.
> + *			If no matching subinterface exists, or it is not up,
> + *			or it was moved to another network namespace, the
> + *			lookup returns **BPF_FIB_LKUP_RET_NOT_FWDED**,
> + *			mirroring real ingress, which drops a frame whose tag
> + *			is unconfigured or whose VLAN device is down. A VID of
> + *			0 (a priority-tagged frame) is looked up literally like
> + *			any other VID; receive instead processes such frames
> + *			untagged on the device itself, so do not set this flag
> + *			for priority tags.
> + *			Cannot be combined with **BPF_FIB_LOOKUP_TBID** (both
> + *			use the same input fields) or **BPF_FIB_LOOKUP_OUTPUT**
> + *			(this flag is ingress-only); doing so returns
> + *			**-EINVAL**.

This comment is also overly long - please trim.

>   *
>   *		*ctx* is either **struct xdp_md** for XDP programs or
>   *		**struct sk_buff** tc cls_act programs.
> @@ -7348,6 +7377,7 @@ enum {
>  	BPF_FIB_LOOKUP_SRC     =3D (1U << 4),
>  	BPF_FIB_LOOKUP_MARK    =3D (1U << 5),
>  	BPF_FIB_LOOKUP_VLAN    =3D (1U << 6),
> +	BPF_FIB_LOOKUP_VLAN_INPUT =3D (1U << 7),
>  };
>=20=20
>  enum {
> @@ -7416,7 +7446,9 @@ struct bpf_fib_lookup {
>  		struct {
>  			/* output with BPF_FIB_LOOKUP_VLAN: set from the
>  			 * resolved egress VLAN device (see the flag); zeroed
> -			 * on other successful lookups.
> +			 * on other successful lookups. input with
> +			 * BPF_FIB_LOOKUP_VLAN_INPUT: the VLAN tag to scope
> +			 * the lookup by.
>  			 */
>  			__be16	h_vlan_proto;
>  			__be16	h_vlan_TCI;
> diff --git a/net/core/filter.c b/net/core/filter.c
> index b37a12321fba..cfbdd842ce61 100644
> --- a/net/core/filter.c
> +++ b/net/core/filter.c
> @@ -6158,6 +6158,41 @@ static int bpf_fib_set_fwd_params(struct net_devic=
e *dev,
>=20=20
>  	return 0;
>  }
> +
> +/* With BPF_FIB_LOOKUP_VLAN_INPUT the caller passes the packet's VLAN ta=
g in
> + * params->h_vlan_proto and params->h_vlan_TCI; the lookup is done as if
> + * ingress had happened on the matching VLAN subinterface of *dev. Resol=
ve
> + * it and store it in *dev. params is not modified.
> + *
> + * A protocol other than 802.1Q/802.1AD is API misuse (it would otherwise
> + * reach the WARN in vlan_proto_idx()), so it is rejected with -EINVAL. =
An
> + * unmatched VID, a matching device that is down, or one that was moved
> + * to another netns (receive would deliver into that netns' stack, which
> + * a lookup here cannot represent) is a data outcome, reported as
> + * NOT_FWDED, the same way the DIRECT path reports a missing table. Under
> + * !CONFIG_VLAN_8021Q __vlan_find_dev_deep_rcu() returns NULL, so every
> + * call returns NOT_FWDED, which is correct since no subinterface can
> + * exist.
> + */

As in the previous patch, please drop this comment.

> +static int bpf_fib_vlan_input_dev(struct net_device **dev,
> +				  const struct bpf_fib_lookup *params)
> +{

Just return the dev pointer and use ERR_PTR for errors? That's what we
usually do for these kinds of functions.

-Toke

