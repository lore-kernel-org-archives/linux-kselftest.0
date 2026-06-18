Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D77C33C18B
	for <linux-kselftest@vger.kernel.org>; Thu, 18 Jun 2026 03:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781752362; cv=none; b=mknYOK/3Qv71oFv6N1G2mxJj+xSir8saZfb2/3CvTIvPpL76+7999h2GGv9Xis+/KP9eFhDD5sx80bdwB4j5IrWjingTgj+jDF1x2gvqgk0Onw4EywQ0GgEAXUphpG3JTK4b+dB9pKjPcNptitAi10Yy2XYAYQOupMTSp7tWicY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781752362; c=relaxed/simple;
	bh=SZSfvX12VlEuwZl+6hAVKIfqxpPnB1VqKOp94X4ryo0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PABc0P9BIxRD+NelpEjC83XVkA1kAXl61gIxkWGE602ekYW4rEKm8FkG9xX5mnIb0X7Q7q8+dX5MgK329Hao7MzbM/iVmF+lWbGM/Me9ulCGmG9BF2UzuxUuWl4aFVhUoOy4LuLUQi41K+FRUnnI06RMZ6RSqp2/DQm3dju32ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZqe4DdH; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZqe4DdH"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2bf125989f2so2930405ad.3
        for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 20:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781752361; x=1782357161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v3I6IX1xUYJMTfIXEi0w2UhaS8cMsiIG3uPORXy/Kqg=;
        b=CZqe4DdHuvA83HXuWHxNF+zbSnA/5STgQ7D8CWrVBB6gmc4KskyUW59tKbRVl1V3vC
         iEnxeIbNe3Xk0TsPZiLIVbK3M1WDMzKTjnTvV9gA2Y5bT1L1ZRtvGxWDT2KP1sVCWjaO
         DN04QcsZ6c6SDbsjZakOm/AD3yccCOyNCXMMd6c1EsiqTocuIJ9wUGoy5B6H/OgIey5M
         G6vWB6sE3qPynStWyu7ckXbk8zpmAUQ7G1rwosSEp8tUxgEfCqd83FBTwaIBr2xpeNe7
         kXFDpdpf+DCO9kP2Wb9HfyfFet0xxaYu/Aj2ft5pOLvWHGzAaqcqE8i/AruzjUBA22wT
         CLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781752361; x=1782357161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v3I6IX1xUYJMTfIXEi0w2UhaS8cMsiIG3uPORXy/Kqg=;
        b=QKbStVKOAAJ5bOuSaGt2+KVLVQY5kIxn6UpDfFI4UKCkzogcK6oskK+vcgqQdX8T8+
         KjXigCAMlSkFRU5YMSUfxYzzagYpj0yU6Cqykxtriqh8NK5StXbawT+MKCvR+XhA+0fj
         BhufTIYJ85zlOrZDpdgeKbvEoIPRKt/La1QZGBj6ERpqksEV/FMIx1yrBEW4AHmsAbXM
         leKXVpOUphtowxtGvRCfA1drtokwBgRqbGIPCFF8FZv+5ODd6zVfY2wSUyyVzLHA1/FU
         JdNXXttPOG6dY5sApIo4ivsf1Rl57/j8sQIGdS3bMjA2JR9fo2o3qeZ0kYqz930IToo+
         18aA==
X-Forwarded-Encrypted: i=1; AFNElJ8WiVOUnl34Fc8Tjt1p0Y8PikmwkffOwr4H2XGqu+J0tyca1EZNTPzUclIOKcYW4KIfjhl338MTOpJiglw7PKM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEeCPUCGXdhWqnLH3J0aoyIQKcZjrvA4KTgYiMh6MPoill4MQF
	ZNmJXW6D0a+k8UFF7PKXGYgriNgk6O7aCQJOMHn+1VebnoxDSLKfidaj
X-Gm-Gg: AfdE7ckR1foTTZFIqjnV/zUGaJmhaC/vIgXOnUbcnqzcqBVZFKRAYlMZg8ELawEQN9L
	KBhgMilpiIsGf+xch32ZKUj8thpORZlf1NNZ+yzbd3arY/eAkjE4lQAvC6Lmrs8JfX62hzpIS0/
	esEkvTcYzW8wD5nUWWKzBHCPOCpE9Dclf3W26+d1x2V7ofYSk+YBgTv/UNELuZbVfzUUUURpCoz
	xsItvjPVFi6GQa7kc71eXsF3EmYWpmcIChS7KAxyLXEkazaMKhT/DTlUT9R8N7ao/4+FVNhW9DA
	HC1fFMmqxLElDTcxi912k1q10la2hwU4WV/nfQmRn3z4ve5bGCMYBbCwBmWOkJTzBWJQlMlQMeC
	ZknhsIPVgKuRvWqgi/yFuuFUPTsH8HEsYsDywERoB3KSs3fUpNDlpdSSwwS+i3K70yH8Z5VoarP
	4sgJP5vUJfa6w=
X-Received: by 2002:a17:902:ea07:b0:2be:22cc:e227 with SMTP id d9443c01a7336-2c6bbf9dfa0mr65761055ad.4.1781752360871;
        Wed, 17 Jun 2026 20:12:40 -0700 (PDT)
Received: from [127.0.1.1] ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6a403b242sm60152975ad.31.2026.06.17.20.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 20:12:40 -0700 (PDT)
From: Jing Wu <realwujing@gmail.com>
Date: Thu, 18 Jun 2026 11:11:23 +0800
Subject: [PATCH v3 12/13] docs: cgroup-v2: Document kernel-noise isolation
 via isolated partitions
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-wujing-dhm-v3-12-28f1a4d83b68@gmail.com>
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

Document that cpuset.cpus.partition=isolated now drives runtime updates
of the housekeeping masks for kernel-noise types: nohz_full (tick
suppression), RCU NOCB offloading, and managed IRQ migration.  No
additional cgroupfs files are required; the partition update path
automatically triggers explicit housekeeping callbacks for all affected
subsystems.

Signed-off-by: Jing Wu <realwujing@gmail.com>
Signed-off-by: Qiliang Yuan <yuanql9@chinatelecom.cn>
---
 Documentation/admin-guide/cgroup-v2.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 6efd0095ed995..7c3b048e75cb5 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2721,6 +2721,14 @@ Cpuset Interface Files
 	kernel boot command line option.  If those CPUs are to be put
 	into a partition, they have to be used in an isolated partition.
 
+	When an isolated partition is created or destroyed, the kernel
+	automatically drives runtime updates of the housekeeping masks
+	for kernel-noise types (nohz_full, RCU NOCB, managed IRQ
+	interrupts).  This extends isolation beyond scheduler domains:
+	the tick is stopped on isolated CPUs, RCU callbacks are
+	offloaded to housekeeping cores, and managed interrupts are
+	migrated away.  No additional cgroupfs files are required.
+
 
 Device controller
 -----------------

-- 
2.43.0

