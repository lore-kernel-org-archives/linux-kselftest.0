Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60319360EF0;
	Sun,  4 Oct 2026 10:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791108695; cv=none; b=kSn9jpGx6xzrCq4QAbPk5pi5flbqn1jwQgpGXmx2XQ83aTOoXueqz8bZJ313aeyBHLEnNgf/LwZinFQsLgr046n1Tq/t1sbwW2wEz08r6XRmxIw6Q/Hks819B1gmvBEbqRsisXRhN5Cghcy6Ytp5C9ckwxfJ4vq5W+3QJZ99WjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791108695; c=relaxed/simple;
	bh=btjxOFBncYcxeFTQHEr93pMLtej9EhJUaEBzY4YpKfc=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ePa+k9I5uHc5ZnkgqsI9XJ6CduBQ2DC9w8L8Qh+HvXRgJxN2w1bkFRx9I6LjjlSwHXQl9UwEkllyUT5kXxdupwOFJ76x2L2mViB9bqirm96zJQ9zErLlrHj/EmVVLuyUJ1LngkZLjdVEgkB3VOBODNw9+Nq40AJIIkpYJQANoiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BHXXpBnV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BHXXpBnV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41CC51F000FF;
	Sun,  4 Oct 2026 10:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791108694;
	bh=CkSaGWts0W4FuW/tGrCciXI8NMI5AFPyJYFUhRRfSWY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=BHXXpBnV4T4M2ffN2oYCNvYAIwO9HQDmS3AjdA/56LPsmbvxoUrZWasOo5KQTvvr9
	 zKW/5w/vdH12cMqIz1eG/IHP3cvnijatqlmz2O5leHG8v5PlU66GCb71Kvqs9rhcUM
	 9EzfQr7a2KJ6UEP3RyUwKU2w1l8OxeuTX7ZMEws9UqBbtbv82DlvqPXjUHnSm/HbXS
	 Z9KZXPfRsgvMeGmbeD9TfZx305wekzVCCReErQLgaKErUZrya0Ny5giHoyuYIXFx63
	 Bj8JQXxZgu0dEh1MJZgk49dS6RRUvD7xksf7wjkBlcW5f4MbGW7XmfrAw8B8Pi/UQ6
	 vQWh9wj3mkpFg==
Subject:
 Re: [PATCH net-next v2 2/2] selftests: net: big_tcp_tunnels: Cover bareudp
From: netdev-bot+sashiko@kernel.org
To: yanhaishuang@cmss.chinamobile.com
Cc: netdev@vger.kernel.org, alice.kernel@fastmail.im, daniel@iogearbox.net,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sun, 04 Oct 2026 10:11:32 +0000
Message-ID: <179110869274.434549.7292617532752243045@kernel.org>
In-Reply-To: <20261003100939.468181-3-yanhaishuang@cmss.chinamobile.com>
References: <20261003100939.468181-3-yanhaishuang@cmss.chinamobile.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] Seven of the twelve new bareudp test cases cannot pass, so
  tools/testing/selftests/net/big_tcp_tunnels.sh now always fails.
- [Low] Comments in tools/testing/selftests/net/big_tcp_tunnels.sh do not
  match the new coverage.
- [Low] The return status of the new bareudp setup commands is never
  checked.

--

selftests: net: big_tcp_tunnels: Cover bareudp

This patch adds bareudp to the tunnel types tested by big_tcp_tunnels.sh.
The bareudp devices run in external mode with ethertype ipv4 multiproto. A
tc tunnel_key action on egress supplies the tunnel metadata, and the device
MTU is lowered to leave room for the IPv6 and UDP headers.

> diff --git a/tools/testing/selftests/net/big_tcp_tunnels.sh b/tools/testing/selftests/net/big_tcp_tunnels.sh
> index cc0875e52fb9..cf38377f576b 100755
> --- a/tools/testing/selftests/net/big_tcp_tunnels.sh
> +++ b/tools/testing/selftests/net/big_tcp_tunnels.sh
> @@ -53,6 +53,16 @@ setup() {
>  	DEFAULT_TCP_MIN_TSO_SEGS=$(ip netns exec "$CLIENT_NS" sysctl -n net.ipv4.tcp_min_tso_segs)
>  }
>  
> +# bareudp only works in external mode: attach the tunnel metadata to all
> +# packets sent through the device. Its MTU does not account for the
> +# encapsulation either, so leave room for IPv6 and UDP headers.
> +setup_bareudp() {
> +	ip -netns "$1" link set "$2" mtu 1452
> +	tc -netns "$1" qdisc add dev "$2" clsact
> +	tc -netns "$1" filter add dev "$2" egress matchall \
> +		action tunnel_key set src_ip "$3" dst_ip "$4" id 0 ttl 64
> +}

[Severity: Low]
Should failures from these commands be passed back to the caller?
setup_bareudp() ignores the exit status of ip link set, tc qdisc add and tc
filter add. The same is true of the ip link add ... type bareudp ...
multiproto calls in setup_tunnel().

The exit status of setup_tunnel() comes from its last command:

    ip netns exec "$SERVER_NS" ethtool -K link1 tx-checksumming "$3" > /dev/null

As a result, setup_tunnel ... || exit "$?" never sees these failures. The
new tc -V check only shows that the tc binary exists. It does not show that
matchall or tunnel_key work.

Without the tunnel_key filter, bareudp_xmit() drops every packet:

drivers/net/bareudp.c:bareudp_xmit() {
    ...
	info = skb_tunnel_info(skb);
	if (unlikely(!info || !(info->mode & IP_TUNNEL_INFO_TX))) {
		err = -EINVAL;
		goto tx_error;
	}
    ...
}

The test then reports a packet-count FAIL rather than a SKIP or a clear
setup error. The vxlan and geneve setup ignores errors in the same way.

> @@ -64,26 +74,42 @@ setup_tunnel() {

[ ... ]

> +	bareudp)
> +		ip -netns "$CLIENT_NS" link add tun0 type bareudp \
> +			dstport 6635 ethertype ipv4 multiproto
> +		setup_bareudp "$CLIENT_NS" tun0 "$CLIENT_IP" "$SERVER_IP"
> +		;;
> +	esac

[Severity: High]
Can the bareudp cases that use IPv6, inner or outer, with csum offload off
pass in this configuration?

With tx-checksumming off on link0, every encapsulated GSO skb is segmented
in software by skb_udp_tunnel_segment(). That function chooses the inner
handler based on skb->inner_protocol:

net/ipv4/udp_offload.c:skb_udp_tunnel_segment() {
    ...
	case ENCAP_TYPE_ETHER:
		protocol = skb->inner_protocol;
		gso_inner_segment = skb_mac_gso_segment;
    ...
}

On the IPv4 underlay, bareudp_xmit_skb() always stores the configured
ethertype. It does this even for IPv6 inner traffic in multiproto mode:

drivers/net/bareudp.c:bareudp_xmit_skb() {
    ...
	skb_set_inner_protocol(skb, bareudp->ethertype);
    ...
}

The IPv6 header is then handed to inet_gso_segment(). There, iph->ihl * 4
reads the low nibble of the first IPv6 byte, and the ihl < sizeof(*iph)
check fails.

On the IPv6 underlay, bareudp6_xmit_skb() never sets inner_protocol. The
field stays 0, so skb_mac_gso_segment() fails:

net/core/gso.c:skb_mac_gso_segment() {
    ...
	__be16 type = skb_network_protocol(skb, &vlan_depth);

	if (unlikely(!type))
		return ERR_PTR(-EINVAL);
    ...
}

In both cases validate_xmit_skb() drops the GSO skbs. The bigtcp iptables
counter on tun1 stays below packets_threshold, and do_test ... || exit "$?"
stops the run at the first such case: bareudp, tun_family 4,
traffic_family 6, csum off.

vxlan and geneve are not affected because they set inner_protocol to
ETH_P_TEB.

This driver behaviour is older than this series. The previous patch,
"bareudp: Enable BIG TCP packets", only raises tso_max_size and does not
change it. As a result, the commit message goal to "run the same checks
over bareudp as for vxlan and geneve" cannot be met as written.

Could the bareudp inner_protocol handling be fixed first? That would mean
setting it from the actual inner protocol, and also setting it on the IPv6
path. Alternatively, the bareudp combinations could be limited to the
cases that work.

[ ... ]

> @@ -205,7 +236,7 @@ fi
>  WORKDIR=$(mktemp -d)
>  trap cleanup EXIT
>  setup
> -for tunnel in vxlan geneve; do
> +for tunnel in vxlan geneve bareudp; do

[Severity: Low]
This isn't a bug, but the comment at the top of the file still reads:

# Testing for IPv4 and IPv6 BIG TCP over VXLAN and GENEVE tunnels.

Should it mention bareudp now?

The comment in do_test() is also out of date:

	# packet to veth. Check BIG TCP packets inside the VXLAN tunnel to verify

That branch runs for every tunnel type. The wording was already wrong once
geneve was added, and adding bareudp makes it more misleading.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261003100939.468181-1-yanhaishuang%40cmss.chinamobile.com
