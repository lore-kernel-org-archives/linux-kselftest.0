Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E063A9DAB
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 14:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772805818; cv=none; b=QqcLDMrD/32uTp+SuRVJPnnoPeQbckSsFj7v8Bu34uHPc5bKRRW0QB+4ea0rwn57VXzFG7myYJr50TeSFLTU8BVEs9lybdbeqQAQWAcC3ZcEWlSyTn1+uBAD+9tRW8BZeAQsGXGTaJdjqlxi0uDhbWh4leXB9dZa74FODbrxU2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772805818; c=relaxed/simple;
	bh=z3V40F0kGIL8yvCLdRRK98TbuZQ8stHEY3dTCT0ogJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lntCmWrP7BWC10+ORIQ65aM4I1bFzEbU/uQjzhDDxh8Wx/Umbsy7n4c1XKalJ4fZBpomXnc98lvVOBxLd+94JSQ6HAUr35DKF97XP//KNm5RCZb+cF6po5y34SZer/wem0YJO5fb1TmeV5IcXdyvoe+CznKY4c4/C1w/UbtWYDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bcly7hUo; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bcly7hUo"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ad9a9be502so61102965ad.0
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Mar 2026 06:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772805816; x=1773410616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ZzuQXuKro+GXBxmmjg8yJdwWTDQZtX+cD1VaFXmUG0=;
        b=bcly7hUoYrirOiTEqLwYt88e8ehbRB0ys+3G9lqslxQO5+H5I5PJmWnSJVdkqSlL9N
         OIqAlqJPGAAeyFOoU3Rq5D9UkaRtQYRRFWO4q2DygReJcwkZ+jisueNcQ3UDD1XxR7TZ
         OBR/DGxMvt0H7Pmn601W6YcmZMmGF7Gy8zeXiTFIf0qFKovo6a4vIeZ/U06CBU6ZUrKO
         DH5Hil97XxHzAyouPvBgmcfGoqjrBB3w8rEhOhwufM/cMBztmhHwoOdpOXEhef9heufx
         v/7aGBUtmgQNt7VT4OcV+15GYIdMDRoZAevSIQGRRB5NmUXV8DFteeXU0LYZwg6yNXYP
         1+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805816; x=1773410616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/ZzuQXuKro+GXBxmmjg8yJdwWTDQZtX+cD1VaFXmUG0=;
        b=MjlZSq2o392+mX2rRLEyzdiAtqn1+Mj+AbeSc8u4f4LoI01GYh4tTDCRRMm+V6xRQM
         t37PRAsYR20VTZFlGaPLGe6KCVeuX7HCVSkkoNRfa+Ol/qnD4d8yG8Mmw5zJ1S4TN1kO
         Cfc0SoAr5v5GoLLw0jcVSEI+r5sFPGGklfqu7X2RZc+O5drqm60mKxP90k8Hmm6nu8oI
         K9WQGqhfW3SO6VJXOopWI5pCfyxiMevC966L6R8AgzaiVITIx+sCFX8yU0cGmgMUMmwJ
         Oe3Zi88XOqompJcHdOzNY5HX97kBOw+FxkGjoSrNg9D6c6dEcXxn5YwkAiqaTSYT4VF9
         QUBA==
X-Forwarded-Encrypted: i=1; AJvYcCVdh5FTCxmxZwGwHYsnCUGz0eZopodO/vvzxHq2SwRBs5Lsypo9QxpzFZccLSitfrbuNJRg6g4YnbZc9DuuVcI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqTvTThy6kOkG0U6YUje7qxCqUDx/mAKhkvm+Xayh/DfqvVQz1
	imvpSOAB4sUysMnb8HtCifYDGqy4FDNE23EKwJmcPNhxk7eDB2BL6tX4
X-Gm-Gg: ATEYQzzSftTYL/UR99XavNZ2n/ppJW5o/ngi5I8OS34IDG72bQuwOVThY5gMS5mG7r+
	gtYkoK1Xc+Djbz4/8UI9Cgmi8nNlvyk6qIhGVb14n0PqWeWdRgcQIQ5W1BA6rwhcJokgm26LOul
	fhrkpHLgunCNkhZ+yppzICqfjJUMUo9RyXPDrSLBIa6jGJuxWH+t44WaONw5SOGQ0K7HPDFjhXJ
	ReKp5Vuf23AIQZCT64r6iG7QBKfS0mhmc826czs6ChgVquvBb7NGnJlsn9OB9t+2BFfCTfSvDxt
	aKZ625+D+4q8/nfm2swtFq/OZo9cp/vTbSvTNszuOs9RDaopn5C/XH7XAeOuVmTeVYz5kwjcjrq
	mDNW/MtX+XkuEqvV8Nlyigvb37qjryxJh/JeNCF0Wl6E8E2r9YdDs3L6+h0+xqLh/T2AtPyarxy
	Aae7kPzcKdwR7+86wsBX6yCZ2mYB974CkEOJAaxJdajQMCculFJXRhI0/vZEHfn6xZ0MQMOy/GP
	7c=
X-Received: by 2002:a17:902:ef0a:b0:2ae:4fc7:8053 with SMTP id d9443c01a7336-2ae82481982mr29214585ad.46.1772805814651;
        Fri, 06 Mar 2026 06:03:34 -0800 (PST)
Received: from mi-HP-ProDesk-680-G6-PCI-Microtower-PC.mioffice.cn ([43.224.245.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840ccb6csm29134715ad.92.2026.03.06.06.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:03:34 -0800 (PST)
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
Date: Fri,  6 Mar 2026 22:03:21 +0800
Message-ID: <20260306140325.2710927-2-suzhidao@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306140325.2710927-1-suzhidao@xiaomi.com>
References: <20260306140325.2710927-1-suzhidao@xiaomi.com>
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

