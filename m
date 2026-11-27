Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795818354;
	b=KAP5N2Cb68dR2ergbretCpRqy+ozzJRR/wNr1KkIFsTCenp7S0vm7DkIXR2VIJ6HSXjd
	 IU/k06zFe2pR44yqG4aZvr9vIOEPGSBqnOUQWMwEKwYtEhPIqP3m48rZaH3lp3GOn1BXr
	 Kx8ZbDe0QRx012Pr325UT2on2XiI3aqdeq6phYAphDc6cGYY0UAZiaQr6ORAAlMr4d6/3
	 rdxuY3QI+dMwcflNBt+lN6iyD86xDlZAdz/AiVAC0rLdWpwB8YMSnpLjshqIs2/FG2KzT
	 m+JyJBd56boFvkK4SZuip0jSRiNJHIrbXLy6JwSJCpBp8zhcBl7RhurSV6Zj5HkeVgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795818354;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=tPh1YE5zdqzDBoq23ydOXnyk0skwsBUIZkT0OnzQmAg=;
	b=UTsaSi8eGx/nwJsAW0HE5kCYr2GzkyOG2rty1HQlBbHV/SL7ciIKbPCir6yBWiWp5O+2
	 zh3GXVNBiDiohO/0CsXbLqrhc2Ifke9OlLIn640WUonEkUz8lY1qcR/R14En2acNebM3W
	 X8noHJzasQ+HFjJRCQW5LzR8+BX4FvRl+UftbTKOGiUVn4kp0tEBBjxURKODAQypommv/
	 r3oddbPxNzUQGaP/lRQcP324MlCijMKSu30H2Eh94rqUwsotkJHjx6xw3UWQj0cON8nLo
	 Cx5tTF1055g8y1uXqETvUvPYRWGCP+PT4exzugXyimekEG92b9QDtxTL5ucf1nyGrZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YTveu0PR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CC3606A31E;
	Fri, 27 Nov 2026 22:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YTveu0PR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 483091F00919;
	Fri, 27 Nov 2026 22:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795818354;
	bh=tPh1YE5zdqzDBoq23ydOXnyk0skwsBUIZkT0OnzQmAg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YTveu0PR97jt56tlHxKXpGMz2L58CqhTckl/RvJjoHehpGVifljK9662WPDE8utks
	 byVIZecjDAD34nl/G4gGNFgVbaqfyoEz3zUAromr38CG9DcADraqbRtMMSMxZoUHLi
	 rJST7ZGT2HQhUBj5rrq5kH5TPnphvsFPAqP6Ssxb1fLP0jLTK8ICAKCxwQvXG2wnMF
	 8YdZf/x6mf5eat6BWQdpP/Up0bxVx/ErHP+WIWsdtfwM94tzTAveULmVIypsZzdnSE
	 A+kq07HVoSbakq7JGjB+mAYwwQ4DqxoF3izbgFo8arfLt//jQVyokJPH7BLiF2a/TL
	 rN6tmU4S23ilg==
Subject:
 Re: [PATCH net-next 4/5] selftests: net: add a test of the LISP devices
From: netdev-bot+sashiko@kernel.org
To: vjardin@free.fr
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, donald.hunter@gmail.com,
 nicolas.dichtel@6wind.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, shuah@kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Fri, 27 Nov 2026 22:25:52 +0000
Message-ID: <179581835281.3135.9886057049539183734@kernel.org>
In-Reply-To: <20261126-for-upstream-lisp-v1-v1-4-7382a4bcfd9b@free.fr>
References: <20261126-for-upstream-lisp-v1-v1-4-7382a4bcfd9b@free.fr>
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

- [Low] The whole selftest needs an iproute2 that supports the new 'lisp'
  link type, and nothing in the series says so.
- [Low] In mtu_test() (tools/testing/selftests/net/lisp.sh:468-492), the
  `for family in 4 6` loop flushes h1's route caches only after both…

--

selftests: net: add a test of the LISP devices

This adds tools/testing/selftests/net/lisp.sh. In the test, two xTRs carry
the traffic of two hosts through a core router. x1 keeps its EIDs and its
RLOCs in separate VRFs, and x2 uses its main table. The net selftest
config, the Makefile and MAINTAINERS are updated to match.

> diff --git a/tools/testing/selftests/net/lisp.sh b/tools/testing/selftests/net/lisp.sh
> new file mode 100755
> index 0000000000000..780053db366bc
> --- /dev/null
> +++ b/tools/testing/selftests/net/lisp.sh
> @@ -0,0 +1,1120 @@

[ ... ]

> +mtu_test()
> +{
> +	local family
> +
> +	for family in 4 6; do
> +		RET=0
> +		use_rlocs "$family"
> +
> +		h1_ping -M do -s 1416 10.2.0.2
> +		check_err $? "an IPv4 packet of 1444 bytes is lost"
> +		h1_ping -M do -s 1417 10.2.0.2
> +		check_fail $? "an IPv4 packet of 1445 bytes goes through"
> +		h1_ping -s 1396 fd00:2::2
> +		check_err $? "an IPv6 packet of 1444 bytes is lost"
> +		h1_ping -s 1397 fd00:2::2
> +		check_fail $? "an IPv6 packet of 1445 bytes goes through"
> +		h1_ping -s 3000 10.2.0.2
> +		check_err $? "IPv4 fragments are lost"
> +
> +		log_test "Device MTU with IPv$family RLOCs"
> +	done
> +
> +	ip -n "$h1" route flush cache
> +	ip -n "$h1" -6 route flush cache

[Severity: Low]
Does the IPv6 RLOC pass of this loop still exercise x1's lisp101?

In the first pass, x1 refuses the 1445 byte pings because lisp101 has an
MTU of 1444, which lisp_setup() sets:

    dev->mtu = ETH_DATA_LEN - LISP_IPV6_HLEN;

h1 then caches a PMTU of 1444 for 10.2.0.2 and for fd00:2::2. Those caches
are flushed only after the loop ends. pmtu_family_test() and
frag_family_test() flush on every pass.

In the second pass:

- h1_ping -M do -s 1417 10.2.0.2 fails on h1 itself with EMSGSIZE and
  never reaches x1. The check_fail passes no matter what lisp101 does.

- h1_ping -s 1397 fd00:2::2 is fragmented on h1 to the cached 1444, so x1
  forwards it. The check_fail passes only because x2's lisp101 refuses the
  1445 byte reply from h2.

- h1_ping -s 3000 10.2.0.2 is fragmented on h1 to 1444 in both passes, so
  x1 never handles an oversized packet in this test.

Would flushing h1's caches at the end of each pass keep the second pass
meaningful?

[ ... ]

> +require_command jq
> +
> +if ! ip link help lisp 2>&1 | grep -q "^Usage: ... lisp"; then
> +	echo "SKIP: iproute2 does not know the lisp devices"
> +	exit "$ksft_skip"
> +fi

[Severity: Low]
This isn't a bug, but the whole test needs an iproute2 that supports the
lisp link type. That covers "type lisp id N local A local A6", "external",
"link-netns", and the info_data JSON keys id, local, local6 and external.

Neither the commit message nor Documentation/networking/lisp.rst mentions
this dependency or points to the iproute2 change. With a stock iproute2,
the test always stops here with SKIP.

Could the commit message say which iproute2 version or patch is needed?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126-for-upstream-lisp-v1-v1-0-7382a4bcfd9b%40free.fr
