Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEF033F5B5;
	Mon,  2 Mar 2026 22:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772492392; cv=none; b=jKxRhZIrcTAsvIrWeh4c/DZkKt7cllwKb0ym8ubrG/axqoXE3kzsFVqQcz3EXIHrlTTia5MGCeIo7fUeShUXG6yIejD/97ugxC2PNORsDAykRKBjjtTQhjlrO0rmB6wwts5JYnjZyF35jEmXCW6JkA6jKEX/eoW3K7/QJdpjh+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772492392; c=relaxed/simple;
	bh=k28xlv3oqLuHGwNR19fusA0RoHT8v5EmRNzuxn2QGlU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U31QNGwNbo+39F9h4iW3sgvjIyeWynTcUvYuHLDtHokRPr3pZjgrez0SVIsOawyJQJxsdtDnleJbfrSpL9suFdMA99GDVhADjAxO9sWGsRQeZ76IT60gMatcGkbHm69C8qXW4VjTO+dfz+vv5y3l0/Y6wvaarL53xecCrz1c0KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k8Nb7BfD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k8Nb7BfD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC58C2BCB2;
	Mon,  2 Mar 2026 22:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772492391;
	bh=k28xlv3oqLuHGwNR19fusA0RoHT8v5EmRNzuxn2QGlU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=k8Nb7BfDOuhfHjfQAMn2RzA9+DFR0vjbh5Uv5CpQFIF737318k9SCnol82uTqZQTg
	 F1O7+vjxEQ46MoVUDcBOxjIfUf23gyDouY6c9Kj8aazUlQqhVwUQs59MBkn+WpArPG
	 NZBcERNmvsnuvccGek6jtN9yz+lVAawsHFEBJsoTBafwWj9ElQO+UWmNs+2/uHSA3T
	 Q/fZwpswTbuHKvcuqZLHYo5lbXvlRfGUKwlPHSqq4RD0SIa66zB0BpQQ7uNZR/p1T/
	 ndnENqy/uj4M5uAPvdh20y84YoD1vVB2Jj5/GDMepR7SYWguKEEe8YqlMdngjacOwY
	 e/FMKY5lKyC2g==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 02 Mar 2026 22:53:23 +0000
Subject: [PATCH 8/8] kselftest/arm64: Add 2025 dpISA coverage to hwcaps
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-arm64-dpisa-2025-v1-8-0855e7f41689@kernel.org>
References: <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
In-Reply-To: <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-38bf1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5080; i=broonie@kernel.org;
 h=from:subject:message-id; bh=k28xlv3oqLuHGwNR19fusA0RoHT8v5EmRNzuxn2QGlU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpphZU7oC8QDO2MV5R+ciPpTV9RuVrZ00VY0ySE
 QFZ8dwzDumJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaaYWVAAKCRAk1otyXVSH
 0AgWB/0W2H9qyDm1/Hh2fBseSJgT62ZDZcnq6WbxOSLC7jcizLb+9K9rZI/Um4UFrt2YsI0dK+S
 TqKgp71KDtpFYqoRkPQuyBMKrXLZdPnsD5zhfDHCz2ny9clsi3hpPW2tkNYsyCCtUCtwA7LVqUL
 wF+CXVMWMgtEU2A50W5gJva8K+tVsWvc+rpDxdLaE/VOkZnFPPiBC9QRICMidRjbAdPPXVK0DUE
 EMorjxB9OAmwtbs2SB/hSRI0qs+j8mVj3XkbHHN9KpsYUGjpKrvouEaY6m1vsqZ0TDZihFKQY4l
 SMkDSHu7vbU2Urzwr0JWcHSKrYdU6ENdBP+/k/9iESMVyMJk
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Add coverage of the new hwcaps to the test program, encodings cross checked
against LLVM 22.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/abi/hwcap.c | 116 ++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/tools/testing/selftests/arm64/abi/hwcap.c b/tools/testing/selftests/arm64/abi/hwcap.c
index 9d2df1f3e6bb..fbb5563ac7ac 100644
--- a/tools/testing/selftests/arm64/abi/hwcap.c
+++ b/tools/testing/selftests/arm64/abi/hwcap.c
@@ -107,6 +107,24 @@ static void f8mm8_sigill(void)
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
@@ -190,6 +208,12 @@ static void lut_sigill(void)
 	asm volatile(".inst 0x4e801000");
 }
 
+static void lut6_sigill(void)
+{
+	/* LUTI6 Z0.H, { Z0.H, Z1.H }, Z0[0] */
+	asm volatile(".inst 0x4560ac00");
+}
+
 static void mops_sigill(void)
 {
 	char dst[1], src[1];
@@ -281,6 +305,18 @@ static void sme2p2_sigill(void)
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
@@ -377,6 +413,18 @@ static void smef8f32_sigill(void)
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
@@ -485,6 +533,12 @@ static void sve2p2_sigill(void)
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
@@ -503,6 +557,12 @@ static void sveb16b16_sigill(void)
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
@@ -728,6 +788,27 @@ static const struct hwcap_data {
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
@@ -830,6 +911,13 @@ static const struct hwcap_data {
 		.cpuinfo = "lut",
 		.sigill_fn = lut_sigill,
 	},
+	{
+		.name = "LUT6",
+		.at_hwcap = AT_HWCAP3,
+		.hwcap_bit = HWCAP3_LUT6,
+		.cpuinfo = "lut6",
+		.sigill_fn = lut6_sigill,
+	},
 	{
 		.name = "MOPS",
 		.at_hwcap = AT_HWCAP2,
@@ -917,6 +1005,13 @@ static const struct hwcap_data {
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
@@ -966,6 +1061,13 @@ static const struct hwcap_data {
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
@@ -1051,6 +1153,13 @@ static const struct hwcap_data {
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
@@ -1065,6 +1174,13 @@ static const struct hwcap_data {
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

-- 
2.47.3

