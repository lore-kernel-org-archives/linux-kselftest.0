Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A95C1AF0BB;
	Mon,  2 Mar 2026 22:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772492383; cv=none; b=UJztjlYfsKAgbtAeeHdx3XhpC2qgbtYXgX4ahI7HqqIiRLQ7FEii2NKSzhp57ljCXRkplhQ/9pHn/YlU2N1Za27EsiilbpRuLBd2XyBqUFfr38PXwJg3sCrIWVyHz2gMCBAx5sMkwL41af4IHFzYq6Go2Jdm+lm8SVGcIkImyG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772492383; c=relaxed/simple;
	bh=3cDEmPbM/ZrYkcKE8GG467rShtzE9T3OP7Nd6C9sgls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EFUCBy1oJU7dnxchfwZQDrgC332RG7pYaVoATmki/JcZWm2HobHqjV5aLdL2d/nX1OZ+3/hmInHm+q8qsA8qzORR8e6Jx6bM0l21RdDfMaj+usWwWg46ZR17LR9eHPuXH423IN0yEMSXKGRw3kibfVSCqJiVJ5sTTnZN7yjv3EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NGIk0XOf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NGIk0XOf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5149C2BCB0;
	Mon,  2 Mar 2026 22:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772492383;
	bh=3cDEmPbM/ZrYkcKE8GG467rShtzE9T3OP7Nd6C9sgls=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NGIk0XOfImvJ63+ydhkZUIWm95xFTrUYfrTRezcqS5Zu1U7j0YfoWNW9hIrsSJNDR
	 UUx7vpuhIbMOhniyftthpM4ccHZq1XQK638LFy8RSrbKDqpUZoHxphngrSjdrWp10s
	 cMwFW/VvDhZMSr8UlCg9uoBhk00XEXIPH3lpM1MWZp13JXWsWx1yHMJQpUt6kWA0Cp
	 i6/xrPfy30vxjT1hiXu2M65ZrV8uFmxuWuzF2dd/SbwLVsf01N8LsJkiZVVyKyTH2N
	 muSZkE22I5nT7tjDM6iJ4wx+J14xttw1kjwzTFA7dR8YsxaLX3Hfg67MNx6hbrw/6f
	 tqwEXeJexxv2Q==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 02 Mar 2026 22:53:19 +0000
Subject: [PATCH 4/8] arm64/sysreg: Update ID_AA64FPFR0_EL1 description to
 DDI0601 2025-12
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-arm64-dpisa-2025-v1-4-0855e7f41689@kernel.org>
References: <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
In-Reply-To: <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-38bf1
X-Developer-Signature: v=1; a=openpgp-sha256; l=680; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3cDEmPbM/ZrYkcKE8GG467rShtzE9T3OP7Nd6C9sgls=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpphZRWfQt6vizNrWnnVqMTnzPDEZkuz/frnUdr
 UY98RUo1+KJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaaYWUQAKCRAk1otyXVSH
 0Gp7B/wJu4xpUwsMSjlE4mku4Dmg5Mpyc/Zuh4NBayp2zw79vd9mqLm1M5HWOtELGEifFm5YFD7
 CE9JGeuiqf9M7W2T6Yo0W2Tz263tQ+CbeVFX10tmzVF1TMQ0F0vOAv5aKkyaqNPWgzdYUZeqCsm
 3d1qmGqBcTcWESKDSf3gqgim9XtqmPFz+An7dA6Gx1Ayf4xcAJZVN4c+rfn6UCRpzSmbgQekrAH
 wRicgSMJcrBf7vYLZFKyHTNy7B2k2spJwCfUEqZElc/PP57gnp5FlaXMXHIScM6tXt8/pYqQscM
 wAKOwSQZysQSjukS6tkL1YjJGfPnDHLpQR4kUrp2/tWJQFcs
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The 2025 extensions add FEAT_F16MM and adjust some of the RES0 bits to be
RAZ instead as a placeholder for future extensions.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/tools/sysreg | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 0d619c173c87..451ad312dc78 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1654,7 +1654,13 @@ UnsignedEnum	26	F8MM4
 	0b0	NI
 	0b1	IMP
 EndEnum
-Res0	25:2
+Res0	25:16
+UnsignedEnum	15	F16MM2
+	0b0	NI
+	0b1	IMP
+EndEnum
+Res0	14:8
+Raz	7:2
 UnsignedEnum	1	F8E4M3
 	0b0	NI
 	0b1	IMP

-- 
2.47.3

