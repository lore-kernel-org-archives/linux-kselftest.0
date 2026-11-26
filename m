Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795680389;
	b=1Cj346SX8O/iwEQ6fv6bEC0QZ7BlqykfADhW1zxixlYa6d+uZyp5W2qUF9XLaZQSvIYh
	 x10XreVHBZWnsgRiIE1Km97H/GULZO29byswIHNITRHlsJ80jc4NMBPHlQ6zo+mGuxIGW
	 /waO5aHznLLeScKt2uclD+nrqU6U/tVk5lj6qEGubUQ9fL9GqAdfamWRI9XAVD0XW7v9E
	 KM8UHWU8Y9Ic5iGIPU1T5/f3OB2boBDRFI90ScrFVxMeQAqN862TXiBWzwlPXVeu240gY
	 16itlT6CmRC6+erLi2YZz2RLoQ8P8ARplzeeWoMtPbo8QFfnlE47bUW7AEx4JoAzxCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680389;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=OyUa2t4yocbjCgEzqBUoX1J7WxTuMvwNQAsF10zzeO4=;
	b=RNO9sRRF7xmdx9dBRv+5lNX8D1iZPTioeu7SOQpR3yy1Kg/FrGuQhnFG0lnEn8LWBbDH
	 YeTdkHtiM9lrm1idOtsJsZBxKpPlewkVOL9J6008npIpyyf4XlpkjAXYjdYxKJR/pJoA9
	 tnAlRwRW6lykAgD13RBWB7gjbdsTWXs5+kYo0c9KRz1frrNfToEmumLQYqnfOL3NlA3Iq
	 TnRfKdV+rXhWjWZLdekI959Z09urOtHarisaQTnwa/Tixgnq5U/B0UzbTfFBPHxCyhcEX
	 cm++BID/o5+GgjxaKzkyOihY3cMT7mulbF0LUaIIPTuxNziCgP9gC6V5axyc8CRpyxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=H8UkYiDc;
	arc=none smtp.remote-ip=95.215.58.155
Received: from mta1.migadu.com (out-155.mta1.migadu.com [95.215.58.155])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6901C606A31C
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 08:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6901C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=H8UkYiDc
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=pJEyvNNA+em0nk/2jshqBxyFrkwUKtMx1aBhCWN2nrI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795680386; v=1; x=1796285186;
 b=H8UkYiDcNwmbnPaNWunF5N3GwDzVU2PDox+LyMkU/oF+OIu2fX7uARBJFeMpkZ1pcJlMz3WK
 Top1WkZNg5YzpSw9ihQZl+H/BzkL8CGjNHUzMMHi1v51JARVhZccGUnaYbXUcAC/80SNRcB8WnF
 w9NxgMEeZZhsjRgztrXBagiE=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 57db03fa17c5ba0a;
	Thu, 26 Nov 2026 08:06:26 +0000
X-Mizu-Trace-ID: 57db03fa17c5ba0a
X-Migadu-Flow: FLOW_OUT
Date: Thu, 26 Nov 2026 16:06:19 +0800
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
Subject: Re: [PATCH net-next v2 1/6] ipip: Enable BIG TCP packets
Message-ID: <20261126080619.GC33976@Liu-laptop>
References: <20261126025015.10416-1-yanhaishuang@cmss.chinamobile.com>
 <20261126025015.10416-2-yanhaishuang@cmss.chinamobile.com>
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
In-Reply-To: <20261126025015.10416-2-yanhaishuang@cmss.chinamobile.com>

On Wed, Nov 25, 2026 at 06:50:10PM -0800, Haishuang Yan wrote:
> Commit f3d0f753f066 ("vxlan: Enable BIG TCP packets") and
> commit 03ebe91b0f61 ("geneve: Enable BIG TCP packets") allowed BIG TCP
> on UDP tunnels. ipip can carry BIG TCP packets as well: the outer IPv4
> header gets its total length from iph_set_totlen() on output, the GSO
> and GRO paths already handle IPv4 BIG TCP, and FOU and GUE encapsulation
> set the UDP length with udp_set_len() since commit 47282504ad21 ("udp:
> Support BIG TCP GSO packets where they can occur").
> 
> Bump tso_max_size up to GSO_MAX_SIZE so that the admin can use BIG TCP
> with ipip. The default gso_max_size and gso_ipv4_max_size stay at 64KB,
> so nothing changes unless they are raised explicitly.
> 
> iperf3 TCP over ipip between two netns connected by veth, without
> encapsulation, 3 runs of 10 seconds each, in a KVM guest with 8 vCPUs
> on an Intel Core i7-14700 host:
> 
>   gso_max_size/gso_ipv4_max_size 65536:   94.2,  97.4,  97.2 Gbit/s
>   gso_max_size/gso_ipv4_max_size 196608: 133.7, 128.5, 130.5 Gbit/s (+36%)
> 
> A later patch in this series extends big_tcp_tunnels.sh to cover ipip
> without encapsulation, and with FOU and GUE.
> 
> Reviewed-by: Alice Mikityanska <alice.kernel@fastmail.im>
> Signed-off-by: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
> ---
>  net/ipv4/ipip.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/net/ipv4/ipip.c b/net/ipv4/ipip.c
> index 15189e1fa06..74af06b1d94 100644
> --- a/net/ipv4/ipip.c
> +++ b/net/ipv4/ipip.c
> @@ -416,6 +416,7 @@ static void ipip_tunnel_setup(struct net_device *dev)
>  	dev->addr_len		= 4;
>  	dev->lltx		= true;
>  	netif_keep_dst(dev);
> +	netif_set_tso_max_size(dev, GSO_MAX_SIZE);
>  
>  	dev->features		|= IPIP_FEATURES;
>  	dev->hw_features	|= IPIP_FEATURES;
> -- 
> 2.43.0
> 
> 
> 
Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
