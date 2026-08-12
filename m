Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8688843230F
	for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 23:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786577775; cv=none; b=qRL3MuX2cXbMC0XLMQNfJXxfqvydaRcr688kAhJzb+x483gB0+k1GN66FwVgfVnn+H9d66PztCVgkIhSOgdTXMhpe/CyxMDxcPHrYa92Ul5AXIhIruA3LqT39moqv2xmKXiHrv2WFjo/yQJWzQO0JAyKwq3tMUDioRbYMBz20+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786577775; c=relaxed/simple;
	bh=DiWwiEx9V6F5N4m+1J76YOkAHoc6sfST7Sl1jsmaxE0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Itvtqp59xZeQX8VQGN7FFGrXOCdxxHKh4N1kMh/KhZDTDik3pnYCvnnLqKBcVU9TOY2tkPtusWxPtlc7EeVWw/FTzi6Z7KiiKCvNUxjzavbU4n3oFYcBsj3MXXBqCij4CAi3yOE+LkSIkPGg+caJhmQXYEp0Ikfo8VLI4hKA90Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HcEYqNs4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AZj7DSco; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HcEYqNs4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AZj7DSco"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CNLVNv266053
	for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 23:36:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AhUu0uSzo3AfsrNzm/Bks16Jnk8npDCjKZIoNK46y9A=; b=HcEYqNs4ECci+xC1
	Gik3L6KmLJ7Qx5QtsCNKawHOJhDsK1/P1WSCu+5KxvKJ5ckLHHTm1TcKejGNXcFk
	z60tjy9QCZn9e2yP8sKEe21/F7DDMQjJ3UrRNKjOhugw1gACTu0wbN3XQFPbLCKD
	2IlIoO+FBnhlWBYNO/YZ0yR13W1QXcdjye8+a7zI3jhgL+S022vpbPMZmQ0tbdrH
	qqyiEZ4zdDoXjurmV8yx9poIQhZxPWk40gCTcx/+kf9rwpJSn4dk9sR0wXojuMDc
	j5mKAyX0pHSjnBCRF1eI8MsGQfZkl1MQ08kw4jwJuzXpbCoRmYPwDXlkOOOWRK32
	pOo4HQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0mndbvu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 23:36:12 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfca8558d2so19791965ad.2
        for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 16:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786577772; x=1787182572; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AhUu0uSzo3AfsrNzm/Bks16Jnk8npDCjKZIoNK46y9A=;
        b=AZj7DSconoAf8CaCykQHxgiU8IaW/r2McEixVVVG2ySzJbxbjtFSVsvCTs1FJHSlmO
         7xJ+ZY2balifbKs0t3oSIsCsWvE2IIP0/P9VaXnTeon63yMAHQvXYkfDlav6U3J4rqjO
         lijNUNJ5kJft8mYgmRtxk0P0+OhyMVFC0VpQ3NIK+qcnKlvDtUMilhD6SLYFCmCkf7SN
         CKs/t0frtAt+xKNMsgeSf9NCEGyhI9hV1PlHeCB56IFyMlMr1tEEXhTGEUb7D6zfl/Fu
         h/zWK/sfWggFbUy1ZL374NnILHBp0XJoUcolQ3FNKurqUdSxtEOygtJkShHlLwAUwl+P
         yDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786577772; x=1787182572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AhUu0uSzo3AfsrNzm/Bks16Jnk8npDCjKZIoNK46y9A=;
        b=TzADscnHObS6LOxqPefY3ccaF8msRT1qa9jqWJJC3sHXSJSbwGn7yuVXjQaOL6173R
         B0Nzvy1OPI4qpKBRXvGape/8igEnJJV2M9BrN18pjPI+jcwRF4sSZVIOhTvFIa8qKU2X
         LW6tkkmrkH2RTfwh7GzFL43R8Wy7dUENZlg257lZ2WodAZBr0P8sVpyjHFub8+MQMU/X
         dMd1LtsZ4bQSDphTwOlYOMjBbGSmVBHhBB6O51cqND+P3gzXQSPURm/S1oPKl8LYb0NH
         5/ZJ5abD+nosp/to3r9wSj1gg7iQvStV5RaIphmwJ7KKBDQrHK0jbmL6kfRf7YkP053x
         iAJg==
X-Forwarded-Encrypted: i=1; AHgh+Rqm6czfsqtgr/+ef6f1OQmaG5Nq+hT8fnd+Nnp9yU4ZAOJbqWDKHVcBmrRFGPqch7RkctqMAckQ+AKoGIlnldA=@vger.kernel.org
X-Gm-Message-State: AOJu0YylZL13KAS55F/kIk8y5v6NzcUpfkZ8fQvAbWdvv3Puikd7vE0e
	pDFtDVko2OMI9avy+cYp98fIIO2xqcQ1Hr7b6GquOylbgLlPdfHHA7WCEwfPJbz3Eio4XOwiiQl
	/CvysJx0AKliFjlieGtIJrKx/6u+75XeHL76Id83HftAfeL5c3wPG3ZN5hBVMeIjG7c/cvno=
X-Gm-Gg: AR+sD11CcEZ9JUGV0GSFzVE1DRKjwC30IvfM9E/Z4tvco/+SuzyT7QEd3YhHQ/wCwOf
	3fk1oMUF9MgRgM9qXpTiiuWCJ4InzA7CybShYvP7QZv42GvnauHpAXchfamahAk29Q8oPEQYW4n
	QRgFDMnMbAVPaR73D2WUMwEoP0mH4q8rAdwAkG0Ac+nzG+0oKekY4QxUIGi11Iehk1Y7lGLvLKs
	vGn0f9xM1zof/2nzEZcMMc8Y5mTJ2+iemnKinLHsRKw28PiTS6lhObr+1K5+iM4gIlYs7sepw98
	yrHBBwZ58HpX9Vg8WxAuwtO8qZsVUHYtc7nNcR+z4hNZRrJOaicVVpt9aYLvSg==
X-Received: by 2002:a17:903:3bc5:b0:2c7:f12d:5d37 with SMTP id d9443c01a7336-2d37ebb2bc1mr21037545ad.17.1786577772132;
        Wed, 12 Aug 2026 16:36:12 -0700 (PDT)
X-Received: by 2002:a17:903:3bc5:b0:2c7:f12d:5d37 with SMTP id d9443c01a7336-2d37ebb2bc1mr21037045ad.17.1786577771667;
        Wed, 12 Aug 2026 16:36:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c26d0fbsm2136805ad.37.2026.08.12.16.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 16:36:10 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 19:33:56 -0400
Subject: [PATCH v6 10/11] riscv: cpu: Output isa bases lines in cpuinfo
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-rva23u64-hwprobe-v2-v6-10-c985af3256b8@oss.qualcomm.com>
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
        Andrew Jones <andrew.jones@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2735;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=DiWwiEx9V6F5N4m+1J76YOkAHoc6sfST7Sl1jsmaxE0=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqxaZrFi3zn2DQpK0zelWy2YsPdA3W7WIxqsX13WTbqex
 3Rw9tzEjlIWBjEuBlkxRZbDR1uyt77yifZ9zvkDZg4rE8gQBi5OAZjIzRhGhjX3nrnVT/5T8WJW
 8drt/96v5Ju384TRVZkeMZnamgbR3b4M/8vEi6bKRhc0n+m2r3p0x0b39WoJo6z0KWEH/XY3n75
 YyAMA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE5MSBTYWx0ZWRfX673ar77WuukQ
 RgApb2x0Az3DYXi6ExCQ5h9od++TdFuilBdwDMM2bRFRnteujLbzy+TQf13e01tLZI9LXqmFPGu
 CNgUktrlzIypSME06CqSH6KUJPIRckQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE5MSBTYWx0ZWRfX4m1qfxkZYJ6r
 /4N5YOP6c6VhWkxYCkVcvCUEuyhXmHf2DR8VeO+l/zo7lUiaTQZrCRjpDVYOLYeRJ5j+AVZHHVi
 mXMxjjXMwQ1ULD8Yz9uXO76yN6acGu6JrkFkHxeduPixJp/5M2O5o12WB/yWKUP1PJr8w/87Jdd
 vEwds71xCS4MjIaye7/cIqzk2F08WXNnNsBkEQw8r7qSZ6C/848gM2/N07fMMwTdQkr83csKIcC
 So3TOQmj4kZOzDD0O1HPS1qMyJPle6dASQf2bizxHuLx4fts+Pr0haJf5KcQw9WR3lYvh+BQCG+
 OD7OTPi2J1RigVwI5YqhSBglZtW0VtG8euX1tVtMjaRM9za9Z/0elgO0GkwZhm8VfEJt87caeEM
 Ej1B0Os3gcSoSj+w7lDC9ytnMCPHWrre6p7wQanVvSl7/fHEbj+kHebe62o0QYK5kwftSRD8fYF
 G0nQYAeApn6IkvWx8Uw==
X-Proofpoint-GUID: c-89dA29mNetmpaGE3WklLZ83N58uL5W
X-Authority-Analysis: v=2.4 cv=C87ZDwP+ c=1 sm=1 tr=0 ts=6a7d036c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=iQKFDb15jVzJNXG1q_sA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: c-89dA29mNetmpaGE3WklLZ83N58uL5W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120191

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
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
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
index 3dbc8cc557dd..31e2857dcdcf 100644
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
+		if (test_bit(i, isa_bases))
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
+	print_isa_bases(m, riscv_isa_bases);
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

