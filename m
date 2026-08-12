Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B065472F9A
	for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 23:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786577759; cv=none; b=FELWk+AzfjbivGDMYeZVssxXjIFGwV9HN3Q9eb4WbxWHRxAmJl5F6HzU6ZM6iwWSaxmwnscwVUK0sXdl5+6Zt17td6vygY/PKd6npEbovYH09qYXktoWM5y9pshG4AWc3nuhTdWMfFU5Zg0+8x2gE3EKL8gvw27DFszGMXdu2Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786577759; c=relaxed/simple;
	bh=SgF0/fuQIfTNrS1fvPiZitsdgKYk3yzataCrp5aiRzo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DLrCgma4dVDrYuJV8AIxlQ+cUFbD/jq0PscvcfLf4qHBrI5JIL08slP6SDg4EkKR/VL+ociAMhTpT8sY2AvTNnN2T6F3PQU+fOW93MivMTDdzZMXGR3OfzjBbfE+lUf2z5n+P15E0eHgVX6sguYTWTd+DXGQnxwtLJKHF4u3npE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eSISGCsT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z/mwI/2v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eSISGCsT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z/mwI/2v"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CNLZTj941738
	for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 23:35:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tqlPsdCOPbAGtcRg2u231JHmVHO6OIQXwPGrXSBWdqE=; b=eSISGCsTZhuESIeM
	OiUriQPxzY2s2V0MY9WDyLkqzsmVpZnNG10keHVUCjDiFYRrlVgif6nrx962OF0F
	LXar5f2fXWLH0r14Hbz8U/TmpVVEfG7HHhMGub4qz7LmqnrJQeHirLinATHOMhtQ
	ejVwUfP6txuX6htC+lNT5Xwx9oBW4YMhNVj1L01TSq7SkfXP+RBzmUYJjaZ8ic/1
	XrQPQ1J7TEVEWY7bbLz8jPe47CvAbBg/HLf9pvbhlRM/0tV+oZJH3Rqcr+d13K/I
	VrmiGC2Sd/aEGj1wsMao5nQrZGal/Ym+A4f/CcnDjoddrS1enzqecAoLHaarE8j2
	7WcqZg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0xx1rtt7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 23:35:57 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cd01a14e81so3027725ad.1
        for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 16:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786577756; x=1787182556; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tqlPsdCOPbAGtcRg2u231JHmVHO6OIQXwPGrXSBWdqE=;
        b=Z/mwI/2v9AoKfJeLp0pTGOoi7fgvOjf8XHCOdrpUx312T2qsHz3KmWgrDdi0rFGot8
         LvUj2Qi9iBKy/wAuhMvyGEoE+/qq/0rbLb3E1jJjm4BKxHgw5YTedkf6PPqNx2fcfr4V
         ENSP6DlG9sObriyNw9jKk2A3GQBkjNnZhUpdWURyoORjnTGYaOABcfIg4Z6IecvFD/u5
         tIJAnHqoFJenVVyj4ZF6bNKt5j8uVfjTTMrCxVJDSp6Wx+MKykTkMGV/dKt13MzjXUZG
         whF8voXgg3zU9wcEJBnqy2RbgL17Ia03H7c/TYPNz52GXRjG3ABUeUYDjYLNQB20VAkh
         fnkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786577756; x=1787182556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tqlPsdCOPbAGtcRg2u231JHmVHO6OIQXwPGrXSBWdqE=;
        b=YE4dMAYTXxpPPC7540r0NTPUHAMrS6bjWXF/8W+csa+CwYsZsE5Cnvgy82mIHsRop6
         X084FVaJZz72Kg87JTY8/YNcY8k13ke7+wwCEjAIc483XyFiobVtNp+x84dKV5Z8H5Np
         XSOCAKd7+fptgcj/FfgigJWTfyEk/I2fn9tu3gQYExq1dIAbHVZGKRHVMbkSbChYiuuK
         NOV34rPbCRAdHT0vaZd2buyD5fLMhGPcl/24mqmlXS9s3KRjuIfvBeToOgCwlemADQGg
         XyWRx/YnWwCDfH5bBtwigkrgsfW6fVeVWx3o/yFFXMhgl47oh/xn3zP7h75przPFeMjO
         byAA==
X-Forwarded-Encrypted: i=1; AHgh+RqOyPNrJn1ffFIQQWosa0yXC/k9DE+70Lncycgo8LC4oUNFSsrVnDX6sBmb7RBqNstW7xiMuUwIGpH6q4G0oLg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy0CBioxdaNPkJOOeHxpcr2G6xlG9ZgWJBnP4ZUwMXZN9oeLzL
	udh4bCfZnx2zeFh1hrfy4ujDAVZBvcDmFlV3mIw/yvyWkHNz6RYMqEszVVIyYON9KTemcFf7qST
	A5lt7aucHKqYy7oC75zgRGVuLml6PhH5UmMNsIUvN1tntHx9UxvoH9N4pKSEe6yPvlV3Jhto=
X-Gm-Gg: AR+sD101+pXnpFtiBB39tM1kym91FuiX/zDyjqgTyofRmlAen6EAT9CI+ZkQUxE75zW
	ZX3OItlrQ+djj93GDXx3YIk4QLctmVjXo2bL4xGF9duG91hX+fc2JxQTiy2BaZ3nc5hrHZRfWyG
	U0dW2/GiVAPNAan+dD9c3E86r9C4u0DdrR3YjWlIcN81bARZE7HFLyoBKx1c4A1L3pZ0ZNsY7/J
	AWvUQqeMaaEfrLN6mLgVlJXrjao4VgYVRWXOlFNK0WySlAopT6EVVFQlEDPZ5LlUTUVWJVC3+9N
	FMyyfQ5W1QtogPGsqEzmH0nxdMO1bX4ncWCG268pGv+XAKq390NhhqpuAHwB9w==
X-Received: by 2002:a17:902:db11:b0:2c9:cf62:6f61 with SMTP id d9443c01a7336-2d37e86ae4emr13015285ad.17.1786577756329;
        Wed, 12 Aug 2026 16:35:56 -0700 (PDT)
X-Received: by 2002:a17:902:db11:b0:2c9:cf62:6f61 with SMTP id d9443c01a7336-2d37e86ae4emr13014995ad.17.1786577755873;
        Wed, 12 Aug 2026 16:35:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c26d0fbsm2136805ad.37.2026.08.12.16.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 16:35:55 -0700 (PDT)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 19:33:54 -0400
Subject: [PATCH v6 08/11] riscv: Add a getter for user PMLEN support
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-rva23u64-hwprobe-v2-v6-8-c985af3256b8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1962;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=WJTJFyxuRvfcgUEXUDYQIHOAlpEPJJlnDq2dMpcawTc=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqxaZrGrivyN7P8q399daxNvduthVmLbWt0/4Sw9Bu5VF
 t/OJNp3lLIwiHExyIopshw+2pK99ZVPtO9zzh8wc1iZQIYwcHEKwETsLBgZDjm52U9sdMzzlXC4
 MCvRTEc/cW/XtDk/PmlXtLD5Rv1cxvA/671i0Jp7ziqvXv3eG6pQwhB5eo5C7OGUh7urA5xnKcU
 zAgA=
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-GUID: ZczSKkcNiSZ9c5mXoLEn_fX5Hs8MFNIN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfX93hUkVKcU7gS
 UeaqkiSOFCqcyDSjluB1lJ799JQyViPG4bPcGUQj8FrBOgfOVB4e/we/VmXRSM0Vhuymy6Isvrx
 NokH2jd/FoitJGc6gwME9+xxNkko8Mlly1IW0wBrjW6dBJq9j47P8pl2S49Fa+qgVqFVWgQFEgO
 dSJAuIpGlWme/cpeNa33Ul+NhAEQi0x0CZG3WKRrEkPiC7K0fqUskwYOo23qhfQc66tPi1KulKG
 LEhv0rZvGszGNV1YCwd7XjGjED0t8PKMC61FvSpDVWduDJBZH5djHdCazmBn/2anaf4kBkBj5dh
 FXmimSvQWvzPvAviMxBSEMF61Bk4UUxacW2sRrWQO9w8sPZ+yeg1bNefDxbl0Gzb+SpixRQZxs6
 cfkJO9c8RvQf8ohMR5V1WHVZ9nCT/12egHpM4PHSrBMumhQ5dDMMCFCjlTJC0FBT3zfSvF1LjWQ
 j/ML/LeJo/i5aaPhqAw==
X-Authority-Analysis: v=2.4 cv=J6KaKgnS c=1 sm=1 tr=0 ts=6a7d035d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=A_72rIs-Kagud5g8OzcA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE5MCBTYWx0ZWRfX/FlrvNG6gPK7
 jHcNhjEo/TxQtnz/P3geXbrFURwFa9XP77iyFtLWp++30QXZGG0sSNjTtq8bt8wc7/0+m1ujCJO
 X0SMiqVvxNpbeU6qrnJ8ZfI5t/g+P3Y=
X-Proofpoint-ORIG-GUID: ZczSKkcNiSZ9c5mXoLEn_fX5Hs8MFNIN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120190

From: Andrew Jones <andrew.jones@oss.qualcomm.com>

Querying whether a given user PMLEN is supported is needed for
RVA23U64 base detection from outside arch/riscv/kernel/process.c.
Add riscv_have_user_pmlen() to expose this.

Link: https://lore.kernel.org/linux-riscv/rfuwa7a3ebe76udmnwyrssjy7shkkgxntvhwzn6oquysj4tuyp@xzvpylcfhz53/
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
[Guodong: replace exported booleans with getter per Andrew's suggestion]
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v6: No change.
v5: No change.
v4: No change.
v3: No change.
v2: Add a getter for user PMLEN.
---
 arch/riscv/include/asm/processor.h |  4 ++++
 arch/riscv/kernel/process.c        | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 49a386d74cd3..da9089695ed6 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -217,6 +217,10 @@ long set_tagged_addr_ctrl(struct task_struct *task, unsigned long arg);
 long get_tagged_addr_ctrl(struct task_struct *task);
 #define SET_TAGGED_ADDR_CTRL(arg)	set_tagged_addr_ctrl(current, arg)
 #define GET_TAGGED_ADDR_CTRL()		get_tagged_addr_ctrl(current)
+
+bool riscv_have_user_pmlen(u8 len);
+#else
+static inline bool riscv_have_user_pmlen(u8 len) { return false; }
 #endif
 
 #endif /* __ASSEMBLER__ */
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index b2df7f72241a..5d9cb108a623 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -302,6 +302,18 @@ enum {
 static bool have_user_pmlen_7;
 static bool have_user_pmlen_16;
 
+bool riscv_have_user_pmlen(u8 len)
+{
+	switch (len) {
+	case PMLEN_7:
+		return have_user_pmlen_7;
+	case PMLEN_16:
+		return have_user_pmlen_16;
+	default:
+		return false;
+	}
+}
+
 /*
  * Control the relaxed ABI allowing tagged user addresses into the kernel.
  */

-- 
2.43.0

