Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794228491;
	b=iFHBl/bSwlDowT2Q0t23D8Vfka+DqM4JziK4t6SviKJbt6GgbClOmXQ6xD6tNaErVLmb
	 JVEYCEqQhl+9ldpNgZOCXUDCauQ2ht0In3+ej6bRIlsroylMXAP/5XdWmoroibVeT0nKs
	 wzRWCd3zr6AIr6vaXyv8h1tqkKSlOqguHTAFhRiETdtCI4AlQvLz6LqWxq6VTgjOOgQq/
	 +pk5k54L+JgS9boOo+BgORyXYApUiU5+Un0H/9fIP0I2yXDD+uhH+arGwEZO+xhSWR2PI
	 WHW5Kd6H3RWVlHZY/l9zEUGviBZk7FuON8+z2sOWuUgZ6MqDMKtqVC0Vh/JyfyQb5TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228491;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=O1IcJnaaXyBGPlQGvOgAOnYQVFdWxHdOel4Zh2Ld2Ks=;
	b=UMHdlvODa5WMmMGxFDi11w6UxqIHW+CkFZX19K5M50igr6uKiszcwzwmrGpnfRCqm/FI
	 W53SmIsgOA4ez0juvB/jUlVmyGecih8077JJ4L2rIzSu+29rzcybVos5q7ptVMsyGjoq6
	 uI5IDd/UuEdy3twwwI8VtfRAzyHaJhtCoBcOzqHgRrYWFwS5LoNxp5M1cC87MtjibCaOF
	 s58CzBSIi444khEHO3yoTXe06oeFcdr8pfKZA5TlNu5qPrOsSQb9JQE75MYzoMwrWxGJy
	 77IF8I06hv8X7lcBL5Nf1l26F0TG6OSw6Ale7woUH9y6hQ0kwxzA6kP6O4E/4W93B8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T16fdjRa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HdSCyqDe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3443B606D806
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 12:48:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3443B606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T16fdjRa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HdSCyqDe
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9CEXsr3331861
	for <linux-kselftest@vger.kernel.org>; Mon, 9 Nov 2026 12:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O1IcJnaaXyBGPlQGvOgAOnYQVFdWxHdOel4Zh2Ld2Ks=; b=T16fdjRasCQOR5b9
	ouA78MlzVIhS0F6MubY67EZPWYYT5AorsbHCQQL2yunaL7371J8c4otojw2xKCel
	3+zsCq/kId+BGvzZmkcmqLi2aCDW5zxRUosBMr6ZC25SYc37WyVV44tmdaXK/WKw
	Y4WGuaM99a6uPeHUj5HXQ/sJD8WAqkaNNZyYDrLfCxpVQGJuBe6ypcXN+/U5YQAy
	whAnQxBZFMw85MtPNBqOeQsc0VaFwrcZaUPGiEo12kT0XOazln/bZn2aLAZOOBnb
	KiaJPWB5aYiSBiZWLIOAbF6d8qD0/PGy2o7aoKdmg3B/oBZQFMshJN8qp9aneAIY
	SIieoQ==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0rr3tw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 12:48:10 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b0d978e4faso11190137b3.0
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 04:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794228490; x=1794833290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O1IcJnaaXyBGPlQGvOgAOnYQVFdWxHdOel4Zh2Ld2Ks=;
        b=HdSCyqDe9cIES4e6G8k+jTMnHB9pmcvD2G0FgwioUolpwFFVSDnYW0mEIdpetDPKay
         waC+Yd1ysA8YXyChIhBgISJBw1qilsdb3uG2Xi8QHSQo7t783EZCOjHmb1Ud+SX0JfL4
         QvwaS7DeRbBIY0VnV20oe4aWAPKrxp9TTDLCG31OZbQss7c33H0c/cG+Ae0tMNtECF//
         G28Wexa3p4pcnwaLqv4KpeFz+1oK+ChAQW3/RVDg0hUNY6UKjnxWxbj8jWND73tYJD4K
         29u86SggPzlx6D1+II35mJjBOpgABH1XAe6WCcEN95dFgN0fofIYGTli2iDghz27OjDy
         KojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794228490; x=1794833290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O1IcJnaaXyBGPlQGvOgAOnYQVFdWxHdOel4Zh2Ld2Ks=;
        b=GWbOUsCTkHQhtbbRZs2YWEPA6UPe+F1zTaKPQlEc14py9q4e0Ef+B755orjMgvOCXd
         i2csS69/ob+ACJzUgdubo0cEIHyMTi+YvY25ID3qbK8/b+a1mM0iEzmwL2CMOCcoAX5Y
         OJcwDsihHGm7GAzFqfWWjHqud/wDEJXAQgeX/ApYnkGDxsPRax84rF10dtRf47XVAN0s
         d+gy+AP3rzrYTEXe4VLvR+4wc3yQfKqsYgHOKBiEvD3hcCbD23iseqh5FMYDYtwZU5SB
         xgtOvMhUqtpKdT3Qgw6Nv0kZQ5sgyqJQpMGzX9ST5ZSxmQqNrnz5y9M4jDSZhaaxY7GJ
         8qcg==
X-Forwarded-Encrypted: i=1; AL+hErH9nJ07gCr1tFm96D0n+mpYQ7DcPiLRxEsCPqsL4CVHAD75mg0RBb6GR2gnSm9nJTHaYIbjd9dkLrPswEXxOTg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9n1Y6QIiyqzGFVoco/ip1JivwaC25SDuH6AL3UlhOyENx46CvS
	KwjEkqdSzWquXCa5+KUwmtVe1m/RT5pikMwZMESGP56vUpEUc4Xvm68cbx5AC8gU28jE95ca5c/
	bs4/ju1AsOv9MkXuOGjNvSYuGVB91ACh5pnoFrnrcSKELmBvbYJcGi2fe7oYeHg2GOIb46vY=
X-Gm-Gg: AYBFou2GKmad/W7+wSoqW/oW0cBqGYnxR8N+DS2oJC4YGufOWsHlNELbqFTQMZ0VtYX
	Sgu6Xq9kMkk981IzLoXmg7qA0EUfUeAl35S/4taIIM2TpU6W+pwKtfqlTu+9i/Ok35GyIKgtzti
	y066JXdJkdKLliu2ns3E86dHqnOG2PijnUH5mUwSEbdbK6w0OjIwUdfCJauB1CS5s1MMRjrydn1
	XWoDjaVczjSg3XJAmwscSyt0VxD4gohskm1brW86cMa7vhEx7Eo2pqYF3uBB1mBOs9QUtgncHc5
	fIDVxynO336d2bkwwj/PuqqHN06yYf/gvSRTVuWLL/6WFNFexVZRgz+xvZeQ5xP8xE3r21DCEZN
	z6ED7CYzZW2SEuJQ5B2XZNYeEeeDxxYl310qoCCmtuKrYIjd036oOjya5o+pOlsB9kpNmCCUg1b
	xGKpCPq+tVSg==
X-Received: by 2002:a05:690c:4:b0:8ae:dfee:cd30 with SMTP id 00721157ae682-8b36caecde6mr19899367b3.56.1794228489472;
        Mon, 09 Nov 2026 04:48:09 -0800 (PST)
X-Received: by 2002:a05:690c:4:b0:8ae:dfee:cd30 with SMTP id 00721157ae682-8b36caecde6mr19899117b3.56.1794228488647;
        Mon, 09 Nov 2026 04:48:08 -0800 (PST)
Received: from localhost ([120.244.9.94])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36bb42553sm34525217b3.15.2026.11.09.04.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:48:07 -0800 (PST)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 07:47:36 -0500
Subject: [PATCH v9 3/4] riscv: hwprobe: Introduce rva23u64 base behavior
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-rva23u64-hwprobe-v2-v9-3-ae846c5c7178@oss.qualcomm.com>
References: <20261109-rva23u64-hwprobe-v2-v9-0-ae846c5c7178@oss.qualcomm.com>
In-Reply-To: <20261109-rva23u64-hwprobe-v2-v9-0-ae846c5c7178@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Randy Dunlap <rdunlap@infradead.org>,
        Radim Krcmar <rkrcmar@qti.qualcomm.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, linux-kselftest@vger.kernel.org,
        Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Andrew Jones <andrew.jones@linux.dev>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6764;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=ybtAp8KzOcpqJ/eft157GhybQwstQ8sSDSOgeJAecak=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqyPB15vVWQzMI1rF2dcaLTN7+6DqtxYoTkiM/4t3mdjU
 bRYyvRURykLgxgXg6yYIsvhoy3ZW1/5RPs+5/wBM4eVCWQIAxenAExkjhYjw5vFus8Nw644VXBG
 VZZnL7XPUEn8LKuqmzEhUeLzpGNfVjD8U+NtfPFP+r3xvqNzj21p11dVbNSZvOvnnjabiUpmYcX
 V7AA=
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-GUID: 9qrqpgCAvTrlFrNcCSOJ5sBHdpzwrEiD
X-Authority-Analysis: v=2.4 cv=MpfHeGae c=1 sm=1 tr=0 ts=6af1c10a cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=ZvHX9x23NDWH3CQeJ2oX1w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=phefSacXyxpaYYCapdQA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfXyNv3d9CfGlq4
 WzimRvPuaz+WrzmuUSjX0AilggGLJuKvB8qJN6AY+nwTuIYolKzy/lnjwpCfQ/JzDP2TU42HNcE
 X/QaUxti6durUQEyDOVY+KUTYsVeLNhAQm0YhOaUnN2LsD8En3OG39bXrPp3JR4USc5aNYFvE4Z
 FEymqSfBsomHeN+l7fRXdjDVckBiNRWT/ITR/3VglziYuNjBBqecHp95xP6vGwChp6VSsiOvsjx
 /GO4ZKyqzdNIiZBCJwJohDg2b3F1+QB2Gvx4lBjhl+mZ7yH61yoslagy/asjDb/9sC1sULrw2qj
 Ta3WTdQ6M5vvdIq9FVTgcHMnPa+JdwTZ40utR4yJve3BbTGaWY0LZa3Kz2KXqIlCI+zP17rr1v9
 sPF9uFsJoxDeeIYUGe0VSCOV/A/W9CcmtL4rp9LZdZrFIzSSICdt2RGzygDz4kvcsATOmCy2/nd
 z0J/dHKo3nRbqz5jBWQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfXyRaxvpLwHpdw
 Goep4Xd2uMvJqrBrG2JvwYds0YN88c0Gj/rl+9IYmgAmE/Se89x1J40M55iha8CBX2gFCjGIsqI
 X+gBP/8Y1Ad9YQfthtXG4ahIPWd25o0=
X-Proofpoint-ORIG-GUID: 9qrqpgCAvTrlFrNcCSOJ5sBHdpzwrEiD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090050

Provide a hwprobe base-behavior bit, RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64,
so userspace can check RVA23U64 support in one call.  Without it, a
consumer has to test more than thirty extension bits across three
hwprobe keys, and still cannot confirm that PMLEN=7 is selectable
without prctl() calls that change the calling thread's state.
Userspace treats RVA23U64 as a new base, so expose it as one.

The bit is reported for a set of CPUs when each of them has the
RVA23U64 mandatory extensions.  F, D, C, V, Zicbom and Zicboz must in
addition be present on every hart, as the kernel handles these across
all harts.

Co-developed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v9:
- Report RVA23U64 only when F/D, C, V, Zicbom and Zicboz are present on
  every hart, in line with IMA_FD, IMA_C, IMA_V and the host-wide
  Zicbom/Zicboz enables (Radim).
- Update the RVA23U64 entry in hwprobe.rst.
- Reword the commit message.
- Revert RISCV_HWPROBE_BASE_BEHAVIOR_IMA to hardcoded; do not compute
  it from I, M and A.
v8:
- Add Co-developed-by for Andrew Jones (Conor).
- Say in the body that the IMA bit is now computed, not hardcoded.
- Rebase onto riscv/for-next: drop the BASE_BEHAVIOR case's own
  pair->value = 0; hwprobe_one_pair() zeroes it since commit
  d0fc6fab2046 ("riscv: hwprobe: initialize pair->value in
  hwprobe_one_pair()").
v7: Use riscv_isa_base_available().
v6: Rebase onto riscv/for-next: define
    RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64 in the _BITULL() style of
    commit 8da45c93dfa9.
v5: No change.
v4: No change.
v3: No change.
v2:
- Detect RVA23U64 by reading from the cached hart_isa[].isa_bases
  bitmap populated by riscv_init_isa_bases() at init time, sharing
  one source of truth with /proc/cpuinfo.
---
 Documentation/arch/riscv/hwprobe.rst               |  8 +++++
 arch/riscv/include/uapi/asm/hwprobe.h              |  3 +-
 arch/riscv/kernel/sys_hwprobe.c                    | 34 ++++++++++++++++++++--
 tools/testing/selftests/riscv/hwprobe/which-cpus.c |  2 +-
 4 files changed, 42 insertions(+), 5 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 8454a6ae6fd15..c24630c672c43 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -67,6 +67,14 @@ * :c:macro:`RISCV_HWPROBE_KEY_BASE_BEHAVIOR`: A bitmask containing the base
       programs (it may still be executed in userspace via a
       kernel-controlled mechanism such as the vDSO).
 
+  * :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64`: Support for all mandatory
+    extensions of RVA23U64, as defined in the RISC-V Profiles specification
+    starting from commit 0273f3c921b6 ("rva23/rvb23 ratified").
+
+    Each base behavior bit is reported independently of the others.
+    Hardware that implements a later profile whose mandatory set includes
+    RVA23U64 therefore reports RVA23U64 as well.
+
 * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`: A bitmask containing extensions
   that are compatible with the :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`:
   base system behavior.
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9a121ee3b4369..4f5d51788c416 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -22,7 +22,8 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_MARCHID	1
 #define RISCV_HWPROBE_KEY_MIMPID	2
 #define RISCV_HWPROBE_KEY_BASE_BEHAVIOR	3
-#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA	_BITULL(0)
+#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA		_BITULL(0)
+#define		RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64	_BITULL(1)
 #define RISCV_HWPROBE_KEY_IMA_EXT_0	4
 #define		RISCV_HWPROBE_IMA_FD		_BITULL(0)
 #define		RISCV_HWPROBE_IMA_C		_BITULL(1)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index cd7cf272e6e11..5be5776b48e6e 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -223,6 +223,32 @@ static bool hwprobe_ext0_has(const struct cpumask *cpus, u64 ext)
 	return (pair.value & ext);
 }
 
+static bool hwprobe_has_isa_base(const struct cpumask *cpus, unsigned int base)
+{
+	int cpu;
+
+	/*
+	 * F, D, C, V, Zicbom and Zicboz are RVA23U64 mandatory extensions
+	 * that the kernel enables for user mode only when every hart has
+	 * them, partly because their enable bits (sstatus.FS/VS,
+	 * senvcfg.CBCFE/CBZE) are managed across all harts rather than
+	 * per hart.
+	 */
+	if (base == RISCV_ISA_BASE_RVA23U64 &&
+	    !(has_fpu() &&
+	      riscv_isa_extension_available(NULL, C) &&
+	      has_vector() && riscv_isa_extension_available(NULL, V) &&
+	      riscv_isa_extension_available(NULL, ZICBOM) &&
+	      riscv_isa_extension_available(NULL, ZICBOZ)))
+		return false;
+
+	for_each_cpu(cpu, cpus) {
+		if (!riscv_isa_base_available(hart_isa[cpu].isa_bases, base))
+			return false;
+	}
+	return true;
+}
+
 #if defined(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)
 static u64 hwprobe_misaligned(const struct cpumask *cpus)
 {
@@ -309,12 +335,14 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 		break;
 	/*
 	 * The kernel already assumes that the base single-letter ISA
-	 * extensions are supported on all harts, and only supports the
-	 * IMA base, so just cheat a bit here and tell that to
-	 * userspace.
+	 * extensions are supported on all harts, so just cheat a bit
+	 * here and tell that to userspace. Other bases are reported
+	 * only when detected.
 	 */
 	case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
 		pair->value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
+		if (hwprobe_has_isa_base(cpus, RISCV_ISA_BASE_RVA23U64))
+			pair->value |= RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64;
 		break;
 
 	case RISCV_HWPROBE_KEY_IMA_EXT_0:
diff --git a/tools/testing/selftests/riscv/hwprobe/which-cpus.c b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
index 587feb198c049..f8c797b1d0fd9 100644
--- a/tools/testing/selftests/riscv/hwprobe/which-cpus.c
+++ b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
@@ -105,7 +105,7 @@ int main(int argc, char **argv)
 	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR, };
 	rc = riscv_hwprobe(pairs, 1, 0, NULL, 0);
 	assert(rc == 0 && pairs[0].key == RISCV_HWPROBE_KEY_BASE_BEHAVIOR &&
-	       pairs[0].value == RISCV_HWPROBE_BASE_BEHAVIOR_IMA);
+	       (pairs[0].value & RISCV_HWPROBE_BASE_BEHAVIOR_IMA));
 
 	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_IMA_EXT_0, };
 	rc = riscv_hwprobe(pairs, 1, 0, NULL, 0);

-- 
2.43.0

