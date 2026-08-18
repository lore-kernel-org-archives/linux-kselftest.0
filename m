Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3261929E11A
	for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 22:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787093081; cv=none; b=BISM00+1Lr8xdfeeZA/jVVUwD6ZKduZBZ++C5Lv3LkJMbM4KLr/n8gFM2cdzj5Q4IveHp7JQ09c6zUGWSHTIWElVEOT4wZETK3mjf/0Z9+DyHA6DYL5ULZq/XokdV2mxm6z+JrJi8jWB34kdib5sSTZoRIV/rjATf+6G/lRblog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787093081; c=relaxed/simple;
	bh=h0lKE86vamg5l2QE7rks9oOFKc3rsdKjudbu/CLCImg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h3d8cqm63gBjFMXe9KsiNy9cNmdW2qbXyBKK4q5sGt9YrH0C+uMpSzIXTeswldDpXSsrAhF1hf+ZS31mqvEb9m7cecG6NpUa/u0yMkDVXptbkdX6ItVsnfTossTN8BJmn6bn70kRtGdkbvLJiwBk2PbxN22pbDXo74fqfijTXn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQ3rZSlm; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQ3rZSlm"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso597724a91.2
        for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 15:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787093079; x=1787697879; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wKl32eYwuQc+ijyeGlAXus14S3y7YMOIliN5aaJMCDU=;
        b=NQ3rZSlmLdNhzoaRNjzqsPUxTijHDIDtNnZk1fqsWuhJj4CbjaZ5H+zLrRA9bKpz40
         deYUu8X8Mdy6Wrfauf4W33l0qkOFtR1Lnrwz+HhU4mAOe14j9yptbtC2c5GBXkrvfIXE
         05jdD/30+Jck1PUyf1Jgl329DKDuGPt2kp/KQ7fRmR0ig3XqFiJbvm0BVStJjHAmVuBa
         abveA5KZ3yH+yV1n0yhhhhMTgDTTVmHtoTLjkyuRR61a2HpEGs4xDXDzUMfZcuobOHOM
         3+P3to2ZGNfyhprZUJUjLiefH/Gyp0BylsoaNoUJpIXlY9DPukfYYd98zJnOSed21d1j
         bMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787093079; x=1787697879;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wKl32eYwuQc+ijyeGlAXus14S3y7YMOIliN5aaJMCDU=;
        b=m1P730/wYz8PtD3rqcFFK3qaH3QmwQp2mVifVy8MabVA3vd+auX/2FMbK7J/5R4frj
         vN0HVxLYkQGW4VC4P3X+X4gvCb6LEdLDS4TfTElK0CQZb65JNfCESZQ39z07sjeGgpwc
         z78qpSNRMX2hzGUn427KgZj6TTeBwRcSSIepNIcqJnymgduv84aJ1VdEot8h6wMq/XZu
         gEkLV5KaFtX7sEBbKGFgFaImTvsF27zxLp1tdie7xSOmE/tS39RM74gpSWkBCl5TvvYA
         ma+qtSpVe3uUM3doMEpW+pVCsaNIqijAVEqokcXI0qLKVDxlAlg3IlnwnCbTMGEfBVVt
         +w5Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr1idBewc6EPCeiLY0VamQQD2Uvriuu1w5rCsaHpEsTBYTIXe06mzMo7v+sb8DJQ6b0Nb6wJR+P+ghw0A5zDR0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTip93gYIXVD9fPsvjcjUXNOaL7djcuFF5jpUZ3UbYWTZilFtS
	VpQTskbnPkISb46u5AZqAeFShFEDVqVMvUz/Qm4xjXAHKdCx+Klnp8cA
X-Gm-Gg: AR+sD10cXp63/1lrD0BDbdgoXHprJzC+hfRtVu2jE+wYhWu9fD+gEI7XSGTeeWenNf+
	z/G/D4FMwLUmSK9dZNA4m94mav8cmHxdUcezN9zFo//bmPZHXtXLX7rJpwMAsZ+em5Ve4tub+De
	EthsF47oQIYAx/MOiDDyXtgPGJK4w0re0tWuiNYJYXMIU1IPX953ovUiXVub+A+VjSfwNpj3hr0
	YZXwcBySzk3CsuF9Hna6pXTmjY1UHOWFPFRIEBx4EQRy/eNXy32Dx4wCbF8PteEyRs/cyQqYdRr
	gjlzbzAiVEK/GIQ9eMZ/VcDtoW5Yu3xcF//VDhAlEF6zclpaX9HFUjicNHJQk4ZKRdjjFoKr8T1
	O38BbKGp4W/pCs1gFW7azgnmXllMh9HYc81cFRP2IJMTt5prZw3gzrkqrzOxH36ag7qCwfHgEkw
	zzXF++q2zMjxeWCKlIfirhzVeMr7rVV2Uta5+3D6D2kvUJZwb98gtnuISJzxALAmuY0gB7JdRJ4
	v3zRnHt
X-Received: by 2002:a17:90b:1804:b0:38f:dec8:f7e9 with SMTP id 98e67ed59e1d1-395810b5a15mr370692a91.12.1787093079418;
        Tue, 18 Aug 2026 15:44:39 -0700 (PDT)
Received: from devvm16600.scu0.facebook.com ([2a03:2880:9ff:6b::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416aea2429sm448334c88.15.2026.08.18.15.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 15:44:38 -0700 (PDT)
Date: Tue, 18 Aug 2026 15:44:36 -0700
From: Ziyang Men <ziyang.meme@gmail.com>
To: Tejun Heo <tj@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Shuah Khan <shuah@kernel.org>, kernel-team@meta.com,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Ben Segall <bsegall@google.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	JP Kobryn <inwardvessel@gmail.com>, bpf@vger.kernel.org,
	cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] cgroup: add BPF kfuncs to read a cpu cgroup's
 stats
Message-ID: <aoTgVOTxsEbFXTp2@devvm16600.scu0.facebook.com>
References: <20260818002450.3071325-1-ziyang.meme@gmail.com>
 <20260818002450.3071325-2-ziyang.meme@gmail.com>
 <aoSTaFwsVEoNW01D@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aoSTaFwsVEoNW01D@slm.duckdns.org>

Hi Tejun,

On Tue, Aug 18, 2026 at 07:16:24AM -1000, Tejun Heo wrote:
>On Mon, Aug 17, 2026 at 05:24:49PM -0700, Ziyang Men wrote:
>> +++ b/kernel/cgroup/bpf_cpu.c
>
>Probably not the best file name. bpf_cgroup.c or maybe just put it in
>cgroup.c?
>

bpf_cgroup.c sounds good, I will rename to it.

>> +/**
>> + * bpf_css_to_task_group - Cast a CPU controller css to its task group
>> + * @css: CPU controller css
>> + *
>> + * Must be called under RCU.
>> + * A C cast does not give the verifier a task_group pointer. This kfunc
>> + * preserves the task_group and per-CPU types needed to read cfs_rq.
>
>The fact that this is used for per-CPU types now probably won't age well if
>this grows more usages in the future.
>

Yes the major usage of this function is to enable the bpf side to compute the
throttled_time meanwhile not touch the codes in scheduler.

>> + *
>> + * Return: The task group, or NULL if @css belongs to another controller.
>> + */
>> +__bpf_kfunc struct task_group *
>> +bpf_css_to_task_group(struct cgroup_subsys_state *css)
>> +{
>> +	if (css->ss != &cpu_cgrp_subsys)
>
>unlikely()?
>

Ok. Added.

>> +		return NULL;
>> +
>> +	/* task_group embeds css at offset zero. */
>> +	return (struct task_group *)css;
>
>container_of()?
>

Ok. Added.

>> +/**
>> + * bpf_css_flush_rstat - Flush a cgroup subsystem's rstat data
>> + * @css: cgroup subsystem state to flush
>> + */
>> +__bpf_kfunc void bpf_css_flush_rstat(struct cgroup_subsys_state *css)
>> +{
>> +	css_rstat_flush(css);
>> +}
>
>Why is this necessary? Isn't css_rstat_flush() already exposed as a kfunc?
>

Ok. Will remove it.

>> +/**
>> + * bpf_cgroup_base_stat - Read a cgroup's base statistics
>> + * @cgrp: cgroup to read from
>> + * @out: zero-initialized output in nanoseconds
>> + *
>> + * CPU time is adjusted as for cpu.stat.
>> + */
>> +__bpf_kfunc void bpf_cgroup_base_stat(struct cgroup *cgrp,
>> +				      struct cgroup_base_stat *out)
>> +{
>> +	if (cgroup_parent(cgrp)) {
>> +		__css_rstat_lock(&cgrp->self, -1);
>> +		*out = cgrp->bstat;
>> +		cputime_adjust(&cgrp->bstat.cputime, &cgrp->prev_cputime,
>> +			       &out->cputime.utime, &out->cputime.stime);
>> +		__css_rstat_unlock(&cgrp->self, -1);
>> +	} else {
>> +		root_cgroup_cputime(out);
>> +	}
>> +}
>> +
>> +__bpf_kfunc_end_defs();
>> +
>> +BTF_KFUNCS_START(bpf_rstat_common_kfunc_ids)
>> +BTF_ID_FLAGS(func, bpf_css_flush_rstat, KF_SLEEPABLE)
>> +BTF_ID_FLAGS(func, bpf_cgroup_base_stat, KF_SLEEPABLE)
>
>Why are these SLEEPABLE?
>

The css_rstat_flush() calls might_sleep() and cond_resched().
The bpf_cgroup_base_stat() takes an rstat spinlock_t, which can sleep on
PREEMPT_RT.
So both marked as SLEEPABLE.

>Thanks.
>
>-- 
>tejun

Please let me know your concerns. Thanks!

Best,
Ziyang
