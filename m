Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795728777;
	b=N1rHcoGII4EBuQT0gCmkzBIc+38nHvhwcM7miwX4GPvY+EW/BzfFZ7bjvxaONA4Dbt+n
	 tizcKucIbdX/gJFibeIrsmfQJYBzDyOaLLLo5azqStkv0sByNfJBrL05uR1viLLpFa0Lg
	 Z5L8bDOxUW1lstK3aRNzYbOxvcrm4PibF9sgM2S9PDqbMXp+e+E4CJTEL8jrU7h3ZfwLZ
	 cG0Ypwu9TYXH3czsqudjGsmvh1ttJbKCIZL0LuUdnt6y4KXKTAash9a+MnNpNko4gLCrO
	 Te3chuthHh3M9Pztgnw7+e+7fgDIj0zN3ycrFNnI7JHwOmrRx0vKEEsmpQ97nrT+W6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795728777;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eLWydtdj4u/YSPsA6syueGuvzx4k7mkbZDaPefa/+TI=;
	b=U5dVkz/w51S+hHWK5DBqmC7H8d8pcao/Dz0zFhVtSW85dV11RWL4J//sgYU+x0/E1BzS
	 FstvMpo22roECkCGHdAZNSEB6nIlSiWtXL8FRilPyp/TBoIHTNoJEn6qO0RRfJ8cXWCzP
	 niXkAhlPOv8Z0uPHKn4oalBzLE4cEMJoegC5126QDWXIViKV5GzsZsla7upA5Ki3paV52
	 pOmQFsTgazddoRt6B2/yPswhTaEthWGiDEtrdZHIB2MuhGaf5lt6AVnl+gRs5jgfYINOe
	 AIsJhNXCJ2XAN7PD2OZwJVZcLBO/UrpTzD479psKtG2Gvn88FCSe/sDctR5GlukSZ5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JHLx2Vr5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aJuxI8ZS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69870606A321
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 21:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69870606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JHLx2Vr5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aJuxI8ZS
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJwDoe3864425
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 21:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eLWydtdj4u/YSPsA6syueG
	uvzx4k7mkbZDaPefa/+TI=; b=JHLx2Vr5hyiBZsuJzQUDrQJ1RemrlN5PjwxreF
	ZUi9WaKWwFBGV03+KuFRyoeR56YAwuZyq3wIEAPSla7vczGG+ZdqPMg1QwjpGJ7g
	ClmtVgHHjpLNwLyEPGixVsElqiMw8h99DAFdpOXx8NWZONRprFrKEP05fgGjN/3V
	gDfTnAUzhe7NU8MRp5CfU5vX0mLgKnlPW41GSI36b6ETxPRPKiWIZXHsa6HnjRoB
	gFoVWJSsCsjGxDW2N2SKAW6yJUOsRX87ySqrxb7ec00NZ1fQDTSw/KvCOkAg+an9
	rqq2E+EQBfPsmogMKvcrEWYCTSU0AK6vFO2jo9eYyAMLezqQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55r6rx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 21:32:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f074b87307so44589855ad.2
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 13:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795728774; x=1796333574; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eLWydtdj4u/YSPsA6syueGuvzx4k7mkbZDaPefa/+TI=;
        b=aJuxI8ZS2kzedL9NJfD9EUV3by4eTi+LcX4WkQ9lElrtXxPTE1J9Oe44X/z50Qr9oV
         O7Ss7TKVylEb303wEmROzsINEQfj0LqFDyJOag9dkx8z8jRRz/pore+68rTqUJKeX8/O
         kaQSW5PaKvrxV40+Ihc5g0kLIzC6xCq/xx71ZuCQzit/qcff5PdAphzGOpGtOrzzaxG3
         rCwnPaXrOw2Tm721sB+RJm7P6iCX/kVDHyZjhBINVODoOXSCbI01a/9qr1C8QnXjYSTR
         1/pWQXYCta6ZbQ1BEm0mGTTntUqWdstYyJDUQrBw9aneeKI9hQkCOqtISaiWhCP/SPsA
         oYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795728774; x=1796333574;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eLWydtdj4u/YSPsA6syueGuvzx4k7mkbZDaPefa/+TI=;
        b=woVxRdkvldmg8dmOwwO5PlSFQqfgS+hkoUuQCASkZAtVV2EekCCwbb8k+T5rr4UI4R
         V1J7m0wL9W54WapOtrElx9i/l+AWFAzTVADAWBp/PHNjNmM+8H4S4Nd417lhZeYItPXm
         yCWSrYteqy0twwYPjsVxbWdcOwKPR/5W9kHVZ5ef49p/afFaj5sQvQR7Lt6p+Mrq42oK
         +YL8JLc+UcMGOHhlB0dkx5axSQUVNbG27Kj8H6RZ7PX16N3W9UIweJL9AfsF96SpWEmV
         DTZO4y25mBIEstYJ86Qhug4Tndbmo9mlji/Wtt8MZSLPXoNXaYmTYPhRTZevc3SaOzuA
         f06w==
X-Forwarded-Encrypted: i=1; AL+hErFrMGfGv7XxLDVS5dPLJQaK4EoQHwHd57ppJUopf1AoVSnKAKAjrcxheJRRiAQ2XIaXEgDEmRnNn4fAGBAqJuA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vNkPe3We5HONxJeuHZwg6r1wjlxP6GLPpiViGFNFapzpufqqy
	YGsTM8Av0O8O5mcduLI+/ERaUK56s96MlK/LW02G1rk10ZQEg5w7995QlpK/2PY3+IV+hzF6BIL
	LHXiax81PiR2eMtTmhWtwdfL31Sz8nSlZ36ewLX82r4ROvePh1p7FZAMm4cq2ix/Kb/Tb6Mw=
X-Gm-Gg: AZFdTZdMfvBEg9h4D6/TYtnJhICyIH8E58H8WHXc85X9E73E/wXXamS1/1/c/FwzyDj
	+9U2t64QD6pqiu9xNRydXRqH/olJr9Z9keSv0V3qJX4hJXLxOidloyEmOJ2YGtGvNIVVEz6o5Fv
	1WmvxAP/cVOc7tfsqxWbh/ilKuJZoxkf8oauzwhAwB12ySWXiXD2j/ttvBAXin+spFh4yif5VKT
	tiBAXe2sv8Zku0c8Ycck7C9lcI11MsCuCGgoC8Fd8GJmGg0rpm2YF2MsMdwzUDfEoEa8cA1/yao
	nDpSNSYJpqbs4K7qMvTZxAqoFbOM5sU9rd/i7Imm7nwruX81uFMedkaQa2Z20V7PePoR2MO9hfd
	cKUJRTq9LNV+/PNkWJdExjFX+Em7jJl/TAtWcIfIvkwxXKCYJURseTnSONGBoZ7A524nM1IHe1B
	GLb82Inejpow==
X-Received: by 2002:a17:903:298c:b0:2ed:2176:2452 with SMTP id d9443c01a7336-2f03f155229mr230207215ad.18.1795728773722;
        Thu, 26 Nov 2026 13:32:53 -0800 (PST)
X-Received: by 2002:a17:903:298c:b0:2ed:2176:2452 with SMTP id d9443c01a7336-2f03f155229mr230206925ad.18.1795728772952;
        Thu, 26 Nov 2026 13:32:52 -0800 (PST)
Received: from localhost ([120.244.9.31])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b66sm109304205ad.51.2026.11.26.13.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:32:52 -0800 (PST)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Subject: [PATCH v10 0/4] riscv: hwprobe: Expose RVA23U64 base behavior
Date: Thu, 26 Nov 2026 16:32:28 -0500
Message-Id: <20261126-rva23u64-hwprobe-v2-v10-0-bea130335fc4@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAGylCGsC/3XQzW4CIRAH8FdpOHcNDN89+R5NDwPLKo26FnTbx
 vjuBdt0jWETLkOG33+GC8khxZDJy9OFpDDFHMdDKRh9fiJ+i4dN6GJfLghQUFRS06UJgZ+V6La
 fxzS60E3QsR6o5tY7ZwIpL48pDPHrxr6+/db57N6DP1WqdmxjPo3p+5Y7Qe37S2CsmVAO7YB5i
 VKIgfV+nWL2+YRp5cc9qSETnxlFeZvhhZESLGoHhhux3uwx7mZD3BlLo4hi8IEyBCGsMObRkLO
 h6YIh6zpescEKVFbio6FmwzBoG6oY3hqJAwepnFmPOa8+zrgryn6m9ExZJtuULhQil8H1FoNVC
 5S5o4C2KVN/eGDCeemB93yBsv8UY9S2KVunCkaoQmmmWwter9cfyppO18QCAAA=
X-Change-ID: 20260508-rva23u64-hwprobe-v2-1d20739cbb8e
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
        Aurelien Jarno <aurelien@aurel32.net>, Icenowy Zheng <uwu@icenowy.me>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Andrew Jones <andrew.jones@linux.dev>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=10372;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=yndesCy2mpR+9QdqsccLyAAxMkDEN5MRk1Vq7DXHtcY=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhmyOpcWvpVtNt0jqXM7lfP2ls+jjdkdenaxvm+Z0NhXGL
 5g34fzXjlIWBjEuBlkxRZbDR1uyt77yifZ9zvkDZg4rE8gQBi5OAZjInJkM/wvuOAuLdnOxKfcV
 TDF8feeOYK6m2lWH3A0lvY0rj+35tpyR4UJnurh/stZTmUVGk6cfrVyumH4wauHKl3/kGu0S3sx
 h5gEA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA4NCBTYWx0ZWRfXwN/3p5Hv+uE3
 P/7hnzx/PFvVIUJ4FCHuIOMgnL7peZB5Ds/Ciyb3X2ziYkcTV3+7YRL5WkyhNEr1aL0vbQshAzp
 //GNo1ESfMlLWLpXVuFjAdhxhBoNKdQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA4NCBTYWx0ZWRfX2sJ6x0+ma8DD
 wyQi8MFDs6qNL6YzS7YhdGnKBKpFJUB/slzoWZ5EzeSXw06+KosST/kdn4hk5jnw4qIdWmI+lS3
 2f18fIwKzoavg+CYP5Sn6sXWnrUqyXTm2JMytCuWq9w33Bvf5w81dcTWYZJKVPY1RsL07nzjwaq
 6f7BjjmIOxC51dsVy8r22e1sBBMNR1DWpkF+uPbRwL51G1SvQd2r8AZHA2qo2kZgnFuZufxunQ0
 0lzd9G2IMV3YFEh7ExY2yOqLXUEjFPUxSko+zPn22WC2hC0CA1TcreYVZYIkCr8AtuBWH7RkdJF
 X5Gl910RMXC3ZynG7A/+La2N1B6PhU7sJa6kvMFgHpg8jXgXtyYmNMsTX0/RukBLV5T/T0ASK3/
 n2rl8nQ/Ok54W5wfixfTsuf3QXF19+/ffgm9Qwf4ihyOp+RwdJIujaLoF28CK8mifTId8j3azcP
 2tSBow2sWfEnSfpEihg==
X-Proofpoint-ORIG-GUID: oTRCG0UZACMunjjPIG3WPb5Rw-MCJ8Io
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b08a587 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=r1R2P697X4eI0gH+iewh9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=bC-a23v3AAAA:8
 a=pGLkceISAAAA:8 a=ee_2aqc6AAAA:8 a=o92ZdCqwNWKphytya3sA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=FO4_E8m0qiDe52t0p3_H:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-GUID: oTRCG0UZACMunjjPIG3WPb5Rw-MCJ8Io
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260084

This series builds on Andrew Jones's earlier RFC [1]. It lets userspace
check for RVA23U64 conformance in one call, instead of walking hwprobe +
prctl across every mandatory extension.

The series adds a small framework that resolves profile-class bases
(currently RVA23U64) from the kernel's ISA extension bitmap at init time,
and surfaces the result, together with the IMA base, through
/proc/cpuinfo. hwprobe reports the same bases, derived from its own
extension keys, so that they follow what the kernel enables for user
mode. Later patches can add other bases, such as RVA20U64 or RVA23S64,
without changes to the surrounding code.

One change since v9.

From Radim's review of v9 3/4 [3]:
- hwprobe no longer reads the isa_bases bitmap. RVA23U64 is reported
  when PMLEN=7 is selectable and all RVA23U64 mandatory extensions are
  reported in IMA_EXT_0 and IMA_EXT_1 (I, M and A are the IMA base, and
  Zicsr is implied by F). The bit therefore follows any fix to the
  extension keys, including the host-wide rules in Radim's series [4],
  with no second copy of those conditions in hwprobe.

Part of me is a little concerned about the hardcoded masks,
RVA23U64_EXT0 and RVA23U64_EXT1: they are an exhaustive list of the
RVA23U64 mandatory extensions, and another exhaustive list, as
__set_bit() calls on RISCV_ISA_EXT_* bits, already exists in
riscv_set_isa_bases() in cpufeature.c (patch 1). Merging the two into
one source is not straightforward. But as said, RVA23 is ratified and
no further change to the list is expected, so I tend to keep them as
they are in v10.

Unless someone has a different opinion; please speak up.

With that, series outline (v10):

   1:  cpufeature: per-hart and host-wide isa_bases bitmaps; RVA23U64
       detection for /proc/cpuinfo lives here.
   2:  /proc/cpuinfo: print "isa bases:" and "hart isa bases:", e.g.
       "rv64ima rva23u64".
   3:  hwprobe: expose RVA23U64 as RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64,
       derived from the IMA_EXT_0/IMA_EXT_1 bits and PMLEN.
   4:  hwprobe.rst: note on what "supported" means for a hwprobe bit.

Note: patch 4 states the rule for all hwprobe keys, but some keys only
follow it with Radim's series [4], such as the Zicbom/Zicboz keys.

Follow-ups I plan to post separately:

- A series exposing these extensions to KVM guests (extending the KVM
  ISA extension ONE_REG interface), on top of this one.
- A series adding further bases: RVA20U64 first, then RVA22U64 and
  RVA23S64. RVA20U64 also needs Za128rs support in the kernel, which
  will be part of that series.

Tested on QEMU (virt machine, 4 harts):
1) With '-cpu rva23s64,sv39=on', /proc/cpuinfo reports
     "isa bases : rv64ima rva23u64"
   on both the aggregated and per-hart lines, and hwprobe
   RISCV_HWPROBE_KEY_BASE_BEHAVIOR returns
     BASE_BEHAVIOR_IMA | BASE_BEHAVIOR_RVA23U64
   through both the vDSO and the raw syscall. The riscv/hwprobe
   kselftests pass.
2) With '-cpu rva22s64', /proc/cpuinfo reports "isa bases : rv64ima"
   and hwprobe returns BASE_BEHAVIOR_IMA only.
3) With device trees in which one hart lacks an extension: when that
   extension is D, C or V, RVA23U64 is not reported for any CPU.

A branch is available for all patches in the series: [2].

v10 is based on v7.4-rc1.

Thanks,
Guodong Xu

Link: https://lore.kernel.org/linux-riscv/20260206002349.96740-1-andrew.jones@oss.qualcomm.com/ [1]
Link: https://github.com/docularxu/linux/commits/b4/rva23u64-hwprobe-v10/ [2]
Link: https://lore.kernel.org/linux-riscv/DMXIDXA2V2S5.M1C8TT9U62FQ@qti.qualcomm.com/ [3]
Link: https://lore.kernel.org/linux-riscv/20261006075303.205216-1-radim.krcmar@oss.qualcomm.com/ [4]
Link: https://lore.kernel.org/all/c24e720e279fed0296f1f78630b6a471.guodong.xu@oss.qualcomm.com/ [5]

Changes in v10:
- Patch 3: report RVA23U64 as a function of the IMA_EXT_0 and IMA_EXT_1
  bits plus PMLEN=7; drop the isa_bases lookup and the host-wide gate
  from hwprobe (Radim). hwprobe_ext0_has() takes a mask; add
  hwprobe_ext1_has().
- Patch 1: reword the commit message and comments; isa_bases now feeds
  /proc/cpuinfo only.
- Patches 2 and 4: no change.
- Link to v9: https://patch.msgid.link/20261109-rva23u64-hwprobe-v2-v9-0-ae846c5c7178@oss.qualcomm.com

Changes in v9:
- Dropped patches 1-8 of v8, which have been applied by Paul. Rebased
  the remaining three onto v7.4-rc1; patch 2 (10 in v8) has no other
  change.
- Patch 1 (9 in v8): set the IMA base unconditionally; do not derive it
  from I, M and A.
- Patch 3 (11 in v8):
  - Report RVA23U64 only when F, D, C, V, Zicbom and Zicboz are present
    on every hart (Radim).
  - Revert RISCV_HWPROBE_BASE_BEHAVIOR_IMA to hardcoded; do not compute
    it from I, M and A.
  - Reword the commit message.
  - Update the hwprobe.rst.
- New patch 4: add a note to hwprobe.rst that clarifies what
  "supported" means for a hwprobe bit (Radim).
- Link to v8: https://patch.msgid.link/20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com

Changes in v8:
- Patch 10: Andrew Jones is the author; most of the code is still his
  from the RFC. Added my Co-developed-by (Conor).
- Patches 09 and 11: added Co-developed-by for Andrew Jones ahead of
  his Signed-off-by; the RVA23U64 bit, the hwprobe.rst text and the
  mandate list came from his RFC (Conor).
- Rebased onto riscv/for-next at e11160948333. Patch 11 drops its own
  pair->value = 0 in the BASE_BEHAVIOR case, since commit d0fc6fab2046
  ("riscv: hwprobe: initialize pair->value in hwprobe_one_pair()") now
  zeroes it for every key. No other code change since v7.
- Link to v7: https://patch.msgid.link/20260915-rva23u64-hwprobe-v2-v7-0-aa35ebd9ae96@oss.qualcomm.com

Changes in v7:
- Patch 09: register riscv_init_isa_bases() at arch_initcall so the vDSO
  hwprobe snapshot (arch_initcall_sync) sees the ISA bases; v6 returned 0
  for RISCV_HWPROBE_KEY_BASE_BEHAVIOR through the vDSO, IMA bit included,
  while the syscall path was correct [5].
- Patch 09: keep riscv_isa_bases static and add riscv_isa_base_available(),
  mirroring the extension accessor; patches 10 and 11 use it.
- Collected Acked-by from Conor Dooley on patches 02 and 03.
- Rebased onto riscv/for-next at 77ae27fd98f3 (post 7.3 merge window);
  no code adaptation needed.
- Link to v6: https://patch.msgid.link/20260812-rva23u64-hwprobe-v2-v6-0-c985af3256b8@oss.qualcomm.com

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
Andrew Jones (1):
      riscv: cpu: Output isa bases lines in cpuinfo

Guodong Xu (3):
      riscv: cpufeature: Introduce ISA bases bitmap and rva23u64 detection
      riscv: hwprobe: Introduce rva23u64 base behavior
      riscv: hwprobe: Document that keys describe the user-mode environment

 Documentation/arch/riscv/hwprobe.rst               |  29 ++++++
 arch/riscv/include/asm/cpufeature.h                |  13 +++
 arch/riscv/include/uapi/asm/hwprobe.h              |   3 +-
 arch/riscv/kernel/cpu.c                            |  26 +++++
 arch/riscv/kernel/cpufeature.c                     | 106 +++++++++++++++++++++
 arch/riscv/kernel/sys_hwprobe.c                    |  54 ++++++++++-
 tools/testing/selftests/riscv/hwprobe/which-cpus.c |   2 +-
 7 files changed, 226 insertions(+), 7 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260508-rva23u64-hwprobe-v2-1d20739cbb8e

Best regards,
--  
Guodong Xu <guodong.xu@oss.qualcomm.com>

