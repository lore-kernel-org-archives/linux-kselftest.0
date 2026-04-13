Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F1D3988E8
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 07:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776066268; cv=none; b=PY0orORVzDijFfV1614mx4CaX3ald1MHzETGE9bSChZsM/j5A/lgXNQwcUWEiudPqftJiIZaCgLFNUky7nkg+gn7PwEyK5wCskd3SB2qrY5Kk0D0BWbGLhxwYbA6rG9DOmUtG/gI1JCVYWHM7ICfbgvScyjAzRMUUtA/HGBugUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776066268; c=relaxed/simple;
	bh=EgiM0bjXMWcDXl+eqa0GeWLZyOOpvT+Ey4r6eUdy/I4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LSi6cDWwAyIEkBVY/ZV1VpbizMLrM862eq2HC6AduwdsAjCBPxWHtQj9XoR0fbCzDcY1go6e7nhkMQgRW60jVdFbUHc3cs4eEd7AkQVkeRZYDN4bT+hOeVVg+CTsc7Mx2z0SzXaBdIR3+A3SPyBN1o1lXsGuunn9w8O45ZPJFtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QkrLNq4d; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QkrLNq4d"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12713e56abdso2616185c88.1
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 00:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776066266; x=1776671066; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0z+BpAj/vLJ0rBDjEb9ZBDVSgQZI0DaLWhxEyOZ7nyg=;
        b=QkrLNq4doKCsleR3Ma7HxR3hzZQUFsMJdDIdPiJb27ekNexXOZlRDvoESCgNq7brQp
         Sau3+37we3Enj3+P8UQzhRxLGNEHhCsgoc0t94Wa/8tpN/O3P5puN9+YoeCXz3Dwl9US
         2Nr8XDH9/YwI+tz3PJ5HHuo4ku+OIs8uLW0y1+Ieq7z6fEtBiuho+2JJKTrGVGqvqyIB
         UlPazTO5nrytVmGkKfnPvbCZsckM8q76/gxJ1lTPdv/u8o1tiV7l2fOz4pORYvI0Nqi0
         3Tl9eTKL4xF17H6bH1TvtP9gTOu7RVxWo49NNZByF/wYDM4l8H90CZFQ6Q2g5aN6FkhD
         0g8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776066266; x=1776671066;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0z+BpAj/vLJ0rBDjEb9ZBDVSgQZI0DaLWhxEyOZ7nyg=;
        b=njdFaoqc84QU7rY+XwbWo0YwdXIotlOz/ofIkNmid+Tka4G0QQ4E5opHskBVF57uz9
         xo4B+SOhIUmHhjKCXPQf6UDfixFnUsPqw4GiaASL1xOBpU+kp7T6FxgxMHWQWC7AWWlA
         0QYzISA4uvitU8NaZCm/Gkv3dxA8Kg7O8VtIrTmg19p/LEFfz0aEsTxrB5LyL+9y4Zfj
         cUKmoi6oazQGDFE53rM1JoD2ZLLNb4Illri4GR5s3BC7Tr1SzbR+nIFyVzuPmj3w3lRe
         hf4cFeRttJMJWBCpIXd1MyQJ0qEHHBRJzOF3w2JZLPQ/ZbXF6/BN0DIpPfkMzUraAoix
         mB1g==
X-Forwarded-Encrypted: i=1; AFNElJ+rtki4FWcNZG7KUOyoz+8dPiPQ+lneRnP8cOSfZYiSqs6gP5LPisN/rlXDw1q4MsicpYTE9nAIkn9mzVu4mb4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/7jetcs39GXS8EpXAuTYAgtQe0AQSt9sDL0W7A/TpR5nHqi8O
	sKKieX5uxGdsP4LhV766T4BtBvVrT65B0Yzg1ysddhgLLCMYdjhd0sr5
X-Gm-Gg: AeBDietXti+kvAyaMrXmhUfK+cYiXFGod2/lQESSKij6uRyMN73U+XfTlTPgjAkYGRr
	AcsgA5X+WAqgS032+wNLwQwWk9a9lFcRP/HfNbEsleYN+n2EiQm/0RBCGPySTJvPOjLLUC542mN
	IAEl2l6zwSWLLPt9GLRE8L9gjnzgq68v4d4pJxIsgdtqh5f0GFgme3QOyV5McUPhs9Sw7Ze4hxT
	R7EfWjzneejQhI0k4HgbU/m3j/w8X78IzmScA56GWDt8IR75wkBdls9OXo08Dn4wHa/C8/azNCQ
	yNHix4ohSzD1kKlbmAMwxJX5to7xQX8AiIgmoorg6PZPITn7SIhDfW0Yk/P6Z5uJLkM2ILuGk6K
	olOirS3ThnVCBPwsS2x8PWaynr7nhzeUV5gGXmrNiNK0r7JnAp22Lj+Nc7PMNhOz3f9xehSCJf4
	SmsNchVxWaBhM8Lia3
X-Received: by 2002:a05:7022:4a2:b0:123:3c24:b15 with SMTP id a92af1059eb24-12c28c31ef4mr6458629c88.19.1776066265460;
        Mon, 13 Apr 2026 00:44:25 -0700 (PDT)
Received: from wujing. ([74.48.213.230])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c347fa2c9sm12884610c88.15.2026.04.13.00.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:44:25 -0700 (PDT)
From: Qiliang Yuan <realwujing@gmail.com>
Date: Mon, 13 Apr 2026 15:43:12 +0800
Subject: [PATCH v2 06/12] watchdog: Allow runtime toggle of lockup detector
 affinity
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-wujing-dhm-v2-6-06df21caba5d@gmail.com>
References: <20260413-wujing-dhm-v2-0-06df21caba5d@gmail.com>
In-Reply-To: <20260413-wujing-dhm-v2-0-06df21caba5d@gmail.com>
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
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Brendan Jackman <jackmanb@google.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
 Waiman Long <longman@redhat.com>, Chen Ridong <chenridong@huaweicloud.com>, 
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, rcu@vger.kernel.org, linux-mm@kvack.org, 
 cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <realwujing@gmail.com>
X-Mailer: b4 0.13.0

The hardlockup detector threads are affined to CPUs based on the
HK_TYPE_TIMER housekeeping mask at boot. If this mask is updated at
runtime, these threads remain on their original CPUs, potentially
running on isolated cores.

Synchronize watchdog thread affinity with HK_TYPE_TIMER updates.

This ensures that hardlockup detector threads correctly follow the
dynamic housekeeping boundaries for timers.

Signed-off-by: Qiliang Yuan <realwujing@gmail.com>
---
 kernel/watchdog.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 7d675781bc917..bcd8373038126 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -26,6 +26,7 @@
 #include <linux/sysctl.h>
 #include <linux/tick.h>
 #include <linux/sys_info.h>
+#include <linux/sched/isolation.h>
 
 #include <linux/sched/clock.h>
 #include <linux/sched/debug.h>
@@ -1361,6 +1362,30 @@ static int __init lockup_detector_check(void)
 }
 late_initcall_sync(lockup_detector_check);
 
+static int watchdog_housekeeping_reconfigure(struct notifier_block *nb,
+					    unsigned long action, void *data)
+{
+	if (action == HK_UPDATE_MASK) {
+		struct housekeeping_update *upd = data;
+		unsigned int type = upd->type;
+
+		if (type == HK_TYPE_TIMER) {
+			mutex_lock(&watchdog_mutex);
+			cpumask_copy(&watchdog_cpumask,
+				     housekeeping_cpumask(HK_TYPE_TIMER));
+			cpumask_and(&watchdog_cpumask, &watchdog_cpumask, cpu_possible_mask);
+			__lockup_detector_reconfigure(false);
+			mutex_unlock(&watchdog_mutex);
+		}
+	}
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block watchdog_housekeeping_nb = {
+	.notifier_call = watchdog_housekeeping_reconfigure,
+};
+
 void __init lockup_detector_init(void)
 {
 	if (tick_nohz_full_enabled())
@@ -1375,4 +1400,5 @@ void __init lockup_detector_init(void)
 		allow_lockup_detector_init_retry = true;
 
 	lockup_detector_setup();
+	housekeeping_register_notifier(&watchdog_housekeeping_nb);
 }

-- 
2.43.0

