Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954D3339705
	for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 07:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789888759; cv=none; b=rifb14MqWseuWQfiIccN77Y9bEz3ViycoGeSEdh95WKa84mfNwTC8xoppI8c9/vH4fZYhhCjT4vLwV7cfmsDcMJguGRzg4N3UmyZVVtX6bqJED90io12KDSgoSuj+ITNyzzmcIfK9NAhO7bch2lfcerqS72YYrGSfpp5RC+lWsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789888759; c=relaxed/simple;
	bh=RTL01ScSKxB6mKcKAe0HYA/5QXS4Il7ZRYxZuWsWmmY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dDvsPwvLew7xRm/2DP+4GcdmD9klLqkW1dzgWvDfMlr+aLCyl8dFy4EfjleUPgTbOamuV1C8v123B4BcVuoWBck4AwEkfeiImnvv+q+XUkrmLccNMtVht3T7fsgwxjtWocCftE9/l+v3QsS8Z7iePCuNNTz3W5am6NKURWn5538=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ic5MB7VA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ESooEXlS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ic5MB7VA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ESooEXlS"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K54jQk2455537
	for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 07:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UHFLhSSjFeK/2Qgt8PRoHcg0OoUbDpRSGGwb1qbscJE=; b=Ic5MB7VAwC36ZUUy
	bcXInZp7ieo9Xs39FShMA4Jn8xyDoivece3lPN9XccWYNIKwSIrf//vGWTrYS7aQ
	sRLjVjkR82o/wGFq8kDASk9LHbnkMDvusfdBbBPF93opeT8I5zFBRwxtJLFDkcvl
	1mJQeFyiy2QEMa7CoVLK/hZHE9868BgAgVZMy14oicWW5uVEle1iOzTT8GXpxwT5
	Vvy4pRS549EWrgegn3jvkrSJhonkSdcucdlzYAtoJcMmQfEGul89R+akhg1jIuMT
	h2bojKvPMLOZ9PjFFTq9StVz8pRDVApDQdYhA24I60YxtxvVWGBV/JQzpTxs4+TL
	FtNrBQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshbsam7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 07:19:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d6f75c1219so44765375ad.3
        for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 00:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789888756; x=1790493556; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UHFLhSSjFeK/2Qgt8PRoHcg0OoUbDpRSGGwb1qbscJE=;
        b=ESooEXlSMNFwg0TcBKF9u032FrXOh7K1T79hePu+HOPuSFF13L7DKLUMjNo2Ydh9zO
         YwAHO+c4i8PzsfsAz0gws7lZrYjbnSmpxLeatt28nKzI6ZCbGbqCdqbbDrc7alx96kBM
         /XfRow6u84Sgomwio++GRC75gz5QRb9rSy0GvIdM0gcqnd6vQBGwxXO4o/AEx2wzMum/
         Gfb+osoiY+7yUV/AIiogmfo4dXJ/TfB0pajC3NtWC937pZc5UKQpZSaqbGkdSDbtt9aX
         jVDaPab5lP4umbvH9x2Z6OrTlBWmxn2fAqZUWhedgIlhTopB1uoLhOizh9EeGktueENI
         Im2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789888756; x=1790493556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UHFLhSSjFeK/2Qgt8PRoHcg0OoUbDpRSGGwb1qbscJE=;
        b=cOmDj3lQZJrGV32Urv3CnzEMRsKbQW3Fb+/I6+AlC87rdJrEKxTHg8cCPKnKdotLt4
         yC4IWu2/i662adJiEiXHdOE3Xn4DUXz8lh2/VpRCsugSusp66NH2mHj7izj/4pt/b/mA
         JkLJ7mvT4U03i5AYrL4n9hQqtlGmkhVyBgPrQVsvTZiRGRNlbXTYOiKYAgymja1mShfB
         gQCS5idWMfaoeUp4Y5O/LYwRF9pKtC7d5PQ+G/v4bjCaPiJ2iV0tRWA8Btf73YhXgQQy
         OtBASNvx8TtMaAZmfxJaywg7YqT5fPFADAxLg2himiMggLuOUplfU1E1lByrY/06Z00g
         3ZBw==
X-Forwarded-Encrypted: i=1; AKwUvBzwjFAewZjbssVwe/yzYZilCdpjl+ekIvyB1aY7hEUqSI/9qHGzmPf+hiK31uGHMmE/WvmpIs9Ksj9inTM2ORQ=@vger.kernel.org
X-Gm-Message-State: AFuF++k8+XUc8G4uzPIjzpdYHc5+xs5EjExswCmBmpDphta6vGEesldA
	Wu1liFjCr7J9lFYnik9gWp0khIFkQ/yFvfTamQ3LpWVavSW9TX9PRfp8uaBhjOxijnPOREncgZn
	94iOR6Vvzoq7DoGlwAgh7bdfRZ2CwSMV5Rbdw9dFSobtFVbFwhQ4yN6/WuJmye+6KBZTlRJtiHj
	P18DX/8Q==
X-Gm-Gg: AYBFou1yND7mTXtwcNLZSeYQdoVh164otFUT+UxdLiial3fP1uYY8slq1S7kBGhFz/l
	TTlEsgOGEjFCkuGhtjByb778qUgxGpXaITWwjKzwsyFCzvohVpxwXUp/i7G6sEurdc2d1CdIRBW
	lQjhiD3O3MMojKJyR3EU/G27XX9N+k+UZGIG0u92yRhyzq0uubaGFtNHnWkh7ExQnMQQ/mv5vB5
	XERvDx6Q2fh5lAZLWhLfotO5pI+6nPD2JLTJvD/AQyhS0gdKY81EftSGTKVZg/trHIn85duIVc/
	dLef1dLB/eWQY3QE8j3WeXyxgeQDRvDRXP1KPYgaWmLJhXnd4b5Oyv7VKXU=
X-Received: by 2002:a17:903:2349:b0:2dd:c100:3136 with SMTP id d9443c01a7336-2ddc100317fmr57726335ad.50.1789888756046;
        Sun, 20 Sep 2026 00:19:16 -0700 (PDT)
X-Received: by 2002:a17:903:2349:b0:2dd:c100:3136 with SMTP id d9443c01a7336-2ddc100317fmr57726175ad.50.1789888755494;
        Sun, 20 Sep 2026 00:19:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df346152d7sm13908655ad.16.2026.09.20.00.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:19:15 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 03:18:24 -0400
Subject: [PATCH v8 04/11] riscv: Add Zic64b to cpufeature and hwprobe
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-rva23u64-hwprobe-v2-v8-4-5f14bc5c23d3@oss.qualcomm.com>
References: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
In-Reply-To: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org, Andy Chiu <tchiu@tenstorrent.com>,
        Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Qingwei Hu <qingwei.hu@bytedance.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5864;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=m8QTnRAVXBgeltmWje4/RsUPIbOd9dsnEyfmYwjKXH0=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqz1HScj1nvMNWr43/+7IHyl/kW3yeedt5acYbzP1TR75
 Yy9d0OqO0pZGMS4GGTFFFkOH23J3vrKJ9r3OecPmDmsTCBDGLg4BWAiRVMYGXZcv8JS/sx9udwL
 /+iFm2Pda2L1UvVr+PMWafya02rDlM/IsE70cHZU3rUfS3gUblu39HHV5b8xrRQOSGM9t2P6g2t
 u3AA=
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-GUID: L8B63eVIHl9NjbXBp0RKxk2v69ZtJRfg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfX4Tl2vqx8BFPm
 zwHwS+fCty5i8PeUR88SBMVGD9J7R+8bDxHtR2XQArlSS0p9U7+JQ2tpMQz3tlIEjvyAt4f6c7u
 NuDTriU24lPJ90kaZC9EnLpZ+KylXvAP9KKX3jpew5Hf0WXPe+wFnih5r6ZeuAQSo42v3jnkTao
 awkj6FqcXMv0BnrsmwxZeDslrs7s9incNwqBqC80a5AmwCzl69PcHewnvUS2FrTxi5pmv4xEUvq
 ui19RP0qm5n3q3zHisA/0XTsZon/Ki9YYWEp7YB4Tmtt1Pvb0AviAt/hAxOrRkKCdWQwweL9jon
 sk/gXv7u8ohcyOUMUg2ip+MNhhYvwBNyY11SZhxUc4MYC/OD8KOlRY8b+Adv8CzQjIE9V1PL0pQ
 paLL20F7KdTiRmy2k23PLQXfV56DXUToLSdXMr2DD+Qs1rJjGdY2n1wlZ/1vdQyYp8lTLaiZwqS
 TDQY3gqV1jBNwOHtHKQ==
X-Proofpoint-ORIG-GUID: L8B63eVIHl9NjbXBp0RKxk2v69ZtJRfg
X-Authority-Analysis: v=2.4 cv=bPqDs/+Z c=1 sm=1 tr=0 ts=6aaf88f4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=HwFc7jivAAAA:8
 a=968KyxNXAAAA:8 a=EUspDBNiAAAA:8 a=XYAwZIGsAAAA:8 a=fFnMLytXjIv02VNa_WYA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=kr7TZk85JJIQSqC0cl8G:22
 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfXxwPPPrp6fvmH
 440918Cp5UCrHks1VvofDoOLXJgDJCduWk2PDbZPNEfylckjbsMhVoz7vCXxSnYYe53Fgz6/NOw
 IWpMhkqcv7wk0RJvfXEKfvgLLlUQpzU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200104

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
v8: No change.
v7: No change.
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
index 69a3fc0a29b7..8454a6ae6fd1 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -427,3 +427,7 @@ * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_1`: A bitmask containing additional
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
index beb766420b5b..ef3133a52c0e 100644
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
@@ -542,6 +560,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_V, riscv_v_exts,
 					  riscv_ext_vector_float_validate),
 	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_H),
+	__RISCV_ISA_EXT_DATA_VALIDATE(zic64b, RISCV_ISA_EXT_ZIC64B, riscv_ext_zic64b_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index c03c6e08dd4d..8a38a4d37806 100644
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

