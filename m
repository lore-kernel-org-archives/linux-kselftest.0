Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629929;
	b=OWFwycRyxVx0+m5s0wAhsZz7NX8HueRKh1K+wD3Fw0MaHUvk4qG61SWDDr0fQOCmRRat
	 Yj9vpPN3dWXPDkaRamJ6hSCPnm1NZqYY946xHh1RtYhTKnsnojooKy/s/IdPsLcq/7yMl
	 ptE0WYxY06TAUOw4GdnZDHoxF6WUknOKw8tgVYIFn5E+0oMvF65ubGsoIpjDu5wpzpE0V
	 icaYtaUgrSYcDw+ovBKkGYrOAO8Wh8Zge4FyufeG4j6mkDLLNViF0ksaD0+s8C7hNkF+2
	 6/du0Xj4BkMh7GNfJoBpHG9cETM5wOECPSzPOWZoqYA0xUB5zYx3MLgxAnXhdeoc2RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629929;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=gq3lctPAnaFDAVkMBu87KEcU4DFbiZw2CZrSkFgNdv0=;
	b=LDUwm4s8Qhb2+uvx9AUTacQSoaO4aLyyQYMdUaP8S9D8qWU9Bszs0tz3esEwir6yQDIJ
	 sSPYObWmRxn7zUxj0i8wE+dotHvAKOSU5DPHNuh9gRu2yuEJfSHFsuXqnRygrZGNLbJVz
	 uMX0LAaLnsULzfUK770r1+EG/mnneF7hvaQvJnYoSYZOkP1OyvAmuL5BY21LXX2tI2aEk
	 V3oYfF0tc5THfBhNCe7hwqlnaNe0OH+XmgCeORLvHRn0MhIzd6xESHiC09n5iaP4dhNI8
	 l6y+2Lbteo4nH9KirzhyYDi3gR3Sion+tKLsU4Yz1dns7eSK/tQRr28wfcUg2tZlZeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fastmail.im;
	spf=pass smtp.mailfrom=fastmail.im;
	dkim=pass header.d=fastmail.im header.i=@fastmail.im header.a=rsa-sha256 header.s=fm3 header.b=LoEInkYK;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=HFn1e3OJ;
	arc=none smtp.remote-ip=202.12.124.148
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554E3606A333
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 18:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 554E3606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.im
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fastmail.im header.i=@fastmail.im header.a=rsa-sha256 header.s=fm3 header.b=LoEInkYK;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=HFn1e3OJ
Received: from ams-compute-01.internal (ams-compute-01.internal [10.64.2.61])
	by mailfout.stl.internal (Postfix) with ESMTP id 990401D00625
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 13:05:27 -0500 (EST)
Received: from ams-imap-19 ([10.64.2.39])
  by ams-compute-01.internal (MEProxy); Wed, 25 Nov 2026 13:05:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.im; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1795629920;
	 x=1795716320; bh=gq3lctPAnaFDAVkMBu87KEcU4DFbiZw2CZrSkFgNdv0=; b=
	LoEInkYKTNn327V/ZsN+4DUhSLmhoHiZWVl+SqszlI5edoio/0SsH6yXEVPw4FKK
	SUpda78W0L4XbEHNizhz+v7VDWBghFEQB82LlzDvuGvBq7Cm8kXSKHDBibnZOXjD
	+GOil/fJulzrJWCZiW0KB8v9xjC0XNZhsa0ZYyuzsVETVoGz76mgwLH4r0WFa4Oq
	SYzqgTknc/6nPBPQJD3n1pqVSNOdSokbKxKc4nHkwNbfkhmQ55NpgwUqZT2dnXqv
	uzGWSgymCfbxWM364ijt/IVZXoAuE94S+gtc4kgIDHMszU06zpWOOhlJnaq49RWB
	YIhsuGSCt0gBZx2Qnp3nqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795629920; x=
	1795716320; bh=gq3lctPAnaFDAVkMBu87KEcU4DFbiZw2CZrSkFgNdv0=; b=H
	Fn1e3OJ5JHQBM2BjfRRMovLEl8ZlXSpPisedTf4GLuZgameMeUeT9tm8/hmt/KrR
	wLBVtHn4t5Qmb/s2KCDKjfRNF/ybnCcb70jX0teWrSWKLE8kf6sY57ljuDTSIIPa
	bXlOe73p64bWVJ0wlsji/31YU/06zIAwDnVfqM3L1z2OltUxHBlb+rPD9f2s/GZ2
	pMy4p4vmZifIlzarfBa5ZJKi7z4TR6B/Nhnchhwnw9GOwceVWeY3gLDPopj93kgv
	VY47SJ9M8evjha1YMtP0aLHTFyOhTDgYCeR2Gm1AwiHLcCJEEUnzzzW1QXdnAxCb
	DsNyu5Muwr7zuEgbBVqjQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=fastmail.im a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795629920; d=fastmail.im;
	mf=PGFsaWNlLmtlcm5lbEBmYXN0bWFpbC5pbT4=;
	rt=PGxpbnV4LWtzZWxmdGVzdEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:i/qYqqEOiFBpKYCjuWjteYdbwRgEjiLVXeZp2dhJoRtep/5
	6ELz/TxQtbaM6w7W9GVqP42to/jFa0swLMKbDhxaDiWkTj39IHTEeWKHMe3mk+f1
	bpF0o9MxwDaIKgXB0h1tpI3y+LcLsZRbiCOaOUbkzQo5bR5iW1XcTY7clsR5NL67
	vPgRFN6V7tURA+tLHw//qHOih8tPwquhYl+icBmJSXf7mv150gAPmI6JvYGLJb85
	VoI1aOH4YH4qIBkMLKaUFqCj0TXE1HgPA0vgNuVQ+jEDmLyCb5YAdeOl0SfE1r7x
	hRTNxZy3WO/oh9+no1gLx1vfu17SjJlUGl9I6Yg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:IEyVUc2R//xhEGEphG7IDG66ZkpiFyZ3FP6KGpVAk2g=:756KKTwRcKpirNmTmOP5ZFUYVirFIXOStTDGQD4Ad5k=;
X-ME-Sender: <xms:WyMHaxUnJutPelKlH5b3eZF6S5gA-_Iao5j5fR5pibxsohZKEEFkTg>
    <xme:WyMHa8ZVRn-mCxy94SJ9gjC9Om_Tyrv5eB3rluFHUwZO7rc6WrL_mceVlVnD9M-HP
    uEJKARx0MgJ6nXBkWdlDWMHSp9uAhkKyyc_9nB3Mqwv1Nzi6Dupsr5pQA>
X-ME-Proxy-Cause: dmFkZTG3IahGvKYf+slUa5xPUppAJQM0Tl4EtXiPI1a1U2PtkCa13BIsLl81Ygt7hPYIkN
    3TA0vAXvoh2Bbi9WaoCpACgBTj21h9U5pue9pNSCdhrbqcMqWeKmOiL4i5guQjv5jHl+ZZ
    qtUIo773PWtDcYvmJ09Mt+fxk3FtQ02mkJg5+I4WGaqvbxtf86Wj3v/NnObeXa7wGx3/nT
    Aas86WiLS3I0MSKSmTRw9eSPe2RtEBLL4dhRBI9u6zqJYSloql6MMLrvXJz4Snj665b6Jk
    WC7YRRLTkQUt6Ama4pXg/GQGPZMd9MohnnK9E4IAwxKyIVhVMUUu+J7J3QC7/mxp+1r9Dk
    WbvyKcpWltLPx1pwSSNKkldHpLduspvQQEFYsxw+6fHeas69/LB1ozhyh0fz0z4djukHZu
    a9T8DVnhlZz47OMPY0Boa/yAj8xyysF2Jg4PYNAKwivtct0rgysXHx8ueWP3jw0qXhoHSw
    YHqRIVYuyRvyi7Qld+Y7lpkqaiyWNXiQMQFipIp12Vy/1ydSV/yeEF9hF7UtHAXyzI9sf1
    SUzzvncRluQA+9a/Req+zEIJWXpkqncTYiO+X5vBWiOGMX8dQNbFuQW3f+U5Y+/fseeniG
    F0e8gufCqLgmrP5y7W3serqPQ+h5JsNbTNLfdipNwrelJj/xli0Y/gjQ9Eeg
X-ME-Proxy: <xmx:XSMHa7Eg50aMgG0uIYuCdLB14X9Ty6_GapR8wBXseVA28kFfArcVsQ>
    <xmx:XSMHa-2QYd6WXyuc-9PM-g8ADPc8sbWWWszymDZxEfsGnQr1VkjBWQ>
    <xmx:XSMHa7KtJRHkmXDMLjaGNn_EwKi_VHJNRRKV15c9lXaGoYYV507Lcw>
    <xmx:XSMHa70s27AxGdhG_yg7lbMO07XFvj2KRqz0QokoV9C9hksjIyopuA>
    <xmx:YCMHa0x6rD5Vy7RsiqF3DhkSaB25yh4e7iLU665XAZ8BuWcLGaeX3S8w>
Feedback-ID: i559e4809:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 232242F8005A; Wed, 25 Nov 2026 13:05:15 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 25 Nov 2026 20:04:52 +0200
From: "Alice Mikityanska" <alice.kernel@fastmail.im>
To: "Haishuang Yan" <yanhaishuang@cmss.chinamobile.com>,
 netdev@vger.kernel.org
Cc: "David Ahern" <dsahern@kernel.org>, "Ido Schimmel" <idosch@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>,
 "Shuah Khan" <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <d95b320a-d7de-4a93-9714-192894bb5b76@app.fastmail.com>
In-Reply-To: <20261124013124.3693-7-yanhaishuang@cmss.chinamobile.com>
References: <20261124013124.3693-1-yanhaishuang@cmss.chinamobile.com>
 <20261124013124.3693-7-yanhaishuang@cmss.chinamobile.com>
Subject: Re: [PATCH net-next 6/6] selftests: net: big_tcp_tunnels: Cover IP tunnels
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Nov 24, 2026, at 03:31, Haishuang Yan wrote:
> Now that ipip, gre, gretap, sit, ip6tnl, ip6gre and ip6gretap allow BIG
> TCP too, run the same checks over them as for vxlan, geneve and
> bareudp, without encapsulation and with FOU, and with GUE too on an
> IPv4 underlay.
>
> sit only carries IPv6, and is only run with veth tx checksum offload
> enabled: GRO does not build sit packets larger than 64KB, so with
> software GSO on the sender the receiver does not see any BIG TCP
> packet.
>
> fou is not loaded on demand when it is built as a module, so load fou
> and fou6 first, like pmtu.sh does.
>
> Signed-off-by: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
> ---
>  .../testing/selftests/net/big_tcp_tunnels.sh  | 131 +++++++++++++++++-
>  1 file changed, 128 insertions(+), 3 deletions(-)
>
> diff --git a/tools/testing/selftests/net/big_tcp_tunnels.sh 
> b/tools/testing/selftests/net/big_tcp_tunnels.sh
> index 9c1482b842b..9f185eb2065 100755
> --- a/tools/testing/selftests/net/big_tcp_tunnels.sh
> +++ b/tools/testing/selftests/net/big_tcp_tunnels.sh
> @@ -1,7 +1,9 @@
>  #!/usr/bin/env bash
>  # SPDX-License-Identifier: GPL-2.0
>  #
> -# Testing for IPv4 and IPv6 BIG TCP over VXLAN, GENEVE and bareudp 
> tunnels.
> +# Testing for IPv4 and IPv6 BIG TCP over VXLAN, GENEVE and bareudp 
> tunnels,
> +# and over ipip, gre, gretap, sit, ip6tnl, ip6gre and ip6gretap 
> tunnels,
> +# without encapsulation and with FOU and GUE.
> 
>  source "$(dirname "$0")/lib.sh"
> 
> @@ -17,6 +19,8 @@ CLIENT_IP6="2001:db8::1:2"
>  CLIENT_IP4_TUN="192.168.2.2"
>  CLIENT_IP6_TUN="2001:db8::2:2"
> 
> +FOU_PORT=5555
> +
>  # Kselftest framework requirement - SKIP code is 4.
>  ksft_skip=4
> 
> @@ -71,15 +75,80 @@ setup_bareudp() {
>  	return 1
>  }
> 
> +# $1: tunnel type, $2: traffic family
> +# Prints the IP protocol carried by FOU for this tunnel.
> +fou_ipproto() {
> +	case "$1" in
> +	ipip)
> +		echo 4
> +		;;
> +	sit)
> +		echo 41
> +		;;
> +	ip6tnl)
> +		if [ "$2" = 4 ]; then
> +			echo 4
> +		else
> +			echo 41
> +		fi
> +		;;
> +	*)
> +		echo 47
> +		;;
> +	esac
> +}
> +
> +# Create an IP tunnel device, with FOU or GUE encapsulation if requested.
> +# $1: netns, $2: device, $3: tunnel type, $4: tunnel family,
> +# $5: traffic family, $6: encapsulation (none, fou or gue),
> +# $7: local underlay address, $8: remote one
> +setup_ip_tunnel() {
> +	local encap_args=()
> +	local fou_args=()
> +	local mode=()
> +
> +	if [ "$4" = 6 ]; then
> +		fou_args=(-6)
> +	fi
> +	if [ "$6" = fou ]; then
> +		ip -netns "$1" fou add port "$FOU_PORT" \
> +			ipproto "$(fou_ipproto "$3" "$5")" "${fou_args[@]}" ||
> +			return 1
> +	elif [ "$6" = gue ]; then
> +		ip -netns "$1" fou add port "$FOU_PORT" gue "${fou_args[@]}" ||
> +			return 1
> +	fi
> +	if [ "$6" != none ]; then
> +		encap_args=(encap "$6" encap-sport auto encap-dport "$FOU_PORT")

Suggestion: also set encap-csum to cover correct handling of the outer
UDP checksum (IPv4 underlay), especially for the software checksum case
(but useful for csum offload too). encap-udp6-csum (incorrectly called
encap-csum6 in iproute2 help) should be on by default, but encap-csum
seems to be off by default.

> +	fi
> +	if [ "$3" = ip6tnl ]; then
> +		if [ "$5" = 4 ]; then
> +			mode=(mode ipip6)
> +		else
> +			mode=(mode ip6ip6)
> +		fi
> +	fi
> +
> +	ip -netns "$1" link add "$2" type "$3" "${mode[@]}" \
> +		local "$7" remote "$8" "${encap_args[@]}"
> +}
> +
> +# $1: tunnel type, $2: tunnel family, $3: veth tx csum offload,
> +# and for IP tunnels: $4: traffic family, $5: encapsulation
>  setup_tunnel() {
> +	local name="${1^^}"
> +
> +	if [ "${5:-none}" != none ]; then
> +		name="$name/${5^^}"
> +	fi
>  	if [ "$2" = 4 ]; then
>  		SERVER_IP="$SERVER_IP4"
>  		CLIENT_IP="$CLIENT_IP4"
> -		echo "Setting up ${1^^} over IPv4, veth tx csum offload $3"
> +		echo "Setting up $name over IPv4, veth tx csum offload $3"
>  	else
>  		SERVER_IP="$SERVER_IP6"
>  		CLIENT_IP="$CLIENT_IP6"
> -		echo "Setting up ${1^^} over IPv6, veth tx csum offload $3"
> +		echo "Setting up $name over IPv6, veth tx csum offload $3"
>  	fi
> 
>  	case "$1" in
> @@ -95,6 +164,10 @@ setup_tunnel() {
>  		setup_bareudp "$CLIENT_NS" tun0 "$CLIENT_IP" "$SERVER_IP" ||
>  			return 1
>  		;;
> +	*)
> +		setup_ip_tunnel "$CLIENT_NS" tun0 "$1" "$2" "$4" "$5" \
> +			"$CLIENT_IP" "$SERVER_IP" || return 1
> +		;;
>  	esac
>  	ip -netns "$CLIENT_NS" link set tun0 up
>  	ip -netns "$CLIENT_NS" addr replace "$CLIENT_IP4_TUN/24" dev tun0
> @@ -115,6 +188,10 @@ setup_tunnel() {
>  		setup_bareudp "$SERVER_NS" tun1 "$SERVER_IP" "$CLIENT_IP" ||
>  			return 1
>  		;;
> +	*)
> +		setup_ip_tunnel "$SERVER_NS" tun1 "$1" "$2" "$4" "$5" \
> +			"$SERVER_IP" "$CLIENT_IP" || return 1
> +		;;
>  	esac
>  	ip -netns "$SERVER_NS" link set tun1 up
>  	ip -netns "$SERVER_NS" addr replace "$SERVER_IP4_TUN/24" dev tun1
> @@ -127,9 +204,22 @@ setup_tunnel() {
>  	ip netns exec "$SERVER_NS" ethtool -K link1 tx-checksumming "$3" > /dev/null
>  }
> 
> +# For IP tunnels: $1: tunnel family, $2: encapsulation
>  cleanup_tunnel() {
> +	local fou_args=()
> +	local ns
> +
>  	ip -netns "$CLIENT_NS" link del tun0
>  	ip -netns "$SERVER_NS" link del tun1
> +	if [ "${2:-none}" = none ]; then
> +		return 0
> +	fi
> +	if [ "$1" = 6 ]; then
> +		fou_args=(-6)
> +	fi
> +	for ns in "$CLIENT_NS" "$SERVER_NS"; do
> +		ip -netns "$ns" fou del port "$FOU_PORT" "${fou_args[@]}"
> +	done
>  }
> 
>  cleanup() {
> @@ -240,6 +330,26 @@ if ! ip link help 2>&1 | grep gso_ipv4_max_size &> 
> /dev/null; then
>  	exit "$ksft_skip"
>  fi
> 
> +# $1: tunnel type, $2: tunnel family, $3: traffic family, $4: encapsulation
> +run_ip_tunnel() {
> +	local csum_offload
> +
> +	for csum_offload in on off; do
> +		# GRO does not build sit packets larger than 64KB, so with
> +		# software GSO on the sender there is nothing big to receive.
> +		if [ "$1" = sit ] && [ "$csum_offload" = off ]; then
> +			continue
> +		fi
> +		setup_tunnel "$1" "$2" "$csum_offload" "$3" "$4" || exit "$?"
> +		do_test "$2" "$3" "$csum_offload" || exit "$?"
> +		cleanup_tunnel "$2" "$4"
> +	done
> +}
> +
> +# fou is not loaded on demand when built as a module
> +modprobe -q fou
> +modprobe -q fou6
> +
>  WORKDIR=$(mktemp -d)
>  trap cleanup EXIT
>  setup
> @@ -254,3 +364,18 @@ for tunnel in vxlan geneve bareudp; do
>  		done
>  	done
>  done
> +for encap in none fou gue; do
> +	run_ip_tunnel ipip 4 4 "$encap"
> +	for traffic_family in 4 6; do
> +		run_ip_tunnel gre 4 "$traffic_family" "$encap"
> +		run_ip_tunnel gretap 4 "$traffic_family" "$encap"
> +	done
> +	# GUE is only supported on an IPv4 underlay
> +	[ "$encap" = gue ] && continue
> +	run_ip_tunnel sit 4 6 "$encap"
> +	for traffic_family in 4 6; do
> +		run_ip_tunnel ip6tnl 6 "$traffic_family" "$encap"
> +		run_ip_tunnel ip6gre 6 "$traffic_family" "$encap"
> +		run_ip_tunnel ip6gretap 6 "$traffic_family" "$encap"
> +	done
> +done
> -- 
> 2.43.0
