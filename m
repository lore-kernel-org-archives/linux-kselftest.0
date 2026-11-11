Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423329;
	b=Hd1eP5vDKT83m3FYd1wZcSas0RNh6KCnRLa+IqShAyO5mf4xISnvbN4UCLvDcsJsZK2j
	 ipICl+0tXY2S9SVWXzraPo5oS6kIs32fWbVkxIwB6V/p1USpNRTYzYQjIidgdHyWhi9Ay
	 7h5LNaWSpsx7GTMX45lOt2KY1zY96zBN9GmHw2WdUso8LEvRIZvhcAdz83Qc70PeQmEns
	 iQL8zFCJhMdN6kb2ffxWUnaMtxb47EyQ0X3MKk4MtY1XvCPre2yNdrcLRP8aS1Bfqc+14
	 VFqEatLjXSPKGuKresSXxEF6MGJmk/etxRp0HpGGNtFMJK9kpbNdN2dlRR3VyGyUuZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423329;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=sWZ5hPvA7c1kpgPO46ixg6f5HH9ySl/UAtR3JYXd3sU=;
	b=JkPanOmvVTo9aJA5cEeINgLZxYf1MHMcxAMy1x5ffQQD6+BZcTxjgMc7Gs8v3+GxOfBJ
	 ZMwXvglWBfsm4LXIO2JHJHEXpZiZrYnmj4bIbhTYPRAhLFhaVtCoXkq6dsgDEZJK70e9x
	 +J32RtaCAAPl0T5v1BkzFKKzDjXqvS6LaO1H8j5soi+S5YrAnldpHlkT9OLYMsPe+U8UN
	 fs5FhM9TnphbjlXWHAyYfcjKv4swIBvBlY64o+aNK3BuIcsm8YaNmk6oen1HpIx1EMuEp
	 j+cmidYechE4rOpnnUhE1IAagPhDvxmJAxxdZ+d5MkQli9jaE8+Btbj5tsIQnzlDjNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y3952ctd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36775606A33E;
	Wed, 11 Nov 2026 18:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y3952ctd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF7E71F00A08;
	Wed, 11 Nov 2026 18:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794423329;
	bh=sWZ5hPvA7c1kpgPO46ixg6f5HH9ySl/UAtR3JYXd3sU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Y3952ctd+u0npVyqnP6pjC5oTywwK15FY5idh3YUHANJ133ZliYcMgDgiuxx6txnw
	 BkZSGDSgj1Ppm27fb5DH+baxkuyAGLUM22f82VhDj7q7vB2iNXh7jeapDd7wB7uf8O
	 +VTl5D7EHMtcfecdblHR979Y1SAUT+Zx/fb1/79Fju5YAt4TxWSSjm018pNEFXQx5g
	 pybhSJPLc9jW/fQKrWpfvfAtf/jzRHofhyg3WuwqswbHotAzGsZu0w/G/4FyQo0C4P
	 wrUZekA06xDen8+1faFFnLknutIdwXTZB6KO+QYjJ7qNAQ03b1ThpZfNZArvfcqY6R
	 V0bxHVWUxE8yg==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	sd@queasysnail.net,
	john.fastabend@gmail.com,
	shuah@kernel.org,
	cel@kernel.org,
	linux-kselftest@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net v2 3/5] selftests: tls: Skip the zero_len tests when TLS is unavailable
Date: Wed, 11 Nov 2026 10:55:20 -0800
Message-ID: <20261111185522.2859004-4-kuba@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111185522.2859004-1-kuba@kernel.org>
References: <20261111185522.2859004-1-kuba@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chuck Lever <cel@kernel.org>

FIXTURE_SETUP(zero_len) returns early when ulp_sock_pair() reports
that the TCP_ULP setsockopt failed, so on a kernel built without
CONFIG_TLS the TLS_RX setsockopt never runs. TEST_F(zero_len, test)
then sends its raw records over a plain TCP socket, which returns
the ciphertext verbatim. All eight variants FAIL on a machine that
lacks TLS, and those failures mask any real regression in the same
run.

Skip the test when the fixture recorded notls, as the other
fixtures in this file do.

Fixes: a61a3e961baf ("selftests: tls: add tests for zero-length records")
Signed-off-by: Chuck Lever <cel@kernel.org>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
v2: no change
v1: https://lore.kernel.org/20261109175836.1246840-4-kuba@kernel.org
---
 tools/testing/selftests/net/tls.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/net/tls.c b/tools/testing/selftests/net/tls.c
index c4203401c4bf..ca47576220d3 100644
--- a/tools/testing/selftests/net/tls.c
+++ b/tools/testing/selftests/net/tls.c
@@ -2670,6 +2670,9 @@ TEST_F(zero_len, test)
 	int rec_off;
 	int i;
 
+	if (self->notls)
+		SKIP(return, "no TLS support");
+
 	for (i = 0; i < 4 && variant->recs[i]; i++)
 		EXPECT_EQ(send(self->fd, variant->recs[i]->cipher_data,
 			       variant->recs[i]->cipher_len, 0),
-- 
2.56.0

