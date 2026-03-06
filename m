Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D773B392C29
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 12:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772801350; cv=none; b=Vfx9U7gGPwYGQnbtwLPsojVaUuYdRihReR8BD2CYAOwD2OT/d2tkt43heuAxFv1IPcAxONxN4r6yuXxjplJ6psTF7DfR7vuyXW+Wh2V/p269mIGqg4EHxZpkh1cE9ptG4QwRLg7Woc44CMwaJBL/gqW1IPjHOIEpc7cxKHlRMtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772801350; c=relaxed/simple;
	bh=z3V40F0kGIL8yvCLdRRK98TbuZQ8stHEY3dTCT0ogJk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=etieGg6AVQjYBCs5Wgxfn1JZQJgcDgA9nPxKepT4ge1oBdYBrZmD1A54yLjb7JTUaTDc0bAQondcgmGyA10UkQ9D5crDRJ1dgMTcEbJNevInQXP1iTHMH5sRGmFuaE8ynEBKFwWL8To2I4T3t4TA2DaCajEOxJLA7LunwZn9JqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXi02n9E; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXi02n9E"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c7388fb61adso906295a12.3
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Mar 2026 04:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772801348; x=1773406148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZzuQXuKro+GXBxmmjg8yJdwWTDQZtX+cD1VaFXmUG0=;
        b=BXi02n9EhVBKK5fr3VS0l0SFncZsALwQFs0/GcHW34hzpeXB8dqNSp1toVXfL813yU
         CfgTaFqnD1MdfuFg/bM1j4uO4K1yflDIoPRNYe0K/Jd+vY2mDTITEiZ98LG9cQW9+iAf
         K2meBgAcvvCjYleRuuBf3L6hBEDNbZV5HZ+Wi2KkZSD60piYHWRh2dxAP348+LXx5MyZ
         gYhjOcWsJGy2Fl5Z5NfBuYSnQ5NCFdKuLUFAS9y3kfNpuAzECKAizqlzWvZIueNAJou8
         zWRuV6wrgqqKQi6o6rT1YcGPIIunrBvhE4/KSrRCCcrs5LP4RejqYUgaYHGNf3Vwa6jd
         tXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772801348; x=1773406148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ZzuQXuKro+GXBxmmjg8yJdwWTDQZtX+cD1VaFXmUG0=;
        b=nS2abHVMls5rFkbHD3X6L26AqCrjHO685o8ynTh6LaE23RfqDU3kBOREvOm4gdpcav
         /1Xr13Cy6ijmv9EejXzodrKy2JGjaoIH2YCCtQRLr0PF1y5ElHCmONaepjEFMNP83myy
         NLArN+qBEbGWFNnq7fmS8bBjHZmUowc04FkyS0fG6wvW9KZwPKQ4N6odSDaKqJpv/Ihl
         aVuxYWqDfGnEsRX7Nxy7e/ZWDACE/seOQwMyQN618MuqNlq4D9ql1MclmxrCD6ECHZ09
         YBkQjBVpbchIbWBJ/0rOlhPF4L58L5MbSpMNZPKzo/+Af9YzN/rT7/2feNh4lF8YpSaw
         xJ7A==
X-Forwarded-Encrypted: i=1; AJvYcCVg244h2t3HdAD2NoA/Omxtz91FxjyIUCTPO0+CDRaheX1dHwgH9ApeaqTNHvXURsZMZYTgy+NoA4vb+/fMijo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXcu/Cqj1X40Lqnp8oXF9r+FQ4rHUqJqiPTHfiCW7Pis0f3196
	H7hP8mYMAxkTWabFrZQSpa53h3cdHAeq6HX26/8sXlX9BPGBZ07Avm1t
X-Gm-Gg: ATEYQzxCFN5uQ16rtz2eeDfkLttGpwof5B6dUV3K8gPis84ox4nh73diJvhIUrluQmS
	aCxmLY1QaX6PHamYx8aSkzQ9cqwS4Az+Wrwdm+Ll3O+q8hGRwet3ujgEqVl+M0Si1N5KP7KTpak
	+GE0suft+I151KRwCNU6Sycfxlj820r0WmgXsWUcuaubkFlxviMEQexELvgx19vCTXdH6FfKqwA
	YaE9f8Fyb3o+hn2KVoCQMTO3VZBZz8dHrW3e9GtIRa6WRyESdGoD75sFCU3YAPHT9Rl5ZkYDedO
	HD00SPA0f3Fh6Z56lbHG8ZxYtEgciMwkNAycOGPRxagaNMZj4dL46gn9b0FV/E/ymld6cq3S2Ao
	fshRPgCgvVg3z/DHSrBm9iI61wdx4jsB7Lq7RZNmNN/HuIDVYXOqb8/qzqK8/K8YuxUInPSeKV6
	grO00NrRGtiVOZfq95d08asyuWwewA0pY0umqZ6TomSdpUA4CPLuk5Qp6GDa2+ppKlkfL6SDvcE
	FE=
X-Received: by 2002:a17:903:2f8a:b0:2ae:57cc:63d7 with SMTP id d9443c01a7336-2ae823ff86amr24082965ad.7.1772801348105;
        Fri, 06 Mar 2026 04:49:08 -0800 (PST)
Received: from mi-HP-ProDesk-680-G6-PCI-Microtower-PC.mioffice.cn ([43.224.245.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e78f77sm27712845ad.21.2026.03.06.04.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 04:49:07 -0800 (PST)
From: zhidao su <soolaugust@gmail.com>
X-Google-Original-From: zhidao su <suzhidao@xiaomi.com>
To: tj@kernel.org,
	sched-ext@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com,
	linux-kselftest@vger.kernel.org,
	Su Zhidao <suzhidao@xiaomi.com>
Subject: [PATCH 1/5] sched_ext: Remove deprecated SCX_OPS_HAS_CGROUP_WEIGHT flag
Date: Fri,  6 Mar 2026 20:48:57 +0800
Message-ID: <20260306124901.2653465-1-suzhidao@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Su Zhidao <suzhidao@xiaomi.com>

SCX_OPS_HAS_CGROUP_WEIGHT was deprecated in 6.15 with a comment
'will be removed on 6.18'. Now that we are at 6.18, remove it.

The flag was a no-op and only triggered a pr_warn() on use. Remove
the flag definition, the warning, and update scx_flatcg which was
the last in-tree user.

Signed-off-by: Su Zhidao <suzhidao@xiaomi.com>
---
 kernel/sched/ext.c                              | 3 ---
 kernel/sched/ext_internal.h                     | 8 +-------
 tools/sched_ext/include/scx/enum_defs.autogen.h | 1 -
 tools/sched_ext/scx_flatcg.bpf.c                | 2 +-
 4 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index c4ccd685259f..56ff5874af94 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -5061,9 +5061,6 @@ static int validate_ops(struct scx_sched *sch, const struct sched_ext_ops *ops)
 		return -EINVAL;
 	}
 
-	if (ops->flags & SCX_OPS_HAS_CGROUP_WEIGHT)
-		pr_warn("SCX_OPS_HAS_CGROUP_WEIGHT is deprecated and a noop\n");
-
 	if (ops->cpu_acquire || ops->cpu_release)
 		pr_warn("ops->cpu_acquire/release() are deprecated, use sched_switch TP instead\n");
 
diff --git a/kernel/sched/ext_internal.h b/kernel/sched/ext_internal.h
index bd26811fea99..3c86c53e1975 100644
--- a/kernel/sched/ext_internal.h
+++ b/kernel/sched/ext_internal.h
@@ -174,19 +174,13 @@ enum scx_ops_flags {
 	 */
 	SCX_OPS_BUILTIN_IDLE_PER_NODE	= 1LLU << 6,
 
-	/*
-	 * CPU cgroup support flags
-	 */
-	SCX_OPS_HAS_CGROUP_WEIGHT	= 1LLU << 16,	/* DEPRECATED, will be removed on 6.18 */
-
 	SCX_OPS_ALL_FLAGS		= SCX_OPS_KEEP_BUILTIN_IDLE |
 					  SCX_OPS_ENQ_LAST |
 					  SCX_OPS_ENQ_EXITING |
 					  SCX_OPS_ENQ_MIGRATION_DISABLED |
 					  SCX_OPS_ALLOW_QUEUED_WAKEUP |
 					  SCX_OPS_SWITCH_PARTIAL |
-					  SCX_OPS_BUILTIN_IDLE_PER_NODE |
-					  SCX_OPS_HAS_CGROUP_WEIGHT,
+					  SCX_OPS_BUILTIN_IDLE_PER_NODE,
 
 	/* high 8 bits are internal, don't include in SCX_OPS_ALL_FLAGS */
 	__SCX_OPS_INTERNAL_MASK		= 0xffLLU << 56,
diff --git a/tools/sched_ext/include/scx/enum_defs.autogen.h b/tools/sched_ext/include/scx/enum_defs.autogen.h
index dcc945304760..80c885f781ba 100644
--- a/tools/sched_ext/include/scx/enum_defs.autogen.h
+++ b/tools/sched_ext/include/scx/enum_defs.autogen.h
@@ -91,7 +91,6 @@
 #define HAVE_SCX_OPS_SWITCH_PARTIAL
 #define HAVE_SCX_OPS_ENQ_MIGRATION_DISABLED
 #define HAVE_SCX_OPS_ALLOW_QUEUED_WAKEUP
-#define HAVE_SCX_OPS_HAS_CGROUP_WEIGHT
 #define HAVE_SCX_OPS_ALL_FLAGS
 #define HAVE_SCX_OPSS_NONE
 #define HAVE_SCX_OPSS_QUEUEING
diff --git a/tools/sched_ext/scx_flatcg.bpf.c b/tools/sched_ext/scx_flatcg.bpf.c
index 0e785cff0f24..a8a9234bb41e 100644
--- a/tools/sched_ext/scx_flatcg.bpf.c
+++ b/tools/sched_ext/scx_flatcg.bpf.c
@@ -960,5 +960,5 @@ SCX_OPS_DEFINE(flatcg_ops,
 	       .cgroup_move		= (void *)fcg_cgroup_move,
 	       .init			= (void *)fcg_init,
 	       .exit			= (void *)fcg_exit,
-	       .flags			= SCX_OPS_HAS_CGROUP_WEIGHT | SCX_OPS_ENQ_EXITING,
+	       .flags			= SCX_OPS_ENQ_EXITING,
 	       .name			= "flatcg");
-- 
2.43.0

