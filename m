Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39F7317169;
	Mon,  2 Mar 2026 22:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772492381; cv=none; b=WHKV58Vc2QmKaaZ2yK9khZyI4DNDCl2G76LQ7qGjtOHOXQa/rblp9MGAq4YXZ1nOWBL97UEsflyaVWmfnZKZGEbXeVH9iTpbvp9KowsObNThhwVFX2303AHrqriMzOyNPyZrlunnVaew5otdYDlnto8VtP3vGN8oaXguwuL/7Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772492381; c=relaxed/simple;
	bh=PtfcxF9KcORftVGAXfd58IX/BO8+KKdxndL+8xF0gOA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cNIo6JLqrOcbBMKaSGCqoFMHeqAcUA05NpwJwhwoz8SKUHM1n2peM4MJ91mj9RJcR9IqyomjFfZiygKHNiliwFj/jXLWpMhmCnG/m04PWyLHp2Yuk2k3IFSbgxfUqsVJ1bya/h0kjfiUqOqdV+/xzxF6dEsROliPwHVwsgZ8+BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hl6tUKXu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hl6tUKXu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB595C2BCB1;
	Mon,  2 Mar 2026 22:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772492381;
	bh=PtfcxF9KcORftVGAXfd58IX/BO8+KKdxndL+8xF0gOA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hl6tUKXuEcavV2hhYUPDket+05sdUf2MhbUytP05hdDz6P7xZs0rD71Me4SzVQhhH
	 4muRY8RcKlt6mEhDhg6fkzt5mT1i38h8of/z3xKRXnC2m5ftrO+xErvEcfOsjwmH6i
	 8S+aEocKm9061lGipdo8/HeHVEg972m4/ttsDwmVChehM42wUGZPgZ0VhKRhfc16Vz
	 fWHSLIyOfYCyz2D7PvdDyn89HEw/oV7y+iU7OoiAouDcHmV1Vxx0u3njnr9s97YznR
	 WU8dWDnYfSq1AzAROpwJNxewZ8YRP1a/ObM3XOseTuDWHCvU1b9voKvj0q1XkUqMfY
	 uwJWD5+yIHfbQ==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 02 Mar 2026 22:53:18 +0000
Subject: [PATCH 3/8] arm64/sysreg: Update ID_AA64ISAR2_EL1 description to
 DDI0601 2025-12
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-arm64-dpisa-2025-v1-3-0855e7f41689@kernel.org>
References: <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
In-Reply-To: <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-38bf1
X-Developer-Signature: v=1; a=openpgp-sha256; l=587; i=broonie@kernel.org;
 h=from:subject:message-id; bh=PtfcxF9KcORftVGAXfd58IX/BO8+KKdxndL+8xF0gOA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpphZQ04+K+tILLsIzCBUDqzM9L+KkjnT1cuQZQ
 H2WgqdvzPOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaaYWUAAKCRAk1otyXVSH
 0Il1B/0RHFHUr5JF6GIdPVGFVcg5NP+JUu0mxrimmH0RAAFPOYfxGGumlYmBMevEC1etYw3ns+B
 kKH9dpQ/UI9QFZl6cv1zup+yoifdfmz8G8cJ7q2tRZXzkbszMXCsGwou/fl6cyHsRsWdxPl9w5k
 SX5Kfw2v90ukZwKcxx9mOSDgGMMEfsEAG7C+iOk67wjh+Ri+3N533derldmdhXJv5Qk5o+aUUhN
 P7eAfE6/JNE5CtuC3HQAjCY2aD5/rVPM96fLFvrbBns0w0zcA7u2XJA7oMGMJG/vugeHylOA1ue
 EdXRn2Cx+yhumRaFO90EEkOjiSfbU3/s8pxdaxo0DS2cATQo
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The 2025 extensions update the LUT field for new instructions added by
SVE and SME 2.3, there is no separate FEAT_ feature for these.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/tools/sysreg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 623577b7554b..0d619c173c87 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1978,6 +1978,7 @@ EndEnum
 UnsignedEnum	59:56	LUT
 	0b0000	NI
 	0b0001	IMP
+	0b0010	LUT6
 EndEnum
 UnsignedEnum	55:52	CSSC
 	0b0000	NI

-- 
2.47.3

