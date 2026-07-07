Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF25E40D560
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 12:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783429129; cv=none; b=bXEX0TJ2P8+hrivG/WMcDPv7byyYuVuZa/JZCRQBtjqGf+UHY6Q2c96oK9DAP/wAdmf723sTeDQr3ItI+LeEzBT29T1SExOEGbR9vkAPwzqfB6+xiTxnSlEaTqsDswZH/rFyKmkwOk5hrqG6GfU3vx9BZdKb7/k+CBzzUOUhWHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783429129; c=relaxed/simple;
	bh=hWtm8ZM2aIA2ZT1KJL0dTdHDIf+NYjTE56/Vi9ewZDg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pGEtRqbGam68sW5l3vx2JB2FVvCLrsPZ760R0HSoVFpyj2FJ4LW2TkepFNWDPQZ3c1uaM09uOz2aWkLbTX2GYY65ZWt9Vi6nqdWow8bxVqzZ1+8iul+7SXaQGcKUiEPY9azoMiRvZjJuqnFab1fDEwUzfVgVlEzHxZ9B2iuud0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DX12F3De; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YAQczb83; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DX12F3De";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YAQczb83"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C9NQx3740993
	for <linux-kselftest@vger.kernel.org>; Tue, 7 Jul 2026 12:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=07HWQhr0mW5AKge6itfDXP0o6z4eCVE5Fz7
	ySaPNK+A=; b=DX12F3DeAwO+uo7rfH9oy/SRxcPIO6ddg6c8OO1d+2z9KG6Y0Jt
	OfCx8vQ5HavN4oVCoCNygsCZPI2ZYI9thuXK7s6WLwiQZ8buuWs8CDwaP/6VwEz5
	d3XLk/n901rtSw5tOF0hNLxd8z4+uBXaVvbHf7db790+lEZ3u4QlsPLe5NiEtUKf
	HjPeDbK/9qsLEULYBl9U4O85856tI4tD5Rochhu5UDFtImO5aYd6FqhEKkUidMY+
	32rxF2P4vPsbwEKchJ7Hl3qHooBWvUBhgAqJR2oDA7VprL7z3IZm+HIFg97+Hn6w
	zFx/DLt0juu+WhiujUPafnvcCHTC7UqcoyA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v9a9hjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 12:58:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c12e43b98so51469031cf.1
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 05:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783429126; x=1784033926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=07HWQhr0mW5AKge6itfDXP0o6z4eCVE5Fz7ySaPNK+A=;
        b=YAQczb83wsw8szNYa4aY/2r/AwJ2ihOKBDreehlKuGZDVIWKXXG+u7bPZWEtgyaskS
         QlHRnL/VoSlLZCPhkR/vPgJT1gOzGtG41biCeGjK6s+DkJPapJMJsA+Hs3RzPXEzCJ7D
         FqbVikZriCYXdK0FeDOjSSaERyG8nZdbn87mJhfaGvOAl5271fEwFGsjBePX7iQJK0It
         wwAG77Eo/QcpuQ1ZKV+ngg9c2wrpU2ZZRzemUazEyB9GJI4TbQJk6kARG8zkEKmp6HhX
         PUMYGabKdpe7nDQNeIAhX8uMiiUKgh7brG5VgHs0lKyS+qGJFSHajtlVnKs2sJq+uEPf
         XqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783429126; x=1784033926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07HWQhr0mW5AKge6itfDXP0o6z4eCVE5Fz7ySaPNK+A=;
        b=FmbSIOIJkcKFdeGURlLHNN/k2mRYs1aI+QrHFvkBct1fvHk3Rd36Z2IAxbwkD1aK6Z
         AXxrQAozjKXtQTBvPxO8KGS+38HGyrPOysg2hMcmfCUaaYgOY8H0YzCz5eg0ZkI4le4x
         fF7wVn70U8TsoYM1m4QrBIxnRriZHERzLFH1IshDjOcDD8wPUMQUGSGlxHaESsanGQFa
         nZFDRSqqey5lfh760FtCi9DOLi9i6Qx5YJdEcNqH5o6Bry4q57vsqA8Bx9utoGPAjmUF
         EQgO8hbcTCVqWDN2lSXk2ueeea8jJPLA0xweYf6Hdy0J7HemtlIqM58rtGY2gH538sLF
         9iAQ==
X-Forwarded-Encrypted: i=1; AHgh+Rowe8G19sKxPmQyEL1woa3bhMwDpwehjRNLrlJqwGhMEikms6lxi4W5WQbD6nI/FP6Kz9jrwYfITlXSbXlrgPU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTPEx15D4ewDvP7vh8iqyDggOjtcCxfiIKrNnKy4T44lQMxtiz
	qVu2hK7kUB7ETs/s+Y1rrH1aZmVHS4tV+J1db9H8gtJjQl5cz5j1v6eAaekh87S+hUnXN3koiIe
	pmS+iT01YuzvbMzdHxoMsH9P2yoga0W6RhC9jS0q6TFKmwMbS1EVA9UdwMnVNmpmVY5kpTF8=
X-Gm-Gg: AfdE7cn1Po4eHU1FwQPosZME7Rrza6gbAlF3T6TgLHn6iArttE99Emo2dSWvyHQo/ix
	Wq7HY2XSnQBLVJOh7kESyjyzt7odSe73bP8s5Yk+wx1E8EeYbD94wvBcVCDV6AVWthOGMJDQaJ2
	lHgmkVMk0Il4wEviAvkSii6WUyoVMew3ZX022YqrUKZrM1+IQAGF9DKj2kTyzw0iSrQPoiQD88+
	bhC6Y8IvSptv/mB2kU+Ue12IMK+CFDDzLwqra796lRpzjW85Lcp5MlDhrAyn6J82nPijBOZRkuW
	1eFxPZoaOGetGX932HoR3TFiHdfMPP//73B9/4EmetU3QdI61R3Te+X5VEsDu51rsCih3bWr3ZK
	oHWovdtUsp/lH/BitemP3oYSIQxlBmMyBALK80qw=
X-Received: by 2002:ac8:7e88:0:b0:51c:4dc:287b with SMTP id d75a77b69052e-51c7479f5e1mr54015091cf.7.1783429126381;
        Tue, 07 Jul 2026 05:58:46 -0700 (PDT)
X-Received: by 2002:ac8:7e88:0:b0:51c:4dc:287b with SMTP id d75a77b69052e-51c7479f5e1mr54014531cf.7.1783429125444;
        Tue, 07 Jul 2026 05:58:45 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:47a8:72a4:c756:37f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d83bdsm34539417f8f.13.2026.07.07.05.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 05:58:44 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Shuah Khan <skhan@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>,
        Albert Esteve <aesteve@redhat.com>, Kees Cook <kees@kernel.org>,
        Alessandro Carminati <acarmina@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH] bug: fix warning suppressions with kunit built as module
Date: Tue,  7 Jul 2026 14:58:37 +0200
Message-ID: <20260707125837.57256-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tLgtjEyFYWNtPnkbkV1V2pyuUxeiB55w
X-Proofpoint-ORIG-GUID: tLgtjEyFYWNtPnkbkV1V2pyuUxeiB55w
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEyNiBTYWx0ZWRfXy2tzanNOof4L
 8qcDVbB8mjmPpU6xPEeEqQUjYLpgu5IrJumcLhtd/Rl1R2S4DJDPUxxR9kGIRmWtUrIfR++98ff
 XSBc/L3mfpchB+ii5zX6EPX3TJ2Ea3g=
X-Authority-Analysis: v=2.4 cv=b9yCJNGx c=1 sm=1 tr=0 ts=6a4cf807 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=AttVjD3uJjTWtuEPW6QA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEyNiBTYWx0ZWRfX/oUPJwMKUVB6
 i3KSKEajxZpOPhDmKti9bYvJlSLhK3Jk1EMFF8Px29+IRDRFdA2AeqqYB+xRxJLHDUBVLtbbdvP
 2S7wdT4cPm8beV5ef2ICSYljbnNXDYpWItk1UYg6HYIRVAkdPWIbYZRlCJ/YW/7bVE4JGu/rBGx
 cCZnTFtasOgx8R1vtFvz/ClXPihOpVJeoYORjCy5L0DlXlUH2S5u79Sx5TMNF8CX9dWcGGnsL2T
 uZunNhjhrwRUjchgu59Au2tiG62+Kobi/rM1Okrpc7b4VDry1+OLhLvul1NXdTJRACS12qS83ci
 sJV9LFfWkOawIUMtWnpthLReDckx7c7PH+8Fa+GBoLi62/TAxF6GVwV7DanFyU8mMC7gGA5CDJz
 knpI35wURiQKe4vT5ljxHDUvLFGoBTKn3FstIMzvJPmkzF7rEw+lx5790oAvz3TF2sPFcoenOR7
 WHppwXzlhd/kp3mNdHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070126

CONFIG_KUNIT is a tristate symbol but the warning suppression code in
lib/bug.c is only built if it's built-in. Use IS_ENABLE(CONFIG_KUNIT) to
enable it for a loadable kunit module as well. When using a plain #ifdef,
the suppressions only work if kunit is built-in.

Cc: stable@vger.kernel.org
Fixes: 85347718ab0d ("bug/kunit: Core support for suppressing warning backtraces")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 lib/bug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/bug.c b/lib/bug.c
index 292420f45811..b9820a0226f5 100644
--- a/lib/bug.c
+++ b/lib/bug.c
@@ -219,7 +219,7 @@ static enum bug_trap_type __report_bug(struct bug_entry *bug, unsigned long buga
 	no_cut   = bug->flags & BUGFLAG_NO_CUT_HERE;
 	has_args = bug->flags & BUGFLAG_ARGS;
 
-#ifdef CONFIG_KUNIT
+#if IS_ENABLED(CONFIG_KUNIT)
 	/*
 	 * Before the once logic so suppressed warnings do not consume
 	 * the single-fire budget of WARN_ON_ONCE().
-- 
2.47.3

