Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C8338B133
	for <linux-kselftest@vger.kernel.org>; Sat,  9 May 2026 13:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778332226; cv=none; b=XuyhTD0YbPS73BGxF6my2hjru3jF/6aQYHnCjBwSeJ9bG3vD32MIXwsoYhR38A/nfYyHvene00H5UdDdbzcm8mDgQ5ntF+g4zYsVasl6uH3cao6ZnzNW4kF4mSrzFPo7ChohfKhtMAtfiTlpu0bt3EH8E8CIBcoC+slBmHVkZxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778332226; c=relaxed/simple;
	bh=uZrd32wUvX5SDEU1PWqvgQ3qjQJm8e+VexqImi1d9vM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XaIwbb6cJtBVchhXB9DmHY0T/WCg6U1hNCbspr0dN+v6E5SGlCNTltFAci2o67gzsda+mK2N08B2o31yyXDAcrePlVimOEE22W0yO2YXVhLboAY0U1u/TO9CGqYHeAMBdX+j7UZZJsGo6oUjW7eHmaxUBB8c+JsvM6yEy/217TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=BBL6CInP; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="BBL6CInP"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-837dfccd950so1329957b3a.0
        for <linux-kselftest@vger.kernel.org>; Sat, 09 May 2026 06:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1778332223; x=1778937023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAkSYkxsqqTOgdXkwd1wAt3CxX5zO5z0PreuHh3BJZA=;
        b=BBL6CInPOQv5BnrbcLeRqeSq1XBZF5dcFz4z1kbOPcBoPOFpXgcw4KkwlTGH4evp9U
         8VHWC7E0v+gzq1YHAU1YpEMNV+kBkrvq0K2g30MuHFakzc1RRJufgp5RgvvlocIJMwoP
         VEq/JW0SKNY6acywbRlZZ0mhtQdpxbSW/XhXFfqiMnIyVEDcyhAqczgGJxn8GAZqTtfR
         4tm8dgNapGqYKWY7esRqHf34K9NPMvuP2389Kd+u3Qu2OtcZno+j4P1MMS537n+nwPy2
         ZPaoRaSXdGVvU6jtkq9vMqvjZa4FqM1YYYTRS7D6zGrLwmIEjalkWPhgVbxC93ccg8gw
         wvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778332223; x=1778937023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PAkSYkxsqqTOgdXkwd1wAt3CxX5zO5z0PreuHh3BJZA=;
        b=Ss4VAOpudP7LYPIj8Zs0VoLvBCB8P8nBpuYbwljPpwjAW/sEM7nIvIv0a4qBmojzvJ
         8ZAnYmYr4iucIsyi/MlnNSvX8zMSz4EVcAkihO2VdZm6J1GJKvTxoc4HmJ4fr5BjHY24
         8UPiEy4ZwZFyl/24Bpolhototu5yAFHugEPsLjaOUl+R6ZksZHGZ2lFVzmWJuIYyR96i
         fLJWl2VVP9BZ4zRDeucekEWXABpACTYI44mXXAVSaVjqA4k+HPAKSljXUHi2eR6ZLt6k
         JUgTLfT6oQT6E+liJAQ6PANcLTK3NPyYIIhzSr/kzwe2eg+F1VFrf7wXlY0YDvrL5j/u
         /VIg==
X-Forwarded-Encrypted: i=1; AFNElJ+/ldo4J4uK/QYimDiv70H1KgebyimJc4zWtCGyA/V/g7gzHvkLBqL15T12CY1YqQOeAbSv21ov8FlSjSk4U74=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpBkiLcSZ1JMjcjBCErvl0jMEEftwZ1fuy1MbP6PQLy8c2dyEW
	SAOSC+jTuYrAfZV+LC1g+GHX2l2/NkXyozbgIYjL2DYItF4RD0TYzP/89mvK2fH5sqU=
X-Gm-Gg: Acq92OEnv8OaCpweqO29Klos7153fwyQ2IafgmKzV5xhKqsMfpqtes2hR0f4wFsl6Ww
	Y5ChQrYLqQ75mW1YRlhKXzphpxF8L37FNiwwvdaOaa4QpVMKzmC2bCJPsQDN5EPAqhK7ArCJ+Ok
	6+Jmu4Bd40AkEkqEOJtMLF3RC28iHt/5/PHuT6EIP//rc0jkj0AVNe1TTqoVlNFDW30zEpt7tbQ
	KPeuv20HaPUDdp7GhH+/yukQ6Dp5LykrVsFPMXAup78Bz7CfNjW4KAf0+83itXhIjsr4u2+MZuS
	6lwKwlyvmXBpe7kQ7dnlOlgNx7RhbwmknJxp2kTaT41+DhhjEXphQ1H4d4KDAaWAgyuBKwftT5W
	HNt7CNfuDpm9jvfsXWUNajKz91qWvgNPY9MZ43I49gPCfN+hmq9urffgFSAt+XJP95e/1FXS+yw
	JWRwO7s7OZ+lNkPZz3b8RbEmzhWwQiBHswOpH8t3zwDYEEK78kBw+biyiTFFeDWJWO+vKk8Bft2
	pTV/w==
X-Received: by 2002:a05:6a00:8018:b0:82c:249e:a85b with SMTP id d2e1a72fcca58-83a5b7cd0famr17299719b3a.13.1778332222817;
        Sat, 09 May 2026 06:10:22 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([155.117.34.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c86b3sm18552855b3a.28.2026.05.09.06.10.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 09 May 2026 06:10:22 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Himanshu Chauhan <himanshu@thechauhan.dev>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Atish Patra <atish.patra@linux.dev>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Zhu Yuan <yuanzhu@bytedance.com>,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [PATCH v9 1/5] riscv: add SBI SSE extension definitions
Date: Sat,  9 May 2026 21:09:58 +0800
Message-ID: <2a8913d680ccf162d5d697fde1a125c48b2f1d0a.1778331862.1.git.zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1778331862.git.zhangzhanpeng.jasper@bytedance.com>
References: <cover.1778331862.git.zhangzhanpeng.jasper@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Clément Léger <cleger@rivosinc.com>

Add needed definitions for SBI Supervisor Software Events extension [1].
This extension enables the SBI to inject events into supervisor software
much like ARM SDEI.

[1] https://lists.riscv.org/g/tech-prs/message/515

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Co-developed-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 arch/riscv/include/asm/sbi.h | 61 ++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 5725e0ca4dda..3403b0f706b4 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -38,6 +38,7 @@ enum sbi_ext_id {
 	SBI_EXT_FWFT = 0x46574654,
 	SBI_EXT_MPXY = 0x4D505859,
 	SBI_EXT_DBTR = 0x44425452,
+	SBI_EXT_SSE = 0x535345,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -506,6 +507,66 @@ enum sbi_mpxy_rpmi_attribute_id {
 #define SBI_MPXY_CHAN_CAP_SEND_WITHOUT_RESP	BIT(4)
 #define SBI_MPXY_CHAN_CAP_GET_NOTIFICATIONS	BIT(5)
 
+enum sbi_ext_sse_fid {
+	SBI_SSE_EVENT_ATTR_READ = 0,
+	SBI_SSE_EVENT_ATTR_WRITE,
+	SBI_SSE_EVENT_REGISTER,
+	SBI_SSE_EVENT_UNREGISTER,
+	SBI_SSE_EVENT_ENABLE,
+	SBI_SSE_EVENT_DISABLE,
+	SBI_SSE_EVENT_COMPLETE,
+	SBI_SSE_EVENT_INJECT,
+	SBI_SSE_HART_UNMASK,
+	SBI_SSE_HART_MASK,
+};
+
+enum sbi_sse_state {
+	SBI_SSE_STATE_UNUSED     = 0,
+	SBI_SSE_STATE_REGISTERED = 1,
+	SBI_SSE_STATE_ENABLED    = 2,
+	SBI_SSE_STATE_RUNNING    = 3,
+};
+
+/* SBI SSE Event Attributes. */
+enum sbi_sse_attr_id {
+	SBI_SSE_ATTR_STATUS		= 0x00000000,
+	SBI_SSE_ATTR_PRIO		= 0x00000001,
+	SBI_SSE_ATTR_CONFIG		= 0x00000002,
+	SBI_SSE_ATTR_PREFERRED_HART	= 0x00000003,
+	SBI_SSE_ATTR_ENTRY_PC		= 0x00000004,
+	SBI_SSE_ATTR_ENTRY_ARG		= 0x00000005,
+	SBI_SSE_ATTR_INTERRUPTED_SEPC	= 0x00000006,
+	SBI_SSE_ATTR_INTERRUPTED_FLAGS	= 0x00000007,
+	SBI_SSE_ATTR_INTERRUPTED_A6	= 0x00000008,
+	SBI_SSE_ATTR_INTERRUPTED_A7	= 0x00000009,
+
+	SBI_SSE_ATTR_MAX		= 0x0000000A
+};
+
+#define SBI_SSE_ATTR_STATUS_STATE_OFFSET	0
+#define SBI_SSE_ATTR_STATUS_STATE_MASK		0x3
+#define SBI_SSE_ATTR_STATUS_PENDING_OFFSET	2
+#define SBI_SSE_ATTR_STATUS_INJECT_OFFSET	3
+
+#define SBI_SSE_ATTR_CONFIG_ONESHOT	BIT(0)
+
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPP	BIT(0)
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPIE	BIT(1)
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPV	BIT(2)
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPVP	BIT(3)
+
+#define SBI_SSE_EVENT_LOCAL_HIGH_PRIO_RAS	0x00000000
+#define SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP		0x00000001
+#define SBI_SSE_EVENT_GLOBAL_HIGH_PRIO_RAS	0x00008000
+#define SBI_SSE_EVENT_LOCAL_PMU_OVERFLOW	0x00010000
+#define SBI_SSE_EVENT_LOCAL_LOW_PRIO_RAS	0x00100000
+#define SBI_SSE_EVENT_GLOBAL_LOW_PRIO_RAS	0x00108000
+#define SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED	0xffff0000
+#define SBI_SSE_EVENT_GLOBAL_SOFTWARE_INJECTED	0xffff8000
+
+#define SBI_SSE_EVENT_PLATFORM		BIT(14)
+#define SBI_SSE_EVENT_GLOBAL		BIT(15)
+
 /* SBI debug triggers function IDs */
 enum sbi_ext_dbtr_fid {
 	SBI_EXT_DBTR_NUM_TRIGGERS = 0,
-- 
2.50.1 (Apple Git-155)
