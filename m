Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3679F480320
	for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 23:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786577768; cv=none; b=imVMAgJ6xAbRnpnVEr9yJYGBOzs8FhHo8m9tmvjbIiM/VXFp9W6OMPh3gCvUpwOtUnX/YyfEhwZUy6pQGvHaXMZ/vEUZo25UFN2PAfFAmZFUVyk/sImUcYskuWFoll31CUSSnqaI3CsQI62Tmn0+xAoAY3pSoauAVLkm+nc+OXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786577768; c=relaxed/simple;
	bh=KazAJLBF2Gbug16VdlaXr1HCrJN3XQt+AbBE5/+Y6+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LNdVmpffGRdnJJEi4nZsdNVkQhXEl4wlQbmOmH3T6mKtEqfPKn80MgqLDAwLAhcWuzguTdUEz/TABRZZNRiaYhBL4tRPmg8GoMPkAJHq0hGZCFzJ4vkZTrbAYV2/qKQTMD8Ssj/AEggXy0zoGOSsQz3BuCEmayaXvc41feTrg6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pLC6pp7D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IeD8h2Mz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pLC6pp7D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IeD8h2Mz"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CNLeqY1064980
	for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 23:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f5WS5iWYARi9kG6oTuil8+y9EaeqVQDieXdNH9/m1ls=; b=pLC6pp7DDl8pgHtf
	vhC9+K9TjAA3uyAaqBIQZDJyLoQOytPx1TZQcGNXxPRLXcQySoJutTySs6k/NlcS
	5NQrLNHDIOsfnIuL9lWmhUzpYDojLf3PWuGElw3tA3OJhzD4QohIUqVVJS2Sfook
	hkXL+7oXEK/fH1qXvo2LwYbzAGDbXZdZ3owleJOwoc2G0k9RInjfTT20lPEDpnZA
	ujgRGYAU2zQKU11Sq5dk9uB2H4jmuwHIbpI+IgwCaAgWlwSNDrtiuXKJBS8OsBBf
	KGfNl7NGwa9sKdssX3mnb8Rd/zpoLbZru/9JZOxuItRN4jIjJnpREm7FM+oIc2pv
	tnZBcQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0wt8s728-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 23:36:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso20836105ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 16:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786577764; x=1787182564; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f5WS5iWYARi9kG6oTuil8+y9EaeqVQDieXdNH9/m1ls=;
        b=IeD8h2MzMly3gDZiB0/0CWaYW4dw4s28LdiI818mwv+y8bQQd7KmzhQs4wg1nHK2tk
         B8lHtUO2LvA0CQm0cDen4Va6iU6KwxiQ6hKh2hRNtoWGq1c/Jfapeo7zcC9zcd2ty3+D
         f4/fddhxYN3trGBKbJKbtdbDM3fF1Qy6blnCgjs3X695ZQJHjxS5Rk39H17tP6HWKvQa
         jWpAFKRsg4/HF3fvKCbJs47TkXxt00a6kyw8y1MDp4qx13SNa9DjaJ4ggX7osnhFJgr4
         pJ9Ojb5zUREkm+WZ9Ns/e60NBRbNVh0Aww1idrvV9Y27Nuwm1Dg6XokrrdkHIYH9/bPl
         q2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786577764; x=1787182564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f5WS5iWYARi9kG6oTuil8+y9EaeqVQDieXdNH9/m1ls=;
        b=XAm1LESbxIzGBCQDqSe+EhqlSp537hV8OThhurcKOM19Fp9KXBZmu6WNdgYdk0B6lz
         uRFLC0hWhw1JIHg1U6H2TC/nB0TN2cGr0KspekfopR2Ji6pTd9KkPjNdYt1f08IWlCqj
         EnvqS9TSU+sBzaFEi3mUkg33OI4LLoBVm8+HwYlmVyPydchOfvy+mAKAD7h6yS1qwNey
         cLIx7wppvkOg4uEg1QaC9Z97f6sggM79yFLyfkh/wLzFwFdPV/oPRZXsdcQJNC7r+BJw
         QVjrkVVlBkYCCsjXLr4afVVVSGLBDcvHHKqT4cdp47fa1txWjrBqwXNNB6Lry1pKiyuu
         wzdQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpv5UR3eIBVazX3vjEPxhR5PCkW7PRj9lHAaN+921PYrUa7M1O51k70eYS6kc9FEk9P/mn9pNFs81bHsb6VvFg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv9/2Za0/dVpyJMcLY5XqjB4FEsWMSkTGR9dFo82u1YoX8fJnl
	II3eOZnYPUexStGZzdzAUrPd0c4H1UCyZk7Za78iEvqJLZBLrUCjyk3yiNWm1ZFWGPuC5yP6/PM
	nSsPvsfv71IcqFy9tgai8wn6mTwS2CORG4ypwQ2ZEoea1TP5T5zBwbRoUHIZhjxLEkhgL1CM=
X-Gm-Gg: AR+sD12V6Hgr2/Y5kR1wK/4fNf6kYomDFjhiOTIYaJPGbWGqTTyiF2U3cVAprf93JiU
	NoZneg8cUoaCFY3G1huSsoZnAs7xVpyPqjDPMewHNlgZOJsoUbKa889BXlWoAt1stT+lA92UIcY
	Dice1TKVlUz4U2bk82w7t3AADrHhWZkdHfMhvACl8ZXbCW++LOsv04OlV1vTYLplbMlqttkNjue
	TY80SUGI86fsNrtdDKMdxpDEp/unQL9k2XZXSNdPmrmPN9KtCmoO4iiZDAEKNQh8H/0fLy5rysH
	D/oi1xnan/P8yHySlohN5D4eyLgVfeTMp7sjiypUHqxXy3pz6nJM76S4VuB2tA==
X-Received: by 2002:a17:903:15c8:b0:2cc:f5aa:9513 with SMTP id d9443c01a7336-2d37d88860emr17678255ad.10.1786577764528;
        Wed, 12 Aug 2026 16:36:04 -0700 (PDT)
X-Received: by 2002:a17:903:15c8:b0:2cc:f5aa:9513 with SMTP id d9443c01a7336-2d37d88860emr17677735ad.10.1786577764062;
        Wed, 12 Aug 2026 16:36:04 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c26d0fbsm2136805ad.37.2026.08.12.16.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 16:36:03 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 19:33:55 -0400
Subject: [PATCH v6 09/11] riscv: cpufeature: Introduce ISA bases bitmap and
 rva23u64 detection
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-rva23u64-hwprobe-v2-v6-9-c985af3256b8@oss.qualcomm.com>
References: <20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com>
In-Reply-To: <20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6035;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=KazAJLBF2Gbug16VdlaXr1HCrJN3XQt+AbBE5/+Y6+s=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqxaZrHwd6fORpzSSYqqiuvR5k7NFL0uUnxISi/Ax4/b6
 tpqEfeOUhYGMS4GWTFFlsNHW7K3vvKJ9n3O+QNmDisTyBAGLk4BmIhmNyNDs3+8rs6B02zGies8
 ZoR5zp2Y6K8tnpYoc/JZkptu8YwnjAzTpQXyzcPOWUyvmtD4ZKZe0bL9z67UaWWVNj9ZGz1XWYo
 JAA==
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Authority-Analysis: v=2.4 cv=YLqvDxGx c=1 sm=1 tr=0 ts=6a7d0365 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Eb22hEiy--YgZ995lnMA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfX8xXOd7NkCLXr
 IjTkVzGtyWJJfH3vPx3oBmoxNv5zhJrgClds1ko9Ds+R5rpwQbMrg1I1Gpj6TzrFSVCfM5I/Er/
 SGl/403hN4K6hz3y64blbTuZdCL2wRcXixHbpU10Qu8rYVZILGZlBQrN1etZV+6fikNES62dqRE
 ZTeoaeZQKfL/Inbrny7hJ6lKRFVGk1jdk5CcnS5q2oopLQhwL3dwJmRzWSEnvNZyX9VzuJj87z3
 +TK9OKyUjQu6kBKCxSHjChPQRia0RLnGfsCr1aQvgw4mR9ARvzWiNadpc85csfqmswVozVngRby
 XFYEHiJ0qqUGAuJWxO/fxwIcSmouOEJdI6SM6arHdqP6iIlgLPcO9qMCtbUAYMQOF8xSsFpkzJl
 xRO2HP5tc0ZjYBstp7PId459Lt2KSG01yXx24D56UfV7IGx4rQZkik86nKMO8BTl0b5b/DchEc6
 fCeskQ+tFsUDne4HK2Q==
X-Proofpoint-ORIG-GUID: uSs1n3wyipTta1LGvdTJB-OkNtfF8O9G
X-Proofpoint-GUID: uSs1n3wyipTta1LGvdTJB-OkNtfF8O9G
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfX9x9rwX4A1nfB
 AmF7sjCdoBOypOvLpE9xGz3Xw5alr9PkVT9JN+PYd18hgdr3L/ntbh46J66xweieUWq2ZphVerf
 j8IHZ57YId06SzV90u8BAJyLeCjeiG4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120190

Introduce a per-hart and host-wide bitmap of conformant ISA "bases"
(named profile-class sets such as IMA and RVA23U64), computed at init
time by riscv_init_isa_bases().

Register riscv_init_isa_bases() as a subsys_initcall so it executes
after core_initcall(tagged_addr_init), which probes senvcfg.PMM and
populates have_user_pmlen_*.  Without that ordering,
riscv_have_user_pmlen(7) would still return its default false and the
RVA23U64 detection path would always bail.

Consider this as the cache that subsequent consumers (hwprobe's
RVA23U64 base behavior bit, /proc/cpuinfo's "isa bases" lines, etc.)
can read without recomputing. System-wide consistency are ensured.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v6: No change.
v5: No change.
v4:
- In riscv_set_isa_base(), reorder those __setbit(RISCV_ISA_EXT_X,m)
  lines to make them conform to the order they appear in the RVA23 1.0
  Profile.
v3:
- Add a blank line before the subsys_initcall() registration (Andrew).
- Set the local ext_mask with __set_bit() and test the mandate set with
  !bitmap_subset() (Sashiko).
- Require the Zic64b ISA extension in the RVA23U64 mask,
  instead of open-coded cache block-size check. (New, thoughts from Andrew)
v2:
- Implement riscv_init_isa_bases() that runs at system init time,
  after tagged_addr_init() populates have_user_pmlen_*.
- Split RVA23S64 placeholder into a future patch.
---
 arch/riscv/include/asm/cpufeature.h | 14 ++++++
 arch/riscv/kernel/cpufeature.c      | 90 +++++++++++++++++++++++++++++++++++++
 2 files changed, 104 insertions(+)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 739fcc84bf7b..facc31b2960c 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -25,10 +25,24 @@ struct riscv_cpuinfo {
 	unsigned long mimpid;
 };
 
+enum {
+	RISCV_ISA_BASE_IMA,
+	RISCV_ISA_BASE_RVA23U64,
+	RISCV_NR_ISA_BASES,
+};
+
+/**
+ * struct riscv_isainfo - per-hart ISA state
+ * @isa: bitmap of ISA extensions this hart implements
+ * @isa_bases: bitmap of profile bases this hart conforms to
+ */
 struct riscv_isainfo {
 	DECLARE_BITMAP(isa, RISCV_ISA_EXT_MAX);
+	DECLARE_BITMAP(isa_bases, RISCV_NR_ISA_BASES);
 };
 
+extern unsigned long riscv_isa_bases[BITS_TO_LONGS(RISCV_NR_ISA_BASES)];
+
 DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
 
 extern const struct seq_operations cpuinfo_op;
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index de7cff5f48c3..2ad8a16a0eff 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -41,6 +41,9 @@ unsigned long elf_hwcap __read_mostly;
 /* Host ISA bitmap */
 static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 
+/* Host ISA bases bitmap */
+DECLARE_BITMAP(riscv_isa_bases, RISCV_NR_ISA_BASES) __read_mostly;
+
 /* Per-cpu ISA extensions. */
 struct riscv_isainfo hart_isa[NR_CPUS];
 
@@ -1334,3 +1337,90 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 	}
 }
 #endif
+
+/*
+ * Compute the set of profile bases (IMA, RVA23U64, ...) a hart
+ * conforms to, given its resolved ISA bitmap.
+ *
+ * If @isa_bitmap is NULL, the host ISA bitmap (the AND across all harts) is
+ * used.
+ */
+static void riscv_set_isa_bases(unsigned long *bases, const unsigned long *isa_bitmap)
+{
+	const unsigned long *isa = isa_bitmap ? isa_bitmap : riscv_isa;
+	DECLARE_BITMAP(ext_mask, RISCV_ISA_EXT_MAX) = { 0 };
+
+	/* IMA */
+	__set_bit(RISCV_ISA_EXT_I, ext_mask);
+	__set_bit(RISCV_ISA_EXT_M, ext_mask);
+	__set_bit(RISCV_ISA_EXT_A, ext_mask);
+
+	if (!bitmap_subset(ext_mask, isa, RISCV_ISA_EXT_MAX))
+		return;
+
+	set_bit(RISCV_ISA_BASE_IMA, bases);
+
+	/* RVA23U64 */
+
+	/* Supm with PMLEN=7 */
+	if (!riscv_have_user_pmlen(7))
+		return;
+
+	__set_bit(RISCV_ISA_EXT_F, ext_mask);
+	__set_bit(RISCV_ISA_EXT_D, ext_mask);
+	__set_bit(RISCV_ISA_EXT_C, ext_mask);
+	__set_bit(RISCV_ISA_EXT_B, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICSR, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICNTR, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIHPM, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCIF, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCRSE, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCAMOA, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCLSM, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZA64RS, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIHINTPAUSE, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIC64B, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICBOM, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICBOP, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICBOZ, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZFHMIN, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZKT, ext_mask);
+	__set_bit(RISCV_ISA_EXT_V, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZVFHMIN, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZVBB, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZVKT, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIHINTNTL, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICOND, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIMOP, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZCMOP, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZCB, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZFA, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZAWRS, ext_mask);
+	__set_bit(RISCV_ISA_EXT_SUPM, ext_mask);
+
+	if (!bitmap_subset(ext_mask, isa, RISCV_ISA_EXT_MAX))
+		return;
+
+	set_bit(RISCV_ISA_BASE_RVA23U64, bases);
+}
+
+/*
+ * Populate the host ISA bases bitmap (riscv_isa_bases) and each
+ * hart's per-cpu isa_bases.
+ */
+static int __init riscv_init_isa_bases(void)
+{
+	int cpu;
+
+	for_each_possible_cpu(cpu)
+		riscv_set_isa_bases(hart_isa[cpu].isa_bases, hart_isa[cpu].isa);
+
+	riscv_set_isa_bases(riscv_isa_bases, NULL);
+	return 0;
+}
+
+/*
+ * Registered as subsys_initcall so it runs after
+ * core_initcall(tagged_addr_init) populates have_user_pmlen_*.
+ */
+subsys_initcall(riscv_init_isa_bases);

-- 
2.43.0

