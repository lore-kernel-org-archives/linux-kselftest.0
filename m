Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751B2463B98
	for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 07:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456647; cv=none; b=EnsMGaOzZ39tYR7/Td0OeZvsiYVW69egswIFahiBYBtwd4FaMq5Y64VnYtb7WYXq6Aol8mcDQOhETjSx2zlFU951bDpwntv9VnE5gVNbLqVfo0SZ2b/H6P8H2j0U8Lpu6+iiOXQK2x5iGQhyVloKn1lZ/3XTvKPE96NKU03NLT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456647; c=relaxed/simple;
	bh=kukhi/WZWswDj0RguMnTyGaUm1wiOQMTwL4qZT9oHT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VrUqQPb0JyclN8dtRxmzrTce24mGllsvHrRdL0BiFObghzj+iM7lBm+fvd86IPmGD2Y5KQNpAsRMBTG/Kgp+uokZB9uKCNZXzsSDZLovWDkvQ8m04qzhkUqNtKTiVpWNwJS5CMjl5mKELMxWCSOgMAvfrM8p59Pn6Cd+lqCES7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=izyFaTsp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M/57NKQJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="izyFaTsp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M/57NKQJ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Zf6J3126448
	for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 07:17:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yLaRf5MNT6bdfuQJzz0+hxaTdxUHjMAv6d0xpyWSYCo=; b=izyFaTspFQkNFXi9
	dw0DL/rx7ZAfUbaRUECkHMm3rNOX4BlZzrNk/6RUE5fPrUmQ1WxVkxfeuFaHLMqR
	wbrzpMg0+OH0+S0gUTJyJEYpp9KwPvKg0gIOotDUn7B7vcDs0j4+EtYw5gSYERlr
	vB/ZSxokxxXP2K0ZPwTT/CmPx4U5KGwZLcXdb7Zwe0tlIRc/Ig6zVXHhZfGAklU4
	0rC1kAxsq7bVL59qteRPtXkl2RQKLe/cx4dOrLPXkfoopqVsU1NdJnjI56jCxMWG
	j/1OWL08HNumdXlIGblNANDdjgBSJ4OSLwUv8aQjPIjcCOOOgMAA9V7ahKXB3bWJ
	SWqZpg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpmx9u20m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 07:17:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso4226020a91.1
        for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 00:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789456643; x=1790061443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yLaRf5MNT6bdfuQJzz0+hxaTdxUHjMAv6d0xpyWSYCo=;
        b=M/57NKQJjOzLYmk92LWn2YErmLkhOC9Cafx1dgqf1UtsATGAysvYsVF5B6e2Cn/WXS
         dHJQmL+gl1KfEFNba+hsLQFT97mYxNdiVEpP5Kutn1Z/ri6xX6p17M9uZSYKpKYBJtHT
         aSL0Y32xvrq4XRIVejFiuLDodkYwVGkgReN783EDahMgJujRJ6HSTz/ot3xaPN7lMLUo
         za7ABaI6Q4lep8k+mal28TfLBzdW38OVty0ykFQc7KPK31o3IN/Q7UJn18Qn+dzVUcWf
         eOsjD4L70E3BB+PRSVKp2cIS908+J0WeeRfpAgbbuyoQgCJV4hH1yRsiKOExGipksx+l
         q44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456643; x=1790061443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yLaRf5MNT6bdfuQJzz0+hxaTdxUHjMAv6d0xpyWSYCo=;
        b=XemBWCp3fnxFjd/covRL88yUU73R7sjk7kpFlEWbxUvgB2FxOsei28yCOKdx49BRz+
         0KlIEx4Iey4ij+bvjVwh6WnA8O8JWtzv4FGsxbCEVzqVVR+h+xOo5G0kHyVaCVDA7shd
         9OalmxCNMR9hKKs6AXEpxIAiMr810SNKDQ8TmdsYvkLqfb8KmepQIGdXC25bbiuRn/rX
         p49jYHlw9aqLAbw6p+HXcBLKU1BwLXfZa3neQ1Qr0NOas8p4nyeF/67jon/KWikl38ql
         jAhmQ+1k6PkDs3XgyutGZtbRoJSzMjpjO8wMdvIwRf0BScUZGSvvRhNGL5vbUVQL5slX
         zsBQ==
X-Forwarded-Encrypted: i=1; AKwUvBytjGD/CdTffvpNfTVDSKh0V7DYhx2lg1HJWfRptQoQWM0nZi9dwmJLm3dajMcNyeUuGMVJFbvbn8g6ch0he04=@vger.kernel.org
X-Gm-Message-State: AFuF++nU3XqG+d8FO1EW5KNfFKiSihtbqOL8MNWEEArwELpRzzU5nSy3
	KvR20x12vBvVY1wmtyKdeHEEn0Zt8sCEHR2MMOw24qP6i0lqOHxU/YtdqqIFVGRZlO4xftvF+P5
	JN3uPos9J/2nTOK9U/DgJxulBR+awZVo1sGqsGG12gs6tZfN1xnwdQuDtU8NnfG0K/5Iyyx0=
X-Gm-Gg: AYBFou3r5L13KS1yKscQZh5FHeZ84yUOXs/ND6p9z6iKL3BCScswlSPUlLliu1IOn3y
	1y/W03lAlxw2sCivc8QT88RNnPtZW08w1E4XvplPCgP3+Y/SyqYCwKerPsAzxpco8GohVSBI7t/
	v/3Jc06jMzb2W4vlClvEfHfTErKK2PavdBzZLlPgid+BggjtIISgwJdS4reawcF8q5PDvZXBbyD
	xxWH2H8dvyBwqnvaWwqsu8OKEjTcMFulwbuFYjDArMM3iKtkOHJV6aaGX7Y9QMGGnmID+/opFXk
	lreR+WWHzrBByGmGlLeT+Fcm0RlcChh79V5uJ8WEQg5zaJ7BJf1+E4snjB7F
X-Received: by 2002:a17:90b:4f45:b0:37d:f983:7b5 with SMTP id 98e67ed59e1d1-39debf925c1mr11925818a91.9.1789456643033;
        Tue, 15 Sep 2026 00:17:23 -0700 (PDT)
X-Received: by 2002:a17:90b:4f45:b0:37d:f983:7b5 with SMTP id 98e67ed59e1d1-39debf925c1mr11925727a91.9.1789456642507;
        Tue, 15 Sep 2026 00:17:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdaccc0fsm3447120a91.15.2026.09.15.00.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:17:22 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:15:34 -0400
Subject: [PATCH v7 08/11] riscv: Add a getter for user PMLEN support
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rva23u64-hwprobe-v2-v7-8-aa35ebd9ae96@oss.qualcomm.com>
References: <20260915-rva23u64-hwprobe-v2-v7-0-aa35ebd9ae96@oss.qualcomm.com>
In-Reply-To: <20260915-rva23u64-hwprobe-v2-v7-0-aa35ebd9ae96@oss.qualcomm.com>
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
        linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
        Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1982;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=rqiM95uXML2sMynfTJbBvcXeaGjmecCzWZWIwJqroOo=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqwVH7bOfaP34dHv5gAH59qrglKXfygfk51TXp0uM+PCl
 xc5tixMHaUsDGJcDLJiiiyHj7Zkb33lE+37nPMHzBxWJpAhDFycAjCR82mMDBc+l8+0+eBeGXT0
 o8WDvP1zkoPFOBbPUplaee/kt9OaLKcZGeb6PmSvmKhW+jl0w9p9hvfVNvX9YmiPDKvpvHbO7ne
 WMzcA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Authority-Analysis: v=2.4 cv=G+KJgNk5 c=1 sm=1 tr=0 ts=6aa8f104 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=A_72rIs-Kagud5g8OzcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfXx/KfJXbsMmTh
 cx08iRCIuK3Za7Es3hX7La5+z3xz6PI4VGGfpzVwdrKZA+Y+i+k3PSOp/ntMPLKMGjAdYGvB9+4
 kqPJxsQInVQ0oLi0/UBPVix2ACMKKSK+nowhvQfsohsIBYZdUZwXdLtJs93z09f0ityuw8c2Tir
 NT/aBRVAhmsfL8ILtz9pKgkxMQGkaqp6lmf65MH3UmYmGkHdeAd5G14YqLGgIZ7s4VmNUuD1Lpz
 cVHxc1avdMciGg5XRBv71QC9NvnwhgOJ+bLtbywXT7Ibdln9mGocPU2A+MbxVMBRl5XVj4GZ2dF
 0tNHd8MCleDSjhUDNpj8GUCLskDpSobgP0iFW0bpfs3Z77+jzYhWj+LWXShN0ALWyJUMk/EZeQo
 mDSL34ksKBqIPFVzGQRi2+AKe4H20ku22NZ2AVINHpFY8YxDFq0UGQNVssrqFOQkH10zsoiWw76
 nm4MI4EIOBGdMsec9NA==
X-Proofpoint-GUID: E63wRuVVGtrtwR1JSltluX9EB69LRxgx
X-Proofpoint-ORIG-GUID: E63wRuVVGtrtwR1JSltluX9EB69LRxgx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX32CDlNuFW0Ax
 hsPFKNdhGxIN6xY1GSnmzJMwGvXtC7I8eMV22qssUzAWCdhqfXBUccDZov/U7cLv0L2UMYEKQ3P
 ieBEh9DGx4sCa1caZBcv0D4ab198pw4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150102

From: Andrew Jones <andrew.jones@oss.qualcomm.com>

Querying whether a given user PMLEN is supported is needed for
RVA23U64 base detection from outside arch/riscv/kernel/process.c.
Add riscv_have_user_pmlen() to expose this.

Link: https://lore.kernel.org/linux-riscv/rfuwa7a3ebe76udmnwyrssjy7shkkgxntvhwzn6oquysj4tuyp@xzvpylcfhz53/
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
[Guodong: replace exported booleans with getter per Andrew's suggestion]
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v7: No change.
v6: No change.
v5: No change.
v4: No change.
v3: No change.
v2: Add a getter for user PMLEN.
---
 arch/riscv/include/asm/processor.h |  4 ++++
 arch/riscv/kernel/process.c        | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 49a386d74cd3f..da9089695ed6a 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -217,6 +217,10 @@ long set_tagged_addr_ctrl(struct task_struct *task, unsigned long arg);
 long get_tagged_addr_ctrl(struct task_struct *task);
 #define SET_TAGGED_ADDR_CTRL(arg)	set_tagged_addr_ctrl(current, arg)
 #define GET_TAGGED_ADDR_CTRL()		get_tagged_addr_ctrl(current)
+
+bool riscv_have_user_pmlen(u8 len);
+#else
+static inline bool riscv_have_user_pmlen(u8 len) { return false; }
 #endif
 
 #endif /* __ASSEMBLER__ */
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index b2df7f72241a5..5d9cb108a6232 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -302,6 +302,18 @@ enum {
 static bool have_user_pmlen_7;
 static bool have_user_pmlen_16;
 
+bool riscv_have_user_pmlen(u8 len)
+{
+	switch (len) {
+	case PMLEN_7:
+		return have_user_pmlen_7;
+	case PMLEN_16:
+		return have_user_pmlen_16;
+	default:
+		return false;
+	}
+}
+
 /*
  * Control the relaxed ABI allowing tagged user addresses into the kernel.
  */

-- 
2.43.0

