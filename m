Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E783A8758
	for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 22:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788214576; cv=none; b=TY2xjFTDXR7e5MlhxA5Yywb0mxatwPZsrlxrXVtzqko6IdMM4IjbU9GjUOowQfR8AXG981Tr11hokzFuOll3Vyfkq4eeMqjr/3BxutWzZuCpy6jsGJ8n7q4bkpjq1SszFoQJA3tREPEgTMVU1YlbtPEmJwbosjmONqbrkCE26JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788214576; c=relaxed/simple;
	bh=n0uh/N7eWZUb0RjMv828tkY0P84MX7NtYM9Lx3Rv6Ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L6QHU+cM1txU9ihE4E+BC27yViw7rqkZz/+pN7WfwKHp7WA5Ii4PSxdCZKUTj8KVHecsQK7fVflGXQFOeqJ+nXim6W7iCKDS9CDgQ1ro7BEN6JLtRoEiFEaA+jImxaVNHpCRYYcQHmuC7Y4WEcLNtPgnVetiEMkDLOs8zofkTQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=da5qnH1W; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="da5qnH1W"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d944747d41so12665095ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 15:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788214574; x=1788819374; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=itoTfTA7PQdk1phHOoJqHytihyiYJY8mf5sirqQA+ig=;
        b=da5qnH1WO56PfoGb2YbHDEb0pb4p2F0mwlMUXEouj9MY1ri/8D0/oxECfIvORCgy3v
         45WN2K23zpku7GSLctlp/Q6FncpT3etJy8QeuUXtImhVFj3QTE89qbvhZE+TTe1yVcWl
         XP39Ow5SRV56Khrql82EO4TH0OCvshoCb8aHSmhchz/Jf7anD8mb/HPkrWJMubH3zppg
         vUpz38TudVh5DPP46ZR94Rlr0G9qB7oAh2nz4DbqDRVEAfnkumubUSfxljy2DXEty2MW
         8OZWPlFk3CWizA4mSZm+GxOCzUnvaKwZfm7rUdyz/OqsN3vwRu3NtiNZcuNWJGiHAB0l
         bYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788214574; x=1788819374;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=itoTfTA7PQdk1phHOoJqHytihyiYJY8mf5sirqQA+ig=;
        b=b7lTkKKSMNjQAwd5zCHAB+4XSaO6y601EREXX9kEtRGVES46evq1Ng6hR0vi5U6hBo
         qqtsMdgp5TNdRIefSQLrK8SWmkNQD5DhJDK3EVHV5GFTkeDHPTzxywCjL00u8HUiE+jM
         ZsAu7ZeNsAaIW+J95Bz/KumuMFRuEWSOjYyEuUoCi+jaJuCF7tbiXWiIaRdrMTILNZVk
         C9ogO4l4XCho1XLXLp4yxy9MGJdP/wV4sY2VNHDcXcnlqiLpVY5VysrotgCE6R2xXJt5
         r5Hy+hDfLPZaoikc3xxm0LFkZ47AiDksw1j0z5WzFluGdToHuOM88VIRG+dNtxJZMgYx
         TVdA==
X-Forwarded-Encrypted: i=1; AKwUvBymWPy33xXQNTdZpoUh0xZRdoir3exER44hMMPvZ1f4IiT7z0RN3HjJEvSCiL3ghzde9l1gsvivq1P6pk6tFec=@vger.kernel.org
X-Gm-Message-State: AFuF++lsEbQ5PP/1P72nLx7KzB/w2aQ4hiYDYk8q/xj4iLb9tMmM2K6s
	Sgf5K8p0KiNLs9Q1s2nwXXnjyRt5HsIrun4cBlxiKhqBGZO7L1q12YhC
X-Gm-Gg: AYBFou3HugHuoS5WYaUnpaSTFuenRkxkGIMRVObe9aqmc0OB1HejoRgEkcf2jJntGLQ
	4JTT7l0Y4IO0Ik+WQhPJBRdijsfa9Sgoe98+B0d9fCxsz5okmULh0Rfna0VA0KL7m4fjkRwweBH
	XxeurngKA8wYr8YJSQOqsQrsDZSn98+ZiDiFuFMHc3tfMmllXGhmCVi132gR4aoZJ08y1uK1CEe
	jsC9S8rx5h9Iif3PhPMkGB4TtbgRnTkSd1lY17oVuT5wJ1gUXj9UewuORnXs8sukvAew6ZGjnN5
	vGVbeQISKmwtlIOguX/i51eGlwqBjqT5IwtwCrXXqTsVOPoCcavrFmWpuR1kUAQLCL5X8iK5bv2
	PR70I0BvnrbEwktS1eQ2EY8ZWV5ySlBcM5GOouMu7767cUOFJpS8NW6UGpYwxKVaHzoGflGnpBQ
	l9odPaN4rDAiXjkOBkdp4vHM8uWaj/76UhYCqxvKSsmeKweesrl2HOldRuQ/GvziXu1yJIeLFT3
	F3J6g+Bfg==
X-Received: by 2002:a17:903:1850:b0:2d5:e3ce:3988 with SMTP id d9443c01a7336-2d74dddceebmr476446215ad.11.1788214573604;
        Mon, 31 Aug 2026 15:16:13 -0700 (PDT)
Received: from devvm16600.scu0.facebook.com ([2a03:2880:9ff:6f::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f995e60sm33397369eec.22.2026.08.31.15.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 15:16:12 -0700 (PDT)
Date: Mon, 31 Aug 2026 15:16:10 -0700
From: Ziyang Men <ziyang.meme@gmail.com>
To: kernel-team@meta.com, Jens Axboe <axboe@kernel.dk>,
	Tejun Heo <tj@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Ben Segall <bsegall@google.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	JP Kobryn <inwardvessel@gmail.com>,
	Mykola Lysenko <mykolal@meta.com>, linux-block@vger.kernel.org,
	bpf@vger.kernel.org, cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] cgroup: expose cpu.stat and io.stat to BPF
Message-ID: <apX9KtGrmfA7u0zV@devvm16600.scu0.facebook.com>
References: <20260820211758.3393984-1-ziyang.meme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260820211758.3393984-1-ziyang.meme@gmail.com>

Hi Reviewers, 

Just want to follow-up on this patch series. Please let me know the possible
issues and I will fix them. 

Thanks very much!

Best,
Ziyang

On Thu, Aug 20, 2026 at 02:17:54PM -0700, Ziyang Men wrote:
>Collecting cgroup statistics is expensive: the existing method is to
>open and parse a cgroup file for every cgroup of interest. The memory
>controller already has an efficient alternative through BPF; this series
>extends that model to the CPU and block I/O controllers.
>
>Patch 1 adds the CPU kfuncs, and patch 2 adds their selftest. Patch 3
>adds the blkcg kfuncs, and patch 4 adds their selftest.
>
>This v3 combines the two previously posted v2 series:
>CPU v2: https://lore.kernel.org/all/20260818002450.3071325-1-ziyang.meme@gmail.com/
>blkcg v2: https://lore.kernel.org/all/20260817214205.723267-1-ziyang.meme@gmail.com/
>
>===
>Changes since CPU v2:
>- Rename bpf_cpu.c to bpf_cgroup.c and use unlikely() and container_of()
>  for the task_group conversion.
>- Remove bpf_css_flush_rstat() and register the existing
>  css_rstat_flush() in the common kfunc set.
>- Remove the SLEEPABLE mark bpf_cgroup_base_stat().
>
>Changes since blkcg v2:
>- Add bpf_cgroup_css() and bpf_css_release() to keep a controller css
>  alive across the sleepable rstat flush.
>- Add an RCU-protected checked css-to-blkcg conversion and make the blkg
>  iterator take the typed blkcg pointer.
>- Use the existing css_rstat_flush() and remove bpf_blkcg_flush_stats().
>- Do not expose root io.stat values.
>
>===
>Changes since CPU v1:
>- Make the rstat flush generic, move it to rstat.c, and make it take a css.
>- Expose cgroup_base_stat directly instead of repacking its CPU times.
>- Replace the throttled-time aggregation kfunc with a checked RCU cast in
>  the CPU cgroup BPF code. The cast preserves the verifier type needed for
>  the BPF program to perform the per-CPU sum itself.
>- Remove the scheduler changes.
>
>Built with LLVM. Pass test on v7.2-rc5.
>
>Ziyang Men (4):
>  cgroup: add BPF kfuncs to read a cpu cgroup's stats
>  selftests/bpf: add cgroup_iter_cpu test for cpu cgroup kfuncs
>  block: add BPF kfuncs to read blkcg io.stat
>  selftests/bpf: add test for blkcg io.stat BPF kfuncs
>
> MAINTAINERS                                   |   1 +
> block/Makefile                                |   3 +
> block/bpf_blkcg.c                             | 138 ++++++++++
> kernel/cgroup/Makefile                        |   2 +
> kernel/cgroup/bpf_cgroup.c                    | 100 +++++++
> kernel/cgroup/rstat.c                         |  54 +++-
> tools/testing/selftests/bpf/cgroup_iter_cpu.h |  22 ++
> tools/testing/selftests/bpf/cgroup_iter_io.h  |  17 ++
> tools/testing/selftests/bpf/config            |   4 +
> .../bpf/prog_tests/cgroup_iter_cpu.c          | 259 ++++++++++++++++++
> .../selftests/bpf/prog_tests/cgroup_iter_io.c | 254 +++++++++++++++++
> .../selftests/bpf/progs/cgroup_iter_cpu.c     | 113 ++++++++
> .../selftests/bpf/progs/cgroup_iter_io.c      |  74 +++++
> 13 files changed, 1037 insertions(+), 4 deletions(-)
> create mode 100644 block/bpf_blkcg.c
> create mode 100644 kernel/cgroup/bpf_cgroup.c
> create mode 100644 tools/testing/selftests/bpf/cgroup_iter_cpu.h
> create mode 100644 tools/testing/selftests/bpf/cgroup_iter_io.h
> create mode 100644 tools/testing/selftests/bpf/prog_tests/cgroup_iter_cpu.c
> create mode 100644 tools/testing/selftests/bpf/prog_tests/cgroup_iter_io.c
> create mode 100644 tools/testing/selftests/bpf/progs/cgroup_iter_cpu.c
> create mode 100644 tools/testing/selftests/bpf/progs/cgroup_iter_io.c
>
>
>base-commit: 3b5f4b83c4abc0c9b0a7b9e2b44e816611b7f2ec
>-- 
>2.53.0-Meta
