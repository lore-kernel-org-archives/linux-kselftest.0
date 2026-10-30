Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793325924;
	b=ZFkbB2TS3aD6M4lvIGPHwZk8iRXYhax6Bfi1dbt2agH0JMZX6X6XHhGss0Hr/T3xE/gY
	 ExPnOiis8YmrQNKnGOY3T5xIxMQ0WLuaayH22N3cc2chm3LLLftMPVyCbXOoRUbgLeOIb
	 cS0GoeC2vBeGfBy/6p3ek5NGwLKKA6JmhJNFxFtkMve3SuUYzobtjsAV+gNWXHkJf0P3W
	 7hQLlrUDHB3hvtipe5JFGo/pzSO1m4R/SFEZ04V18cuSmpCCGNTPvcfy4Fp/hAgGlzSYZ
	 E+VaDIwe5YqOEpdwHDijmKpg0uh1KCtA4BForGcsHco8kgGSvRZdrrxDQp20tbSWjqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793325924;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=7RZ2cruY3Jw2zdeyjfrMfHJnTtLlKHCFte3yRuO4+Y0=;
	b=qQ11IfEN3yUcG2mhlJtalXhAduepN5W9leRcCuoFfUnJkd9pkxYtukDkVem0cM0AQ43o
	 uiZcqM1Af3+gXDKgqnb/u2Aj/Jhz4TJcw5AOjFAIci1fZ7/4lS/siREwg0gk34RrbvarS
	 z4Ch1cCqidYHjIcPWcX9qovZ4b+o4yJHhyIxI2GaLdwUhOQxOasXHckrvrJnz09kazbvY
	 beXGrS86JJO42eZ63ZxYM2g2xxHbDkioJXt/x/9WNZldGIfewcl0hORGVRI2L3Lefi4fF
	 dImwSd1FNESkwkDlLpIzpRdWJ92RLSdI9VftaakQa1fvTudbmG4KSvpM1k2fXTDOEUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RluOa5po;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F6D606A320;
	Fri, 30 Oct 2026 02:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RluOa5po
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2039E1F00A16;
	Fri, 30 Oct 2026 02:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793325923;
	bh=7RZ2cruY3Jw2zdeyjfrMfHJnTtLlKHCFte3yRuO4+Y0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RluOa5poUUD5NMxgbYkCAXs72D+Wd+X3mGPBekn65BCF747Q8ny9bzCqTtYMSY1FL
	 gkBjKudYp4QZ1JFquF/E1X9URGDEp8768kYPB17h1Z61dPu5tbGWIrjUbU90VG3iFZ
	 UwtcPliMNcM1CQTcV30AUvvwkb4h2s6WwMouJVkz6uS36XFrke9Rd2e58h+W7vYYSp
	 LYYTcIHnYSXwFPCJvToxVXotjPWyqSSvMyKtyD3SW+ZeabueGC1xLhi/K1+9iklvtM
	 UbHKnpBqSk0jHJJVquEYFACUK4t8sMyaRDpKbY6MTEWKq5UN0a9V3Eja2XWWDyPCtl
	 hl+j+PhDacNPQ==
Subject: Re: [PATCH net v2 2/2] selftests: net: netlink-dumps: start a dump
 with a notification queued
From: netdev-bot+sashiko@kernel.org
To: jhonata.poma@gmail.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kuniyu@google.com, m.szyprowski@samsung.com
Date: Fri, 30 Oct 2026 02:05:22 +0000
Message-ID: <179332592266.3134.13451886861849172009@kernel.org>
In-Reply-To: <20261027-netlink-dump-livelock-v2-2-c4bb05352a33@gmail.com>
References: <20261027-netlink-dump-livelock-v2-2-c4bb05352a33@gmail.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] Whether dump_with_queued_ntf
  (tools/testing/selftests/net/netlink-dumps.c) can catch the bug…

--

selftests: net: netlink-dumps: start a dump with a notification queued

This adds a dump_with_queued_ntf test to netlink-dumps.c. The test starts
an RTM_GETLINK dump on a socket with SO_RCVBUF 2048 while an lo link
notification is still queued. It reads like libnl does, peeking before
each read, and expects the dump to finish with a zero status.

> diff --git a/tools/testing/selftests/net/netlink-dumps.c b/tools/testing/selftests/net/netlink-dumps.c
> index 51129c564d0a6..4a94a25167e25 100644
> --- a/tools/testing/selftests/net/netlink-dumps.c
> +++ b/tools/testing/selftests/net/netlink-dumps.c

[ ... ]

> @@ -260,4 +263,103 @@ TEST(close_with_ref)

[ ... ]

> +TEST(dump_with_queued_ntf)
> +{
> +	struct sockaddr_nl addr = {
> +		.nl_family	= AF_NETLINK,
> +		.nl_groups	= RTMGRP_LINK,
> +	};
> +	int netlink_sock, inet_sock, i, ret, links = 0;
> +	int rcvbuf = 2048;

[ ... ]

> +	// Leave one notification queued, then start the dump
> +	ASSERT_EQ(lo_set_up(inet_sock, false), 0);
> +	n = send(netlink_sock, &dump_links, sizeof(dump_links), 0);
> +	ASSERT_EQ(n, sizeof(dump_links));

[Severity: Low]
Does this test catch the bug on every kernel config? The commit message
says "The test fails without the previous patch". That seems to depend on
how much memory the kernel charges for the queued notification, and the
test never checks that.

With SO_RCVBUF 2048, sk_rcvbuf ends up as 4096. Call the truesize of the
queued lo RTM_NEWLINK notification T. Call the truesize of the -ENOBUFS
ack that netlink_ack() sends A. The old check in netlink_dump():

    rmem != skb->truesize && rmem >= rcvbuf

rejects the first large dump skb whenever T > 0. What happens next is
decided in netlink_attachskb():

    if ((rmem == skb->truesize || rmem <= READ_ONCE(sk->sk_rcvbuf)) &&
        !test_bit(NETLINK_S_CONGESTED, &nlk->state)) {

If T + A <= 4096, the ack is queued. The unfixed kernel keeps failing the
dump from netlink_recvmsg(), the peek/read loop never sees NLMSG_DONE,
and EXPECT_TRUE(done) fails as intended.

If T + A > 4096, the ack is dropped and netlink_overrun() is called. Once
the test reads the notification, the socket is empty. The old
rmem == skb->truesize exception then lets the dump go through, so the
test passes on an unfixed kernel. When T >= 4096, the fixed check:

    if (rmem - skb->truesize >= rcvbuf || rmem > INT_MAX) {

also rejects the first skb, so in that case the two kernels behave the
same.

T looks config dependent. netlink_trim() shrinks the notification with
pskb_expand_head() into a kmalloc bucket that has to hold the payload
plus skb_shared_info.

With the default CONFIG_MAX_SKB_FRAGS=17, the lo notification seems to
fit the 2 KiB bucket (T around 2304). With CONFIG_MAX_SKB_FRAGS=45, the
larger skb_shared_info appears to push it into the 4 KiB bucket (T around
4352). These byte sizes are estimates, not runtime measurements.

The same thing could happen in two other cases. One is if the
pskb_expand_head() call in netlink_trim() fails, since it runs without
direct reclaim and with __GFP_NORETRY. The other is if the lo
notification grows in a future kernel.

Would it help to read SO_MEMINFO after lo_set_up(inet_sock, false) and
before send()? The test could then skip, or fail, unless
SK_MEMINFO_RMEM_ALLOC is non-zero and still leaves room for the ack, for
example RMEM_ALLOC <= SK_MEMINFO_RCVBUF / 2. Another option is to pick
SO_RCVBUF based on the measured notification size.

> +
> +	for (i = 0; i < 100 && !done; i++) {

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261027-netlink-dump-livelock-v2-0-c4bb05352a33%40gmail.com
