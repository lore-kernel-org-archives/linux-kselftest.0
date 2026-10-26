Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793050286;
	b=HkhzxPzsKJcqPUUS85XE0O3jt+ehH9WULHDMzpbmDieXpM/fm+tAbuzLL/aXuEUvA7lR
	 aQX6W5TERs0VVGcNjJAf5+lfQmH4nHaGqPksiqcB0e7pH3tMpCzTJ4tjbpY74CnBHyGmY
	 qiSKT6gr2zyP3cLH4UON524rM4jRZr3M4p0qB5pFQ0/wLWP4LZWDaQVhUp2K9A/g+8AES
	 OKzUmVK/x/vYZMSn2+/0EY1L6TPe8b3Nhrln22ChkDG5R9NOHmY0oK9KOdleuedFjk7Bi
	 YtT7Qd2xfoUeO5nH0wS114Hyo80nFriyQNzIXZWGPsqLrCrClBnQc9FTVsZGVLNthIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793050286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RVINuJFgpqquqvuoDeQK01Sp1utKheakFHyecHU336U=;
	b=Gv0A/C1cQQgo+7BufzHaiUdaI7R3LcfbuKIHQilozQfe0kDyPUTbeEsP7sgc6eFA+ZPd
	 XhAc0EvZb5NxCVfc6y8X5QW1962hw1U4utl6P4OMtEX1Bpu7e3Djmpf3JMJt9iPwoZH1t
	 962l9FwcyNKHGLEK8vI08bHGzfrQdW2CmToxIq8NPnNtEDvQfumTNgyKMOOs111Zh0zGk
	 Y4wOjp/WIuttG2X9fZosNA3fEJJdhlpmkrWM/FmTRhOz4dutZVyEsX4SjAE+5a0qDYpFt
	 EBd8jpmImdQesi771f0NtJPAxJU2KbmSoo/Q17TEnzlPbyAvwdjuqKHl6GjEK5EyXOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=halFW4xN;
	arc=none smtp.remote-ip=209.85.221.175
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8431606A31D
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 21:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8431606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=halFW4xN
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5ead9f60e26so317030e0c.1
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 14:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793050285; x=1793655085; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RVINuJFgpqquqvuoDeQK01Sp1utKheakFHyecHU336U=;
        b=halFW4xNwkJUAulgRnYvuTGtpa1S10Z1UwCJdK4joIZ4Z4MYtd/zesddb0qDzHHiS5
         eOOGrKU4oNTX1nUEKTl2hkQRcY8kvcaoq56Ky0m3CbtkeBZ3iiFmkOAHSiBv7twR2E5l
         Ciqaya7v4VlXiRX4yUJ+TpzvxV/4VaFQYakq+NFBqR1vZLyzA+eYwR5dhcy9rfbUHHBJ
         xeEVr7DNDBEu4i7wGI35LwoLB3EIU7CCypQIxCjLSXBX4DIMrKVNbQjx4Bm32N54IYxS
         86VMk6q5wyoVvCPCY1vpdWQHOvB112FB8z9Kq/ZinqiC1ETCQtn/SuW37yhVxYBT1av1
         Sjkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793050285; x=1793655085;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RVINuJFgpqquqvuoDeQK01Sp1utKheakFHyecHU336U=;
        b=xSKo1b0xIR6Q4z1vJRx4n7SMPy11J9ULduq2z1kpxKUHdSdz8WZdRozCl1JQ0x+h0j
         DkoHFOTaclQLTxASaq+k2OYak0w/rIN73+Jz3DafjyunfyJ3ROPq6p1lQNWt6Xcrp1e/
         y7yUa5kaJgeye1VzVLV3nPI/Azit+8YX+9QdA9HPIVAooU+j0Vx2TzUg1HQeC/f1cY6T
         tMUxpfzrt7PhSOFqMZUdGhhp/TO0FGGjYD8RDPADbPAW1wN9b6/qLJLn3d4sybmrAqxt
         +Lsao+bvgzANJyPe/VcVgR6jR0RJ3xzLnwZOt/tMdOspmuWr7CpGmEcyD8osEok7/psA
         gyVA==
X-Forwarded-Encrypted: i=1; AKwUvBwU9K0H0gLzjdz51nEI1S/PzUEOWKt5IAYECLPhev7qGI9P3rpMWUYIylHOviNldrA5Sm4Y+BDubM7kHlucKyE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLriol15wsbNOmqpfPU5xDQKWC+HGcXhVSpQoB2qyQFLvKi5njW
	0wXwKGjZea0e7sjayBGwG6ymGDUO+VneP36Mver5De55fGtXPFTAUJaD
X-Gm-Gg: AYBFou0bnOQH9HWq9wyB4Ah5DMSO6cg9OfeLm8woCvr1f57EMuuejGM06ntAujJQwzZ
	gXcB4MXWhev4u4kikJbub23+mFH1/FUCr+7YzIMMuTHVHe2W1oFbOOsaxQ4VGPAIosAhJMpxeW6
	oS6sR7qFg/dAFp17l//4vVBgmjh40rtzNV34X6vNdNdCecqNJgwXv+MzsXvmPF1co2PTmiGjOMi
	X/MgWRZQhVDmBlWIdIwApEkkbRV/9yfIEv7KezZAVQWBlCGJ5EJ+Zcyo8gcUBT/Rj69ICCocRvu
	UurHjQIXa1e7gIpT0j4WLIP5bRgfgPd92ftMREQYU9J6vNb6JWp1A+PiQkkQzmxqAPpq9d7sSHT
	sJxbteAPdzDh1UoYUkr/6/8RB8dCOnxjracbUbeSe98KuPRiYRjPLwZ+Unt9RlYEzCQVucasp/o
	oUCgy1Ru7MYJ6KP6Hvl6EzwOWF7Gca/FbxMX+/+PeDzpRz+QBZdY0LyG68m5eyLV2UQIbi9M8nH
	FVKcb5ZzjrJFkiHaT+gQnIDcCd7An9a9mFQ3naluxyhDI97puC8E9VXfyfz99Q3cAi4mbQRhJJA
	8oU4gZ2S84rPynqGWgoKDMf+2BHHfbMmyT2buSPVI4xbA8luTxzLb7wTFafqKUPSp3GfXIu9JOP
	2A/kWPv2O7ndmnpLBInY=
X-Received: by 2002:a05:6122:1da3:b0:5e9:6d96:a7cc with SMTP id 71dfb90a1353d-5ec3e993029mr333982e0c.9.1793050284780;
        Mon, 26 Oct 2026 14:31:24 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec38b1ada8sm2913572e0c.7.2026.10.26.14.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:31:24 -0700 (PDT)
Date: Mon, 26 Oct 2026 17:31:23 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Eva Kurchatova <eva.kurchatova@virtuozzo.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Eva Kurchatova <eva.kurchatova@virtuozzo.com>, 
 netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
Message-ID: <willemdebruijn.kernel.304eb6d1b1424@gmail.com>
In-Reply-To: <20261026122440.603302-1-eva.kurchatova@virtuozzo.com>
References: <20261026122440.603302-1-eva.kurchatova@virtuozzo.com>
Subject: Re: [PATCH] selftests: net: veth: check UDP GRO forwarding on
 forwarded traffic
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Eva Kurchatova wrote:
> The rx-udp-gro-forwarding checks fail with "got 10 packets, expected 1"
> on a host where something has a UDP tunnel socket, a vxlan say, and
> pass on a host where nothing does. Since commit 36707061d6ba ("udp:
> allow forwarding of plain (non-fraglisted) UDP GRO packets") the
> feature aggregates only datagrams GRO finds no socket for, and GRO
> looks the socket up only once a tunnel socket exists on the host; the
> checks send to a socket in the receiving namespace, so they pass only
> while nothing looks it up.
> 
> Let the destination forward the datagrams to a receiver in a namespace
> behind it: no local socket is found there, tunnel or not, and the
> checks count what the destination receives as before.
> 
> Fixes: 1c3cadbe0242 ("self-tests: add veth tests")
> Suggested-by: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
> Link: https://lore.kernel.org/netdev/CAF=yD-LZSec9g_0bBgrcQvq2OO1BrxMSRHH=uU7eamCmWcTO_A@mail.gmail.com/
> Signed-off-by: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
> ---
>  tools/testing/selftests/net/veth.sh | 26 ++++++++++++++++++++++----
>  1 file changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
> index 8b867e0675a7..be7c6b9213a9 100755
> --- a/tools/testing/selftests/net/veth.sh
> +++ b/tools/testing/selftests/net/veth.sh
> @@ -9,12 +9,17 @@ readonly DST=1
>  readonly DST_NAT=100
>  readonly NS_SRC=$BASE$SRC
>  readonly NS_DST=$BASE$DST
> +# The receiver of the GRO checks, behind the destination
> +readonly RCV=3
> +readonly NS_RCV=$BASE$RCV
>  # shellcheck disable=SC2155 # prefer RO variable over return value from cmd
>  readonly YNL="$(dirname "$(readlink -f "$0")")/../../../net/ynl/pyynl/cli.py"
>  
>  # "baremetal" network used for raw UDP traffic
>  readonly BM_NET_V4=192.168.1.
>  readonly BM_NET_V6=2001:db8::
> +# Network between the destination and the receiver
> +readonly RCV_NET_V4=192.168.2.
>  
>  readonly CPUS=`nproc`
>  ret=0
> @@ -26,7 +31,7 @@ cleanup() {
>  	[ -n "${jobs}" ] && kill -1 ${jobs} 2>/dev/null
>  	rm -f $STATS
>  
> -	for ns in $NS_SRC $NS_DST; do
> +	for ns in $NS_SRC $NS_DST $NS_RCV; do
>  		ip netns del $ns 2>/dev/null
>  	done
>  }
> @@ -48,6 +53,17 @@ create_ns() {
>  		ip -n $BASE$ns addr add dev veth$ns $BM_NET_V4$ns/24
>  		ip -n $BASE$ns addr add dev veth$ns $BM_NET_V6$ns/64 nodad
>  	done
> +
> +	# Forwarded, the datagrams find no local socket, whatever tunnel the host has
> +	ip netns add $NS_RCV
> +	ip -n $NS_RCV link set dev lo up
> +	ip link add name fwd$DST type veth peer name fwd$RCV
> +	ip link set dev fwd$DST netns $NS_DST up
> +	ip link set dev fwd$RCV netns $NS_RCV up
> +	ip -n $NS_DST addr add dev fwd$DST $RCV_NET_V4$DST/24
> +	ip -n $NS_RCV addr add dev fwd$RCV $RCV_NET_V4$RCV/24

Similar to the cleanup code above, this can probably reuse the loop in
create_ns?

Also a bit confusing that NS_DST is no longer the dst, but keeps its name
and now there is an additional NS_RCV.

> +	ip netns exec $NS_DST sysctl -wq net.ipv4.ip_forward=1
> +	ip -n $NS_RCV route add default via $RCV_NET_V4$DST
>  }
>  
>  __chk_flag() {
> @@ -134,15 +150,17 @@ chk_gro() {
>  	local msg="$1"
>  	local expected=$2
>  
> -	ip netns exec $BASE$SRC ping -qc 1 $BM_NET_V4$DST >/dev/null
> +	# Taking veth$SRC down drops the route, so set it for every check

What takes this down?

> +	ip -n $NS_SRC route replace ${RCV_NET_V4}0/24 via $BM_NET_V4$DST
> +	ip netns exec $BASE$SRC ping -qc 1 $RCV_NET_V4$RCV >/dev/null
>  	NSTAT_HISTORY=$STATS ip netns exec $NS_DST nstat -n
>  
>  	printf "%-60s" "$msg"
> -	ip netns exec $BASE$DST ./udpgso_bench_rx -C 1000 -R 10 &
> +	ip netns exec $NS_RCV ./udpgso_bench_rx -C 1000 -R 10 &
>  	local spid=$!
>  	sleep 0.1
>  
> -	ip netns exec $NS_SRC ./udpgso_bench_tx -4 -s 13000 -S 1300 -M 1 -D $BM_NET_V4$DST
> +	ip netns exec $NS_SRC ./udpgso_bench_tx -4 -s 13000 -S 1300 -M 1 -D $RCV_NET_V4$RCV
>  	local retc=$?
>  	wait $spid
>  	local rets=$?
> -- 
> 2.56.0
> 


