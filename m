Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883425;
	b=u2cBJrXVocskjd/z8AoBfwMGecwtwlba5FxR1nholoLgD+gsXb1jsc0DtNj+x1vE3QkX
	 v4GF6x0DoolA85Z/CfJiiMmFR/BX7Wxbo6UJnvSyyUL8h9e7YQdQFQO33+GvM/qOxeRtu
	 WNhZu7nbns/vEIvcnOemPVLb+BY8vkeWS5Z6/SuStHtNvmM1ZQAisX1xW3VY3UrUKdkGM
	 x5Y140+YmNQ1iyQpmo73bxK1Tu4+NWAX8gzDiW++IJ+Z+GDgqmufHX9FgN/w0ektAIJ4W
	 1TdSWmK1gLsBKV3o4JUf6479LBvEYVgntBhOz40aSY3w17SBEesAOCVcwuyB+eTQOeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883425;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=RpCyM3yYQCSRwMwZTxO0x/ozF1soHumH44biXgdIoZ0=;
	b=Q+ucu+bSenuRtYHjEjSI3y5li+8zquMvgppS06mrp43zVj/bNzzbOTq7Nru8Yp3V3ZmZ
	 8KyJAFFEvtxJFnEduGvei8+z4qAx2J2+7kNCAlKu4wBqIMdYYRBv6PmqNXwpn45PO13N7
	 Tov9oL9E909uTCf8raPsoH1g3Ls//jWgi5bKI17SpRfePssJsrKY2tURKT+fJnUWNrsdI
	 f9fFP+x+hnCEL82QymW6M7jqS+lSMdY2nIGS2rLFetABAPMmHdFSbpg3ebBoCFdS4rdB0
	 jUbVPxPu27LjQvnVKv/+pU4obQ77fM2hiZ6B0F7pUdQPYuzr3AZidYkJhidr4mom9VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZkRnMtap;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE11606A32F;
	Thu,  5 Nov 2026 12:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZkRnMtap
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 238811F0093A;
	Thu,  5 Nov 2026 12:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793883424;
	bh=RpCyM3yYQCSRwMwZTxO0x/ozF1soHumH44biXgdIoZ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZkRnMtapWrHPpFIz3YGQUvrj3GjmgDF5AjIBLY5Ctga+RYKiFrbqGhG9mpFKPi+VL
	 /9M0FOGeMuYoZeYTxnEBHmyA5OWdYufO/sFNVj+ThEj+UONjA3vKD5c2snr9DL9ND4
	 XTcXtqTAHssmv3i9/+Y1Uz1OY9yT/NAtbWbUjAFOLGQP7TDxFmcXPsX9UL5kezbSqL
	 mqAGChTDhG3tsom/hJkNrXicqLAofT/dmT1TnzgOKXJm4M3UME/J3KH2iv5crwBMnh
	 fjdbSWELJaBKAeToGEtcS3K/LJbw+6YnHJ1gVKv3it4SGOVe8zVBu1Hh4FqPp0ix4S
	 s5gR5fb8arpzA==
From: Sasha Levin <sashal@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 1/3] selftests/prctl: skip the anonymous VMA naming test when unsupported
Date: Thu,  5 Nov 2026 07:56:59 -0500
Message-ID: <20261105125701.1605281-2-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105125701.1605281-1-sashal@kernel.org>
References: <20261105125701.1605281-1-sashal@kernel.org>
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

PR_SET_VMA_ANON_NAME is only implemented when CONFIG_ANON_VMA_NAME is
enabled. Without it, set_anon_vma_name() returns -EINVAL for every
request, so set-anon-vma-name-test reports a failure on kernels that
simply do not provide the feature:

  # renaming: Expected rename_vma(...) (-22) >= 0
  not ok 1 vma.renaming

Probe the interface in the fixture setup by clearing the name of the
anonymous mapping, which succeeds whenever the feature is available,
and skip the test when the kernel rejects the request with EINVAL.

Fixes: 5290586186d2 ("selftests: prctl: Add new prctl test for PR_SET_VMA action")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/prctl/set-anon-vma-name-test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/prctl/set-anon-vma-name-test.c b/tools/testing/selftests/prctl/set-anon-vma-name-test.c
index 5f9589534da8e..d3854ccb2a7a3 100644
--- a/tools/testing/selftests/prctl/set-anon-vma-name-test.c
+++ b/tools/testing/selftests/prctl/set-anon-vma-name-test.c
@@ -93,6 +93,9 @@ FIXTURE_SETUP(vma) {
 					MAP_PRIVATE, self->fd_not_anon, 0);
 	ASSERT_NE(self->ptr_not_anon, MAP_FAILED);
 	close(self->fd_not_anon);
+
+	if (rename_vma((unsigned long)self->ptr_anon, AREA_SIZE, NULL) == -EINVAL)
+		SKIP(return, "PR_SET_VMA_ANON_NAME is not supported");
 }
 
 FIXTURE_TEARDOWN(vma) {
-- 
2.53.0

