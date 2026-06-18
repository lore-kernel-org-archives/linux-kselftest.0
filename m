Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70D0331EAA
	for <linux-kselftest@vger.kernel.org>; Thu, 18 Jun 2026 03:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781752293; cv=none; b=SOhrAY8fqixWYUTXzeTyM7cERaY5ANOdr63mjTLdnoZZLRUUpwDapWG1N5Wh4GjB6c5gGuoOxHhkx08SmnK/s7SIAiFVbBy0baV1kPF7IJPRZSnC+GWfRENGBDpbBIccpDv6+BpqRhkpPpIcHP7Ntf7Piiz3k1EhCFZbC8BiH6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781752293; c=relaxed/simple;
	bh=LFnUvZsdMV36HeugdzJp7p/REa5uLOArHKOIqQWkJY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ILbEDDkEzRbB1+zu1dh7zIHfNWktKEsFIeQOI8d3aob9d+0d6ZuGhNFg8O1IYA4qCcQ2/9BL52rcfUkF7dlu+hV2Qpug8byqzHJRNhx7lyZmmNzPbKkJp6OpTjWNQ3oAycXLWMd4Za2qL7ZClUmhkzRHwg7Ql9jXGvL3yKwIEIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=djEp0eok; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="djEp0eok"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c6bb8a5980so3214535ad.2
        for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 20:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781752291; x=1782357091; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WzKJaLY4P29xr36n94cF6pafuVv3SDEbWpOz12HsOhM=;
        b=djEp0eokhQ2NMzAcX24vYUFw7KCOYo04rjPuhwnJxmAZUa3gbFVTm+4j3DGzDUGPyI
         DIKUBNI+QvlSbkuKWdia3u4U+ICMFPC3G4vw5fJBciBwb87g6yNhgaJ79ePKvvyAG1to
         9AFC9zVvEUuU9Tqk5/+GOczqNlBGwyrLCrfNsLfoW0VUE4mzaoS6FrnEaeP8/8TNjG4V
         eCAKW3knJoh8YMN/rAVJAbLfn/W5c2Jte6eAUKlcwCD9/yVhgUqSsEmstPkEWKKeoC1l
         /djM+oK4tN5Iayfhe9A6NKs26Jrap7Gkn+J4WbhSaj8NM5Idz3QanszWiLIJseWhGKgR
         xHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781752291; x=1782357091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WzKJaLY4P29xr36n94cF6pafuVv3SDEbWpOz12HsOhM=;
        b=YP71ldkw2RB9pdl/rgrVwNZ8lmlGv35FN8nz6iYWCCnW+lFb0N8At9k8qdekOuXJ5v
         ynsLL+XGn56AFvAx+53a3bAsOxMN3Wr4tZ1q6WLaZZq4Skwtp7T6EeQJuxTWE6xTAKJT
         74bgz+xnWDuwRc1qiDZjK7gMnDI7QWjlNQUfEc+nh7i9Ch7NzPFygmxXn0WPN+brSHAn
         o61T7KAgd0a+0wiB/nspJFdz1Sszm5s//qLnAKULPcYwx0OB8YCwVQ9WNGN2T9apWwVM
         4WC5XBRddBX9aE7gD1I3cyLucp/VAfPzxmhHdInixl7hRecewIYq9ZHCCP2IQj9UDPQ+
         XKkg==
X-Forwarded-Encrypted: i=1; AFNElJ9gnUcnU/9RA36QdjGjo7yVRdONHaBH9HwMtKG8+2I8IfgPkkSX41OZ2by1PQsNjaE8UDoLazxls09SVcB4b88=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtTvcL//nghIEztEv68C/yaCNCS/aVMSPmQW7wPgtHGZTtmk9e
	0WY5o2+zpBo1j+7q4ljorNEphEAs7VRCONovii8hrfvHz+530r+hnEXf
X-Gm-Gg: AfdE7cnRkku67+hq+IOk9pQCb7oCDtkxfzw0I2aWXz8LncmZr+x6gKhLDMaI2PyURw0
	IEYFpVSU87Y4leWDRkqAngqLNr/EdNwfb/oW5O5NT3w419WcijaRqsJycPQwK4DuZ9fcMNIEEFn
	rAmdVVLmPRqYrBH9cmyvxR8IDWW5TkwCd/+Z4XT3p7CXsbUldJj/1IN8zpkxiKedJtv+FpTMN61
	lwDOA/5zfzMObfbVeSLBDyB86OWsdMcjamwkvqmNuf0YxRmTGYD6sA98L3Lp+B07HERLDbxEIbA
	+TDfcvNDyw0vFyvwK+2oKJz7DMFI6Kp1Yo3A856QZGhVw5R9VzdJme5/J7GCNDECSp9dipzhSvI
	ikQ/di+/oUDIDcBZVsa3DBVne/pwWZ2RWncX9k2v80AOp7rnf3eeXCmVY1fsj/qAMAyoGT+MF6A
	1ivkjYP3cgsWk=
X-Received: by 2002:a17:902:f688:b0:2c6:c66b:4b03 with SMTP id d9443c01a7336-2c6e4746cb1mr16305205ad.10.1781752290966;
        Wed, 17 Jun 2026 20:11:30 -0700 (PDT)
Received: from [127.0.1.1] ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6a403b242sm60152975ad.31.2026.06.17.20.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 20:11:30 -0700 (PDT)
From: Jing Wu <realwujing@gmail.com>
Date: Thu, 18 Jun 2026 11:11:12 +0800
Subject: [PATCH v3 01/13] sched/isolation: Replace notifier chain with
 explicit callback interface
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260618-wujing-dhm-v3-1-28f1a4d83b68@gmail.com>
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

Replace the blocking notifier chain with an explicit per-type callback
table (struct housekeeping_cbs).  Each subsystem registers callbacks
at initcall time; pre_validate() runs before the RCU pointer swap to
allow rejecting the update, and apply() runs after synchronize_rcu()
when the new mask is visible to readers.

The table is limited to HK_MAX_CBS (4) slots per type, sufficient for
the kernel-noise subsystems and avoiding unbounded dynamic allocation
in the update path.  The interface provides deterministic callback
order and explicit registration, giving each subsystem maintainer clear
visibility into when and why its callback is invoked — unlike the
opaque priority-based dispatch of notifier chains.

Signed-off-by: Jing Wu <realwujing@gmail.com>
Signed-off-by: Qiliang Yuan <yuanql9@chinatelecom.cn>
---
 include/linux/sched/isolation.h | 31 +++++++++++++++
 kernel/sched/isolation.c        | 87 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 118 insertions(+)

diff --git a/include/linux/sched/isolation.h b/include/linux/sched/isolation.h
index cf0fd03dd7a24..f362876b3ebdf 100644
--- a/include/linux/sched/isolation.h
+++ b/include/linux/sched/isolation.h
@@ -46,6 +46,33 @@ extern bool housekeeping_test_cpu(int cpu, enum hk_type type);
 extern int housekeeping_update(struct cpumask *isol_mask);
 extern void __init housekeeping_init(void);
 
+/**
+ * struct housekeeping_cbs - Per-subsystem callbacks for housekeeping mask changes
+ * @name:		Subsystem name for diagnostic messages
+ * @pre_validate:	Run before RCU pointer swap.  Return -EINVAL
+ *			to reject the update.
+ * @apply:		Run after synchronize_rcu().  Reconfigure subsystem
+ *			state.  The new mask is visible to readers.
+ *
+ * Register subsystem callbacks at initcall time.
+ * Invoke callbacks in registration order when the corresponding
+ * housekeeping mask changes.  Skip types not present in the update
+ * mask.
+ *
+ * Replace the notifier-chain pattern with deterministic callback
+ * ordering.
+ */
+struct housekeeping_cbs {
+	const char			*name;
+	int	(*pre_validate)(enum hk_type type,
+				const struct cpumask *cur_mask,
+				const struct cpumask *new_mask);
+	void	(*apply)(enum hk_type type);
+};
+
+int housekeeping_register_cbs(enum hk_type type, struct housekeeping_cbs *cbs);
+int housekeeping_unregister_cbs(enum hk_type type, struct housekeeping_cbs *cbs);
+
 #else
 
 static inline int housekeeping_any_cpu(enum hk_type type)
@@ -73,6 +100,10 @@ static inline bool housekeeping_test_cpu(int cpu, enum hk_type type)
 
 static inline int housekeeping_update(struct cpumask *isol_mask) { return 0; }
 static inline void housekeeping_init(void) { }
+static inline int housekeeping_register_cbs(enum hk_type type,
+					    struct housekeeping_cbs *cbs) { return 0; }
+static inline int housekeeping_unregister_cbs(enum hk_type type,
+					      struct housekeeping_cbs *cbs) { return 0; }
 #endif /* CONFIG_CPU_ISOLATION */
 
 static inline bool housekeeping_cpu(int cpu, enum hk_type type)
diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
index ef152d401fe20..aae4dff7fbfc8 100644
--- a/kernel/sched/isolation.c
+++ b/kernel/sched/isolation.c
@@ -28,6 +28,93 @@ struct housekeeping {
 
 static struct housekeeping housekeeping;
 
+/*
+ * Maintain an explicit callback table indexed by housekeeping type.
+ * Invoke callbacks for affected types in deterministic order:
+ * pre_validate() before the RCU pointer swap, apply() after
+ * synchronize_rcu().
+ */
+#define HK_MAX_CBS 4
+
+static struct {
+	struct housekeeping_cbs *cbs[HK_MAX_CBS];
+	int nr;
+} housekeeping_cbs_table[HK_TYPE_MAX];
+
+/**
+ * housekeeping_register_cbs - Register explicit callbacks for a housekeeping type
+ * @type:	Housekeeping type to register for
+ * @cbs:	Callback structure containing pre_validate() and apply()
+ *
+ * Callbacks run in registration order when the mask for @type changes:
+ * pre_validate() before the RCU swap may reject the update; apply()
+ * after synchronize_rcu() reconfigures subsystem state.
+ *
+ * Return: 0 on success, -EINVAL if @type or @cbs is invalid,
+ * -ENOSPC if the per-type table is full.
+ */
+int housekeeping_register_cbs(enum hk_type type, struct housekeeping_cbs *cbs)
+{
+	if (type >= HK_TYPE_MAX || !cbs)
+		return -EINVAL;
+	if (housekeeping_cbs_table[type].nr >= HK_MAX_CBS)
+		return -ENOSPC;
+	housekeeping_cbs_table[type].cbs[housekeeping_cbs_table[type].nr++] = cbs;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(housekeeping_register_cbs);
+
+/**
+ * housekeeping_unregister_cbs - Remove previously registered callbacks
+ * @type:	Housekeeping type
+ * @cbs:	Callback structure to remove
+ *
+ * Return: 0 on success, -EINVAL if arguments are invalid,
+ * -ENOENT if @cbs was not registered.
+ */
+int housekeeping_unregister_cbs(enum hk_type type, struct housekeeping_cbs *cbs)
+{
+	int i;
+
+	if (type >= HK_TYPE_MAX || !cbs)
+		return -EINVAL;
+	for (i = 0; i < housekeeping_cbs_table[type].nr; i++) {
+		if (housekeeping_cbs_table[type].cbs[i] == cbs) {
+			housekeeping_cbs_table[type].cbs[i] =
+				housekeeping_cbs_table[type].cbs[--housekeeping_cbs_table[type].nr];
+			return 0;
+		}
+	}
+	return -ENOENT;
+}
+EXPORT_SYMBOL_GPL(housekeeping_unregister_cbs);
+
+static int housekeeping_pre_validate_cbs(enum hk_type type,
+					 const struct cpumask *cur,
+					 const struct cpumask *new)
+{
+	int i, ret;
+
+	for (i = 0; i < housekeeping_cbs_table[type].nr; i++) {
+		if (!housekeeping_cbs_table[type].cbs[i]->pre_validate)
+			continue;
+		ret = housekeeping_cbs_table[type].cbs[i]->pre_validate(type, cur, new);
+		if (ret < 0)
+			return ret;
+	}
+	return 0;
+}
+
+static void housekeeping_apply_cbs(enum hk_type type)
+{
+	int i;
+
+	for (i = 0; i < housekeeping_cbs_table[type].nr; i++) {
+		if (housekeeping_cbs_table[type].cbs[i]->apply)
+			housekeeping_cbs_table[type].cbs[i]->apply(type);
+	}
+}
+
 bool housekeeping_enabled(enum hk_type type)
 {
 	return !!(READ_ONCE(housekeeping.flags) & BIT(type));

-- 
2.43.0

