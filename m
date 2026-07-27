Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A107221540;
	Mon, 27 Jul 2026 00:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785112436; cv=none; b=C4c6pzNQpw0KWh8PcrZEIUhhYbSNadSOuCqXbNgRH+DKd6Yp9H0UYwLAz9EkT3P0yuSSSNpDyxonmdfKZgwqMREa0xsMxDDUZhkqveUKga7/aZxNWEOik1HoQ5t6n6JJaqCo8KAJcJBCEASm3pbCSDRCTDxUWR4UzUEs77Perxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785112436; c=relaxed/simple;
	bh=q0AUwHrP0r/gpjBtVVHEAb7QjmwZrTH2YYuw3yDF14E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ayfpdk5e1gdDIs+qasFByIoOrBH1mq6ve+JwhmzW/BDReXikNdGxoURUFgdk4JrePd6GVyAfdequdJ4WeMMalsu1TUGlO5z8TjPIpZ0U0910krC51m5YtAKpxypskVDLDW9RQE+HCKbAC/Le7st7oQJ3R6yUdWUfujqxcUyCCHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iZFNyehZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iZFNyehZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EF081F000E9;
	Mon, 27 Jul 2026 00:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785112435;
	bh=tbRuMNzZ4Zf9NKhYObxS/hIPEw84Z5wqbhxX4GZwkxA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=iZFNyehZ7nkGMgRLa6hXD9Qi/W0Phy0BqqKkeBXqvU1hfcdNjrsroEJQfDnbacGeK
	 +4LOEyv8Cvhq9XHZ+zW+PGhcJ2DJvnNe0shsbhSjFQ22YYV+iQytsyPhYjE0J1BqQi
	 EugTO2VT2+X9S/NTx+jjOcsrN4ny8sZYERyJ0N20/WRw1QWekKW2BUwnNsvtYmZbub
	 DyzusbM66vFS7f4G0hBeIaMkPrs4ZEjDj1gUdl+4Tz4ZhUqFewejHoZrgchUgfU8jC
	 pyKPnZ8cGaGPg3shG8y6CyRoxWuoIwWowTGJ2RbXhDhskkZMvJimwOnAbVOSPzMfgK
	 2JDa1uk8QtwTg==
From: Chuck Lever <cel@kernel.org>
Date: Sun, 26 Jul 2026 20:33:35 -0400
Subject: [PATCH net 7/9] selftests: tls: skip the zero_len tests when TLS
 is unavailable
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-tls-follow-on-v1-7-99bf4cc1c729@kernel.org>
References: <20260726-tls-follow-on-v1-0-99bf4cc1c729@kernel.org>
In-Reply-To: <20260726-tls-follow-on-v1-0-99bf4cc1c729@kernel.org>
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Chuck Lever <cel@kernel.org>, Dave Watson <davejwatson@fb.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.16-dev-da966
X-Developer-Signature: v=1; a=openpgp-sha256; l=1273; i=cel@kernel.org;
 h=from:subject:message-id; bh=q0AUwHrP0r/gpjBtVVHEAb7QjmwZrTH2YYuw3yDF14E=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqZqdpxJMHpKVncrdtqQtpEc0l9mOsrzXTTtQWU
 owiGc9pNTuJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCamanaQAKCRAzarMzb2Z/
 l2otEACWJbxmRrhMmQ2Kpqtq1bCtNTxFiTWNU1K13kM4nWaANMI0zZNLMjJ6zm1IXLqBvfstLiz
 kTvsgtPEY1Zl2RjNHdB6QsDo3YbYwfT3q897ne/EmFN8YKJGji2VquXHNs5Ca/phILF7lMjRjRu
 M8lfMgr41rKw8/B/hn7aNiX7ixhC4TXeSwemKw5ukFNgAFp6H5+E7BGmMxh6sOb8UrwLTFkhfe+
 GLpcAI+D2GGAE6TOlczCes3rEVPhxoFLBIptiHyo7ZZne78UWlt3M0Z5cH4tkd4LEMjQCaUElxU
 Tmv8KBXe/MLZCmo4yXGPZvbc2a988NwsIbAJo2IzQlPVr9ERLVoO3UQqPH/Us+/G+MquMuoUOK5
 KYYsNiRUnSGY2eMLeCoZ/83jzmk+vtpD7imyip42ycwpMg/HSFDdpyQkmFRI6hlWRfdF7xYB9hg
 +g2c3yfoZ/n6T3VztR/sOv5dnX+8JZH7dLqNtxGnHLKY94z7wAd6YftZ3v7+I4wpUpzkhX0QxOe
 zz9zeIincVcqPslztD96KrEniRVHDKsict469NanplE7mXg+eTf9Rh0XDBplg3Zb4kZMzJE9A/L
 Q9RwyuiLQzIU+DQyDqwSP2npjL+gl+/t3Rrm8wknTOXmTv5jR45ZKIR4QiEVLu9NCHjHxAMxxuc
 h7P5nxIApTHpD1Q==
X-Developer-Key: i=cel@kernel.org; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97

FIXTURE_SETUP(zero_len) returns early when ulp_sock_pair() reports
that the TCP_ULP setsockopt failed, so on a kernel built without
CONFIG_TLS the TLS_RX setsockopt never runs. TEST_F(zero_len, test)
then sends its raw records over a plain TCP socket, which hands the
ciphertext back verbatim: every one of the eight variants reports
FAIL on a machine that merely lacks TLS, and those failures mask any
real regression in the same run.

Skip the test when the fixture recorded notls, the convention the
other fixtures in this file already follow.

Fixes: a61a3e961baf ("selftests: tls: add tests for zero-length records")
Signed-off-by: Chuck Lever <cel@kernel.org>
---
 tools/testing/selftests/net/tls.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/net/tls.c b/tools/testing/selftests/net/tls.c
index 089e940ac43d..af47d9a6098c 100644
--- a/tools/testing/selftests/net/tls.c
+++ b/tools/testing/selftests/net/tls.c
@@ -2544,6 +2544,9 @@ TEST_F(zero_len, test)
 	int rec_off;
 	int i;
 
+	if (self->notls)
+		SKIP(return, "no TLS support");
+
 	for (i = 0; i < 4 && variant->recs[i]; i++)
 		EXPECT_EQ(send(self->fd, variant->recs[i]->cipher_data,
 			       variant->recs[i]->cipher_len, 0),

-- 
2.54.0

