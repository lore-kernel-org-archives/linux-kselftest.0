Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DE7392C5B
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 12:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772801355; cv=none; b=manNF1A9RHXz/Asbw0olaNDAlfBOwyZG+8y9Mih+Y+3xT1mvgSpngKq1d310FZh3BD5oAJxZb8CFkLSvA515en2Z/d4joC7E1gkJcHBO3W03f8x17+pb0ah6J2U6qe5yvbkh3aTVWNlL8uHW1U2c1tzp0BQArTlilkr1Wziwxco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772801355; c=relaxed/simple;
	bh=ELlzxJVqqauBzRnx2M/V3kWxTpAmlO4Sa9vwg7vpvVA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OlU6/OHbMqP0ifxdAXJuWg/eCnEHlII8nKj4y2KStzPKVHoUyNCcKj7100eZkN4yd2Cy8qnFUeCFHn0NMqCZZZlr1XkGWKjqwV1CxoZIgMr8KaoHf/8AP63CzuyvaArceuAeAz7qtFOT9VonDZWu4yu4SUxRlBBaakAwcLHGdhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X3NInGnG; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3NInGnG"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so103406685ad.2
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Mar 2026 04:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772801354; x=1773406154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lEmGv2FLRFuslu4qBQwLsjeV3m7Edv0VCgYCAY8R+hU=;
        b=X3NInGnGBZGlMzLXzQwevqrjiBLgOI2tcEB5ky00lp4BOe/vNaDm+CjJdumTRBj+kS
         S+x6UEK6qj0LqlKoc2H9ZbjBHztH1DeCi+3fA5/7L/7Ht7fwlf9hUCT8aLWZDWnQn7/n
         LKfeFYvNIRH7iRQFrgvT9kk1zu3nsHBdws8qua18V6bcIz1dTaj1SmxZR5D4Ocfky74d
         1N6bQ/bxezFbMQZRgEldU2QF0PlhlM9yuU9QM6w5ktRcRrO1xNavhEehE/npdWrSu1eF
         MaNrj7U1NeieKgLLQWecoPG1HF8sufjV+HFJDepqDvkBCwlFFbTH6hsK8hYA5AYPEMFN
         qgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772801354; x=1773406154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lEmGv2FLRFuslu4qBQwLsjeV3m7Edv0VCgYCAY8R+hU=;
        b=OYkQo1NchFryaArOFJDRPPPk2g5HYyZ+lmc+6ZJJe3MvluvaLyYqkmulAVkSygnb+6
         Ryt7AHQVdMGLgAgMTqbvr/Xy7g9AHIyjMO0nzdmWJ3q7uXmxOPYd/K6XQT6gugIb//xJ
         FJueFpXvarWZu2RgyWbU0Fga6Xqud+/LA1lf9wtX4Txz8xA77EOgrjA75sBjsPxoYFNo
         dpeRrauEe0jJgYJWhWr6nKBm41ZN3+vkh6tV7SJQMJGY3yu/0m3c8EAsqWIAUaehd+f3
         xy5hsGGEZYFfluWF6QfpYZ4Mbxrv9lQGFPASvrPu3YSUNeHYSPIS0tq9OBgHhkNBS1Yr
         aMAg==
X-Forwarded-Encrypted: i=1; AJvYcCWD39FsGgkRxNCoxdxcGpfrRDVUaUW63DvUbV2kzx/uppUec/D67/bSJX9b4rc7yeCJCxb7PxDLV01UfCoUsbs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIu8nZfSOrttAyZxpg1e7mo71138Pu/V/AP4A+n2LwZw92hjDC
	qHQ1vNSigXoT9iOBM5lbWw/JnU2+LnBaB8xxqDkDBJqIDoXiK8HZOnck
X-Gm-Gg: ATEYQzwHFtAYg6/EB9zKAaBwNFarGkFS6k/EhhSLv+w0L/d7Gd71tUlo7bhWt+Tc9hg
	Ny+ZHgZPGm1EOWI5NSoDfVqP25BPE36xwPwk48FyRNlEymep/gdlCMgFPd7qD5H921inC4JCpJY
	plsR5iSFJJYqS7hKo2YnoYEBAXFcHTGSmdXj44YWmwDIGjYkhBFC3OJbJ41MG1+O65kBL64qazk
	O01pNeQRd6CacIFQazKZyGE+BfCCbAT2eRFdLhk3iYLayp84KefLFHjYwZbFum7dzoKV6S0V5k3
	kbt8yQktjmc65266vZRiAFC4jL8lEBrYTaTpqLlEnB+Wb00B886PNSBqPbYzANhdvwkg/d20dtg
	/6YkxoWS6XjAi/r/XbJYSXB2ZuSV+zGG7VVTAgvj90CWOFj6Au7i3L1tPXR28uqKb/lsD1h0AYE
	5OrcEfLDB/vQupcgf15q/F6K9YcY+4JULICNO2pWzQy7ap/Fh7MsMK6ulKslxoHogp3/9IlAQgp
	fI=
X-Received: by 2002:a17:902:dac7:b0:2ae:47c9:68b9 with SMTP id d9443c01a7336-2ae8247fa09mr22519595ad.49.1772801354232;
        Fri, 06 Mar 2026 04:49:14 -0800 (PST)
Received: from mi-HP-ProDesk-680-G6-PCI-Microtower-PC.mioffice.cn ([43.224.245.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e78f77sm27712845ad.21.2026.03.06.04.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 04:49:13 -0800 (PST)
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
Date: Fri,  6 Mar 2026 20:48:59 +0800
Message-ID: <20260306124901.2653465-3-suzhidao@xiaomi.com>
X-Mailer: git-send-email 2.43.0
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

