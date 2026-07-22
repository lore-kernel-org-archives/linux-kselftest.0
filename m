Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D153827F017;
	Wed, 22 Jul 2026 20:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784753797; cv=none; b=JIWmu7KDIQFgUFgiZoym8HRyLBLlXZHTvIKGHxKhmWvhx0AkAspen2ftqjXiujoXLMTqhlx12/HbatNENDyTcnzoqNVnYBIF6+3rhbzKcwsP3BiRdyOwSeQU7wD7ClVo6cpCfXd7L+oQEffkLhvxogfcreL4WwT6gaNU+/RFR5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784753797; c=relaxed/simple;
	bh=81ERXAgJQPPgxyd+PNIn1msxHORx+PJjC1LlTmLEhio=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YV3DG7/na43akdYFO9gU+L1IcccB/moc5s01TatNEOPEgh1rr/IGRxZ+E23/G3V9sOdnycxkIp8JF2I7U6agwbC2sdT/ET0ZsTX3SgTxJWa9Pu6OIkG9motC5OP/J3dM8qv7DuEUYSW3ZJJPbFnghtPIFIUrCinr9yQT30Siags=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LHROoRW1; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LHROoRW1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784753795; x=1816289795;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=81ERXAgJQPPgxyd+PNIn1msxHORx+PJjC1LlTmLEhio=;
  b=LHROoRW1E8W5R3MshcrnhYm5pdLVRuUt2DuNlxi9UO0iKjDG8HzYkc/F
   uC2y/KFwbfhCz/RwJYh2n6cI0mCnGby3fVoCoyMomUpJcrn0PbQ2VVZti
   7jK3KwllZ0AWvnba7ONH/c/1ZsGbj7OKaZ7bzAMfI5p7Sm965+vjvlDeF
   0U7YOED2vQrCyGYMfLzfcOLXsuspqkbtWfsictvdTaeYmaR1mEGpdWV7d
   TyMPO9B3sMXpB7prUuAymdiKxLa85MRQrMYnA8PHDhSOxIk19jdA6rMAy
   /h047S6QcYJ6rtLJHF6XngFLUJJ4LFWW5XU4zDmbGkvOKxS/NTX4DOOQJ
   A==;
X-CSE-ConnectionGUID: aUSb8k6WQuabEjqAAXO1/A==
X-CSE-MsgGUID: baV5aJDCTWeu2r9iOTAc/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96538866"
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; 
   d="scan'208";a="96538866"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 13:56:34 -0700
X-CSE-ConnectionGUID: 2fUtfGdETeqwMmvgdBpACg==
X-CSE-MsgGUID: PM+UyXtDTLmgVhm0murq6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; 
   d="scan'208";a="262529652"
Received: from unknown (HELO [10.241.243.185]) ([10.241.243.185])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 13:56:34 -0700
Message-ID: <62b07c595433ae1d65f2af888c6ffafebd9c2cbf.camel@linux.intel.com>
Subject: Re: [PATCH 2/4] sched/cache: Add PR_SCHED_CACHE prctl for per-mm
 control
From: Tim Chen <tim.c.chen@linux.intel.com>
To: "Chen, Yu C" <yu.c.chen@intel.com>, Yangyu Chen <cyy@cyyself.name>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>, Dietmar Eggemann
	 <dietmar.eggemann@arm.com>, Valentin Schneider <vschneid@redhat.com>, 
 Jonathan Corbet
	 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Yangyu Chen
	 <yangyu.chen@intel.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, Peter Zijlstra
	 <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Juri Lelli
	 <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
 "chen.yu@linux.dev"
	 <chen.yu@linux.dev>
Date: Wed, 22 Jul 2026 13:56:33 -0700
In-Reply-To: <656bbcec-fc0a-4c60-b4ec-c060f800c1cc@intel.com>
References: <tencent_93116D14C771DC8C988C10E3C634BE0CC107@qq.com>
	 <tencent_4F460FBE0B41016D2247455CEE988A90D707@qq.com>
	 <656bbcec-fc0a-4c60-b4ec-c060f800c1cc@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-07-22 at 18:13 +0800, Chen, Yu C wrote:
> Hi Yangyu,
>=20
> On 7/22/2026 5:10 PM, Yangyu Chen wrote:
> > Cache aware scheduling is currently controlled only through global
> > debugfs knobs, but the right aggressiveness is workload and platform
> > specific. A multi-threaded Verilator run is one example: its RSS is
> > large while only a small part of it is hot, so an RSS-based footprint
> > estimate should not decide whether it is aggregated; and packing its
> > threads onto the SMT siblings of one LLC beats spreading them across
> > LLCs on some platforms (e.g. AMD EPYC Turin) but not on others (e.g.
> > EPYC Milan). Such choices cannot be made globally for the whole
> > machine. Add a prctl interface to override the knobs per process
> > (per mm_struct):
> >=20
> >    prctl(PR_SCHED_CACHE, PR_SCHED_CACHE_SET, attr, value, 0);
> >    prctl(PR_SCHED_CACHE, PR_SCHED_CACHE_GET, attr, &value, 0);
> >=20
> > A single prctl command implements both directions, like
> > PR_RSEQ_SLICE_EXTENSION. The attributes are a per-process enable
> > (effective only while the feature is globally active), the two
> > aggregation tolerances, the overaggr percentage (applied where a
> > task's own migration is admitted; group level statistics span many
> > processes and keep using the global value), and an inherit mask
> > selecting which attributes an mm created by execve() keeps. fork()
> > always inherits everything, and the mask itself lives on the
> > task_struct so it survives both, which lets a numactl-like launcher
> > configure a workload and exec it.
> >=20
> > The overrides live in mm->sc_stat with -1 meaning "follow the global
> > default"; GET stores the raw value through an int pointer so this
> > sentinel round-trips without being mistaken for an errno.
> > mm_init_sched() gains the creating task to tell fork (p !=3D current)
> > from exec (p =3D=3D current) apart. A disabled mm has its preferred LLC
> > invalidated at the existing invalidation points, so all group-level
> > statistics self-neutralize.
> >=20
> > Also sync the tools/perf/trace/beauty copy of prctl.h.
> >=20
> > Assisted-by: Claude:claude-fable-5
> > Signed-off-by: Yangyu Chen <cyy@cyyself.name>
>=20
> [ ... ]
>=20
> > +static int sched_cache_set_attr(unsigned long attr, unsigned long val)
> > +{
> > +	struct mm_struct *mm =3D current->mm;
>=20
> As preparation work, should we first decouple sc_stat from
> mm_struct and tie this stat to per-task task_struct? In this
> way, we could have per-task cache preference control and extend
> it to tasks/threads/process/cgroup if needed, which looks more
> flexible IMO. We have a proposal here:
> https://github.com/chen-yu-surf/linux/commit/bd43a0b6dd189d5091fb88630208=
cb7bf67b3165.patch
>=20
> which introduces a pointer in task_struct:
> struct sched_cache_group __rcu=E2=80=83=E2=80=83*sched_cache_grp;
>=20
> > +	bool def =3D sched_cache_val_default(val);
> > +	int ival =3D def ? -1 : (int)val;
> > +
> > +	switch (attr) {
> > +	case PR_SCHED_CACHE_ENABLE:
> > +		if (!def && val > 1)
> > +			return -EINVAL;
> > +		WRITE_ONCE(mm->sc_stat.user_enabled, ival);
> > +		/*
> > +		 * Drop the preferred LLC hint on any change: a process
> > +		 * that became disabled must stop being honored right
> > +		 * away, and one that became enabled re-establishes the
> > +		 * hint within an epoch anyway. This is best effort: an
> > +		 * in-flight task_cache_work() scan re-checks the enable
> > +		 * before publishing a new preference, and a lost race
> > +		 * is corrected at the next tick.
> > +		 */
> > +		WRITE_ONCE(mm->sc_stat.cpu, -1);
> > +		break;
>=20
> After we switching from per mm_struct to per task control, we could provi=
de
> fine-gain control at task/process/process group granularity(similar to=
=20
> core-scheduling)

We are planning to introduce the concept of a sched_group.  And tasks in a =
sched
group can be grouped by mm, or using prctl to explicitly group them togethe=
r.

We could enhance prctl to introduce per sched_group parameters like aggr_to=
lerance*
if it makes sense.

Tim

>=20
> int prctl(PR_SCHED_CACHE, unsigned long subop, pid_t pid,
>            unsigned long cookie, unsigned long type);
> pid argument: the PID of the target task. 0 means "the calling task."
> pid_type : PIDTYPE_PID targets the single thread,
>             PIDTYPE_TGID the whole thread group and PIDTYPE_PGID the proc=
ess
>             group of the target task.
>=20
> And the proposal is here:
> https://github.com/chen-yu-surf/linux/commit/17718b7cef1d03948e9fd3bcd0b5=
a49aba7aae2d.patch
>=20
> thanks,
> Chenyu
