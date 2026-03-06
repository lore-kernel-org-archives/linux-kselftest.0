Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317383AE71C
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 14:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772805829; cv=none; b=Si49ZbpN4AhB3VHIz48hUm6Ru5RAIxkHSjXDYANWIPVI65XcCj4qIJ+AMQx+d1SP5/lEbjysrbVT5MHg3KO5Ud+BFSWZ+pyvqGA28nqpStnIJOp3FFm5qEaUTsNWvMjAb9dHp9Y02NAC6oHapSbJWWm/RfM6KiTm3PhZzA2SFYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772805829; c=relaxed/simple;
	bh=KKJoiskobJLPVewH28+LF9Y4Ux/Lu7qzp3YYxz5tn6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ou3ZO09dF1whw6lONdC2SM8aMvdNtfsR/KyW+XB3524xQRv6IcIE7DEICPWBwXro1HbttnofY2R/hktQF7nM01+RdALorRy5LjXF3mlACqc9ri5zMGfb4kz9n1VRDD3oh4aO9GLEiBidLAW6Phd6a3khwzyrF4Kk4x0euOA1NcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PbF7Tgs1; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PbF7Tgs1"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ae3a2f6007so47609375ad.2
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Mar 2026 06:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772805827; x=1773410627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=URwHQdDNBcfpjPgIZZmBOCF4w8QPrTIvO91J8esIlCE=;
        b=PbF7Tgs1GsJhphtrzQmJ9VgOEYENG6F5coDb+YjBmaO6uvDXGuUN377rU5siiEPkFv
         Z1Hh4pTEkt9f/VjASa0EnZs9nd6eYg0+Z6aNPa16M6pUofUbWmNP1h2Zi9BIoKa7vyoC
         XPLPRVjQ1vQ9ieCCJzzMwxyAYnBU7htydacT1cM0OQAMHixVpd+2DhEVf9cXo1wgRZ6r
         VN8pSOD/d0OLmveOmJnOt05HJgY4DUnCAGXUypJ7pb2ebtA/KSTrZL0KjfZ/EjNyce0E
         mfDKU+IVo0wp4lbA7mm3MKqsFmj+odTPNuv13gZXyQk1gvE9zkA8SM/VpQbeXwP6gh/8
         xUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805827; x=1773410627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=URwHQdDNBcfpjPgIZZmBOCF4w8QPrTIvO91J8esIlCE=;
        b=uD5rxX1JyIG8hHEHpjFsui0UC8+V2ZZUkivOWRTi9B3mVx09HATHJQFHZys3pRkX5I
         7+M8o5K/bL8YZajwq697xR79DD7A0y7Vwg62FrWbEUZTIGprswm0ylebMM2pUpWFY1JF
         SyLAGQ9YY1a1FRg8mPQCZsn5yyEPLMbJpi1ISRonHlBPn/bvNVfKilUGiuCU1SSUSp1j
         /eNgVvcgNEG/oLYtDeJDNti9P0nHq/5ah/CcIdRFFXGifnxOuOvz4J1n8ffSYwteKR/j
         I4diq/w9a0mA5AADlYKNijAPZKzthOHru/xNxgETiEwywOoyk+F3+Fx22EBSBtHJPs+x
         ZjLg==
X-Forwarded-Encrypted: i=1; AJvYcCX+T9+h8WQdz4Gx2xCLUil+apTDwb4OxXK3hyYG20Q8wLWM7Q6ERsvOkMT+lcRZvuqsTk6dQ+Jpw5Wq9yfMp6Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4cjCQNkxsuDMky8U4j0WwVF/e+14IW06OlwfwOGkmdHY4HYBF
	ji11Zoaf6V/AEDNrnaBx3aPZ2UodaolI9DMdmQjdudVPttOl9+OvznqS
X-Gm-Gg: ATEYQzyvwsvYyePswr26UQk814WBUOaOhCI35tpnBy4EYx/QEGAtb6c+uk9tNnPuNzh
	IOSZ+1Qexxrw7PvArPzzXFx8tE/5p6EGY/hLo8c5ncW5Co0ecQv+GWtYn+NwcVRZN99/93bd4fd
	f3wa6NHKGl5VO621xySKb0l+GX7Ov2SIKpe6uTz3ZCClj/kr0yJhwU7ehvp6QPf/A4MLQQlSLeu
	vcm9b1HCOHv9YAT1c167XAYkv5hvMibuY7qhuP6eXXT915h1GFMOLf9QA5gZccL3Rj4iGGfK0jY
	spk8tQ94OiGe1pPLEVtB36Kl5IBiN+c7g2HSZPPW7EWGff62ckZCLrhYIpC13nvXqPN/OgBbWhB
	A8UDRdVliI1SpFdmLNeT24VxB7oCvoT/eQNYp/0fWxARsiYvNnykI9ELwUy48G6vZ80g0G8w/LH
	o3Dmw0Z8AfdhQs4Tzf5QOySo3f59IoQzl77PgUHtPOxqx/bH5OGwVxfqcX9RU1jLlARMSp8xe9T
	YXoli0wft8Juw==
X-Received: by 2002:a17:902:db09:b0:2ae:5723:afa9 with SMTP id d9443c01a7336-2ae8253c933mr27839485ad.53.1772805827270;
        Fri, 06 Mar 2026 06:03:47 -0800 (PST)
Received: from mi-HP-ProDesk-680-G6-PCI-Microtower-PC.mioffice.cn ([43.224.245.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840ccb6csm29134715ad.92.2026.03.06.06.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:03:46 -0800 (PST)
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
Subject: [PATCH 5/5] sched_ext: Document scx_bypass_depth migration path
Date: Fri,  6 Mar 2026 22:03:25 +0800
Message-ID: <20260306140325.2710927-6-suzhidao@xiaomi.com>
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

scx_bypass_depth is a global counter that will be moved into
struct scx_sched when multi-scheduler support lands. Add a comment
explaining why READ_ONCE/WRITE_ONCE are used despite bypass_lock
serialization: modifications are serialized by the lock, but the
value can be observed locklessly from softirq context (e.g., in
scx_bypass_lb_timerfn()).

Signed-off-by: Su Zhidao <suzhidao@xiaomi.com>
---
 kernel/sched/ext.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index c269e489902c..b1e5a95682c1 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -33,6 +33,12 @@ static DEFINE_MUTEX(scx_enable_mutex);
 DEFINE_STATIC_KEY_FALSE(__scx_enabled);
 DEFINE_STATIC_PERCPU_RWSEM(scx_fork_rwsem);
 static atomic_t scx_enable_state_var = ATOMIC_INIT(SCX_DISABLED);
+/*
+ * Counts the number of active bypass requests. Protected by bypass_lock
+ * inside scx_bypass(), but read locklessly (e.g., from
+ * scx_bypass_lb_timerfn() in softirq context) using READ_ONCE(). Will
+ * be moved into struct scx_sched when multi-scheduler support lands.
+ */
 static int scx_bypass_depth;
 static cpumask_var_t scx_bypass_lb_donee_cpumask;
 static cpumask_var_t scx_bypass_lb_resched_cpumask;
-- 
2.43.0

