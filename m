Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A8E370D5A;
	Mon, 18 May 2026 15:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779116933; cv=none; b=UVJ1UuOXxeKr6VrDjqj6c4GzyZwq8Ho2yaGntCgAXtfiqspblcTYM8fLRlNdiJP1NJUC6Y9qVb/ftE+5k7xUk7GrZKD13/qFz0pSGGkbjJpOMp/o1uObfp1qJPT5OgL+ipKEhs8jD8lg2LsxTLl/XwJpI09/DbaY2v2d+cvBq7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779116933; c=relaxed/simple;
	bh=cfA4Ibdui6nnrdEV54tiYvssRE6gcGfQ0ARyvZ4bAAY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=impu/hR/wIuamWgrg6yVmFfv3zUK68O8Agtdxk3yKMdrrgXEcZ7zsbWKI867t4ROvvXAkw9C3mRmQYe1ycniQ8u+1OEcuVnylUR0q3CzLuQQwrIafs3ROy3RKnXcDJT7baEmEvGqRR3yUGElVZ2H7GaKZitSzKFqdv9sa2ix7NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=INRh4+GG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="INRh4+GG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32CC4C2BCB7;
	Mon, 18 May 2026 15:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779116932;
	bh=cfA4Ibdui6nnrdEV54tiYvssRE6gcGfQ0ARyvZ4bAAY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=INRh4+GGjQHX0qwXeslpFza20QCQAPfFM2xhozYOYD7gaJr7QaL2TJ/irYFmSIr92
	 uquHagjrFwfeUDCrEe464adINNgOLXT8mVErM6N8uJer819Bgw8e/urhwDSqkrXtjq
	 /XEby8wgpoEuR1WOef8Ln8SlayFxQwcKNt0P9BAq6Ao6CoZdljnSOngCLbx50Fius1
	 XUUrN1eMxqko8lBF7qeDmS/i3x7MAvrqVMeX2LlBRtBrWiFKrtfxSMhzvU0Co0XIiD
	 9CQ2kwLJYXQx5cMjdAe5kIdMfMNRCxH1NiA80mN5v/6iSDTgIEEyiaaa3iV5yoijs2
	 cAfKLq77/FxBA==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 18 May 2026 16:07:30 +0100
Subject: [PATCH v2 2/2] kselftest/arm64: Add 2025 dpISA coverage to hwcaps
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-arm64-dpisa-2025-v2-2-b3367b73bd00@kernel.org>
References: <20260518-arm64-dpisa-2025-v2-0-b3367b73bd00@kernel.org>
In-Reply-To: <20260518-arm64-dpisa-2025-v2-0-b3367b73bd00@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5117; i=broonie@kernel.org;
 h=from:subject:message-id; bh=cfA4Ibdui6nnrdEV54tiYvssRE6gcGfQ0ARyvZ4bAAY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqCyt+tC6HEN5KhtRFuBmb2AlnCPLhZuPZqHHIf
 J3ZKvpsAieJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCagsrfgAKCRAk1otyXVSH
 0DEmB/4pD0mSaCB2En9wA75gJzPKr/6DL0dNbf3NlSPnWX9R6sibPUUhLsgyTgOyPs/6EXiJW/x
 kUcjXeOgbTcvB0vQYZAJWtZFfdFzMKyVE8zhoRtGzykfeM51bys+ZReEvh7aGjwcuuylg48vSlU
 Dvi1Ybu3cUc4ZPzm2ITogr87TdaWicIWxXjDw7ynug9QQM4txBueZbNwaP6KyagCTSFKFLAP6Zb
 Sp5eEy+lPM+Pw3PPZI8B8agWVvQvHbUWCdbIZJRJalAndccU4u186aLafGjryYpeXN8ty7gxZkA
 3TAsxFBKDnH1pm9zj6SsKq/fSTVHGJzvC4wmRHsrybenLdn6
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Add coverage of the new hwcaps to the test program, encodings cross checked
against LLVM 22.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/abi/hwcap.c | 116 ++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/tools/testing/selftests/arm64/abi/hwcap.c b/tools/testing/selftests/arm64/abi/hwcap.c
index e22703d6b97c..19fca95f7c22 100644
--- a/tools/testing/selftests/arm64/abi/hwcap.c
+++ b/tools/testing/selftests/arm64/abi/hwcap.c
@@ -108,6 +108,24 @@ static void f8mm8_sigill(void)
 	asm volatile(".inst 0x6e80ec00");
 }
 
+static void f16f32dot_sigill(void)
+{
+	/* FDOT V0.2S, V0.4H, V0.2H[0] */
+	asm volatile(".inst 0xf409000");
+}
+
+static void f16f32mm_sigill(void)
+{
+	/* FMMLA V0.4S, V0.8H, V0.8H */
+	asm volatile(".inst 0x4e40ec00");
+}
+
+static void f16mm_sigill(void)
+{
+	/* FMMLA V0.8H, V0.8H, V0.8H */
+	asm volatile(".inst 0x4ec0ec00");
+}
+
 static void faminmax_sigill(void)
 {
 	/* FAMIN V0.4H, V0.4H, V0.4H */
@@ -191,6 +209,12 @@ static void lut_sigill(void)
 	asm volatile(".inst 0x4e801000");
 }
 
+static void sve_lut6_sigill(void)
+{
+	/* LUTI6 Z0.H, { Z0.H, Z1.H }, Z0[0] */
+	asm volatile(".inst 0x4560ac00");
+}
+
 static void mops_sigill(void)
 {
 	char dst[1], src[1];
@@ -282,6 +306,18 @@ static void sme2p2_sigill(void)
 	asm volatile("msr S0_3_C4_C6_3, xzr" : : : );
 }
 
+static void sme2p3_sigill(void)
+{
+	/* SMSTART SM */
+	asm volatile("msr S0_3_C4_C3_3, xzr" : : : );
+
+	/* ADDQP Z0.B, Z0.B, Z0.B */
+	asm volatile(".inst 0x4207800" : : : "z0");
+
+	/* SMSTOP */
+	asm volatile("msr S0_3_C4_C6_3, xzr" : : : );
+}
+
 static void sme_aes_sigill(void)
 {
 	/* SMSTART SM */
@@ -378,6 +414,18 @@ static void smef8f32_sigill(void)
 	asm volatile("msr S0_3_C4_C6_3, xzr" : : : );
 }
 
+static void smelut6_sigill(void)
+{
+	/* SMSTART */
+	asm volatile("msr S0_3_C4_C7_3, xzr" : : : );
+
+	/* LUTI6 { Z0.B-Z3.B }, ZT0, { Z0-Z2 } */
+	asm volatile(".inst 0xc08a0000" : : : );
+
+	/* SMSTOP */
+	asm volatile("msr S0_3_C4_C6_3, xzr" : : : );
+}
+
 static void smelutv2_sigill(void)
 {
 	/* SMSTART */
@@ -486,6 +534,12 @@ static void sve2p2_sigill(void)
 	asm volatile(".inst 0x4cea000" : : : "z0");
 }
 
+static void sve2p3_sigill(void)
+{
+	/* ADDQP Z0.B, Z0.B, Z0.B */
+	asm volatile(".inst 0x4207800" : : : "z0");
+}
+
 static void sveaes_sigill(void)
 {
 	/* AESD z0.b, z0.b, z0.b */
@@ -504,6 +558,12 @@ static void sveb16b16_sigill(void)
 	asm volatile(".inst 0x65000000" : : : );
 }
 
+static void sveb16mm_sigill(void)
+{
+	/* BFMMLA Z0.H, Z0.H, Z0.H */
+	asm volatile(".inst 0x64e0e000" : : : );
+}
+
 static void svebfscale_sigill(void)
 {
 	/* BFSCALE Z0.H, P0/M, Z0.H, Z0.H */
@@ -729,6 +789,27 @@ static const struct hwcap_data {
 		.cpuinfo = "f8mm4",
 		.sigill_fn = f8mm4_sigill,
 	},
+	{
+		.name = "F16MM",
+		.at_hwcap = AT_HWCAP3,
+		.hwcap_bit = HWCAP3_F16MM,
+		.cpuinfo = "f16mm",
+		.sigill_fn = f16mm_sigill,
+	},
+	{
+		.name = "F16F32DOT",
+		.at_hwcap = AT_HWCAP3,
+		.hwcap_bit = HWCAP3_F16F32DOT,
+		.cpuinfo = "f16f32dot",
+		.sigill_fn = f16f32dot_sigill,
+	},
+	{
+		.name = "F16F32MM",
+		.at_hwcap = AT_HWCAP3,
+		.hwcap_bit = HWCAP3_F16F32MM,
+		.cpuinfo = "f16f32mm",
+		.sigill_fn = f16f32mm_sigill,
+	},
 	{
 		.name = "FAMINMAX",
 		.at_hwcap = AT_HWCAP2,
@@ -918,6 +999,13 @@ static const struct hwcap_data {
 		.cpuinfo = "sme2p2",
 		.sigill_fn = sme2p2_sigill,
 	},
+	{
+		.name = "SME 2.3",
+		.at_hwcap = AT_HWCAP3,
+		.hwcap_bit = HWCAP3_SME2P3,
+		.cpuinfo = "sme2p3",
+		.sigill_fn = sme2p3_sigill,
+	},
 	{
 		.name = "SME AES",
 		.at_hwcap = AT_HWCAP,
@@ -967,6 +1055,13 @@ static const struct hwcap_data {
 		.cpuinfo = "smef8f32",
 		.sigill_fn = smef8f32_sigill,
 	},
+	{
+		.name = "SME LUT6",
+		.at_hwcap = AT_HWCAP3,
+		.hwcap_bit = HWCAP3_SME_LUT6,
+		.cpuinfo = "smelut6",
+		.sigill_fn = smelut6_sigill,
+	},
 	{
 		.name = "SME LUTV2",
 		.at_hwcap = AT_HWCAP2,
@@ -1052,6 +1147,13 @@ static const struct hwcap_data {
 		.cpuinfo = "sve2p2",
 		.sigill_fn = sve2p2_sigill,
 	},
+	{
+		.name = "SVE 2.3",
+		.at_hwcap = AT_HWCAP3,
+		.hwcap_bit = HWCAP3_SVE2P3,
+		.cpuinfo = "sve2p3",
+		.sigill_fn = sve2p3_sigill,
+	},
 	{
 		.name = "SVE AES",
 		.at_hwcap = AT_HWCAP2,
@@ -1066,6 +1168,13 @@ static const struct hwcap_data {
 		.cpuinfo = "sveaes2",
 		.sigill_fn = sveaes2_sigill,
 	},
+	{
+		.name = "SVE B16MM",
+		.at_hwcap = AT_HWCAP3,
+		.hwcap_bit = HWCAP3_SVE_B16MM,
+		.cpuinfo = "sveb16mm",
+		.sigill_fn = sveb16mm_sigill,
+	},
 	{
 		.name = "SVE BFSCALE",
 		.at_hwcap = AT_HWCAP,
@@ -1087,6 +1196,13 @@ static const struct hwcap_data {
 		.cpuinfo = "svef16mm",
 		.sigill_fn = svef16mm_sigill,
 	},
+	{
+		.name = "SVE_LUT6",
+		.at_hwcap = AT_HWCAP3,
+		.hwcap_bit = HWCAP3_SVE_LUT6,
+		.cpuinfo = "svelut6",
+		.sigill_fn = sve_lut6_sigill,
+	},
 	{
 		.name = "SVE2 B16B16",
 		.at_hwcap = AT_HWCAP2,

-- 
2.47.3

