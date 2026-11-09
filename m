Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794189463;
	b=XIdPX0laAj63/K+dLniALhb9HKkukEDgxLbqS6zmhXF2Sq1IuGcEVJ2hWa41mEoKH0jN
	 Tcv6jscZtRldnVRBSbOPlCvLCb6BYxBBmgpNMKWVEwE/T/18kt7wClAV/LghUPNEIu+e4
	 /dQUxRm9EEi+eyvQTI8eseF8kGtakLlLptrv2lU/56fNNmIh2Lh0PKu51ENXO39HeF66S
	 VRmJTrcwjsmMtvigX4mn86GckfgL0sL4Iv8P3PKv+WjWbKHwp8mU39e+bSw+1SZYQXGl6
	 sqTU5uShV0g92jDgbLPut174NHuqqG9lpAQEWQtrZtZ9HLDrDr+9UTUSJah/xmvYviQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794189463;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=A7ZxBYqNVCXEXK6aupNcjX9RAPitglwASVMpqA1lXnk=;
	b=E/oPUVxS77U9/AiT07+2zkoS55YSTcYm17QDaMhXJc2CzpccZVZI+Lkn2vUaBkv1emGH
	 iPqJLUiJjbLKyLFxsTvmjj4q7BMWG21SPISskss6n2Sft9DHZUE6/Vf3TZFpqHb7pvA+Y
	 nOw0TcRKn7afPZPWGgckGVdhsFBGD3X7IHkWBZZiYEJsO8tb75+qQQHinTJGKveHdIYC/
	 cAeSuDJCuqOh02p9c0FlH5L83T9+itg0+sSS4b61OtXx1/OhhRQRKp7dKYZHkaktimGL6
	 urvSpZV1QHaGeknzjkUlVLXdEc6Y4WR3mLjxqalwlHGI6msOpACRsDVXgHihNWCR6AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VpeOhxES;
	arc=none smtp.remote-ip=95.215.58.2
Received: from mta1.migadu.com (out-2.mta1.migadu.com [95.215.58.2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D0D606A31C
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 01:57:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33D0D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VpeOhxES
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=bequIIgc0ooAYgel8f/D35b7e5MsNbckYxDf2IP2oTU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794189459; v=1; x=1794794259;
 b=VpeOhxESQJ503dIsurVClbeI/tdEodd0bOtSczm60Yam+FzJwoYWsfPnURVPMdaWUcG8MiQe
 3wNgh6clRwe+a/Ow1eaJvos6TcZLGIzfapOtHNUprmNuTTzNp2gk5Fzgf3AvYYsqA8dWGJXb6B7
 C5xpWxkHFcE6gU86AlossBhs=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id c3915ad15dbfa47b;
	Mon, 09 Nov 2026 01:57:39 +0000
X-Mizu-Trace-ID: c3915ad15dbfa47b
X-Migadu-Flow: FLOW_OUT
Date: Mon, 9 Nov 2026 09:57:23 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Jin Li <jinli@lanxincomputing.com>
Cc: dsahern@kernel.org, idosch@nvidia.com, shuah@kernel.org,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net] selftests: net: forwarding: replace bash brace
 expansion with seq
Message-ID: <avEogwUP8hr4IXpS@fedora>
References: <20261107133416.212677-1-jinli@lanxincomputing.com>
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
In-Reply-To: <20261107133416.212677-1-jinli@lanxincomputing.com>

On Sat, Nov 07, 2026 at 09:34:16PM +0800, Jin Li wrote:
> {1..16384} is bash-specific brace expansion and will not work with POSIX
> shells like dash or busybox ash. This breaks the flowlabel test when
> /bin/sh is not bash.
> 
> Use $(seq 1 16384) for portable iteration. Fix the same issue in
> custom_multipath_hash.sh, gre_custom_multipath_hash.sh and
> ip6gre_custom_multipath_hash.sh.
> 

As Sashiko suggested, I think it makes sense to add

Fixes: 555e5531635a ("selftests: net/forwarding: spawn sh inside vrf to speed up ping loop")

> Signed-off-by: Jin Li <jinli@lanxincomputing.com>
> ---
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
