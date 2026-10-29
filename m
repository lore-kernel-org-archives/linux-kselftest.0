Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793255235;
	b=32SdZhDgwwxWcwOF8iuIiP/5qy4LYC7+RorswT3odkJQyR2x2nxsMcoOdDBtM/Zml0QG
	 qpRbGiORmCB34uHYmPOV7H5h8kf8eoOuFTy+9/w7ntbArkZaRsSyMB4GCH9YMzBKZc2Ty
	 DtA91xWuurBgfXx0B6OyfwajANz2yfGC0UORhcFm/SPAEjmZEuXLUafaxGa62H/EStwTI
	 8rV6GJ6MCcF94SwEmwoypJCozmyt8T7QhINDg1oQoHJC/kWiFbPgE/5N7PLRz2PWhAMLP
	 fhck0TSqgFsspWf2f1YQqPDGI4E/XBfygZTlhorddVJUpxaWBLXfKOfgt0g9FFvy0bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793255235;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=T+WOPL7ugio0CnPiiFKjTzuWTb6RYIj2i6lSZt0jIqU=;
	b=SY1rLS2fzIIluqfM2b9LZmqvk0jE1zAAAwEQyincscaZcwIfdjQUGKjC/LfCvAknt8nq
	 JJTmkSZQn/xxVQC5M4CuI90zUqrosNVH+FwRsDgyMbwEgb557THuTbjun0yGTsy3zz8/G
	 9qypuotdDNapygXMkbg72FsrCKv3lrscYejWQXfmnJ6ph/KpvUT6ERFb9wnrrSEfm0Fao
	 WSFUbCYLzFdu6GywBPJyU+dnfQL23DORak25FFwO9WmiBYZBNbXaexTkTv0lZYV//BIFt
	 rwHP50nWtWkzBcLIbNJPAnq9JbpV+OYL/84lI0twn+TK47QkTB9AzOR1jddIdy0Zy8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DEqBwpEO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE62606A31A;
	Thu, 29 Oct 2026 06:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DEqBwpEO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F29351F01825;
	Thu, 29 Oct 2026 06:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793255234;
	bh=T+WOPL7ugio0CnPiiFKjTzuWTb6RYIj2i6lSZt0jIqU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DEqBwpEODspcghlxET5oXpH9XdezJOUt9k3ZQ6Ue1VoCoKs1NJm3AjX4vOLlvHNXs
	 Y0/2u+DPS2XeY6S1PF18LxrzOKaztykJXR8eQ/+GaNgf0qulM36YtsOks7IawVDDUc
	 +uPn61uzBw4qFIyQSRX54D2FNOiwAht9BFU3LWfjfurYZOxFdw/lAlpP3KlZrcgulP
	 7M61xLhA6KUcb8N7wn7tvO8etpAf8hbk5dpl4sfoYuHgPBrWE1jtv8H9Av1MTq8w9X
	 2dOm+m1ROVirYw6z2a7rPAced/8Qd/sdPw84/5V1ZxubZIA5o2HiSaLQKmdTELGvMb
	 u/4C0f5QCxsww==
Subject: Re: [PATCH] selftests: net: veth: check UDP GRO forwarding on
 forwarded traffic
From: netdev-bot+sashiko@kernel.org
To: eva.kurchatova@virtuozzo.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 linux-kernel@vger.kernel.org, willemdebruijn.kernel@gmail.com,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Thu, 29 Oct 2026 06:27:13 +0000
Message-ID: <179325523350.3134.7153020683562744025@kernel.org>
In-Reply-To: <20261026122440.603302-1-eva.kurchatova@virtuozzo.com>
References: <20261026122440.603302-1-eva.kurchatova@virtuozzo.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1 (1)

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] chk_gro() in tools/testing/selftests/net/veth.sh reads
  IpInReceives for the whole NS_DST namespace.
- [Low] create_ns() in tools/testing/selftests/net/veth.sh creates the
  new veth pair in the invoking (host) netns under the fixed names…

Pre-existing issues:
- [Low] In tools/testing/selftests/net/veth.sh, chk_gro() now sends the
  GRO check traffic NS_SRC -> NS_DST -> NS_RCV.

--

selftests: net: veth: check UDP GRO forwarding on forwarded traffic

The rx-udp-gro-forwarding checks in veth.sh fail when the host has a UDP
tunnel socket. In that case GRO does a socket lookup and finds the local
receiver. This patch adds a third namespace behind the destination, so
the datagrams are forwarded instead of delivered locally, and keeps
counting IpInReceives in the destination namespace.

Link: https://lore.kernel.org/netdev/CAF=yD-LZSec9g_0bBgrcQvq2OO1BrxMSRHH=uU7eamCmWcTO_A@mail.gmail.com/

> diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
> index 17cfe412a2667..fef4ab587c91a 100755
> --- a/tools/testing/selftests/net/veth.sh
> +++ b/tools/testing/selftests/net/veth.sh

[ ... ]

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

[Severity: Low]
This pair is created in the namespace the script runs in, under the fixed
names fwd1 and fwd3, and none of these commands are checked. What happens
if the host already has an interface named fwd1 or fwd3?

In that case ip link add fails with EEXIST. The following "ip link set dev
fwd$DST netns $NS_DST up" then looks the name up in the host netns and
moves the host's own device into the test namespace.

cleanup() later runs ip netns del on that namespace. A virtual device is
destroyed, and a physical one goes back to init_net without its
configuration.

Also, if ip netns add $NS_RCV fails but the link creation succeeds, the
moves fail and the pair stays in the host netns. cleanup() only deletes
namespaces, so the pair would leak.

The existing veth$SRC/veth$DST setup above uses the same pattern. Could the
new pair be created directly inside the namespaces instead, for example:

    ip -n $NS_DST link add fwd$DST type veth peer name fwd$RCV netns $NS_RCV

> +	ip -n $NS_DST addr add dev fwd$DST $RCV_NET_V4$DST/24
> +	ip -n $NS_RCV addr add dev fwd$RCV $RCV_NET_V4$RCV/24
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
> +	ip -n $NS_SRC route replace ${RCV_NET_V4}0/24 via $BM_NET_V4$DST
> +	ip netns exec $BASE$SRC ping -qc 1 $RCV_NET_V4$RCV >/dev/null
>  	NSTAT_HISTORY=$STATS ip netns exec $NS_DST nstat -n
>  
>  	printf "%-60s" "$msg"
> -	ip netns exec $BASE$DST ./udpgso_bench_rx -C 1000 -R 10 &
> +	ip netns exec $NS_RCV ./udpgso_bench_rx -C 1000 -R 10 &

[Severity: Low]
This isn't a bug introduced by this patch, but the receiver is still
started without -n, so cfg_expected_pkt_nr stays 0. do_recv() in
udpgso_bench_rx.c only checks the count when that is set:

    if (cfg_expected_pkt_nr && (packets != cfg_expected_pkt_nr))

On timeout the receiver just exits 0, even if nothing arrived.

The only count chk_gro() compares is IpInReceives in NS_DST. ip_rcv_core()
increments it before any routing decision:

    __IP_UPD_PO_STATS(net, IPSTATS_MIB_IN, skb->len);

With the new forwarding hop, nothing confirms that NS_DST actually
forwarded the aggregated skb, or that NS_RCV received the 10 datagrams. If
the GRO skb were dropped in ip_forward() or during egress segmentation, the
aggregation checks would still pass.

Would adding -n 10 to the receiver, or also checking IpForwDatagrams, close
this gap?

>  	local spid=$!
>  	sleep 0.1

[Severity: Medium]
Can this sleep now cause a spurious GRO failure?

Only sleep 0.1 makes the receiver bind() before the sender transmits. If
udpgso_bench_rx in NS_RCV has not bound its port by the time the forwarded
datagram arrives, the path would be:

NS_RCV:
  __udp4_lib_rcv()
    icmp_send(skb, ICMP_DEST_UNREACH, ICMP_PORT_UNREACH, 0);

The ICMP then follows the default route added in create_ns() back into
NS_DST on fwd1:

NS_DST:
  ip_rcv_core()
    __IP_UPD_PO_STATS(net, IPSTATS_MIB_IN, skb->len);

nstat reads IpInReceives for the whole NS_DST namespace, so this ICMP is
counted along with the forward-direction datagrams on veth1.

Neither helper turns this into a non-zero exit. udpgso_bench_tx -M 1 sends
one message and exits 0. udpgso_bench_rx without -n times out and exits 0.
chk_gro() would then report "got 2 packets, expected 1" (or 11 vs 10).

Before this patch the receiver was in NS_DST, so the same race only produced
an outgoing ICMP that IpInReceives does not count.

Would it be more robust to wait for the receiver socket to be bound, or to
count only ingress on veth$DST?

>  
> -	ip netns exec $NS_SRC ./udpgso_bench_tx -4 -s 13000 -S 1300 -M 1 -D $BM_NET_V4$DST
> +	ip netns exec $NS_SRC ./udpgso_bench_tx -4 -s 13000 -S 1300 -M 1 -D $RCV_NET_V4$RCV
>  	local retc=$?
>  	wait $spid
>  	local rets=$?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261026122440.603302-1-eva.kurchatova%40virtuozzo.com
