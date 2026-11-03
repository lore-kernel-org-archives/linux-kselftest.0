Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793669152;
	b=bMqtQCbpwqvK5hvHvIiEf9hqr3KCs7PAG64nQhgfyoSXi4lzkcrM1MwjsPlUho9D1C4Q
	 ZxFG3K2XboXF7C10taCLUJ7Nv4DazCkKTcR/E9nVCf1fFtbJVzEZTjBcTamFtui6L5NgC
	 5AahhQ/h/Kva8Oh08yp4CTflDXo5orOUzZHieiu7lu4HiuOKWU+4qx5orAkqYjpist5hu
	 j3zRRALC/A4VL7AOqVWmW+mpm4jMhXFkSdIDS74tS3FIYgQR4+FWnJ1btsMY5aYegjUqu
	 uYW8h2h0cKmPk+WPI98qMgcDDezCAM1CWF7CiAvra7iN28bl1oVpm2B47EVe2Sk/fCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793669152;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=GQtsOse1qaHHpOot+MsPd8LDVEFm4Ow2k3IZR+G/F4o=;
	b=m9PA8jbrJDYsFrOgXd2XmrNXUzwJI7xY1dcbWibP24LRYIH2vm6lrO7N5MNBL+Af/6bc
	 LFoZuqofOsRc5MGL5scWJZxEtHkYlOC0O5KjSJ8ZRO/d7jp2fZAYOiQipWCLgAW9MiHOE
	 61r9CYwoBl/Z/+wWmevmrEdMCwba+dftwL26tFVDjJmZTeFTpaRAh6m/aosJMOvLp0ZsR
	 roPuUNDJfooIP4ZpxpYqzE/tiBQrQRcfnvAzNdudmz01WyuASjRRRn6fQgr51km90amtI
	 88Cl86U0x7sihESGaAGBKis1tlLlRUPEeEWJuHXtpkOJAWBdzlJ7AsMPLxF6eL7pUPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="wRz6QH1/";
	arc=none smtp.remote-ip=95.215.58.46
Received: from mta1.migadu.com (out-46.mta1.migadu.com [95.215.58.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C516D606A326
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 01:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C516D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wRz6QH1/
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=zAP4af6W/8M6VGTZwGRKoUek7DR1Y9SfEGiGrMO6wuQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793669147; v=1; x=1794273947;
 b=wRz6QH1/CI+7ZKgSMkO99yD7f5GhDxWFSY7CYU+E+4fqC38i1nWHVTjveMrnKxZ6EWXinz37
 2wS0GPJC/skKeoxunlRKrpSkQFY3wTGA66g7NpBg/sAAmk1rx2V0CTgYKBIUZjdsn+axmVNTHYH
 SXdr5CEDEpdyuz2Fv49zRsmc=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 86b764d73d51d8da;
	Tue, 03 Nov 2026 01:25:47 +0000
X-Mizu-Trace-ID: 86b764d73d51d8da
X-Migadu-Flow: FLOW_OUT
Date: Tue, 3 Nov 2026 09:25:28 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>, Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
	David Lebrun <david.lebrun@uclouvain.be>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Mathieu Xhonneux <m.xhonneux@gmail.com>,
	David Lebrun <dlebrun@google.com>,
	Stefano Salsano <stefano.salsano@uniroma2.it>,
	Andrea Mayer <andrea@common-net.org>
Subject: Re: [PATCH net 1/6] seg6: fix skb checksum update helpers
Message-ID: <auk4COJzzhbGK-3g@fedora>
References: <20261031225033.64-1-andrea.mayer@uniroma2.it>
 <20261031225033.64-2-andrea.mayer@uniroma2.it>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261031225033.64-2-andrea.mayer@uniroma2.it>

On Sat, Oct 31, 2026 at 11:50:28PM +0100, Andrea Mayer wrote:
> With CHECKSUM_COMPLETE, ipv6_srh_rcv() updates skb->csum for the new
> Segments Left and destination address through seg6_update_csum().
> Replacing "from" with "to" in the packet must change skb->csum (C) to
> C - from + to, but update_csum_diff4() and update_csum_diff16() compute:
> 
>   ~csum_partial({ ~from, to }, ~C) = ~(~C + ~from + to) = C + from - to
> 
> This does not affect packets forwarded by ip6_forward(), which sets
> ip_summed to CHECKSUM_NONE. But when the packet is delivered on the same
> node and skb->csum was computed in software, for instance by conntrack, UDP
> can drop the packet as a checksum error. With skb->csum computed by the
> device, TCP can instead log a "hw csum failure", as if the device had
> computed a wrong skb->csum.
> 
> Fix update_csum_diff4() and update_csum_diff16() to compute C - from + to.
> 
> Found by manual code inspection, while checking that the skb->csum updates
> in the SRv6 receive path are consistent. A following commit adds a selftest
> that reproduces the problem with a tc ct action. The issue was confirmed in
> a VM without kernel changes or error injection: with the rest of this
> series and without this patch, that selftest fails, as UDP drops datagrams
> as checksum errors. Also tested against the srv6 selftests, and with a
> ConnectX-6 Lx NIC (mlx5) that provides CHECKSUM_COMPLETE.
> 
> Fixes: 1ababeba4a21 ("ipv6: implement dataplane support for rthdr type 4 (Segment Routing Header)")
> Signed-off-by: Andrea Mayer <andrea.mayer@uniroma2.it>
> ---
>  include/net/seg6.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/net/seg6.h b/include/net/seg6.h
> index 82b3fbbcbb93..01d8034e48fc 100644
> --- a/include/net/seg6.h
> +++ b/include/net/seg6.h
> @@ -19,7 +19,7 @@ static inline void update_csum_diff4(struct sk_buff *skb, __be32 from,
>  {
>  	__be32 diff[] = { ~from, to };
>  
> -	skb->csum = ~csum_partial((char *)diff, sizeof(diff), ~skb->csum);
> +	skb->csum = csum_partial(diff, sizeof(diff), skb->csum);
>  }
>  
>  static inline void update_csum_diff16(struct sk_buff *skb, __be32 *from,
> @@ -30,7 +30,7 @@ static inline void update_csum_diff16(struct sk_buff *skb, __be32 *from,
>  		to[0], to[1], to[2], to[3],
>  	};
>  
> -	skb->csum = ~csum_partial((char *)diff, sizeof(diff), ~skb->csum);
> +	skb->csum = csum_partial(diff, sizeof(diff), skb->csum);
>  }
>  
>  struct seg6_pernet_data {
> -- 
> 2.43.0
> 

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
