Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779824;
	b=C2nXMK+NlP8aIJ//yZMlhizt1mqQH7UMnKoSQJ5b64lHyXdo4jOn5UylgE4O6P38xTc6
	 RAWqf05wUhucWe8kTWWVLkj1R07inLhjUF4uQ9RIVsaFMmLw7AVgIlhiWzU48vYcTS5jT
	 RRF4TDyY0CR7qbhnhO2ChrykFCqmiHMFyAhCuqnOluhTIyGNgHpa4DcTaRT9ANpNdQXhn
	 uiBAZwzV/6Sxeqdtw5R0qZSUuOSBI9lED4CMXrmpfANESR2rHDi9Am3MkeDNz0mCdXZuM
	 kYWVT+JM0ISMMQnP2D80veUzG+sMezbR88lhSfLFT/g0NgkJFAdg4FZnj19Nw7rFTwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779824;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JfxRl6ryEk0iwVbD04Ub39VkD0Z3xzoRKlXr5gXHJv0=;
	b=QZnXCGcA9nj7/ORHKp4ilvuJA7cwgkBCMZE4kDOYwQwnc6fh0EKzH6rhiD7RWoz4iqV5
	 oN+3Mhp8QJGtd2zx7T4Z5U/rxm87icUjZPo+10C1EhpDb5A/IVgCYNk5oO8s5Gndo0Xjn
	 hfsSs41uwIgdIf5SH0dGYqHBqsmRVvQbB4CdhklSvEAofpH/CO2VeYbm5AqjLVeaYpKd3
	 NFeGl6q3B+3F/5XNXkGnWAVRvYws2DPYOQOIcc42HtCsvbCwW4cLp6KMYOh7kbqv2QQx8
	 u6iEPqXivOxwagbK6Vx9UlGf+5DrkEjQji19mvplYNtv1Tta9AAZTCpvWCtXcAL0nKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=jCR84be7;
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3A5606A31F
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 11:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A3A5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=jCR84be7
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5363c8de563so80373541cf.0
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 03:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795779822; x=1796384622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JfxRl6ryEk0iwVbD04Ub39VkD0Z3xzoRKlXr5gXHJv0=;
        b=jCR84be7XA8oSEuPkLrJ+XhPbVZu3iN0q0fVhNVcpnJU9K4EwSBv+f9660N+nsGW0s
         lWriJt8LrZ9Q2yCi3lOftj9TIcDZ6lQo73wYpRhmVzJu4szkB/qOStvd/kQ+F//YLZws
         UCo+z7V/AnfLLtTfj0bAABKZ52lgqS0GNPxwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779822; x=1796384622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JfxRl6ryEk0iwVbD04Ub39VkD0Z3xzoRKlXr5gXHJv0=;
        b=qS42/Qr85DYjfem16d2XaP05vwFeuuScVYrcDHM1OfNGCdr+RRcYzq9SLwg6kfUHPO
         n99hGT3K7/HMVOijpvo+3L4Qn9kZmIdpwPrmD8MvUBVDpbAvDy5gV4Dj9Tr4SZ+bWcSt
         1e8o17cIm5rUR4LEoE7sTWQks3xDmwSqT/8B4wTk401jsV3DmkVl00ZiCMYowbA5cBNA
         3daG7wxiz4Qu/Ec2vU4GyGi5nFE/6P8AXJA8DTrhaQ0p/yh0QWu1BODgD+Cnc0rQUW7p
         DAf20yFAkcTBVeSSMle9ovu5RTcyQ7xFfTn5gcp02suVuvYfwB2wqROQ4pKN5tYiK9gQ
         O0zQ==
X-Forwarded-Encrypted: i=1; AL+hErFGLVgFWZiYJBkeKtX3mM2O0iptZ7s7QCGwPFSi1yXVpDz8BMAL/1bOX/GTJNYA1hdDqcvQgjQlcYl39SL7ApM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lftl2vzd4uypo5F/hHr2M4r5B9+sTEZnMKgjm3QJ6i8q7AUIs
	+8NGV9BcGWSAxVDUSGsiDcAaTNb6zdbosST73xL5eJSrrnHD54f3o8sCTHmrkGh5mQ==
X-Gm-Gg: AZFdTZcNQzGNkLURa3rTsfWrRj6Yj0cwBavHPoNw+vYsKjl5x/i91zhWtF+LRezqNPA
	ydqN30G0Iorz38vjn26UMJO5xQMaGZrAh1obFk4mG44y9eFJseEaHHVeyyEmLKE+AtkcwH3nrPS
	W/38HmHl5z73aSnq/OpYN98GWoNqMmreo0GXCwBqNv2noxSWTEAaamQ5FWYFE83Q1YMNoQWvjul
	L5vF9IqngOeEkWcJezbMM9UBFiiAd4WQt9AXWRLF9u8eJju7dFpHmi1Hk1AIjoyDb/idO5Zqsnm
	rZJGVfrxNUm4AumSfMj14CmfTcSCkMe9N6nm5fgkTfU56zv/NWdcZzu8fyGBlbSm3DsksrWUobY
	xayxNDKCrKCJIzy+HypeNaNrgEctyh7tPj+P09hv+X/uIriFq/z85f6H//rVWfMsdSt4MixzIaY
	C8gjnSbvAFQvx7PZU57Ii4xwLGXwn1n6asgRPE48cHrWmwcm5lujIDYhbmy+GSXqYrzLSWb5x2F
	FvIoMLM1GoTX5K+sjewGGKPlUMwx0rkRQcXWwjYIkYf62LFZk+f+Y1zwtBUfpqFG7xNNwuUdjtv
	cYTdyElHh2uaK9/3+mxWn8Q3RJ6naDL5VMRZRSjEN+dBJOyjP9aMCZf0UDUbuuUkEIYwAkj5hff
	FZeOd0bizoICMdwc=
X-Received: by 2002:a05:622a:413:b0:55d:3347:8138 with SMTP id d75a77b69052e-55d76a5c564mr448911711cf.44.1795779822454;
        Fri, 27 Nov 2026 03:43:42 -0800 (PST)
Received: from localhost.localdomain ([64.203.83.2])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55dcdd1a2c6sm16652551cf.20.2026.11.27.03.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:43:41 -0800 (PST)
From: Jamal Hadi Salim <jhs@mojatatu.com>
To: netdev@vger.kernel.org
Cc: Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Victor Nogueira <victor@mojatatu.com>,
	stable@vger.kernel.org,
	syzbot+0054fed3dc9085390f51@syzkaller.appspotmail.com,
	shaos <shawnq1@163.com>
Subject: [PATCH net v5 1/2] net/sched: act_gate: bound the cycle time and start time arithmetic
Date: Fri, 27 Nov 2026 06:43:34 -0500
Message-Id: <ACT-WEXM.v5.r0.20261127063407-1@mojatatu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ACT-WEXM.v5.r0.20261127063407@mojatatu.com>
References: <ACT-WEXM.v5.r0.20261127063407@mojatatu.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The issue:
TCA_GATE_BASE_TIME and TCA_GATE_CYCLE_TIME are u64 attributes read into a
signed ktime_t; a value above S64_MAX turns negative and the cycle
arithmetic wraps instead of saturating.

With base_time = 1 and cycle_time = 0xffffffffffffffff the start time
comes out as 0: the timer is armed in the past and every expiry recomputes
it, so the softirq never finishes.  Neither attribute has ever been
bounded, so one request stalls a CPU on any kernel that has the action.

Reported by syzbot and independently by shaos; the request below
reproduces the stall.

The Fix:
Cap base_time and cycle_time at KTIME_MAX in the policy.  Both keep NLA_U64
and 0 stays accepted (a 0 cycle time derives from the entries); the _EXT
attribute does not drive the timer and stays unbounded.

Work out the part of the cycle still ahead of now and add it with
ktime_add_safe(), so an unrepresentable expiry saturates instead of
wrapping into the past.  gate_timer_func() reuses that helper, stores the
boundary it computes, and restarts the walk at the first entry.

Conditions to recreate the bug:
CONFIG_NET_ACT_GATE=y.  The action can also be created from a filter,
where the only capability check is netns-scoped, so a user namespace of
its own is enough:

  unshare -Urn
  ip link set lo up
  tc qdisc add dev lo clsact
  tc filter add dev lo ingress matchall action gate base-time 1 \
      cycle-time -1 sched-entry close 1000000

iproute2 parses the attribute as a signed 64-bit value, so -1 reaches the
kernel as 0xffffffffffffffff.  The raw RTM_NEWACTION path also tests
netlink_capable() against the init ns; the reproducer writes those values.

The send never returns and the CPU stays in the timer softirq.  With
softlockup_panic=1 and watchdog_thresh=5 the kernel reports

  watchdog: BUG: soft lockup - CPU#0 stuck for 13s! [poc:832]

with tcf_gate_init() on the stack; on the fixed kernel both requests are
refused.

Fixes: a51c328df310 ("net: qos: introduce a gate control flow action")
Reported-by: syzbot+0054fed3dc9085390f51@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0054fed3dc9085390f51
Reported-by: shaos <shawnq1@163.com>
Link: https://lore.kernel.org/netdev/20261022144732.61188-1-shawnq1@163.com/
Link: https://lore.kernel.org/netdev/20260827191547.4004973-2-kuba@kernel.org/
Link: https://lore.kernel.org/netdev/20260827121751.33dac8aa@kernel.org/
Link: https://lore.kernel.org/netdev/DN37NBGPJJG9.2DSVDCKS3UYTV@gmail.com/
Suggested-by: Alexei Starovoitov <ast@kernel.org>
Cc: stable@vger.kernel.org
Signed-off-by: Jamal Hadi Salim <jhs@mojatatu.com>
---
v4 -> v5:
- Split: this posting carries the regression fix and its tests; the 10 us
  entry-interval floor and its cases moved to net-next.
- Conditions: a filter reaches the same code with CAP_NET_ADMIN in a user
  namespace of its own; the earlier text claimed the initial user namespace
  was required (reported on the list).
- Changelog: KTIME_MAX equals S64_MAX, so the bound is the same value the
  earlier policy carried; name what removed the wrapped start time, the
  base_time bound and ktime_add_safe() (reported by Sashiko).
---
 net/sched/act_gate.c | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/net/sched/act_gate.c b/net/sched/act_gate.c
index 711cf2443540..4835f6543901 100644
--- a/net/sched/act_gate.c
+++ b/net/sched/act_gate.c
@@ -45,8 +45,8 @@ static void gate_get_start_time(struct tcf_gate *gact,
 				const struct tcf_gate_params *param,
 				ktime_t *start)
 {
-	ktime_t now, base, cycle;
-	u64 n;
+	ktime_t now, base;
+	u64 cycle, rem;
 
 	base = ns_to_ktime(param->tcfg_basetime);
 	now = gate_get_time(gact);
@@ -58,8 +58,8 @@ static void gate_get_start_time(struct tcf_gate *gact,
 
 	cycle = param->tcfg_cycletime;
 
-	n = div64_u64(ktime_sub_ns(now, base), cycle);
-	*start = ktime_add_ns(base, (n + 1) * cycle);
+	div64_u64_rem(ktime_sub_ns(now, base), cycle, &rem);
+	*start = ktime_add_safe(now, ns_to_ktime(cycle - rem));
 }
 
 static void gate_start_timer(struct tcf_gate *gact, ktime_t start)
@@ -94,8 +94,8 @@ static enum hrtimer_restart gate_timer_func(struct hrtimer *timer)
 	gact->current_entry_octets = 0;
 	gact->current_max_octets = next->maxoctets;
 
-	gact->current_close_time = ktime_add_ns(gact->current_close_time,
-						next->interval);
+	gact->current_close_time = ktime_add_safe(gact->current_close_time,
+						  next->interval);
 
 	close_time = gact->current_close_time;
 
@@ -108,13 +108,10 @@ static enum hrtimer_restart gate_timer_func(struct hrtimer *timer)
 	now = gate_get_time(gact);
 
 	if (ktime_after(now, close_time)) {
-		ktime_t cycle, base;
-		u64 n;
-
-		cycle = p->tcfg_cycletime;
-		base = ns_to_ktime(p->tcfg_basetime);
-		n = div64_u64(ktime_sub_ns(now, base), cycle);
-		close_time = ktime_add_ns(base, (n + 1) * cycle);
+		gate_get_start_time(gact, p, &close_time);
+		gact->current_close_time = close_time;
+		next = list_first_entry(&p->entries,
+					struct tcfg_gate_entry, list);
 	}
 
 	gact->next_entry = next;
@@ -173,13 +170,20 @@ static const struct nla_policy entry_policy[TCA_GATE_ENTRY_MAX + 1] = {
 	[TCA_GATE_ENTRY_MAX_OCTETS]	= { .type = NLA_S32 },
 };
 
+static const struct netlink_range_validation gate_time_range = {
+	.min = 0,
+	.max = KTIME_MAX,
+};
+
 static const struct nla_policy gate_policy[TCA_GATE_MAX + 1] = {
 	[TCA_GATE_PARMS]		=
 		NLA_POLICY_EXACT_LEN(sizeof(struct tc_gate)),
 	[TCA_GATE_PRIORITY]		= { .type = NLA_S32 },
 	[TCA_GATE_ENTRY_LIST]		= { .type = NLA_NESTED },
-	[TCA_GATE_BASE_TIME]		= { .type = NLA_U64 },
-	[TCA_GATE_CYCLE_TIME]		= { .type = NLA_U64 },
+	[TCA_GATE_BASE_TIME]		=
+		NLA_POLICY_FULL_RANGE(NLA_U64, &gate_time_range),
+	[TCA_GATE_CYCLE_TIME]		=
+		NLA_POLICY_FULL_RANGE(NLA_U64, &gate_time_range),
 	[TCA_GATE_CYCLE_TIME_EXT]	= { .type = NLA_U64 },
 	[TCA_GATE_FLAGS]		= { .type = NLA_U32 },
 	[TCA_GATE_CLOCKID]		= { .type = NLA_S32 },
-- 
2.34.1

