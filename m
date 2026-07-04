Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF5725B099
	for <linux-kselftest@vger.kernel.org>; Sat,  4 Jul 2026 19:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783192093; cv=none; b=LlUtwJzMe9xwPv/8QoVWaNUkHmY51wVKFayU7MQ8MSzf5xngiuDcKG+HdiqeM78iLecIWTwNyH4ZMFMIFwSekqd67RgOY0RpaCsnAgdZ/+tP3f+w6dNkMVvC0JdJyLqX0ghFEbScekIfqQ93Wx7t4cP1XMxB48262Istp2UTZtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783192093; c=relaxed/simple;
	bh=YNzXT3aqH9Fv7w8avj+C4EBMB5oQXh9FSLCur/rtAMk=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=Ql1Bb7/qkr6wTU+p3/XDu3mSz39cVq6Cf4YgMhUTSQ7Ah2rmOo9t7KpOGs3DKCHuHocWvm9D2JojYvhZh+U3jxzvIfxb4YofpgwAKwppE5BvS2S87YmnJ0RsY85XQVX8D8w0zD2ULSDuFznoahYCXjHcgfNORa5tAelsChtZXyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SRFolpZQ; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SRFolpZQ"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8111c0c7561so16387087b3.3
        for <linux-kselftest@vger.kernel.org>; Sat, 04 Jul 2026 12:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783192091; x=1783796891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gm/Rge7I0kflCRggw6lmJbxqV6a3OPZp5P4k8oCntmo=;
        b=SRFolpZQoqwIBPxqTJkNbLRhXfv8jn8fmRsIYzTxQKruvuCMl61MK7iwggYjk1CbDi
         B0gos9yQniqU4CSN/AqS6vI50ge+FJNuOFGJBvmkfCj+DIQ9WbHlL8+8VFBuUk+IFwx5
         +7dutaWCgewmXen3U+wNfnBggayI9+kJPhOn/TKjHVsXV+D276pqJFwIKhD0rUmoS/Im
         Aud18RIrunwAG7Sgc9tgevEQ/cEpsLRDCHqOkMczau8B9jQK8THnKKeK+X2VOgNx7yNB
         Q9LvAlQRLJZnk2cU+VqkM8Hv2BbSBAk0nK4aPo/o34IyyA7ukw/u90DKN0yfBFpcdPX7
         QbBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783192091; x=1783796891;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gm/Rge7I0kflCRggw6lmJbxqV6a3OPZp5P4k8oCntmo=;
        b=aSG3JfjZyRus3bhxQwrOO0k4SEfB7zMeCu6o7Z3507ug2gMjOomk4xao/OT0TlyiZc
         7iQpG5YLDfMnRzq93iFfmFAGQCAoN9PASIX37JC/UhSrAikqLEg7AWzYb/rmNZ64uMyE
         7k4iN7L6qZdC2i5BETSmjC3x+NNKhqpso0w0vwzlU/XGWH6hoskJhZyyv0QzW2G2Dcl5
         X3Zrz7BMvBgwYP9lGZMMUH62jVzPEBa3tLd5/94RoTP41IV6RPbWjByRf9Mp54W/z68E
         EHxNFduJ1J0TxfIQ5L94bavhiKx2hUCjodTrOtPzr/FSM++xhBqA8j/88BbnuUzZi/Ie
         XsYA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9Pnd4eZE/llaeC4WX5VU6kHSQCcRDGRFvKhTfP8ttmVwuB88/rXrgk2M9X4qA3MO3FMnm0egYLGzAZRNFzHg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGCoGS+pXwAn85aNrRqyj4nUtJLpyhVPaVw19BIe8J+Kjkc9iZ
	hGnJ4UV830PF5vey+1Ok+hqwF1i3yicskgnTPEUlMfMTi9SzI9I3ZRCt
X-Gm-Gg: AfdE7cniKOKKGXA5K+6sq01AA4b46mi4H7JaYW2lusycHnTrR2v1lb/5rLnadLrN4Zr
	VCtpUYA///UcVQIGFVDdiGRW1gXKn8T3dEk8JQbEHQDcxph8U7tyRXBQ92UpTAT5TyZs0BEPk1K
	MnW+gIY94ZrAqVAfQu1ZbyNCO9y3P1FhGw1eibE+rWNkGgqmz1LRgssMD40/kg8ONYGgDv7vk4B
	+GZ3mU/sDmozSCRhp+e0lpwWSHvZJCgAYg4X3m9eXi9HBfn5cCfK0rxyHxnVzMYlmi0vvP+piCB
	nkT4lT///NmhBXxtW0oX0sByilmSZia4+GG1Tt71F20qsFo7wskNGM6NKsuvOb3xvhD5O7DxS8p
	i25T/v7Z33ywe/wbbjobyRR8urITC4tUrf0Hh5tECi3+eF5xs4C+skes1pqxRhdkPiFwtGCI/w/
	I622BlgK/oNLLCLzS9Mu2DjGRoSQzto5bZfWx+a1D/7a4eqdXYzGT58tu8AJp3gpnIDg==
X-Received: by 2002:a05:690c:2789:b0:7f5:ec53:b4ce with SMTP id 00721157ae682-81737544143mr49405597b3.16.1783192091451;
        Sat, 04 Jul 2026 12:08:11 -0700 (PDT)
Received: from gmail.com (172.235.85.34.bc.googleusercontent.com. [34.85.235.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81448dd0217sm37817917b3.22.2026.07.04.12.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 12:08:10 -0700 (PDT)
Date: Sat, 04 Jul 2026 15:08:09 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Anton Danilov <littlesmilingcloud@gmail.com>, 
 netdev@vger.kernel.org
Cc: Willem de Bruijn <willemb@google.com>, 
 "David S . Miller" <davem@davemloft.net>, 
 David Ahern <dsahern@kernel.org>, 
 Eric Dumazet <edumazet@google.com>, 
 Kuniyuki Iwashima <kuniyu@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, 
 linux-kselftest@vger.kernel.org
Message-ID: <willemdebruijn.kernel.1f71507524703@gmail.com>
In-Reply-To: <a196b53a2829da66c982f88e82805afc498ea13b.1782945956.git.littlesmilingcloud@gmail.com>
References: <cover.1782945956.git.littlesmilingcloud@gmail.com>
 <a196b53a2829da66c982f88e82805afc498ea13b.1782945956.git.littlesmilingcloud@gmail.com>
Subject: Re: [PATCH net-next v4 2/2] selftests: net: add FOU multicast
 encapsulation resubmit test
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Anton Danilov wrote:
> Add a selftest to verify that FOU-encapsulated packets addressed to a
> multicast destination are correctly resubmitted to the inner protocol
> handler (GRE) via the UDP multicast delivery path.
> 
> The test creates two network namespaces connected by a veth pair with
> a FOU/GRETAP tunnel using a multicast remote address (239.0.0.1).
> Ping is sent through the tunnel and received packets are counted on
> the receiver's tunnel interface.
> 
> A static neighbor entry is configured on the sender because ARP
> replies from the receiver cannot traverse the unidirectional multicast
> tunnel back to the sender.
> 
> The early demux optimization (net.ipv4.ip_early_demux) is disabled on
> the receiver to force packets through __udp4_lib_mcast_deliver(),
> which is the code path being tested.
> 
> Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
> Assisted-by: Claude:claude-opus-4-6
> ---
>  tools/testing/selftests/net/Makefile          |   1 +
>  .../testing/selftests/net/fou_mcast_encap.sh  | 112 ++++++++++++++++++
>  2 files changed, 113 insertions(+)
>  create mode 100755 tools/testing/selftests/net/fou_mcast_encap.sh
> 
> diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
> index 708d960ae07d..7e9ae937cffa 100644
> --- a/tools/testing/selftests/net/Makefile
> +++ b/tools/testing/selftests/net/Makefile
> @@ -39,6 +39,7 @@ TEST_PROGS := \
>  	fib_rule_tests.sh \
>  	fib_tests.sh \
>  	fin_ack_lat.sh \
> +	fou_mcast_encap.sh \
>  	fq_band_pktlimit.sh \
>  	gre_gso.sh \
>  	gre_ipv6_lladdr.sh \
> diff --git a/tools/testing/selftests/net/fou_mcast_encap.sh b/tools/testing/selftests/net/fou_mcast_encap.sh
> new file mode 100755
> index 000000000000..8db9633f4c28
> --- /dev/null
> +++ b/tools/testing/selftests/net/fou_mcast_encap.sh
> @@ -0,0 +1,112 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Test that UDP encapsulation (FOU) correctly handles packet resubmit
> +# when packets are delivered via the multicast UDP delivery path.
> +#
> +# When a FOU-encapsulated packet arrives with a multicast destination IP,
> +# __udp4_lib_mcast_deliver() must resubmit it to the inner protocol
> +# handler (e.g., GRE) rather than consuming it. This test verifies that
> +# by creating a FOU/GRETAP tunnel with a multicast remote address and
> +# sending ping through it.
> +#
> +# The early demux optimization can mask this issue by routing packets via
> +# the unicast path (udp_unicast_rcv_skb), so we disable it to force
> +# packets through __udp4_lib_mcast_deliver().
> +
> +source lib.sh
> +
> +NSENDER=""
> +NRECV=""
> +
> +cleanup() {
> +	cleanup_all_ns
> +}
> +
> +trap cleanup EXIT
> +
> +setup() {
> +	setup_ns NSENDER NRECV
> +
> +	ip link add veth_s type veth peer name veth_r
> +	ip link set veth_s netns "$NSENDER"
> +	ip link set veth_r netns "$NRECV"

Sashiko points out that names in the root namespace may collide with
other devices. Unexpected here, but it's just as easy to immediately
assign the new veth nodes to the netns. See for instance sctp_vrf.sh.

> +
> +	ip -n "$NSENDER" addr add 10.0.0.1/24 dev veth_s

More importantly, have you also tested IPv6? Can you expand the
test with IPv6.

Again, sashiko points to an important issue: ip_protocol_deliver_rcu
and ip6_protocol_deliver_rcu are not equivalent. From a quick scan it
appears that the latter does not resubmit on negative return code.
