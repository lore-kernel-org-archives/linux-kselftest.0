Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793765739;
	b=q60b9QRzwvafWECJ17Az7nqjt3g9U7d0GASY+03wO+phJHLEqs8EmxPTKXtqDaqUD03h
	 JM6QHZZJeJsVP20jBpVdl7kMz9wSeuKdgpYLikXpaJc4qAOId4qtrOvO8ehbISDwLJupF
	 DHL5iOVGp0BH516r9sQA8Zo0+5Ymo0rSrxTWSIVp6gxFZYDzvxkOIblf8v2CrNf6EP+j1
	 cAVeBPBKeaSFwiPrqnc7YWrR82hdHd3z9B+6PUuod8E0mYndce+2KgQH85UbxHVoPLId7
	 WnPvTVFbtrfQ7PnLjfTj1gLFtA9g7KHqAGPnkTMU0ox0B8Qsz2eDzHSjxJp08oOx4vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793765739;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=t33hTerwq+aQ3mBUBeIWL6pRcgQAoxI6zsMD8gzG6mU=;
	b=A3jZQ9R1lrJjyu7tG+K8yYwtjJ6KDFAxMmNIIO5m+tK+7HJ5pQI8uuI6fRSyP2/KSDul
	 U/LRg6BHkt3AMbFD8821tV07qnW/98lunjJW8xq2E2zmdgm/HtAV/rimYhc/a/ZlKOhWh
	 dM08PnzM99Yj/aUNFhxXCFIr1PZdZdjAY6VhoUBcblJycIeB34+5MD4epiahmj6mUUQLG
	 y+WqLSiTeo9TSryA5w8uStaoPdZZ1bQjOPzd5yLqVulTMQKgwvKVcP8FrvJjoqUPB+pss
	 QAwpthS92pQxLrtpvLIC0I1YFhrFzb1uEPGB/Oo9Wfuto6j8Ti4yGu1npKx5VdBuRUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Nm5tWPga;
	arc=none smtp.remote-ip=95.215.58.168
Received: from mta1.migadu.com (out-168.mta1.migadu.com [95.215.58.168])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC95606A329
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 04:15:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AC95606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Nm5tWPga
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=NxfwJu25c702HsG2QS65lReEnsmm0Rh4tGfKZ6I/Ny4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793765736; v=1; x=1794370536;
 b=Nm5tWPgalX68xFEfNNc38YSABIskZs6IG3VHTQJSocIT9xy+bmmlyDrpey5dO0uaTtE3Dxg2
 FlByApCrm5HoyBCjsWmgB3rQSOmlqx8bwsHCmfr5IN1jMcByvHN5l+GVTlUDRCh840ayfel0S83
 2LguG0x76ctHm9JLCq0RQ8t4=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4202d724f29ea87b;
	Wed, 04 Nov 2026 04:15:23 +0000
X-Mizu-Trace-ID: 4202d724f29ea87b
X-Migadu-Flow: FLOW_OUT
Message-ID: <ea399c85-c775-47a7-b42a-80a645ae16b9@linux.dev>
Date: Wed, 4 Nov 2026 12:15:08 +0800
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
Subject: Re: [PATCH net-next v4 1/7] ipv6: treat a negative optlen as 4 in
 do_ipv6_getsockopt()
To: Breno Leitao <leitao@debian.org>, David Ahern <dsahern@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Shuah Khan <shuah@kernel.org>,
 Eric Dumazet <edumazet@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 david.laight.linux@gmail.com, kernel-team@meta.com
References: <20261103-sockopt_expand_out_v2-v4-0-2d36da923578@debian.org>
 <20261103-sockopt_expand_out_v2-v4-1-2d36da923578@debian.org>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <20261103-sockopt_expand_out_v2-v4-1-2d36da923578@debian.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/3/26 7:01 PM, Breno Leitao wrote:
> do_ipv6_getsockopt() reads optlen into an int and never checks its
> sign. Most of what consumes len compares it as unsigned, so a negative
> optlen reads as a huge buffer, and the reply depends on the option.
>
> The int options clamp it to their own size:
>
> 	len = min_t(unsigned int, sizeof(int), len);
>
> so getsockopt(fd, SOL_IPV6, IPV6_TCLASS, buf, &len) with len set to -1
> answers 4 bytes and reports 4, rather than failing.
>
> The other options see a huge buffer. The sticky options reply with
> their whole header, IPV6_2292PKTOPTIONS writes every pending control
> message without a limit, and IPV6_PATHMTU and IPV6_FLOWLABEL_MGR pass
> their length check.
>
> do_ip_getsockopt() rejects a negative optlen, but doing that here would
> turn a call that works today into an error for a caller that passes an
> uninitialized length. Answer it as 4, as the int options do, for every
> option this function handles itself.
>
> That leaves the int options as they are. The sticky headers are cut to
> 4 bytes, IPV6_2292PKTOPTIONS gets a 4 byte control buffer, and
> IPV6_PATHMTU and IPV6_FLOWLABEL_MGR fail with -EINVAL, as they do for
> any other undersized buffer.
>
> MRT6_* is dispatched earlier and keeps rejecting a negative optlen, and
> the netfilter fallback still sees the caller's value.
>
> This changes what callers that pass a negative length see. It is a
> behaviour change, not a fix, so there is no Fixes: tag.
>
> The conversion of this function to sockopt_t builds its buffers from
> optlen, which the standard helpers reject when negative, so the answer
> has to be settled before that.
>
> Suggested-by: David Laight <david.laight.linux@gmail.com>
> Acked-by: Stanislav Fomichev <sdf@fomichev.me>
> Acked-by: Ido Schimmel <idosch@nvidia.com>
> Signed-off-by: Breno Leitao <leitao@debian.org>


Reviewed-by: Jiayuan Chen <jiayuan.chen@linux.dev>


> ---
>  net/ipv6/ipv6_sockglue.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/net/ipv6/ipv6_sockglue.c b/net/ipv6/ipv6_sockglue.c
> index 4b3536571c9804..700133e2fd11c2 100644
> --- a/net/ipv6/ipv6_sockglue.c
> +++ b/net/ipv6/ipv6_sockglue.c
> @@ -1002,6 +1002,11 @@ int do_ipv6_getsockopt(struct sock *sk, int level, int optname,
>  
>  	if (copy_from_sockptr(&len, optlen, sizeof(int)))
>  		return -EFAULT;
> +	/* Historic bug compatibility: take a negative optlen as 4, as the
> +	 * int options always did.
> +	 */
> +	if (len < 0)
> +		len = 4;
>  	switch (optname) {
>  	case MCAST_MSFILTER:
>  		if (in_compat_syscall())
>
