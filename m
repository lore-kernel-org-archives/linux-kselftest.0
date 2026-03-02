Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08F531F9B8;
	Mon,  2 Mar 2026 22:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772492379; cv=none; b=tDfNnhtMhyEnDhOuEeN7YHn7C/iKnXwK/fUoLHxApH01za3ohXWclB5i/vXby6E8RNRK7yZ+W5VoYdIhHJGEJg02TjEwBx9tIC95FmPJizvf/8ASN/vol+t+4kZsEvrLDX4BQP4ffixWMlPYt8EqwoufqWVuXpbFj0E0HViSDAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772492379; c=relaxed/simple;
	bh=1Y2Bq9RZnh/y+WhW+nbmbBevrPdJ+64IRYiYABDxDkQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K31EujeH1r2rvnMOmmFWbAVMN9ZSUEoQJd/tTHnUkBrCRw8jFc/OGWRAReYJqlYX67FKEVmTeoWbDH4ScdD7iJjXNol91i2wUIxnuoWezSiqkWHTGwnLQPbQLwk1n7M3jExKoC9IrD0KcH3BHq5TKBZaFiLimUidtn7VfTMO+Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJU2ylMc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJU2ylMc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A13B3C2BCB0;
	Mon,  2 Mar 2026 22:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772492379;
	bh=1Y2Bq9RZnh/y+WhW+nbmbBevrPdJ+64IRYiYABDxDkQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BJU2ylMchmveFvOo8jidxLebv0z5YW5nBMKZwbc84IXP2HjyMqSRM1qV11WktDpKb
	 ZMmElVmX79x8NOSoLHk6HVxw+1yNzrMFa0Xwl2yG112Af3/6Gz91pfaRUomkbGR66u
	 XBrGTG3O2jncVZzwxfH3P+e2bkQLAKhheH5NmaSAQGPPLk1RfanQv+4v/T4Yri605S
	 pEB+bKLAaQhHz15RbLev+eoPP5m1q2L9k0xP7uG4w12vkR65/neEc2Mb73zAXKuRFv
	 YOI3GDSp6ENDA7efTPmwJRTHZmUNR7peITj5N0S5H15Nf+OhZWBT3jfTKkuCUon8Dc
	 hjALaGoHIso8Q==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 02 Mar 2026 22:53:17 +0000
Subject: [PATCH 2/8] arm64/sysreg: Update ID_AA64ISAR0_EL1 description to
 DDI0601 2025-12
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-arm64-dpisa-2025-v1-2-0855e7f41689@kernel.org>
References: <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
In-Reply-To: <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-38bf1
X-Developer-Signature: v=1; a=openpgp-sha256; l=534; i=broonie@kernel.org;
 h=from:subject:message-id; bh=1Y2Bq9RZnh/y+WhW+nbmbBevrPdJ+64IRYiYABDxDkQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpphZPOQKIFjhY6njCjprG3IPtIaVhniJ04UQA7
 BeR9yCsQxKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaaYWTwAKCRAk1otyXVSH
 0DsuB/9AS2b1JoJ/2zrQoyeNO9LuorbifIHkLRQ2CtvP6CY6n1UtqkdpEdO6icM7sR/oLmQjrjh
 4QtLiE95mL6G0AMHSgQjVFLpnBFsarwkjeOcGK9ieU5rQ2/K28Yf84xCcMuoWt66HGoJWJFpObY
 M4Q/9rSx11OFXHnEdIXBBZo9SY3nqQGnOkFNCKrgVKmUl2dlJCPOM8gWaUnhUOoJ5HUbhQqybNJ
 xDpiebYqf1mXIyvMfI6gXsmCyBxq6VG83JVYAmO7X2JQB1iGh6XyULJe9PeuOCVfeU2pXMZVC7E
 CoTtFMxg3P2zf9VPiYNyZkS/BAcqoH2HfXfU1xG5qZCpoZKR
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The 2025 extensions add FEAT_F16F32DOT and FEAT_F16F32MM.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/tools/sysreg | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 9d1c21108057..623577b7554b 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1835,6 +1835,8 @@ EndEnum
 UnsignedEnum	51:48	FHM
 	0b0000	NI
 	0b0001	IMP
+	0b0010	F16F32DOT
+	0b0011	F16F32MM
 EndEnum
 UnsignedEnum	47:44	DP
 	0b0000	NI

-- 
2.47.3

