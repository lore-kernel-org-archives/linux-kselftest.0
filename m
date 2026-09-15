Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE464463B96
	for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 07:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456664; cv=none; b=e5F7eNMlA6KUJD0m0ERmr+8owXyOLSDPaVqJgpgN9735G21Utwh+8cXXyW0/6tQ/mjLbUkhV3O/tbyilvV5ijm0b+p+rCZx/9r8nRW+DdWsyTFflGLq13Etosv5aW/ujDIqqNo5mEaY5DlonxXj0D4H0/MRFw3/aFoCS34gwXJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456664; c=relaxed/simple;
	bh=MFEXerAp8YkUeh1632oAcakBkgoa+iIvn8OYQFJJq/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gi4Q6C6X1jeQijYx5BC+69vUqOQRv3j8IOY0g2uoO81bZJbz0/GFSaXy4R5VKPe2e1tNHOWwFZFmyI+qWajGEGR35/Ev/wjIqXbbZd5UVvnnCvoH22WgW+w1l1MSWt0aTa6O/L9splHL9kbDbdXijSjI6l7khIqc05o4Mxl5/Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ljcbxh5g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HN130mgF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ljcbxh5g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HN130mgF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Z7fl2167849
	for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 07:17:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bl9v/AgdP0OwD+z9bA97aQ99CJ8kyJB54LPdNFAL3Tc=; b=ljcbxh5gBgC5LYEh
	mseWdzdISqshcJZLWNVvf9ju2i3w8FWfDrKb9DcuIPRj0u1JpTht2dqfbYnJVnlP
	7qKI7IE/NicBdV5NDBMtIb9jvQLz7vncAQmsc/GuhP/KM+i+wLk9/uBpeoDX9OCg
	KbsTLB1GKVEz4ViTD/wgCd4ojrjxl5Mqgxf7echK7ORomS52oGF44xZhBKQF88zK
	74sR56TwfOf/6yEydMj1N4dWUqYZ3caGzi7s8+MP/6YNaB2niqaPzco24wRrFeiU
	9Ku+z2kFa8Lxc7BhlRJQt7UpQHR91n4i/h37wTuh9lwwn7g57S7wOtik8vCSuQR5
	WY7m7w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpx4s8tku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 07:17:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-395543dc382so5599381a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 15 Sep 2026 00:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789456660; x=1790061460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bl9v/AgdP0OwD+z9bA97aQ99CJ8kyJB54LPdNFAL3Tc=;
        b=HN130mgFi29D2gXKcQDGpiRGY/ILDEKyOJkXt/tlg0kip7Q9BwWs+XngoT2SMnKsa4
         27mlN0v4p8TRBuvT6V2qkWljwVC86QO/RcLlJwlNbvKmMrTCUiUMzxzTTy+QiHAdQfrS
         XY2DHp/eMnkDQyduHCgAO/X6/FL404AoLAhUCY81Tvl6XiVaw/ZSJ8PwcKM7/oQ+jRDq
         DLh7DJgxlmyDeeSWBzxTYCNI5Mx7kg80Ri/fGBmS5XRbII9qeg+zhmMpOhXRlMsegeKl
         oyeoF1a3fRAF88k3SAwKgUwVvGkBKSeEfpZ29Id8qOlt8TVZdWKuqQkTcx3zzvr2qoJ5
         ryxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456660; x=1790061460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bl9v/AgdP0OwD+z9bA97aQ99CJ8kyJB54LPdNFAL3Tc=;
        b=y0seigo+CIQ4lgeH/QIMoShCD9oiHnzK24bgJ8sQ9qSl9ykd8bhDTfnNDhCi1c4P8g
         cpC4n12NGfb4Dr6jQO1kjZqFNZrmYv39btK+UHV9rKfC213SiTdEqmhX82zYWThimtVq
         3vH7Xy3xNhh5KOgsutYSE5QszUgVQRC4ASOo0HkmQf0xeQZ8Ixa9YxrQ5UVxaW2xSrdX
         2NuTD+RjYzH0dAnhcWyT7qRir0WoMoCXU2x1aQnW+eXk2Ip405L7FUsyD9MzyatQoMKz
         yJPXbJ0reff9DPf9uxQuRMtdPZjgaKLChK24U2OHg1HZj/VGvMWPBtfK4nEMb9WYmFeo
         GAtg==
X-Forwarded-Encrypted: i=1; AKwUvBwNGPBYNVX9uAt/Ytm/dmSwhEcrZkgmUgKphFJtI43TOcVwqXlkbUZdKsqSfS8DPOgIvsv31cYfSBLUf8z8bwY=@vger.kernel.org
X-Gm-Message-State: AFuF++kEHXQVUj0H/kGRf6PSpap47fsOg/b4l5kkuhC7ID8GxdowcMzZ
	Khu/xRbtN+xaFQJsSgIV/GhBmBZsyyhYiKkNPYoV4QoPfcjhhjela35mLPVuPUcJOfgesBELwYE
	XhteF+65ccTYTJZiranQcUoK+QthugwZ2yYTwZQl26O8jLLwVbLd7axlHtJmlWSUDxoq/DI8=
X-Gm-Gg: AYBFou15Ve9C0jWTLXwl/0L6vSuAosMnoFDn8n7/XxFH0GLz+VfBi0/01fdiNUI14+9
	K2cqLBV7w4BoPxECjjs5Cs+K6b2Tzr8vS2GoAbsoHY0AGccKIYEYilfoPo8LbBKMVpqWtbHzTf7
	UX7gFUKh0wph04ZKKPAPR9iMkLlxOK5BTtmLJzs4JPO0ddCzjyehbZxQB4klY8aK0v3AO2La9n4
	YdqkanYGs+WJK7s3ht5iT8VJo/6MP3ieDtcv19nerdOdKx4INaCmiXAWphO4j9EIGiHKfqFmleM
	RqPkRqIMIRJRuStkCWQuG9orn5bXiN3a5X/3E4q8zU3NxuLgMSn7bBuSk+yP
X-Received: by 2002:a17:90a:f16:b0:39e:b7:cbe8 with SMTP id 98e67ed59e1d1-39e00b7d278mr3590026a91.5.1789456659730;
        Tue, 15 Sep 2026 00:17:39 -0700 (PDT)
X-Received: by 2002:a17:90a:f16:b0:39e:b7:cbe8 with SMTP id 98e67ed59e1d1-39e00b7d278mr3589957a91.5.1789456659306;
        Tue, 15 Sep 2026 00:17:39 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdaccc0fsm3447120a91.15.2026.09.15.00.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:17:38 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 03:15:36 -0400
Subject: [PATCH v7 10/11] riscv: cpu: Output isa bases lines in cpuinfo
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rva23u64-hwprobe-v2-v7-10-aa35ebd9ae96@oss.qualcomm.com>
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
        Andrew Jones <andrew.jones@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2779;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=MFEXerAp8YkUeh1632oAcakBkgoa+iIvn8OYQFJJq/g=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqwVH7bZ1ogEmMSfY9Oy1bh0rMZyYUpccPK+Cxpmlw4ec
 vA5ZXS1o5SFQYyLQVZMkeXw0Zbsra98on2fc/6AmcPKBDKEgYtTACai1sjIcHHTx/Qdf29cUxGf
 ub15s/LP7Vcnhl451Wpyr6pCXqNSeA0jQ1c54/Xc1X+3zqv7LLRrbsfJd0tXmJUKx3aq7blcoqT
 8mxsA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfXxJU6JGOJFWQx
 KAxM//4d3zHcGyE/7PglzOfKN/U6u7u8Sd00C2fOzDOMqh5Dw1YnGo9jjspL/0KTExKL+7F0Sdn
 nMku//H3nApJh9MqtInnmXxEw37K4VQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEwMiBTYWx0ZWRfX5GkuJHOtGYxn
 H1HbGTfXApRHCQJutuIf5kLemEHgjv8s4a+j71vkIasfjoG3tE+OWclZ0RFPwoUgHQe07JLFHrm
 JpyHxyegQnHcO+c8jdIXuye3DgiNGeSB1wg0odOZZBRjmxRDsKfDiE1g+eJrcwDBe+POsWzX6vx
 PQV8IkPoMrAnL9FG9xa3g0rm/J1Qz/Rtt9gFFxbafSHE8VB5K+x/1eDdougi0qFpKWQ/V2Qz5P/
 Ngb/+LA7w5WQ0astRvrOTYfInVMc/j1io7/JKfVdy20rdqDZs7HlnrzeXqULuwegNwNPdw7U7l9
 yUbQUwYJ4DgvHi01pTKdsUBmQo77C2mKYgtEEw5rWpf74UT2S93C5nGXDkaOMu9spI639+V+0eY
 HLLGxPYYSswWG1fQOFKHd9J8YSyBpGxsKsYBoZCp7W4McxIrSQWbrHKPc86gAtSibZnPzwR6gl+
 bpCwWLP3ffmA9jdxrQg==
X-Authority-Analysis: v=2.4 cv=HsDjiETS c=1 sm=1 tr=0 ts=6aa8f114 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=iQKFDb15jVzJNXG1q_sA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: QF-SUt2QT3-PQlMGvXMxTMBxYV0mxxlv
X-Proofpoint-ORIG-GUID: QF-SUt2QT3-PQlMGvXMxTMBxYV0mxxlv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150102

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
index 3dbc8cc557dd1..d06824048aa25 100644
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

