Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7A4430CDC
	for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 23:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786577701; cv=none; b=CFhTo6RDYyZvN/n83vMgmxVfGc3rRtq+4p7efA/ZmdqQFSNvaT/dLYvtfQexlkAdt6lg81gd9LPxdtzB2bz/OZ/2vXvxRwv5Tf8kpvwiTHN4lR9mAonbCOKKPvnKxNyEHYQXs7oGGALHHoDJD1IwGKhU4IOfO0DxbERoeVWGnxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786577701; c=relaxed/simple;
	bh=Ra/3+L2jk7U4uMiXwJ9Zce9uuTlc+DLXBTrbeJepa0I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mSYA3tAZXK+UPN+RL8BGbjP0BUmzPc7xsEqXfLXVu0QGBj8N5e1f1CqteGzyMuFPWIXK88cZPfo92Qs9FU0MzPIpPztayXZ4Q3ms7O66xm4Maxh4QYaRYMy7DWxEQK+InjItwW6JzProHs4icwndXvXDK82ZxDvZ+ZGkkr4h3XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JOrXZ5u0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B7XJ4RlG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JOrXZ5u0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B7XJ4RlG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CNMGKF1060116
	for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 23:34:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rQQQsvIekjUAhCQLM9e1Lc
	nQBBvYngS//Y4JXycReKM=; b=JOrXZ5u0U66MgSvSjPPPblL3kVtmSR789snhmu
	76tkC965PbIhOmUE8Wyl2DwCOkb5QqOQDeGjbSrJFXGb+YWqwYQPAkSM7Rca+pY5
	IlfnkNGWmb6s7u7uR3nwByVjOKyKRlTCxxPbBlG4PdSHrRXFkT7+u+CIwRDcZdHG
	PalJVcIUhB9fjnTZJhmrMvb4SLoDvE+EYGZ5TlbrPUr+1vdnxEkTvK55WVqIUyyO
	1UdWgbAu/KefEWSHk0S4n+ZPDFehtYxTKV6/tDGNlGtGIOKqWBmZXk7VIgece4r1
	pWWMtatI6dk5DN0GnlEoHkvFa8e20a+Sy3/wR3JImus9c6+Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g11asg8dv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 23:34:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so3221625ad.3
        for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 16:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786577696; x=1787182496; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rQQQsvIekjUAhCQLM9e1LcnQBBvYngS//Y4JXycReKM=;
        b=B7XJ4RlGWTloU+e0UXVgQSjvyWgMXv+DEapQsMDhtXMh5AiytwAncKT6iXQw8FKwN+
         nh2pzBwAIfmqYWI2Yd+dAB1UC8IfZHSuLu1P+kK4XZX2ToYxX5v0ZqeAK/oUl/9ALfts
         em1sMfUjO59ROLfKpdicAmxt2P/4+Y4AiDCLPddBIjsFMMOnxOqn/uZIwGOOpTbRlvIp
         K2ZGJEfy1oiKaLEIjz0HNPsX1ITQZ/CAzfebJMAodyDoUfJBNfVoQBhVas6iyJxz2uZj
         qBBAAHtNyRc43WUlrRkDAeW+vafTLPRqJ42eHYeq1C7kc72eyKxcJIaVoZaRT1HPfgZN
         CAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786577696; x=1787182496;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rQQQsvIekjUAhCQLM9e1LcnQBBvYngS//Y4JXycReKM=;
        b=DKGxL2TcZCxUu1q7ucc1NoHuJdoPOFHwGRJkFijollrZngrvApVEixY638IJgHVrIm
         NPaRnX0uO+zNhrt/FX4zETndsuwpOTcqcAx+QDpFv4NlQI0VCq/SCYM9TE9W43tJ+K39
         WvHK6SVKNEGBhTrwObZ2Ny/i5Jxfgp5BoGq6U2fEbvfUAvHZttB8yLza8Q1moOdFqtjV
         pn6DpuFJcat4xHjqY4wWW+ueQi2DWiLSDG8RJkpWOc5je3vbopkQqXBsyKu0kcyvsJMM
         CDkADpV5YCELaQv46QknuS/zCbUOTPkgsXxKxbjxFL6pGvjFDNfi/D+2bljPy5CZ8rsP
         g7Kw==
X-Forwarded-Encrypted: i=1; AHgh+RrPzYD11VKTHrSRDrAv2uJ7B1j/6GROl+9dxUSZDkYTdlztlcQOgA1TUvV9XJuywPrHY4z6UOdra8IDAVqiP/M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/8yOpXxUcm0FV3HDagp2tLsOMLkH3u2IqLMUsG+xkHToIK5lb
	PrHWxVq3QMDoT80MK8v6kxrnnhq2Ziqewz79fhj0MyJ7nM3VIyf4bhqI9BjQ/Q4fxPMR/KnX/AH
	jrrtf4yqVcelg5ujTXbYZ3M4IIJv7LwG+A936eGHvNbXbxdN7C3LfOadzcuZkBuh4F3zIYBY=
X-Gm-Gg: AR+sD11318KE79hWp9yTefKxOqHZ0GpDi5bxZMUs95FwGFPJxD+Kr6IWyj8nW1SKAK9
	4iBvJRTTLk3z5agoEDMoVVUZBZXpdch82nFEWsF6cjPIhZfIY6smPKDKS97zZAl+ynxjD7ZhebW
	Za3znrTJOF74P71nVNe48XnUpK4RWOoyTzo7HmPfwC1u6yhENXos05G/qT1FT6FHizealXMBrzu
	eY9ADSlagjw6xwsr/kESvjWQGxZeDuoLu5rj8wn+yY99rtbGx0WG+srb8a0KT9PPcBWXFa25TaW
	aMGkIJayD9P3WV7Vum3P90Y9LS+Iv9zzcVZUjKS6rPUBLp4vzlEAyLSDms34hQ==
X-Received: by 2002:a17:903:1209:b0:2cc:a977:4260 with SMTP id d9443c01a7336-2d37f0d36d3mr16031925ad.21.1786577696226;
        Wed, 12 Aug 2026 16:34:56 -0700 (PDT)
X-Received: by 2002:a17:903:1209:b0:2cc:a977:4260 with SMTP id d9443c01a7336-2d37f0d36d3mr16031585ad.21.1786577695706;
        Wed, 12 Aug 2026 16:34:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c26d0fbsm2136805ad.37.2026.08.12.16.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 16:34:54 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Subject: [PATCH v6 00/11] riscv: hwprobe: Expose RVA23U64 base behavior
Date: Wed, 12 Aug 2026 19:33:46 -0400
Message-Id: <20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANoCfWoC/3XPwWoDIRAG4FcJnmvRcXS1p7xH6UFdN2tpskE3N
 iHsu1fTwoaSwFx+GL9/vJIcUgyZvG2uJIUSc5wONaiXDfGjPewCjX3NBBgoJpmmqVgQJ4V0/D6
 myQVagPIeWCeMd04HUl8eUxji+aa+f/zmfHKfwc+NahtjzPOULrfaAm3vr4Hzhw11GAXupZWIA
 +/9NsXs82zTq5/2pJUUsTKKiceMqIyUYGznQAuN293exq/VwDvj2SlYDTEwbgHRoNb/DbkaHXt
 iyPYdr/hg0Coj7b2xLMsPC7Q1LJcBAAA=
X-Change-ID: 20260508-rva23u64-hwprobe-v2-1d20739cbb8e
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
        Conor Dooley <conor.dooley@microchip.com>,
        Qingwei Hu <qingwei.hu@bytedance.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7265;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=Ra/3+L2jk7U4uMiXwJ9Zce9uuTlc+DLXBTrbeJepa0I=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqxaZk7Vi43XPISfdsgu9fnKaOvq6ta0pijLO1/7gJuWt
 8Kz9NCOUhYGMS4GWTFFlsNHW7K3vvKJ9n3O+QNmDisTyBAGLk4BmMjE9wx/uBKPMYatVvn7tu+a
 6jLxzOqtv/bIcS55fy1TrG16qFroXUaGfYLyzDd2Fol8Zr72SXldirr8HvPb3fUzJ9Y3PndJt//
 KBAA=
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Authority-Analysis: v=2.4 cv=EujiaycA c=1 sm=1 tr=0 ts=6a7d0322 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8
 a=ee_2aqc6AAAA:8 a=A54KYWeCNih9maOHq1sA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=FO4_E8m0qiDe52t0p3_H:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfXzUoKzFs1XxYd
 t6iRgugu2MuZ7ZW+sZ8T5MjTnOIB2lWCLBxVw0pYvZbQQydPPx26YDUkeIqOR7JQlf6+mHzw8u8
 9HkvKQmnI1gqWuYDsPg7Ww5oIBq+KnuvkoM0bKe5G7Kqnsg09fqLwPKaNJZwsIDQ10k+7Ps5ll4
 gJWGmBaWlVplBMjsXkUTdTarEiHLtHfCtVTRsGfoXxjSWhYBDInyjV+ptUB2WLX+65byljcaOQN
 2bMshn0Jg3aSdExUurBfhZsMwA3O7xIoitILUae/jPHkouOcPq3C75SrrRklQnkjMSpy0zkgjtN
 R18wFwfEAudonmFplBJ7Ed94qX6hup6qlu2Hqssf6gQrzFpm52ud1Zetm/8EEfySfwnb1tJB45Z
 pPL1HmnICol2t2LeBPBx13nnXvRqnqmaQXgJfUXOYJn7ltuJmDdkfAQKb6JhTxtWbQwxnl8jwXH
 3hvCV+LIcQwNhtatv8Q==
X-Proofpoint-GUID: 6ekK-Qea8l8Fxu7c035Sj6_cK3YTFLHM
X-Proofpoint-ORIG-GUID: 6ekK-Qea8l8Fxu7c035Sj6_cK3YTFLHM
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfXygu51ATuTa9D
 r1wjlok4X456Sp/TjUB6Ii4GbDKVdKyD4D2If1rx6UV/kooh3c6kzGWoPJLbpM8mJKIPnuftBts
 HS+OqjVoi0DXLKoqoiZ23qRp8mtSfm4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1011 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120190

This series builds on Andrew Jones's earlier RFC [1]. It lets userspace
check for RVA23U64 conformance in one call, instead of walking hwprobe +
prctl across every mandatory extension.

The series adds a small framework that resolves profile-class bases (IMA
and RVA23U64) from the kernel's ISA extension bitmap at init time, and
surfaces the result through both /proc/cpuinfo and hwprobe. Later patches
can add RVA23S64, and backward RVA22 / RVA20 detection, to
riscv_set_isa_bases() without changes to the surrounding code.

Note: starting with v6, this series is sent from my Qualcomm address,
guodong.xu@oss.qualcomm.com. Earlier versions came from my personal
docular.xu@gmail.com (v3-v5).

Patches 1-6 of v5 have been applied by Paul Walmsley (1-3 through
riscv/fixes for v7.2-rc, 4-6 queued in riscv/for-next for v7.3), so v6
carries the remaining 11 patches, rebased onto riscv/for-next.

Series outline (v6):

  Per-extension cpufeature parsing + hwprobe export:
   1.  B (the Zba/Zbb/Zbs set).

  Zic64b (new first-class extension):
   2.  dt-bindings: require a cbom/cbop/cboz block-size property whenever
       the matching Zicbom/Zicbop/Zicboz is present.
   3.  Zic64b dt-binding, with a schema check.
   4.  Zic64b cpufeature parsing + hwprobe export.
   5-7. dts: declare zic64b in the SpacemiT K3, SpacemiT K1, and Sophgo
        SG2044 device trees.

  RVA23U64 base detection and exposure:
   8.  riscv_have_user_pmlen(): accessor for user pointer-masking PMLEN
       support.
   9.  cpufeature: per-hart and host-wide isa_bases bitmaps; IMA and
       RVA23U64 detection lives here.
  10.  /proc/cpuinfo: print "isa bases:" and "hart isa bases:", e.g.
       rva23u64.
  11.  hwprobe: expose RVA23U64.

A follow-up series exposing these extensions to KVM guests (extending
the KVM ISA extension ONE_REG interface) will be prepared on top of
this one and will be posted separately.

Tested on QEMU: with -cpu rva23s64,sv39=on, /proc/cpuinfo reports
"isa bases : rv64ima rva23u64" on both the aggregated and per-hart
lines, and hwprobe RISCV_HWPROBE_KEY_BASE_BEHAVIOR returns
BASE_BEHAVIOR_IMA | BASE_BEHAVIOR_RVA23U64.

A branch is available for all patches in the series: [2].

Link: https://lore.kernel.org/linux-riscv/20260206002349.96740-1-andrew.jones@oss.qualcomm.com/ [1]
Link: https://github.com/docularxu/linux/commits/b4/rva23u64-hwprobe-v6/ [2]

Changes in v6:
- Rebased onto riscv/for-next; dropped patches 1-6 of v5, which have been
  applied by Paul.
- dt-bindings block-size: only match nodes that have
  riscv,isa-extensions (fix suggested by Conor, breakage reported by
  Rob's bot).
- Zic64b dt-binding: guard the zic64b rule the same way (same defect
  class, found while fixing the above).
- Follow the _BITULL() style of commit 8da45c93dfa9 ("RISC-V: hwprobe:
  Use BIT macro to avoid warnings") for the new hwprobe bits (EXT_B,
  EXT_ZIC64B, BASE_BEHAVIOR_RVA23U64).
- Zic64b: RISCV_ISA_EXT_ZIC64B renumbered 110 to 116 after upstream
  additions took 106-111.
- Link to v5: https://patch.msgid.link/20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com

Changes in v5:
- Rebased onto v7.2-rc1.
- New patch: make riscv,cbom/cbop/cboz-block-size required whenever the
  matching Zicbom/Zicbop/Zicboz extension is present (Conor).
- Ziccamoa/Za64rs: drop the Zaamo/Zalrsc validate callbacks (Conor).
- Zic64b dt-binding: fix a double space in the commit message (Conor).
- Collected Reviewed-by and Acked-by tags in v4.
- Link to v4: https://patch.msgid.link/20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com

Changes in v4:
- New patch: sort the multi-letter Z extensions alphanumerically in the
  dt-binding (Conor), and place zic64b at its sorted position.
- Zic64b cpufeature: validate only the CBO block sizes that are present;
  overlaps Qingwei Hu's earlier patch, so it is now authored by Qingwei.
- Document EXT_ZICFISS / EXT_ZICFILP: cite the riscv-cfi v1.0 tag commit.
- Picked up Inochi Amaoto's Acked-by (SG2044 dts) and Andrew Jones's
  Reviewed-by (documentation patch).
- Link to v3: https://patch.msgid.link/20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com

Changes in v3:
- Add Zic64b as a first-class ISA extension: dt-binding, cpufeature
  parsing with a validate check, hwprobe export, and device-tree
  declarations for K3/K1/SG2044.
- Patch 1 is now a clean up of hwprobe.rst indentation.
- Document RISCV_HWPROBE_EXT_ZICFILP alongside ZICFISS.
- Move the Zicclsm hwprobe.rst entry to the IMA_EXT_1 section to match
  its bit allocation.
- Collect Anup Patel's Acked-by/Reviewed-by on Patch 3, the capitalization.
- In cpufeature.c, set the local ext_mask with __set_bit().
- Update Guodong Xu's email to docular.xu@gmail.com.
- Link to v2: https://patch.msgid.link/20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com

Changes in v2 (since Andrew's RFC v1):
- Rebased onto v7.1-rc2.
- Reworked rva23u64 detection into per-hart and host isa_bases bitmaps,
  shared by /proc/cpuinfo and hwprobe.
- Scoped to IMA and RVA23U64 (RVA23S64, RVA20/RVA22 cpuinfo output deferred).
- Link to v1:  https://lore.kernel.org/linux-riscv/20260206002349.96740-1-andrew.jones@oss.qualcomm.com

Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
Andrew Jones (2):
      riscv: Add B to hwcap and hwprobe
      riscv: Add a getter for user PMLEN support

Guodong Xu (8):
      dt-bindings: riscv: Require block-size for Zicbom, Zicbop, and Zicboz
      dt-bindings: riscv: Add Zic64b extension description
      riscv: dts: spacemit: k3: Add Zic64b ISA extension
      riscv: dts: spacemit: k1: Add Zic64b ISA extension
      riscv: dts: sophgo: sg2044: Add Zic64b ISA extension
      riscv: cpufeature: Introduce ISA bases bitmap and rva23u64 detection
      riscv: cpu: Output isa bases lines in cpuinfo
      riscv: hwprobe: Introduce rva23u64 base behavior

Qingwei Hu (1):
      riscv: Add Zic64b to cpufeature and hwprobe

 Documentation/arch/riscv/hwprobe.rst               |  16 +++
 .../devicetree/bindings/riscv/extensions.yaml      |  54 +++++++++
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi        | 128 ++++++++++-----------
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  80 ++++++-------
 arch/riscv/boot/dts/spacemit/k3.dtsi               |  48 ++++----
 arch/riscv/include/asm/cpufeature.h                |  14 +++
 arch/riscv/include/asm/hwcap.h                     |   2 +
 arch/riscv/include/asm/processor.h                 |   4 +
 arch/riscv/include/uapi/asm/hwcap.h                |   1 +
 arch/riscv/include/uapi/asm/hwprobe.h              |   5 +-
 arch/riscv/kernel/cpu.c                            |  26 +++++
 arch/riscv/kernel/cpufeature.c                     | 117 +++++++++++++++++++
 arch/riscv/kernel/process.c                        |  12 ++
 arch/riscv/kernel/sys_hwprobe.c                    |  25 ++--
 tools/testing/selftests/riscv/hwprobe/which-cpus.c |   2 +-
 15 files changed, 397 insertions(+), 137 deletions(-)
---
base-commit: acf3fcb5e9199cc96ca033ec3c7570b6564c2e9e
change-id: 20260508-rva23u64-hwprobe-v2-1d20739cbb8e

Best regards,
--  
Guodong Xu <guodong.xu@oss.qualcomm.com>

