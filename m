Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793756233;
	b=gXLtmJ85QbbY45a5ioNbkHKQ4bW9ibVRDd0CSbJG1nz/N4ZFEYns5XsNZFRmo7aCvtDP
	 v6XF1/2GtsQXx8N1ESVMcR0b/gGJnlfUidjrm2+A0DZlI0vTtS/0akC18N5ljtSKfavr/
	 XlfAzJzP6hmFVatTRT8Pl5VtpwMP3SEbZG2ODQVcnO7uTxDHzzznt/wL3UPNsiR2FBVSH
	 exB35TbUwJ7dpsKjWzpfdXOgtJoOnmk/EiFkucyvdfUT4o2bA02aIbdUq1Ayq7tNDK5pj
	 GAstH2oJ2yKQjNoPtmLIIMqiQhETkCmJxDLzNPEidrXfJlb1/YyMbJwxKb2iC9gY93A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793756233;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UO7Z5tsn7txdFCLAXrnod+ml4wDdbMy6SVmjOROOIxY=;
	b=ntmesuq/xB9FSF4SW2/xCneQ34WEcYRpdtvonMtnUIPryijlvttQBOE4Hs8M/7L8f9zS
	 QD1nTaRJgjT7ggu26IbR3JUB7kTd78cOAgraxFJZToZLUJ3uAL50gNW2b7Xzac2lvqg9S
	 VjTkq24eg2Oj17AYA7fkzIsZHKmVDrkpUlYWUdcvaWLghrtUyLa9TcGHxc22P/AIzdmOm
	 Abp+5plB1Wf0TXw1TQOskYLcqRM9LrqHTKLsXFjzo24Bh+INLUM1wCVxXYf9qgiv5MAL6
	 4L/H7H4gW/N5EdqzJJiki0roQXsxbpK6TsVDNkW7t5BYh6LGIStZNzDR9VtrdzUVrDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=l1zduyM3;
	arc=none smtp.remote-ip=95.215.58.232
Received: from mta1.migadu.com (out-232.mta1.migadu.com [95.215.58.232])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4D0606A330
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 01:37:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C4D0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=l1zduyM3
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ffKLXdFUxdazV2FKiPThxW70uDTjU2urA0VpiC9e5/c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793756230; v=1; x=1794361030;
 b=l1zduyM3a16NRzkhHAex74mVxwZjso2sza56O6C4oTVeHHcMTUFwd9kEzTU8pcLi+U0URmhQ
 rypucibmqL2HnxUkL1pSuYAFCRN+uHZ5txJjBhKaFtQcLFlhT2QFNiAro8JFAfq4t9zKPi4kRWL
 JYHI+xmlq2GRSYc0FhE/9jEU=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 6af974aafe6e345e;
	Wed, 04 Nov 2026 01:37:10 +0000
X-Mizu-Trace-ID: 6af974aafe6e345e
X-Migadu-Flow: FLOW_OUT
Date: Wed, 4 Nov 2026 09:36:58 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Sasha Levin <sashal@kernel.org>
Cc: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Jason Xing <kerneljasonxing@gmail.com>, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: net: fix format warnings on 32-bit
 architectures
Message-ID: <auqMOoEVdX805ZE7@fedora>
References: <20261103155503.534876-1-sashal@kernel.org>
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
In-Reply-To: <20261103155503.534876-1-sashal@kernel.org>

On Tue, Nov 03, 2026 at 10:55:03AM -0500, Sasha Levin wrote:
> On 32-bit architectures ssize_t is an int, tv_sec is a long long with a
> 64-bit time_t, and uint64_t is not a size_t, so ipsec, txtimestamp and
> the tcp_ao library warn when printing them with %ld, %lu and %zu:
> 
>   txtimestamp.c:191:42: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type '__time64_t' {aka 'long long int'} [-Wformat=]
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
>  tools/testing/selftests/net/ipsec.c                 | 2 +-
>  tools/testing/selftests/net/tcp_ao/lib/ftrace-tcp.c | 2 +-
>  tools/testing/selftests/net/txtimestamp.c           | 9 +++++----
>  3 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/testing/selftests/net/ipsec.c b/tools/testing/selftests/net/ipsec.c
> index 89c32c354c008..ba8c36a93f176 100644
> --- a/tools/testing/selftests/net/ipsec.c
> +++ b/tools/testing/selftests/net/ipsec.c
> @@ -2030,7 +2030,7 @@ static int __write_desc(int test_desc_fd, struct xfrm_desc *desc)
>  	if (ret == sizeof(*desc))
>  		return 0;
>  
> -	pr_err("Writing test's desc failed %ld", ret);
> +	pr_err("Writing test's desc failed %zd", ret);
>  
>  	return -1;
>  }
> diff --git a/tools/testing/selftests/net/tcp_ao/lib/ftrace-tcp.c b/tools/testing/selftests/net/tcp_ao/lib/ftrace-tcp.c
> index 27403f8750547..cd93ff8965dda 100644
> --- a/tools/testing/selftests/net/tcp_ao/lib/ftrace-tcp.c
> +++ b/tools/testing/selftests/net/tcp_ao/lib/ftrace-tcp.c
> @@ -504,7 +504,7 @@ static int setup_tcp_trace_events(struct test_ftracer *tracer)
>  	size_t i;
>  	int ret;
>  
> -	filter = test_sprintf("net_cookie == %zu || net_cookie == %zu",
> +	filter = test_sprintf("net_cookie == %" PRIu64 " || net_cookie == %" PRIu64,
>  			      ns_cookie1, ns_cookie2);
>  	if (!filter)
>  		return -ENOMEM;
> diff --git a/tools/testing/selftests/net/txtimestamp.c b/tools/testing/selftests/net/txtimestamp.c
> index f7bdf30b78d9f..be1452d73b303 100644
> --- a/tools/testing/selftests/net/txtimestamp.c
> +++ b/tools/testing/selftests/net/txtimestamp.c
> @@ -188,12 +188,13 @@ static void __print_timestamp(const char *name, struct timespec *cur,
>  		return;
>  
>  	if (cfg_print_nsec)
> -		fprintf(stderr, "  %s: %lu s %lu ns (seq=%u, len=%u)",
> -				name, cur->tv_sec, cur->tv_nsec,
> +		fprintf(stderr, "  %s: %lld s %ld ns (seq=%u, len=%u)",
> +				name, (long long)cur->tv_sec, (long)cur->tv_nsec,
>  				key, payload_len);
>  	else
> -		fprintf(stderr, "  %s: %lu s %lu us (seq=%u, len=%u)",
> -				name, cur->tv_sec, cur->tv_nsec / NSEC_PER_USEC,
> +		fprintf(stderr, "  %s: %lld s %ld us (seq=%u, len=%u)",
> +				name, (long long)cur->tv_sec,
> +				(long)(cur->tv_nsec / NSEC_PER_USEC),
>  				key, payload_len);
>  
>  	if (cur != &ts_usr) {
> -- 
> 2.53.0
> 

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
