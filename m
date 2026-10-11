Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8988B346777
	for <linux-kselftest@vger.kernel.org>; Sun, 11 Oct 2026 08:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791708951; cv=none; b=IjYV9LXuTDt/xjPbcFb6Kv55Df/pq6ZuIFXVM0f555zgeKnPN1JamEo6RaaTRUU0X9WPFFk9my7/w0mZIvn+D8ebPmmb4/e+2kjr1GzF5WMO4HmNufBJ6/6QTBuG5S3o1rEM+6DXRdHNOAkljm4auroqapcB4uf9C9wjps/gfkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791708951; c=relaxed/simple;
	bh=c71GV9Em8N83Q/onaYF06piMYm9Sy1RKY9G8jl/civ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aSvVbscQ3Nm+EvTpKn5ZikMuGZE/Zqm9z7q1IYQX1hBEOQZFJBhf55ItX1jaUpHFWM+dlclFPNgZpfwjb1xJSoLkLrx8mSV7JDh6Ch+vYmlFIkGYmyPm/mHimZHxzhSEN3PEXCFgLFfQAdQNMj+mmw+zqUgWWRMD73wnkVkrpMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TtGem5H/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TtGem5H/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A2FB1F008A1
	for <linux-kselftest@vger.kernel.org>; Sun, 11 Oct 2026 08:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791708950;
	bh=bq8owGPAlvuzDobHhVTg9562ILbptQRMiB+o1O0+JE0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TtGem5H/n9sfe4HkWONB9kN5HHL3KAmk9Iei//tLjScYYPayiVeNl7PIVSuyHQspQ
	 FL1kgEdzoJ5UUN26eeHlTQMl4I6HbobjPwKnwgrVoqqB1xHRNmmboU5wZrj4ju6Goq
	 YX2i7Qa2/3uxO/tti6wro2aIfMPf73eaARb2Fooq63Qp2VuaGcsStuG8Za0OtuE3Nd
	 Uftiwf8QTNcjElt3UTNQ7pJa4OfbMGyRrqTbt8ZHPUzmpwlIeMXB7hfeTf40UZOv9H
	 BIgZKxhAoXGlJwkJsx/ZdwWz7HtkUHf5NnpWaVz0RN5w4DVwQRCdYuqbbsNzYIdO/B
	 IU4R3NqBrbsFQ==
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6df5e315bd1so710879eaf.2
        for <linux-kselftest@vger.kernel.org>; Sun, 11 Oct 2026 01:55:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByMZ1C3Rxv9ONZ1fkpzYQ1xKvqgL/SsjCkMC9UYUntR+c8FdMcYjeT4zLLHFI6d/T2OVxnbEwQAwBhmLKMIW/8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL49Qaumfap+uHUOZryuUjotqXm0d+bVuv+jIdlQY17MBlfPii2
	SIIzxcRSHYNsbpgOXAE7z1vRcsF3iCe8anynW/xAWtMkUH9WDLWs4BoieYrHTGkT/Y+a4bA6/FP
	1GfaOoPatgegq01pdpkgxIfxluIGH8iQ=
X-Received: by 2002:a05:6820:c2d3:10b0:6f4:ae96:c596 with SMTP id
 006d021491bc7-6f4ae96ccc1mr351008eaf.2.1791708949482; Sun, 11 Oct 2026
 01:55:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-bradfitz-gre-fou-gro-b4-v1-0-df713aad1531@tailscale.com> <20261011-bradfitz-gre-fou-gro-b4-v1-1-df713aad1531@tailscale.com>
In-Reply-To: <20261011-bradfitz-gre-fou-gro-b4-v1-1-df713aad1531@tailscale.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Sun, 11 Oct 2026 10:55:38 +0200
X-Gmail-Original-Message-ID: <CAL4WiioRu30CJBTDo6UhnJCb8jmzYUZaDZ9UQAZ0+rpxtANH0g@mail.gmail.com>
X-Gm-Features: AclHuK_2L6gfWdm0daVBvQD8sLKYxLb2fL9PO6B1lw50qvYQOGtJGmvz7CgB9gg
Message-ID: <CAL4WiioRu30CJBTDo6UhnJCb8jmzYUZaDZ9UQAZ0+rpxtANH0g@mail.gmail.com>
Subject: Re: [PATCH net 1/2] gre: keep the UDP tunnel GSO type when completing GRO
To: bradfitz@tailscale.com
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Antoine Tenart <atenart@kernel.org>, Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dim. 11 oct. 2026 =C3=A0 03:41, Brad Fitzpatrick via B4 Relay
<devnull+bradfitz.tailscale.com@kernel.org> a =C3=A9crit :
>
> From: Brad Fitzpatrick <bradfitz@tailscale.com>
>
> gre_gro_complete() assigns SKB_GSO_GRE to gso_type rather than OR-ing
> it in. When GRE is carried over UDP by FOU or GUE, udp_gro_complete()
> has already set SKB_GSO_UDP_TUNNEL{,_CSUM} before calling into the FOU
> or GUE gro_complete handler and then gre_gro_complete(), so that bit is
> lost.
>
> That has broken forwarding of such packets since FOU gained GRO: if a
> host with a FOU or GUE socket on the tunnel's port merges transit
> packets and then forwards them out a device that can't segment them
> itself, udp4_ufo_fragment() finds neither tunnel bit and fails, and
> the packets are dropped. Since commit 3d010c8031e3 ("udp: do not accept
> non-tunnel GSO skbs landing in a tunnel"), local receive is broken too:
> udp_unexpected_gso() considers the merged skb, which reaches the
> encapsulation socket without either UDP tunnel bit, unexpected and
> hands it to udp_rcv_segment(). Segmenting fails, so the packet is
> freed and counted in UdpInErrors. Either way, only packets GRO didn't
> merge get through, so TCP over FOU or GUE GRE tunnels slows to about
> one segment per round trip whenever the receiving device has GRO
> enabled.
>
> OR in SKB_GSO_GRE instead, as ipip_gro_complete() and
> sit_gro_complete() do for SKB_GSO_IPXIP4. For plain GRE, gso_type is
> still zero at this point unless the driver set it, so nothing changes
> there in the usual case.
>
> The assignment dates to commit bf5a755f5e91 ("net-gre-gro: Add GRE
> support to the GRO stack"), but nothing set gso_type before it until
> FOU GRO came along, so the Fixes tag points there.
>
> Tested under virtme-ng with bulk TCP over a GRE tunnel between two
> network namespaces joined by a veth, with GRO on the receiving veth and
> segmentation off on the sending one, so GRO sees wire-sized packets.
> 32 MiB took:
>
>                   before                  after
>   FOU over IPv4   26.0s, 9658 UDP errors  0.28s, 0 errors
>   GUE over IPv4   26.1s, 9686 UDP errors  0.39s, 0 errors
>   FOU over IPv6   26.4s, 9860 UDP errors  0.16s, 0 errors
>   plain GRE       0.17s                   0.15s
>
> Forwarding the same FOU traffic through a third namespace with its own
> FOU socket on the port, GRO on its ingress and segmentation off on its
> egress, took 26.0s with 4826 egress drops before and 0.31s with none
> after. On v6.8, before 3d010c8031e3, local receive was fine but
> forwarding failed the same way (25.7s, 4764 drops).
>
> With GRO off on the receiver, all took under 0.2s both before and
> after. The gre_gso.sh and fou_mcast_encap.sh selftests give the same
> results before and after.
>
> Fixes: afe93325bc02 ("fou: Add GRO support")
> Assisted-by: LLM
> Signed-off-by: Brad Fitzpatrick <bradfitz@tailscale.com>
> ---

Nice catch, thanks.

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
