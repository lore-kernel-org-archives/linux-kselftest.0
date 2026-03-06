Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77083AE19C
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 14:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772805823; cv=none; b=oEvfJ1fKBRoxvuYOjii8uxAwdhydR+Bp1MrhYTYIOKGIyu3hQjAF2Qp07K0xm6SgtHITT19JLV1ertUf9gY3ftwpFktx/JNkPhiUVq6Rw5nTVlebwkf/H+95s00zUx+wAOOJdjc32zmPUOy8Ysd/6iql7Dl0vs1DhizebtRE9EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772805823; c=relaxed/simple;
	bh=ELlzxJVqqauBzRnx2M/V3kWxTpAmlO4Sa9vwg7vpvVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rwGMMBCFbs7p1O/o15mKF/xKoldH5LQ6H6kGXh8r4DC5J9oyqc7cr0uFJPJzGddTMPQwZrJ83v/Maxk3yQKBCrmKBlkcnZnhkzjBWyayiXIw5mivCzreVZHzUiexALRVGvezE6GQILXTt2QEvvd0goG+aQmSXQmKA/JjXw/JibQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJ3ZT/i9; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJ3ZT/i9"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ae4d48dc2fso26241185ad.3
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Mar 2026 06:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772805821; x=1773410621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lEmGv2FLRFuslu4qBQwLsjeV3m7Edv0VCgYCAY8R+hU=;
        b=iJ3ZT/i9pT5F+PL/lUqgCmJRyC7ErME0o8I+Ll/35cu1pjYYAe9qKaZNTUA2yGqoNe
         mjsGXB3YdGYRHwlgUIvrNxe2bbUY+Lm59Ft1j3uN7WuntEyCOsDGKaob4mvFFAd+5uZ4
         1cJhqhWr8vIjASvLOcLyZT8/DOjiT3vc4SUHsAnsGQ49Da7bQI8yHG+Oe1EmSfsBYtI7
         zKLX+rAbRJ7LvSrQWcsIYqAab48bYf7355ZK8R/DjUthaci+TYhqAu2NT7seRVJdc/yD
         5wceVOlymYEnoiINxwH9sL6wcB/fpIl7B2oeHZSh0iROCPqlGX2MvZNr33AMoY7733Z1
         bGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805821; x=1773410621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lEmGv2FLRFuslu4qBQwLsjeV3m7Edv0VCgYCAY8R+hU=;
        b=SDhB4WiEc1fmx/jxYZLs0hfam3mlMObGu9ZSjjKDwcZM11wbU3ABAR499VvmSK8Pc5
         NqOaasdUuexlKz6nlOvhNqvgfEF8PKlZJht7+13TTVMLZaDmKik0ogmACzFx1D37mGln
         oEdv1k13m4jasvcd819SCcMbQkkr/wVE53NDENNbJsU/VSIMQ6c9hNGRaHhDzq9x/7fP
         3BIXWgNqfcShDInsWQxqtFB7nXryNSL63WngE5lJTw/lwz4A66aBv46VJEARTZCf4XSs
         XYCRpSqCfpKnmwsQfKAbSSb/0Wq34UxQwP5IrBbVWu5EBPzQ4FtvngZoeEaZ1CWyRuOB
         rqUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUESXCtkkwbBkr4Ro2aTdCzA34GhSF37oyZqzxsQvkZS12mPuKCPHYDubCQK/CzFLMtmotjp2YobD2xseK4++k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzS9UDZTx5lBOjPymJfdjjokNwU7p/NJWiHRi1ARz0bKXChRUZ2
	NRtckLxqVOenqxOQ3cexn+Q59KmytQw1dfXl1gMqnGG49u4oTPLDH4lt
X-Gm-Gg: ATEYQzyXpRs5zvQtVENQoXCgRJDYm4targobhuHCEblQlD++RazDBCBeeO1va0EfMDC
	tqsAtjIarVI43BAYXQcaKSfbEGaz4f8T3zoEGqiP+J8+UtlaKzmwioQpYV3gNMajQwlkiEO8mod
	O4OzqQ/TLhpApYBTGDR7fGMRB/UEJxa9ITKiiM/f+2rQn8frsBlRHTmTPeBpjU50773fO3qQlH4
	KN7uPaMFdxxGoy0WwTygKxcaiI5Zrhp8j+s/hWND0ar6EPuDXY30andGkXdH1EJus3gxJO+OHD8
	5DdsYv+482VFPbU+WziUyRzXZI4pu6h7DwsMzfYqP+SS1UspW7AMBFuENY5h37qAOk8FYngzhXc
	A2N51UrHJ13XUeGEOZNvEAptPTMNtkjOxNzFI+Xhy8zoaBdv3r6/cFUcHqo4dEabhyKyyCd0ypV
	Y++aSxvAaMfKPGYR3Ei/Cveb2BJE9WQbO/xBtxxAlyG3f8hYLqzcDsemeH+AQ5DzUEjOqp3OiAQ
	o0Bed436gOsTQ==
X-Received: by 2002:a17:902:c94a:b0:2ae:41d1:344b with SMTP id d9443c01a7336-2ae82418016mr27067745ad.6.1772805821034;
        Fri, 06 Mar 2026 06:03:41 -0800 (PST)
Received: from mi-HP-ProDesk-680-G6-PCI-Microtower-PC.mioffice.cn ([43.224.245.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840ccb6csm29134715ad.92.2026.03.06.06.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:03:40 -0800 (PST)
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
Subject: [PATCH 3/5] sched_ext: Use rcu_dereference_bh() in scx_bypass_lb_timerfn()
Date: Fri,  6 Mar 2026 22:03:23 +0800
Message-ID: <20260306140325.2710927-4-suzhidao@xiaomi.com>
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

scx_bypass_lb_timerfn() runs in softirq (BH) context, so
rcu_dereference_bh() is the correct RCU accessor. The previous
rcu_dereference_all() suppresses all sparse warnings and masks
potential RCU context issues.

Add a comment noting this is a transitional state: when
multi-scheduler support lands, the bypass LB timer will become
per-scheduler and the global scx_root reference will be removed.

Signed-off-by: Su Zhidao <suzhidao@xiaomi.com>
---
 kernel/sched/ext.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 053d99c58802..c269e489902c 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -4170,7 +4170,13 @@ static void scx_bypass_lb_timerfn(struct timer_list *timer)
 	int node;
 	u32 intv_us;
 
-	sch = rcu_dereference_all(scx_root);
+	/*
+	 * scx_bypass_lb_timer is a global timer that fires in softirq
+	 * context while bypass mode is active. Use rcu_dereference_bh()
+	 * matching the BH context. When multi-scheduler support lands,
+	 * this timer will become per-scheduler instance.
+	 */
+	sch = rcu_dereference_bh(scx_root);
 	if (unlikely(!sch) || !READ_ONCE(scx_bypass_depth))
 		return;
 
-- 
2.43.0

