Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793672958;
	b=3Q/eKKegCOk1Kss22/mRrjUNModuOuqDpjiQZp7RcPpKLZxTf3Db2CvMJ9/CvzSrIRY5
	 lijkP4oUPWDNd4p0KEh51DW3mv/iIgV970wehUKplJZEMeSSUWwdxx1HpzldLSBS3CbMu
	 bS1LcAHnWiceBZrEX7ounj65PHdg7EjFM6hfBBWK8j1X7Y5KaEW5mzSzv0mlfiVLUJ8Re
	 NzjUqcckabumaxsEY7doMWWhVcgKAv5VtVHhm/66gIMMBlY/XBi+VsV392SRnQmJV11VL
	 FyBr+nKRToNtpN4VaZIAguU8H8rwRTi5zgNNP9jYN+pldJZmtTZtP40b/fiIDICbFcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793672958;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=+Odq/nWUXS9jHPYJFLtSPbg5YmanbMJct1bOQuLz9a0=;
	b=dud5jmS3z/k8C3neWofKABEcUGR4YuVs8+BT8VZKNANGSyHnDE17QP1OQjYCxHtE+F76
	 FxHTmqj9JKUrea7LVjSpZOpH9LrI0H27UYXZqEfoH6ttm++tuyFhcWElXpdiIWu04pblF
	 FogXz1XVVKh7CLqG8ypA31cVOm60A/Kpo6NqVkeBWex8i1630JwbLLfPVKqaJTH5ICdFl
	 OX/+4UZCLuNklZ5FOVrLzbHNDLHFkL+xqVqZQQ/TQWt1fo6VQLh0QriHGNypWUmQYO3d7
	 BbqhexNdacGaxnxUrq3ivP8t9bsqbrWhdq7OSbWxD1CFNLcB+cPSJWMqj2O68qIhP6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gbaU8Ezm;
	arc=none smtp.remote-ip=91.218.175.177
Received: from mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE41A606D801
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 02:29:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE41A606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gbaU8Ezm
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=K7tUnBieg+x8yoMHcEYMmFpmpR2noKDKE9apnAPDyxQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793672954; v=1; x=1794277754;
 b=gbaU8EzmhpM70F02M6NZuxqiGA/M3RfyTnyhoPLdG9UkR7FnGJTkry7QY/EqGuMe7bIAgj1Z
 KCXu0+nAecYzRtMRB5LzLh/9OyK5zrcgRCYGFGb5nxq673/stw5ehoyCU3iWPtaG6vGDaJ2iay3
 5+GI147Y7BVdk4EZ7unaIvlo=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 406c5c1624b3d690;
	Tue, 03 Nov 2026 02:29:14 +0000
X-Mizu-Trace-ID: 406c5c1624b3d690
X-Migadu-Flow: FLOW_OUT
Date: Tue, 3 Nov 2026 10:28:52 +0800
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
Subject: Re: [PATCH net 4/6] seg6: discard CHECKSUM_COMPLETE after the
 End.BPF program
Message-ID: <aulG5DJroKs6BuzS@fedora>
References: <20261031225033.64-1-andrea.mayer@uniroma2.it>
 <20261031225033.64-5-andrea.mayer@uniroma2.it>
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
In-Reply-To: <20261031225033.64-5-andrea.mayer@uniroma2.it>

Hi Andrea,
On Sat, Oct 31, 2026 at 11:50:31PM +0100, Andrea Mayer wrote:
> The End.BPF program can change the packet through the seg6 BPF helpers,
> for instance the SRH Tag with bpf_lwt_seg6_store_bytes(). After the
> program, seg6_bpf_has_valid_srh() can also rewrite the SRH Hdr Ext Len.
> 
> With CHECKSUM_COMPLETE, the program does not always update skb->csum for
> the bytes it writes, and seg6_bpf_has_valid_srh() does not either. If the
> packet is then delivered on the same node and skb->csum was computed in
> software, for instance by conntrack, UDP can drop the packet as a checksum
> error. With skb->csum computed by the device, TCP can instead log a
> "hw csum failure", as if the device had computed a wrong skb->csum.
> 
> Discard CHECKSUM_COMPLETE with skb_checksum_complete_unset() after the
> program, since input_action_end_bpf() does not know which bytes the program
> changed. The checksum is then verified in software.
> 
> Found by manual code inspection and reproduced in a VM without kernel
> changes or error injection: with skb->csum computed by a tc ct action, an
> End.BPF program that writes the SRH Tag, followed by End.B6.Encaps and a
> local End.DT6 SID, makes UDP drop the packet. With this patch, the packet
> is delivered. Also tested against the lwt_seg6local BPF selftest, and with
> a ConnectX-6 Lx NIC (mlx5) that provides CHECKSUM_COMPLETE.
> 
> Fixes: 004d4b274e2a ("ipv6: sr: Add seg6local action End.BPF")
> Signed-off-by: Andrea Mayer <andrea.mayer@uniroma2.it>
> ---
>  net/ipv6/seg6_local.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/net/ipv6/seg6_local.c b/net/ipv6/seg6_local.c
> index 57a82477ce3f..3045a351f4e9 100644
> --- a/net/ipv6/seg6_local.c
> +++ b/net/ipv6/seg6_local.c
> @@ -1582,6 +1582,12 @@ static int input_action_end_bpf(struct sk_buff *skb,
>  		goto drop;
>  	}
>  
> +	/* The program may have changed the packet and seg6_bpf_has_valid_srh()
> +	 * may rewrite the SRH Hdr Ext Len below.
> +	 * skb->csum may then no longer be the checksum of the full packet.
> +	 */
> +	skb_checksum_complete_unset(skb);
> +

Should we move this a bit later?

>  	if (srh_state->srh && !seg6_bpf_has_valid_srh(skb))
>  		goto drop;
>  	local_unlock_nested_bh(&seg6_bpf_srh_states.bh_lock);
> -- 

e.g. after this. As there is not need to do the setting if the skb is dropped.

Thanks
Hangbin
