Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260164;
	b=Joq4Q3VLukC2oyW6AjInxvqFRPtubo3P2DQeC0UPjkP5ucR2xSx8QczqQONKJGqm32P/
	 SEbERRKyEsZUU9fUiS3Bea3nWIZbJxxA2AxQjZRVtRKyJuJzI2gILZJtpQIao2S0H4YJJ
	 adVsrTK4H9sRqtrp0387AFRJCEqkOscGr9++SbQII1VIFafaQ1S7VVx1RdWDR+P0DaLn3
	 8L8FZmyVOahNNTkSzgmWlDnTx/8nLvM5Ih4lxQi4QvmA7CY65HuiAAB0Z1CVqclsqhN7Z
	 mg/zJ2SgHUq+W8bEoWx1LxJ2BTJfHmuAzl+qNoY+kWQ0KP8Lidije9V4oH/HbQGHRfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=A3A4KroQ7g5mtKyNwDKv1PbMO1uQ0igFufvmY/wg4ak=;
	b=0AaHeumvBxpuRyVOqxHXM/TU2cmS1txH4hRC2ti2T2tzWtoG0U9E7HRVANeqmfNcCrDu
	 EENzLW8iXUQkezVmy2UByZGd9lsxw56IBUi4J4mt0VlDj69ns0pzqrDCf42qMVZ29FXeo
	 IHj7W3LAtFbXUhQC9FhsmDHgGa9lbuY3XkCl8W3NKbwt96SQM2yccwA8u5cFSEyEgZLOp
	 2qO5Fvl9nsjPv++AK5YvwMV/ZC7E7NTY2lB2+vNZPOFjWwCy0uQHmgMv+D2Dzp09l50Au
	 jV3+TwHtMorAQ018A9Cca1QwzEUSJzgNr7S74AnuiqHu3BhdtJhEyQVuYxcmaj1Cklg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=i5Y8broD;
	arc=none smtp.remote-ip=74.125.227.133
Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46638606A32A
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 07:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46638606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=i5Y8broD
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2e7c8213b09so5736755ad.0
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 00:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793260164; x=1793864964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A3A4KroQ7g5mtKyNwDKv1PbMO1uQ0igFufvmY/wg4ak=;
        b=i5Y8broDdhc1sWt/yv6W4AyfzrqfJ2Nz3oXdHTbPrfTIxqWTzUZHOv2wS/HznzWbme
         Q7/8uIcYVg37o+BKniiJJb1oBTTOv3BXcDwTLYiPeVmahx10mWj/Glod8sTyWfq5GU9t
         CMhsM/I8c7kPpFTduGXTmkwfBXhRFaNdIy0kQrOnPY+rruz5O7QX2rqvqe+uvseLYsMC
         gpg8zf2Vz5wvIbqMR0zOG9s9BWnitSdXtuRi+ujR7CMzTqmsuct91+u7Kpl5fjczVYNT
         o3+71983zabWkzFRefGgxzsfoXjE+Tp9KtivRk+3ikEv5CZDpA1+NVsu86ZBuBpweYfy
         nKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260164; x=1793864964;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A3A4KroQ7g5mtKyNwDKv1PbMO1uQ0igFufvmY/wg4ak=;
        b=nMgofUyfi4cV9VQAGClQt5EHgXj6SiUC+4AREiBwvi1NkyX+djQSKZf9sIq9LvqnhM
         nKw2VFjTAP2E6ZLz1ke7n3vEYwNPyYYKXYtntxxADOfz1hzw1UrCfkTgV9Zhudyo1SOo
         T99YwaSNg9iCcs0yWSUC8cqBn9WkdypnWU0c1qvHE/bF23HbBsaz8FADaa3geTy1BHwC
         DjDND0NHCVfiC+helBwWMDFH5mDYRZTfPcTFiSRl0oCLcI9tV/hauj+UD1l7CKc78sZQ
         Phyz6X1hFdcIgj3KFJHZdzyKIjqdPr039NuViWXOpaQftzBIXMXY6PCMLbWFeVENDg5N
         aGaQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/Akt/qkXGx4vfNEf32jzbykDg8HfDgWIp5V1QJE8JhL8tiTQrltuGDE43VfHlImaAgdd0dlQ3BveAq+wfd1w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlQQ3RnLLRCAgvAK57AIW1kC3A8j5pNQBxnfiPl80fFIUf241U
	wGgbo1WbmqCuioITHIlrJdG5q1CqYKe7cLA7fifaW2LELA2OVhnrr7L0pUwlKRuHNyM=
X-Gm-Gg: AYBFou2twXg0xy9OMDba/yl2KBNZpKQXx13awDZ2uS/ffgMfaOV4SlznrWmUGDl5p3C
	5oNXstYEWeAf32FS5N5XkCzxYqyG+n01GCzlaryu1kxExi30BC8DpPL8O/mAmxSJF6PAkJI14S4
	UGA7icU6LkulANvP52wmrV0NYiD+Aev/u33Eje9RvAC2DZ96kwy1dnRzbZskiZsXhvgtsTUG28k
	NEyJPj/QOeid+pLKEB0I71FuMY8fXqTMCwe8S2OdXuti1EIDirHgLURM5GRUzgyhscU617vGf1b
	fD571FaiNZeTlqAheq2PgELk6wKnOkDfsbnD147V6YsWI8W4yvP8Hu9F24H+TB7lAyzeBlT8p4A
	5YCOX9mCG0I2NYcCerG5cVtIoy8o9hVT8yh6QRLLElngyHBlYSxMjB6HHuBUQGRk4hKmHeJQ4Oy
	bPpqMU8RriCi9iw9nLPc0WId8sy9kj5NRxwAYAcR/5bYWpJLnwUZxOI5iUuZxAbiHSk/hNb8pqB
	dyNMzbTxntUuQwnPevR0+/xLR+wpN0hRw/tFxCDJ6DLc6/+VMO7e+ePo6IgYQ1nxiqcOswS9mwK
	uuPPPwZbiixouBthz0QKa0RDOLSXW7SlLZrUDCWv6ZTMAI7o4PQJU62TRwC+sRzP/P+PIhq7Xt/
	EuFQRhIVriMFnWFw1q7x0suDPcE5Q
X-Received: by 2002:a17:903:46c7:b0:2e5:e1de:9c3c with SMTP id d9443c01a7336-2eb00590642mr37850705ad.47.1793260163496;
        Thu, 29 Oct 2026 00:49:23 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bd60desm30598915ad.29.2026.10.29.00.49.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 00:49:22 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
	Conor Dooley <conor@kernel.org>,
	Anup Patel <anup.patel@oss.qualcomm.com>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Atish Patra <atish.patra@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <shuah@kernel.org>,
	yuanzhu@bytedance.com,
	yang.yicong@picoheart.com,
	yang.susheng@zte.com.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [PATCH v12 01/11] riscv: add SBI SSE extension definitions
Date: Thu, 29 Oct 2026 15:48:43 +0800
Message-ID: <20261029074853.35467-2-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
References: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Clément Léger <cleger@rivosinc.com>

Add definitions for the SBI Supervisor Software Events extension [1].
This extension enables the SBI to inject events into supervisor software
much like ARM SDEI.

[1] https://lists.riscv.org/g/tech-prs/message/515

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Co-developed-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Co-developed-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 arch/riscv/include/asm/sbi.h | 63 ++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index fd6266a7b33..eb22d79cea6 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -40,6 +40,7 @@ enum sbi_ext_id {
 	SBI_EXT_FWFT = 0x46574654,
 	SBI_EXT_MPXY = 0x4D505859,
 	SBI_EXT_DBTR = 0x44425452,
+	SBI_EXT_SSE = 0x535345,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -508,6 +509,68 @@ enum sbi_mpxy_rpmi_attribute_id {
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
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPELP	BIT(4)
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SDT	BIT(5)
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

