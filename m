Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.248
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795680802;
	b=oEPGCKPkEXjYsJdeZJQJb8YvgDKRdW9phoIEB7/fQtpPnS57TcCd14PgGLnrea+Zdds1
	 lR0Y8/iUI/C8Gmvj+rTYu/OTSWKekc3Aq3e9/zO23zljvH073thOgeBN/Yszlt6rkiuiI
	 vcoyvr+isZSjYtc4lwzMx5j0MHJdkeDvpKzgq7aujwjHkvD7aepsvP4A66hrdB/XhSWtn
	 tAWAG//mDcBW8M7RZUoQZlVlSUEnGmVO0w4Yx7GvuJyT8LyuEzDidOIB/MEgM0Bgwx1Ko
	 eZDi3amaoxMsOjkvEezQemzp988T6hLltYHjCEZGeRokdcB7IHQTuAsk7fTeZngtc9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680802;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=8ngE5yHiDIx7vBCYimPDgiAaC44Sef/mO5m2HnMkQ3g=;
	b=N9tffTdE7eN9evvCM15kDuADci33Dx1t0a1m4B3U5nyfDl7Bg4qbQZ7uWlVfStyXbvtL
	 1zknVrxU3o7++xQSHDnSHklZf/9IrtrUsBqr2l1jioY34O6AneKWNg9hMQ1K/D7pYW8yj
	 +q8DpdW1m24+FFOGBOSY7t3aovgZKQG2qleyl4dF6IOcB0YoqdQCEyNpj7lb/Iwrq2k7V
	 SIyWCTu+OnWKSP6X6W4Ym6XN08mtcqXbB+XAWkp9283BPXzeuQ8mnScdfPbdqTJp7W3QH
	 wXCoU2ymBUZGoiMaPOj3b/7RlAKipL8UjbSiQiueXODT6t0OfxkE7XN3G2xn+Mp0ntA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HDgwxbPG;
	arc=none smtp.remote-ip=95.215.58.248
Received: from mta1.migadu.com (out-248.mta1.migadu.com [95.215.58.248])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C552606A33B
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 08:13:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C552606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HDgwxbPG
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=TWd5PYsIUK42+eVyOks+ZcrzBLgJCP2EqIb2/tZIif4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795680799; v=1; x=1796285599;
 b=HDgwxbPGV+SOoxUcQzUMVT9i3l1EcBh1rMtwVT0oMISsd3H3agHFXh+81KT9vrOxXdAPBtdR
 eUmihKIKfkAsS+QeYGTBfxZ2t8UaCZl8JE2yXizle+mREwib/eH+12RpT/7uGk0OwMN2umtg3LI
 M3ix4aaPd8vorYG9hnGD+Y18=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 3b2fb38026ca545c;
	Thu, 26 Nov 2026 08:13:18 +0000
X-Mizu-Trace-ID: 3b2fb38026ca545c
X-Migadu-Flow: FLOW_OUT
Date: Thu, 26 Nov 2026 16:13:11 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Alice Mikityanska <alice.kernel@fastmail.im>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 4/6] ip6_tunnel: Enable BIG TCP packets
Message-ID: <20261126081311.GF33976@Liu-laptop>
References: <20261126025015.10416-1-yanhaishuang@cmss.chinamobile.com>
 <20261126025015.10416-5-yanhaishuang@cmss.chinamobile.com>
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
In-Reply-To: <20261126025015.10416-5-yanhaishuang@cmss.chinamobile.com>

On Wed, Nov 25, 2026 at 06:50:13PM -0800, Haishuang Yan wrote:
> Commit f3d0f753f066 ("vxlan: Enable BIG TCP packets") and
> commit 03ebe91b0f61 ("geneve: Enable BIG TCP packets") allowed BIG TCP
> on UDP tunnels. ip6tnl can carry BIG TCP packets as well: IPv6 BIG TCP
> no longer needs a hop-by-hop jumbo header, the GSO and GRO paths already
> handle it, and FOU encapsulation sets the UDP length with udp_set_len()
> since commit 47282504ad21 ("udp: Support BIG TCP GSO packets where they
> can occur").
> 
> Bump tso_max_size up to GSO_MAX_SIZE so that the admin can use BIG TCP
> with ip6tnl. The default gso_max_size and gso_ipv4_max_size stay at
> 64KB, so nothing changes unless they are raised explicitly.
> 
> iperf3 TCP over ip6tnl, with IPv4 traffic between two netns connected by
> veth, without encapsulation, 3 runs of 10 seconds each, in a KVM guest
> with 8 vCPUs on an Intel Core i7-14700 host:
> 
>   gso_max_size/gso_ipv4_max_size 65536:   93.0,  90.8,  83.3 Gbit/s
>   gso_max_size/gso_ipv4_max_size 196608: 134.8, 123.4, 112.8 Gbit/s (+39%)
> 
> A later patch in this series extends big_tcp_tunnels.sh to cover ip6tnl
> with IPv4 and IPv6 traffic, without encapsulation and with FOU and GUE.
> 
> Reviewed-by: Alice Mikityanska <alice.kernel@fastmail.im>
> Signed-off-by: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
> ---
>  net/ipv6/ip6_tunnel.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/net/ipv6/ip6_tunnel.c b/net/ipv6/ip6_tunnel.c
> index 64a184bca46..040012cdf15 100644
> --- a/net/ipv6/ip6_tunnel.c
> +++ b/net/ipv6/ip6_tunnel.c
> @@ -1919,6 +1919,7 @@ static void ip6_tnl_dev_setup(struct net_device *dev)
>  	dev->lltx = true;
>  	dev->pcpu_stat_type = NETDEV_PCPU_STAT_TSTATS;
>  	netif_keep_dst(dev);
> +	netif_set_tso_max_size(dev, GSO_MAX_SIZE);
>  
>  	dev->features		|= IPXIPX_FEATURES;
>  	dev->hw_features	|= IPXIPX_FEATURES;
> -- 
> 2.43.0
> 
> 
> 
Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
