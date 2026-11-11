Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.87
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794360784;
	b=3lGTfhbafkVRyCn3dXweHTAu+hADXAmViVk1CLgbO/M21GB0sL+vZK4/Tx7dfcUc8a2r
	 jNslOEbpjO7z2PMYAUJCFwofF7Hs3Fzf1ysmXKtFDmii21+vMje1pdOFAm7e5W5HnLOEm
	 QcpwJAdAgO8cS/ecQnJ+vKkAAqq6VgKtNT6TlZ58TsiOGxLZ3tx4WYojSEzDYygYdUnLm
	 TAiO4U2ntGF4nlG3Rnrf7NM6SsSxm/RxwDVNldxQsjd/7Eq54f2un2MTQB0iW49BAqwA5
	 joQOk43uJtSs1Mt+iQJ1EGlUCYo0HDEQwRCWZGPbr0i9lXhwXzC8W2DqqwLpXY01hhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794360784;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=X239ULUfyrkajaKunHQocU2OLTbPnPbw7F9duFc9+NU=;
	b=U6rQBhfRuqWczWR84mVss4G9/kwvNpLlxY5nyJybRs0KYsHsCjuI7h0p0xi988RWNtu4
	 TzYaSXrvKGr1i7dDKywFk8xF0+ol86AwpmKvfsCg+GcJTD+s8NdxHKCeIQ6RGVokPMsZ5
	 3RRWb650QmGuHM9tuyJwCvxMu811k4d3rrlWednNXNEaAFWBufFBXqEnh67QWia5OxvqM
	 dLWjAND+elsa+phJWB8/jj6bx58sE7SlCIFApHRkx/ix4kUvBAldN5k0H16e5bzS3m9Hy
	 C5DeW1E4zgMkUG8dd2IFwpj2ZIHP8ROJlnHoDozIINoMtRLbrIYeEc/ISzwGAJ8crfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bymnudtp;
	arc=none smtp.remote-ip=91.218.175.87
Received: from mta0.migadu.com (out-87.mta0.migadu.com [91.218.175.87])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A949D606A320
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 01:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A949D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bymnudtp
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DzAs0Ah3oQjKHGbmLPoxZJXiKj68MaVFY04XQvUCebE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794360781; v=1; x=1794965581;
 b=bymnudtpWXdkL9RA5rCZn+RZe5Ui5Ba8ew1IJLZ4K8caoSfCXwsNjacplXMBfpnjaM27rJ3D
 bkRhFRtQx2yTEBav/NLtaXfuecjxcxgrJfrIcf6/6vh2M0mxrFohmlvTYY6TqeQ8JLqawPtG1Jy
 X970BUWY8xH8l7koK1XIGw7U=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 66aefd4644d8a26d;
	Wed, 11 Nov 2026 01:33:01 +0000
X-Mizu-Trace-ID: 66aefd4644d8a26d
X-Migadu-Flow: FLOW_OUT
Date: Wed, 11 Nov 2026 09:32:49 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Jin Li <jinli@lanxincomputing.com>
Cc: dsahern@kernel.org, idosch@nvidia.com, shuah@kernel.org,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v2] selftests: net: forwarding: replace bash brace
 expansion with seq
Message-ID: <avPFwYGo8ssob1n4@fedora>
References: <20261110024123.535210-1-jinli@lanxincomputing.com>
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
In-Reply-To: <20261110024123.535210-1-jinli@lanxincomputing.com>

On Tue, Nov 10, 2026 at 10:41:23AM +0800, Jin Li wrote:
> {1..16384} is bash-specific brace expansion and will not work with POSIX
> shells like dash or busybox ash. This breaks the flowlabel test when
> /bin/sh is not bash.
> 
> Use $(seq 1 16384) for portable iteration. Fix the same issue in
> custom_multipath_hash.sh, gre_custom_multipath_hash.sh and
> ip6gre_custom_multipath_hash.sh.
> 
> Fixes: 555e5531635a ("selftests: net/forwarding: spawn sh inside vrf to speed up ping loop")
> Signed-off-by: Jin Li <jinli@lanxincomputing.com>
> ---
> v2:
> - Add Fixes tag
> 
>  .../selftests/net/forwarding/custom_multipath_hash.sh     | 8 ++++----
>  .../selftests/net/forwarding/gre_custom_multipath_hash.sh | 8 ++++----
>  .../net/forwarding/ip6gre_custom_multipath_hash.sh        | 8 ++++----
>  3 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/tools/testing/selftests/net/forwarding/custom_multipath_hash.sh b/tools/testing/selftests/net/forwarding/custom_multipath_hash.sh
> index 5dbfab0e2..92940370e 100755
> --- a/tools/testing/selftests/net/forwarding/custom_multipath_hash.sh
> +++ b/tools/testing/selftests/net/forwarding/custom_multipath_hash.sh
> @@ -224,10 +224,10 @@ send_dst_ipv6()
>  send_flowlabel()
>  {
>  	# Generate 16384 echo requests, each with a random flow label.
> -	ip vrf exec v$h1 sh -c \
> -		"for _ in {1..16384}; do \
> -			$PING6 -F 0 -c 1 -q 2001:db8:4::2 >/dev/null 2>&1; \
> -		done"
> +	ip vrf exec v$h1 sh -c '
> +		for _ in $(seq 1 16384); do
> +			'"$PING6"' -F 0 -c 1 -q 2001:db8:4::2 >/dev/null 2>&1
> +		done'
>  }
>  
>  send_src_udp6()
> diff --git a/tools/testing/selftests/net/forwarding/gre_custom_multipath_hash.sh b/tools/testing/selftests/net/forwarding/gre_custom_multipath_hash.sh
> index b4f17a5bb..19384be4b 100755
> --- a/tools/testing/selftests/net/forwarding/gre_custom_multipath_hash.sh
> +++ b/tools/testing/selftests/net/forwarding/gre_custom_multipath_hash.sh
> @@ -319,10 +319,10 @@ send_dst_ipv6()
>  send_flowlabel()
>  {
>  	# Generate 16384 echo requests, each with a random flow label.
> -	ip vrf exec v$h1 sh -c \
> -		"for _ in {1..16384}; do \
> -			$PING6 -F 0 -c 1 -q 2001:db8:2::2 >/dev/null 2>&1; \
> -		done"
> +	ip vrf exec v$h1 sh -c '
> +		for _ in $(seq 1 16384); do
> +			'"$PING6"' -F 0 -c 1 -q 2001:db8:2::2 >/dev/null 2>&1
> +		done'
>  }
>  
>  send_src_udp6()
> diff --git a/tools/testing/selftests/net/forwarding/ip6gre_custom_multipath_hash.sh b/tools/testing/selftests/net/forwarding/ip6gre_custom_multipath_hash.sh
> index b24acfa52..d848e82d4 100755
> --- a/tools/testing/selftests/net/forwarding/ip6gre_custom_multipath_hash.sh
> +++ b/tools/testing/selftests/net/forwarding/ip6gre_custom_multipath_hash.sh
> @@ -321,10 +321,10 @@ send_dst_ipv6()
>  send_flowlabel()
>  {
>  	# Generate 16384 echo requests, each with a random flow label.
> -	ip vrf exec v$h1 sh -c \
> -		"for _ in {1..16384}; do \
> -			$PING6 -F 0 -c 1 -q 2001:db8:2::2 >/dev/null 2>&1; \
> -		done"
> +	ip vrf exec v$h1 sh -c '
> +		for _ in $(seq 1 16384); do
> +			'"$PING6"' -F 0 -c 1 -q 2001:db8:2::2 >/dev/null 2>&1
> +		done'
>  }
>  
>  send_src_udp6()
> -- 
> 2.53.0

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
