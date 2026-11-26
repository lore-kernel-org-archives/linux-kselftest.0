Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795728791;
	b=b07/1TfOLOFzZI5fliJBUFTiBYO6EIDAj+JwtjSvWacGbj4Wd62M0pfWqRPKcGbBGipf
	 QzRHmRvIBga2NG+Dx9XBGdV8ba9y6fahkd+7YPL06NSCzMAehNcn2g7fUd1Te0MrfT+bM
	 uR3Qc6+/gdssgCPSTG/fvQggPTZC/ybrV0Sk/s+v5eeql3kZwgAu09ivqjNf/LkgTon4u
	 VOBD27CwbceHQIvGSwGOgTuLM+fRdtDiauoymOBeglvg9YLFt1Ue01skV3S0xE1InRxhu
	 Q0OVdjusyihxFYdOvT80Qe8tUhft8+ms2HO70FitHbcKRtGH61td5a/k6MqzIqwArRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795728791;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kvB/9LyPp1IHurY6PqxrQVZAOe2efDBvZteC2OZl5Mg=;
	b=n5OjknrM7AYovW9kNf4GYw6PQ1r9ouRcsl9UlsyETcyoby/A9IlJU9thu5bIt18DzcqB
	 wTjeaKjDpzrVAYW0vssberCPkEIyvH5s6YycWqzEiAWmLdGpAtkDEA7S3B8NaeQoMRdgg
	 StQfL6YEbzqUzxwg09nJrnokCc97mCmZLzCC9Er+Ats+fitVV7It6ooROGABF489AYYAz
	 MJKpuPWb4aq0Wa6aTYhkN3x89JBQYCfvSHWQMkWR61/JtfN6ptgstp++R2hxQq1aY6Tci
	 0G6JUONQ0IlpsZIIZFpFbAMqQLXr1sTIEXv+Qoafz0L5A0oNWS8ZtJi32Em0RvHWedw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mVhHlhXe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NKSfHWW6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0AA606A31E
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 21:33:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F0AA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mVhHlhXe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NKSfHWW6
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJw8CT3864273
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 21:33:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kvB/9LyPp1IHurY6PqxrQVZAOe2efDBvZteC2OZl5Mg=; b=mVhHlhXe/JPEGUZo
	Ea6Si0qCn+iqRvt3BFR2nU458Fp4E9RPkoqgIfjIIWsmop6kENBCPOuGV3QvmON0
	Fo6ddYEdEvoXZ3o5R40oJah3QBEqmpmNNANmqsZsJBWXLk4FMUddgPcEFfIAWNg2
	j53bb/Yidb1473rz426kFjtd8y78YVFzZVEtT21Am4BpA/RIXxofeC3Kq9RtzEqe
	HRxHZe8jr+tnKoJeCW68nzua/BCwbvEkNx8Okyd0RR/kOb6VMNhDdu1yPwxhz2rY
	pRcMNUgkoNcSJWehqkaTq5dzoSA5m6yqIZk7uKCP7Xjzs/Doh9OddtiEI/r5NvID
	JnNeCw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55r6su-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 21:33:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f052777c7cso72969035ad.0
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 13:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795728788; x=1796333588; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kvB/9LyPp1IHurY6PqxrQVZAOe2efDBvZteC2OZl5Mg=;
        b=NKSfHWW6gEFmubI5dcmCIc3qkb44YV85RCmCQ7NuSMF/U4F7RfAjH5jTb3e0DpqPXn
         T1KgR2vm5+2VtwYcXqXPCasFCfVDvzYDOm3E4yWItJ7R5idDw1m0bUbTvy5D4x9rSDx3
         r7ouPTAVWwOxZAjCOF2rdBp77/BjSIzGBlPXxvTGu2KC1Tmbrnw00SgHaMqDy7XgLCh/
         +ByJ7lwgmxAlQqHy+0RhMPR7aC8iXKwuWDMzCaVJOQCI5xDeviz/jZh0gLxJ/kZQyFYC
         lwbJta5dvKfOGd8p1itZ+LcO/BYQeMvPXKJaexXkSDVJx2YR0w2+SfrTl8vB1WqPEjs1
         9J1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795728788; x=1796333588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kvB/9LyPp1IHurY6PqxrQVZAOe2efDBvZteC2OZl5Mg=;
        b=Rpn3uvpOF5zOyhQ6pxPv2+nfcXNjDxn8xZjBAALlD9S0sPRXg1AnGjF5pXKJsSmuih
         PxSILYvP3x5DI8Zu2ayeBS1jD6mI7vYhuuWTmBWXLnGxItSZn/BtIJBmLxy+OpmRes89
         osIuXfdwfqgLIWeOFTOJMz4JB5hYHVVhQnUodGbxmoPkgeRgUBoRHwDEfobRVIQ7mAYq
         PtWBMtYCl2Vehq52xUducQgg+D9jz/A4F/Y2vm12toj7AJebg5kU6DzAcLwGqUre/6Av
         wBMpXglJxAWE9+4W895wy5MrpoEKgEReiKGfBuuSVU43mkE3DCQziVIxXMpn+04kjgrh
         W97A==
X-Forwarded-Encrypted: i=1; AL+hErGuwoud702xJ7cartVIqaJ6fOvyCh6FyGJ07PDwzYduVRLHQ2jTBK2RE2x7eTP4GNvlUeLtHsPRNYHK7c9kCts=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pSjmOwbqdJI6mjlA7A3mJSYCXnb2FXraeZ5ev5UgqKOmlWy/n
	caLqA7Vv7r05kHehkQAq73dfUoiyFX1PxoLq377mImYWxia3rF3gwc0crkuN7AlwV5L1KlHc+vv
	RT3ZNTCbDAIzp2fqrsTKiEy/QOZ7BxtHkhtqpAnFD9Msj3SmmdHU4gKqssI1WeSntjIPcXrU=
X-Gm-Gg: AZFdTZe9PE6Ge1EtcsTWSTosAvA+pS7hVh0stpEPulfrQvY/dUMz+pqPKf7Rsj1AIK7
	w5Je5D9IbMFxtbQhkfO158IFK6eVSJbPPu19t2PbDa2meYJl4hCO595cdLJ/RPK1oSfR00963oa
	+iSe7eeIxxnxfGiU5un7GBtuguJfQ0BOBYX16y2sGBxrPu9lnS6TMv+VeODGPsML3XmAAa6zkD3
	9IXVYpNQtkUJWKpU72vOzmF4oB9R8cNjJzMc3SM/sV2VuVRvPgA43EQlDrm73qInNDGaE7eo4e5
	M85ZDzPiSwy2AxesuHhbCkeOnMyjDO/27V3bl3HFS27e6bElK0aei+QpttxXN8QE4GvJJA3gDXO
	TDH6bk8Q/CrYv9MyMuuOO0fK/hiZDAjFKGMmDhT/H75V4k9rI1DPRVeuulZtuXwEixfGhOoxVAx
	7h64QG6UKySw==
X-Received: by 2002:a17:902:f547:b0:2ef:dc8b:7c0c with SMTP id d9443c01a7336-2f03f256468mr266661955ad.52.1795728788297;
        Thu, 26 Nov 2026 13:33:08 -0800 (PST)
X-Received: by 2002:a17:902:f547:b0:2ef:dc8b:7c0c with SMTP id d9443c01a7336-2f03f256468mr266661425ad.52.1795728787627;
        Thu, 26 Nov 2026 13:33:07 -0800 (PST)
Received: from localhost ([120.244.9.31])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0dc0ebsm105273215ad.33.2026.11.26.13.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:33:07 -0800 (PST)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:32:30 -0500
Subject: [PATCH v10 2/4] riscv: cpu: Output isa bases lines in cpuinfo
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
Message-Id: <20261126-rva23u64-hwprobe-v2-v10-2-bea130335fc4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2930;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=KGFFI+GHVn3CUDWYcK4D8PXW10DDW9YkeGNfzxS/z/8=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhmyOpVXK+dE3M7IeOFc7c7PVruHR873JuDLBLGD182l8X
 Paqj1o6SlkYxLgYZMUUWQ4fbcne+son2vc55w+YOaxMIEMYuDgFYCIPdjMyzPgjr764b2/SHk/t
 n7Fm56uUTtTvFTGwffDv2SLN2P0X5Rj+u13btzfv9VOhz/VFJzv83ix8wG1dksgp/+5Jb7wxz5U
 FbAA=
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA4NCBTYWx0ZWRfX2lcXSui3zK8C
 MzMTRjblJ0swyEsOAj25HFtbnvQlQPXckGE+LsuUei5iYHkjUe0PXMXMIUAK/fogosSnFnUEqSL
 OCyB6GkrD0obLkzev36f3+k2/+qT1z8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA4NCBTYWx0ZWRfX5zueq3+fr3m1
 8+WFs9pF29E061+fiS9hOoa3LvOYZkXek+IsojapV9jM1kBHoT/gohm5JwOuBE9q5sCR+wnvtDM
 /fNMxWSG912afRf8GnQBXIEDh04PhAoILN5r+DKJwbhsDcWQW59d2kBlEPE3c9FroLqxrFkYv+p
 o/dUXvur5Tjlw09DfiqkxEry0uf/VXnK5iWdJDF0ST0kF+4Yj+qgF7/tgh2Pvh423e0+ZSuc4bE
 eoJl1P3y0YMPmhAfErUTX2jK1wbvHJhSL62sgRazZoABvf6kXAwKda3+6qq4AJGR9eqcAHRWs1S
 ls3vfOwK/LaJzzM37QbDH8zxK6yWTfSSIQe03ERHoJwOv3ERcA3MVJcVIL6xhVtPCv+VNBuOYMs
 m/2Y39ZcFEsQuJ3V/6uXG4Mjkyy8oATwr+S82JTREYHhfOfaEIowtQYn2TbtwQYyRC27XDx4/ad
 3I3SpyNd9GrWdXYlw1Q==
X-Proofpoint-ORIG-GUID: RtFq7sn6DIfJuOQjN5febptsIAkUbOAz
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b08a595 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=r1R2P697X4eI0gH+iewh9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=iQKFDb15jVzJNXG1q_sA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: RtFq7sn6DIfJuOQjN5febptsIAkUbOAz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260084

From: Andrew Jones <andrew.jones@oss.qualcomm.com>

The "isa" line in /proc/cpuinfo lists a hart's extensions as
concatenated string, but not which profile base it satisfies. Add two
lines that report them directly:

  isa bases       : <bases that all harts conform to>
  hart isa bases  : <bases that this specific hart conforms to>

Example output on qemu booted with -cpu rva23s64,sv39=on,pmp=on:

  processor       : 0
  hart            : 4
  isa bases       : rv64ima rva23u64
  isa             : rv64imafdcbvh_zicbom_zicbop_...
  ...
  hart isa bases  : rv64ima rva23u64
  hart isa        : rv64imafdcbvh_zicbom_zicbop_...

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Co-developed-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v10: No change.
v9: No change.
v8: Andrew is the author; add my Co-developed-by (Conor).
v7: Use riscv_isa_base_available().
v6: No change.
v5: Simplified the commit message.
v4: No change.
v3: No change.
v2:
- Read from the cached riscv_isa_bases and hart_isa[cpu_id].isa_bases
  bitmaps populated by riscv_init_isa_bases() at init time.
---
 arch/riscv/kernel/cpu.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index af84b97af3a19..75761fc9f09ab 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -305,6 +305,26 @@ static void print_mmu(struct seq_file *f)
 	seq_printf(f, "mmu\t\t: %s\n", sv_type);
 }
 
+static const char * const riscv_isa_base_names[] = {
+#ifdef CONFIG_32BIT
+	[RISCV_ISA_BASE_IMA] = "rv32ima",
+#else
+	[RISCV_ISA_BASE_IMA] = "rv64ima",
+#endif
+	[RISCV_ISA_BASE_RVA23U64] = "rva23u64",
+};
+
+static void print_isa_bases(struct seq_file *m, const unsigned long *isa_bases)
+{
+	unsigned int i;
+
+	for (i = 0; i < RISCV_NR_ISA_BASES; i++) {
+		if (riscv_isa_base_available(isa_bases, i))
+			seq_printf(m, " %s", riscv_isa_base_names[i]);
+	}
+	seq_puts(m, "\n");
+}
+
 static void *c_start(struct seq_file *m, loff_t *pos)
 {
 	if (*pos == nr_cpu_ids)
@@ -336,6 +356,9 @@ static int c_show(struct seq_file *m, void *v)
 	seq_printf(m, "processor\t: %lu\n", cpu_id);
 	seq_printf(m, "hart\t\t: %lu\n", cpuid_to_hartid_map(cpu_id));
 
+	seq_puts(m, "isa bases\t:");
+	print_isa_bases(m, NULL);
+
 	/*
 	 * For historical raisins, the isa: line is limited to the lowest common
 	 * denominator of extensions supported across all harts. A true list of
@@ -360,6 +383,9 @@ static int c_show(struct seq_file *m, void *v)
 	seq_printf(m, "marchid\t\t: 0x%lx\n", ci->marchid);
 	seq_printf(m, "mimpid\t\t: 0x%lx\n", ci->mimpid);
 
+	seq_puts(m, "hart isa bases\t:");
+	print_isa_bases(m, hart_isa[cpu_id].isa_bases);
+
 	/*
 	 * Print the ISA extensions specific to this hart, which may show
 	 * additional extensions not present across all harts.

-- 
2.43.0

