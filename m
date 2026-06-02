Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217E63546E9;
	Tue,  2 Jun 2026 03:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370265; cv=none; b=guVSP1NFipUIqTYJVgM71VKSqJtlk2EQK0FpBl8xqS5O5mnkYjlKt5qKTwI3SBk4Smw/yO6bs+CV+0EiiUJUFN4+6PJy9cyZLcbzQlsCF/ClVykbKPnhiESczvlJsq9UZK8OdrxjiPHh1xU/hxhx9Mm27tpSVlawqM5fx90PRWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370265; c=relaxed/simple;
	bh=gvgIJo9m/HUHg9gk2qU3NCinlFuIOES/GGZ227Us+6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZgN0PoKN3Tr2NnC0wtMWJgmKhZdkNqNgEL1S4P79cwM8dGnu/+AaZ100RxSTbI/r4grTz3DDukViLc0q4g8Fu3uEg6Xu1qe9+AWPkTPGe0qa9Fq1vBfVPq7D6QLt0/58vhMICOW0EiVG4b/OD5SSg8uzUndUISE4rCUAEUU6mvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WHV8r6eo; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WHV8r6eo"
Message-ID: <0fecd90a-d218-48dc-86d1-860ab2e7f6d5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780370252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q31l8Uyd8/waps4/zvDwbRE+yDFblOOOVBggVCClT4g=;
	b=WHV8r6eoERREXxCCRWjY2eCmtSkAlgARpuzh0h1dndgYom86wLyWawWBQ0ihkvMvPM7O8Y
	5cVT0y3iBdevFuRq4D8aCpnspn3R8dARNJRC1RJ2IlsEfPrjyK1U0LLqP9omm4Gs+xoJYg
	ANKtSjCbOfW8avUq3gZ/XtK1pfIwO+A=
Date: Tue, 2 Jun 2026 11:17:15 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf v3 1/2] bpf: Update transport_header when
 encapsulating UDP tunnel in lwt
To: Leon Hwang <leon.hwang@linux.dev>, bpf@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Guillaume Nault <gnault@redhat.com>,
 Ido Schimmel <idosch@nvidia.com>,
 Fernando Fernandez Mancera <fmancera@suse.de>,
 Peter Oskolkov <posk@google.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kernel-patches-bot@fb.com, Leon Hwang <leon.huangfu@shopee.com>
References: <20260601150203.20352-1-leon.hwang@linux.dev>
 <20260601150203.20352-2-leon.hwang@linux.dev>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <20260601150203.20352-2-leon.hwang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 6/1/26 11:02 PM, Leon Hwang wrote:
> Currently, bpf_lwt_push_ip_encap() does not update skb->transport_header.
> When a driver, e.g. ice, reuses the stale skb->transport_header to
> offload checksum computation to NIC hardware, VxLAN packets encapsulated
> by bpf_lwt_push_encap() helper may be dropped due to incorrect checksum.
>
> Update skb->transport_header in bpf_lwt_push_ip_encap() whenever the
> encapsulated packet uses UDP, so checksum offload works correctly.
>
> Fixes: 52f278774e79 ("bpf: implement BPF_LWT_ENCAP_IP mode in bpf_lwt_push_encap")
> Cc: Leon Hwang <leon.huangfu@shopee.com>
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>   net/core/lwt_bpf.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/net/core/lwt_bpf.c b/net/core/lwt_bpf.c
> index f71ef82a5f3d..65d1dfbf3312 100644
> --- a/net/core/lwt_bpf.c
> +++ b/net/core/lwt_bpf.c
> @@ -599,6 +599,7 @@ static int handle_gso_encap(struct sk_buff *skb, bool ipv4, int encap_len)
>   
>   int bpf_lwt_push_ip_encap(struct sk_buff *skb, void *hdr, u32 len, bool ingress)
>   {
> +	bool is_udp_tunnel;
>   	struct iphdr *iph;
>   	bool ipv4;
>   	int err;
> @@ -612,10 +613,16 @@ int bpf_lwt_push_ip_encap(struct sk_buff *skb, void *hdr, u32 len, bool ingress)
>   		ipv4 = true;
>   		if (unlikely(len < iph->ihl * 4))
>   			return -EINVAL;
> +		is_udp_tunnel = iph->protocol == IPPROTO_UDP;
> +		if (unlikely(is_udp_tunnel && len < iph->ihl * 4 + sizeof(struct udphdr)))
> +			return -EINVAL;
>   	} else if (iph->version == 6) {
>   		ipv4 = false;
>   		if (unlikely(len < sizeof(struct ipv6hdr)))
>   			return -EINVAL;
> +		is_udp_tunnel = ((struct ipv6hdr *)iph)->nexthdr == NEXTHDR_UDP;
> +		if (unlikely(is_udp_tunnel && len < sizeof(struct ipv6hdr) + sizeof(struct udphdr)))
> +			return -EINVAL;
>   	} else {
>   		return -EINVAL;
>   	}
> @@ -637,6 +644,10 @@ int bpf_lwt_push_ip_encap(struct sk_buff *skb, void *hdr, u32 len, bool ingress)
>   	if (ingress)
>   		skb_postpush_rcsum(skb, iph, len);
>   	skb_reset_network_header(skb);
> +	if (ipv4 && is_udp_tunnel)
> +		skb_set_transport_header(skb, skb_network_offset(skb) + iph->ihl * 4);
> +	else if (!ipv4 && is_udp_tunnel)
> +		skb_set_transport_header(skb, skb_network_offset(skb) + sizeof(struct ipv6hdr));


I think GRE is also affected, why not unconditionally set transport 
header to network_offset + outer_ip_ihl regardless of outer protocol??

>   	memcpy(skb_network_header(skb), hdr, len);
>   	bpf_compute_data_pointers(skb);
>   	skb_clear_hash(skb);
