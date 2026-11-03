Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793728793;
	b=U3JHhjnLM19/KA+5iBkHXW4rQa0+88nIbK5zF5uB5CF7QXKGp7/j/YVHHMK5SG8Xnq8S
	 l2KkMD5YWwTthUZQdZg3QH1Sdpo+A+GdJ9WyjW51UnO/6Wlng0DNDcjCeVohr4qWWm57N
	 aR1BxnZA/HL9PNrWC/2oP8FqGhaja92uX3zGrfuy1z3tcmV1g3KSbdewLeZyI/8x9nxv1
	 54/xWfpMl1tz2Htbsp5AMRKEZt9jF74dO1BWyhwDeev/Eb2di0ukr6W146weU/32qn69u
	 x7hXxFS+e453vzoevT+YwQP0gj1t35ICLXNlLNnNo2v4WGM2I+n9KeFT2ZuS6bHJcsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793728793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=2F2lIdK086BENYIYPQD2Q2okdf2dHEkNd/6V9465bEA=;
	b=lceJC83JMxbRJ/YIteTGuUThkXaJEww8WrP8XCaItTr2TjKDVzlu2U6YZZUC5XwCwWNE
	 Ei3wvZmWXFHyT7HFcZm61Wjazri9LTrz4755KvI/NzgMnUqEQWAA6rKuF/K6xL2YVO8wC
	 FAQ7xiiDZuSHyWqeyBJCjwFDQhkzaVZgGEG9kSk4birt9Q/sA8XUSMYUwsXwtSDSALTvE
	 fZcLbfHqQ4lffZSSPriZxELZnQWokv8x5s51ZOABBQVD9pR9QGBe2ahS4arFQboer3mx/
	 7Kd8lIZBhRr+wQ4h6flhtz27pOIVIYVZ7bAGqLwLoXWrPlyuAIEIigfWgWT/lE+sbbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TCjz6mkB;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7234F606A328
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 17:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7234F606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TCjz6mkB
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1ae18eb9b69so3323047c88.0
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 09:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793728792; x=1794333592; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2F2lIdK086BENYIYPQD2Q2okdf2dHEkNd/6V9465bEA=;
        b=TCjz6mkBL99yj7gcdlCxhkwe/S1344iWFLlicIpOOL8sh5AZPdcffvifLfg7haM9pE
         zST8Mq20JhE4GJsoCQm3Hwz8nuKlSI46LWNjKkhhLnLHo70247g6nrlv1k7bM1ysBw7Y
         ZqLAIsi9gkq6nv1jr34z/oW128mpWH0hWG5frvuyXcVCEspkykU7rWa13cfbPUyEsPge
         JqVpeLojl3l4YjD9R+CPkz42fMdWKiZpONPHyU4iryYbge7Rzow2PCCVWBkz54rXMgnY
         PLg2ce51LXdHBAN6WX80jHcpLsHMucqmRZILe2gC4Oq+Qt/W7PxCCuXq4uBFr6XJdMz+
         FHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793728792; x=1794333592;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2F2lIdK086BENYIYPQD2Q2okdf2dHEkNd/6V9465bEA=;
        b=2QPqjRXGOAY8YDqFN9BRhpBSo2YR4Cu5pnhgfi4ZIUCbwNuVlw+APDRa+qZN/hiBL5
         LhKS2lypo+G3P74UlI2hZ5QjfKkg7S+EORyv/YWSCWirHL58k+/Z6kZpZfPrg/izSue5
         GkNY7RbPsTEFXCuM7XM6NnbEbufP26+X/J3i3k/QnYJZYjVKPTBAJGxp6H1F2+P0w4tH
         OZ1H6plyNu7cEKpJoI3Gj8oiOTTeS9UOJRTmR6O5pUK74xqFuOrmOPnrUD2Gx+G9buZU
         wKB26PDaMBVuMVvUpMJj/w6We2Pj/TKamj3/xARfqpZZMtdsetJRYFXWjTk2pX8SAj1s
         5YfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwd53Jz6xyMUeu9kqs2CjWBar2Q7usvu8Se3/AoNcgaeN87JGn90e8telR0p3BDk/iAcnthWJWweuQZ2qeWq4I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9Jn5MZ2rpGPDWxeWRCwK3JB4Uw2IyTJRaejXtyBwA0V6TmlO8
	vpdjnrLJJxJvRGMbkZU2U5O9i1NYuK1vfb6Ic7lZ7GftS2to9cJsSCme
X-Gm-Gg: AYBFou3iVruWchZ+7biHM1Irx74VFA5L/xgXEF0wxxwN93I6NA3yVNttDrV+JS1oVWG
	IdHW2pFTLAQpD9Ut+CYZPGhm+WCx538dBavaHtWCazEqGfeKozCGI2/+95Fhg4D95NOcZJcZ3Qe
	YhxC/0lfK6jQp35o8GxbtSPAZCruPV1p7AHO3NtNPAAlpuQagpHgxEjqqXDONFZPRH0deLPNe2I
	u3MZVhglIHkUWwffliBWczI/yNf8h/cv27QPiYJRRJxJF4GgvKpn+TwCDPKvpA+UMYBqujgAmIE
	VPpncM/2ro1V+tFxjTKXchpO+EjCnB5t7LlHnTWmjAywF3bm54TsAErnywZzg9Rbolr7s0yj8ul
	JxA4dQbLNaJsoPOkbgFWZfCKqKzw/rQtq+2nMzs4C+gKSEcsKKOIkXO6WY8wFfy5fRpTI6WAo8/
	2wFP8P01Z91JUuUfZWxnVywZSPcQWhA8JnUgi9Tq+rR5P+0u8lzJg6/x/RXRz7N9xZqi8Twjl03
	YF5c27B88Z93Pmv790r0VuJOHrlBz9ysjJVh9NGujWLS5Jiyl1BL6wkaOIVqdB3OwWCPSRweRWe
	KKBBS1nQUy3i6a/pfgL/NgGv84zSnkHTjnKSGQu1j8BXvsKTH56CtQjFOWx6bDfq3g==
X-Received: by 2002:a05:701b:420c:20b0:194:f017:5a01 with SMTP id a92af1059eb24-1ac5fc0d363mr20693907c88.42.1793728791460;
        Tue, 03 Nov 2026 09:59:51 -0800 (PST)
Received: from ?IPV6:2620:10d:c085:21c1::14ac? ([2620:10d:c090:400::5:e3cc])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c65194sm427461c88.19.2026.11.03.09.59.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 09:59:51 -0800 (PST)
Message-ID: <cf4b221c-cf4b-414f-b087-815848c85b2e@gmail.com>
Date: Tue, 3 Nov 2026 09:59:49 -0800
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
Subject: Re: [PATCH] selftests: net: fix format warnings on 32-bit
 architectures
To: Sasha Levin <sashal@kernel.org>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Jason Xing <kerneljasonxing@gmail.com>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261103155503.534876-1-sashal@kernel.org>
Content-Language: en-US
From: Mohsin Bashir <mohsin.bashr@gmail.com>
In-Reply-To: <20261103155503.534876-1-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/3/26 7:55 AM, Sasha Levin wrote:
> On 32-bit architectures ssize_t is an int, tv_sec is a long long with a
> 64-bit time_t, and uint64_t is not a size_t, so ipsec, txtimestamp and
> the tcp_ao library warn when printing them with %ld, %lu and %zu:
> 
>    txtimestamp.c:191:42: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type '__time64_t' {aka 'long long int'} [-Wformat=]
> 
> Print ssize_t with %zd, tv_sec as long long, and the net namespace
> cookies with PRIu64 as the rest of ftrace-tcp.c already does. While at
> it, print tv_nsec, a long, with %ld instead of %lu, and cast it to long,
> as it is a long long on x32.
> 
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
> Found with a 32-bit build of the selftests with a 64-bit time_t (gcc 16
> and clang 21 with -m32 -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64);
> KernelCI's 32-bit arm builds show the same warnings. The changed files
> build without format warnings there now, and the x86_64 builds don't
> change. The other selftests get the same kind of fix in separate
> patches.
> 
>   tools/testing/selftests/net/ipsec.c                 | 2 +-
>   tools/testing/selftests/net/tcp_ao/lib/ftrace-tcp.c | 2 +-
>   tools/testing/selftests/net/txtimestamp.c           | 9 +++++----
>   3 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/testing/selftests/net/ipsec.c b/tools/testing/selftests/net/ipsec.c
> index 89c32c354c008..ba8c36a93f176 100644
> --- a/tools/testing/selftests/net/ipsec.c
> +++ b/tools/testing/selftests/net/ipsec.c
> @@ -2030,7 +2030,7 @@ static int __write_desc(int test_desc_fd, struct xfrm_desc *desc)
>   	if (ret == sizeof(*desc))
>   		return 0;
>   
> -	pr_err("Writing test's desc failed %ld", ret);
> +	pr_err("Writing test's desc failed %zd", ret);
>   
>   	return -1;
>   }
> diff --git a/tools/testing/selftests/net/tcp_ao/lib/ftrace-tcp.c b/tools/testing/selftests/net/tcp_ao/lib/ftrace-tcp.c
> index 27403f8750547..cd93ff8965dda 100644
> --- a/tools/testing/selftests/net/tcp_ao/lib/ftrace-tcp.c
> +++ b/tools/testing/selftests/net/tcp_ao/lib/ftrace-tcp.c
> @@ -504,7 +504,7 @@ static int setup_tcp_trace_events(struct test_ftracer *tracer)
>   	size_t i;
>   	int ret;
>   
> -	filter = test_sprintf("net_cookie == %zu || net_cookie == %zu",
> +	filter = test_sprintf("net_cookie == %" PRIu64 " || net_cookie == %" PRIu64,
>   			      ns_cookie1, ns_cookie2);
>   	if (!filter)
>   		return -ENOMEM;
> diff --git a/tools/testing/selftests/net/txtimestamp.c b/tools/testing/selftests/net/txtimestamp.c
> index f7bdf30b78d9f..be1452d73b303 100644
> --- a/tools/testing/selftests/net/txtimestamp.c
> +++ b/tools/testing/selftests/net/txtimestamp.c
> @@ -188,12 +188,13 @@ static void __print_timestamp(const char *name, struct timespec *cur,
>   		return;
>   
>   	if (cfg_print_nsec)
> -		fprintf(stderr, "  %s: %lu s %lu ns (seq=%u, len=%u)",
> -				name, cur->tv_sec, cur->tv_nsec,
> +		fprintf(stderr, "  %s: %lld s %ld ns (seq=%u, len=%u)",
> +				name, (long long)cur->tv_sec, (long)cur->tv_nsec,
>   				key, payload_len);
>   	else
> -		fprintf(stderr, "  %s: %lu s %lu us (seq=%u, len=%u)",
> -				name, cur->tv_sec, cur->tv_nsec / NSEC_PER_USEC,
> +		fprintf(stderr, "  %s: %lld s %ld us (seq=%u, len=%u)",
> +				name, (long long)cur->tv_sec,
> +				(long)(cur->tv_nsec / NSEC_PER_USEC),
>   				key, payload_len);
>   
>   	if (cur != &ts_usr) {

Reviewed-by: Mohsin Bashir <hmohsin@meta.com>
