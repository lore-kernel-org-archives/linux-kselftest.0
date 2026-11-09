Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794228484;
	b=bkBPZrwU4G/2SBYNZVMBVT8b6fij+8pvuMW27iTITAXJaw7yhOrdQdvZVFqll66K1z5B
	 4yOz75JZfJDCyRmHwhNdgH8iQgopjyklmmYB8NzyH5MGhSl2BYwqLUME2Ar/HpQ1AHjIa
	 DBvdX/ccLic7oTJKp+y/AHy23R5d3siqJPLzuPkP7LUJ78Vft9WjnR2zrDjYPfsLcKvMI
	 DJh8FH8hyRZvtmmAsaS3+VOaB97An2na8LAwuWH7N+JUKLnScmM1XCr98W/jGKAkgWtnr
	 f41CTFlmIVrzZ/Rpvw/hK37NSrLbSIaFFAbrfrmiCJnVaiXU8XMIvXqsoPKVgHJdXdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228484;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cRcjtxEyFKeSMylm4kchPyfddfB4hUfWm9kwcCT4kgs=;
	b=ErjzKWZYdO9fha/JMo8NvsB7RqrTbvlkas1+YQtagejnjnqskOxRhl4legKXfmYP3RuR
	 7svjHwowO+GkpuORLvYVYSULrbGIOWT6hS4Be8VwMqNRiVIUIt958PS2lm7iBhSV79hai
	 1lYTR8O8jkT2UCu3kf//PpptCfkh2v/iM8hzAqI4JjV9lixbNFohooEXDw8bzoCdEcRqR
	 WWmhQz1GvlmhfbieqwQnvjPzJ38xPvt0s2WVcshJvaKcoTT+M+4ZUjuPLcRlKheWJzw1y
	 ZTl9i6bU+UX42IZg0VfOv8zHBQbQLKux6biu15s0ntMO3LH5AsKLqh/1uwSmdmPgpQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HaWRJQyE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NPgPAQmI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43CF606D82E
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 12:48:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E43CF606D82E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HaWRJQyE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NPgPAQmI
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9AulDR034383
	for <linux-kselftest@vger.kernel.org>; Mon, 9 Nov 2026 12:48:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cRcjtxEyFKeSMylm4kchPyfddfB4hUfWm9kwcCT4kgs=; b=HaWRJQyEbJ7aYPnO
	FgzyfedJfWr23ikxXwH5cFk21qCwUuoHz/P/MVVbNx1gnMQujeDFgFaW9P9c6kcG
	vasEKhTm1yOtcequc7VQae+dZue+rKEgp7t7zR/clonRy8yCYzisfGrOxPQM3WCp
	6h7cwZx2EtIh+Alz9LnoVxAJAEsx8GOpx/Ph+DK2ITHTYuPOfUDkyoxAxK4DisF2
	skEVYJB05cwbafgpfE5HjtNp7yVV1+FiWQwz94a8g0Qif6wiFQD2by9fGsfZkfJ6
	tramCembj3VjTeukyDXpl52TQbmA7brOIeNcZKd/4hasig36cyJI0xRstPSRR9M6
	s1PaOA==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5rc32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 12:48:03 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-67532014b2fso1859962d50.2
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 04:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794228482; x=1794833282; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cRcjtxEyFKeSMylm4kchPyfddfB4hUfWm9kwcCT4kgs=;
        b=NPgPAQmIggmEgFBy9P9T6G1//OO1dKNgUcPOtLLEnqNzGsSuiQdWWN5uIZ4FPBa20b
         5fYCJYQAyDSGd2Q+s381pqjbja1EXux+7HTeoNvAUCa+CDHZE/Pukl3kPgH9i2Ue5dsz
         Da7AETom6fjPQraEVdPbs8vbFr/ZLSZ56S6vPON1Y8ngHItIbincUhEbRsPVRXHN3djk
         Gc6HWa798FmHGiXtVQLqMH+MsSv1EQi8FsEq2qEy7MecIVDFY9vILXzEKQv58ZJqShNv
         GkjgjSTGkoht9QNxYCCHUCRUa9/+eVp7TkrCJ1rsoZEkeps6rzP9F4aL7z3jl9RpOcgR
         Sr5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794228482; x=1794833282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cRcjtxEyFKeSMylm4kchPyfddfB4hUfWm9kwcCT4kgs=;
        b=Ej7ODj6vbpdLkrZtoi3qyU6RS4A7092TNCWlyHGQ4LtETW0b8m8AFO/fGnHVBVx4Zx
         kbQHyYlBraYyAJIWuoG+oiU3l6N7ZVXCYzBJGcPrtOwAEknmiVnpTGX2/BaByrLkiLSm
         EXOYi8Pb0bpGiwbnhejz4bOKSYEz2dq6uUx3HdEyuCxbyF9s0zpMEAdsx1jEPFPmG5+B
         4D7RoAVPXEadaIQJEr0sqc1ggeSXpf6IYiQjIoBn7J4oYfmhHUbVBb6OxWSQypqH30n6
         kwp2i9jZ1fD22ne1bQi47aUYkwjtOBruIljxNrpI8rhcfa1FdoSZX6S5o9siw9qtro7e
         omQg==
X-Forwarded-Encrypted: i=1; AL+hErFlU8eBkp6s2PlxBU9OP+rQuJBkOkqMzNbfrKF+Bhu53FmJPnhFjqAZ2J3eX9WSrW2IeZB8WChHQyLfwObXIk8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WXV5mJdqWnjdWE8MwaSsty2rmik5/v960uiMKsn6JEjE0m1PV
	sLTdDoQ3bV7epVhyE4R4UcbbbaeRoxTpQea8u8I3TAFly2L08jre/rsgn2miSq9J0GHGZO3WgKp
	S7/QxpJ95Sa+WlxE9ubVSBdl/7wwklNR00jRbZABxcWRlxk9hutYSW3WbbzgJkal46IjtL3s=
X-Gm-Gg: AYBFou1WV0Cu1Nin5u8s3q8RMLSqwAuO99zqFO3YAI2T4pCFewBx38In/fPDNtNNCP7
	JXcERiReteMd/jUtbHx71fPzrIDLr9vci+auUVph4hy7I1rMtL+pkqBQZP7tvxoiqeBY6TuFLrI
	Gk5fu5AiEql+B0t4KaI/9nAAav2QEWtltVl6cUioykCC6ozQCdF9z8DTo47xGskotq3srAj87vm
	OLkbRL6SWRk3j9deUPi93I9IDJRMLqYXt4VVQeft5QkECSHeD5xtdu0ydQuCl10pOEXB9s220o9
	HPC3LMPN2A24KLJ/A9EG4h8jFpAw+/dWSXafgKeBePN6ExKB+u911AiMpcKuextyeJ2xylGoRGK
	q2qxS+PzNK5NonRtZ40emBn2wuFmeUfu3QIkBrs7EJwS6t2os0qMj9v8noJi7xSPwl+4vzt3P1u
	776NDA70WJDw==
X-Received: by 2002:a05:690c:7107:b0:8b0:dd35:7b9b with SMTP id 00721157ae682-8b36cb0d50fmr20463837b3.67.1794228481787;
        Mon, 09 Nov 2026 04:48:01 -0800 (PST)
X-Received: by 2002:a05:690c:7107:b0:8b0:dd35:7b9b with SMTP id 00721157ae682-8b36cb0d50fmr20463467b3.67.1794228481035;
        Mon, 09 Nov 2026 04:48:01 -0800 (PST)
Received: from localhost ([120.244.9.94])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36c0b4244sm33697547b3.45.2026.11.09.04.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:47:59 -0800 (PST)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 07:47:35 -0500
Subject: [PATCH v9 2/4] riscv: cpu: Output isa bases lines in cpuinfo
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
Message-Id: <20261109-rva23u64-hwprobe-v2-v9-2-ae846c5c7178@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2911;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=wzAGtSSkmxZfZizOFQBUvhE0yLM4MHIUJ9HkofggPGw=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqyPB17PO6J7+rKjJvej8N0RsgtNNGeYR30TjX2qntb2R
 DMn7FpJRykLgxgXg6yYIsvhoy3ZW1/5RPs+5/wBM4eVCWQIAxenAExE6CIjQ58B15f7bKveB9w8
 /a/iu21LtQX3YeO/R+ce39LC/GV9ZgrDf9coeemlqz1zfA8Fb98hpmf75xrf6Sc37jZLT9sX8f+
 nIA8A
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX6FyaS+T6ed3V
 lGsFgSX906gGjUSOuOjkLD7AbEth/FBszjreWQbDvtxsfJWnlMnSlgZb5Acv2M0GzVoEhq9j3A3
 UOUCIT1CrdR7cKcJJnyBM55cizyBlII=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX9TXXP38twRU7
 oJO1jadNdmoBm2z9t4c1gwRy/KTAhZh+oq/XPQN8puAwFsb7QiPppyh32Vt02FfkszVj22QdDsb
 QMw/qhG/nArh72bqAxtPlIku233sENJ1zJQ+OysuVCeXCM8LtoO3d+rahCiu+l0WonapELG7eGC
 P14RltVLnbXFUuGS4q/AuL/KVytqIAQZxKeMs5ZO0Jo6iVnZVvFI3eLWv75nexBuy2Cgf7ksHby
 mzW8L6EXEmHCQqd4u4tVvZsYH5Ol5rr/EbfjwLSTZ5RDUpQ/JSCGKdH7bjpuiiclde+L4dAk/Ar
 ptGR79SEmfZi2TeiDPeCKVVTY+xj9cdf+KyMpNoWajGkTyINX5KYqjem83Xc5jMXO+Lj21RA6BN
 ZAu2ZCcjRm+bDPAN2F+r2z3ctNZEo95OTeyJAWTrKF/W+UlKVmD5YW+T5wDhetQ2Hrh/fXA15F1
 +TzHCnGSTD12ItaWw9w==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af1c103 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=ZvHX9x23NDWH3CQeJ2oX1w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=iQKFDb15jVzJNXG1q_sA:9 a=QEXdDO2ut3YA:10
 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-ORIG-GUID: A1yzkZBy9-idwqWsiC-wDgMGgLi7YcVq
X-Proofpoint-GUID: A1yzkZBy9-idwqWsiC-wDgMGgLi7YcVq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090050

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
index af84b97af3a1..75761fc9f09a 100644
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

