Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.209
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793765777;
	b=ivtY9NIppAD+QFM+C+IHNwcXOA2BtCnmHRpZrA6YD/TbQCet24hOMJ989tZHxXCe9VL2
	 qj/jFk4SjNisNmPhka0Tz4t974CVP+/x0x9+kTTUrqQqJsQ8gSQnzAp3w4B8jfMO25VZ3
	 4a8HVq8+49+sGIbm5TRhXHVbv6x2BZQhS8FbWexJwxrC2mD+bO7sfJOiLSkKzZ8Krl0qa
	 KcUNJGbXLsEeArhC4zpuUO+lbxwfk105wzUzG7CqSh7l6WKQHLRE38Ux5b5WzwX/Fkyhk
	 kqMd1vPKmDFJIZQaqPA0RAbQHKpxXdhZA3rO3OVcs3loOBxkhVWGs7XJVldZUHtXKqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793765777;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=K/cIC+iFmdevIAI+I2RKVd6I0g7XOiCzAkoSeW4/ahA=;
	b=oKJIqdlsvmi+noY2hlF+qiigIZMIk+339TaMA1x4skXStx/KTHwIjR4viUOhurUxuqAI
	 1FabuYd38wSJ+Y0K92LHpFhmOgfz7aTAsiPRgIJ6WUPBknLh4nUytY21/i9wJAl0e0UK6
	 A5xP98iAZLupzXeYGBkwhNuHwl99sJYl70TFzqu0Dwi/K6iAyrHq7d73RwQQEGEkvvGL/
	 7CwGGY+uv4xgvAgIXZYsY+zObxb6gInQD+sC+rs6feCYBE+/2b8QHcEUZerzLiAffU8EB
	 RILYMux4lthBEXoyjH6djwaXdG30beADStnGBLFs0553SEbGnuaeIINan0FLEQwGFDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LNUU7qPI;
	arc=none smtp.remote-ip=91.218.175.209
Received: from mta0.migadu.com (out-209.mta0.migadu.com [91.218.175.209])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0CA606A326
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 04:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED0CA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LNUU7qPI
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=vOi5qQ0/DXnG4QFkyblinf0P8GKtrfv4uQiJ8Uvnh54=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793765775; v=1; x=1794370575;
 b=LNUU7qPISHeNMf+Xt94WOcs4HzuuX08Byn+sE4A23zPN8pio7vBsgKedPtE2fJR080h2pZrg
 CREfyOw0Jve4CfA60hcS4+/2C4mxuPMtI0cgjn96+03bQtqefVXJLMo4cy7RISLWetbqf4TC5fc
 iQkZBa0TIRuGd/dhvSGu3xjs=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5164afd9a38a0a63;
	Wed, 04 Nov 2026 04:16:14 +0000
X-Mizu-Trace-ID: 5164afd9a38a0a63
X-Migadu-Flow: FLOW_OUT
Message-ID: <bb64096f-2c73-428b-ac74-881227539a2f@linux.dev>
Date: Wed, 4 Nov 2026 12:15:51 +0800
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
Subject: Re: [PATCH net-next v4 2/7] net: cap sockopt_expand_out() at
 MAX_RW_COUNT
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
 <20261103-sockopt_expand_out_v2-v4-2-2d36da923578@debian.org>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <20261103-sockopt_expand_out_v2-v4-2-2d36da923578@debian.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/3/26 7:01 PM, Breno Leitao wrote:
> sockopt_expand_out() grows the output iterator up to INT_MAX, but the
> MCAST_MSFILTER getters converted by the next two patches rewind it with
> iov_iter_revert() once they know the real reply size. iov_iter_revert()
> refuses to unroll past MAX_RW_COUNT:
>
> 	if (WARN_ON(unroll > MAX_RW_COUNT))
> 		return;
>
> MAX_RW_COUNT is INT_MAX rounded down to a page boundary, so a caller
> that expands into the (MAX_RW_COUNT, INT_MAX] range and then reverts
> hits that WARN_ON, and the iterator is left where it was instead of
> rewound. So does a caller whose optlen already covers such a size.
>
> Cap the size at MAX_RW_COUNT instead, before the early return for an
> optlen that already covers it, so a size that could never be reverted
> later is rejected up front.
>
> Sashiko found this while reviewing the conversions.
>
> Acked-by: Ido Schimmel <idosch@nvidia.com>
> Signed-off-by: Breno Leitao <leitao@debian.org>


Reviewed-by: Jiayuan Chen <jiayuan.chen@linux.dev>


> ---
>  include/linux/net.h | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/include/linux/net.h b/include/linux/net.h
> index e2a866fbcfa5ea..de56f89d475ee2 100644
> --- a/include/linux/net.h
> +++ b/include/linux/net.h
> @@ -80,16 +80,21 @@ static inline int sockopt_init_user(sockopt_t *opt, char __user *optval,
>   *
>   * Call it before writing through opt->iter_out: it re-anchors the iterator at
>   * the head of optval. Only a user buffer can be longer than the optlen the
> - * caller declared, so a kernel-backed optval is refused with -EINVAL.
> + * caller declared, so a kernel-backed optval is refused with -EINVAL. So is a
> + * @size above MAX_RW_COUNT, which iov_iter_revert() could not unroll.
>   */
>  static inline int sockopt_expand_out(sockopt_t *opt, size_t size)
>  {
> +	/* iov_iter_revert() refuses to unroll past MAX_RW_COUNT, so a size
> +	 * beyond that could never be reverted back to the fixed part later,
> +	 * even when optlen already covers it.
> +	 */
> +	if (size > MAX_RW_COUNT)
> +		return -EINVAL;
> +
>  	if (size <= (size_t)opt->optlen)
>  		return 0;
>  
> -	if (size > INT_MAX)
> -		return -EINVAL;
> -
>  	/* Re-anchoring reads iter_out.ubuf, so the iterator has to be a user
>  	 * buffer that nothing has written through yet.
>  	 */
>
