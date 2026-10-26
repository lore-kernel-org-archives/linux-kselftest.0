Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792982975;
	b=XTPbc9sSFLRzQPvKViwtZIcAexp0VDaKt0zMz6v+AhsdkLjd9dbbKsh+TBhZCE+vQ709
	 OmcMOFctcW5rz5YcmDIJJb6pCJHKP/TlJUjI31xFYkHaLb6VnS9kcrfGCVlhPtMWypzl/
	 Jt/RTszImJJwHy8azipManQizHxC0wSxHxbTklW2JJtOtGGoIk2SdNInwcnwu/TRcbaaW
	 Gxv4GXB6PWsFAt7QzTq+OKG7qwgVwT+++b+BcwhyHHpX45TMjB+zUgH0qOGhtKliQ17mi
	 0Hg4BhWKlzEVs5QILQQe8+tJ4uP+U8VkJX23+MAsh/x7FYd9iWib6AHCSj4SYAegY/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792982975;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=5GUYvAPFvtVupJ3SF64U/LXEmmq/jYsbE3zKitYVfss=;
	b=o6Tihdk7UKjyWBJiJeUjq9FwhRGFYz7/htRWHSCei3kjlH7v4XdD+nmsj9bme1C/urUz
	 jVvTilKIB59nB2deiRcL1R33yvz8Kj7m1hPBiK59mG4lsulilEHsFlZNeZ68fHvXAYqj0
	 GLkV6I/4gNI2Ybsaz/uP+T037E9LldzgiL7BG+AyqcyfFQdaAU/YHLip06v61IlDo2VxQ
	 P64Reus3+Mab9EqeoD/JB56zrJcoi0KUtXi3nKZGzKtRUrRIOsWawTQYFOnox9RREP/j5
	 M5NK4+OtFSRcmYSRvOnC1XFXDxFbh0VpREQHVyBUxcckia6WLejPPBd7my2/E6jX+Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YdbpKPcj;
	arc=none smtp.remote-ip=91.218.175.224
Received: from mta0.migadu.com (out-224.mta0.migadu.com [91.218.175.224])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B9D606A31B
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 02:49:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19B9D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YdbpKPcj
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Gx1oyz2KGlb/ejgVNmf/mo3hj1fG5G50vh0VLMCMrA4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792982973; v=1; x=1793587773;
 b=YdbpKPcjNkBm5upUdDNiR2Isxue6605jBjLhK+QoCinGTMLC8Uzr+yt4bJZ+fcNhyf1puMcL
 8Ust/v/t/j7u7tA5ZjB32KUs3aqy02A4qI/E9gkt6gRWfCkxctC6vPQkuootsVqgcOUyKgLc97A
 s8McvdSU89sfRohuEsUTnt5I=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 0d02624ae5d230dd;
	Mon, 26 Oct 2026 02:49:33 +0000
X-Mizu-Trace-ID: 0d02624ae5d230dd
X-Migadu-Flow: FLOW_OUT
Date: Mon, 26 Oct 2026 10:49:11 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Xia Yan <yana06070@163.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@kernel.org, horms@kernel.org, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	pabeni@redhat.com, shuah@kernel.org
Subject: Re: [PATCH net v4 2/2] selftests: net: check veth carrier after
 changing channel counts
Message-ID: <at6_pw9Ng-UEFVB6@fedora>
References: <20261024093007.12981-1-yana06070@163.com>
 <20261024093007.12981-2-yana06070@163.com>
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
In-Reply-To: <20261024093007.12981-2-yana06070@163.com>

Hi Yan Xia,
On Sat, Oct 24, 2026 at 05:30:07PM +0800, Xia Yan wrote:
> Extend veth.sh to check that changing channel counts preserves carrier
> state. When only one end is up, the running end must not report LOWER_UP.
> 
> Cover up/up and both mixed up/down combinations. Resize RX and TX queues
> in both directions on each endpoint, and check carrier after a rejected
> out-of-range request as well. Create the pair with two queues explicitly
> so the carrier cases also run on single-CPU systems.
> 
> Reuse the existing namespace setup and cleanup. Run each carrier case
> in a subshell to keep its variables separate from the other tests, and
> accumulate failures in the caller. Only check LOWER_UP on running
> interfaces, where the flag exposes carrier state.
> 
> Assisted-by: LLM
> Signed-off-by: Xia Yan <yana06070@163.com>
> ---
> Changes in v4:
> - Drop the extra GRO on/off runs, as discussed with Hangbin.
>   Keep up/up and both mixed up/down states.
> - Use subshells for the new helpers and accumulate failures in the
>   caller. Quote single-value arguments and wrap long lines.

Which single-value arguments do you mean?

> - Driver code is unchanged.
> 
> v3: https://lore.kernel.org/netdev/20261022085842.2527-1-yana06070@163.com/
> 
> Testing on 513444cc62e2, x86_64 QEMU/KVM with three vCPUs:
> - Complete default veth.sh:
>   before: 56 checks pass, two mixed up/down carrier checks fail;
>   after: all 58 checks pass. The 55 existing checks pass on both.
> - Script exit status: 1 before, 0 after. No checks were skipped.
> - Both guests powered down normally.
> - bash -n and git diff --check pass.
> 
>  tools/testing/selftests/net/veth.sh | 81 ++++++++++++++++++++++++++++-
>  1 file changed, 80 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
> index 8b867e0675a7c1eea300468c26f2a9528ddc1194..e438e9ee7b33b151099d8ce779a9c9b47b0cc0af 100755
> --- a/tools/testing/selftests/net/veth.sh
> +++ b/tools/testing/selftests/net/veth.sh
> @@ -41,13 +41,16 @@ create_ns() {
>  		ip -n $ns link set dev lo up
>  	done
>  
> -	ip link add name veth$SRC type veth peer name veth$DST
> +	ip link add name "veth$SRC" "$@" type veth \
> +		peer name "veth$DST" "$@" || return 1
>  
>  	for ns in $SRC $DST; do
>  		ip link set dev veth$ns netns $BASE$ns up
>  		ip -n $BASE$ns addr add dev veth$ns $BM_NET_V4$ns/24
>  		ip -n $BASE$ns addr add dev veth$ns $BM_NET_V6$ns/64 nodad
>  	done
> +
> +	return 0
>  }
>  
>  __chk_flag() {
> @@ -130,6 +133,78 @@ chk_channels() {
>  	fi
>  }
>  
> +chk_carrier() (
> +	target=$1
> +	state=$2
> +	expected=$3
> +	carrier=0
> +
> +	# IFF_LOWER_UP is reported only for running interfaces.
> +	[ "$state" = up ] || return 0
> +
> +	if ! link=$(ip -n "$BASE$target" -o link show dev "veth$target"); then
> +		echo " fail - cannot read veth$target link state"
> +		return 1
> +	fi
> +	case "$link" in
> +		*LOWER_UP*) carrier=1 ;;
> +	esac
> +	if [ "$carrier" -ne "$expected" ]; then
> +		printf ' fail - veth%s carrier is %s, expected %s\n' \
> +			"$target" "$carrier" "$expected"
> +		return 1
> +	fi
> +)
> +
> +# Keep per-case variables separate from the other tests.
> +chk_channels_carrier() (
> +	src_state=$1
> +	dst_state=$2
> +	expected=0
> +	err=0
> +	msg="carrier after channel change ($src_state/$dst_state)"
> +
> +	if ! create_ns numtxqueues 2 numrxqueues 2; then
> +		printf "%-60s" "$msg"
> +		echo " skip - cannot create veth pair"
> +		cleanup
> +		return 0
> +	fi
> +
> +	ip -n "$NS_SRC" link set dev "veth$SRC" "$src_state" || err=1
> +	ip -n "$NS_DST" link set dev "veth$DST" "$dst_state" || err=1
> +	[ "$src_state" = up ] && [ "$dst_state" = up ] && expected=1
> +	chk_carrier "$SRC" "$src_state" "$expected" || err=1
> +	chk_carrier "$DST" "$dst_state" "$expected" || err=1
> +
> +	for target in "$SRC" "$DST"; do
> +		for count in 1 2; do
> +			ip netns exec "$BASE$target" ethtool -L "veth$target" \
> +				rx "$count" tx "$count" || err=1
> +			chk_carrier "$SRC" "$src_state" "$expected" || err=1
> +			chk_carrier "$DST" "$dst_state" "$expected" || err=1
> +		done
> +
> +		if ip netns exec "$BASE$target" ethtool -L "veth$target" \
> +			rx 3 tx 3 \
> +			>/dev/null 2>&1; then
> +			echo " fail - out-of-range channel counts were accepted"
> +			err=1
> +		fi
> +		chk_carrier "$SRC" "$src_state" "$expected" || err=1
> +		chk_carrier "$DST" "$dst_state" "$expected" || err=1
> +	done
> +
> +	cleanup
> +	printf "%-60s" "$msg"
> +	if [ "$err" -eq 0 ]; then
> +		echo " ok "
> +	else
> +		echo " fail "
> +	fi
> +	return "$err"
> +)
> +
>  chk_gro() {
>  	local msg="$1"
>  	local expected=$2
> @@ -257,6 +332,10 @@ fi
>  [ $STRESS -gt 0 -a $CPUS -lt 3 ] && echo " stress test will be skipped, too"
>  [ ! -f "$YNL" ] && echo "ynl cli not found, ndo-xmit tests will be skipped"
>  
> +chk_channels_carrier up "up" || ret=1

Nit: there is an extra "" quote.

> +chk_channels_carrier up down || ret=1
> +chk_channels_carrier down up || ret=1

Note: When set the src state as down first. The ethtool -L will has no
effect as it link is down. So the errors would look like

# ./veth.sh
carrier after channel change (up/up)                         ok
 fail - veth2 carrier is 1, expected 0
 fail - veth2 carrier is 1, expected 0
 fail - veth2 carrier is 1, expected 0
 fail - veth2 carrier is 1, expected 0
 fail - veth2 carrier is 1, expected 0
 fail - veth2 carrier is 1, expected 0
carrier after channel change (up/down)                       fail
 fail - veth1 carrier is 1, expected 0
 fail - veth1 carrier is 1, expected 0
 fail - veth1 carrier is 1, expected 0
carrier after channel change (down/up)                       fail


This may leading the result a bit weird as the failure count is not sync.
But the test passed on patched kernel. So no need to change from my side.

> +
>  create_ns
>  chk_gro_flag "default - gro flag" $SRC off
>  chk_gro_flag "        - peer gro flag" $DST off
> 

Tested-by: Hangbin Liu <liuhangbin@kylinos.cn>
Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
