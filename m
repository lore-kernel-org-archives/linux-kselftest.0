Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793330812;
	b=hyKdtrSNyXQ3XkkMYARP+JecK4lZ7Pib0HaSdp1mT8u8DBgMSklUHMgjxjHQJ5006hyo
	 zKrBZH3eBBjyEouKFFWiVmFQVUxwtQEjxgx0iles/mfBkUiE5ppVASPajqWXAdF46FvPO
	 ar+CGG4f8HX1DCfPHAnYRSMqNVG0fi4LMwKM5Iut8TKQ+bDNJDkeVyDhTEoU6sDG8gqBM
	 DcEXymWlmRZH12NSCqeUoAwShHl9XJRbr9d8Vj6beeJYC1+1YlS2xW71eVSEX0Fu47/wD
	 JNuv0qQzlwpnSG88yVCG54GS0aOQnWPWSVoIKyEbMldeP5iTV6Ox/v+oVanTGDfK8JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793330812;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=gNgrq0owYBabIu+cyKFWAz7J9oi+IwK3EkpuRpgRVL0=;
	b=1ZPsvDfxOzvQzR0rumRffve6sd7IVkY+ES72zFXkOimy1yOFGwOUCppO/e3TzRIZtC4j
	 NolODt2afgO2VHabE0kVb7kFLFsZ7AxvPOnjfZ8ulC9qJNEpcDz67zR0J9T5K92yXTLip
	 uLksSzEnlOkKwazTycFuSOI+KRa2Cm7Iy2R/U5WRYLAqzJN+LvUz2XEFQdhlsPgOsdaDY
	 /mPliW1trZ0P7LrVJozEeVv1lx4loFAOSiS8PqwehdAK3bcrDo7yyfG9av70Rvbx9mE1F
	 x6OynSiqoj7xilD27ErppobTO4nNF9bWWTPzYpmp/m2TQOkuTAhKzwrOD18bhSuTosg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ff5he46p;
	arc=none smtp.remote-ip=91.218.175.50
Received: from mta0.migadu.com (out-50.mta0.migadu.com [91.218.175.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96095606A31D
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 03:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96095606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ff5he46p
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=P4sVG6gAsKMk1pWV0klicmych+OKQW4cm/nQyosN14Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793330809; v=1; x=1793935609;
 b=Ff5he46pDGf+pB2O3fS0/jXrpWZXVWnKu18xIxaG0+jhTChfs8Q1kJwqq2ZcxnGf1Z9dNf2J
 BAZH4mKir2E42QKTC2lpY1wqN4GQh+fWp+/Qczt6IENBy9kGptvz9C7H7gXexbF3i1oeazubadL
 +LVQNWcgIbmO5AeYc035JYmE=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3cf042a3802d9ad0;
	Fri, 30 Oct 2026 03:26:49 +0000
X-Mizu-Trace-ID: 3cf042a3802d9ad0
X-Migadu-Flow: FLOW_OUT
Message-ID: <9d592d49-ebc8-4a3d-af1d-6cb688d2065d@linux.dev>
Date: Fri, 30 Oct 2026 11:26:40 +0800
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v5 1/2] veth: keep carrier off when resizing channels
 with a down peer
To: Xia Yan <yana06070@163.com>, netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 horms@kernel.org, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, pabeni@redhat.com, shuah@kernel.org,
 hangbin.liu@linux.dev, stable@vger.kernel.org
References: <20261029024259.3700-1-yana06070@163.com>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <20261029024259.3700-1-yana06070@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/29/26 10:42 AM, Xia Yan wrote:
> veth_set_channels() temporarily turns carrier off while reconfiguring a
> running interface. It then turns carrier on for both ends without
> checking whether the peer is administratively up. If only one end is up,
> changing its channel counts therefore reports LOWER_UP even though the
> peer remains down.
>
> For example, after creating a pair with two RX and TX queues per end:
>
>    ip link set vca up
>    ethtool -L vca rx 1 tx 1
>
> vca incorrectly reports LOWER_UP while vcb is still down.
>
> Only restore carrier when the peer has IFF_UP, matching veth_open().
> The local interface is already known to be running at this point.
>
> Found during LLM-assisted source review and reproduced with a veth pair
> in network namespaces, without kernel instrumentation or error injection.
> The companion veth.sh test reproduces the two mixed up/down failures
> before the fix and passes after it.
>
> Fixes: 4752eeb3d891 ("veth: implement support for set_channel ethtool op")
> Cc: stable@vger.kernel.org
> Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
> Assisted-by: LLM
> Signed-off-by: Xia Yan <yana06070@163.com>



Reviewed-by: Jiayuan Chen <jiayuan.chen@linux.dev>


Thanks, I clearly remember it has been reported somewhere...

> ---
> Changes in v5:
> - Driver code is unchanged.
> - The companion test drops unnecessary quotes around literal up
>    and carries Hangbin's review and test tags.
>
> v4: https://lore.kernel.org/netdev/20261024093007.12981-1-yana06070@163.com/
>
> Changes in v4:
> - Driver code is unchanged. Add Hangbin's Reviewed-by.
> - The companion test drops the extra GRO on/off runs, as discussed
>    with Hangbin, and keeps up/up and both mixed up/down states.
>
> v3: https://lore.kernel.org/netdev/20261022085842.2527-1-yana06070@163.com/
>
> Runtime testing of v4 on 513444cc62e2, x86_64 QEMU/KVM with three vCPUs:
> - Complete default veth.sh:
>    before: 56 checks pass, two mixed up/down carrier checks fail;
>    after: all 58 checks pass. The 55 existing checks pass on both.
> - Script exit status: 1 before, 0 after. No checks were skipped.
> - Both guests powered down normally.
> - The runtime results above are from v4. The only v5 script change
>    removes quotes around a literal argument.
>
>   drivers/net/veth.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/veth.c b/drivers/net/veth.c
> index 643b97dc52456df80de10068ccac9af2ada70256..4e75830061ccd3def0476b19a2f92e818464fce9 100644
> --- a/drivers/net/veth.c
> +++ b/drivers/net/veth.c
> @@ -1372,9 +1372,10 @@ out:
>   		 * to identify the range we have to disable
>   		 */
>   		veth_disable_range_safe(dev, new_rx_count, old_rx_count);
> -		netif_carrier_on(dev);
> -		if (peer)
> +		if (peer && (peer->flags & IFF_UP)) {
> +			netif_carrier_on(dev);
>   			netif_carrier_on(peer);
> +		}
>   	}
>   
>   	/* update XDP supported features */
>
> base-commit: 513444cc62e231a11c9b15ea88de0890da9b2b4f
>
