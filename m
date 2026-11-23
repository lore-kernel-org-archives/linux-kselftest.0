Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795431856;
	b=Z90mDWhjLeZ2IzobeXBpa1sgy1LCoevt/cGmnzsSwSw/OtAlJakRzTxzYZeTGwEs2A3e
	 bvV9Fubqpq723V5QJB70Iq0HhLJ9GZzrCzl2sdhiDXYwWdz1B7ErtUWcYhZQo1yq1vqdC
	 FlFeRs8CJMzNF0AzOexSNjvcdo/8wYYFtoWPLRmIoaNqqcSnmB2Fj9GpGKokehpxNjoUS
	 HdyUM4hNHn30v/oVw3PCwU7EDNnd0JwWFnXWw12yn6DLxTYNYQEqn5iuwWsfoTu7+FLd1
	 XBcLouWCQMsq2OZuMxFwf9YKuUEynaRrQBg8G54hUv8snMeQAkrHjctSgMsVs5+NczQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431856;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=VqdUJCGklE0Ceh8Fiho+/Y0/kCSZMYfaRRAoBrQNlHU=;
	b=NaadWij1WGpftGngvemWloQ+Bn6aOeKJE5fbvn1ELzIDf56SCJmUQuGrYLXim0C0bwjI
	 JM3rCY3p2buc7JbKoRKcPkP8Gxt1ckfAYSXVoF/dmztadzz6nlOGcUUIMeS4kLJzqiBKU
	 /1V3u3IQ1NJXXGKgK/cPcQEoCuowymLTMc1w+Zqab3xhXmrI21Pw8BTQ/3K8ZAYTp1T5J
	 v255Nzz88kSEgzuwuUUemw2G2hhCEl9kQke0kFMBNOc9V1DsaRZzGuAlm9fav5Ht2jRj/
	 6GzCQTckbf1bLUgBs4+wS8/EyIk7AQkv+m/+n5LS8Yyduejvk4cHyNhOkWsea6eLdhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="H/yXe80y";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0D2606A321;
	Mon, 23 Nov 2026 11:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H/yXe80y
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795431855;
	b=oVVON8aSO8MVcdGXjYG2Y+i37ziMtMrAMpFzM+iDo7SB9LhiwrHMCwohnUfnAG5Buv3B
	 Vu2mE0nHxN1CblK9hoecJF6SB8sMaoiqda6jeRULd6S0n9eNjkYYsHUPEnCdlABgg47Em
	 dZByY201x+F1z52y09GkP1vQTogm+ulmapxB4do/wP2xtA2LtFo9AhFneWn18pOQzetUL
	 xBNpnianbZtZ7KGoXXYsg7qFYOfMczxdBq9tyQOpaCRIomAEt5Hgovb+IrbYoJX79dgZ7
	 YUQ9cJnbOrpAvF05UKEoGSUycN28Hg+mBvhfRNfjYs8H4r6c4lWUrn4+mO10JrLCmWg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795431855;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=VqdUJCGklE0Ceh8Fiho+/Y0/kCSZMYfaRRAoBrQNlHU=;
	b=kc0BI8nanvrTrLKjq891Q6WuyBIi3Rxx3N40AXN/hX3GUXeu8GHrFuhOd6QGwdzFOb9o
	 jNAeaSNNsXsI7uW7J+ZD7oJxcccSobWu2ZoWwgD+JiXyBzZrbpJH0tu1qDgI4tLEhnaoe
	 MxvnvcgfLbqT1Jpx+Fmfb4bGBaRTg8PMTXBhwfz4GV79sOW6FBcpKkaT2Ef6rmgsX9uSY
	 doKO+oJtNspLzQzeqafFtdxvNJu4EUF3clK8QIqUjlj9eKY4SabxXLWyCHC+kr57aAa5r
	 wMyd5GEW8v2kVClmQIx6Fa5m5f/0qrFg6uHHMy4OPuaUbxGtT4HmrCZzcDy6+3WPrMA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 684371F000C0;
	Mon, 23 Nov 2026 11:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795431855;
	bh=VqdUJCGklE0Ceh8Fiho+/Y0/kCSZMYfaRRAoBrQNlHU=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=H/yXe80yPiQH7ZrEFmWW7BuNUwtvu7kPp9HjLEUk0stggeB22dA4FMKtWuty0NOt+
	 ppNAyaI5ae0Ts1LnNuK2eJorQSiJjfBoHB5Mldhagxf1bfLN0WUL8wxISqbOAqxiZ2
	 HQnbH4KlX70gzjFO9qW5gxt8J4UdqWeZdSaKAgIRa7JzYQgPX6pU1tkspF6EUVlujL
	 RBsbE/XBTN/R6Zq/9+/OXg1hFg7Gewkz3PmuaRXWDoEUWy+QLQRPXH5RRXN1oOFOHs
	 UgwtE0E8TUIvWPis1gsnyW9pOqjaySmmZWOi9yBwvD/V4l9OhzFTMXs1J7ieNIlx9x
	 aHOOdawOp9zVw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F1A584C42E;
	Mon, 23 Nov 2026 11:04:10 +0000 (UTC)
From: Yongjian Wang via B4 Relay <devnull+echoowall.gmail.com@kernel.org>
Subject: [PATCH net-next v3 0/2] tcp: document and test MTU probing black
 hole fallback
Date: Mon, 23 Nov 2026 19:04:08 +0800
Message-Id: <20261123-tcp-mtu-probing-doc-v1-v3-0-c288c2df9666@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKgdBGsC/4WOwQ6CMBBEf8X07BpaqKAn/8N4oGULNdKSthAM4
 d8t9cLFmMxlMjtvdiEenUZProeFOJy019ZEkx8PRHa1aRF0Ez1hGTtTSksIcoA+jDA4K7RpobE
 SJgo5p1KUvFB1KUgsDw6VnhP4TgwGMDgH8vgmfhRPlGHjbred9sG6d/phoqnxby6KAuesxqxos
 EB1a/tav07S9mlkYntM9RPDIAMsL1yxTFRS4R6zrusHp5POmx8BAAA=
X-Change-ID: 20261117-tcp-mtu-probing-doc-v1-351cb754fa7b
To: corbet@lwn.net, kuba@kernel.org, edumazet@kernel.org, pabeni@redhat.com, 
 davem@davemloft.net, shuah@kernel.org
Cc: Yongjian Wang <echoowall@gmail.com>, ncardwell@google.com, 
 kuniyu@google.com, rdunlap@infradead.org, linux-kselftest@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, skhan@linuxfoundation.org, horms@kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795431849; l=1794;
 i=echoowall@gmail.com; s=20261026; h=from:subject:message-id;
 bh=DDZPPWsZS/fmb7fjrYYLTLl3o/pBegVDzjkgGENcWdQ=;
 b=jsAhLZAF/QnepA5vxEKq3fK4Ci+wO675nO/KwYNKftvHF7zRcBr81kok7uBdxnJqwmUlMPjJQ
 t6elncp7COPC51o1fzrOL6gEwZBS8jK/YK0n0MdhGnfjsFp7PxCMyWN
X-Developer-Key: i=echoowall@gmail.com; a=ed25519;
 pk=9XP6JhqjjPsHCF6UZZZTeqTRnXIa4+ufggnxXtTJ+no=
X-Endpoint-Received: by B4 Relay for echoowall@gmail.com/20261026 with
 auth_id=1323
X-Original-From: Yongjian Wang <echoowall@gmail.com>
Reply-To: echoowall@gmail.com

ip-sysctl.rst does not say when TCP detects a black hole with
tcp_mtu_probing=1 or how the MSS drops afterwards. Patch 1 documents
both. Patch 2 adds a packetdrill test for the part that had no
coverage: each further retransmission timeout halves the MSS, down to
tcp_mtu_probe_floor.

On x86_64 KVM, the new test passed in IPv4, IPv6 and IPv4-mapped IPv6.
Variants expecting no floor or no halving failed in all three modes.

Changes in v3:
- Say that only timeouts at which a black hole is still detected lower
  search_low again, and that the floors take precedence over the
  tcp_base_mss cap (patch 1). Kept Eric's and Kuniyuki's tags since
  the change is limited to this sentence.
- Link to v2: https://lore.kernel.org/r/20261118-tcp-mtu-probing-doc-v1-v2-0-e795f20b8cfe@gmail.com

Changes in v2:
- Spell out the 200 ms RTO, say when the time starts and when it is
  checked, and give the resulting detection time (Eric, patch 1).
- Say that the MSS is only lowered, and that each further
  retransmission timeout lowers it again (Eric, patch 1).
- Add a test for tcp_mtu_probe_floor (patch 2).
- Link to v1: https://lore.kernel.org/r/20261117-tcp-mtu-probing-doc-v1-v1-1-552ae04de4ef@gmail.com

Signed-off-by: Yongjian Wang <echoowall@gmail.com>
---
Yongjian Wang (2):
      tcp: document black hole detection for tcp_mtu_probing
      selftests/net: packetdrill: test tcp_mtu_probe_floor

 Documentation/networking/ip-sysctl.rst             | 22 +++++++++++++
 .../tcp_mtu_probing_blackhole_floor.pkt            | 37 ++++++++++++++++++++++
 2 files changed, 59 insertions(+)
---
base-commit: 6ff4c5942a301675eb12e5b49d53a81e604624a1
change-id: 20261117-tcp-mtu-probing-doc-v1-351cb754fa7b

Best regards,
--  
Yongjian Wang <echoowall@gmail.com>


