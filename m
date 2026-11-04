Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811441;
	b=0yRBP7dTrI0BGLqQpyr5PCz/OIt40hDT5BV8Zx5371klp73gfbmB8E7DkJMK9YmIFfMD
	 CmC37+Z9fdiOCMtHgT16JgtEVGr5fRQvEd4Ft93rZqlOK72OY1ZR7IxTfltil+0ctMjx0
	 bBjkrzvvezcEicpebifY+9s3uOdz2n6haJ86bn3fcHifaAb5eZwUjtX8IUAOX5HaE6HfY
	 BsnQjKldd+vQbOj0ecPcCRFceOd/pN6xd6QUBKCiL2+orEet+dC8ZNOCu+X7cDEmVv4hE
	 ZIK4/fTxRpUIhNJsI2sFf6owxCL0eX3tkr5PTiqW5FNb0BdMskbbGMaFb2fgFxRpQSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T7J8ny2XgS4VVLgay75kRvU9FcVv7Jejhnbg0Ab9f3s=;
	b=aMWl+v37NxmWpKgFJvpvIe+JTBvNDnjlVIACemGOkPJWZnTBI4wV6yNLFzCsyjA68zDi
	 h+SBPm6EdhS2Xnp8M8sdJNQh7OWQBGyMiHHXTzgVPmYk/D//bILbyP+CRBG5mIaFd7LYO
	 8xsY/x93n5CMCx2IKcGsuRv9OLNRs6Kf0yUT8/3FNH+whYmViqy58pC/OrNwdaxEBqOsx
	 esJwZd1bsUoHA+siWI6EGlXQa+3V5aI+ZKxbDJkyR/xcu9mPeCljau/dK66q2sWA3GpE3
	 2qyfELsN9ljLZcNW0oa9KCUT8KP60PvJ+7jkAUI6P44VvW+trAaHvPWt+GzKhJ3AlWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s2vGqyXw;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52458606D81B
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 16:57:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52458606D81B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s2vGqyXw
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15ea896ddc8so1615339c88.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 08:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811439; x=1794416239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T7J8ny2XgS4VVLgay75kRvU9FcVv7Jejhnbg0Ab9f3s=;
        b=s2vGqyXwPr8s8Gwnu+VGfdfhZQeEInJKusCv7m1LoH8gsWmASFBvbyNMs9FBKJlW4O
         w/PVKNUu/g2ucDcu6JfiST2Wof2Fl94gdHZ4+ToBlnIzT/4AIJVZdBXNtfPGgAsBSqgL
         1/H7gD79joZjeV2l7BTgbhHhmsrcUArqUyxofoaxNIRNKZ6pXyvjQoIzVqbOhoi8nuhZ
         fkgYG+m4CXSEayHsN/tPLXn4fNqtbBO24dqtc4eImBmZZc46UFPcDPz6pSP8397LHEzs
         VPar8yqhNIXgw10k7ke3w5+ezHaZBRs6WLV+x1r+x1dxeu/U2t3tk2qW6oum4qlCYTQ4
         cs9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811439; x=1794416239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T7J8ny2XgS4VVLgay75kRvU9FcVv7Jejhnbg0Ab9f3s=;
        b=1v6/wjuRL14yOW0UDQadmBvTrjd8igVqqOFv355+A/zahL4X6HZ6LqMzMClhIBwBUv
         56BpG9R3VbkonQs5poDtyObUxJjetaK52F70WDBNAzK2zrE0Euxu8GmBnW0FDQOlRWxW
         Vohulg06qjEFAHbD6K1UI+MXATFzUHgXcMcPpj4ub2ZG537q40IA3W1UqFSjkDAAUCcr
         jiwCndfcmy1WEFR6Wwv+mT3yzCJDXlIlYOHnrVVbXsi4/MNfswEzriLoVKxoanow8byC
         ZMBSMjZLLrzlFj6cHfExgQ0vTg5npN+CU1lVzmUeHn5JMacxHConmJ/ikLv2PwOCeMMl
         RQ2w==
X-Forwarded-Encrypted: i=1; AKwUvBzRhQ55a8dkgzhblVQXTifpX8Om1rs0j4Wx5tZIB6Gyro2BDj2ljvZPvJ4jbYbPi5pRZDYZZ+QWBvrp/Pf1TOI=@vger.kernel.org
X-Gm-Message-State: APuU4Z89oKcoFk2jV0YcDum6LH0gvbOeHSD/vFqj5UjH4ZlgnrR6uazL
	sWQLpMTx1JkTGSazsKggfVAIOqn9OUn1MNvaPpx+8tjfJhTcRu4Z3P+9
X-Gm-Gg: AYBFou1IEmIQUG5qW06zEarLxbWmFuyt+JehqIa7AJxhxfnqSDNT8hJ61xDOhjVhA0j
	+d1rs4vqrnXgSIdHHlzctnf3fYHVU9044y88rKDpUjsStTKkrcspGviokFBnnREXxTFrd1OwbHE
	qHJz9X1S1gC97psHccO8zbywXC0830r5N1c+2DlvLz9z2cBzUuBYS7gmRtzP0t+eHGOuO//YPnO
	AIZh9wzR2w4kYBwgAHVBPMjhL7Cnk3J6Gq7WGkDaICYyJ1j23ghqRsvN+/Q8aywT+c5r+1BPXRq
	oqaDEl4OYT77WfpCQ/sHS49SFkNqWzCJrL3hvYzMExe8LfEYkocL3rSyKeE77m80FtGFNGXgPI5
	41xSb81Fp0xGWgbOEsTFRi7NWxudd5VU0kDIgISs6s8ODFRqPp4qg7GQzjo+oWeI5X4BgCjrp4E
	C3sQm1HbYEFqPGV08LSHrB23mwtcm9/P8Y000sO8ABdYnk8o4fi5KwLgfigf/mkLJZiyeyGQTA0
	TvyXCXNwzakb9oKASgvAW2/Va7FS/MPvVMhNRtH6+YNVK7KOqmmceAPJSkzw8tSzYxYp2pZvh2S
	VcrUm/w4CdeCYh8o+fSrt7UOuZab8w9SGeT4tgA=
X-Received: by 2002:a05:7022:eb42:20b0:190:3950:43e2 with SMTP id a92af1059eb24-1ac5a0b8867mr24847940c88.8.1793811439033;
        Wed, 04 Nov 2026 08:57:19 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:57:18 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	boqun@kernel.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 13/28] hazptr: Add waiter-enqueue tracepoint
Date: Thu,  5 Nov 2026 00:54:31 +0800
Message-ID: <20261104165504.2430480-14-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104165504.2430480-1-kunwu.chan@gmail.com>
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
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

Production tracepoint fired when hazptr_synchronize() enqueues a
waiter onto the scan kthread's pending list.  Downstream users
include hazptrtorture's staged hot-address scenario, which uses
it to confirm enqueue before running its controls.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 include/trace/events/hazptr.h | 29 +++++++++++++++++++++++++++++
 kernel/hazptr.c               |  5 +++++
 2 files changed, 34 insertions(+)
 create mode 100644 include/trace/events/hazptr.h

diff --git a/include/trace/events/hazptr.h b/include/trace/events/hazptr.h
new file mode 100644
index 000000000000..1eed4c9fd682
--- /dev/null
+++ b/include/trace/events/hazptr.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM hazptr
+
+#if !defined(_TRACE_HAZPTR_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_HAZPTR_H
+
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(hazptr_waiter_enqueue,
+
+	TP_PROTO(void *addr),
+
+	TP_ARGS(addr),
+
+	TP_STRUCT__entry(
+		__field(void *, addr)
+	),
+
+	TP_fast_assign(
+		__entry->addr = addr;
+	),
+
+	TP_printk("addr=%p", __entry->addr)
+);
+
+#endif /* _TRACE_HAZPTR_H */
+
+#include <trace/define_trace.h>
diff --git a/kernel/hazptr.c b/kernel/hazptr.c
index 4784df78be4e..16f6e2acaf87 100644
--- a/kernel/hazptr.c
+++ b/kernel/hazptr.c
@@ -19,6 +19,10 @@
 #include <linux/bitops.h>
 #include <linux/bitmap.h>
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/hazptr.h>
+EXPORT_TRACEPOINT_SYMBOL_GPL(hazptr_waiter_enqueue);
+
 #define HAZPTR_WILDCARD	((void *) 1UL)
 
 static DEFINE_MUTEX(hazptr_phase_lock);	/* Protect the list phase flip. */
@@ -411,6 +415,7 @@ static void hazptr_synchronize_queued(void *addr)
 
 	mutex_lock(&hazptr_scan.lock);
 	list_add_tail(&waiter.node, &hazptr_scan.pending);
+	trace_hazptr_waiter_enqueue(addr);
 	if (!READ_ONCE(hazptr_scan.wakeup)) {
 		WRITE_ONCE(hazptr_scan.wakeup, true);
 		swake_up_one(&hazptr_scan.wq);
-- 
2.43.0

