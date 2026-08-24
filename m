Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B23D386575;
	Mon, 24 Aug 2026 18:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787597618; cv=none; b=fLFg7Klh/PG2ynOz6jJUkP4q7fHpT5by5tOdmx67KGnvHhPcD4xp8nKlEMDTu6qR1oY0Rit3kGBVBh29PwydtSAbv/Y6HJ3Ty/tiJdv6Ogmw4YPdW4khnj1f8mMglBudn4902SXD2JMKjGaOcm9qX5XFMTB9pZ3IJ8buSM8cs8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787597618; c=relaxed/simple;
	bh=1lJnSi2HazseBdD+4sC3vgF+4R7/4DWZa/cFcVRTQ0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oewUZE5hik7WOKL7D8IZ8wn2cuDRGZslDc1XGFNcL38bL5Rds0P4i6rJhy35aKmWkWISLlGrmggGPwOfyHJlH8Jupae6zvEhJ9ZykGnHpMAN7FHJdwk4DqP4TtGR+uI8HTTsUIM78++MZBKHzEGPSQskHh9D0J6cTQlYB+jbzb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JbGeHq51; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JbGeHq51"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83D481F000E9;
	Mon, 24 Aug 2026 18:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787597617;
	bh=xkqGh9qjAbz5k8s+T75YVL3JE3CUW5dG0HDTmKXWPsU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JbGeHq51aaxYVyfneO7X6YlaugEsnaWwRN80izWmOg92T8rO77YrDPhkPZyu4pwLl
	 faGqun+UWJBk/K9son6zkgFFlYGql9NKTYRZE7o7C7G2AkSfTrp05ilK/UsQnt4HX8
	 E8zRQ1RiHaaR3ZRPWeJItdSDKKWH3AefrOlFjhmVyGM8yPelMFyekB29gOw+hUq+Nv
	 v2TTYp0aHTwSUG8G2or3af1cVgq1uqg06yv5Uwd4Bd5bE+dS5/oZVphiCC8maf7Gly
	 uzek736ojzgV7C3R6Rqjj0fvpi15HMfLgsyId2XckKOMr6XfeKcUAEBqmV5vuLVwrv
	 +/yOLrTMOPn1w==
From: Jakub Kicinski <kuba@kernel.org>
To: junjie.cao@intel.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	horms@kernel.org,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	vinicius.gomes@intel.com,
	shuah@kernel.org,
	bestswngs@gmail.com,
	uladzislau.zhauniarovich@gmail.com,
	hdanton@sina.com,
	syzbot+19d01f6082ec61dd45b2@syzkaller.appspotmail.com,
	syzbot+8785aaf121cfb2141e0d@syzkaller.appspotmail.com,
	syzbot+2642f347f7309b4880dc@syzkaller.appspotmail.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v2 1/3] net/sched: taprio: catch up in bounded time when the schedule falls behind
Date: Mon, 24 Aug 2026 11:53:35 -0700
Message-ID: <20260824185335.2703968-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260820062715.278124-2-junjie.cao@intel.com>
References: <20260820062715.278124-2-junjie.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net/sched: taprio: catch up in bounded time when the schedule falls behind

This adds taprio_catch_up(), which skips whole cycles arithmetically and
then walks at most a bounded number of entries so that advance_sched()
lands on the entry covering the current time instead of replaying every
elapsed entry from hrtimer context. The walk is capped at twice the entry
count and the caller uses the resulting entry, start time and end time for
gate close times, budgets and the next timer expiry.

No Link: tags present in the commit header.

> diff --git a/net/sched/sch_taprio.c b/net/sched/sch_taprio.c
> index 299234a5f0fe6..0d566c934b2f3 100644
> --- a/net/sched/sch_taprio.c
> +++ b/net/sched/sch_taprio.c
> @@ -915,6 +915,51 @@ static bool should_change_schedules(const struct sched_gate_list *admin,
>  	return false;
>  }
>  
> +/* The operational schedule fell behind, e.g. because the timer was delayed
> + * or the reference clock stepped forward. Advancing one entry per timer
> + * expiry would replay the whole backlog from hrtimer context, so skip
> + * complete cycles arithmetically and walk the remaining entries to land on
> + * the entry covering the current time.
> + */

[Severity: Low]
Does this comment promise more than the function delivers?

The wording "walk the remaining entries to land on the entry covering the
current time" reads as an unconditional postcondition, but the loop below
has a second exit condition (--budget), so taprio_catch_up() can return
with *end_time still before now and *next pointing at an entry whose
interval already elapsed.

There is also the case where behind is an exact multiple of cycle_time: the
jump makes end == now, and the strict ktime_before(end, now) test then skips
the walk entirely, so the returned entry is the one whose interval just
ended rather than the one covering the new interval.

The budget cap and the "leftover backlog is then handled by the next expiry"
behaviour appear only in the changelog. Could both be mentioned in the
comment so a reader of the source sees the same contract?

> +static void taprio_catch_up(struct sched_gate_list *oper,
> +			    struct sched_entry **next, ktime_t *next_start,
> +			    ktime_t *end_time, ktime_t now)
> +{
> +	int budget = 2 * oper->num_entries + 1;

[Severity: Low]
How long can this walk hold current_entry_lock in hardirq context?

advance_sched() takes the lock with plain spin_lock() and the advance timer
is set up with HRTIMER_MODE_ABS (no HRTIMER_MODE_SOFT), so the callback runs
in hardirq context. num_entries comes straight from the nested
TCA_TAPRIO_SCHED_ENTRY list and parse_sched_list() only rejects the empty
case, so a large gate control list turns a previously O(1) critical section
into an O(num_entries) walk over separately allocated entries.

Meanwhile taprio_change() waits on the same lock:

	/* Protects against advance_sched() */
	spin_lock_irqsave(&q->current_entry_lock, flags);

so it spins with interrupts disabled for the whole duration of the walk on
the other CPU. The total work is not worse than before the patch, but it is
now concentrated in one lock hold.

> +	struct sched_entry *entry = *next;
> +	ktime_t start = *next_start;
> +	ktime_t end = *end_time;
> +	s64 behind = ktime_sub(now, end);
> +
> +	if (oper->cycle_time > 0 && behind >= oper->cycle_time) {
> +		s64 jump = div64_s64(behind, oper->cycle_time) * oper->cycle_time;
> +
> +		start = ktime_add_ns(start, jump);
> +		end = ktime_add_ns(end, jump);
> +		oper->cycle_end_time = ktime_add_ns(oper->cycle_end_time, jump);
> +	}

[Severity: Medium]
Can this jump shift the gate timeline to a phase the schedule never
occupies?

The jump adds a multiple of cycle_time to start, end and cycle_end_time
while leaving entry untouched, which assumes the entry sequence repeats with
period cycle_time. That holds when the sum of the intervals is at least
cycle_time, because the min_t(..., cycle_end_time) clamp forces each lap to
end on a cycle boundary.

When the sum of the intervals is smaller than cycle_time, the existing
progression in advance_sched() restarts the list as soon as the tail entry
ends:

net/sched/sch_taprio.c:should_restart_cycle() {
	if (list_is_last(&entry->list, &oper->entries))
		return true;
	...
}

and the next end is derived from the previous entry's end_time:

	next_start = entry->end_time;
	end_time = ktime_add_ns(next_start, next->interval);
	end_time = min_t(ktime_t, end_time, oper->cycle_end_time);

so entries run back to back with an effective period of the interval sum
while cycle_end_time advances a full cycle_time per lap, making the clamp
inoperative. Adding N * cycle_time then shifts the timeline by
(N * cycle_time) modulo the interval sum, and the gate_close_time[] values
derived from next_start plus the budgets from taprio_set_budgets() stay
offset from base_time alignment for all later cycles.

Such a schedule is accepted by the ABI, since parse_taprio_schedule() only
checks a lower bound:

	if (new->cycle_time < new->num_entries * length_to_duration(q, ETH_ZLEN)) {
		NL_SET_ERR_MSG(extack, "'cycle_time' is too small");
		return -EINVAL;
	}

For example two 100 us entries with cycle-time 2000000000 passes.

> +
> +	while (ktime_before(end, now) && --budget) {

[Severity: Medium]
Can this loop exit with end still before now, leaving the timer armed in the
past?

The arithmetic branch above only removes whole multiples of cycle_time
(behind >= oper->cycle_time), so a residual in [0, cycle_time) is left over.
The walk then advances the timeline by at most twice the sum of the entry
intervals before --budget reaches zero.

For a schedule where cycle_time is larger than twice the interval sum, for
example:

	sched-entry S 01 100000
	sched-entry S 02 100000
	cycle-time 2000000000

each pass of the walk buys only the interval sum of schedule time, because
cycle_end_time runs ahead of end by (cycle_time - interval sum) per lap and
the min_t(ktime_t, end, oper->cycle_end_time) clamp never engages. The loop
then terminates on budget exhaustion with end < now, and behind stays below
cycle_time on the following expiries so the arithmetic jump never re-engages.

advance_sched() consumes the result unconditionally:

	next->end_time = end_time;
	taprio_set_budgets(q, oper, next);
	...
	hrtimer_set_expires(&q->advance_timer, end_time);

so the timer is rearmed with an expiry in the past and the callback fires
again immediately, with every gate_close_time[] also in the past so
taprio_dequeue_from_txq() transmits nothing. With the cycle_time policy cap
of INT_MAX that is up to a few thousand back-to-back expiries per
fall-behind event.

With this patch alone, before the later change that enforces a minimum
interval for software schedules, intervals down to roughly 48 ns are still
accepted on virtual devices, and then twice the interval sum is smaller than
the cost of servicing one expiry, so for gap schedules the storm the
changelog describes does not converge at all. Is the intent that this patch
depends on the minimum interval patch for the bound to hold?

> +		if (list_is_last(&entry->list, &oper->entries) ||
> +		    ktime_compare(end, oper->cycle_end_time) == 0) {
> +			entry = list_first_entry(&oper->entries,
> +						 struct sched_entry, list);
> +			oper->cycle_end_time = ktime_add_ns(oper->cycle_end_time,
> +							    oper->cycle_time);
> +		} else {
> +			entry = list_next_entry(entry, list);
> +		}
> +
> +		start = end;
> +		end = ktime_add_ns(end, entry->interval);
> +		end = min_t(ktime_t, end, oper->cycle_end_time);
> +	}
> +
> +	*next = entry;
> +	*next_start = start;
> +	*end_time = end;
> +}
> +
>  static enum hrtimer_restart advance_sched(struct hrtimer *timer)
>  {
>  	struct taprio_sched *q = container_of(timer, struct taprio_sched,

[ ... ]

> @@ -960,14 +1005,19 @@ static enum hrtimer_restart advance_sched(struct hrtimer *timer)
>  		next = list_next_entry(entry, list);
>  	}
>  
> -	end_time = ktime_add_ns(entry->end_time, next->interval);
> +	next_start = entry->end_time;
> +	end_time = ktime_add_ns(next_start, next->interval);
>  	end_time = min_t(ktime_t, end_time, oper->cycle_end_time);
>  
> +	now = hrtimer_cb_get_time(timer);
> +	if (unlikely(ktime_before(end_time, now)))
> +		taprio_catch_up(oper, &next, &next_start, &end_time, now);
> +
>  	for (tc = 0; tc < num_tc; tc++) {
>  		if (next->gate_duration[tc] == oper->cycle_time)
>  			next->gate_close_time[tc] = KTIME_MAX;
>  		else
> -			next->gate_close_time[tc] = ktime_add_ns(entry->end_time,
> +			next->gate_close_time[tc] = ktime_add_ns(next_start,
>  								 next->gate_duration[tc]);
>  	}

[Severity: Low]
This is a pre-existing situation rather than something introduced here, but
it is worth noting for the multi-entry case that the walk newly makes
reachable.

After taprio_catch_up() walks forward, next can be the same sched_entry that
is still published in q->current_entry and being dereferenced by
taprio_dequeue_from_txq() under rcu_read_lock() only. advance_sched() then
rewrites that live entry's gate_close_time[] above and resets its budgets in
taprio_set_budgets(), and the following rcu_assign_pointer(q->current_entry,
next) publishes the same pointer, so it provides no ordering.

The same thing already happens without this patch for a single-entry
schedule, where should_restart_cycle() returns true through list_is_last()
and next ends up being the same object as entry. In the newly reachable
multi-entry case next == entry, so the gate mask is unchanged and a reader
sees either the old close time with a partly consumed budget or the new
close time with a full budget. On 32-bit hosts the ktime_t store can still
be observed torn, which is also pre-existing. Is it worth a comment that
advance_sched() may legitimately update the currently published entry?
