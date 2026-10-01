Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963EC4C6EF2;
	Thu,  1 Oct 2026 22:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894512; cv=none; b=iyZ4SmZRYixf8OS4WuxLmMGCBKTFPQjOv3LpwN9eDrBMxItd++q39oxND4UxfbeUH2axGqvKqG7gwRVex7SVPb+zy3ZWSgm/rGb9dkJ+ypMYY+77aM9VgB7ryxBg1uenqs9+Xut7fgT6mbHZieybV6w5zdhO97vXpxHSOIVUQGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894512; c=relaxed/simple;
	bh=aXDPXG9xuJPGY/QdLYWxMjgrKmJ+a6PnDNHNnjMrgC8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IdofuERcbs/7qdd8vMXWmt0M+C9qHMfK91Y6rK8wuyBbYx8UA9nOztlEEZCoKr+tdAoFL2aYP7lei87XG+4PCA6tYTTRVyvEt7nUb8HL91wh3KemLU6AA0VNUe28mPufGJmtkJ2zKv0qc9kevibX0We+cduBdn7xn/1VzbJDqQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BcNjjrg3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BcNjjrg3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02D971F00893;
	Thu,  1 Oct 2026 22:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790894511;
	bh=VJnxDUvB4AKq8Ahl6pEu/EIDvr12vnuSPDSI5OmR374=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BcNjjrg3AwjbQwfSxR7lQG49OA0o9Z7UxoYvDt15y0Jtd3zRuN7y9sGKm9BvyIJUz
	 Rt4p+E3aKMT91onKmPm+Vyqk2i8uYkQGW8sFJHwDk8UFQgtoCAqMjhOMI1ktftlvm4
	 Qe7L05YkZB6f7ty4QRcV90gzFFvh+ML8FIgAZq+VLqKCIq2V4va2YKS2ts1bqpyH8F
	 DwGDiok6OAaakrQ122E6hyyqD5ftML1F54HUzfqa2fVhLyw0cay2/li3Ags6jJjWEX
	 R/DmE9tbyzrD/EKWdb9KI5KwCBvr46iOSf6pKwwtH9sN8Vh+E+EhPWwOHXhq3R5zxS
	 zShCGGrciZKfQ==
From: Chuck Lever <cel@kernel.org>
Date: Thu, 01 Oct 2026 18:41:39 -0400
Subject: [PATCH net-next v2 7/8] selftests: tls: skip the zero_len tests
 when TLS is unavailable
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-tls-follow-on-v2-7-2dd1947bb642@kernel.org>
References: <20261001-tls-follow-on-v2-0-2dd1947bb642@kernel.org>
In-Reply-To: <20261001-tls-follow-on-v2-0-2dd1947bb642@kernel.org>
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Chuck Lever <cel@kernel.org>, 
 Dave Watson <davejwatson@fb.com>, Shuah Khan <shuah@kernel.org>, 
 Qingfang Deng <qingfang.deng@linux.dev>, Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.16-dev-da966
X-Developer-Signature: v=1; a=openpgp-sha256; l=1162; i=cel@kernel.org;
 h=from:subject:message-id; bh=aXDPXG9xuJPGY/QdLYWxMjgrKmJ+a6PnDNHNnjMrgC8=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqvuGqde1rUdYBI1X4nHxa5aJ2KivTcqHbA1a78
 xT8LKYeuj+JAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCar7hqgAKCRAzarMzb2Z/
 lz/0D/493m2GkqAmldXTYw5zsqSpHpuWcqkC04VVEQYrPzw7wlhejts/uBBFkFFeebUkkwe0V/O
 JP0+2F3ZRTahMASc0NVyn47Qo6kPmWgZAnTttT1Fi62LKgo/MdoMhPb8rB7r6tOzlR1vmscWdjk
 19mZ6rPAUwciQoVIc/okiz/KvXGUf37J9/u8goE1pw+IsbaBd60ZXzpsyDla2tVZ4MPP4CYuUSW
 gUGcclpB8f4kG6C0Ttyv7XruKV83B4z4Jr6trOLAxSA+X0M1vtdqhGyP2rot2R9oNzZnpsbi6RL
 zsLWwgHUdUOrLFdO+/oWNODnC/SA9UIW94EQ7KlsEvYiNLCScnCHijz9cCpNLcv/tUml0oOfyEj
 IOqmtUEEmmYU/Ism3yMbf6PHOH+e41pqZluBM4iiqwO5yxG3nB7OkFpfWjd/Ng8umKjN8s95CVS
 FHB2GM4WqlBIVk7xj3YnsRHPtu8SZlJxKqVjtfOlnl4Z8+6eCvbJD5CNiRASkVVaxlqhPyGb8RL
 sOrzTI5umuyT0mJgiQ0xx2gSiNw94PFIapd5gTJhcCTwaYfxvs8U7q2e68/y3aifV/Q2jDK9YGx
 4cLDl4y78FqVMwAyvCW21hdi3i1tMEnUPFyMM9ZQlmb1nAhTeoeV93eJRiVTglv96YV8XcCu6MV
 FaXavI3+cq8j3mg==
X-Developer-Key: i=cel@kernel.org; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97

FIXTURE_SETUP(zero_len) returns early when ulp_sock_pair() reports
that the TCP_ULP setsockopt failed, so on a kernel built without
CONFIG_TLS the TLS_RX setsockopt never runs. TEST_F(zero_len, test)
then sends its raw records over a plain TCP socket, which returns
the ciphertext verbatim. All eight variants FAIL on a machine that
merely lacks TLS, and those failures mask any real regression in
the same run.

Skip the test when the fixture recorded notls, as the other
fixtures in this file do.

Fixes: a61a3e961baf ("selftests: tls: add tests for zero-length records")
Signed-off-by: Chuck Lever <cel@kernel.org>
---
 tools/testing/selftests/net/tls.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/net/tls.c b/tools/testing/selftests/net/tls.c
index 419c6cc0cc5e..e6876b8caac8 100644
--- a/tools/testing/selftests/net/tls.c
+++ b/tools/testing/selftests/net/tls.c
@@ -2663,6 +2663,9 @@ TEST_F(zero_len, test)
 	int rec_off;
 	int i;
 
+	if (self->notls)
+		SKIP(return, "no TLS support");
+
 	zero_len_send_recs(_metadata, self->fd, variant->recs);
 
 	rec = &variant->recs[0];

-- 
2.55.0

