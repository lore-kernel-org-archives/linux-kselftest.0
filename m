Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07D43806C2
	for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 23:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787097563; cv=none; b=dwo/M6zzIjmiq+AVneKRrv9j9Kclb3GmiZY4XnmwzEargYIv4OZMa9NiitRQqOTosbna/dnHqjYfC7JjpmRRp9Rxafa+unG7+EX1bC3USluBQmo7jb2ZJQ4RXZTN4Ny9o0sNq0sAeVj30gnPtIHDh//Q9ElhEG2icNXB1Ky3Z/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787097563; c=relaxed/simple;
	bh=3/FC3+rTB7zenyYUb/SAoT6ao55r7Msw4PLNzKlY1/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YJu24S5aGjjTnzmAwKOotPdHRaopVdEN6EYQYn0+Pxy3RxXOHyNzjMBNR/JqnMz6nJC68lujHKmv/+zMaRxYgaT/MM6fCuVo09lIqHtK9APUOAWs3szBLxAYHRxJtEcZhnfD2OBXaxWHSg9rbjEUo1RnKQzB4+zwKPfsgZuL3bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AvGalExL; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AvGalExL"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso4473865ad.2
        for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 16:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787097561; x=1787702361; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9UA11QdsDBQZZwlQ8Rx/R/X7VYyb6gM0uXTt1nPuef8=;
        b=AvGalExL57zB9dAd6e/zsohPJQ4EjxjlxdyXQ35qSFnq6v+xVESozfqfHbSWZc+UQc
         rILD5x1YHKhM+izDD8POVAwJ40uIjHA2uDwYoBYagrxtS6UIdY6bjBeE1Nht4vOIAxWt
         3ILnmro/pldKVNBIggkZtXV+Xxar1l17naq99FSE+dJc9gmg+YnyB37c5NEKO/VMWKb5
         qmauLF2iC4LlJPCNWpXAPgEf0poz8gROp3vXR2IBir//40deagwXupiw2EZbKkRCx/9j
         T1XmMABCtiZGzL7Dau7QC5h/Yuqgjbu41rCMSpm68ohfwcDzhDevediqrO5T4/LKplUa
         zTAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787097561; x=1787702361;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9UA11QdsDBQZZwlQ8Rx/R/X7VYyb6gM0uXTt1nPuef8=;
        b=S+CGE4qFAP88whTKdtdWstZ1oyBJkEAkzLbOq4F0twJoIBcKMiPOt+GJiBXM5cXvIl
         sNn909dQXEM4pMWHSJMNn+iDXFxjBr+Ksdof9cHcXbKZgMYbJvSOJyJuNWCUsTZ6jTmZ
         Z1pZVqidLzBF7bzHWkHR3oOP6MMfY9A8+AyXr74ZpxQst+moktAVJAq54PP3HtNSv+69
         R7hftK1O5Ww4zNw6w55DRmyMNk+3km3/8c2A83D+vghzyxr/I3cIv6cLZkjrsGox3GcM
         YLXbsKu2CHnGOTjzvDTaXoQs62zfjcJwGpmhs2kKPLAklmDk4r6gVWE6FGO8AC5KpNvq
         ZtgA==
X-Forwarded-Encrypted: i=1; AHgh+RrPTU/sMtX5v3rqC9yyfKfq4hTV5XfAIRazsIYD0r0HLBc8XfCN36ug9c+E2JVRHMj1OSlFUmCyw1MUHWcCl0c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJD5j3BMtvlDkxsJHf+G4Xk8NTou5xs19L6av5w7mRWChlZpBt
	PnvEiwo6QjbTrWKZJI8GbDfgfw5g6fzYw8p1RGenRTZ2Hck36ZLRWAfy
X-Gm-Gg: AR+sD10UlODyNwmHfHlqrYrqUY7OoUEE/xb+mPwFiU7IYoxiaOzi/3YaRMa9K7Uf+TQ
	6NVZqbB+X4Z1bthESxSuBcCVNp7dBc7giMEiXqVsR/jLaJdwML0penF3yHjvXubb7TjO64dTAE/
	WLU9YSog4ibUc3CVkQDEiJedyBWhCp/8hBVbfxV3PHlptUGkEBfxP+Gb6LVtNZxjjcWxJBGFedO
	hizayf79xjXcg0uaoxCMOj0u9DbYs3BXCq5fpDhfQGznZ4BYuLF6hYume1Xcsu/BbDZ/B7grT6Q
	g+C8lBwzbuI/UQDQzoGoTmsvNK2FmQtmTd7OUjFmNR7hl/GAYaYbEJoxWx3KAy8WCJMNIx5ZG1Z
	QrYKtieWfQZrYRMEMj/KB0aTVJgVPG8NJki0PQeIrttn+CfFD0trUFe1HDFG0jagytA00vSxpIh
	RZUJCmF1XHuUOQ2gwE99R0et7qJaxTCM6pCmG0G7/WXxEtGWyv6+jV8efgrbNSZerBJfoDFopJT
	wpqaQaVQP17tqmSQ6I=
X-Received: by 2002:a17:90b:4a4b:b0:38f:240d:b857 with SMTP id 98e67ed59e1d1-39580a4d03cmr971369a91.2.1787097561159;
        Tue, 18 Aug 2026 16:59:21 -0700 (PDT)
Received: from devvm16600.scu0.facebook.com ([2a03:2880:9ff:73::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae5f1ffsm1121775c88.13.2026.08.18.16.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 16:59:20 -0700 (PDT)
Date: Tue, 18 Aug 2026 16:59:17 -0700
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
Message-ID: <aoTx1eaNNJ+xrUq1@devvm16600.scu0.facebook.com>
References: <20260818002450.3071325-1-ziyang.meme@gmail.com>
 <20260818002450.3071325-2-ziyang.meme@gmail.com>
 <aoSTaFwsVEoNW01D@slm.duckdns.org>
 <aoTgVOTxsEbFXTp2@devvm16600.scu0.facebook.com>
 <aoTg7ybddqzoZbz7@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aoTg7ybddqzoZbz7@slm.duckdns.org>

Hi Tejun,

On Tue, Aug 18, 2026 at 12:47:11PM -1000, Tejun Heo wrote:
>On Tue, Aug 18, 2026 at 03:44:36PM -0700, Ziyang Men wrote:
>> > > +BTF_KFUNCS_START(bpf_rstat_common_kfunc_ids)
>> > > +BTF_ID_FLAGS(func, bpf_css_flush_rstat, KF_SLEEPABLE)
>> > > +BTF_ID_FLAGS(func, bpf_cgroup_base_stat, KF_SLEEPABLE)
>> >
>> > Why are these SLEEPABLE?
>> >
>>
>> The css_rstat_flush() calls might_sleep() and cond_resched().
>
>I see.
>
>> The bpf_cgroup_base_stat() takes an rstat spinlock_t, which can sleep on
>> PREEMPT_RT.
>
>Is this actually required? This doesn't really make sense to me. Shouldn't
>what SLEEPABLE mean change on RT kernels instead?

Oh sorry, I didn't notice that.

I might be wrong: this function calls the cputime_adjust(), which in turn
acquires raw_spin_lock_irqsave(), so there would be NMI deadlock in the
perf_event program. The __css_rstat_lock() take the spin_lock_irq() as well. So
maybe a SLEEPABLE tag is still necessary?

Please let me know your concerns. Thanks!

Best,
Ziyang

>
>Thanks.
>
>-- 
>tejun
