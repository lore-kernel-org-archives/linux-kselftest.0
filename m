Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470873469FA;
	Mon,  2 Mar 2026 22:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772492388; cv=none; b=tsIP4/4kfyTlSeHEHOHWTESxt+57GG/HHXbYUpY4F9f4OTtm9TsD45vrLdB7ThNdNNkJOGutG6FHw3HRlj5ep8dGt/2QcBmGAoWf65CWMrmXjaA2A4W9GGSeoWKrk32iy/XTt0OEfOABwFxVtX+W0hA1s7nzd4ha/nJ94PRZb1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772492388; c=relaxed/simple;
	bh=/lJ/fehI44WibZOvYodNtIelbVYTdzXsSQx64Pg7wIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rr8y6Dg2MHccwfcuE/kD2Z7/BPL2kgEPHC1uNbPmG8QZfvKiwqPXUh8oWfpGY0yom6GSYuqvjUoyGCIZJZuNWI0sOIG3TMGZUpdWY9uLkm+9jXuEnebGvFZPke36gV98ZMzwy0WT3e6/8FQz4Leqct9xC6zPs41XXvEKPoUu8cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bitJPtW3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bitJPtW3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3DC2C2BCAF;
	Mon,  2 Mar 2026 22:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772492387;
	bh=/lJ/fehI44WibZOvYodNtIelbVYTdzXsSQx64Pg7wIg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bitJPtW3XaXkfxh8HzFIJ+9wFYUPYCzc0GxlPNl5UJnXeIkyZm7QZR1CLId+5QWuC
	 uh1T9uELA5K2i4rlfmJCjNJyVZp4bw7FuYQXiXYBTd7vedEc8pjv+iNQS8S+WuedBz
	 EPX+SpA3P03WwmplXCsFAblyJXXdD0eoyy7srOCGr7MJhK7ZSKB9beTUFmI6D0Jczd
	 m4LhtpKz6u24w7imvgitsKJ/7G64SYIzUiRTRFbJPryjd01v9hG6UAJdGaXFf8z7Yc
	 h56gkBpSKXh9k8XqspUzBv2tkPomXwGVACakgOlxbRdr64LwszVZnr6lGBsOxLMP/t
	 Ovk95MkqJa6ow==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 02 Mar 2026 22:53:21 +0000
Subject: [PATCH 6/8] arm64/sysreg: Update ID_AA64SMFR0_EL1 description to
 DDI0601 2025-12
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-arm64-dpisa-2025-v1-6-0855e7f41689@kernel.org>
References: <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
In-Reply-To: <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-38bf1
X-Developer-Signature: v=1; a=openpgp-sha256; l=744; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/lJ/fehI44WibZOvYodNtIelbVYTdzXsSQx64Pg7wIg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpphZS/+s06dtawLD+8AABMWAE3HxCNXtMFOPnG
 tVJRpBgfdGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaaYWUgAKCRAk1otyXVSH
 0A59B/0fe7ZQnlgvilKPjZLS9zvMj/v6kbyBjzEMHarYcE3Yrw+CBp9dAHRQ2egdswvoORI9F+9
 kLdFofxVIdMrMyfmAXoGlRKnqsBJILOCf+9dwIuI1l3LjbGuA+/yHJ+k6KT1DIsgCigAA8UxnX2
 UbfLrxztfNIHaBTMYF62v5IhOW4nRXi3kkbXeqBL1LXHYHsQnsckHQA7aLhQq0y+nItdDx3m3i4
 421mE3exI6N1MP5q9qVk3lv6XeH2obZaUMBFuvXSrPXVmSOn3acS0qiS+9EEp2anER7TTDG2uCN
 Ppb3G9wiHzlhbjQrTG9ThHFYM73EYU7KcbJMAjeaOMyGHviU
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The 2025 extensions add FEAT_SME2P3, including LUT6.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/tools/sysreg | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 75b8644c4753..eded0bee6ce4 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1532,7 +1532,11 @@ UnsignedEnum	63	FA64
 	0b0	NI
 	0b1	IMP
 EndEnum
-Res0	62:61
+Res0	62
+UnsignedEnum	61	LUT6
+	0b0	NI
+	0b1	IMP
+EndEnum
 UnsignedEnum	60	LUTv2
 	0b0	NI
 	0b1	IMP
@@ -1542,6 +1546,7 @@ UnsignedEnum	59:56	SMEver
 	0b0001	SME2
 	0b0010	SME2p1
 	0b0011	SME2p2
+	0b0100	SME2p3
 EndEnum
 UnsignedEnum	55:52	I16I64
 	0b0000	NI

-- 
2.47.3

