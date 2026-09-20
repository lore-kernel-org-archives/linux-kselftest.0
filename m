Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA5D339705
	for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 07:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789888774; cv=none; b=YYsoOdQ8x0UlEfoswSHB1fI+n0V1YzIgyw4ARB/0zbM4akywSJu0mM4r9se10WgIieIcjhtWdJjgeJAHVf8v41TAT8zSkwnvnyRiqKPImGjn1J74XK2g1RL0B+8vkFgjlpiyNGAUfU6t3aRQFCJfOd+Rm6klp5n/eFWg+PrH89A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789888774; c=relaxed/simple;
	bh=YYD74UtA+DelEPlwGAzBwsYWe8O/Pf/6bUWqgq2TZPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YWa1sD0g83UrRqgdDRlYBbecMFXLVMn1Gpfno0Z3JyGVIZf8Km/dh2vtm8KGws54tMLr4/rqowxnLDHmvmQpEi9071iGNzy/XGbefNiz2MZ2+O45n67T2pmKdhrX6BxBKL8MFYd3yjCpntsqAEY0MDqBLol2EBt4vObUUUol+iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JY224VDE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TCTmNBsU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JY224VDE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TCTmNBsU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K54rTU760269
	for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 07:19:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L+XOeEId889ChF2UXia1L6t4JocTzhDIzeshaUCOA8c=; b=JY224VDEr1cSU/7r
	z5xSuSShTXnROIDs3dltEVXieCpkxznw1P2wLbAVwZ9yo3OvOKqY5lE2rW8lzi0r
	XGdRdEAbgis83jXNR1w8417squKpFuJn20GX+4xuAgX+8dbEZgwSnrx1ehXKgSl7
	CNwydKlllrTRd0ReKIBSdkmzQ2Wb/wLdi7h7NGW5orShyVOeevKZ29pkQIG3y5Os
	S/6wb9xgNAQJNgJQpLfBfBBGczGjWWIhMPMxUNI1MgtwGdbYCAnM4tzz+cMDb7cD
	bQqPYBgxw3FiJZgI6/lqvlLSnija+yT4K7l9CUji94PyYjf3x0gpEfM2LGurqrdP
	Hmo7/g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gskp9taye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 07:19:31 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2db3b126c9fso28434915ad.0
        for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 00:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789888771; x=1790493571; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L+XOeEId889ChF2UXia1L6t4JocTzhDIzeshaUCOA8c=;
        b=TCTmNBsUcZ32HeCb/X8tMM/ownqvR98QeMkBYAZMbWdMq7H4xKLkKETEp/ZdHBTSDA
         knJY4DKDtdUqT8S0a6299ApjPonksGlaAjo4Sl5VqL/7yA/8lkM1tXdtf6KvhJjsKQvG
         C5TzSP9tFVhFbKrTD7pJI+FWNv7jKGN+UQfJT4nDIy2hdtovTk8aITQX9gbMB8HgoEqT
         jLWKmuQC2249HHB6+6nyNDvp5rgaS/3HyxOUG0vmNSqN7KkXYcqUJC1hF7aVG/Aj7e1R
         X9uAZ7j+V7kE0q3eUQWUgDwN6jmjbNKcXAnEwpizd1m1cMwOjCTQnf2htKMNj4Uujb9N
         LzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789888771; x=1790493571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L+XOeEId889ChF2UXia1L6t4JocTzhDIzeshaUCOA8c=;
        b=aO5pjLIlohxlztMm2rXCQKsN7exLbIiMpz5RYUMXZTSxsBT/BMsrk4f5OuG+D/dUWk
         WUd7wR63qQPXmoDH/K0f05Tw0f9UrdyFk4FqkiTWvzPxpj/mIkvy79oikg5dQP6tLPmk
         SFYdc8oTAxzIpUi2aIi5Me+4C9q4WZLKMPZjkuMlJ5BwlKLlD0ZbLfIR8gaWvjGubWY8
         a59INPLQfkT0QzzmimBiG2bZe0dTkotosCYihoQHPNv7W+L10DKspXh+qwDc1qlJyLT5
         4UdKKhZ83BQndLHZP/MTXCNYF4n+I4gwIDNNy8bYouze0knlocdMh8k9RVs6fW99wzzP
         I4uA==
X-Forwarded-Encrypted: i=1; AKwUvBzOtdDytSD9SSVvrESwm0vXf1KNP4+rqpnruoxwQ+FDisLAbidhngU653y3AKMdwsRzBI8amTa49Q5RpXEJkbs=@vger.kernel.org
X-Gm-Message-State: AFuF++mmE1Tyzq+nP0dhb6onJb20NYx4zqck/O3dIG9giASOUpjS634R
	AwnXD6+mhn1SdrzekF35fZ5eneQKGK+PDt4aeGzgXfKenNmjY/2L8mFc0hSkD+kiW6Bp2J4mY6R
	hY966sJsdklHU5wkTdGsG5jc7yoIZLORBGgaAr2HJo9LDGmBst+gduOLmc+okokIbklioBeOHsu
	bdBA8G6A==
X-Gm-Gg: AYBFou1zpMpZADRgmZRl0rr6HL901az9NpFOEesYDPJcNsO0L3QNNCFj4/Z5MpeeDF+
	OldL3rcce0w2APenxvE/qXKGXqnOAOwmoRdz+5tJQIcgPuX9EqnoqvtVN0w32cvOHl0hXjxMJxk
	0j1Cuv5vdJcmu5Mq465QZostkNqDqxMGnpuw/I0xaEYW46G7M/UWQ6ZvXWgWxk2mXhpwVRAa1CA
	Vml1xUNPK6RMT+houFbE4bOzFSnj6XP+PkArWuwAW60gAFgDhMbFVmPpecFy9N2d7K3iwqxoFF8
	c+KO5di6sZvnzPPotG++OIytN+7kooOkFiIO7n6MEf4FoEN5BcOL2rXQgGo=
X-Received: by 2002:a17:903:1b45:b0:2bf:7b62:a038 with SMTP id d9443c01a7336-2ddb1adedf1mr129828325ad.9.1789888770995;
        Sun, 20 Sep 2026 00:19:30 -0700 (PDT)
X-Received: by 2002:a17:903:1b45:b0:2bf:7b62:a038 with SMTP id d9443c01a7336-2ddb1adedf1mr129827985ad.9.1789888770477;
        Sun, 20 Sep 2026 00:19:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df346152d7sm13908655ad.16.2026.09.20.00.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:19:29 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 03:18:26 -0400
Subject: [PATCH v8 06/11] riscv: dts: spacemit: k1: Add Zic64b ISA
 extension
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-rva23u64-hwprobe-v2-v8-6-5f14bc5c23d3@oss.qualcomm.com>
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
        Guodong Xu <guodong.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=10183;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=YYD74UtA+DelEPlwGAzBwsYWe8O/Pf/6bUWqgq2TZPc=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqz1HSd7ex8v63jyQWa+UVzij/fiRxMijaZOLp8Z9qv49
 +2aST73OkpZGMS4GGTFFFkOH23J3vrKJ9r3OecPmDmsTCBDGLg4BWAiF4UY/udPqiic/479b3+h
 yZy5fPo5pp2/HjAsPHJj5cForrQ9dkkM/wyj7c9cCmarO6XyuqRY103wvU6Y4ERuU66+07MuSQZ
 85AYA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-ORIG-GUID: 6CKbu731buHhttBdInEHbwNS1xkifO3j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfXxSh/Rpk8iOhL
 06v58rh1LLHB8RK9aH7pjJfd6Fig135MWPAzOM6Ejyq6E596IsNeg6+wLsrFg81ePkk1Qlnxyfm
 QQMiPbbrDd+1P48jh1QhHweP6HKP0Kb01BekhznPJC52hSo8HC7zPVGmrJehKHUYdqBla4r9oSN
 zY09BzJEcGpwphyDddqBhqPwQXYUrh6ROAu4gBtryzAAcA1VYVDjRkP57i7CeAAuMDIpFke58O9
 U76T2xly9URE/MGaQ1pUa/YH/b0GG/f4sR9tnKIQuL9hexPbCyHbn8bEHkwd53LvcwcsIHKvQsx
 zAT/xcWBRKfPj5X9+o1Cl0iSaeerK81BQAfraYJfn2ORZn6MrbGFZuvW/Drb1LAF5W0xz1nr3Gh
 atdg8S3vuCwAOJw1PkdfoF7khi/+u51+6zK1QDYWtJl1djyPEhmOiLudQcf0xJj3S03KkPbr44S
 ZJet7ihV217yWbbEI4w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEwNCBTYWx0ZWRfX7kM7qFUVtRc5
 taLIUVJt42OsZVATsqDHPP/DHu8cw1zueE9w1+ledU6lnH8hV9E4dqNhKsotaVUb/u2hQaSep85
 R4CWqscy6WBqcqJrc3X/NX4RXR5aslE=
X-Authority-Analysis: v=2.4 cv=BKAmP1QG c=1 sm=1 tr=0 ts=6aaf8903 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=tnVZVcqGRelvdznDbj8A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 6CKbu731buHhttBdInEHbwNS1xkifO3j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200104

The K1 X60 cores have 64-byte cache blocks, described by their
cbom/cbop/cboz-block-size of 64, so they implement Zic64b.  Declare it in
each core's riscv,isa-extensions and in the deprecated riscv,isa string.

Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v8: No change.
v7: No change.
v6: No change.
v5: No change.
v4: No change.
v3: New patch.
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 80 ++++++++++++++++++------------------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 3fabfd34114b..542bfc0d19f5 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -57,12 +57,12 @@ cpu_0: cpu@0 {
 			device_type = "cpu";
 			reg = <0>;
 			clocks = <&syscon_apmu CLK_CPU_C0_CORE>;
-			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
-					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
-					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
-					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zic64b",
+					       "zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+					       "zicsr", "zifencei", "zihintpause", "zihpm", "zfh",
+					       "zba", "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
 					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
 			riscv,cbom-block-size = <64>;
 			riscv,cbop-block-size = <64>;
@@ -88,12 +88,12 @@ cpu_1: cpu@1 {
 			device_type = "cpu";
 			reg = <1>;
 			clocks = <&syscon_apmu CLK_CPU_C0_CORE>;
-			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
-					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
-					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
-					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zic64b",
+					       "zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+					       "zicsr", "zifencei", "zihintpause", "zihpm", "zfh",
+					       "zba", "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
 					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
 			riscv,cbom-block-size = <64>;
 			riscv,cbop-block-size = <64>;
@@ -119,12 +119,12 @@ cpu_2: cpu@2 {
 			device_type = "cpu";
 			reg = <2>;
 			clocks = <&syscon_apmu CLK_CPU_C0_CORE>;
-			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
-					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
-					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
-					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zic64b",
+					       "zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+					       "zicsr", "zifencei", "zihintpause", "zihpm", "zfh",
+					       "zba", "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
 					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
 			riscv,cbom-block-size = <64>;
 			riscv,cbop-block-size = <64>;
@@ -150,12 +150,12 @@ cpu_3: cpu@3 {
 			device_type = "cpu";
 			reg = <3>;
 			clocks = <&syscon_apmu CLK_CPU_C0_CORE>;
-			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
-					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
-					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
-					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zic64b",
+					       "zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+					       "zicsr", "zifencei", "zihintpause", "zihpm", "zfh",
+					       "zba", "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
 					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
 			riscv,cbom-block-size = <64>;
 			riscv,cbop-block-size = <64>;
@@ -181,12 +181,12 @@ cpu_4: cpu@4 {
 			device_type = "cpu";
 			reg = <4>;
 			clocks = <&syscon_apmu CLK_CPU_C1_CORE>;
-			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
-					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
-					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
-					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zic64b",
+					       "zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+					       "zicsr", "zifencei", "zihintpause", "zihpm", "zfh",
+					       "zba", "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
 					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
 			riscv,cbom-block-size = <64>;
 			riscv,cbop-block-size = <64>;
@@ -212,12 +212,12 @@ cpu_5: cpu@5 {
 			device_type = "cpu";
 			reg = <5>;
 			clocks = <&syscon_apmu CLK_CPU_C1_CORE>;
-			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
-					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
-					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
-					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zic64b",
+					       "zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+					       "zicsr", "zifencei", "zihintpause", "zihpm", "zfh",
+					       "zba", "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
 					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
 			riscv,cbom-block-size = <64>;
 			riscv,cbop-block-size = <64>;
@@ -243,12 +243,12 @@ cpu_6: cpu@6 {
 			device_type = "cpu";
 			reg = <6>;
 			clocks = <&syscon_apmu CLK_CPU_C1_CORE>;
-			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
-					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
-					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
-					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zic64b",
+					       "zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+					       "zicsr", "zifencei", "zihintpause", "zihpm", "zfh",
+					       "zba", "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
 					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
 			riscv,cbom-block-size = <64>;
 			riscv,cbop-block-size = <64>;
@@ -274,12 +274,12 @@ cpu_7: cpu@7 {
 			device_type = "cpu";
 			reg = <7>;
 			clocks = <&syscon_apmu CLK_CPU_C1_CORE>;
-			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
-					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
-					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
-					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zic64b",
+					       "zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+					       "zicsr", "zifencei", "zihintpause", "zihpm", "zfh",
+					       "zba", "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
 					       "sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
 			riscv,cbom-block-size = <64>;
 			riscv,cbop-block-size = <64>;

-- 
2.43.0

