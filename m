Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEDF3F1670
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 13:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778506635; cv=none; b=SW1ieY/jxd4Fore+HhlORYLuSIS/+DGcEnxS0W55TDEVgL8+4IdIYkRD039LxR+rqzjTJKlIqgeIHr/0Mfti/ZpvE19P1G0uz1PCxTCtY7X+cb5GQplpvld9Py94kB7l2JGstTrw4SP3FCeooxJ4ah7CJv7AYObmM55eEG8bgTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778506635; c=relaxed/simple;
	bh=ODHCLOx36gGEWWXLeMxNSLyvFS+jQ/m/q5H1amqF2e8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LaR7KEw5zl3yWydd2VZNTCHloozPxacCnIGe6ygGOWMN4E616Jbfe11LPvls/c+lLjFQfdUt7/oS+1TA7kwpGGlW6I8w5fLd6JC1UxbJxkuDYbxqSoSTUF41Z9YcprSglSYMFPmDnWXb1ATsPnIgTZb9tVV1QXAUR9kc+TJ0Zoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=tzRmx3sf; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="tzRmx3sf"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36523acb0c1so2956740a91.0
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 06:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778506634; x=1779111434; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sYXDquoWtzp7On2yMHA53cV/UG4j8k4cYWaJ5BWxi74=;
        b=tzRmx3sfiaZM/i4Ix+NPGDPWSz/yDrZ62XyfFDSQmtMJWFdZUdH36wlElMfnrlLteb
         zDWAuMdC20cUlSX+eGzreO8equBufB/3rf1157Z+vhA26TYLSQ/+EcghsvM6fiEO7kE8
         stL90iJwWUZ5esEu0sWYPENKbJWVJYWxXCjNHC4DycVwSbbGnr6t0iv56saqeaQwNP6G
         owUo9grwLdDTnKlyRl2OLIMCjwB9ccl7i8XqDs3t3rbH1issaEUfqw2L0ABWcxV+gGTl
         liua9uSf1f+j011ZhuJr4+/FAitBT/BPMFBS8JbxibZWEpW87VjY92+aAO/IgnszjZBV
         ObfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778506634; x=1779111434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sYXDquoWtzp7On2yMHA53cV/UG4j8k4cYWaJ5BWxi74=;
        b=gJda1WG/jTtScL1BhNtc7HLWlCRRdLopJQYaKGoJLkoSsFXyzLhesP3GTVqm9J38bd
         b/NF0sYcbltff9IAXLLKSnjF+Fk7msoVYuXMPUxzpOBY1zz70YCU+FCOm5/2DwQl2PYs
         veNH2/ppbmH2JCpAKA7iddvh4jgt8/cYLzoEIdf2pXa23mn8jZBCgxHOGdCxb6lc/rp2
         MK9sn4XKLI2miyyd/3TRjLJcPe7Kw9pxgCiomwk80pwcPhcnvbq1f3/0ApjG2f8oY9GP
         0Ei38xSX73lTuxVxYhT9I4laRafMErQIxKKhPXTE2hhVzKnyn7FEWAE5UxMXyrEQ4ssz
         YJCg==
X-Forwarded-Encrypted: i=1; AFNElJ+xvr9FG3SFyz04DqRiLZF929u1b8oie8xpVK5oqOuXapehvawytzEqAUTic7z13njXZOhlNWzd5WL/W/L1ITI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGxw9kJkR715Fteab8aFBCBwKNkU+mmqCRhAj/K61jvPhRQfod
	v5u4DiAOLWiii8Y/D0LCUn+5Lq7uwPnAbQ831TSVQAdQiDPb72LARRalIdzSZ4LTWtY=
X-Gm-Gg: Acq92OGTwpNrGScNezME9Ie8NSzeTz/o9lddm5vTXAZlEHGTRP7SWex+/fvmJiVdTcn
	LxGeeJertrBdOf5KPh/feR+kELtcBwk+2Jm6ND+ppMpOKmiEcC4eMRGlyyvwY2JwH+eYo7dCSL5
	jcH8/o6Z8F568Rf+2yBYQ5y7J0/sEh3Ghf1qz9NmJO72KtFHqiv2OrPV19GHGTI7CRUhQtXJF8k
	PMvM9AFF45hpSqOzRjJ9wDTUxZ33XMHsfghldmV1h2wQY2DBIGkn+enkcSUbTAvLb95KQrgWaTc
	qvYs2qrXtEm6efaurjCpgiDNP+1Nmka8LNlfCwd+znYHXq2EmXHZCPYLhCTAjORcLyeM9KcQjOy
	1LYA7sgQq/9iKp/x3SCIEwN9WzPDxL5ulbzNBfJILuRpNxpCzde75bY5PDcMld3HydPTqMpC7No
	TZxbgvqxHP/VQab2IxoEfnUlzwSHWQSRMQH6BsiV5UNnU=
X-Received: by 2002:a17:90b:2d90:b0:367:bc89:546e with SMTP id 98e67ed59e1d1-367bc89550emr12198051a91.12.1778506633829;
        Mon, 11 May 2026 06:37:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30f3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367be3daafesm3034326a91.8.2026.05.11.06.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:37:13 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 11 May 2026 21:34:52 -0400
Subject: [PATCH v2 07/10] riscv: Add a getter for user PMLEN support
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-rva23u64-hwprobe-v2-v2-7-21c5a544f1dc@riscstar.com>
References: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
In-Reply-To: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
 Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Samuel Holland <samuel.holland@sifive.com>, linux-doc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.15.1

From: Andrew Jones <andrew.jones@oss.qualcomm.com>

Querying whether a given user PMLEN is supported is needed for
RVA23U64 base detection from outside arch/riscv/kernel/process.c.
Add riscv_have_user_pmlen() to expose this.

Link: https://lore.kernel.org/linux-riscv/rfuwa7a3ebe76udmnwyrssjy7shkkgxntvhwzn6oquysj4tuyp@xzvpylcfhz53/
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
[Guodong: replace exported booleans with getter per Andrew's suggestion]
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: Add a getter for user PMLEN.
---
 arch/riscv/include/asm/processor.h |  4 ++++
 arch/riscv/kernel/process.c        | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 812517b2cec13..febf51e127f70 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -214,6 +214,10 @@ long set_tagged_addr_ctrl(struct task_struct *task, unsigned long arg);
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
index b2df7f72241a5..5d9cb108a6232 100644
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

