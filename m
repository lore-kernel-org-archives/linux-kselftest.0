Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FF550EBF7;
	Wed, 14 Oct 2026 18:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792002539; cv=none; b=hDaEhtK7F+QCdVNYJcKKnMwaGJx6RDxcFKxUAWr4NyM5acBWwP9QSPsgB8uKvP2wm0iBtIOZSObXf0u+/LDTlhF0LpiI0Jx53UORTKDeywWLE7Yjf7OMa/lTQ1BV3F7K9dcCFdaRChqk01cFcrEofN3XtrjP0tuR2JSdUUKEiGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792002539; c=relaxed/simple;
	bh=wqxT4pxVpI2WjHbBcnA9gBITBl3U0Fhzz/JQdT0Rqpg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BxCa4Gje3DyyupKGuevqqBSg//ndPSw6wOqh1kTXr4ZUR68xXxv4HIMHYebmXiQ3mO/Ef0OOB49h70DBuyTznSvwa4gr4gcTM+awdwEIwRT3jnMhtk8rhz2UhQhQOiKaK3y8ATh5lWf3rMNQxni6VWzKNHX1AW4+vCK5lMogAF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UvVMbTXf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UvVMbTXf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5F181F000C9;
	Wed, 14 Oct 2026 18:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792002536;
	bh=rFCMxCD79vEB4iyMWGtxNJDVMBMGuW8tGz3ncBlH5DE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UvVMbTXfyUkRMRQYdb/0vL7+JARslCgcOkzwsUTDtZVf45qxR+fEcLmVfn42rVNuc
	 7WsIqo6nBXuFW7Z7MdKA5fmBCsIFB/rMJy3EpX47mwWy7NsMsBY+gzdFWDgWhDU0qZ
	 8QJZU1wnG05lha/9jL9Pl01Tc0e1Ik5c7OkG+e2oXezI93RpnUeadTrAePuZiGpPdY
	 Qzi2o6gMRqCcq/6WvHTjY52uAeEaRLXsGUyHo4PfKRPGdxKLR4TZ9iSeeww9ppRY7D
	 UJKelp8ik7rXlOscGjSdBw/gjXrNA7We03fAYtd1JTx2eY6a/9iLkHSKD3F8ktZwIV
	 Gn72sHZyo1YDg==
From: Chuck Lever <cel@kernel.org>
Date: Wed, 14 Oct 2026 14:28:37 -0400
Subject: [PATCH net-next v5 07/10] selftests: tls: Skip the zero_len tests
 when TLS is unavailable
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-tls-follow-on-v5-7-e76c301d4f05@kernel.org>
References: <20261014-tls-follow-on-v5-0-e76c301d4f05@kernel.org>
In-Reply-To: <20261014-tls-follow-on-v5-0-e76c301d4f05@kernel.org>
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
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqz8ndkGHP4pFP517rtjuj6Hc6TaZndU9z8bBOz
 oAUwi/8mWuJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCas/J3QAKCRAzarMzb2Z/
 l9fwEACYDurtPXijZy00byNnC+rHw5+Ai3nt0orb/HAy6Z3G4bfS6S4Twpi1sWH0QnTTk5pbeDZ
 F3VsWi41oTOyQ6a8oN/6rPx4JDDzO6Oi+w18ZlmSbVe1VnPTlOtK2WMIbBUJq5/Om59u2HDa3dJ
 E26K5j6isnlke4pVKObiJ6PCKVGS+Wpo61Qc9jIOfBH+4cOdyNxFheVqACGpw1V78hLgJtO1IV0
 YK/tQXTFAkDu+gWSIQ4xJxr6sO1ep0qAmZmibnWKTu3ZpZkE+UXmRYW2xto7xdPt0uom/FYDJ/z
 0Opmf49YlHi9C1bk/TOcoUjnJqMuzQBTWkD72PTaqalGUFPse1e635XglFgrJoUmx0imjAS6j57
 x5XUvAgEuIih27Ck1D787W0PiGMuyNU3glkDRYfm+DYSJRGa0QzdCRm8NCo5zA+sJ0ZRy6fwtGq
 68fpuctf4rka4XznWOmJHyCXsxOVEv2oQlxvr45WZ8fetJtKw+1lHNuwZlQljFiSe5Yhcyf37ME
 wHBSgZKh3b1Xq460PP6d9DxFZpSLpovmwn/5LEqSzQsL+3+wtFdEXxmYdqZnJLNkgtNPq3ITnAV
 oU7NUwtbJocEePxtMEd61evQybSd5mN4cRObkqWslYpyBTV+rf8uw4sICsz/OBLjln/pM7ocdB4
 /jGnusynbejxkoA==
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

