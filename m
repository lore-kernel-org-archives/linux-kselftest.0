Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794518238;
	b=k1APFydMGGB9xf6/bk7sqjQlD8/fX7F9HaQkF5LPNRIc1dPJg0F5kv6tWDI6VpadTrAz
	 VO7JW5SK3TA3oNzHC5PnCjUeJnJaN+MY5k71WHxrkuTKgzcQ2C6ytoaaj/MqPdVwVSMCd
	 QzjsZXKih6Scv87XSINfoLtEDpbACl68Lk9YS8aBwH7K167rCWWs1FG81rCsVKRX8+usk
	 JFGpSMIgTiZNB9HvpZLeTFcLniM8BTYZ8Z/d9AeljOe3ugHztNZxLrjNYkJjuUt6GNs7a
	 GBLnmCXV8aGUAgAex2DpFL6tuM7QizOHPoZkr9lUzHLNBoKNomSRLdYwdv7dcFXwi6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794518238;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=2uWCIwOUe1zG1Q5nA+J/tviFwJtvfJUjT9/gR+84VMA=;
	b=K9B5xQRyrR5NfmRIPfR621QHys3dygbnpwLCQqA1fv59pF6GiemNwHkF214Q0LwncfHF
	 MSBy+9/iQLpTrTRnjk690ZNAew+iCA6vLpVdFKGSb6FssluRwKlqEAVzuuSBRDR+ySUBG
	 j2/yv0Jp7pydJNaPH6j0YA+OXqiT7UNy3TJU3kP1YPy1N6GLWSnHWiAahwxKQYfkoe3DV
	 2ln/JGBP+N45wnqN9ZlZ4PZaJg70Ygo2KGA5Nq78jmfcTGPemMAf5dUnYpPVAw15ufJMZ
	 PNnJvIpGrxXY39MXMgU3qpV+Yu6esNAkSKK2FUx+hoHBMkupFALopweT3IyZsare9yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NDWfprdl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDC2606A336;
	Thu, 12 Nov 2026 21:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NDWfprdl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1793F1F000C4;
	Thu, 12 Nov 2026 21:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794518237;
	bh=2uWCIwOUe1zG1Q5nA+J/tviFwJtvfJUjT9/gR+84VMA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NDWfprdlnftLEAdZIZBtMjJobIhuoFx45bqX/XG8Dpv6OybR+kyfF1EKK4/H51gND
	 hiQrS1G6lwU+phY2dgaJe+GSk9g3lpWRHglUxJVpf0iA3PdWazwsJjJaOqVAscfJgj
	 ltER20ES71NFC1jGZ92L7nvuT7lAfxxdUOwwOcwflBlxzQyr6bHgXFlAUdTNQ+6ijn
	 Ph/Jo4pxQvTxKSgFfu1WZBEaie4PJwo54lNaBTTtVpcFaM5Z3ZpfMEPqXwzHcTmlKp
	 zfYMj75eg523tDjK/nLqPUdG4bfwWrzLekozXyLFXzWmmyn2sTPHVHsWFilqZgr7Ri
	 VCWcbm+VVnF8Q==
Subject: Re: [PATCH net v2 4/4] ipv4: replace obsolete routing comment
From: netdev-bot+sashiko@kernel.org
To: liamsmith827@grapheneos.org
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, liamsmith827@proton.me
Date: Thu, 12 Nov 2026 21:17:16 +0000
Message-ID: <179451823662.2199510.13028840415362290242@kernel.org>
In-Reply-To: <20261110061536.10811-5-liamsmith827@grapheneos.org>
References: <20261110061536.10811-5-liamsmith827@grapheneos.org>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The comment added to ip_route_output_key_hash_rcu()
  (net/ipv4/route.c, in the fib_lookup() error branch) is wrong for one…

--

ipv4: replace obsolete routing comment

This replaces the comment in the fib_lookup() error fallback path of
ip_route_output_key_hash_rcu(). The old comment described obsolete
fib_lookup(), MSG_DONTROUTE and IPv6 behavior. The new one describes
when the on-link fallback is taken.

> diff --git a/net/ipv4/route.c b/net/ipv4/route.c
> index 80a2c8a3c571f..ac94d8262b6ed 100644
> --- a/net/ipv4/route.c
> +++ b/net/ipv4/route.c
> @@ -2858,24 +2858,19 @@ struct rtable *ip_route_output_key_hash_rcu(struct net *net, struct flowi4 *fl4,
>  		if (fl4->flowi4_oif &&
>  		    (ipv4_is_multicast(fl4->daddr) ||
>  		     (!fl4->flowi4_l3mdev && err == -ESRCH))) {
> -			/* Apparently, routing tables are wrong. Assume,
> -			 * that the destination is on link.
> +			/* When oif is specified, fib_lookup() is called
> +			 * primarily to determine if the destination is
> +			 * accessible directly or through a gateway. It also
> +			 * checks whether there are any traffic restrictions
> +			 * (blackhole, prohibit, unreachable), or if there's a
> +			 * routing lookup miss.
>  			 *

[ ... ]

> +			 * This fallback path is always taken for multicast,
> +			 * regardless of any restrictions or misses. Non-vrf
> +			 * unicast does honor restrictions, but falls back if
> +			 * there's a miss. The destination is assumed on-link
> +			 * for both.
>  			 */

[Severity: Low]
Is "always taken for multicast" accurate when the oif is an L3 master
(VRF) device?

With a VRF configured, fib_has_custom_rules is set. That sends
fib_lookup() through __fib_lookup(), which changes the caller's flow in
place:

net/ipv4/fib_rules.c:__fib_lookup() {
    ...
	/* update flow if oif or iif point to device enslaved to l3mdev */
	l3mdev_update_flow(net, flowi4_to_flowi(flp));
    ...
}

net/l3mdev/l3mdev.c:l3mdev_update_flow() {
    ...
			if (netif_is_l3_master(dev))
				fl->flowi_oif = 0;
    ...
}

The fallback condition reads fl4->flowi4_oif after the lookup. Take a
multicast daddr that is not link-local and not IGMP (for example 239.x),
with the oif set to the VRF master. If the VRF table lookup fails, for
example on the usual unreachable default route, the oif test is false
and the lookup error is returned. The on-link fallback is not taken.

This behavior predates the patch. Could the comment mention this
exception, and note that the oif test uses the value left after
fib_lookup()?

The opening sentence has the same problem. For a VRF master oif,
fib_lookup() is used to select the VRF table and the oif match is
dropped. It is not mainly a check for whether the destination is direct
or gatewayed. Should the comment say that as well?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110061536.10811-1-liamsmith827%40grapheneos.org
