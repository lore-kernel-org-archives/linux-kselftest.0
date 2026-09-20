Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5B33DB31D
	for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 07:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789888735; cv=none; b=kDjVqL//yqo+RJY3RXMGzHyZz6ElxlqlMFqUscfUwR6/UWDgghoGUDrj2mwcbbH3AAlF5Z6b2U+DBnwFjztqzOcXEynXTQcCDvjR2wwlgrRQRHiXmjADDtsicfnuNzaaeYFt1ntfTWOSNnCtCVzteptqawk04+tknG/ZEBkVYXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789888735; c=relaxed/simple;
	bh=Ywv1TsUttcCM2J4yTade/3h3J+sKnoKG55ghrwjk49I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iMMsOn9NqT9TkCuqKYvp+3InXlfKFY7Dt6BYtcbeIvmQpS0DHW1pxbkDQM1BOpdQsUk9HCcpP9GvfHINxD8KMIJ6yoafxGn58YU/mF/871tXy2fCbUh2WkfPAG6qlNJvL+7SBf4QdY4huHON1EcWHAbvew0Q7rnDzBrak4NNhzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GFXElVjw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GQWRgVWS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GFXElVjw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GQWRgVWS"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K54w622455682
	for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 07:18:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NtVhaCBTcHcgnJGiMK+DPEueNRTd7gSRrfmajcTx3LM=; b=GFXElVjwanpHlUhf
	PTvWyA8QaBwiJEFwp1wARnqbKtUkawjlIDLJUa1gO5GacEimCFbUP/wO3SQiNtSZ
	DfZcXfSVud8w1h8vh8VddfZQrH8ZylQcZYKsQjY728WwaN4a7JPskiM17zL7USeK
	W32XXnFdlAhiL/EIOiZTCeT76m3MvAL0TATOGMmVSgmogrPELM14A2qlfMJiZML/
	HF864qxWmON26Zv594zjfpJXkH7dwTDxSJpJ9dplyWJPpasgzPnbeLgbHtnoVkRi
	2LVkLI4zSo0K48XiL+TgrRYrLb3IImLgxbImh6vfzXg34r8KGBIPTB6v34GbADuM
	7wCicg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshbsam6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 07:18:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6fb956002so28726845ad.1
        for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2026 00:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789888732; x=1790493532; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NtVhaCBTcHcgnJGiMK+DPEueNRTd7gSRrfmajcTx3LM=;
        b=GQWRgVWS1b1flJZ54HoTxgJ24OAgI3WauAoGzI3iXRNqHju2NYnZmV3Wlol/vqFBsu
         ACBGx46RLcupmgad3tWvk8XPcxZrPnQlLBmqP965ff/n92Jyyqu55CRO6T2yP1UGFaSN
         KpowkHuUApApItQtkRdEcloQHA2P3fov4vgObrnzbp29z0yw/N3aZh7C6eJwx4IqUGKN
         yW3ARAtLyn0zj/DliqRLhjvmzNfaPBaSWB4dXgxiCwR1CvrsuLU6G78EECHwPHIj46cQ
         cAKmgi8uVdgmuIDY1YB/oUMq0bbHfrpQeLRdUEYEmn5EgBBR+hDDRF2W7JsL8YBCLP+q
         hsBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789888732; x=1790493532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NtVhaCBTcHcgnJGiMK+DPEueNRTd7gSRrfmajcTx3LM=;
        b=tLgd47GdzFgDUbDqKWDAkjMh5Yb7/8lG0HKVCI282af3ABor/LQqmr9RoSdOLgF3Qn
         DpCqLzl9wAjLi+qj8lt3xqg5EmuX6lyjGuYUEy2JMxuCc/Tv7eWcZ/HGI8AMLLeEZLdS
         BIgN6UsXIa9HT5d4bAkDhaNKLezg5nwevM1ezxzZMslrEE1chChU4p4FDHFy/p9mDfCE
         uE2yAg4lz49ZLexjHfu+qfH6bByIoLyCrogwMCCWfBQcsSJka5sVe2XofJkDBS4RhfYL
         ilvlfNvm+8ijlC6IMC9tcgo0adRy5Ug01DoC+UjBDO7mW8BVNuh2nrysI8NDAFm4fP0h
         dtEA==
X-Forwarded-Encrypted: i=1; AKwUvByVqmhgnjEgbZ2JeeMeROnBrcBW/4FIZ3CGq3ojtKve/XeMlGLyDSVok1D5064127oxFFL5tbb9OSWNtYhs0ao=@vger.kernel.org
X-Gm-Message-State: AFuF++lUxxf5FFanWdk6Vb1pq3ZmREvVWsCJrk4hggwUWxHKhNK/X9Tp
	ZNq0XonSsOsxwSRCCPv5oW6PvqDn/EPYP+zAjJnCUSLwjIhvzQ5+kkIHEDBVrl+uo9Wd2mSkNAt
	OgdgP6TqbsMvfzvJQlKOlR8tiIqne4gWt59JMtAQb2zSaKyixO5nnEdWwv0LitiCDQUWDajjg/0
	HQKLMVtw==
X-Gm-Gg: AYBFou24sjWjZzr6DFi1R0xFaHJvfSaZPgxUxX6Kelqhuz6z1dDZXIcSLYpqnS8J/xJ
	GAScgwqJ6ACjPNDnAm0TCLRdaDxZckSiGXx0dkSbJj+yW30ddk5TiZTUgH7ouORNl4s3GMnsFqg
	DAPdk4AY14DpzeICgU9i40y5mXWxoNUHaTdARpA+Gc5Wha+dDqn/X58ipFdUMov2yLyYoKe0XbM
	Z9+hsA4iZTU4Ae72wJcLS7ZRjA1k/rTybmiSkRvf2+Gsi+4Fr/XiqOpkKGCo4hk/Hpl+phg6z+N
	/4ZQT0wnDL921qGPZUiEAbMcuytmk21I0faMx6H8StWCr/uFPjqlMetfB7A=
X-Received: by 2002:a17:903:2f06:b0:2dd:8e7d:90f7 with SMTP id d9443c01a7336-2ddb1adb4a8mr123699625ad.9.1789888732348;
        Sun, 20 Sep 2026 00:18:52 -0700 (PDT)
X-Received: by 2002:a17:903:2f06:b0:2dd:8e7d:90f7 with SMTP id d9443c01a7336-2ddb1adb4a8mr123699205ad.9.1789888731774;
        Sun, 20 Sep 2026 00:18:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df346152d7sm13908655ad.16.2026.09.20.00.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:18:51 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 03:18:21 -0400
Subject: [PATCH v8 01/11] riscv: Add B to hwcap and hwprobe
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-rva23u64-hwprobe-v2-v8-1-5f14bc5c23d3@oss.qualcomm.com>
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
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5580;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=evoTi1l8TpbQki9A+dpnP8+0GHQmhiwP30MSnsIzMwE=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqz1HSd+6XopHV763+TV93Q2qfnS/fbZKWsqP4fZci7de
 d4s9vuhjlIWBjEuBlkxRZbDR1uyt77yifZ9zvkDZg4rE8gQBi5OAZjIT02Gv5JaqWuX7lb+wCxk
 Od1r99EFz/lzv4YqKz1Yw+GUl31t+lFGhgb5Y5rpFRsnCok8urNe4GXuU60vv49t/bC22eaM9Mk
 f5SwA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-GUID: bQ4P-tKslfOz5dXtVoEITpt-_fLpypQd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEwMyBTYWx0ZWRfX69n85nCyXleK
 GDFcfvUNGmedEIps1Qn35Ki7FPNIf18b+VZ89ri7Gr+HQl+KmT39dkID44hAZyygNpBdFzLBTuD
 H1WpJ9vMr/mUw1M9BQ2BA8WTOu+dXW4BPSZjMsjiiB62N+X+LoRnSyXPzQcFeheQbj88O0qv++s
 OjgEKalbirmhxV7NWGnMNmUEE8tgzPJRQprH/LY8xX80Q6V8vOoaFGCNkSUeDVI5HlDEv3AucA8
 nI39bCAasCkxeIpf2Ej4RcQp4cH+Wu1/712LyldoThMhY9xDf7fB0EvJ+OdAWNo13PL0yohWf8S
 9Vo+nvn1n2Jipgn/wAirdhZouFe5ytTNkflUi97E0I243AOtcBBucXTu/kXtsh3HleIt8G5ZlbB
 Jv/tGw5rZaEYvpL+keMgZ5Dg+Fb1abouKHgzWQd6ocNl+pas8yWTx6BKmh0U/iksOdkQJ6R+/8G
 G1pJWjjpYaoh0We2zZg==
X-Proofpoint-ORIG-GUID: bQ4P-tKslfOz5dXtVoEITpt-_fLpypQd
X-Authority-Analysis: v=2.4 cv=bPqDs/+Z c=1 sm=1 tr=0 ts=6aaf88dd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=XYAwZIGsAAAA:8 a=mioeM4dCHJ9OQqhfmfYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEwMyBTYWx0ZWRfX4awNA4PCg7lt
 ASt9vxba1SHpK2c1UkpDDHQ1cUEwyFSGPBmAOMny16HpmG5/oy1mKBzR0vWyKG18zyeJdCd9zml
 MPan0pjPer39o7xdgTv6GnoAauT/8TY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200103

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
v8: No change.
v7: No change.
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
index bb1e0cbab36f0..69a3fc0a29b71 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -423,3 +423,7 @@ * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_1`: A bitmask containing additional
   * :c:macro:`RISCV_HWPROBE_EXT_ZA64RS`: The Za64rs extension is supported,
     as defined in the RISC-V Profiles specification starting from commit
     b1d80660 ("Updated to ratified state.")
+
+  * :c:macro:`RISCV_HWPROBE_EXT_B`: The B extension is supported, as defined
+    in version 1.0 of the Bit-Manipulation ISA extensions, and implies the
+    presence of the Zba, Zbb, and Zbs sub-extensions.
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index f8db798b2654b..6a693210b2519 100644
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
index c52bb7bbbabe9..96b7cf854e090 100644
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
index e6a394fbe7fce..9323feb7c3c81 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -122,6 +122,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZICCIF	_BITULL(3)
 #define		RISCV_HWPROBE_EXT_ZICCRSE	_BITULL(4)
 #define		RISCV_HWPROBE_EXT_ZA64RS	_BITULL(5)
+#define		RISCV_HWPROBE_EXT_B		_BITULL(6)
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 61d21f7148305..beb766420b5bc 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -484,6 +484,12 @@ static const unsigned int riscv_c_exts[] = {
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
@@ -532,6 +538,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA_VALIDATE(d, RISCV_ISA_EXT_D, riscv_ext_d_validate),
 	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_Q),
 	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_C, riscv_c_exts),
+	__RISCV_ISA_EXT_SUPERSET(b, RISCV_ISA_EXT_B, riscv_b_exts),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_V, riscv_v_exts,
 					  riscv_ext_vector_float_validate),
 	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_H),
@@ -1161,6 +1168,7 @@ void __init riscv_fill_hwcap(void)
 	isa2hwcap[RISCV_ISA_EXT_F] = COMPAT_HWCAP_ISA_F;
 	isa2hwcap[RISCV_ISA_EXT_D] = COMPAT_HWCAP_ISA_D;
 	isa2hwcap[RISCV_ISA_EXT_C] = COMPAT_HWCAP_ISA_C;
+	isa2hwcap[RISCV_ISA_EXT_B] = COMPAT_HWCAP_ISA_B;
 	isa2hwcap[RISCV_ISA_EXT_V] = COMPAT_HWCAP_ISA_V;
 
 	if (!acpi_disabled) {
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 7818e1d32622d..c03c6e08dd4d0 100644
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

