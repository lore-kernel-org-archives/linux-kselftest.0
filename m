Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795728798;
	b=qwtYEYHhIdXK9COlDmMtlnLzhDia8uwXiaeVgB3/l3L7bVuFduI1kV3QD9SND/B51J0O
	 OG1rkZdNWtLYcPfLW8zhAFSG1NB8E09GYUO00nVbnhBS3EzoRcMRxit+6LZeIoWuSwP5F
	 YKAOeX0VOMmnmIRlDqwwG9k1K16prWpnifg8CTAfLAu04aX6Stb56BU8Iof2H/FO/sfb3
	 +ZoQTX/FVZcHH+KXnVaIyrm4Pjke9zrTaoyqq2T6qD/4ZJH48omtaXkjAO1MOWkloK8qM
	 y4cqeJJYEgQ4kLcA0lx34a5Mic+872Ld/Pzs095rlSvcHPxcBdWiXRp1pRjOprcW7DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795728798;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=K3z/8Pdbqw7mOchnPI5sAjkgLG9JNDJAvAK03r0XyDE=;
	b=J/PF3wkKJ6d5ALMj82yA9/Dnn2Vbm3wS17zJgaFawIr6BbWXV8H8TpIrymDBitL+OWEO
	 4dWAOLFquMjB9A6Gg2UTGLYye7KqAXfe6BZ9mblTtYnQDeVffE3Cwu9LPWyuxIyvm3t3s
	 m3crHJFEaOpeLt/YXNBdhR3l4tFAcwv0TKjPycAAuqv1KljlLrdCC3X9SDCuwz0f15X9b
	 f14paYs0WdgHaqPWk1FauUZMrOI4BiGnu4M3DWrvmjSn37u3wYumir2sdB3ftyLBr2gOP
	 NwrYzJhy7ZOq017JEHLuc5zTc7KfTdNE98Tm8VwpsP3Y5neIo5Awihel1animG5S+sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fgi6aWJ+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HFJdMeD3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CC9606A323
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 21:33:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8CC9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fgi6aWJ+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HFJdMeD3
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJwpRE783351
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 21:33:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K3z/8Pdbqw7mOchnPI5sAjkgLG9JNDJAvAK03r0XyDE=; b=fgi6aWJ+/r/8Fhc7
	G2mJMzNuj1rPRDSa3+Wt3IVpR3qiF9X7+emw/fzz4GSy+lIavr4qFJqWcKQnJQSz
	wmZzSORgB0RVa38RaEbiAc0R3i/7pfzWsLqnQFH3Md+E13F+wTQnlxbnum6ndfq/
	l4N4b58TN+IW3f4Rd/oVRs/dpXBzL0f0UuWxQyTU2Sq5aEIpcbyc6DABz1+Cx+Vh
	i+TzMv9XBkKJqsITiGb9AK6TizaVNsBnEzzh2y6B/ZBpX5Y3j1mr9zxC9oTa1JV3
	GuBsLx6u6NwirwF91KMYHjMRHnLVImZrmpyi2zR0au4rCZIyY/yTcDo+ioFU7Y+7
	vvBtmw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm82bws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 21:33:16 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b41f4ca1bfso5637992a91.1
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 13:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795728796; x=1796333596; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K3z/8Pdbqw7mOchnPI5sAjkgLG9JNDJAvAK03r0XyDE=;
        b=HFJdMeD3j372ZJ4+Nter+odL3/rzcJfSbVHtz5ctjp+1O8gLz87UqbyXDjfaqlvphI
         9lapJ5qrsR+G9lP0iatBcf89ulnEcuiMiX3pti9w5j1JR+Ly6RB7UV+2aTVNbP/fzYku
         bnPiyCMcTy+vtUFAAULXpzgpMaa0qNFPzMDAUggnub1JMoz9/cnTVWS7i+5njwc7I0Jt
         mGKTAltHLtzJdaQhkWr7IPZqCJKmfVcDKO1zX+eZL3MjFeuCbbdOLUl/2fgKSOGciSTX
         +BNm9zCRJQy1+zXKqX0BVRq5kOUuh8h8XYf+nlNyI3U5WvAsYK46hOHYy1mo+XdRy7Zb
         N1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795728796; x=1796333596;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K3z/8Pdbqw7mOchnPI5sAjkgLG9JNDJAvAK03r0XyDE=;
        b=l+O7tpkmJAlHh38ThpoK6GV/zdjt58z4FLz5+Frd64VL1AEpwj6gOMeDXbgIzuNjLe
         TDnKr8USCw80TLZGetwlJKIMfK+Cq32wRiPQNU4IKg5YCf++dmPqh6Gs+VsI2mNnWOIf
         nID/Mz0sFbkZyDxzkH5WFr+7zV+4h2GnJ10bdqMo3yHnDnyHyrqfE9Rs0AsRNaGlEtvG
         w/n3BGAlJkFFeLNYwUSvg834E0jxfqil2iY9uQcyMvAnq/I44BuHlc4Fy1zR2gFu89+V
         z7z/cxq66Sztd1eINUBsLzmg+fjUBKMtNG00x5MgQin5MaMnEzdWF6xgY2TNwzUV149M
         /j9Q==
X-Forwarded-Encrypted: i=1; AL+hErFrLkMjagWTtvhyzDUuvYkoUFjH3CRUzaZUZo8ZVk/LfWlYe84TJITqGW861d+V091LhC3ueHMwN44PHfhWbIw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zTndlcRnoAYNM9SJmW2mLJwksM5x6b09g5EkltAS/Q5YlSJDp
	jMxD8ndvbQbpYPcD1gjFVBvMZ6FKdu7QHh3ufZQGRmRR8I36C9fWNEdQmDosMclp0j5MlxfrZQX
	+8g4VXiiOVKcW/+E4FeU+qFvH3S+1E8pk3AB+yFE1M8zzibFRlzRMLI90zPMjycWI75+YBlI=
X-Gm-Gg: AZFdTZdcLSlwlii1e5FUTJRFOLxXgoKQLoIKGJw12t9kEUw1WoQNrQEEqSizRvqM9Ge
	txzS7SZee6Cge1V4tNQk0bgG3gViRuoGhgE8XTNbPRGrYhwqtTmoHBBCpBHoguIOvwSv2CJbwao
	4bL3QxCm2LwRhqyEBeUMln1qyQ+CB7Et6b58uf281kmS85FVzqEPnWClR5GKwcf3mC0Ch8lR4Pm
	I3aOd5GW7H78g904qjUeffzIX0Me2vVLV6MpnnDAZFsioVQSfUAAZgx+SCajlysFWcxWcU/m99X
	XQC0Gck5HcGpqkpCkYGwqyaOubznEchfkneqSPaiztAhKCC1me3vP7j6O9ff+pCNly0VRZEs7cl
	gXpNr7XAoMdtwKBW0l4T/hv19RysYrVVjPH67Eqo0KirBEzHS1mlsumL4HMDIVOyjG4ZJ4EWQ65
	Rogvo9FBCd7A==
X-Received: by 2002:a17:90b:4a48:b0:3b0:a757:e372 with SMTP id 98e67ed59e1d1-3b41c987b44mr19750762a91.47.1795728795768;
        Thu, 26 Nov 2026 13:33:15 -0800 (PST)
X-Received: by 2002:a17:90b:4a48:b0:3b0:a757:e372 with SMTP id 98e67ed59e1d1-3b41c987b44mr19750728a91.47.1795728795081;
        Thu, 26 Nov 2026 13:33:15 -0800 (PST)
Received: from localhost ([120.244.9.31])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm39927286a91.8.2026.11.26.13.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:33:14 -0800 (PST)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:32:31 -0500
Subject: [PATCH v10 3/4] riscv: hwprobe: Introduce rva23u64 base behavior
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
Message-Id: <20261126-rva23u64-hwprobe-v2-v10-3-bea130335fc4@oss.qualcomm.com>
References: <20261126-rva23u64-hwprobe-v2-v10-0-bea130335fc4@oss.qualcomm.com>
In-Reply-To: <20261126-rva23u64-hwprobe-v2-v10-0-bea130335fc4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8570;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=pyA9Pxgd6x8Yz7FO0jmVwfAyHjvb54JETkPV1oG262Q=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhmyOpVVlTPa/33Kc3bjWaeuNq1J2mmovHyw+a7ZSc9Ki9
 JotURbfOkpZGMS4GGTFFFkOH23J3vrKJ9r3OecPmDmsTCBDGLg4BWAih7wY/srGfX8ptOTIB9Yv
 rK2f+AXu6fB8/ni76J2agfnBBdHv7WUY/gqLP1l471rAB50INt2THrHcfiURHGubgnlntHumSJ/
 jYwAA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-ORIG-GUID: 2d2VqY7k55RkVLUCFxJybG7GRBvNT0K0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA4NCBTYWx0ZWRfX/AsHs9Yvx5cU
 3aPFYiqMzHL3SNaKEU+Zhr4KCVlPMrRyAXQ9gJxGYVjas+Z0Fm5dqRu3BtbuLmaB5IKsRXSQPlT
 1tWf6GJ3k+FFhTG4Xt0dLyyj6t87RqM=
X-Proofpoint-GUID: 2d2VqY7k55RkVLUCFxJybG7GRBvNT0K0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA4NCBTYWx0ZWRfXxA7eB9d4lOAX
 KSlrQ7UF0Siz3i16U4afuMUbpM//G1jrFfyVYy9g+ncOe9N/RI1gu93l+QeKKH+w0iEj1PTrxD4
 WAkdEJRcibibOwCu9CDCwtDVchQ8eQvL+xv520SvqoforWfO0uEJhynHtOYv93IP7dh5u6TpSmV
 dJA9SyU8JPrBcecvs1r5vppy5f3iFhRJo4/ELVfHxMV7PeT7964DZmn8ImXjVYLGZlyYswqvRWi
 O3vPYm8LDTLDCB/0y4Pa3BpwIaRq/DFvMVx2Q119mJWWQitAKmQpTDJHaecJO6p6nk9VeDIr9pv
 OtP4sRc82ZoNv7AIa2hK56GGyv6VKXiKiRWTKUZ0wChLMtxe0uCGy581vH4JeNqxhjw393j7xpY
 4jBq9cqAs2TG1DMv2PEamAy7Ow3I3uFe0MvygdIfpPF7WsgMcXWAyTDDsXrU46pMRghIhJ/hhaU
 W7d+PvYmNdbkChUatyQ==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b08a59c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=r1R2P697X4eI0gH+iewh9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=g24dY-sxPFC-Kt_ZjfwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260084

Provide a hwprobe base-behavior bit, RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64,
so userspace can check RVA23U64 support in one call.  Without it, a
consumer has to test more than thirty extension bits across three
hwprobe keys, and still cannot confirm that PMLEN=7 is selectable
without prctl() calls that change the calling thread's state.
Userspace treats RVA23U64 as a new base, so expose it as one.

The bit is reported for a set of CPUs when PMLEN=7 is selectable and
all RVA23U64 mandatory extensions are reported for them in the
IMA_EXT_0 and IMA_EXT_1 keys (I, M and A are the IMA base; Zicsr is
implied by F).  Any host-wide decision behind those keys, such as F,
D, C and V being disabled when one hart lacks them, therefore applies
to the RVA23U64 hwprobe bit as well.

Suggested-by: Radim Krcmar <rkrcmar@qti.qualcomm.com>
Co-developed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v10:
- Add Suggested-by for Radim.
- Report RVA23U64 as a function of the IMA_EXT_0 and IMA_EXT_1 bits
  plus PMLEN=7, instead of the isa_bases bitmap. The separate
  host-wide gate is no longer needed: the keys already apply it
  (Radim).
- hwprobe_ext0_has() takes a mask; add hwprobe_ext1_has().
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
 Documentation/arch/riscv/hwprobe.rst               |  8 ++++
 arch/riscv/include/uapi/asm/hwprobe.h              |  3 +-
 arch/riscv/kernel/sys_hwprobe.c                    | 54 ++++++++++++++++++++--
 tools/testing/selftests/riscv/hwprobe/which-cpus.c |  2 +-
 4 files changed, 60 insertions(+), 7 deletions(-)

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
index cd7cf272e6e11..f9c1abcb7139e 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -29,6 +29,31 @@
 			missing |= RISCV_HWPROBE_EXT_##ext;				\
 	} while (false)
 
+/*
+ * Together with the IMA base (I, M and A), these masks list every
+ * RVA23U64 mandatory extension. Zicsr has no hwprobe bit; the RISC-V
+ * Profiles specification, commit 0273f3c921b6 ("rva23/rvb23 ratified"),
+ * notes it is implied by F. Supm needs PMLEN=7 on top, see
+ * hwprobe_has_rva23u64().
+ */
+#define RVA23U64_EXT0	(RISCV_HWPROBE_IMA_FD | RISCV_HWPROBE_IMA_C |		\
+			 RISCV_HWPROBE_EXT_ZICNTR | RISCV_HWPROBE_EXT_ZIHPM |	\
+			 RISCV_HWPROBE_EXT_ZIHINTPAUSE |			\
+			 RISCV_HWPROBE_EXT_ZICBOM | RISCV_HWPROBE_EXT_ZICBOP |	\
+			 RISCV_HWPROBE_EXT_ZICBOZ | RISCV_HWPROBE_EXT_ZFHMIN |	\
+			 RISCV_HWPROBE_EXT_ZKT | RISCV_HWPROBE_IMA_V |		\
+			 RISCV_HWPROBE_EXT_ZVFHMIN | RISCV_HWPROBE_EXT_ZVBB |	\
+			 RISCV_HWPROBE_EXT_ZVKT | RISCV_HWPROBE_EXT_ZIHINTNTL |	\
+			 RISCV_HWPROBE_EXT_ZICOND | RISCV_HWPROBE_EXT_ZIMOP |	\
+			 RISCV_HWPROBE_EXT_ZCMOP | RISCV_HWPROBE_EXT_ZCB |	\
+			 RISCV_HWPROBE_EXT_ZFA | RISCV_HWPROBE_EXT_ZAWRS |	\
+			 RISCV_HWPROBE_EXT_SUPM)
+#define RVA23U64_EXT1	(RISCV_HWPROBE_EXT_B | RISCV_HWPROBE_EXT_ZICCIF |	\
+			 RISCV_HWPROBE_EXT_ZICCRSE |				\
+			 RISCV_HWPROBE_EXT_ZICCAMOA |				\
+			 RISCV_HWPROBE_EXT_ZICCLSM | RISCV_HWPROBE_EXT_ZA64RS |	\
+			 RISCV_HWPROBE_EXT_ZIC64B)
+
 static void hwprobe_arch_id(struct riscv_hwprobe *pair,
 			    const struct cpumask *cpus)
 {
@@ -215,12 +240,29 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 	pair->value &= ~missing;
 }
 
-static bool hwprobe_ext0_has(const struct cpumask *cpus, u64 ext)
+/* Return true iff every extension in @exts is reported for @cpus. */
+static bool hwprobe_ext0_has(const struct cpumask *cpus, u64 exts)
 {
 	struct riscv_hwprobe pair;
 
 	hwprobe_isa_ext0(&pair, cpus);
-	return (pair.value & ext);
+	return (pair.value & exts) == exts;
+}
+
+/* Same, for the IMA_EXT_1 key. */
+static bool hwprobe_ext1_has(const struct cpumask *cpus, u64 exts)
+{
+	struct riscv_hwprobe pair;
+
+	hwprobe_isa_ext1(&pair, cpus);
+	return (pair.value & exts) == exts;
+}
+
+static bool hwprobe_has_rva23u64(const struct cpumask *cpus)
+{
+	return riscv_have_user_pmlen(7) &&
+	       hwprobe_ext0_has(cpus, RVA23U64_EXT0) &&
+	       hwprobe_ext1_has(cpus, RVA23U64_EXT1);
 }
 
 #if defined(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)
@@ -309,12 +351,14 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
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
+		if (hwprobe_has_rva23u64(cpus))
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

