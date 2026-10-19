Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428941;
	b=i6/A/arrVEhe5/dY9AFRGfDGZlAN7QrpCcv10zZuFyCzOhGRMSOqhaaN5gAc34s9Qc6N
	 xC1dfuYwX0xy1UYgGJ2Pmtt+UYmwpMW9q/TMgC2/BhOdu2zZ6TfBhqDV3GYCOoXBO///v
	 gSLoetU8cn9/YdWZ1Mpy1QOeGIKymUfo2nEFB2UFzE1QbE2gxTag8JwY92YrohdWX7mAt
	 8rHdayM5S0DF2n4RDz/DsoKSMprBCwqdeHwAkI0uwSIuJEHB7MxWpyKp8wHUhc9Wr0Wa6
	 xMyESTUK3ZRzdzbed0CNsl6A1gRKeUCtDgaNs5kErIkYgw6csp4XIh2S0uJsFKyhFJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428941;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=rFCMxCD79vEB4iyMWGtxNJDVMBMGuW8tGz3ncBlH5DE=;
	b=5j/Ic77lpB07Taxh6y3CHWnCWt6tw/1O7+ftvc47namJtKHlEJuB4cEaPAEzv0sBR9bS
	 O+r+ByN0UMEmF4EvMuies9ecyKITWnuNOEX2e/Sx+0/c4UWfn9oG2BywmoPlfWF4NCF51
	 BLxD2i3UEAU4S6LMZtUCFG8uVfKlqZnFUkHNCW8AqYbBTT07bDLmucFcpqOccIpziHGOM
	 uTtomtPk2/+dmPobmyUDTaLkLX+MRTnZGkimFqyGMznwPhTSPutaTKS4AmZuRwa+mo7Uk
	 UzGtsNJyLRmKI9UMv5qghpRe+h0a9gs2ctw518xNYBOpz/EQjb9e2MvNKb+6y1yfZGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YYAWuP4R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0486960A2619;
	Mon, 19 Oct 2026 16:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YYAWuP4R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A24571F0157C;
	Mon, 19 Oct 2026 16:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792428940;
	bh=rFCMxCD79vEB4iyMWGtxNJDVMBMGuW8tGz3ncBlH5DE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=YYAWuP4RFH9egcbjrf7Ucl/hUbJ/I5rrdG/rdr9digYHMplte5Q7BulOM1qlGcvlf
	 7GTDjNcr8xVpA+k9SjWPgkpXk9XhE9xonxFGyx4D7UfLw6VA/rRlZhGfXZU8+sK5ic
	 9/rZOkY9z4tFkdj5n6qODpFGuXYl86118+YdyOctwyUpgd+9Kkvbe/z3PuBss5NWMR
	 TKJlU7DPWa03y1uYdLIGs5gM2pRKKmsX9DrTHTyDLUNZPYrBiv0jQnMf6N/1Z403tl
	 ru87YuLM2eD/bm1hefBiiAHeaV+HukxSECwuRySLKuFe3nQ1WEIaEaAosu7qdj2G72
	 VCSIKjPbKyOTg==
From: Chuck Lever <cel@kernel.org>
Date: Mon, 19 Oct 2026 12:55:23 -0400
Subject: [PATCH net-next v6 7/9] selftests: tls: Skip the zero_len tests
 when TLS is unavailable
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
Message-Id: <20261019-tls-follow-on-v6-7-ab01c4ecca0c@kernel.org>
References: <20261019-tls-follow-on-v6-0-ab01c4ecca0c@kernel.org>
In-Reply-To: <20261019-tls-follow-on-v6-0-ab01c4ecca0c@kernel.org>
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
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBq1kuB67eC1ndU1vPlx7ayaTw0p/sV7iIHo4AYC
 KGr7Bj4rUaJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCatZLgQAKCRAzarMzb2Z/
 l719D/9l8WJKjNUeg0XnULielJmAulTEB7/TADNU+oqJvBdm6JBcvS2ImcFJQk2yT/WdUcO8aNx
 iTlwx8zu1e1st+wNgNJc1WKoXqQ+7zAnIU+SZLzM1Xvirzzf1PHby7iLeGAbljzFzvhfU11dEmv
 pGvJowYIYeL7r9i+gZ4i4dXqU7BFLu9gLbPlxKM/WLKdMAyhme6XwNsDr6wDxty/yof7uTI2w/W
 rWoKJSBKkQf8fxGfy5Lc98jcXCn8I/ZsaB+saKHmncN0Up2qousEeAgsmCvBsshh3oqYCLYT3e1
 G0QdMmI8o9bRQTo2lriLpfdVwyBFPjhYuSgLbrxzAocvZr0w+ffqTBkcxN/sASMYbAXQGHlmPXK
 eTEIlF7oMrTUNNQsLG7LqWNK7uXiN4KhXle7kWXMhC+pBm4CCtAoAVPJpmdvs8eZIvr4SJdvImE
 xQK4uXNIPUKQ31aDGl9O6Kjhkb+nbX/+ZMmxZsJmmw7kZbJy+5si1Ne2STUvrhrlLDjITpu7JVU
 ihHe6HyzF3ycU8vPtx3+7FDjfBiXWWVrqpkN+RwojTVQTRJnheBrpKyxb6pOQzInBMzn86MBNFP
 mhnnQwIcVrxjpCaelwV/FpHtyxzjTyyv98NXlsyFkikE9hSjS9n0YXekpmZ+u1SPMI/wglRSeNS
 SDrclv0osGoUUgQ==
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

