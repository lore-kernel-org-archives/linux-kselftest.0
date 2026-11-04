Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793756915;
	b=lCa+/wF9pVWIe7aC6gvIvlfD2xLdUsckDZ0O6FIaYBKGwz+wiU+abYNLmALfU49N8wlO
	 BrFTBbv145LM8W1V77nrUcJGKdOCLt1qN2glWrdtnInjv59KYDEmdZ6uYR1TyGiDkJubL
	 WQKNKUJCpypn6s4HdBermEVrrLIqwawGO+rf5iBixu7r7M1hnAcAvFUf2k6ogUpy+SGZp
	 vHsJphpFxeCglTotq0C3AhypGL3j7oOAbWS2nI7J4hJLKOGbjcn5mE9m2G5/e9YhJi7iA
	 QZWQ/vgX0ztuI9Ho3mzXyWg2TtKcCTmYeWPW08/yKe20Xd09TdgeRqkC5jH1DiJrS6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793756915;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=f2BFXTdAQBceYdGgKEPFKvgQyU+hCrR2MmNjmw62mFc=;
	b=5RoIu8wvtNF+uWwpavDzU595TcvdXQaWW9iqS7R1ROJfGo5yCaQTG8y9wwhBLaScw7h6
	 1/ES4juo78zjA0rSBbfsG4GhwaNdu5v/YCwf4DKx+9ZgrQd4Dxn/NLgZviVoOTWmexYq2
	 mOGFLB1eIC3dWK2pCEXqrHEFY7kGAPWtV3g7QJDVSBUKIHtJLp4U+0TLF2OLqCynzQBBm
	 OjMkOS5vsCfWCqG5dJDOFhp/5Ld0OMK+4AIkpWXQHY/vtY65j9XFtIwzXS0ZlOigBDJC0
	 m/kS8tzgGRb/QYuncGJEUO2RyH4HEulM8gdERQugtV2rAEymuR7pQ1guYOJRLuQ3ZDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TxvoOO10;
	arc=none smtp.remote-ip=91.218.175.95
Received: from mta0.migadu.com (out-95.mta0.migadu.com [91.218.175.95])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D36C606A31B
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 01:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D36C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TxvoOO10
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ev8LN25R6PKVsQ0LgifHU6c5x8Koo0inMSGxpKLl1QM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793756912; v=1; x=1794361712;
 b=TxvoOO10icPR5yqYxKeGsrFPkkkwezzDOiuAis+nBsrpMqfO5Oiv/8rxK2r2ZQVqLPfyk/sr
 o//keH9MTn2pK0bfW15O4VY9pyvhfD+EYQz0TS8eXIvsZg8rivoBttDNwqTE8faW25La7aYVZ5e
 /2NucNxeOiMbJXEl71dMJgsU=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 949170bc90fe0f60;
	Wed, 04 Nov 2026 01:48:32 +0000
X-Mizu-Trace-ID: 949170bc90fe0f60
X-Migadu-Flow: FLOW_OUT
Date: Wed, 4 Nov 2026 09:48:21 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Sasha Levin <sashal@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Dmitry Safonov <0x7f454c46@gmail.com>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] selftests: net: tcp_ao: make the netstat column
 pointer const
Message-ID: <auqO5W4-hhd1brHi@fedora>
References: <20261103165419.687806-1-sashal@kernel.org>
 <20261103165419.687806-6-sashal@kernel.org>
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
In-Reply-To: <20261103165419.687806-6-sashal@kernel.org>

On Tue, Nov 03, 2026 at 11:54:19AM -0500, Sasha Levin wrote:
> lookup_get_column() stores the result of strchr() on a const string in
> a plain char pointer. Since glibc 2.43, strchr() returns a const char
> pointer for a const argument when C23 features are enabled, as they
> are with _GNU_SOURCE, so gcc and clang warn:
> 
>   lib/proc.c:61:16: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
> 
> The pointer is only used to compute the length, so make it const.
> 
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
> Found with gcc 16 and clang 21 on glibc 2.43; KernelCI's gcc 15 builds
> show the same warning.
> 
>  tools/testing/selftests/net/tcp_ao/lib/proc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/net/tcp_ao/lib/proc.c b/tools/testing/selftests/net/tcp_ao/lib/proc.c
> index 8b984fa042869..50062b527a393 100644
> --- a/tools/testing/selftests/net/tcp_ao/lib/proc.c
> +++ b/tools/testing/selftests/net/tcp_ao/lib/proc.c
> @@ -56,7 +56,7 @@ static struct netstat *lookup_get(struct netstat *ns,
>  
>  static struct netstat *lookup_get_column(struct netstat *ns, const char *line)
>  {
> -	char *column;
> +	const char *column;
>  
>  	column = strchr(line, ':');
>  	if (!column)
> -- 
> 2.53.0
> 

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
