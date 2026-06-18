Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5635632E757
	for <linux-kselftest@vger.kernel.org>; Thu, 18 Jun 2026 03:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781752318; cv=none; b=Dunha3tkeq/f7LexjjUCWtwzEKoJEZnd2Bh9Cola1XI4My0PpLeX9QQpUxotCl7oCnpby0YXbYEEJtySKxNHcYGw/WFKIBgrxaaU2WLO1jdFM7Lf4dT6H5uQa69cTExSvkguwgGIed1AnOmqTduHQE3porkz/ETkHhRTyBItDmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781752318; c=relaxed/simple;
	bh=su/86e8IzEx6KCsYE6y2QU0JcZeTp1olU2GBvdI7t20=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LX7YuAEjnD6DpEyXyxdQo2qH4REMxs9+b5PA+mEktxcbzKhoJykdFBHGluJp8PfhhSb7sbWKjG/bag6+ys4wo76f0j0Tc9hheEYwV9nvBkBgnW9UIuYZAUXtx37WrDgXzQOpV1ICd4noVZmILx8mQ2/jzZ2sPFLcopKh2DosM7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lE0c4K8i; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lE0c4K8i"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c40397e746so2964245ad.3
        for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 20:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781752317; x=1782357117; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1y36uZa5QHApqDykuJpc+gggPAc0ysbP66IjBiya9ds=;
        b=lE0c4K8itEg+Udz8swnAs0DMm9NEQS93H7SjpXkhcvWUEwJnhnU/xR48vyy0XhXk2N
         MdJOogr7iXhhOwXLm0xDH0XwHqsrCgzUwchmzmjqkqHXNPy+xwSPGJLrLXbULNlz0Otx
         egOr0btUqP8K22O1JJkbUWEFsozL3Zi3FpSjZYnZzFKg9kR/vr4OBKDeODwa9Vsqd4Vd
         xIEgBQ/ocu1aXvcqqRmg2ztmLlc26PqWk/qIZzukj3Lw4HSDQI0GAsm2hUmGKOAAdEUE
         T7JbVmotbagk9OmX2uQG0MVyO6sU2GwTb0lW0oSkG174onZS+pxv2BuUMA9jvA9xwk26
         XjwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781752317; x=1782357117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1y36uZa5QHApqDykuJpc+gggPAc0ysbP66IjBiya9ds=;
        b=no0Omb9SKWqggPeGSmCsoQ04/3tho9YMGBrOlbBnaMo0V+mrYHdG5wPzGMt6DeAgA3
         W9lckVRya8nAx6MqhAjX7cU9kEqBgqYr0a2pxoxvTWNlUapmrG60bczY6yBoB8/XYo8w
         Hz7/SPwXkSXT9AvcNYuy3FaRWGsaRiOpJJqEyyTZjhBTd+WB26oNIrpitu6AXbtocTl7
         WaiRof9jildZYZ3cqas19NfxZWM65TY/xD/X3vOuEJXwlaEWxQogCuTrBXQZ0ZCtMx4t
         E/xKCp4WAUvVsNESlY2DNSq+UyLbUaZfVCTAuExF4ActJPUnFoJzA3EEK9KZ+M8pdUU2
         Blgg==
X-Forwarded-Encrypted: i=1; AFNElJ8rc/D8r+ZVokp5f5z0mxI3mrZQ/Isaw8ttn60AZMz3S4iHklqi6CKH371KlF5hVF365HfQW9wTh6SxnGICzzs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmPzxXo656hN5+SBSnL+5SrEFaL/NXYiS1h9wGNBvyz31ioBYM
	vYkQUwI21QA6FDO6KVpATQYw3ykQ8tIP2icUTfn+NVaqc2mSrUpYQnHv
X-Gm-Gg: AfdE7cnVatAXlPIhg2p25z5RCk6RRi1nfBzKdIgntg3vrHfjzCsCiwNmjjteJUjxvNC
	CYWXBdeH4I8lhOfD9MlLb37iOeGs5Pnfm5hJMpRJE6VZ+x6H5UjjWCdJj1LUmpIRYou6RJ3snmZ
	U9af3jRjYcPEdkP+QMlxUWtm34FEkm/TpoSgL9Vi0Nd7Y2T5D6GRnvuE/dGrOIJfx9jiwoNPXaG
	aiGXmALjphtZyYzfO6iBnYpef22UMdkdqsMfxG+94MrUXB4jKJjxyd0gjEl83pbyO5WZvzZwI4P
	bjk3nJHzbO58CGlGtKOs2+tZMymIo6bxkLlOOq3jhm/K/Q6TjxjBadGXCEM+MZYPzvle0FqURyk
	XmBs8t/MQZ+/562u915VaeUVm5M1n/WxMy/Eg8LeumGsgearFMxZnngbB6ZW70F2lMpqriWYwxo
	V5tdmjQWp2gXI=
X-Received: by 2002:a17:903:240e:b0:2c0:a360:45da with SMTP id d9443c01a7336-2c6f34744e6mr5011065ad.32.1781752316749;
        Wed, 17 Jun 2026 20:11:56 -0700 (PDT)
Received: from [127.0.1.1] ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6a403b242sm60152975ad.31.2026.06.17.20.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 20:11:56 -0700 (PDT)
From: Jing Wu <realwujing@gmail.com>
Date: Thu, 18 Jun 2026 11:11:16 +0800
Subject: [PATCH v3 05/13] cpu/hotplug: Reserve CPUHP states for nohz_full
 and managed IRQ down-paths
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-wujing-dhm-v3-5-28f1a4d83b68@gmail.com>
References: <20260618-wujing-dhm-v3-0-28f1a4d83b68@gmail.com>
In-Reply-To: <20260618-wujing-dhm-v3-0-28f1a4d83b68@gmail.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
 Joel Fernandes <joelagnelf@nvidia.com>, 
 Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun@kernel.org>, 
 Uladzislau Rezki <urezki@gmail.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, Tejun Heo <tj@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: linux-kernel@vger.kernel.org, rcu@vger.kernel.org, 
 cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jing Wu <realwujing@gmail.com>, 
 Qiliang Yuan <yuanql9@chinatelecom.cn>
X-Mailer: b4 0.13.0

Add CPUHP_AP_NO_HZ_FULL_DYING and CPUHP_AP_IRQ_AFFINITY_DYING to the
cpuhp_state enum.  These dying callbacks are invoked during CPU offline
before the tick is stopped, enabling clean tick handover and managed
IRQ migration when a CPU transitions between isolated and housekeeping
states.

The existing CPUHP_AP_IRQ_AFFINITY_ONLINE already handles managed IRQ
restoration on CPU online.  The new dying callback completes the pair,
migrating managed interrupts away from the CPU before it goes down.

Subsequent patches register handlers for these states.

Signed-off-by: Jing Wu <realwujing@gmail.com>
Signed-off-by: Qiliang Yuan <yuanql9@chinatelecom.cn>
---
 include/linux/cpuhotplug.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index 22ba327ec2278..075cfa8161334 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -186,6 +186,8 @@ enum cpuhp_state {
 	CPUHP_AP_SMPCFD_DYING,
 	CPUHP_AP_HRTIMERS_DYING,
 	CPUHP_AP_TICK_DYING,
+	CPUHP_AP_IRQ_AFFINITY_DYING,
+	CPUHP_AP_NO_HZ_FULL_DYING,
 	CPUHP_AP_X86_TBOOT_DYING,
 	CPUHP_AP_ARM_CACHE_B15_RAC_DYING,
 	CPUHP_AP_ONLINE,

-- 
2.43.0

