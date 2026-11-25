Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795570499;
	b=cnjcET1bejSolIZHmvoeO2Zo9d6WRU9DAJ3+SKSHJEQdEM10n9SrzhryLFVHsHW84E+c
	 1PUF8d2pKo0NVARN7+Y7A/4khFclCeHLI9yUeSltxCqJBL+/0mHcF0mqU1XXG3ndkz3kV
	 7UZVVQR4uMkU9+RlOASeBknrjI1I6P4K7sE1PYn2zkOcI++CiYPKbH0J8NTTrI+qGrffg
	 Q825bWsEJkJBS6zwi46NRc3tDeFJAVojD05eE/5e9n5MdvgDnDCsRLfOiBnF2YhX7SQ74
	 1249CGIXiynKTIRDLqFmS8JTeX+JxJr/VGuTMBR7/VXxVtN2DqItXv15lATGe8jm+qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570499;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ISBgR7gESgw4ZES9JGQDlJ1ooxeV9C8odGf+egbdKG0=;
	b=HscXtg9W5YiDtmJQC5Wr+TtEsLjEh74oerqT8MHU4jcAqL+GigfUF1qe7FqniofQuUt3
	 XoORP6syYc07VY7Z8MpOyFf+mUvybdw34NQ8cQ61fn7wPKlqKioxNz8Jpk/JZtdzIQm1A
	 DZr9xbo9aTIaFrE7qddgaNFOE81DH5V1MRXVE5v1Il+eHdzR0/id6NJ5BipsAXSxxkdBT
	 mMsQbFqB8k/9tW13AiuY5y+JDvuoxZKu9XlEN2xldCjGpmB1UpX/qXlATLSV4x9W7vEBF
	 fIenYF8sSLGUi92g6/pHD25IzrOGF8aSLzSeiL8urnz8C0KeNsEpdX+FLMsWZrr340w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DUKoyJB6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C12606A33A;
	Wed, 25 Nov 2026 01:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DUKoyJB6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE2791F00A01;
	Wed, 25 Nov 2026 01:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795570498;
	bh=ISBgR7gESgw4ZES9JGQDlJ1ooxeV9C8odGf+egbdKG0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DUKoyJB6GOhGYlMCU4ndLe/8YcEiOLjypzmVCVs2b/s3bkFKeF7okDDnCEADkPYI2
	 Q/YZWXb19/7J75cTBc+aOHpv/mHOEg0h+p7ov/UmlCqaCEahKmapQLIjnbLOZ7D5+S
	 Dh6kbvTR21oo8jA8XRyAYoGBNOMkNsRmWkY6Qp1qMODCNRRSnn+7vDyYx3gdtEy864
	 11d/pof8pV/kRIso/4tbnO6AlxQTugh7fXHE6Aw9fsAW1dDRBgs6C3+XxZRUIuzePS
	 S4elv1Dvzl6wOiKEW06vFkUayyHEVAMCSHa09pKV3sY9gFgKQBvKrJ8JVtWYiV8km9
	 bTyMKdIcv5bDg==
Subject:
 Re: [PATCH net-next 6/6] selftests: net: big_tcp_tunnels: Cover IP tunnels
From: netdev-bot+sashiko@kernel.org
To: yanhaishuang@cmss.chinamobile.com
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, alice.kernel@fastmail.im,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 25 Nov 2026 01:34:57 +0000
Message-ID: <179557049725.3135.4073142828865813935@kernel.org>
In-Reply-To: <20261124013124.3693-7-yanhaishuang@cmss.chinamobile.com>
References: <20261124013124.3693-7-yanhaishuang@cmss.chinamobile.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In the main loop of
  tools/testing/selftests/net/big_tcp_tunnels.sh (lines 373-374), the…
- [Low] The commit message says fou and fou6 are loaded "like pmtu.sh
  does".
- [Low] The comment in run_ip_tunnel() (big_tcp_tunnels.sh lines 338-339)
  explains the skipped sit csum-off case as "GRO does not build sit…

--

selftests: net: big_tcp_tunnels: Cover IP tunnels

This patch extends big_tcp_tunnels.sh to run the BIG TCP checks over
ipip, gre, gretap, sit, ip6tnl, ip6gre and ip6gretap. They run without
encapsulation and with FOU, and with GUE on an IPv4 underlay. sit runs
only with veth tx checksum offload enabled, and fou/fou6 are loaded with
modprobe before the tests start.

> diff --git a/tools/testing/selftests/net/big_tcp_tunnels.sh b/tools/testing/selftests/net/big_tcp_tunnels.sh
> index 9c1482b842bfc..9f185eb20652e 100755
> --- a/tools/testing/selftests/net/big_tcp_tunnels.sh
> +++ b/tools/testing/selftests/net/big_tcp_tunnels.sh

[ ... ]

> @@ -240,6 +330,26 @@ if ! ip link help 2>&1 | grep gso_ipv4_max_size &> /dev/null; then
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

[Severity: Low]
Is this the real reason the csum-off sit case has nothing big to receive?

In csum-off mode, do_test() counts packets over 64KB on PREROUTING
-i tun1, after decapsulation. The sender did software GSO, so those
packets can only exist if receive-side GRO aggregated them.

ipip and gre get that aggregation through ip_tunnel_rcv():

net/ipv4/ip_tunnel.c:ip_tunnel_rcv() {
    ...
	gro_cells_receive(&tunnel->gro_cells, skb);
    ...
}

sit has no gro_cells and ends in a plain netif_rx():

net/ipv6/sit.c:ipip6_rcv() {
    ...
		dev_sw_netstats_rx_add(tunnel->dev, skb->len);

		netif_rx(skb);
    ...
}

veth also has GRO disabled by default (veth_disable_gro()), and the test
never enables it. So the 64KB limit for encapsulated packets (the
p->encapsulation check in skb_gro_receive()) never applies here, because
sit packets don't go through GRO at all on this receive path.

Would it be more accurate to say that sit does not use gro_cells on
receive? The commit message gives the same explanation.

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

[Severity: Low]
The commit message says fou and fou6 are loaded "like pmtu.sh does".
pmtu.sh, however, turns a modprobe failure into a skip:

tools/testing/selftests/net/pmtu.sh:setup_fou_or_gue() {
    ...
		modprobe fou || return $ksft_skip
    ...
		modprobe fou6 || return $ksft_skip
    ...
}

Here the errors are silenced and the result is not checked. If fou or
fou6 is not available, won't the script report a failure instead of a
skip?

setup_ip_tunnel()
    ip -netns "$1" fou add port "$FOU_PORT" ... || return 1
setup_tunnel()
    setup_ip_tunnel ... || return 1
run_ip_tunnel()
    setup_tunnel ... || exit "$?"

The script then exits 1, after the vxlan, geneve, bareudp and
encap-none cases have already passed. A kernel that passed
big_tcp_tunnels.sh before this patch would now fail it.

tools/testing/selftests/net/config sets CONFIG_NET_FOU=y and
CONFIG_IPV6_FOU=m, so only kernels built with a different config are
affected.

Could a modprobe failure here exit with ksft_skip, or skip only the fou
and gue cases?

>  WORKDIR=$(mktemp -d)
>  trap cleanup EXIT
>  setup

[ ... ]

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

[Severity: Medium]
Is this comment accurate? net/ipv6/fou6.c defines gue6_build_header()
and registers GUE for IPv6 tunnels:

net/ipv6/fou6.c:fou6_init() {
    ...
	ret = ip6_tnl_encap_add_ops(&gue_ip6tun_ops, TUNNEL_ENCAP_GUE);
    ...
}

Also, pmtu.sh in the same directory already runs
pmtu_ipv4_gue6_exception and pmtu_ipv6_gue6_exception.

The continue also comes before the sit line, and sit uses an IPv4
underlay. Like ipip, sit sets up its encap with ip_tunnel_encap_setup()
and calls ip_tunnel_encap() in ipip6_tunnel_xmit(). pmtu.sh also tests
sit over gue4. Was sit meant to be skipped for GUE?

As written, sit, ip6tnl, ip6gre and ip6gretap never get BIG TCP coverage
with GUE. The earlier patches in the series still raise tso_max_size for
these devices whatever the encap type.

The loop also doesn't match the new file header:

    # and over ipip, gre, gretap, sit, ip6tnl, ip6gre and ip6gretap tunnels,
    # without encapsulation and with FOU and GUE.

It doesn't match the commit message either, which says "with GUE too on
an IPv4 underlay".

Could the continue move below the sit line, with the comment corrected?
Could GUE also be run for the IPv6 underlay tunnels?

> +	for traffic_family in 4 6; do
> +		run_ip_tunnel ip6tnl 6 "$traffic_family" "$encap"
> +		run_ip_tunnel ip6gre 6 "$traffic_family" "$encap"
> +		run_ip_tunnel ip6gretap 6 "$traffic_family" "$encap"
> +	done
> +done

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124013124.3693-1-yanhaishuang%40cmss.chinamobile.com
