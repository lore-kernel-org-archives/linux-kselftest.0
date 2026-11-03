Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793747236;
	b=YlTPy3cm+FfM6+u9esn7PMjFBt24e7BfnlfzlxuA9vpH4wBS9h1RrUaQHBY++2OLJ+Pp
	 YpWq4c2QH7grDgmNg75h5g5Y2eKuHt3ZgRhBi6WY5ryXZm+p+bLUqTX39K1P+q4WCVLRq
	 p6Q18iyR84OJlXBXFZMUfSUWRKrjF0pooBs03ZgEtPnv6sEaBGYiAbCrPAEwdk3ej1btU
	 PezCoSh/dYtBmylYX2ObiQ4YBBlubUglTCukgQ9YDQ+4Pb2QhKmy6wuRaFC9F4UUzMNqf
	 11HEwfsFCrYkPrKxgu96GwgsCiT/jZS+Vam21pKHmRccDKqvRCEzl4JurzkmObaXs+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793747236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=NEFwsaly/pYEQSMPZ8dIr6fdqKf0QWqwNabPuOPmqrE=;
	b=DabnM9d/SdE2F6BoaYo3eI0YPABNLjIFxicF1oA+CJi8/jBnBlAiS5JYFdsIWViTHynN
	 L+o24eK8trbRY9Qxkeh4D2X3aLveN+uQwLpn3GPKdUN/taxovSmJ7u4oVFnedGv25qOUJ
	 5nHGk7KPj6Ot6CSZ9Q9p2cOeGnsMhv21XQ2h4Ra5PbL0SLmCE/7rCln/f1wQrWOmrWiUP
	 90Q07bJFYQWC9mQl18WN39WujuAxkwPRUko3hnMGgIZ1izjuyTYTjAODcCv4AJnDI3VW6
	 CZy4+00S0hMuwUkUjnfAEYgCz25tnPEftRaijmXLk0UgeiGvsOsHryOOS0FdpWOPIvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=F1hoXgMf;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1073E606A32E
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 23:07:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1073E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=F1hoXgMf
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so57346a12.3
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 15:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1793747235; x=1794352035; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NEFwsaly/pYEQSMPZ8dIr6fdqKf0QWqwNabPuOPmqrE=;
        b=F1hoXgMfAF0/YbEteRqywfhn3WDCOe4J+F7YsQfU+D/3o6FmVI2GwIO0WaM1ac3baR
         35ufkik72WxSbkFRY1fRv5bpxm5vqEkgCD3Ry3wd3KX4fSQ5h3k1T6JTywj8JW1BiUAN
         BJDk/LfHH0wjrSawD0qSpmMjDcJHLbrEs0pX7M6rHzXtfw6544U58ogzWEn0XlTP9WNI
         PX70yT6wNU8OUsv6fQPZ3psN/mJhhv4Al/IZiqXWsFzrMdy63A6V/Vq0RQBoDoDCESwX
         He1opzYj99jkXpfmO09oP2DTaQHyfTbXm3byGlSEnla8MbyTnxubrAvL/NdTbb8kIoEE
         65nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793747235; x=1794352035;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NEFwsaly/pYEQSMPZ8dIr6fdqKf0QWqwNabPuOPmqrE=;
        b=Bh6pS2YqJjDJE05nqZrx5mj8aNX0UudacMbYz59+9+cfmsEcCXBoRYXdE/8Xru0ESa
         iTbn4sUYYS3OoIYh5bcWaAz1od7HEwvfkSziMKcHr5IDGduKt5sqTQyRL6dWTOdQ9K93
         Gtx6wviO2I6KmWceuvNanoZOp60t3s2Qclw/pXFQPYvY7L38kKoGnFkE/2fwdmMOs96L
         O3QFeHiX64IATgm16f/2IJkNCntjxXtpR4F92YUwqwvXfyR2b2SKFVO3hflu461mqOgx
         X+bqQ4rUqzV9B02ni7ou1MsNL3uLUSdEUMB3G5JDWL0Nfp47RihREZUF5alvo72vXe2N
         DZFw==
X-Forwarded-Encrypted: i=1; AKwUvBw0dj+NDxbDyYf5WgPZL5hSTdkEK9oerjLTCHMmNeejK+CM3afwyISOSUpVHg5AeVQxeIlt32hyyiq2MSNdRVo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IZM6iG85slBXWohdV94LXa4Tm2ceiXIG0ciU7ku4XLNKLQrlS
	5q65IQpeq9mHttSKB1aDmh2E0lt7YdOudBGhi9/bUS9MDi1CJeAAj+NH+spO6UzBuWk=
X-Gm-Gg: AYBFou1RYjPDgJGFF+KlgLS2Iuighg1QLqx7qqS69Nc3mY4OWTUpV8+Jn0gvxX58Kne
	HHZtAhhYUgMd4qbUQpN/ZnBKxZNLDApnrMnA1oYiLop/z+iCUfaRjE2+YFc3BMHclCGiUG520Pg
	IqpHcyD6EYiGpT6aanDrYc1g4mvvKjDzHyDpYCSn8V3B1LOSSjaPqDxIKqHtaVk2U1MIKKvczN0
	M88QkSlXkFbkNyJbSDwkBVWC/yozLV0EIUGpgeDpKwpYtWMEJKNswE/hO3vJRUBlsy4XXDzCZju
	N59GkThCxu9sA8LbAX2okjWDbfAYJum5n66ZK+6gN6VS5GJlwrs6u2KbDIRcWdRhJprLbPIqr6F
	Hz6CIKLB7CJnOw6pWkB7Vkt4uBs7H3ESGBs1faNlNuepxWYFtwE/TtUZrPirswVKFucSaVm41bZ
	IJkFVPoIRPDjfoyw6BYYelXJBZahDRTO4HDJa8Sls3IKgm2XZNmjAXMxGJqj3LMsblgZ/ptToTw
	dFNFjX4tSCehT9sD6/UZD0oMZCdL3webtgkgXL9w0/hG5bIjd4tyjOgLnlj1ifYbjKGXaixTld3
	aW675X+hE2fzjLHgxPsQNN0EKb9xGgC0MzqdPJhr9A==
X-Received: by 2002:a17:90b:584c:b0:3ac:fe93:a731 with SMTP id 98e67ed59e1d1-3ae8981e640mr10743037a91.56.1793747235227;
        Tue, 03 Nov 2026 15:07:15 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:54::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb46444698sm276077a12.4.2026.11.03.15.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:07:13 -0800 (PST)
Date: Tue, 3 Nov 2026 15:07:12 -0800
From: Joe Damato <joe@dama.to>
To: Breno Leitao <leitao@debian.org>
Cc: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>, Shuah Khan <shuah@kernel.org>,
	Eric Dumazet <edumazet@kernel.org>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org, david.laight.linux@gmail.com,
	kernel-team@meta.com
Subject: Re: [PATCH net-next v4 5/7] ipv4: convert do_ip_getsockopt() to
 sockopt_t
Message-ID: <auppIKnm1NvzBIzH@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Breno Leitao <leitao@debian.org>, David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>, Shuah Khan <shuah@kernel.org>,
	Eric Dumazet <edumazet@kernel.org>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org, david.laight.linux@gmail.com,
	kernel-team@meta.com
References: <20261103-sockopt_expand_out_v2-v4-0-2d36da923578@debian.org>
 <20261103-sockopt_expand_out_v2-v4-5-2d36da923578@debian.org>
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
In-Reply-To: <20261103-sockopt_expand_out_v2-v4-5-2d36da923578@debian.org>

On Tue, Nov 03, 2026 at 03:01:04AM -0800, Breno Leitao wrote:
> Convert the SOL_IP switch and ip_mroute_getsockopt() to sockopt_t, its
> last leaf on a sockptr_t pair. The IP_MSFILTER and MCAST_MSFILTER
> bridges go away.
> 
> ip_getsockopt() builds the sockopt_t with sockopt_init_user() and
> writes optlen back unconditionally, because IP_OPTIONS and others
> report a length and can then fail. ip_mc_msfget() therefore stores its
> length only after its last copy, so a copy failure can't report a
> changed one.
> 
> The write-back also happens before the netfilter fallback, so an
> unwritable optlen turns any error into -EFAULT and skips the fallback.
> Likewise optlen is now read before the level check and the MRT_*
> dispatch, so an unreadable or negative one wins over -EOPNOTSUPP.
> 
> IP_OPTIONS with no options set and IP_PKTOPTIONS used to return the
> result of copy_to_sockptr(), the number of bytes not copied, so an
> unwritable optlen made getsockopt() return 4. They now return -EFAULT.
> 
> sol_ip_sockopt() builds the sockopt_t with sockptr_to_sockopt() and
> stores optlen back as well. This extra code will go away when we
> convert sol_ip_sockopt() to talk sockopt as well, but for now we are
> converting the leaves.
> 
> Acked-by: Stanislav Fomichev <sdf@fomichev.me>
> Acked-by: Ido Schimmel <idosch@nvidia.com>
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  include/linux/mroute.h |  4 +--
>  include/net/ip.h       |  3 +-
>  net/core/filter.c      | 18 ++++++++---
>  net/ipv4/igmp.c        |  3 +-
>  net/ipv4/ip_sockglue.c | 87 +++++++++++++++++++-------------------------------
>  net/ipv4/ipmr.c        | 11 +++----
>  6 files changed, 56 insertions(+), 70 deletions(-)

[...]

> @@ -1711,43 +1707,25 @@ int do_ip_getsockopt(struct sock *sk, int level, int optname,
>  	case IP_MSFILTER:
>  	{
>  		struct ip_msfilter msf;
> -		struct kvec kvec;
> -		sockopt_t opt;
>  
>  		if (len < IP_MSFILTER_SIZE(0)) {
>  			err = -EINVAL;
>  			goto out;
>  		}
> -		if (copy_from_sockptr(&msf, optval, IP_MSFILTER_SIZE(0))) {
> +		if (copy_from_iter(&msf, IP_MSFILTER_SIZE(0), &sopt->iter_in) !=
> +		    IP_MSFILTER_SIZE(0)) {

The line wrapping is a little weird looking to me. Not sure if there is
anything that can be done about it and not sure it would be worth a re-spin
just because I think it's a little ugly :)

Reviewed-by: Joe Damato <joe@dama.to>
