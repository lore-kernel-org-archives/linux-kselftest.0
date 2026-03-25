Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA5B345CD3
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 09:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774429807; cv=none; b=OgIdodq0J5eyociUh0ctc8xitD3vWQ0olJZgZRiHJrb56pKnEsLuFgrH7VHrimeKP7+vAqxxSWbaGpOG11o7aqvYnbSN2kNuTsONzHIWqWDniLcQZbFHd8C3Ny2VzVTqXOiX3u5ggVDDXice9crJq8LRnrx97LUTl7Jr3nHdeso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774429807; c=relaxed/simple;
	bh=5lK/iDCMs0xrzM+ncf/IEMsxq+MhQJcZU0X4KxOHObw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OPL1Mm6bHKzxhuHFzXKzEuBVK9w1wlHPra9OskEKps90L3BBPHH8glzdh99aK1V0Ffg45Id4Bpw8YLuqLunJCpbmQ6qd/yQamOFO8HEAZDDy6MlVi94WLUxnKq5G8zEPt1RD0QxCfD2gNLz+QnPYrVRDhxtK4dAqpb3sGg049Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g6Swl65T; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g6Swl65T"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2c160cb021cso526884eec.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 02:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774429805; x=1775034605; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/9UY5bvoYUVv1VU3Mf2W4jpyCEGASZWHJe/emL8ca0U=;
        b=g6Swl65TrrEi8QLBU0+yEfUclapKYiRyR1WalOd36wKQMfxV629zbChQtKVNHgXyAZ
         HgHVtblM+KXjIeZ/dqW55g4jWrUM1mlB7CFvi6StdlhvgiMFDsqBPVRWGb1I7cKFeVW4
         9YgFGWpBaL9KIBp+Fcvhi2IR7MVBAwS465L1KpgRfFURcNYOrYMwTwq54K+atK+1o4vW
         mW8QBGxL4s89uRItZFJsyIZAj07ulul/7CTewGO9ui1FMP9IyCVB5KTsJB3f79Htwhf0
         8wWDvySeaj3WR7qKWQdyTzjwUn27H/cMUjAy+rmPdRylQm4j++Z+c9UWXxnOSKBQUcCH
         6FMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774429805; x=1775034605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/9UY5bvoYUVv1VU3Mf2W4jpyCEGASZWHJe/emL8ca0U=;
        b=aVh7lb5RhFXzcVGiPdgShwJGB3xtUJZWqeRQ2oxvqso9qZZbosVx4QlkQZyjGgNR0h
         7051b4CPgSgpjzvL4cGpFVPPOGp77XAAgOgBm7Y4/bI9Pv9cEtKrs6XF3DyPiHphGJki
         0vaJYSQQq8t7R2jPYo08XvpuYv6uXrcRS6tFp8FE/OwC026PxYPdbvgAB3f+JUCZKZCj
         D04IAGXgKvTm13Tj9eW+75XGvZ1b40Xb2zAuxK6yaszBgevutHwosoOmga7oY1pVXUlH
         +UtEFMdJXRJCa0R7A3d64la2eD7jNZ6K94/pw7OWm4/bRvKRz0VReC/Kotmfzj/Yj2y4
         UKrA==
X-Forwarded-Encrypted: i=1; AJvYcCVm5VAEXgo+hSky08SOy3tX+uBLiNFeEBCrFKorKZojWrEf8tJejELu/CgxbE1OwAtv4QcnoH+1F95d1KI0n0g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLzX6S0HHzLZNqmiwEPYp8Kd93q7CleKVeXBAg2rOkuM/171ez
	rK1V8anaiiP8yQzwEOcfRDAvgHO/zP7ZcQ6rM72lXitX5QHYyTlUIrbn
X-Gm-Gg: ATEYQzxqzxhzTJlbkYIgczcDN5+1eCyOE2i5ZvVxieMevRqW95pZsC3nJSZnLs9U7uP
	juhYvNW12+HqtCgm8BaDryja1a9e5/BQdLF4e81JQOrWDjHZkSH9qJdj3+kyUMf2ysRBwfEFuVs
	VmLXTNcR3pU7XlwN0zDvXZnZ4wvChhXN9lo5HDr0sAHzqKiF2lTbRMoWEow883OSGxjSlG4Co1S
	LIUDi/Tu4lv8f2Ro/TEalh2yEmWH5fR7bIXzkEwQ/e/HykOujBWHp4vWUAYKSvV+uyfm3yPo58+
	uIN302bcyCd01Rzp+SkJdGJQ55kPAMFdF5TBCjEZHVkBabFg9Z5bsGTQ88tzQioMuz+sGkEdZ3T
	nyc+R/yh4sLRIauHP8FVzXIzJmdZJC29Ikur+3J/tyj4Fra9F7ifmDk7vJEbxEsAPzEfua/+r2X
	bGSFO27fqFPnjZjGRn
X-Received: by 2002:a05:7301:5781:b0:2be:1779:3289 with SMTP id 5a478bee46e88-2c15d4cf79fmr1292448eec.35.1774429805106;
        Wed, 25 Mar 2026 02:10:05 -0700 (PDT)
Received: from wujing. ([74.48.213.230])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c159e25dc7sm2786389eec.27.2026.03.25.02.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 02:10:04 -0700 (PDT)
From: Qiliang Yuan <realwujing@gmail.com>
Date: Wed, 25 Mar 2026 17:09:34 +0800
Subject: [PATCH 03/15] sched/isolation: Separate housekeeping types in enum
 hk_type
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-dhei-v12-final-v1-3-919cca23cadf@gmail.com>
References: <20260325-dhei-v12-final-v1-0-919cca23cadf@gmail.com>
In-Reply-To: <20260325-dhei-v12-final-v1-0-919cca23cadf@gmail.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 Thomas Gleixner <tglx@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
 Joel Fernandes <joelagnelf@nvidia.com>, 
 Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Uladzislau Rezki <urezki@gmail.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
 Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Brendan Jackman <jackmanb@google.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Ingo Molnar <mingo@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, rcu@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <realwujing@gmail.com>
X-Mailer: b4 0.13.0

Most kernel noise types (TICK, TIMER, RCU, etc.) are currently
aliased to a single HK_TYPE_KERNEL_NOISE enum value. This prevents
fine-grained runtime isolation control as all masks are forced to be
identical.

Un-alias service-specific housekeeping types in enum hk_type.

This separation provides the necessary granularity for DHEI subsystems
to subscribe to and maintain independent affinity masks.

Signed-off-by: Qiliang Yuan <realwujing@gmail.com>
---
 include/linux/sched/isolation.h | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/include/linux/sched/isolation.h b/include/linux/sched/isolation.h
index 9df55237d3901..6ec64eb3f8bcb 100644
--- a/include/linux/sched/isolation.h
+++ b/include/linux/sched/isolation.h
@@ -10,21 +10,18 @@
 enum hk_type {
 	HK_TYPE_DOMAIN,
 	HK_TYPE_MANAGED_IRQ,
-	HK_TYPE_KERNEL_NOISE,
+	HK_TYPE_TICK,
+	HK_TYPE_TIMER,
+	HK_TYPE_RCU,
+	HK_TYPE_MISC,
+	HK_TYPE_WQ,
+	HK_TYPE_KTHREAD,
 	HK_TYPE_MAX,
 
-	/*
-	 * The following housekeeping types are only set by the nohz_full
-	 * boot commandline option. So they can share the same value.
-	 */
-	HK_TYPE_TICK    = HK_TYPE_KERNEL_NOISE,
-	HK_TYPE_TIMER   = HK_TYPE_KERNEL_NOISE,
-	HK_TYPE_RCU     = HK_TYPE_KERNEL_NOISE,
-	HK_TYPE_MISC    = HK_TYPE_KERNEL_NOISE,
-	HK_TYPE_WQ      = HK_TYPE_KERNEL_NOISE,
-	HK_TYPE_KTHREAD = HK_TYPE_KERNEL_NOISE
 };
 
+#define HK_TYPE_KERNEL_NOISE HK_TYPE_TICK
+
 struct housekeeping_update {
 	enum hk_type type;
 	const struct cpumask *new_mask;

-- 
2.43.0

