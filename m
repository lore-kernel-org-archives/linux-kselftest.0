Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794019228;
	b=d/t6lNhKrhd+ci83PlzTZeAUqwWDmQOAH2LhkNsY/Jc1VW8pGS8FBdelqA9B2HF/SmI4
	 2bQ5mBcGCMMbPuU14jLg9jTG6sRI7RwDvbOuLUUwniG4qOf+PztcvzoXpUcz1QSwhgw+v
	 0cSNpmII3ukwqvSXvvTg/VZAaUe985YRFXf58bI9HhGI7ubN7EFSMwTWyFY6XRNCb+LHX
	 m1NxcxW0GypdbXsbWcz4fdMSubfmj6ofBdqz+HBhFKtu82Mpn/IAeM9Hpr/mRm465Eqps
	 r7W6D52MDylf0gW5KSS5B4oAjJ2ZYKuAsRlu0EkspD51j5TUGetXDaeiQOb3/ha+4LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794019228;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sxv5EqtnYWUCOVJkYUviHmwxoOD0vd5Ri8oexCtFYW4=;
	b=dYpgKhLJXEEXqGr+z9ZW0ztzOtqZZA1GNeapF4kOG5rwx160OrOTHebqOMOK8rzEED+d
	 GH7oB2lZP8zR/gmXXAMIp2TkGVkIU+Cv8ViVcKG7hcB1ti9ZWJAC85JhEOpef0eX7OU/P
	 BfLawF6vmFcTL8Lu2apYcyFXCXxXnmEM8WCs9oV3JKZHMhdN/wEfP3SRWh7D617RT6rSl
	 5fr6e89bOkIlePrFBSmZFL7kyiq4jrjwNpD9qlzWSwiBLW6/H8oHjPUc7N/RtUm9As2LI
	 pfu1tUUcX4a4wxLJ/FJdNiEsCUZ3T5wg6dGW77I0Y9AIbLc1Z9dNhWus3kEfMXuG/0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L1gmG5pY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AZUDdQz4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E504D606A330
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Nov 2026 02:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E504D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L1gmG5pY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AZUDdQz4
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A72BZOA438764
	for <linux-kselftest@vger.kernel.org>; Sat, 7 Nov 2026 02:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sxv5EqtnYWU
	COVJkYUviHmwxoOD0vd5Ri8oexCtFYW4=; b=L1gmG5pYYAgjaDrzkHaVi16Gsq6
	/LL/bdPzdAX+2q1kcDuvVuYbcHTP9YzU9jn16oZISlObiwgRlIxwbZW9kJI9vQUj
	WVGtlB3lCpDLs2sRw5F137AbZn8tqtHCfw1DoysxFjVKjoM/HCiWHUnWVF9YvRF8
	q4DeiWs7kiZTohtW0hA9dT/QPrJnvSPDnMNQDBD8/F2eKDk448Wx6S3wG7/cBwSs
	IO/cNrdrg8zXPxmdC79q77wGkr5uVdPkdfVXICkT9OltUFRUPjMJ3fchFLYcaMa7
	ZUltcETQFkaXmYGOJNKXt7SiZ6PyJs2iYJLoKbueD3CNUN5AosrUJ+Nol9A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmeb1apw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Sat, 07 Nov 2026 02:40:26 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso2111204eec.0
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 18:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794019226; x=1794624026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sxv5EqtnYWUCOVJkYUviHmwxoOD0vd5Ri8oexCtFYW4=;
        b=AZUDdQz4GnFK74AM6JZjHJ5yQBaIhAD3Hlsl5EEGfCF9O6LekDTVFe7zuP5Lt/tRON
         FFxQacwSQWI/V/u+TgOIOTgUmMT+HDHXVzWWCt43cgn0eLcS8ln3vD+pUdmPgyMRUCND
         aimgQHQSVu0lT7nmBlDDVLKCNfo+5cgITt2njE3LchirHHOkMUPXdFULu1pISORAWQVx
         +th3CMY8kKxhj/QTAhvEfSxZ75nhS6Fg4pzUyFsX4kxPFfF7L/B0kAARRyOtrGRtiw1c
         fCa/n6MQk4YCyTlwDGcKIIblXwLPm7+lXRrAc/ygJYZGbY3b4XfbqRcDO89WetzAK96X
         ZGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794019226; x=1794624026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sxv5EqtnYWUCOVJkYUviHmwxoOD0vd5Ri8oexCtFYW4=;
        b=zkCoTu95Icr8XP9clQ1eru+AH7mwBI1wor629cj9APTu4sowR6HOmMLO8v4L4G7/B0
         +iWEUo8i4ctXpS09VR1SZAPqLUBkhKuaJOtFRVK/qLhX9fDLqJUDX0jaX94tYfqf+n7R
         ZhLY8x+sQ93dl5nzY7HzYA5AEiPiXYmV6GSn/l02VZKPTJON5YFtE/17xIW8rMmlx/aY
         hXFnf9mHi5BFnAtDOWVXxdCr4DdUG/kzysL9vXqhK8RmiSKx280e56tXiKt0c8jblF8Z
         8B6h9/TbtwSv8T07ZMyJTrbQmjjMgbNhPj5xCBaY4A8+cSc+e6dwVVNYUfKu7yRvPzy+
         N4gQ==
X-Forwarded-Encrypted: i=1; AKwUvBwet0ue6ZFuISwb9DdY5aFpHfMFtWh2lQkMciFs3A8Jhb4zDlYeWAxoNRnyPwJZkku/y5wji85qO0DVmnbniNk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8imPgAddKm3Uk0IHddKjtvaWc8J+Y1IDgf/QT40OAG31ep33cu
	vAf/03KLwXEYlXbDMINPeF1Y7SUA9Dlh0snFGri6PhmVbYGutv2/cvmvvkG6W4B7zw/1q7+jbHv
	H1TOrztxZhh6p5x+aqS5H3ryO0dIBGSE2kaaSXNak+pGUM+eQzvDJ152K8dlCJRsjakUXrLA=
X-Gm-Gg: AYBFou2PZBIJUa1ZuOfjFP6OQGlw7LbNGVlqxvTO+HwDfsi5hwcdqWrpXdygxraqTa2
	bLLIJFBT05viL/Uo2b5wcIH8T66nBSOHtSLX0GurGTx8ocgcgJ4o1jLqw5FAJCM2Kw4yUvHGzbn
	bmQ8Kork5ko2y07z16tvPeRcv45iuKYByq82UigdToPqkFmCdDd7o9HktY+cur/fbElIV4djZvm
	B9ArZrS+KBLKs5huU2+89XoPEd6mzenTysz/3lW/6ltzYXiYgB5nyShwnDJVU5JhtSKBGfv/M/R
	WT4IYwZL6ddZJw0Sxq2lBwQGolvLhKHs/IhyrxvAKRsDpYVG0E2vRxKcQ4W/Jo8A3bGOrPKoBoe
	u5vHk7ryCIeK6Om2aU8vDL4O5VSvxigoxNHCaDtbkBl/lVDbK8+MaZ51R2KpjKe6tCP5Wsq/Ez0
	5ld08+fzZQ7YFA5bhn4gY5KpcI3Fe4WsAOrhMeLYmlnSCO3GO85wLgmH6a9BDtjygj/YRVZcCsE
	g==
X-Received: by 2002:a05:7301:6190:20b0:36a:1089:9836 with SMTP id 5a478bee46e88-36f75839295mr5734768eec.15.1794019225381;
        Fri, 06 Nov 2026 18:40:25 -0800 (PST)
X-Received: by 2002:a05:7301:6190:20b0:36a:1089:9836 with SMTP id 5a478bee46e88-36f75839295mr5734715eec.15.1794019224581;
        Fri, 06 Nov 2026 18:40:24 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faac86a96sm11069040eec.29.2026.11.06.18.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:40:24 -0800 (PST)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alex@ghiti.fr>, Jesse Taube <jtaubepe@redhat.com>,
        Oleg Nesterov <oleg@redhat.com>, Kees Cook <kees@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        James Clark <james.clark@linaro.org>, Shuah Khan <shuah@kernel.org>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v8 7/8] riscv: Add software supported single stepping with mc/mc6 triggers
Date: Sat,  7 Nov 2026 08:09:16 +0530
Message-ID: <20261107023917.40606-8-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107023917.40606-1-himanshu.chauhan@oss.qualcomm.com>
References: <20261107023917.40606-1-himanshu.chauhan@oss.qualcomm.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Y51xDXadgJ6nSdOGyzlhLVcVJdtSGloX
X-Authority-Analysis: v=2.4 cv=DOAacCNb c=1 sm=1 tr=0 ts=6aee8f9a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=m8l0dXrX7-G3mt2yGekA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDAxMCBTYWx0ZWRfX2QX2rrwTg8dC
 /3HiU2QYBedxA7+8p3tW0n2nvgktZysTta8CPt7qvWzLySTiFKGmFXTpKWoXgB2Pv9F3zfg/37f
 KqNhCChdqcpTGaE0n9VNti0ZGqnt6vI=
X-Proofpoint-ORIG-GUID: Y51xDXadgJ6nSdOGyzlhLVcVJdtSGloX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDAxMCBTYWx0ZWRfXywgNOnJD1vCz
 r+SMUfR89Qc/kmW8aSdTYAtMW0tCAJ7td5LYSJ8CWTigkAFYP6d3DzEpX/q2x4a0Du9dMT4i9BO
 hH9recdkz27BePj7lyj7aBVFYo20+UHQ+W6YdlaQGbY20tMpzQdLj8DFr3d+nKbaaedNNF8u098
 29bM0+WupvwkKX+WdDWr/7ZaXRJye0FpOc5jLjMzbzRpaZ9YPSkig3/51UlAOqQY67FqbLsMnRx
 /ensQvhRnhmo0tWzfe4GXflyV0cBD+I4KdB6/dkk7DC/7xqISh4NIzt24/s4TeJqYF64Ojc0tjp
 PjCVRJtAa/WG00uJHJ1nlb40XZTRb4hnwNjX5mDnSXUEPyX20zR6YtxjJw9tUhyb3Itd1130K34
 AALrb3nIPswOGp67z/0BFu28Wmw7sRkrPU3AmevZ5IQ8aOpB3V6BHhMqxTa9anWC13+jKvC+4md
 1LaIoDchhnFHh9iDYTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-07_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611070010

With mc/mc6 triggers, after handling breakpoint at current pc, there
is no way to tell trigger to skip same breakpoint after the handler
returns. This can cause loop of breakpoints at the same address until
the trigger is disabled or uninstalled. Debugger may keep the breakpoints
enabled and if kernel disables it, there is a loss of state coherency.

To avoid the loop, software disables the current breakpoint, finds the
next instruction that would be executed after pc and puts a breakpoint
at that address. When this breakpoint hits, old breakpoint is reinstalled.

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 arch/riscv/include/asm/hw_breakpoint.h |  16 ++
 arch/riscv/kernel/hw_breakpoint.c      | 297 ++++++++++++++++++++++++-
 2 files changed, 308 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/hw_breakpoint.h b/arch/riscv/include/asm/hw_breakpoint.h
index 6e8913d69df2..b3ccebb5185e 100644
--- a/arch/riscv/include/asm/hw_breakpoint.h
+++ b/arch/riscv/include/asm/hw_breakpoint.h
@@ -15,10 +15,26 @@ struct task_struct;
 /* Maximum number of hardware breakpoints supported */
 #define RISCV_MAX_BP		16
 
+enum riscv_hw_bp_step_method {
+	RISCV_HW_BP_STEP_DISABLED,
+	RISCV_HW_BP_STEP_ICOUNT,
+	RISCV_HW_BP_STEP_SW,
+};
+
 struct arch_hw_breakpoint {
 	unsigned long address;
 	unsigned long len;
 	unsigned int type;
+
+	/*
+	 * Single-step callback state.  While step_method is enabled, the
+	 * hardware slot is temporarily programmed as either an icount trigger
+	 * or an execute trigger at next_addr, and the original trigger config
+	 * is restored when that temporary trigger fires.
+	 */
+	unsigned long next_addr;
+	enum riscv_hw_bp_step_method step_method;
+	bool pending_perf_event;
 	unsigned int match;
 	unsigned int chain;
 	unsigned int select;
diff --git a/arch/riscv/kernel/hw_breakpoint.c b/arch/riscv/kernel/hw_breakpoint.c
index 4231170d4901..72be50943937 100644
--- a/arch/riscv/kernel/hw_breakpoint.c
+++ b/arch/riscv/kernel/hw_breakpoint.c
@@ -15,6 +15,7 @@
 #include <linux/cpu.h>
 #include <linux/cpuhotplug.h>
 
+#include <asm/insn.h>
 #include <asm/sbi.h>
 
 #define RISCV_HW_BP_NUM_MAX	32
@@ -62,6 +63,9 @@ enum {
 #define RISCV_DBTR_MC6_HIT1		BIT(25)
 #define RISCV_DBTR_MC6_HIT_MASK	(RISCV_DBTR_MC6_HIT | RISCV_DBTR_MC6_HIT1)
 
+#define RISCV_DBTR_ICOUNT_U		BIT(6)
+#define RISCV_DBTR_ICOUNT_COUNT_MASK	GENMASK(23, 10)
+
 #define RISCV_DBTR_MC6_HIT_FALSE	0
 #define RISCV_DBTR_MC6_HIT_BEFORE	1
 #define RISCV_DBTR_MC6_HIT_AFTER	2
@@ -77,6 +81,7 @@ static union sbi_dbtr_shmem_entry __percpu *sbi_dbtr_shmem;
 /* number of debug triggers on this cpu . */
 static int dbtr_total_num __ro_after_init;
 static int dbtr_type __ro_after_init;
+static bool dbtr_icount_available __ro_after_init;
 static unsigned long dbtr_init __ro_after_init;
 
 #define MEM_HI(_m)		\
@@ -194,6 +199,17 @@ static void init_sbi_dbtr(void)
 		return;
 	}
 
+	tdata1 = dbtr_tdata1_type(RISCV_DBTR_TRIG_ICOUNT);
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
+			tdata1, 0, 0, 0, 0, 0);
+	if (ret.error) {
+		pr_warn("Failed to detect icount triggers\n");
+	} else if (ret.value) {
+		dbtr_icount_available = 1;
+		pr_warn("Icount trigger available.\n");
+	}
+
 	tdata1 = dbtr_tdata1_type(RISCV_DBTR_TRIG_MCONTROL6);
 
 	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
@@ -397,6 +413,9 @@ int hw_breakpoint_arch_parse(struct perf_event *bp,
 	hw->tdata1 = 0;
 	hw->tdata2 = attr->bp_addr;
 	hw->tdata3 = 0x0;
+	hw->next_addr = 0x0;
+	hw->step_method = RISCV_HW_BP_STEP_DISABLED;
+	hw->pending_perf_event = false;
 
 	switch (dbtr_type) {
 	case RISCV_DBTR_TRIG_MCONTROL:
@@ -414,6 +433,168 @@ int hw_breakpoint_arch_parse(struct perf_event *bp,
 	return ret;
 }
 
+static ulong get_step_address(struct pt_regs *regs, ulong insn)
+{
+	return get_next_insn_address(regs, insn, regs->epc);
+}
+
+static int dbtr_update_event_tdata(struct perf_event *event,
+				   unsigned long tdata1,
+				   unsigned long tdata2,
+				   unsigned long tdata3, bool wait);
+
+static bool hw_breakpoint_event_active(struct perf_event *event)
+{
+	return READ_ONCE(event->state) == PERF_EVENT_STATE_ACTIVE;
+}
+
+static void clear_singlestep_state(struct arch_hw_breakpoint *bp)
+{
+	bp->step_method = RISCV_HW_BP_STEP_DISABLED;
+	bp->next_addr = 0;
+	bp->pending_perf_event = false;
+}
+
+static void disable_unhandled_singlestep(struct perf_event *event,
+					 struct pt_regs *regs, bool deliver_event,
+					 int err)
+{
+	struct arch_hw_breakpoint *bp = counter_arch_bp(event);
+
+	/*
+	 * If the temporary step trigger cannot be installed or restored, leave
+	 * the CPU with no active trigger instead of re-entering the same debug
+	 * exception forever.
+	 */
+	pr_warn("single-step setup failed for bp_addr=0x%lx epc=0x%lx: %d; disabling event\n",
+		bp->address, regs->epc, err);
+	clear_singlestep_state(bp);
+	if (deliver_event && hw_breakpoint_event_active(event))
+		perf_bp_event(event, regs);
+	if (hw_breakpoint_event_active(event))
+		perf_event_disable_inatomic(event);
+}
+
+static unsigned long icount_step_tdata1(void)
+{
+	return dbtr_tdata1_type(RISCV_DBTR_TRIG_ICOUNT) |
+	       FIELD_PREP(RISCV_DBTR_ICOUNT_COUNT_MASK, 1) |
+	       RISCV_DBTR_ICOUNT_U;
+}
+
+static int restore_original_breakpoint(struct perf_event *event)
+{
+	struct arch_hw_breakpoint *bp = counter_arch_bp(event);
+	int ret;
+
+	/*
+	 * Rebuild the original trigger from the perf attributes instead of
+	 * keeping a second copy of the trigger data.  Do not update the
+	 * temporary trigger in place when changing back from icount/software-step
+	 * mode: uninstall/install gives the original breakpoint a fresh hardware
+	 * slot and clears any transient hit state.
+	 */
+	arch_uninstall_hw_breakpoint(event);
+
+	ret = hw_breakpoint_arch_parse(NULL, &event->attr, bp);
+	if (ret)
+		return ret;
+
+	return arch_install_hw_breakpoint(event);
+}
+
+/*
+ * setup_singlestep - Set the breakpoint to next instruction after current breakpoint.
+ */
+static int setup_singlestep(struct perf_event *event, struct pt_regs *regs)
+{
+	struct arch_hw_breakpoint *bp = counter_arch_bp(event);
+	unsigned long insn, next_addr = 0;
+	int ret;
+	struct arch_hw_breakpoint tmp = {};
+
+	clear_singlestep_state(bp);
+
+	if (dbtr_icount_available && !arch_check_bp_in_kernelspace(bp)) {
+		/*
+		 * User breakpoints can use an icount trigger to retire exactly
+		 * one instruction.  The sdtrig icount path reports EPC after the
+		 * counted instruction, so the callback sees the post-step PC
+		 * without decoding the original instruction here.
+		 */
+		tmp.tdata1 = icount_step_tdata1();
+
+		ret = dbtr_update_event_tdata(event, tmp.tdata1, 0, 0, false);
+		if (ret)
+			return ret;
+
+		bp->step_method = RISCV_HW_BP_STEP_ICOUNT;
+		bp->next_addr = 0;
+		return 0;
+	}
+
+	if (!event->hw.target) {
+		/*
+		 * A CPU-wide software-step trigger follows one task's decoded
+		 * next PC.  If that task migrates, the per-CPU slot may wait
+		 * forever for an address the CPU will not execute.
+		 */
+		return -EOPNOTSUPP;
+	}
+
+	ret = get_insn_safe(regs, regs->epc, &insn);
+	if (ret < 0)
+		return ret;
+
+	next_addr = get_step_address(regs, insn);
+	if (next_addr == regs->epc) {
+		/*
+		 * Some control transfers, notably SRET, cannot be represented
+		 * as an execute breakpoint at a different decoded PC.  Refuse
+		 * the software step rather than programming the same address
+		 * and looping on the original breakpoint.
+		 */
+		return -EOPNOTSUPP;
+	}
+
+	/*
+	 * Software path: update the trigger in-place to an execute
+	 * breakpoint at next_addr.  Build the tdata directly without
+	 * calling hw_breakpoint_arch_parse() so that bp->len and bp->address
+	 * remain valid for the handler's matching logic after restore.
+	 */
+	tmp.tdata2 = next_addr;
+	tmp.tdata3 = 0;
+	switch (dbtr_type) {
+	case RISCV_DBTR_TRIG_MCONTROL6:
+		tmp.tdata1 = dbtr_tdata1_type(RISCV_DBTR_TRIG_MCONTROL6) |
+			     RISCV_DBTR_MC6_EXEC;
+		if (user_mode(regs))
+			tmp.tdata1 |= RISCV_DBTR_MC6_U;
+		else
+			tmp.tdata1 |= RISCV_DBTR_MC6_S;
+		break;
+	case RISCV_DBTR_TRIG_MCONTROL:
+		tmp.tdata1 = dbtr_tdata1_type(RISCV_DBTR_TRIG_MCONTROL) |
+			     RISCV_DBTR_MC_EXEC;
+		if (user_mode(regs))
+			tmp.tdata1 |= RISCV_DBTR_MC_U;
+		else
+			tmp.tdata1 |= RISCV_DBTR_MC_S;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	ret = dbtr_update_event_tdata(event, tmp.tdata1, next_addr, 0, false);
+	if (ret)
+		return ret;
+
+	bp->step_method = RISCV_HW_BP_STEP_SW;
+	bp->next_addr = next_addr;
+	return 0;
+}
+
 static void dbtr_encode_update(union sbi_dbtr_shmem_entry *shmem,
 			       unsigned long idx, unsigned long tdata1,
 			       unsigned long tdata2, unsigned long tdata3)
@@ -574,12 +755,43 @@ static unsigned int mc6_read_and_clear_hit(int idx)
 	return hit;
 }
 
+static int handle_triggered_breakpoint(struct perf_event *event,
+				       struct pt_regs *regs)
+{
+	struct arch_hw_breakpoint *bp = counter_arch_bp(event);
+	bool defer_perf;
+	int ret;
+
+	/*
+	 * Report user breakpoints after the temporary step trigger advances
+	 * past the armed instruction.  Otherwise signal delivery can re-enter
+	 * the same execute trigger before the PC has moved.
+	 */
+	defer_perf = !arch_check_bp_in_kernelspace(bp);
+	if (!defer_perf) {
+		perf_bp_event(event, regs);
+		if (!hw_breakpoint_event_active(event))
+			return NOTIFY_STOP;
+	}
+
+	ret = setup_singlestep(event, regs);
+	if (ret < 0) {
+		disable_unhandled_singlestep(event, regs, defer_perf, ret);
+		return NOTIFY_STOP;
+	}
+
+	bp->pending_perf_event = defer_perf;
+	return NOTIFY_STOP;
+}
+
 /*
  * HW Breakpoint/watchpoint handler
  */
 static int hw_breakpoint_handler(struct die_args *args)
 {
-	int i, bp_ret = NOTIFY_DONE;
+	int i, ret = 0, bp_ret = NOTIFY_DONE;
+	struct perf_event *deferred_step_event = NULL;
+	struct arch_hw_breakpoint *deferred_step_bp = NULL;
 	struct arch_hw_breakpoint *bp;
 	struct perf_event *event;
 
@@ -590,6 +802,74 @@ static int hw_breakpoint_handler(struct die_args *args)
 
 		bp = counter_arch_bp(event);
 
+		if (bp->step_method != RISCV_HW_BP_STEP_DISABLED) {
+			bool pending_perf_event;
+
+			/*
+			 * This trap is for the temporary trigger installed by
+			 * setup_singlestep().  Software stepping must match the
+			 * decoded next_addr; icount already reports the post-step
+			 * PC and can restore the original trigger immediately.
+			 */
+			if (bp->step_method == RISCV_HW_BP_STEP_SW &&
+			    args->regs->epc != bp->next_addr) {
+				/*
+				 * A nested breakpoint can fire before this
+				 * event reaches its decoded next_addr, for
+				 * example when perf delivers a signal handler
+				 * with its own breakpoint.  Let the later slot
+				 * handle that trap and keep this temporary step
+				 * armed.  If nobody handles the trap, restore
+				 * below so a real divergence does not lose the
+				 * original breakpoint indefinitely.
+				 */
+				deferred_step_event = event;
+				deferred_step_bp = bp;
+				continue;
+			}
+
+			if (bp->step_method == RISCV_HW_BP_STEP_ICOUNT &&
+			    args->regs->epc == bp->address) {
+				unsigned long tdata1 = icount_step_tdata1();
+
+				/*
+				 * A trap can be observed before the original
+				 * user instruction retires, leaving EPC on the
+				 * armed breakpoint.  Delivering the deferred
+				 * perf event here would account the same
+				 * breakpoint twice, so rearm icount and wait for
+				 * a callback with a post-instruction EPC.
+				 */
+				ret = dbtr_update_event_tdata(event, tdata1, 0, 0, false);
+				if (ret) {
+					disable_unhandled_singlestep(event,
+								     args->regs,
+								     bp->pending_perf_event,
+								     ret);
+					bp_ret = NOTIFY_STOP;
+					goto exit;
+				}
+				bp_ret = NOTIFY_STOP;
+				goto exit;
+			}
+
+			pending_perf_event = bp->pending_perf_event;
+
+			ret = restore_original_breakpoint(event);
+			if (ret) {
+				clear_singlestep_state(bp);
+				perf_event_disable_inatomic(event);
+				bp_ret = NOTIFY_STOP;
+				goto exit;
+			}
+
+			clear_singlestep_state(bp);
+			if (pending_perf_event && hw_breakpoint_event_active(event))
+				perf_bp_event(event, args->regs);
+			bp_ret = NOTIFY_STOP;
+			goto exit;
+		}
+
 		switch (event->attr.bp_type) {
 		/* Breakpoint */
 		case HW_BREAKPOINT_X:
@@ -603,8 +883,7 @@ static int hw_breakpoint_handler(struct die_args *args)
 					       RISCV_DBTR_MC6_HIT_FALSE;
 
 				if (hit) {
-					perf_bp_event(event, args->regs);
-					bp_ret = NOTIFY_STOP;
+					bp_ret = handle_triggered_breakpoint(event, args->regs);
 					goto exit;
 				}
 			}
@@ -640,8 +919,7 @@ static int hw_breakpoint_handler(struct die_args *args)
 				hit |= ranges_overlap(bp_start, bp_len, stval,
 						      sizeof(long));
 				if (hit) {
-					perf_bp_event(event, args->regs);
-					bp_ret = NOTIFY_STOP;
+					bp_ret = handle_triggered_breakpoint(event, args->regs);
 					goto exit;
 				}
 			}
@@ -653,6 +931,15 @@ static int hw_breakpoint_handler(struct die_args *args)
 		}
 	}
 
+	if (deferred_step_event) {
+		bp = deferred_step_bp;
+		ret = restore_original_breakpoint(deferred_step_event);
+		if (ret)
+			perf_event_disable_inatomic(deferred_step_event);
+		clear_singlestep_state(bp);
+		bp_ret = NOTIFY_STOP;
+	}
+
 exit:
 	return bp_ret;
 }
-- 
2.43.0

