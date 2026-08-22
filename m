Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BA13BBFA9;
	Sat, 22 Aug 2026 12:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787400214; cv=none; b=PGbcUvsAanGVtZmN8xp2zASXDZPfkhHjBSK6+nXWy+5YW27w1x/xn63DIdqKclLLiASvAX3YEPSx2egrgwSkfaryJpftIC+7e5xfJ8TpZr7StLTBoZSj83lR5gF6BPVOmqh5KIFsZfUbV4v7BoDx8docGPLqeQ70ey4lorbbs7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787400214; c=relaxed/simple;
	bh=oTr1zlHoxUQXXi4GXpBtWLtPwmufwOn2V7G3nCN6eUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oBtE9x/S+3hhldm0FO0g3zTIxZiZ0l1lCU4zHO3lsF9z7OK0U1ECnpxwF96IGDZ7NBdZyR32EucN5od28Tn66QnU1ye+BThPYZwRtJcxN+zyluEaZpVkHx6J48Rj/J2tulGb5Lo7F8VioDUw8QDGNY6+n6pN5FmyKGlcAS+cEpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im; spf=pass smtp.mailfrom=fastmail.im; dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b=BLQCL9kX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=W6c209sa; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.im
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b="BLQCL9kX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="W6c209sa"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 40D1D7A00B4;
	Sat, 22 Aug 2026 08:03:32 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sat, 22 Aug 2026 08:03:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.im; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1787400212; x=
	1787486612; bh=Hn0WydcGmA3b2mZC2+LRDL96s6FfT+VIfmk4r/xLkfw=; b=B
	LQCL9kXl00p7X1LwLdRX9qO0SsckYOv+HljJGXoEGYHWPEakZ+SbxHR1UW/KIS//
	lW4Zwvm4BggefFPR2zIsBt/MoTMC6xjV1nfoK/LAaGPzwYvsFFPFvM8Nu64bWdhV
	Qjyn8n1o4qh7vbK96d74iLzJ0SgCwcz0OWCtzgkKsI1LonPq6s6FyQa9I7nq0vgm
	jpPhmnBRa9Op8B13MQ8IAkDhuIs2jG71CoQTiCvqJvGQdHxctyZGHmOtcsGrBZu+
	85skidQgApiZxQsPhIGb27b+mec6EL1WSWZBk2/eQrLgk77czGgu0tles7NqvNEe
	CMj7J8bjv2uGjERk5tJpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1787400212; x=1787486612; bh=H
	n0WydcGmA3b2mZC2+LRDL96s6FfT+VIfmk4r/xLkfw=; b=W6c209sacT39Eu7We
	pYTyS5+id5elR8eTk4BW9qqftIT+0b9zQllRMhQYFnoz0B0sq0HVQoJWAJqkVdsx
	m7S5XSV+jLHwyy/MYF1439nMJ3wDhcwO8UHwMaCkuMsjcdI00cvfuMU7886susCY
	Rrroa4MlPdqdOwVSnMOFAoV3YS07cnHuI9884JpQm9cHxYiQRkJEdSpWDDdyBexb
	uNawLWaDSBE450jrQnuVJydPNL2KxkFcL1FvuWO2EwTDNAdhkTp0Wxkwt6Z9BwqU
	x0W0omez4926TKZl5IGqghVa7TmAGdb29Sj86pNAlvGqw8CYe72Akeymchn9yoKS
	EV0ag==
X-ME-Sender: <xms:E5CJatU55m7mPvSfWalzyTzFyQqL9p_5cH3AFWrZlITR7ann6WTQPQ>
    <xme:E5CJar2D0HjIKw_mTUyPlJDNm3hHv36oBM9m7e3v7v6bjcG_92Wv8exkJHKURPaD4
    Rk-qkEOU1KezCVeEGSoP7GWP4piwq7KXOCzs09cVMV8iGPps2JjsBpV>
X-ME-Received: <xmr:E5CJaisprhbXEXPLNkVzi-9acSAUVP3FWxr62R6lmwSwV7_7Tlw3v50FL7zHmg>
X-ME-Proxy-Cause: dmFkZTGg+gnfyiS/t0GzAo9yUBBjMZ35coAZHemgLRoQ6FsfA0/o2Ma0c4XLrDNGgpGHJu
    R9QOgavv5gnUAaq5PlAGR/Q1wvvqEnwtGdoO/if4P2aqgkbEdxx4escrJkOUa7yE5QoLR9
    jlXbj/SlikNDiMSWFuPvh37QmJEAWZ8u1GsiBYdalb3xw+iu0VcTG2NCg7htlbr41FadCY
    jVigAM/4qybxO0KDNZOg20UyC8h8jEYL23bpDcC2y6GrK+XSJ/O+NP4xuzYsYJ4f/VIgtN
    dRqvAzjihBES2wKytVKbYrJO6cwXdEf6UlOFKNlHsS5Fsla1B7hshGIL5eXy6pcRianiJw
    Mz6mrBdY2ovM1rRZACfqsF5B7VivVZt+E1aqVGPomWgO6xgZnu7rgr2RdUIpu0RX9QMnRK
    cLC8Ohbukh9Bd/tiuD2EdMy0x14ZoFXqXbrLeJfOYyW+1tyHXiteyrHFiVDAQju5SNvSzI
    xtZFcY06luP5jlsSPJ8SArwDoBGLwziKG8xeUFI0jtDticXluncH2RP03lq6vJ2a+opjpm
    R/NJP/tN72fxEARF3aklRQwhpAVn1RsM0KUHomFtV3XvfpWwxusL7BbwrJ/IWIiygpfrkw
    gflQvdIxtU5SutHyNl5a+Lqgki9zUUzxy6qGz7uEfh4Br1atqCt66F2Y4Zag
X-ME-Proxy: <xmx:E5CJajX8rFXUWJH2klADbB1HjT285vvyDnAn23bipuL2HwOhR6tM8Q>
    <xmx:E5CJaqwb5isgfdcnztiuRdjji09JGMAl5YUyjUfVFtMFHOkw8LGOSw>
    <xmx:E5CJaiG7l9U4XiBmyelwC5FWzmAV1NclyFDi_jzbb3h0vDDdd7YiSA>
    <xmx:E5CJanuMdywU0qzn1Z3Nu1NLaVUyTlWP4fGfQGQAVuaJEceG4Dz_Lg>
    <xmx:FJCJapwl0fqC2Z_cboMdHWDh_RkO5WI8U_10PGD32VZtQlAZvfKkGguI>
Feedback-ID: i559e4809:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 22 Aug 2026 08:03:31 -0400 (EDT)
From: Alice Mikityanska <alice.kernel@fastmail.im>
To: Matthieu Baerts <matttbe@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Alice Mikityanska <alice@isovalent.com>
Subject: [PATCH net v2 2/4] selftests: net: Lower threshold on debug kernels for big_tcp_tunnels.sh
Date: Sat, 22 Aug 2026 15:03:06 +0300
Message-ID: <20260822120308.1165200-3-alice.kernel@fastmail.im>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822120308.1165200-1-alice.kernel@fastmail.im>
References: <20260822120308.1165200-1-alice.kernel@fastmail.im>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alice Mikityanska <alice@isovalent.com>

Debug kernels on upstream CI runners run slower and generate fewer BIG
TCP packets, making the test flaky on upstream CI runners. Lower the
default threshold for those kernels.

Fixes: 5cb53743e1ff ("selftests: net: Add a test for BIG TCP in UDP tunnels")
Signed-off-by: Alice Mikityanska <alice@isovalent.com>
---
 tools/testing/selftests/net/big_tcp_tunnels.sh | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/big_tcp_tunnels.sh b/tools/testing/selftests/net/big_tcp_tunnels.sh
index 9b7d0456bcc1..e0b41f394ebb 100755
--- a/tools/testing/selftests/net/big_tcp_tunnels.sh
+++ b/tools/testing/selftests/net/big_tcp_tunnels.sh
@@ -17,11 +17,18 @@ CLIENT_IP6="2001:db8::1:2"
 CLIENT_IP4_TUN="192.168.2.2"
 CLIENT_IP6_TUN="2001:db8::2:2"
 
-: "${PACKETS_THRESHOLD:=1000}"
-
 # Kselftest framework requirement - SKIP code is 4.
 ksft_skip=4
 
+if [ -z "$PACKETS_THRESHOLD" ]; then
+	if [ "$KSFT_MACHINE_SLOW" = yes ]; then
+		echo 'Debug kernel detected, lowering the default threshold'
+		PACKETS_THRESHOLD=100
+	else
+		PACKETS_THRESHOLD=1000
+	fi
+fi
+
 setup() {
 	ip netns add "$SERVER_NS"
 	ip netns add "$CLIENT_NS"
-- 
2.55.0

