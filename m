Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793756282;
	b=wElK9YI0skdtafgWmKl0mNIx7JaxiUphJ2SrMN0fG+SXpa4uuaL2mp9lvgxGEMSbkk1b
	 lhdoEcuPyfJUTihi097KApcSn/L5YE4it4c4eH927BceZ2PgdWPsKCxajjqvBwWYbui82
	 JISS4FdDK/t6Von+DVOqQN1m9Xj8VqOnc6tm4ifEDSiD7NvW06+/YuHFvMZxTNv0/o4o9
	 hQq+n/Dadr+v2qdIB7v41OkD84Vxso49e6DvfNWqdEfTIE7rSD3rgGD1avZWCZ3K33Y1e
	 M+7BGvVYJ4i+8QV0jGzxSgHo/bJuXFA58oZmgkTPuvivihOPSibouCR2bxBy/kZKI7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793756282;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=FgcSD9ax0WdGI9fpiInHcfKnpxY7hfC0t/yQNA55Y0Q=;
	b=RCXQ6tja+cWrd3LMN7FnSRMkS7fb4QhoYCHaN6A68ll/ppJR+uC2PsjhLLK8R7wpvhaF
	 IBrKWp1150yTt6J+djbbFBtQwNuivELaJn9qFAFYIbHkGA9GkaTmhspAXyTMOPSgfPqz9
	 R2zMfWgHX+0lC7owci5GYkY7NMC6/cGv0nOKOXpmJH3MHucz1hZM3jqshsCfKwPUAY+z2
	 LOxc11TOgzQBjcFg7AUrqh76gGqz6sONNuvEKudeUcdGGGlMwZuPqIDDNI8y5JGdQ5wW0
	 SvgSqjI4M94YXig8okHasjyb8LL1788gVErK0CTGGLikhl7/xKJZt8OmNSBa5g3rM3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MW3fZoCk;
	arc=none smtp.remote-ip=95.215.58.16
Received: from mta1.migadu.com (out-16.mta1.migadu.com [95.215.58.16])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25683606A328
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 01:38:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25683606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MW3fZoCk
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=E5Dvk7Jwn0t9VqHeKuPd4vBHuyrl8j9bpEy97sjPz3o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793756279; v=1; x=1794361079;
 b=MW3fZoCka3mLdjVftrgeYlhANGHOe9Lo83aIn4550dmn2TZXImVIW8ioLS4rUbBQ3hZVgBYL
 jWiZZ7Fjb22fvyh+Vw6imSpRG3tVVhW95S4PSBnQ0zR7fsU/55VJhhQTR0AlnZiZ3Yczqagcdcy
 m2jrluD44x6mtpIwy+zynJvE=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id e86d122703929ebd;
	Wed, 04 Nov 2026 01:37:59 +0000
X-Mizu-Trace-ID: e86d122703929ebd
X-Migadu-Flow: FLOW_OUT
Date: Wed, 4 Nov 2026 09:37:48 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Sasha Levin <sashal@kernel.org>
Cc: Matthieu Baerts <matttbe@kernel.org>,
	Mat Martineau <martineau@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Geliang Tang <geliang@kernel.org>, Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	mptcp@lists.linux.dev, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: mptcp: pm_nl_ctl: print sizeof() with %zu
Message-ID: <auqMbPZ7fCCiXKR2@fedora>
References: <20261103155506.534973-1-sashal@kernel.org>
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
In-Reply-To: <20261103155506.534973-1-sashal@kernel.org>

On Tue, Nov 03, 2026 at 10:55:06AM -0500, Sasha Levin wrote:
> On 32-bit architectures size_t is an unsigned int, and printing
> sizeof(struct nlmsgerr) with %ld warns:
> 
>   pm_nl_ctl.c:73:71: warning: format '%ld' expects argument of type 'long int', but argument 5 has type 'unsigned int' [-Wformat=]
> 
> Use %zu.
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
>  tools/testing/selftests/net/mptcp/pm_nl_ctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/net/mptcp/pm_nl_ctl.c b/tools/testing/selftests/net/mptcp/pm_nl_ctl.c
> index 78180da1efcc5..36a6d39b31bbf 100644
> --- a/tools/testing/selftests/net/mptcp/pm_nl_ctl.c
> +++ b/tools/testing/selftests/net/mptcp/pm_nl_ctl.c
> @@ -70,7 +70,7 @@ static int nl_error(struct nlmsghdr *nh)
>  	uint32_t off;
>  
>  	if (len < sizeof(struct nlmsgerr)) {
> -		error(1, 0, "netlink error message truncated %d min %ld", len,
> +		error(1, 0, "netlink error message truncated %d min %zu", len,
>  		      sizeof(struct nlmsgerr));
>  		return -1;
>  	}
> -- 
> 2.53.0
> 

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
