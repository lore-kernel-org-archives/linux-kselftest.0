Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE383370FF
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 09:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774429894; cv=none; b=DUxhK4PmoxrPZJghhq/innzeGjtOQfpLC4DfvIWggVmUDaME6OC5zpWbo6ehs9e1dO3h2ehMqKKHVvHO2nYx7BZ2bWh7FVa0DgueNgnbG8yv0pTaS4uyrD5sLfyVG6WHQZUG0Np1uE4mIgXDfq2t2fhOzNKexB8QpczIe4JQt3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774429894; c=relaxed/simple;
	bh=I7peAwba+g6DkhuQBgaU9UnLggjeBQUrKJ0kCB1N/SQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F7mtvj0Bte2nMRMLM9e2QhINtkUd8jnkHnRsVKjxTHAhmhl0gBOvE2yGbUTtim9r0A6HQx79tO/+qk5OdtCH8fxOm7hoXBtPuUma23c+N+zKs7j7W/VCjcxxhJxpznoI33lotQsA2pDnm6BZHoJeyiwOqyy/b1c+zETv9JhDQeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DF+2xk2V; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DF+2xk2V"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2bdd40d3c61so4211638eec.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 02:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774429892; x=1775034692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p2KjID10vkg/qXstgNRvPPvkY3Brj7dL/qNSBa8q0+4=;
        b=DF+2xk2VvlBqpOeTb6EOTiIEb634AjwT5HU8+7tytyLvWi4BxY0fse0AQGOqAbLPGP
         curV0Jp5ptcOPLTLy2uPMBHzgpd2nyiMH5ZsoJHNdL9stXi1kQzwoVl+aTQfGPopfqDv
         VBnz359TI0cq5/R6H4SOcV0VuIEXOLLkhEtNBX8W47LlpWzAuQsXPdL5SWX2JwJdWEqN
         /Fny0y+IYakovDEAg6hs63BYhHdG3dAcz8WTQZHbmVzlqYqxnLiPHzJ5expBT4C2kmfx
         FhGeJc5bXN3d2FJPdujGE6qUwJwUWtXjXmdHpOuJITUkYzraP4YaAVvTQwSEWRiTFV2k
         bIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774429892; x=1775034692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p2KjID10vkg/qXstgNRvPPvkY3Brj7dL/qNSBa8q0+4=;
        b=nV0c4iaxthKwxJyIHiHbmkryYlsCTdfcNpOG6cSMil3Do7B+B9qjPvgVooFWWa+9bj
         lK/t5aRjo0a9zHB83zv8o1ZQJEoIS6Y0ctIydiZHpudVp50dUvNwbjtM8mJ7dcyzh3s7
         g3zhW6VFFKiG3v6V2q7tUmOyUdDuZHv9lLNIAdWEYCa5KOf/E3X2urjCPAAR+EJlMl8w
         YZqIjaOH4hZ6duXpZFOwEY6lKweDQCHLlIg2p6BA3KplNeYslT9JMypLzXJBT/RC9p4L
         zs09U5F1u+npBMp3hCe4AAumseoRloLwq7FyPokXUGIs+NsKg2CqFIo+p6y9MRP/pDm+
         6eMA==
X-Forwarded-Encrypted: i=1; AJvYcCW7Xov4xV5pEvUV6TPFTkZJ6RTO5gmrjfBpyC/Hj0+HI5wt/X6/4O2bg7ahMEwqE24HfE2IPR3VpITB4dBmHJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvSgj3vIMknkZ0A6N4enEIFOVMoqi6O8OtGg5k37DLKoX+wumb
	YgnYIlyAKKtLF60f+3sY0wikT58Ly0+ccCp3ojyxscUP6DkrdymQ27ry
X-Gm-Gg: ATEYQzwlXqBsWw5tAE/xfopc/ylNvcBmR5OXosjwISpXhUkbu+g/AKLD0IlpdOCzOe6
	wiWnsmuXwRfy6SiyMijq3vRfqZ32dxmBgSjPC72PEPg91qbWf6+dbE9egES04DxOZG4ay046UFM
	rNA7kkqAnrPs/IqB/jtmNATZOujgW2MkLti8rMkMIuYQuRUmMcHj9p0QfYl6+xvY3O9p9d7JfLN
	pzpK5V5sUpC89v3rvF7FkEIQKqT4spzR4/rSanVVyuD0xdDhE0vcA6Md74JeeHGPAKYWjkYsKMs
	L55E7lf1ZaPs+0oOF3tL3Y0gZ1JVBS8p34gTE+8BVyaBNr4xhL30Mt/eXnc+/famYzG13lBnax5
	L82qx0CD20zNCVQsgoobtgSlloX/VS/xr6CRP7n0i4Fc1ItA+lppJhbzQfkmecjE69XikZM9IMm
	++OnHh3CMy4enP/zx/
X-Received: by 2002:a05:7300:2305:b0:2c1:4f1:c87b with SMTP id 5a478bee46e88-2c15d357a32mr1565966eec.18.1774429891947;
        Wed, 25 Mar 2026 02:11:31 -0700 (PDT)
Received: from wujing. ([74.48.213.230])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c159e25dc7sm2786389eec.27.2026.03.25.02.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 02:11:31 -0700 (PDT)
From: Qiliang Yuan <realwujing@gmail.com>
Date: Wed, 25 Mar 2026 17:09:45 +0800
Subject: [PATCH 14/15] Documentation: isolation: Document DHEI sysfs
 interfaces
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-dhei-v12-final-v1-14-919cca23cadf@gmail.com>
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

---
 .../ABI/testing/sysfs-kernel-housekeeping          | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-kernel-housekeeping b/Documentation/ABI/testing/sysfs-kernel-housekeeping
new file mode 100644
index 0000000000000..3648578200111
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-kernel-housekeeping
@@ -0,0 +1,22 @@
+What:		/sys/kernel/housekeeping/
+Date:		March 2026
+Contact:	Qiliang Yuan <realwujing@gmail.com>
+Description:
+		Directory containing the dynamic housekeeping configuration
+		for various kernel subsystems.
+
+		Each file represents a specific housekeeping type:
+		- timer: Timer and hrtimer interrupts.
+		- rcu: RCU callback offloading and GP kthreads.
+		- misc: Miscellaneous kernel services (e.g. kcompactd).
+		- tick: Dynamic full dynticks (NOHZ_FULL) state.
+		- domain: Scheduler domain isolation.
+		- workqueue: Workqueue affinity.
+		- managed_irq: Managed interrupts migration.
+		- kthread: General kernel thread affinity.
+		- smt_aware_mode: SMT-aware isolation toggle (0/1).
+		  When enabled, writing a mask that does not include all
+		  sibling threads of a core will be rejected with -EINVAL.
+
+		Writing a CPULIST to the type files dynamically updates the
+		housekeeping mask for the corresponding type.

-- 
2.43.0

