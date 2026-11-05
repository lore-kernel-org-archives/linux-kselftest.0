Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887775;
	b=X9twioPOLtY2z+A9+XoieqvaXhoWDvsJytWI8yeF6ZhxkvqzMhPb6GmA9Yc6kgeDM6Kj
	 E+jJmH26VfUoP5xzi1zxqNJXHWtUa0X2Jdkwu15jT67yYTvEk0yJu+eG0mFRpexpB+5gf
	 EdGxJw7lGGLL9vobB7/XDxZXeYGaTRmjWWtGKi/jOEaM3JjluS+fMFbxe6krk1HTr/TOm
	 SfBBpnSRVtyPTdjPNOdC2JoZtaXFOuh6olKUUrxxZTHqRoz/saTHMgCfzMrvlrSLWLi+a
	 sCNti1wC+cVaq9ivO64HueMsKaHuZzuKVKdgtX/QfB3pirEd/M35ta5TWsHIRyZjThw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=jzTzN1xi3wWq3rkQo05baaXe4YaAa7XUzbwyEbAc0TE=;
	b=UF4O0euHPTlMHEBWWBHVQHWq9CdaLFg+T6qjq35vYoXsIdFdG3F3U6zcFr3SkUn4jEi+
	 husaGsj7/2GV54XOARgxW3DkhR4twJxMfzCIBcws16rkXmCoiVK3/qQMIvsVoZVB7LYGu
	 DL9pzt0c8uXg4MkJ6U9o14J+qoYRelYqUJ0/o1VrMDOEUCNUx+xR8rQnqw6mtc6ghT56y
	 MmavGdWYj+0vLJMWQ6XvxllWQK+8t/l92cxDqeMTTgSArJLsviLdc3fhObeTycWz8evyP
	 0t6QLdh6WhR00T8MMw13iLkMb0mEaUUL7Kc8lj6w2xcwPHiSqbhBagQ5IbQCj0cKv1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0cDOXOJ7;
	arc=none smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B081606A32C
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 14:09:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B081606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0cDOXOJ7
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67be5d0e9cbso1474610d50.3
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 06:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793887773; x=1794492573; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jzTzN1xi3wWq3rkQo05baaXe4YaAa7XUzbwyEbAc0TE=;
        b=0cDOXOJ7kU44pN3CSsJC7LBttdhxXbKwXqvZzda7pHXStgvvBzFoKR4rfQ6uRpzano
         LqGpNPg3W+CWu4WnyQkkbdSjRVXu+jvbvdx7LlzpaLxR3UBCncfBpxp7F1bVC1zR+7KP
         tOpqvK21hn3041JvnCXOIHZ1DQ5S6efh+xzD106W6QtWm527wUoE+KbI3Pdx4pboCUeH
         J7c0+EJi+hdBXYKg14ZCJ4Ab8oTgUC5Gw4DUJ4Tani6wz1FCcrxCBb2CybU5Tt8NB3w9
         r7i4x3Fi0TP87AzY+Xgmvr0Itmnv4T5QoEgJdD1/ShixhE8u4yftXQKAkHFGDsmbERx0
         3s4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887773; x=1794492573;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jzTzN1xi3wWq3rkQo05baaXe4YaAa7XUzbwyEbAc0TE=;
        b=JgNbUPAbouZKufHtE3StZ+C9znn2X0qE0g7VcW2Udy8U7IdBJoMaMSng496QoRs2Ot
         r0uX9bfEx8YFRH2iPuTJSPvMrRUMX7r8J4M7R1+o1dbStt1v5wd+dhm5M/5QIp56W//I
         JstejcWWn63fnypVlK/qhZrKj8xDXgaMvIY9enGRvKk3h9WJORdqetuBcRI63GtxNweu
         /gnhArbNmfGIiNmwvjWe5NiCJWlInQQ01tXlFQTIas9AFdOk96kuONSeS0axmvf+sPGW
         /NQ+LD50Rk/pvYER5W0Dr4eT9WmFcZuq6qKuzqbG9MXUs1cwFgrRRueewh0hKx1V3ws+
         lR/A==
X-Forwarded-Encrypted: i=1; AKwUvByqiWRXy+LK400+3GYDC79YuvpxiBDgnZa5jQz+fb5Y7nukRJAHRDX0kzbr3EAPMXwVL0HVbDbNhCznTFXvKfA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EfKZn2j/luLGq6HlmgdfIY3rLH8pEBurqspsBUxwxPhX2Ss3G
	Z/n2n6tgmc0MmGCuryVsHW8BE87ZK4s9rS9JIdfgKi0oNDyfCTWiQS9A
X-Gm-Gg: AYBFou3crNSYoEfnju1eZV+xqKPsioi5k8ZT4YwaZEjZFVrVC9CCiqpC8f4YfSg34E5
	SzQE6TqQmd1GcTieFVQHAouHgFWUf7ePkXKvH2ycouxD3XQQLbhWkKiBem33ZU82Pf2gyoiqsml
	LdD5wFJbnoc/q6J5AD85LpEfFwjpp8jWOnB454ehkQY4vbwJV6WEgSKxmlI3Rob0p7NMcOvhhoE
	UM9cvzaXj5pZh30LcCOtnEYdO/ZVfQ5MtoTI6wF18pQiWWO3zrBBleFZhOSDwORfCiXq5ZKjWdB
	euj2QPosF4H2hy0p3FR0uu7SzY3BYFGiU9lO096iTlJ+WsR7NMUbVwCBXL1XV8BiOMgJhpDwCOJ
	hOe3zKO9TNlVCp133C3h2HcGp/kYiydJuZxY7M5WX8vD48G6IkwRmPv3AnlbdbxCbprZvCUzp42
	l4pT1pegZDP77Zezo9464Ang0tXTKmQzj8zOsXSVMODmli9/wLbf7/y9rf53nE6wU74bZ8vCGJJ
	+AXmb+8Y7Dv/IzNiJIgurai0NJmByHqiyT3CvsZO/i00nzPw056VTB58kXtcIDsj/v+UPykK/cy
	qGmpZq+UkJVoP+zjs3ave7/KN/n9IDRYNQ==
X-Received: by 2002:a05:690e:1444:b0:679:b98d:9b7f with SMTP id 956f58d0204a3-67ba4c82e34mr11758102d50.11.1793887773314;
        Thu, 05 Nov 2026 06:09:33 -0800 (PST)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309712e33sm40372397b3.4.2026.11.05.06.09.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 06:09:32 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Nov 2026 09:09:26 -0500
Message-Id: <DMNC538FF7AS.2JZQJXNEZG6P6@gmail.com>
Cc: "Simon Horman" <horms@kernel.org>, "Jakub Sitnicki"
 <jakub@cloudflare.com>, "Daniel Zahka" <daniel.zahka@gmail.com>, "Willem de
 Bruijn" <willemb@google.com>, <netdev@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>
Subject: Re: [PATCH net v2 1/2] net: Make PSP skb extension survive packet
 scrubbing
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Wei Wang" <weiwan@google.com>, "David S . Miller"
 <davem@davemloft.net>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni"
 <pabeni@redhat.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>, "Shuah Khan"
 <shuah@kernel.org>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261030043145.2185700-1-weiwan@google.com>
 <20261030043145.2185700-2-weiwan@google.com>
In-Reply-To: <20261030043145.2185700-2-weiwan@google.com>

On Fri Oct 30, 2026 at 12:31 AM EDT, Wei Wang wrote:
> skb_scrub_packet() drops all skb extensions unconditionally via
> skb_ext_reset(). It runs on tunnel encap/decap (ip_tunnel_rcv, vxlan_rcv,
> etc.) and virtual device forwarding/redirection (dev_forward_skb,
> netkit_xmit, skb_do_redirect).
>
> When a virtual device such as netkit is associated with a PSP device in
> another network namespace via PSP_CMD_DEV_ASSOC, incoming PSP packets
> decapsulated by psp_dev_rcv() lose their SKB_EXT_PSP extension when
> scrubbed during redirection into the peer netns. Without SKB_EXT_PSP,
> __psp_sk_rx_policy_check() rejects incoming TCP data segments at the
> socket layer with SKB_DROP_REASON_PSP_INPUT.
>
> Introduce a static skb_ext_scrub() helper in net/core/skbuff.c to
> preserve SKB_EXT_PSP across skb_scrub_packet() while dropping all other
> extensions. If SKB_EXT_PSP is not active, skb_ext_scrub() simply calls
> skb_ext_reset(). If SKB_EXT_PSP is the only extension in the skb_ext
> buffer, nothing needs to be scrubbed. Otherwise, save the PSP metadata,
> reset the extension block, and re-add a fresh SKB_EXT_PSP extension (or
> clear skb->decrypted if the allocation fails).
>
> Fixes: 06c2dce2d0f6 ("psp: add new netlink cmd for dev-assoc and dev-disa=
ssoc")
> Link: https://lore.kernel.org/r/20260910-bpf-meta-inside-skb-ext-v2-3-0b2=
1e42180b0@cloudflare.com
> Reported-by: Daniel Zahka <daniel.zahka@gmail.com>
> Closes: https://lore.kernel.org/netdev/DLODSKPY6ON6.1G6SP3CFFLCPJ@gmail.c=
om/
> Co-developed-by: Jakub Sitnicki <jakub@cloudflare.com>
> Signed-off-by: Jakub Sitnicki <jakub@cloudflare.com>
> Signed-off-by: Wei Wang <weiwan@google.com>
> ---
>  net/core/skbuff.c | 31 +++++++++++++++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)
>
> diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> index 93c2f440b9ec..5c4a2e982ebc 100644
> --- a/net/core/skbuff.c
> +++ b/net/core/skbuff.c
> @@ -6369,6 +6369,32 @@ bool skb_try_coalesce(struct sk_buff *to, struct s=
k_buff *from,
>  }
>  EXPORT_SYMBOL(skb_try_coalesce);
> =20
> +static void skb_ext_scrub(struct sk_buff *skb)
> +{
> +#if IS_ENABLED(CONFIG_INET_PSP)
> +	struct psp_skb_ext *pse =3D skb_ext_find(skb, SKB_EXT_PSP);
> +
> +	if (pse) {
> +		struct skb_ext *ext =3D skb->extensions;
> +		struct psp_skb_ext tmp =3D *pse;

I would move the copy just before skb_ext_reset(skb), but it probably
won't make a difference in the generated code.

> +
> +		/* Nothing else to scrub if PSP is the only extension in ext. */
> +		if (ext->chunks =3D=3D SKB_EXT_CHUNKSIZEOF(*ext) +
> +				   skb_ext_type_len[SKB_EXT_PSP])
> +			return;
> +
> +		skb_ext_reset(skb);
> +		pse =3D skb_ext_add(skb, SKB_EXT_PSP);
> +		if (pse)
> +			memcpy(pse, &tmp, sizeof(*pse));
> +		else
> +			skb->decrypted =3D 0;

Agree with sashiko not to clear decrypted. It would at least prevent the
skb from being forwarded cleartext back onto the network.

> +		return;
> +	}
> +#endif
> +	skb_ext_reset(skb);
> +}
> +
>  /**
>   * skb_scrub_packet - scrub an skb
>   *
> @@ -6380,7 +6406,8 @@ EXPORT_SYMBOL(skb_try_coalesce);
>   * operations.
>   * skb_scrub_packet can also be used to clean a skb before injecting it =
in
>   * another namespace (@xnet =3D=3D true). We have to clear all informati=
on in the
> - * skb that could impact namespace isolation.
> + * skb that could impact namespace isolation. Note that PSP skb extensio=
n is
> + * preserved across packet scrubbing by design.
>   */
>  void skb_scrub_packet(struct sk_buff *skb, bool xnet)
>  {
> @@ -6388,7 +6415,7 @@ void skb_scrub_packet(struct sk_buff *skb, bool xne=
t)
>  	skb->skb_iif =3D 0;
>  	skb->ignore_df =3D 0;
>  	skb_dst_drop(skb);
> -	skb_ext_reset(skb);
> +	skb_ext_scrub(skb);
>  	nf_reset_ct(skb);
>  	nf_reset_trace(skb);
> =20

The only thing I would say is that skb_ext_scrub() won't scale if a
second extension comes along and wants the same treatment as PSP. In
that case, either we could make a bitmap of "no scrub" extensions and
then use the same approach of allocating a new ext block and copying
them over, or the original approach of skb_ext_del() could be used after
changing the reference counting scheme for the special extensions in the
release path of __skb_ext_put(), but that is a more intrusive change.

I'm ok with the approach from a PSP perspective:

Reviewed-by: Daniel Zahka <daniel.zahka@gmail.com>
