Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F15B432BDC
	for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 23:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786577731; cv=none; b=SS9gmMGuQt7AiHSpBubGTKwVwqaHfO1NL2102Q9gIWX3qbJyybMJ6edYBU0w2ScjC13bwq1/Zs76DVZqlY2pplWTUwCdO74r2lvtoykVusOFXKPOD0xRDivRBtHOhf3s6dl7oc/squUNrO7VUT6chi6oKchw7nPUjksrYRk5gHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786577731; c=relaxed/simple;
	bh=y/Jwz6FngiD2np/hHF70//LNLqWrEaqCls36uVe595s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RFKlShXCg0/FLgJnwf8SqtleZ5hEakzKXWJQE+V25ETcGWk1ZLNhSU6JaNchnaIfbo7T/4eZDiGa/EcZeVCGEYt9m2uKyqWi030u7NTDz92l1rav+MV1LPvs/kbCV67sEe1I4qi90nh2NLM5lNNjzzNDi2YEIhdSNWUkPi38Ijc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lu/ecR2t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FwVnCSln; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lu/ecR2t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FwVnCSln"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CNLSEv266006
	for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 23:35:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l+QKQ6AR1ad5oWQF1qcyBu89GPxfEiK2nPeWrXANXmw=; b=Lu/ecR2tRoKUnVui
	rNr4gsg3snH2hrB+t5TLDUas+iR5znPABm9uCvDcPIBw/KC/gEsdJOpw3E19Ca1t
	lcSAXqoS5RAxrPQUETNJjyCX9AxM+VQZWmfxFEyN2jMMmVyOCZrKAxApeV0mZlx7
	Tr4aNWu9JbChce0jfsfaJ6t5A91IET+f1DuLJyfmZ5XkeV80849yTkN2HOihi76q
	ge1A2mlWvgJWaMFubt2tKnSgnsncISTpYBmDJgQaO4qJ1T2sUE0eCOc5TJDnGT3x
	OawWXW6/e/Tm9CgY9OnTnqWKifNKUpIXE0DNvdM3qMIbX1NrYoNejzxmOpIldIqS
	nKBmTw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0mndbvs5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 23:35:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d122bbc621so44308695ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 16:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786577728; x=1787182528; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l+QKQ6AR1ad5oWQF1qcyBu89GPxfEiK2nPeWrXANXmw=;
        b=FwVnCSln/RxlC8rF1zDP5vwWMwsIWLx+LUBg4XwxDubfFn2T9DOcU8QPC1CUIdP26h
         ZAu8IR9BGwLqhvPH4d7ql7lF168PbjpUvNNE5aghXkuKVIUNHvw2rhNPdzldRFMoJ1kK
         r9H4GrvCHaKasjlsUumpyWy6D1K5lmiGPB9SfMHfQU+ZbcA8kb3CtsE3uHosk43az7jL
         OF7VDPC1SFUwGnkxwVVjuVk4vFwVOAEE2mL6zhmjUimfkKOoRf4bCdbp3JXf365cLM1R
         ia+gAwqHo2cqBaHYxSxP4XbYXI0O2XBVDasE5Z3cjgQj+LlwQNahbwJJryBBaxieUO/b
         LYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786577728; x=1787182528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l+QKQ6AR1ad5oWQF1qcyBu89GPxfEiK2nPeWrXANXmw=;
        b=DmL1A95nnefb1UDuYd3ZjhOOKqg6kZ7tSJ2gYtn49NtYVFZgEiP39nLulOiBki0M+l
         zfcQbIthwgip408ZH8tefFkGLvRrmfYnfPazAE8h0pRy2mBOXfd8N92miLlHRxGVelNi
         1BKX8hbrFcDZSuuf9GA7TARc4Z1QSAzCRmKrSod//pbnKjMawkE43vufgWL3vrM6JbkW
         RPxOpNmIC2+ES8NAup+WRZTSxHtPb18sLj7CWQsJfR/l5Ex62ey6t0rptFpdQg5azBHN
         d1vMI4dCs+yiYXkAoUnpzUXVwy70wG4vRlas9psRFTabFtJ2fwiA8tBLf3uFQ1F0j8XQ
         DuMg==
X-Forwarded-Encrypted: i=1; AHgh+RqcP7fqQ1Pn+8C3TK8R5IWyB5BR+za78mAsfOtNW2eZpQYqno97SnYNb9KMSwqqEeZOC+oiILdA6caCBo4HYFA=@vger.kernel.org
X-Gm-Message-State: AOJu0YytQMJsinZUcuuBa4NSmORhiNTWJv+J35GhKkLg0atxrZdXJXy+
	KNIXw7WeP6C6L/YKM6B+0/YT55pqgmGdiN6uITAM4ZbA3xHBfrmvztBqRUqaSPTSWHzC2bolChE
	/Oen+J54m7CkD7azs4+ia9LKEIcbSXvTtCg9ctJhuBbH3ERo52kxSv/N93Ehrn25DYX5tsyg=
X-Gm-Gg: AR+sD11TisXID49nJ/njg8fRpE5esF+LzMzsm8yVkn1gCR+RBbyNTkFz09PgiwGjEi/
	hhtzk2m8wqXb3oxo2onNXuicZpZWo2QBifpA8PfWcbXbKGCLTeG87eOhzp8ZaYSCIrZmzNu/n9A
	idE+ne911bmKSFmUsNN1ie9TxaQe1aINUwy9DjiDovvQo1h3mxuxrc6FVV3undZEnQ2WME1Zloz
	vluOHUwHBGa82AY9JMxuJaUfAfRAiu+yPiy/qfd+z0MUruRVrC+B3YlOdeOa3O/twd4dOr6oHJg
	HxzUioxJe13StAzdVTNDEfck71iz+sT51wRoZa34ewn+q1rdXtkL2DPNeAb+Xw==
X-Received: by 2002:a17:903:1b46:b0:2ca:d91d:d3a7 with SMTP id d9443c01a7336-2d37d884e0bmr18080825ad.10.1786577727487;
        Wed, 12 Aug 2026 16:35:27 -0700 (PDT)
X-Received: by 2002:a17:903:1b46:b0:2ca:d91d:d3a7 with SMTP id d9443c01a7336-2d37d884e0bmr18080215ad.10.1786577727034;
        Wed, 12 Aug 2026 16:35:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c26d0fbsm2136805ad.37.2026.08.12.16.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 16:35:26 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 19:33:50 -0400
Subject: [PATCH v6 04/11] riscv: Add Zic64b to cpufeature and hwprobe
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-rva23u64-hwprobe-v2-v6-4-c985af3256b8@oss.qualcomm.com>
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
        Qingwei Hu <qingwei.hu@bytedance.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5790;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=VLbBTWJCKZUIMQKhsVDcXNJs8R0yLJYIEevi+ZPuabY=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqxaZpEt9euvBqx2PaN+K1ff/bWVn+W3qdO3c64/ujs1m
 XeJwiPFjlIWBjEuBlkxRZbDR1uyt77yifZ9zvkDZg4rE8gQBi5OAZiI9T2GP7x7358L12+y0d6e
 KL3yw9Ts6gWchaYzrgXP0A5y6UpctoDhf86Bkrmu1pVW+XWeP5uyeNKDhSYr/nrwvdCp6dmRHZN
 YWQE=
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfX3xoBmNAnyuuz
 1LEK4iOx112q/xsFpyML2wps29T9YojAGTTrJNqTWISd+H4L/gNaRFSeUVSNhxVFjzg0cwIZ4XU
 RwTcNo05/kLAS0Cc4ltzQyDlbuvbCV0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfX+5IpBWgL0Tcb
 LYw4Yk/B8C3VSEuYENhiwxgMvAl+GUOMLeo+yXnB6o17wJ+ia6ChCVUP3cGHeUqTMR7q5WKmEae
 mtP5St9lI2iyuwi3rmNQNFu6V57Ko4nom61JS+bRMcd5ekFz31pr9q+jj5CEdPFE8kmsOvJApSf
 dtm8N5yHgxkoH/tWiqx3D+87DoGnlwn9yWnuCVwEnoxsGJbtZhlYHCc7FArhkOGw/DZ8SMaBu4B
 aDyz+kKh7mJPGkQBsvhrL7734ixOIZYH6Aw29yQjkJo7kw3A2StfQAn2QupVTvX9NahrUH0R+C9
 GtTOAA024+ONZSsFN5u+Q8/c2wxabNVaWNwCLvSzxKgvSamoNEFwOtw0l2PepK7F64LLq4y6f8D
 q+1MLozIS6Ti2/8GDQoNxGjbV02H0z+EvPbbyWahd2zRm7gf9WU6tIonu1UQCHZ4N3DIdftI9ov
 aaZZZ9RWuOKtbm9elMw==
X-Proofpoint-GUID: DETa3eI_bvpwznBQbWK1qSbylMafwBO6
X-Authority-Analysis: v=2.4 cv=C87ZDwP+ c=1 sm=1 tr=0 ts=6a7d0340 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=HwFc7jivAAAA:8
 a=968KyxNXAAAA:8 a=EUspDBNiAAAA:8 a=XYAwZIGsAAAA:8 a=fFnMLytXjIv02VNa_WYA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=kr7TZk85JJIQSqC0cl8G:22
 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-ORIG-GUID: DETa3eI_bvpwznBQbWK1qSbylMafwBO6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120190

From: Qingwei Hu <qingwei.hu@bytedance.com>

Zic64b mandates 64-byte naturally aligned cache blocks and is a
mandatory extension of the RVA22 and RVA23 profiles.  Allocate a
RISCV_ISA_EXT_ZIC64B id, parse "zic64b" from the ISA string with a
validate callback that requires each cbom/cbop/cboz cache block size to
be 64 bytes when it is present, and export it through hwprobe.

Link: https://lists.riscv.org/g/tech-unprivileged/topic/question_about_zic64b_and/119631059
Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
Co-developed-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v6: Rebase onto riscv/for-next: RISCV_ISA_EXT_ZIC64B renumbered 110
    to 116; RISCV_HWPROBE_EXT_ZIC64B now uses the _BITULL() style of
    commit 8da45c93dfa9.
v5:
- Collected Reviewed-by from Andrew Jones and Conor Dooley.
v4:
- Credit Qingwei Hu's earlier Zic64b cpufeature patch: set him as
  author, with Co-developed-by (Guodong Xu).
- Validate only the cbom/cbop/cboz block sizes that are present; Zic64b
  does not imply the CMO extensions (Conor, Qingwei, Greg).
- Add a Link: to Greg's confirmation on the tech-unprivileged list.
- Add the missing blank line before the ZIC64B hwprobe.rst entry
  (Andrew).
- Did not carry Andrew Jones's v3 Reviewed-by: the validation was
  rewritten (present block sizes only) and the patch is now authored by
  Qingwei, so it warrants a fresh review.
v3: New patch.
---
 Documentation/arch/riscv/hwprobe.rst  |  4 ++++
 arch/riscv/include/asm/hwcap.h        |  1 +
 arch/riscv/include/uapi/asm/hwprobe.h |  1 +
 arch/riscv/kernel/cpufeature.c        | 19 +++++++++++++++++++
 arch/riscv/kernel/sys_hwprobe.c       |  1 +
 5 files changed, 26 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index fc68dea397aa..32a14331eb9d 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -425,3 +425,7 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_B`: The B extension is supported, as defined
     in version 1.0 of the Bit-Manipulation ISA extensions, and implies the
     presence of the Zba, Zbb, and Zbs sub-extensions.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZIC64B`: The Zic64b extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 6a693210b251..b103aaeafa47 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -123,6 +123,7 @@
 #define RISCV_ISA_EXT_ZICCAMOA		113
 #define RISCV_ISA_EXT_ZICCIF		114
 #define RISCV_ISA_EXT_ZA64RS		115
+#define RISCV_ISA_EXT_ZIC64B		116
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9323feb7c3c8..9a121ee3b436 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -123,6 +123,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZICCRSE	_BITULL(4)
 #define		RISCV_HWPROBE_EXT_ZA64RS	_BITULL(5)
 #define		RISCV_HWPROBE_EXT_B		_BITULL(6)
+#define		RISCV_HWPROBE_EXT_ZIC64B	_BITULL(7)
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 7f615d1a175b..de7cff5f48c3 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -136,6 +136,24 @@ static int riscv_ext_zicbop_validate(const struct riscv_isa_ext_data *data,
 	return 0;
 }
 
+static int riscv_ext_zic64b_validate(const struct riscv_isa_ext_data *data,
+				     const unsigned long *isa_bitmap)
+{
+	/*
+	 * Zic64b mandates 64-byte naturally aligned cache blocks; cross-check the
+	 * cbom/cbop/cboz block-size (when declared) device-tree properties to
+	 * avoid inconsistency.
+	 */
+	if ((riscv_cbom_block_size && riscv_cbom_block_size != 64) ||
+	    (riscv_cbop_block_size && riscv_cbop_block_size != 64) ||
+	    (riscv_cboz_block_size && riscv_cboz_block_size != 64)) {
+		pr_err("Zic64b detected in ISA string, disabling as a CBO block size is not 64 bytes\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int riscv_ext_f_validate(const struct riscv_isa_ext_data *data,
 				const unsigned long *isa_bitmap)
 {
@@ -529,6 +547,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_V, riscv_v_exts,
 					  riscv_ext_vector_float_validate),
 	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_H),
+	__RISCV_ISA_EXT_DATA_VALIDATE(zic64b, RISCV_ISA_EXT_ZIC64B, riscv_ext_zic64b_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 12ea4f39a838..656cb100ac48 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -208,6 +208,7 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 		EXT_KEY(isainfo->isa, ZICCRSE, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZA64RS, pair->value, missing);
 		EXT_KEY(isainfo->isa, B, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZIC64B, pair->value, missing);
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */

-- 
2.43.0

