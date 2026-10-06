Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B60381EBB
	for <linux-kselftest@vger.kernel.org>; Tue,  6 Oct 2026 05:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791263794; cv=none; b=WsjhkqNLodhp01qyhUZF4NeLvt9dIVk91ox8ApG4cE5M6VeGq8MBQAXJNdCSSLKueNwc2SdCZIDvcjKoR3mRVGKfa4V27ozyMSAcjfUUiAoTWiXg+/o1nYRoOI3QzkkICcSmnDUKwcsCCKy9SeJRo/C0SsefYajbhrSkS6XkkYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791263794; c=relaxed/simple;
	bh=ySsNflPIiVU4e/VJAHgT4i2UWfIvcR8w6R5BsUuP8Gs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FptfNsIklLYVr8N3p5ekTU/QGGpHYxVHuPGH1UlfsI937CyyAn+HiYnlsOJlRx3HqheFLCAe3ae3o1Kwi0X9+bUlH8bJi7eMg7SyYyuW8tH2VgHi1i8yQf/QzNvJvV0zOAU8JDjk5Vy2faqGP6OvI0jgnYXTaHoocW1cR56Hsxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=G/zP6Qsc; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="G/zP6Qsc"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-81ba09a5d23so2613426a34.3
        for <linux-kselftest@vger.kernel.org>; Mon, 05 Oct 2026 22:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791263791; x=1791868591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8aSQ/O3PgDhZ9woaoobq33A5AiSuAlUPvQPd+XWa5fU=;
        b=G/zP6QscprRwchv8Fm5FJu9YQeilgUg6NfiX3JQ9w1p5NdA1eo5dfEwLHKREqpWA0d
         KgpFrJokUaRD1WzwampmmDkB/rsKq6fVdx14LY2bSf1G+4usPp+Tf2jElDYkbOXdTD4X
         Ll6RMeXyMabb2+45+PxQzef68Md4cx9Jym2Oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791263791; x=1791868591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8aSQ/O3PgDhZ9woaoobq33A5AiSuAlUPvQPd+XWa5fU=;
        b=b0kYoBB0pOS+ghhcaNfTl5nkb1WRauBjn9wgk+VyTuLJeZaM8qIBGmSYZY8TY1OIeq
         Kb9bFidufS5V+PSDBPOJhL2zb9XiVeVRXjjJt01X20QVtLhitTRXuVi8vI1jdzdXfAH5
         wsjsuiCrXcmRFYFpoma3pOrUG9QO72tAGD3EdzBlgSjJ/7fnJDrvRX6ucA6lG9oqTKtT
         B8tPgWx5JAaUMu7g37sooTEysJ2i8crEGqnfEVzqdQZva7khYaT+rufVr2Dl8etm8lbi
         +AgezcWhpoWDVrOgOVmsueznC1tgSf+imgFo9Ehg6mx/Yebj5AcGuPwEJ+m/6yags131
         BTeA==
X-Forwarded-Encrypted: i=1; AKwUvBwcU4wu6edK+EYlJUWLR4aGk6/AOOIE6JyHpnEV5vIOJobxIrivAMOKAMMD47cd6k10Og/VuOMcLGlrL94rcew=@vger.kernel.org
X-Gm-Message-State: AFuF++kdfgn4/pxKSq/SajYcNJA+0A7c8OKPmO2zyRAVWWIHWJcg30dq
	9IuzO8Mh8JvMSyI3qucM9ZAHz7AS5KK+XQqvyDa7lJ8olENnHW91oyCI+g6hCGXxRLo=
X-Gm-Gg: AYBFou0kw1YYh2iO3sG6/Asj2r5w6mgYxlxFcHrit6PtP3P7jkheNjhpRmqBn+Rr0Jb
	BoVQ0Qs7Avbn38l93s5XR8OtktOeHaeWxbF7tNCs1Hf9/WAKhVPyL4SSRecvamctZW0xLcfgUfp
	cNnmku5Xig2onSuxmYjhh7ldfo4BzLjqwVv9y9vQ4Eik7C6ZL6bmUunZZA5mOVCPIsAi1kC4p5S
	djnmk5ECw/RnVy8PDwYazOceqFrJWjWTIVes0lDg/eNwoJV8zT1+7uOYuYWegz6I6Tx7OykhjTM
	fNDvRNFjejZNkAQKaI6IEpQZwkImwICz36NkmHfDwlvxH41pL5W0DB1r4ZJ9PGIN/ndjN4YrWqy
	3bl+qjZyS2p7HRxoeR5uTMMRI7oPMtJQgIkguAWD6H4BV55or73wAR6eUuNGxUWoz4LE0AG/TWO
	g282CKV6p5lfDOTSJQp2DLQeVhk8TT0oUHmF7+WfbJDsg3BoRNlN5KU3yaXqAiQHpqkI0Jn78JB
	uGpqTLoNiJImGtY6E2axYlLvuvxdBG9iyFj0eNw9eXb59UUhX6iWRNf54lw2Do/G9svv78ohYpJ
	mRA=
X-Received: by 2002:a05:6830:6d2d:b0:81f:22fd:6ed5 with SMTP id 46e09a7af769-828a264ee0fmr220570a34.21.1791263791527;
        Mon, 05 Oct 2026 22:16:31 -0700 (PDT)
Received: from com-68297.corp.openai.org ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8281fcce238sm1622898a34.6.2026.10.05.22.16.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 05 Oct 2026 22:16:31 -0700 (PDT)
From: nramaswamy@openai.com
To: netdev@vger.kernel.org
Cc: Neil Ramaswamy <nramaswamy@openai.com>,
	Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Yuchung Cheng <ycheng@google.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v2 2/2] selftests: net: packetdrill: test RACK after partial undo
Date: Mon,  5 Oct 2026 22:15:27 -0700
Message-ID: <79f83ccbd303db0a3d7c7afa5c94c7817549bd9c.1791248202.git.nramaswamy@openai.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791248202.git.nramaswamy@openai.com>
References: <cover.1791248202.git.nramaswamy@openai.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Neil Ramaswamy <nramaswamy@openai.com>

Reproduces a partial undo bug where a segment is unmarked as lost but is
never returned to RACK's timestamp sorted list, which makes it ineligible
for future fast retransmission.

Signed-off-by: Neil Ramaswamy <nramaswamy@openai.com>
Assisted-by: LLM sparse
---
 ...tcp_partial_undo-restores-to-rack-list.pkt | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_partial_undo-restores-to-rack-list.pkt

diff --git a/tools/testing/selftests/net/packetdrill/tcp_partial_undo-restores-to-rack-list.pkt b/tools/testing/selftests/net/packetdrill/tcp_partial_undo-restores-to-rack-list.pkt
new file mode 100644
index 000000000000..c07a2f8a5cbd
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_partial_undo-restores-to-rack-list.pkt
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Test that a segment unmarked as lost during partial undo is eligible
+// for future fast retransmission.
+
+`./defaults.sh`
+
+// Establish a connection with a 100 ms RTT and a 1000-byte payload MSS.
+// Linux subtracts the 12-byte timestamp options from the advertised MSS.
+    0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+   +0 bind(3, ..., ...) = 0
+   +0 listen(3, 1) = 0
+
+  +.1 < S 0:0(0) win 20000 <mss 1012,sackOK,TS val 1000 ecr 0>
+   +0 > S. 0:0(0) ack 1 <mss 1460,sackOK,TS val 100 ecr 1000>
+  +.1 < . 1:1(0) ack 1 win 20000 <nop,nop,TS val 1100 ecr 100>
+   +0 accept(3, ..., ...) = 4
+
+// Send A, B, C and D, then E 47 ms after D.
+ +.01 write(4, ..., 1000) = 1000
+   +0 > P. 1:1001(1000) ack 1 <nop,nop,TS val 210 ecr 1100>
++.001 write(4, ..., 1000) = 1000
+   +0 > P. 1001:2001(1000) ack 1 <...>
++.001 write(4, ..., 1000) = 1000
+   +0 > P. 2001:3001(1000) ack 1 <...>
++.001 write(4, ..., 1000) = 1000
+   +0 > P. 3001:4001(1000) ack 1 <...>
++.047 write(4, ..., 1000) = 1000
+   +0 > P. 4001:5001(1000) ack 1 <...>
+
+// SACK C and E together. RACK marks A, B and D lost. D is old enough
+// to be retransmitted, but this ACK reports only two newly delivered
+// segments, allowing A and B to be retransmitted while D waits.
+ +.12 < . 1:1(0) ack 1 win 20000 <TS val 1280 ecr 100,sack 4001:5001 2001:3001>
+   +0 > P. 1:1001(1000) ack 1 <...>
+   +0 > P. 1001:2001(1000) ack 1 <...>
+   +0 %{
+assert tcpi_ca_state == TCP_CA_Recovery, tcpi_ca_state
+assert tcpi_lost == 3, tcpi_lost
+assert tcpi_retrans == 2, tcpi_retrans
+}%
+
+// Deliver retransmitted B and then the original A. D stays missing,
+// and we ACK through C with A's original timestamp, which is before
+// retransmission started. This triggers partial undo, but D should
+// remain eligible for fast retransmission (critically, the timeout
+// retransmission counter should be 0).
+ +.07 < . 1:1(0) ack 3001 win 20000 <TS val 1350 ecr 210,sack 4001:5001>
+ +0~+.05 > P. 3001:4001(1000) ack 1 <nop,nop,TS val 450 ecr 1350>
+   +0 %{ assert tcpi_retransmits == 0, tcpi_retransmits }%
+
+// Acknowledge all five segments.
+ +.01 < . 1:1(0) ack 5001 win 20000 <nop,nop,TS val 1360 ecr 450>
-- 
2.55.0

