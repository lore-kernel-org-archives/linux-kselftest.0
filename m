Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D058F45DF77
	for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 07:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456592; cv=none; b=ASM1KELDMZwW6xLQKNmlaF0/sivXHA0aq8iYnWQH+0XmyLLCwW9Wkc5Zvvkx17ZSpLYEYjUz/jGKsEub1g4rNi9raIaF+HcZHWcCkxa1LXHbaSRusZykph4L/S+YHAemU3Aa7NrS3dw9fkRaNv5t16cjdZZjrNesCzJsBb3OP2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456592; c=relaxed/simple;
	bh=g0000I+DC3GVL5uQMPqM8ZxRlBzHUYe2tmfWKb6JLfo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=byDTqwH7iJnm3WVD7W66WK3vwfZsFY64/fNK0qprdzUZRjF6HbFt7pu1Ezz1+VKZeEcd2nUsvUUhR/iCDxAbAvMUJf48vg06woYrxCeaDN/HWbpSItIPi/ilgvVVZZLXlmxYC4myFaZDKt2bVjykUMchuULdlmgvZIQYcKWcqKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IBc6+HsK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NcAeAYhT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IBc6+HsK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NcAeAYhT"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Z9GP2892433
	for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 07:16:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w8H+zzcJemHKwC42SEXR3fCJz082yfrkBm0HUs7XWSU=; b=IBc6+HsKihcEDmd5
	ox8MGmbFbJrX8D8CBk0EN7QInqjeIzNUfqaSmKpBB0VINyiru9wAFL7JWhBWpXRp
	ptJx/fP5Zs/bCfBrIXk/pj3lhu8GJvTpqYYWtPhcjX8CQBG1ki5fXhqvVgXKnyHm
	64VhbktvYuzd4YD/7TaqJo+tmSPFjLkE5rnqOgPry4aQdlJYUVdTF2p6rRAoCsiT
	Ul0iF3vdrtSxbgsCkVEINA5AJtmcx8CQChYzaz/58/xNBzKv5Pe+rnpwAvcPmmI4
	KPMHU1QgTEpqcDSd1Jx2Io/6xb8YB0X+ykOn7302JvC7LZsHzXwX3FiujkJa6Y4b
	Lb9S7g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2kv8cp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 07:16:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39df742a3e3so997545a91.1
        for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 00:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789456586; x=1790061386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w8H+zzcJemHKwC42SEXR3fCJz082yfrkBm0HUs7XWSU=;
        b=NcAeAYhTqwcDREz4uEsI1vmVPjwF4wZx5reS1NXGP5jBpgkxUCvXAslhiwrEo5xl97
         S/rPVOaAd7GQU/Fdjv+XQT6eU2O3VDUAoOHGdTWQ1ScfOkmT+M1xkx2FgksCwoyupC+l
         84cXH8iqNsB3aeQJ99vIb+UeFi7iDDe1ah+j9Rg9o0wC83D5a8JsV/SQn3nbGZ0KaAXl
         6cLcX81hRhkI2Cf1QuozI8uUCKNs6I+qu3HojSGwR1nbx5riyc67twMLa6vHD1sQnU6L
         HLhPzGnDDEfxzHrbThsSoFy+Qt9XFoOnP4O6zb25plTwSqWu9EFOLu8nuz1mkNAqNfLL
         0Orw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456586; x=1790061386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w8H+zzcJemHKwC42SEXR3fCJz082yfrkBm0HUs7XWSU=;
        b=B0Ee0YcEIS6yrR9dISF2/xo59peI6LhhjtXiUcAwHKvabXbKo54dh0dMmoMQBQZZjb
         t0AEm+rWtNOjEGLI2npPSlrOblZMVXfBh6z/0Fg1Hp8mybfEVGba9uG7txx6YyW56w5T
         EUgws5IVlLcEUSFsD5hzd4y+AB0mEXiuaLbZ2gtmHPCpxNkulcdBUtkZGcte2VHNpIan
         IDYm0cR+9PC/I04MjZFJKi2OZT0q3ApqBIyVtLvzqgdJs9gIcY7QgN+9mi/y5m3BDC82
         MMFEAKHvZ3LGfH9gr849C5P2KKcLYV0PEPeRr6iG9V8oKMV2LyG7X4brQZUyJSIy0/D6
         eJIg==
X-Forwarded-Encrypted: i=1; AKwUvBwxKoeIIpZMq42rnpEEG7dau44ZWdTXxA4cqfDFRvY9i4xoFqJFw4C+/8Dj1ZS9pEjqzeFV8iXV+elTGKiWXHc=@vger.kernel.org
X-Gm-Message-State: AFuF++lRxJe4Rl3LZ+16UK1+rcO1wIsEMdSSrdqwxlCXZ0Rs6BBb0w6G
	AH1/2M4n16u5o9kLUyFIym+pVz0WkOXgZpN++fRXBF0C8JkpmyUrddTNBreG9Z0OyUOWQydJ9VQ
	huJ+ursdqVNwaounN5uk9XJN3tLUZ4pkM2wnDdI8fTmhhzTRfGoXa5/RtmKmUGwiqxyVLCF8=
X-Gm-Gg: AYBFou2rn0ZbHcJsAT7ym3VddR2yRBiMO+E+tZ7VF+zihREInc5zjfQ1kC946PIKLNK
	9AgtSzGxNoysczZNe+kcvvkbgWuDvkjnE8xcP8Duril8bq8/yA5ycRAROrzSXDu/mhfmD3gtOYl
	vbp1vqkax54ApBcdzLXT6lo8hi0vtkN227gpY9MhN+QSSJybSbffFVIEDvK9GWBIRXJoEt9MNtk
	z7UEYy9aKiB4SJd1LKo1NjlF8I/NJL4Pd1fbCl7pYSmxJ6g5N0QsjFlPVMrtG4zkh9Zg7NK0wdW
	dFKQWZDiYktFtqgPuPsGNMv9IWettGHed+6FTE8ARjtWIOOkJb8oCuWEBwuD
X-Received: by 2002:a17:90a:1188:b0:39d:fea0:33f3 with SMTP id 98e67ed59e1d1-39dfea036c4mr1722363a91.2.1789456585797;
        Tue, 15 Sep 2026 00:16:25 -0700 (PDT)
X-Received: by 2002:a17:90a:1188:b0:39d:fea0:33f3 with SMTP id 98e67ed59e1d1-39dfea036c4mr1722329a91.2.1789456585264;
        Tue, 15 Sep 2026 00:16:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdaccc0fsm3447120a91.15.2026.09.15.00.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:16:24 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:15:27 -0400
Subject: [PATCH v7 01/11] riscv: Add B to hwcap and hwprobe
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rva23u64-hwprobe-v2-v7-1-aa35ebd9ae96@oss.qualcomm.com>
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
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5564;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=79VdSxhAJWwAJ2I3+EjaPF/Oe48XuOikMy17edoXtOM=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqwVHzZ7XlB2klL+cJM5+EIBW9PrsE1vFgba1TX7HDfO/
 P5rKp9uRykLgxgXg6yYIsvhoy3ZW1/5RPs+5/wBM4eVCWQIAxenAEzk7UWG/1mdh2ot/6ffa7pQ
 IX+wpW6q/JQHWqtefQj8kJ53pf/BzV8M/x2LuxmOXvzzt/NV7FSLvV8mqnS2fnd4++Xo1Ab/qxv
 MhBkB
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-ORIG-GUID: pdR7I1QJG0LpFULCtpJPR7hCZ8zxEGun
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX/oCscM/xvwhO
 1zSQkRvRIlpRPy78b9RQ1VnHLSMHUobSvbIuRtcy7Zfkwg4wo8sxS4XOrhtCNq4+5732PKTplTX
 Som+IH507s/ZyKFgc8RG4+8XwFr84Mo0uYyBptL+EF/V+FJxlZcyIE8VCOVltFLlKcFFGtQRuBN
 swEebybglewfiIcvgLJpdpPKQSHWYpRjo+C8yGyK9qe1qMvwsDmgfnz6PE0hzP3YF/dXtLAN7Td
 RnkOPkCIaAPW2h8Q8MiwEccvylDMlm/4FcTox8wL0LBd4TziwOA3FpZiHeOj2T1fShLfsRB6ECq
 9TA2JMuxsQlbRRLyp0A8mu8zjKlknH5zxEt7eapi/VGzjWQbutx7pBUhgW++IADxBL5aRc5sVuy
 Na7rlqnMzm1aY4HbvoHmSIGOQjVdDaL7hJQw1K5sU/oGzucL/yyY74BtMwn6qph0k0YknK2hDWy
 JRTrAMYJkILhqsvzrJg==
X-Proofpoint-GUID: pdR7I1QJG0LpFULCtpJPR7hCZ8zxEGun
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa8f0ca cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=XYAwZIGsAAAA:8 a=mioeM4dCHJ9OQqhfmfYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX2cOY/c44rsDr
 JroaOg1sdOzOkkDew8eDjrCcbB2aq1oxHv3J1ap5+mRtuccL79K36hI4516dk1T4MGqvATPMDSA
 8iZxdDflAQtW/Ge8oXm5/CTFpvEMuvA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150102

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
index 893e1a1215d23..fc68dea397aae 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -421,3 +421,7 @@ * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_1`: A bitmask containing additional
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
index d2ec968434561..7f615d1a175b9 100644
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
index bd6ca7d769da7..12ea4f39a8381 100644
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

