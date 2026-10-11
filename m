Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B285523D2B1;
	Sun, 11 Oct 2026 01:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791681807; cv=none; b=qKQcJzTEIUaNpm8nOv3Yni9OsVk2NPGEyQ9uMaylmnVSyJaXt7Lfau4GPkeHzOcsOx0oUvieTkI5OP17jvvRpH9B0cFnMMqFM0w+MuuQdXiyJCJ9os7NgBqgV5LWYXzx4jtqNS/nYWsgMwovbKmttn5xft0zdHL0njkNBwkkSXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791681807; c=relaxed/simple;
	bh=S/iR5ZwEHwlqso+EA2qul9oFNcD0effkoti8sZFvXcA=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D1/BbTZLgN7RfTaTdatKt/y8kTn9TYrIIH3oRk6hZQQLVDoWTW3iujXu8dcfVd8yaZSa8n357Sc9F+kTs8oSm8YUYoae+4Gxqb9W/EbOcfEEbactTzIY1K9/vq8gFApW62AsGHLwA6IOD2MbsZngrU94FPVITN5vmnfaWppQf+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JH2Q9sOp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JH2Q9sOp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D2811F000FF;
	Sun, 11 Oct 2026 01:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791681806;
	bh=n7E0hFoL1L830TCgQ2PQGlQVAtS4G3r4ObSfPqRqlew=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=JH2Q9sOpWLqAHEdnkOrBhwueQLGpriY7wxXHmohKvxswT6LRjHGTnFtS0pKBVvg9e
	 jFtXzovBvMHYzNCSmyaf2uyjDvjOy8OGC9LXbyoouzvGD3jqnBtTAnh9kHZx50IT8K
	 D/pH9AnacF8aGj8VLUYOIr49SLnXMsmBI2aJw1p8ojpukXUjC5Jvvs3eAJfLGY+q93
	 h4Xb1cqqBECwqh1/AqSD4nJqJoJsobM0Z74SAEy8doFoFYesIy5ctukmemI9NjzTUs
	 4nW0VDHedqYiUt7ODN8U0yOCJ8Ca+Z2aBOVJxrUeF60NseFFIbcmiVXLEJRl1MtITD
	 zmNr0xzqj98dA==
Subject: Re: [PATCH net-next] selftests: net: bareudp: Add stream tests with
 software GSO
From: netdev-bot+sashiko@kernel.org
To: yanhaishuang@cmss.chinamobile.com
Cc: netdev@vger.kernel.org, willemb@google.com, martin.varghese@nokia.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sun, 11 Oct 2026 01:23:25 +0000
Message-ID: <179168180510.434549.891701914488385708@kernel.org>
In-Reply-To: <20261008055920.1560930-1-yanhaishuang@cmss.chinamobile.com>
References: <20261008055920.1560930-1-yanhaishuang@cmss.chinamobile.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The two new "Unicast MPLS stream over UDPv4/UDPv6" tests never
  push a GSO packet through bareudp's UDP-tunnel software segmentation.
- [Low] exit_cleanup() calls cleanup_all_ns before the new `[ -n
  "${TMPFILE}" ] && rm -f "${TMPFILE}"`.

--

selftests: net: bareudp: Add stream tests with software GSO

This patch adds TCP stream tests to bareudp.sh. After each ping test, a
16 MiB file is copied with socat from NS0 to NS3. UDP tunnel segmentation
offload is turned off on the underlay veths so that bareudp's GSO packets
are segmented in software.

> diff --git a/tools/testing/selftests/net/bareudp.sh b/tools/testing/selftests/net/bareudp.sh
> index d9e5b967f8151..4b6d3a64f3c3f 100755
> --- a/tools/testing/selftests/net/bareudp.sh
> +++ b/tools/testing/selftests/net/bareudp.sh
> @@ -105,17 +105,27 @@

[ ... ]

>  # Exit the script after having removed the network namespaces it created
>  exit_cleanup()
>  {
>  	cleanup_all_ns
> +	[ -n "${TMPFILE}" ] && rm -f "${TMPFILE}"

[Severity: Low]
exit_cleanup() runs from the EXIT trap, and set -e is still active at that
point. cleanup_all_ns can return non-zero. For example, cleanup_ns() in
lib.sh sets ret=1 when it hits this path:

tools/testing/selftests/net/lib.sh:cleanup_ns() {
    ...
		if ! busywait $BUSYWAIT_TIMEOUT ip netns list \| grep -vq "^$ns$" &> /dev/null; then
			echo "Warn: Failed to remove namespace $ns"
			ret=1
    ...
}

When that happens, does the shell exit before the rm? That would leave the
16 MiB file that setup_underlay() created with mktemp and dd in $TMPDIR.

Would it help to remove TMPFILE before calling cleanup_all_ns, or to
tolerate its failure?

[ ... ]

> @@ -307,12 +380,18 @@ ping_test()

[ ... ]

>  	if [ $MPLS_UC ]; then
>  		ping_test_one "${PING6}" "2001:db8::203" "Unicast MPLS packets over ${UNDERLAY}${MODE}"
> +		stream_test_one "TCP6:[2001:db8::203]:${STREAM_PORT}" \
> +			"Unicast MPLS stream over ${UNDERLAY}${MODE}"
>  	fi
>  }

[Severity: Medium]
The new header comment says:

  so that the GSO packets encapsulated by bareudp are segmented in software.

Does that hold for the two Unicast MPLS stream tests?

In NS0, mpls_xmit() sets skb->protocol to ETH_P_MPLS_UC. veth01 advertises
GSO in its MPLS features:

drivers/net/veth.c:veth_setup() {
    ...
	dev->mpls_features = NETIF_F_HW_CSUM | NETIF_F_GSO_SOFTWARE;
    ...
}

So the TSO skb reaches NS1 unsegmented, and the veth10 ingress rule
redirects it to bareudp_ns1. There, validate_xmit_skb() masks the features
through netif_skb_features()->harmonize_features()->net_mpls_features():

net/core/dev.c:net_mpls_features() {
    ...
	features &= skb->dev->mpls_features;
    ...
}

bareudp_setup() sets dev->features and dev->hw_features but never
dev->mpls_features. That field only holds NETIF_F_SG, which
register_netdevice() adds, so all the TSO bits are cleared.

If mpls_gso is loaded, mpls_gso_segment() splits the skb before
bareudp_xmit(). bareudp then only encapsulates single segment packets, and
software UDP tunnel segmentation on veth12/veth21 never runs for MPLS.

If no ETH_P_MPLS_UC offload is registered, skb_mac_gso_segment() returns
-EPROTONOSUPPORT and the skb is dropped. With CONFIG_NET_MPLS_GSO=n, the
drop happens later instead, in skb_udp_tunnel_segment() at veth12, because
the inner protocol is MPLS.

tools/testing/selftests/net/config doesn't list CONFIG_NET_MPLS_GSO. It
only ends up =m through CONFIG_OPENVSWITCH=m, and nothing loads
mpls_gso.ko automatically. In those setups, could the MPLS stream tests
time out on a correct kernel?

The commit message also suggests these tests don't reach the tunnel GSO
path:

  Without commit c57b2e60d4bf ("bareudp: set the inner protocol to the
  protocol of the packet"), the IPv4 and IPv6 streams over UDPv6, and the
  IPv6 stream over UDPv4 in multiproto mode, time out.

Before that commit, an MPLS GSO skb reaching UDPv6 tunnel segmentation
would have kept the stale ETH_P_IPV6 inner protocol from mpls_xmit(). Yet
the MPLS stream over UDPv6 isn't listed as timing out.

Should the MPLS stream tests be dropped? Alternatively, the header comment
and commit message could be updated and CONFIG_NET_MPLS_GSO added to the
selftests config.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261008055920.1560930-1-yanhaishuang%40cmss.chinamobile.com
