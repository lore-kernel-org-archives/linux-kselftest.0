Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595783;
	b=pW32sQiwY7Vtypu6E4f6o7ptuuKdmcx1x/7BKGD9U95Vq30jB2Ug7nIl54jtduscqUp2
	 oJNDnpDjPxxd8aBpo9fwDVM5OGKSsyjkLJkq3SJR6547cq71mBBUkbF+Jsmnab8U7XJss
	 WAaDJbnCj8szOFK3R1LeJn/cNLCRWsYNuBzpMQ+pAQAUG0guZtEWDb9t1EBQlwcKQZafT
	 /DoWGQccoPa/AHoO2xksO7YXo3um94OG3dZYpHxY1umNV0G+zc6+G5lWsWokAtgH2SjQv
	 V3wLeLmXfI8OTGDrfkY9L4/d1X9n4OQrBRYmlV/UrcuFip0/IbDBiR0yqPry1m5fTcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595783;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=XN1gQ3fRYIMVA+6ax3yiapPYj8MwIH2f0iCjt0MzEgI=;
	b=IcTEnKQCgX377GqCUnevaD9jVrHS3Y89eFjUzJgIODliaZK+rsm+AR7+xiSJg4wfKSz0
	 cRC8hk/KQKQS9FA/wSVGx6Kxhg3iqH3ZT5Bn9JKGaRbuiX/CkJtkgeja8JdezGSJy9bJm
	 g0es9iztjdR1unE57axtifSeGjHbJCBGlGH/Xx39t/1Xn9GsKL8+WiyTOrVSdNDspV43k
	 d8BgBNcyaufHyAwdPT0GpcpEI1dv5PrHv9Rlk7dYlc50hM1H5yCTu0RwfCdNTmPuJyeNK
	 k13eTmAe03xufw8+C9VDzIcR8ologLOj3sbUR3BtOcJX9sCC7VNtt1plX5men3+pKeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uUB6M9Sq;
	arc=none smtp.remote-ip=91.218.175.180
Received: from mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833E4606A323
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 08:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 833E4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uUB6M9Sq
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=0K/8LEcVyCEO3ne/hj4xdKmWz5s3ulj/xr0pxKVqumo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795595780; v=1; x=1796200580;
 b=uUB6M9SqsBLfhlz6JpDefD2OwXuH6CtXMAi+jJNqxKTPWsm00OKAJKd14yIxa5K3V8RFll3J
 jIBUgmPZg/zjlLQlm595HlZnyMV2dP/Wc1UkVGegk14AtoFc7IT4DqRh+QNpk833+9fxV3YlWV7
 bVDfsCMV98cg7qCwCNMRttIU=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 1a54a8f12ba78d2c;
	Wed, 25 Nov 2026 08:36:20 +0000
X-Mizu-Trace-ID: 1a54a8f12ba78d2c
X-Migadu-Flow: FLOW_OUT
Date: Wed, 25 Nov 2026 16:36:10 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Jingjing Xu <xujingjing@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kuba@kernel.org, edumazet@kernel.org, pabeni@redhat.com,
	horms@kernel.org, shuah@kernel.org, willemb@google.com,
	annaemesenyiri@gmail.com, idosch@nvidia.com
Subject: Re: [PATCH net-next v2 3/3] selftests: net: cover zero receive mark
 and priority
Message-ID: <20261125083610.GD184281@Liu-laptop>
References: <20261125064110.1396439-1-xujingjing@cmss.chinamobile.com>
 <20261125064110.1396439-4-xujingjing@cmss.chinamobile.com>
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
In-Reply-To: <20261125064110.1396439-4-xujingjing@cmss.chinamobile.com>

On Wed, Nov 25, 2026 at 06:41:10AM +0000, Jingjing Xu wrote:
> Exercise SO_RCVMARK and SO_RCVPRIORITY with zero values as well as the
> existing nonzero values, for both IPv4 and IPv6. These cases catch using
> the expected metadata value as the ancillary-message enable flag.
> 
> With the new tests and the original listener, four of eight cases fail
> and the corrected script exits with status 1. With the fixed listener,
> all eight pass and the script exits with status 0. The original four
> cases also pass with the original listener. Verification used real UDP
> sockets in isolated network namespaces; discovery and testing were
> AI-assisted. No kernel instrumentation or fault injection was used.
> 
> Signed-off-by: Jingjing Xu <xujingjing@cmss.chinamobile.com>
> ---
>  tools/testing/selftests/net/test_so_rcv.sh | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tools/testing/selftests/net/test_so_rcv.sh b/tools/testing/selftests/net/test_so_rcv.sh
> index ae01fa3c5329..3263ba2d1a67 100755
> --- a/tools/testing/selftests/net/test_so_rcv.sh
> +++ b/tools/testing/selftests/net/test_so_rcv.sh
> @@ -11,6 +11,8 @@ FAILED_TESTS=0
>  declare -A TESTS=(
>  	["SO_RCVPRIORITY"]="-P 2"
>  	["SO_RCVMARK"]="-M 3"
> +	["SO_RCVPRIORITY_ZERO"]="-P 0"
> +	["SO_RCVMARK_ZERO"]="-M 0"
>  )
>  
>  check_result() {
> base-commit: 57f165ff2f30491bc3511d24a52ca516751a268b
> -- 
> 2.53.0
> 
> 
> 

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
