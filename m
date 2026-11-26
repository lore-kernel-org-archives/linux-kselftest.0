Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795680758;
	b=R4+Dbs9jetcf5SvHWi3ai3Hpy5uhNYxDJ16UqnVh5G+PeLa/dW09nszzbuKQ/BpAGcr9
	 Ipb1NnBL9UsLCop5mP7q02hrnYxvrgvH0rNU7ifqfLEfWszIyrX+q6zfAahnAd7kQsDC+
	 b8PgbEVg7sKqESSo9RfbFQjJrSvmKgwMFdiOtfL8AVxCEmRmCoHMNxJZmBiH2dLHeYXsE
	 Lk96T/mGNRhUPOO46DKCeoi/ZE8D788rwT/DYOVyk9+qKy/OB97jHvmCljhYNt7nitQqB
	 ti/YgDjv77uL6747nKKcpfTmDV0JBs9QZ/Mulz6vAElVGC219qZswBkU/Gl7kCrkyXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680758;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=rLPkJUAGEWARQ2dIgwe2dGKd/2F+KCnofuKYobrMgA4=;
	b=Sztx2ST/RUydjLhF9oBehQYmh7/cWVfpitNLXkzXtsFJMtpF1rsbr/ZrndfpOIeUG7Xo
	 rtQWEWaCE4ddWVvClpS7UxAbBu4ZeRM3yUHUWJ+6zTTu2erBGxl5APTBMdgtTVq6OamWk
	 pNKdpnP8Jq27752W8P8fOEvcM96MvLiToTRSzN+NobiO+TIKRMkmSQJQoPYBMBGj68VYx
	 X1gLa+kikRrMjTIDud7Powc3cGdMYJ+A0ebSm+am6tt3ssGrvzYZ4yPz6ebohTiJPJCQ8
	 TBVk/69psRP9gVjYSAkkqCE/F3JP3Uq1LSyBgGfQvan3RTwUVDRn5xVD4WYCuLsuugA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kwxOEwQ1;
	arc=none smtp.remote-ip=91.218.175.56
Received: from mta0.migadu.com (out-56.mta0.migadu.com [91.218.175.56])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F669606A31E
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 08:12:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F669606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kwxOEwQ1
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=SfcdMxFYA0q96NE83XCnix52dNJ48AiBhdfguxOC+wo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795680755; v=1; x=1796285555;
 b=kwxOEwQ1KvbZ4Q8yWicro8AfcqCZFdNuyL7n3re1nfTIphr6XC3cncgHh8R2C4Z0EWbxUPiN
 w9KvPCCCQ0g7nn0LAupBYtrih6uTOkUvBizwa+f34cVTyLax5ES9ZnQmBg2kJJ0jrVZft8yGDB3
 Xbp2L3zJfXRjio1XupZZ+xVw=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 5eb27d89023d6b48;
	Thu, 26 Nov 2026 08:12:35 +0000
X-Mizu-Trace-ID: 5eb27d89023d6b48
X-Migadu-Flow: FLOW_OUT
Date: Thu, 26 Nov 2026 16:12:28 +0800
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
Subject: Re: [PATCH net-next v2 3/6] sit: Enable BIG TCP packets
Message-ID: <20261126081228.GE33976@Liu-laptop>
References: <20261126025015.10416-1-yanhaishuang@cmss.chinamobile.com>
 <20261126025015.10416-4-yanhaishuang@cmss.chinamobile.com>
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
In-Reply-To: <20261126025015.10416-4-yanhaishuang@cmss.chinamobile.com>

On Wed, Nov 25, 2026 at 06:50:12PM -0800, Haishuang Yan wrote:
> Commit f3d0f753f066 ("vxlan: Enable BIG TCP packets") and
> commit 03ebe91b0f61 ("geneve: Enable BIG TCP packets") allowed BIG TCP
> on UDP tunnels. sit can carry BIG TCP packets as well: the outer IPv4
> header gets its total length from iph_set_totlen() on output, the GSO
> path already handles BIG TCP, and FOU encapsulation sets the UDP length
> with udp_set_len() since commit 47282504ad21 ("udp: Support BIG TCP GSO
> packets where they can occur").
> 
> Bump tso_max_size up to GSO_MAX_SIZE so that the admin can use BIG TCP
> with sit. The default gso_max_size and gso_ipv4_max_size stay at 64KB,
> so nothing changes unless they are raised explicitly.
> 
> iperf3 TCP over sit between two netns connected by veth, without
> encapsulation, 3 runs of 10 seconds each, in a KVM guest with 8 vCPUs
> on an Intel Core i7-14700 host:
> 
>   gso_max_size 65536:   96.0,  95.4,  98.0 Gbit/s
>   gso_max_size 196608: 136.9, 131.0, 129.8 Gbit/s (+37%)
> 
> On the receive side, GRO does not build sit packets larger than 64KB, so
> the gain comes from the sender when the underlay offloads GSO.
> 
> A later patch in this series extends big_tcp_tunnels.sh to cover sit
> without encapsulation and with FOU and GUE.
> 
> Reviewed-by: Alice Mikityanska <alice.kernel@fastmail.im>
> Signed-off-by: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
> ---
>  net/ipv6/sit.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/net/ipv6/sit.c b/net/ipv6/sit.c
> index a7ec800216a..97044b1cad2 100644
> --- a/net/ipv6/sit.c
> +++ b/net/ipv6/sit.c
> @@ -1577,6 +1577,7 @@ static void ipip6_tunnel_setup(struct net_device *dev)
>  	dev->max_mtu		= IP6_MAX_MTU - t_hlen;
>  	dev->flags		= IFF_NOARP;
>  	netif_keep_dst(dev);
> +	netif_set_tso_max_size(dev, GSO_MAX_SIZE);
>  	dev->addr_len		= 4;
>  	dev->lltx		= true;
>  	dev->features		|= SIT_FEATURES;
> -- 
> 2.43.0
> 
> 
> 
Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
