Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8614A43FF;
	Mon, 12 Oct 2026 15:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819014; cv=none; b=fwfRiFm8xkqSI7Ebt+Tl8HYB2z+UaPFG7fngCtRMJj8Oe/uLC5PYhry/6HeNYE0NO6AFmXhG0t6Tb8qLRj4YYO90bOAtMQTqZzmaD4nkFkkZBxlrMZ+m9p9C8jiyUx+UvdQYUZZ2IYGDyz0qOl6Ta2sSeHRZIDHmq3ym0v6CkCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819014; c=relaxed/simple;
	bh=wqxT4pxVpI2WjHbBcnA9gBITBl3U0Fhzz/JQdT0Rqpg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KVf1vaKjzfRU3zAjGzGetOJYO3g1qD8LKARw1k1cK9ykP8KTOTtMrMyj+X6gv9sSHtiY2LXBOCiHr8uGY/w5Hn/t5qgQkJ62mIrAN2ixEgWOvzqRLjq2pKCre8jw0Y4PSuqj/49mu2CNLtDXB4Esj6qxKpAQs3L0gcUHbOvPGwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nalT/oE6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nalT/oE6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EA3F1F0089C;
	Mon, 12 Oct 2026 15:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791819013;
	bh=rFCMxCD79vEB4iyMWGtxNJDVMBMGuW8tGz3ncBlH5DE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=nalT/oE6RrI02ZV4QQraVHkegecBiI3FEB9BNWFDurE1X19IJbPk4rQoAicnI9Kg8
	 oZz7dZ6cWCXQ9VrxXDtNJ1wBnH9H+vczaMOSCMYSKuOkjKtromSPAvvfYOGXnUZoGt
	 D6rH0TiSzxErplyC6CigiCCAnzljngyTh9Q12rjVRbFH3cMza46JdDv03dnzc8tU/f
	 C1ph055qOg/NDmWdk9BNbOZDFue3MFjcvf6fgM+qzuZ1V1ejJs8GRotI3vw0naiqdJ
	 baEYEvi/RbTvSRhKl0FE4BP/uCA7VgM0uJ01yoFYKsh/KRT6lKEJMzQ1eaCylXyAnz
	 2d+peyaKV+iIA==
From: Chuck Lever <cel@kernel.org>
Date: Mon, 12 Oct 2026 11:29:55 -0400
Subject: [PATCH net-next v4 7/9] selftests: tls: Skip the zero_len tests
 when TLS is unavailable
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-tls-follow-on-v4-7-8cea429565da@kernel.org>
References: <20261012-tls-follow-on-v4-0-8cea429565da@kernel.org>
In-Reply-To: <20261012-tls-follow-on-v4-0-8cea429565da@kernel.org>
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Chuck Lever <cel@kernel.org>, 
 Dave Watson <davejwatson@fb.com>, Shuah Khan <shuah@kernel.org>, 
 Qingfang Deng <qingfang.deng@linux.dev>, Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.17-dev-9c833
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218; i=cel@kernel.org;
 h=from:subject:message-id; bh=wqxT4pxVpI2WjHbBcnA9gBITBl3U0Fhzz/JQdT0Rqpg=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqzPz6FTqJV23N1u2K0tqHd2433/FlXwcx6BB76
 UbFgVnxgDqJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCasz8+gAKCRAzarMzb2Z/
 l2q3D/9u3yfUTAV4pUdXF4Mx0mjyrZY4Dmb9Vl2q0JwYkIUhoVgzc2PLnAcUps2pV/ODfAq/KQx
 Dr08c3OBs3RQA5TI8yxF/x6qaQTOyq3iAobaKI7RBz5EndUORtkyIomXTGSixSSoHfUOBIDk6wO
 MeoPfSa1UF7gnx5qnaQHO1IUhxRIe7vMqdlkBGozbi5k5GsZMaMmpNHyPaLfqb/j+O+PXlXv2bG
 knd5rTSkHEAB4GJ654gNgD73K/+FUzhHWnAxDB96knMtICzIUNwlkX/KVsdrEdjNPTG42RxsQyX
 G6eyqeKnALm9IIYY7CnJVT4/AG/ZydmDFxuEkFfJ++EgQRq1T6UAwH/lpsmDZ5Lo552+dBqeZgG
 Uf1asqEapXZ+dyUIveg34+dVNE51ss2uHjZ/Hy0doapL1uPvtx+LNV37pVScseTXxLpr4xOAn2T
 VcQlcSvXxRRWKasH82vdU1Uyi8t+nwsbTQeSHAjMQtvP1nEEcqMu4kMNgoEHEZspkJhP9DMTac3
 wUf53d5CfCL4gmo4R459uLPK96Y6IZlLju/QiGcEEVVkg3baS0DVx8tkroaJ1IHP9a6yT8W/fT+
 lVQssjvIz5smjW1lFBMOy9158R/Ys38m3an2Mpm/FiLVSa+L2YICch3dDwJMgsITxa9qB8X+BpG
 FpxgnpdpccM3/KQ==
X-Developer-Key: i=cel@kernel.org; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97

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
---
 tools/testing/selftests/net/tls.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/net/tls.c b/tools/testing/selftests/net/tls.c
index 9d3cd4fff062..0bc43728262e 100644
--- a/tools/testing/selftests/net/tls.c
+++ b/tools/testing/selftests/net/tls.c
@@ -2639,6 +2639,9 @@ TEST_F(zero_len, test)
 	int rec_off;
 	int i;
 
+	if (self->notls)
+		SKIP(return, "no TLS support");
+
 	for (i = 0; i < 4 && variant->recs[i]; i++)
 		EXPECT_EQ(send(self->fd, variant->recs[i]->cipher_data,
 			       variant->recs[i]->cipher_len, 0),

-- 
2.55.0

