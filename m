Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DC92931EA;
	Tue, 11 Aug 2026 08:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786436141; cv=none; b=p7hJywRqQsO7qGApaNPHJlUWrVJ0I3Q1lrggxPc/vzX8oXB/sYqo9Gc2QPASEZuK/c3R0NOLggtCOGt9v4d84E4ZLnBu/yuwXTtTDDZKfdR23p1Yf+4swS9yLgI6ZcLg9lleH5VULK9+71IbEwHzZHGNtx+0zA8eQ5VsfaSQHMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786436141; c=relaxed/simple;
	bh=+aGEDxProkgtH6XCOW8v9+Y5uS/5WZiciaGXqgew5Ag=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OfJOlf/Oyg4SPHoF5UQu0qalgpE//F3U7sr6JW2AhvkzbKE8dgL+QC1tPtNggN6o+X1gQY/OhqFLK4IdG8PGt0Lscnp7ccXMk1vT6i+tuWcojVKjCTgXLKFpC/rJe/PjT+t7hs6UxZhkEsirYm2BwaDhvbINFdYgl7jEhk0SOzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=haiwei.tech; spf=pass smtp.mailfrom=haiwei.tech; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=haiwei.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=haiwei.tech
X-QQ-mid: zesmtpgz3t1786436116t68c28f83
X-QQ-Originating-IP: KwozMtLivmaHSdjO8icB+0MUlw25DirYX+lIRW7ju24=
Received: from rsl ( [183.242.33.186])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 11 Aug 2026 16:15:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10710046789896365889
From: JinRui <jinrui@haiwei.tech>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org,
	alex@ghiti.fr,
	ajones@ventanamicro.com,
	cleger@rivosinc.com,
	charlie@rivosinc.com,
	samuel.holland@sifive.com
Subject: [PATCH] riscv: report Zfhmin/Zvfhmin when Zfh/Zvfh are present
Date: Tue, 11 Aug 2026 08:15:13 +0000
Message-ID: <7190E4DB338251C3+20260811081513.2849980-1-jinrui@haiwei.tech>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:haiwei.tech:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MTGYztYhR5ETZ3qfv/gcohGxQ7lEfCdPqmfLca176XeT52d8Vpqj4gXf
	BvkeQFtJcowak8jnPbjYm95VygUTw6SA6Oj15riDaqFAZY3KkEdgq9yiIKJgGIAugmvxGfM
	3HyS4SzM/q4OGJQlVOdm3s5mrIsp4dsfdOFIXfNiMidpnsU5pFtfZHlsMM4SLBF4s9+fiBd
	07YPdyAKBhYfNawVB8L/7kyMXfOIxPYThaXnonekU+yHHmrG6odH5K4zWbe4c7vgP4vTkM1
	H2fs0QYnzR8exX3B5zlXL3+bmPRUsUJho36stacUQL8RiYwQztVmuZ4huYqUv9FaOrHhPmb
	WLRP/kCy7buuFnxQ4Kl7U9fYeFjC5NUdmXe+AE0XncxHUtazWmKx8KwjXAnkQGTlpXAEJzo
	vCK2T0IybSFdu54Puz32gN0SyfZZS3Nh3CXAljbFDmuXgTB54aZJli/pzsU0f0+bhJE7800
	jDZpkeWIUbw3PkIKMd9bU9/lxjr38teuO5hC/MVm5jRVR7Bk7dLN942fUW2lwGqvyPMTHMY
	eSCEse6rEczh09yU8708eA4WajFhkB/XR8XeCk9j7RvRKmOGGGebyEEMGQnYP2W13WMhVAv
	wUusICA7nL1Y3Rjc7QtLVS4GRXJYwI2/rWhVrQ/Bp0Ti5idqq1wavB6MTMkGxMNkPcFADYz
	l8KGYxfgsZUORk/p0/IoAha+wgtbup+d+oHShlkmRDajtVkxPTXz1l6WLHXI36jsQr5+tX1
	N/UxVAhSlFIrFOZ/UTOYEwG/dk+q+m0vq10RJKsOEznAeUZH8xzTKgK13agYPKxoGP+JNmp
	oNWiwyAmnefeB8ZfC57HGzXnPK49jgCsmzelB9Xk63SHTG7waktEBkOzkt5YiNNqNOu8iMe
	sXpj6aFaMmxSF8OHGWGvqg1rrbgm9/Lxns66KRH1/90vAd+brQhIR+UF6x/2pVfuTYoIn9J
	GWaqFcmhGeMKZ5wF366UYVfhALmj6cnt2wIkxcPSrNldp74cNdwl28aqv
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

The RISC-V ISA manual specifies that Zfh implies Zfhmin, a normative
rule clarified in
https://github.com/riscv/riscv-isa-manual/pull/3070. Zvfh likewise
implies Zvfhmin, as stated by the vector extension specification.

The kernel currently reports ZFH and ZFHMIN (and ZVFH and ZVFHMIN) as
independent hwprobe bits derived only from what the device tree
declares. Platforms that declare just "zfh" (Zfh being a superset that
already contains all Zfhmin instructions) therefore report
RISCV_HWPROBE_EXT_ZFHMIN=0, which breaks userspace RVA23 conformance
checks (e.g. snapd installing core26 on riscv64).

Use the existing superset mechanism to set the implied subset bits:
  - zfh implies zfhmin
  - zvfh implies zvfhmin

Add a hwprobe selftest asserting the implication holds and update the
hwprobe documentation accordingly.

This is complementary to the rva23u64 base behavior discussion: the
RVA23 conformance query proposed there is derived from the
per-extension bits fixed here, so correct EXT_0 reporting is a
prerequisite for it to work on harts whose device tree declares only
"zfh".

Tested on a RISC-V QEMU VM whose device tree only declares "zfh" and
"zvfh": with this change both /proc/cpuinfo and the hwprobe
RISCV_HWPROBE_KEY_IMA_EXT_0 bitmap report ZFHMIN and ZVFHMIN, and the
hwprobe selftest (including the new implication check) passes.

Link: https://lore.kernel.org/kvm-riscv/20260206002349.96740-1-andrew.jones@oss.qualcomm.com/

Signed-off-by: JinRui <jinrui@haiwei.tech>
---
 Documentation/arch/riscv/hwprobe.rst          |  8 +++++---
 arch/riscv/kernel/cpufeature.c                | 20 +++++++++++++++++--
 .../testing/selftests/riscv/hwprobe/hwprobe.c | 20 ++++++++++++++++++-
 3 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index d9928641d..379c8723f 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -155,7 +155,8 @@ The following keys are defined:
     defined in version 1.0 of the RISC-V Cryptography Extensions Volume II.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZFH`: The Zfh extension version 1.0 is supported
-    as defined in the RISC-V ISA manual.
+       as defined in the RISC-V ISA manual. Zfh is a superset of Zfhmin, so
+       RISCV_HWPROBE_EXT_ZFHMIN is reported whenever RISCV_HWPROBE_EXT_ZFH is.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZFHMIN`: The Zfhmin extension version 1.0 is
     supported as defined in the RISC-V ISA manual.
@@ -164,8 +165,9 @@ The following keys are defined:
     is supported as defined in the RISC-V ISA manual.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVFH`: The Zvfh extension is supported as
-    defined in the RISC-V Vector manual starting from commit e2ccd0548d6c
-    ("Remove draft warnings from Zvfh[min]").
+       defined in the RISC-V Vector manual starting from commit e2ccd0548d6c
+       ("Remove draft warnings from Zvfh[min]"). Zvfh is a superset of Zvfhmin,
+       so RISCV_HWPROBE_EXT_ZVFHMIN is reported whenever RISCV_HWPROBE_EXT_ZVFH is.
 
   * :c:macro:`RISCV_HWPROBE_EXT_ZVFHMIN`: The Zvfhmin extension is supported as
     defined in the RISC-V Vector manual starting from commit e2ccd0548d6c
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index f46aa5602..d58d3a73e 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -391,6 +391,19 @@ static const unsigned int riscv_zvbb_exts[] = {
 	RISCV_ISA_EXT_ZVKB
 };
 
+/*
+ * The RISC-V ISA manual specifies that Zfh implies Zfhmin and Zvfh implies
+ * Zvfhmin. Report the implied subset extensions whenever the supersets are
+ * detected (see https://github.com/riscv/riscv-isa-manual/pull/3070).
+ */
+static const unsigned int riscv_zfh_exts[] = {
+	RISCV_ISA_EXT_ZFHMIN
+};
+
+static const unsigned int riscv_zvfh_exts[] = {
+	RISCV_ISA_EXT_ZVFHMIN
+};
+
 #define RISCV_ISA_EXT_ZVE64F_IMPLY_LIST	\
 	RISCV_ISA_EXT_ZVE64X,		\
 	RISCV_ISA_EXT_ZVE32F,		\
@@ -523,7 +536,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zawrs, RISCV_ISA_EXT_ZAWRS),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zfa, RISCV_ISA_EXT_ZFA, riscv_ext_f_depends),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zfbfmin, RISCV_ISA_EXT_ZFBFMIN, riscv_ext_f_depends),
-	__RISCV_ISA_EXT_DATA_VALIDATE(zfh, RISCV_ISA_EXT_ZFH, riscv_ext_f_depends),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zfh, RISCV_ISA_EXT_ZFH,
+					  riscv_zfh_exts, riscv_ext_f_depends),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zfhmin, RISCV_ISA_EXT_ZFHMIN, riscv_ext_f_depends),
 	__RISCV_ISA_EXT_DATA(zca, RISCV_ISA_EXT_ZCA),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zcb, RISCV_ISA_EXT_ZCB, riscv_ext_zca_depends),
@@ -559,7 +573,9 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zve64x, RISCV_ISA_EXT_ZVE64X, riscv_zve64x_exts, riscv_ext_vector_x_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zvfbfmin, RISCV_ISA_EXT_ZVFBFMIN, riscv_vector_f_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zvfbfwma, RISCV_ISA_EXT_ZVFBFWMA, riscv_ext_zvfbfwma_validate),
-	__RISCV_ISA_EXT_DATA(zvfh, RISCV_ISA_EXT_ZVFH),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zvfh, RISCV_ISA_EXT_ZVFH,
+					  riscv_zvfh_exts,
+					  riscv_ext_vector_float_validate),
 	__RISCV_ISA_EXT_DATA(zvfhmin, RISCV_ISA_EXT_ZVFHMIN),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zvkb, RISCV_ISA_EXT_ZVKB, riscv_ext_vector_crypto_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zvkg, RISCV_ISA_EXT_ZVKG, riscv_ext_vector_crypto_validate),
diff --git a/tools/testing/selftests/riscv/hwprobe/hwprobe.c b/tools/testing/selftests/riscv/hwprobe/hwprobe.c
index 54c435af9..eca4441ee 100644
--- a/tools/testing/selftests/riscv/hwprobe/hwprobe.c
+++ b/tools/testing/selftests/riscv/hwprobe/hwprobe.c
@@ -9,7 +9,7 @@ int main(int argc, char **argv)
 	long out;
 
 	ksft_print_header();
-	ksft_set_plan(5);
+	ksft_set_plan(6);
 
 	/* Fake the CPU_SET ops. */
 	cpus = -1;
@@ -62,5 +62,23 @@ int main(int argc, char **argv)
 			 pairs[1].key == 1 && pairs[1].value != 0xAAAA,
 			 "Unknown key overwritten with -1 and doesn't block other elements\n");
 
+	pairs[0].key = RISCV_HWPROBE_KEY_IMA_EXT_0;
+	out = riscv_hwprobe(pairs, 1, 0, 0, 0);
+	if (out != 0)
+		ksft_exit_fail_msg("hwprobe(IMA_EXT_0) failed with %ld\n", out);
+
+	/*
+	 * The RISC-V ISA manual specifies that Zfh implies Zfhmin and Zvfh
+	 * implies Zvfhmin, so hwprobe must report the implied subset
+	 * extensions whenever the supersets are present.
+	 */
+	if ((pairs[0].value & RISCV_HWPROBE_EXT_ZFH) &&
+	    !(pairs[0].value & RISCV_HWPROBE_EXT_ZFHMIN))
+		ksft_exit_fail_msg("Zfh reported without implied Zfhmin\n");
+	if ((pairs[0].value & RISCV_HWPROBE_EXT_ZVFH) &&
+	    !(pairs[0].value & RISCV_HWPROBE_EXT_ZVFHMIN))
+		ksft_exit_fail_msg("Zvfh reported without implied Zvfhmin\n");
+	ksft_test_result_pass("Zfh/Zvfh imply Zfhmin/Zvfhmin\n");
+
 	ksft_finished();
 }
-- 
2.53.0

