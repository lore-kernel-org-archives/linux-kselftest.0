Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AC9430CDC
	for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 23:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786577708; cv=none; b=D3+tSryQQM4K9cHx/IWmnnUo2kwk/yDGuUwIhFde7yN+I4wrY50p74A0I/QWPa9yE/RcUtCz1a/icRiyHUzujMitlobwhseMqDscsBsXE3N1NIA/waF1dioC71WggbWTzz8ZmpLaNf2v6YuSG1aMA66AZOCdZ0XZLaaTiMD8wgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786577708; c=relaxed/simple;
	bh=epWD3GI5NSTdvxKQFtX0RjuSeFso8FOJjXgRZBp47Cs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=usAtXGa0NxnGMOE1gYkZ0OCAHv98wMS08V27ABJ9ZPCMjk7ik+aqj/4kOCxQLSV3t1+y67XCKPuwjrr5m2EhFG/IBuHJj5WYF1rR7kAZ3OJYrpSFceavejcAQi6N53ZPoZaxiTgb5UbgyAbZVjdCj+SMtsMyvbD1EfH+rleeGQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XgbmcE3k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nkr8YsTH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XgbmcE3k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nkr8YsTH"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CNLrqc1373552
	for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 23:35:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VZukauZ47HvJdFZVxc8ahLUx1GK6vy1JZjQTVnh97zM=; b=XgbmcE3kmno2yVF5
	OgDlpziUjgc2s4Pnux/+xI+pw/fBuzSZu+e7STF67ioRB/qhciNp89BKWw1j7XnQ
	Is8JgiAsfN3doF7VqWM/3tvFWf0LwrxLk9xhkMshI9f6WfGLqm4GiuAgR4iKydFd
	vYqmKlk0o3yoE42CTrUx6I5dG7Bb8F+VsS2ijs4xFElW+mN+olEftCbm+QjHj7Yd
	nJF8lNdq797/6Il32defJqQ52pdBu2wZClXzGrpD/ohFhf00Myazxu6pjKYpGJvS
	31LMCAmnEQrs0LNe1hsKnBNfnLpTBYaSRv5mWRSZ5EosnsDYJdDZFeme+1x/un/7
	loyPKA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0nuckkud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 23:35:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfa55c9430so18086375ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 16:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786577704; x=1787182504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VZukauZ47HvJdFZVxc8ahLUx1GK6vy1JZjQTVnh97zM=;
        b=Nkr8YsTHPbupZYZ/lvZErfUNhCP5iMhuOti1bm8XpIv1N7vO2xaGTMxbYKfnS2a8oI
         GMmeo9Dz8guBHRtPZ5p2I3HOjbXS7HQd5V5iUJ6RTAcD4kDqruOLMnC0uZ6HzjaoDacA
         FnrXDftGACncEsJiCzakCGiRhqiRn7Nh68DebE/LVsL/eaEiFRkUsPwkMOugheCrCyYI
         PXCm4uTnGgQCSvIH5i4hso2JbdxA85mcUccQgC1ePvkoHEzIIb72bOW1Go9FXdkZcYwX
         Y8Yz9650AXpctYpDKTSN5ZPyGaS+4K3nBmGyvGXaE878GFbkr5lSldTkkCAbf/vfKRL1
         QU4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786577704; x=1787182504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VZukauZ47HvJdFZVxc8ahLUx1GK6vy1JZjQTVnh97zM=;
        b=Xg7QWgD/dNo40IqAudJKlz0pUv9BWIy9qIYAZKyTYJmom7wEj6H28t08Nd6UmnnSpF
         DqLpDcSBY1Aa5GWoZYoStgH7UwUrSOqChpDB1rJHZlDbk98QzLOKdT8d8qyBYetLjQEL
         XiPHJjK5d3PajAqbn0jL2M/+oRViwCLbU6zvuouSKGVedTOdKUJ8VzukqdzsDTINjl96
         4EuU4+B7reMNiYW67fwMZUa2hangZ2cYufCoBBLy78VGktA3mmY/SISa+YE73IFxocDn
         nJPc4EPZsJzzqldI1Qw5YaWskex0wB/yTTk9En2rKxWt/uRccjszNYq8OsemEg1EC+lo
         vDAw==
X-Forwarded-Encrypted: i=1; AHgh+RrSEOZbREXQQsxUlzjoJFS6Ppzp0dPmHGCCU/HqG/WRestp81tpUZpGDyXPJ0XlPQ3p5Q3J0ClPYfdL3srxRDM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRwCn1CbYoGxuMME8rWroVUfCKHrsmN4oOEVmMeCh6lv3tamVQ
	x0QLwiYF3kCTUNr1pqkX+Sxk5TmDiEEhHoDtyu3CHrf3xg+73mf0K+lhg+T5lM6ik9U4brjsMMH
	aoGEB30ETshY1cSapRsu3wZFMNsXV2fNtAT0xUMtuwVnRnsVoW9VaSCwbInlRrh5GftgXQRk=
X-Gm-Gg: AR+sD10m6EIeN2HjpIYNjWRUbd7qgGBI0mdzS4Q3j2bZt/3Mbz6GbDKi6Ezl90jEVtq
	klX+zoQDu7QMlpKy5btpjcBchXa1sRNNNDex7IyreaYI2wBz4I0O71UVsmmu62ft10doD/DWtMA
	sHDeXTfWTUEhgaN9KNy0OMmqtUYsBO/M24cuh/VvBe7GTvDrG7AehkixPxoYvAqfkSrY5NKgIRj
	247SN+MTySlpaMt2D4+dIy6x/0K1gfVnq2+a3TK5+PcBgmvctmZJBNsoLSMTiZM+o7b5fSMMcQM
	lSRE3dwfNbYri06xMENKFBjI5aa7zB7fBgzdUbMX1mrMFoxD/VmHcVSyZ16ObQ==
X-Received: by 2002:a17:902:ccd0:b0:2bf:7b62:a038 with SMTP id d9443c01a7336-2d37d885316mr17937175ad.9.1786577703770;
        Wed, 12 Aug 2026 16:35:03 -0700 (PDT)
X-Received: by 2002:a17:902:ccd0:b0:2bf:7b62:a038 with SMTP id d9443c01a7336-2d37d885316mr17936685ad.9.1786577703298;
        Wed, 12 Aug 2026 16:35:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c26d0fbsm2136805ad.37.2026.08.12.16.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 16:35:02 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 19:33:47 -0400
Subject: [PATCH v6 01/11] riscv: Add B to hwcap and hwprobe
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-rva23u64-hwprobe-v2-v6-1-c985af3256b8@oss.qualcomm.com>
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
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5494;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=rQ+MWjWO+EMEHxCEjEwBmDuvMFGXiD82W1SseEILmGg=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqxaZmF2P/ZD8X91TymcaCo0Dbar1zd70u322ebFU8Ojl
 6ydrXk6SlkYxLgYZMUUWQ4fbcne+son2vc55w+YOaxMIEMYuDgFYCJe/gz//Rz6A+/4iz27vGf7
 jz3lTz+uSJNt3ruvMu7LpEO2N590NjL8rxS8eubzvF3zuy5ZHm+vWpD0XqQ4dc4zL59Nv0Rs2G8
 lcwIA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-GUID: pEXmBcFUJuRWApkpeaHKx6Km8_m6g8pV
X-Proofpoint-ORIG-GUID: pEXmBcFUJuRWApkpeaHKx6Km8_m6g8pV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfX6V2xYxYRznZO
 w6PPLKMnDlTLKwYR4sytqiJRZx2JrD6WsQLZf2pRqnq13kaDYhQcaBgDckUNf/RkGDf7zVZQOxX
 HJxn0TXhzcMDSExzxMJ8G1wX+5EAUZfkRJ87qPWtqQiZ0C7ZPWRU1/4v5TC3NdXi9JOYqogT+dI
 eOsubEPYuOHpN7UF+aL/Om0arcz4ov+Yh2yS28kXSWXdh/eHaQFxOp6AfJdR+LrLjTWGkA0zMop
 VPSg3tHTfC9YQEtADo5kGXFjkOL8E55MUM6reW5FK+Shsn5LfwuI+rwTvw8OT07A8q9glO8M8h2
 GUO4Z/QKh373vYUCF1lSnm1qASCsKWyGm75OHNKOuVs5P7wLN1KLw6+yA7zngoU/i3cnx2gN3Vr
 O8wz0LoaOGuJXSx1qeuuJyEmcCuxxgYmZmk9SyqXK9OSzNz3g1cPZ1MES5kMYFVJ+Ub/4TXkSJe
 9NIVusxLAqs3t7NnUCw==
X-Authority-Analysis: v=2.4 cv=VcjH+lp9 c=1 sm=1 tr=0 ts=6a7d0328 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=XYAwZIGsAAAA:8 a=mioeM4dCHJ9OQqhfmfYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfX56HUxfasoIPx
 K9MVA6aQd9DpXX4h80Z7fdopzkAu9pCky3pvgKtlHqjA+0rV0CpswmR/hP4RY3ZjiuGXrLMGe8E
 i4yXREKCT7f/g7V/lSUUdtLuGzzm5gI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1011 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120190

From: Andrew Jones <andrew.jones@oss.qualcomm.com>

Add B to hwcap and ensure when B is present that Zba, Zbb, and Zbs
are all set. Also expose B via hwprobe (RISCV_HWPROBE_EXT_B in
RISCV_HWPROBE_KEY_IMA_EXT_1) so that userspace can probe B directly,
mirroring the F/D/C/V pattern where each is reported via both hwcap
and hwprobe.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
[Add B to hwprobe]
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v6: Rebase onto riscv/for-next: define RISCV_HWPROBE_EXT_B in the
    _BITULL() style of commit 8da45c93dfa9.
v5: Collected Reviewed-by from Conor Dooley.
v4: No change.
v3:
- Indent the added hwprobe.rst entry to match the normalized style.
- Rebased onto v7.1-rc6: index isa2hwcap[] via RISCV_ISA_EXT_B to match the
  macro-ization in commit 41337097f2823.
v2:
- Rebased to v7.1-rc2
- Add B to hwprobe (RISCV_HWPROBE_EXT_B at IMA_EXT_1 bit 6) and
  document it in hwprobe.rst, so userspace can probe B directly.
---
 Documentation/arch/riscv/hwprobe.rst  | 4 ++++
 arch/riscv/include/asm/hwcap.h        | 1 +
 arch/riscv/include/uapi/asm/hwcap.h   | 1 +
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/cpufeature.c        | 8 ++++++++
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 6 files changed, 16 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 893e1a1215d2..fc68dea397aa 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -421,3 +421,7 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_ZA64RS`: The Za64rs extension is supported,
     as defined in the RISC-V Profiles specification starting from commit
     b1d80660 ("Updated to ratified state.")
+
+  * :c:macro:`RISCV_HWPROBE_EXT_B`: The B extension is supported, as defined
+    in version 1.0 of the Bit-Manipulation ISA extensions, and implies the
+    presence of the Zba, Zbb, and Zbs sub-extensions.
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index f8db798b2654..6a693210b251 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -11,6 +11,7 @@
 #include <uapi/asm/hwcap.h>
 
 #define RISCV_ISA_EXT_A		('a' - 'a')
+#define RISCV_ISA_EXT_B		('b' - 'a')
 #define RISCV_ISA_EXT_C		('c' - 'a')
 #define RISCV_ISA_EXT_D		('d' - 'a')
 #define RISCV_ISA_EXT_F		('f' - 'a')
diff --git a/arch/riscv/include/uapi/asm/hwcap.h b/arch/riscv/include/uapi/asm/hwcap.h
index c52bb7bbbabe..96b7cf854e09 100644
--- a/arch/riscv/include/uapi/asm/hwcap.h
+++ b/arch/riscv/include/uapi/asm/hwcap.h
@@ -21,6 +21,7 @@
 #define COMPAT_HWCAP_ISA_F	(1 << ('F' - 'A'))
 #define COMPAT_HWCAP_ISA_D	(1 << ('D' - 'A'))
 #define COMPAT_HWCAP_ISA_C	(1 << ('C' - 'A'))
+#define COMPAT_HWCAP_ISA_B	(1 << ('B' - 'A'))
 #define COMPAT_HWCAP_ISA_V	(1 << ('V' - 'A'))
 
 #endif /* _UAPI_ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index e6a394fbe7fc..9323feb7c3c8 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -122,6 +122,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZICCIF	_BITULL(3)
 #define		RISCV_HWPROBE_EXT_ZICCRSE	_BITULL(4)
 #define		RISCV_HWPROBE_EXT_ZA64RS	_BITULL(5)
+#define		RISCV_HWPROBE_EXT_B		_BITULL(6)
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index d2ec96843456..7f615d1a175b 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -471,6 +471,12 @@ static const unsigned int riscv_c_exts[] = {
 	RISCV_ISA_EXT_ZCD,
 };
 
+static const unsigned int riscv_b_exts[] = {
+	RISCV_ISA_EXT_ZBA,
+	RISCV_ISA_EXT_ZBB,
+	RISCV_ISA_EXT_ZBS,
+};
+
 /*
  * The canonical order of ISA extension names in the ISA string is defined in
  * Chapter 27 of the RISC-V Instruction Set Manual Volume I Unprivileged ISA
@@ -519,6 +525,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA_VALIDATE(d, RISCV_ISA_EXT_D, riscv_ext_d_validate),
 	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_Q),
 	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_C, riscv_c_exts),
+	__RISCV_ISA_EXT_SUPERSET(b, RISCV_ISA_EXT_B, riscv_b_exts),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_V, riscv_v_exts,
 					  riscv_ext_vector_float_validate),
 	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_H),
@@ -1145,6 +1152,7 @@ void __init riscv_fill_hwcap(void)
 	isa2hwcap[RISCV_ISA_EXT_F] = COMPAT_HWCAP_ISA_F;
 	isa2hwcap[RISCV_ISA_EXT_D] = COMPAT_HWCAP_ISA_D;
 	isa2hwcap[RISCV_ISA_EXT_C] = COMPAT_HWCAP_ISA_C;
+	isa2hwcap[RISCV_ISA_EXT_B] = COMPAT_HWCAP_ISA_B;
 	isa2hwcap[RISCV_ISA_EXT_V] = COMPAT_HWCAP_ISA_V;
 
 	if (!acpi_disabled) {
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index bd6ca7d769da..12ea4f39a838 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -207,6 +207,7 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 		EXT_KEY(isainfo->isa, ZICCIF, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZICCRSE, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZA64RS, pair->value, missing);
+		EXT_KEY(isainfo->isa, B, pair->value, missing);
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */

-- 
2.43.0

