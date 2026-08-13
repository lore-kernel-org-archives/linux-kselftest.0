Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BD53ACF02
	for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 18:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786647531; cv=none; b=DpRnw5MRuZEkL/o6brDhQM0QHaHFsdhYxO/owmEA0LlxasR6hF8SQ8csfLFblh0Iw/2VZEih96lN21uZUWbBQ9PbCHfvN0t64YoMoRqZy1yV23LAnMFs+v8JcmOtiy6Ekjgy/B7EHhGxHcsXbWfYz+1c8uAqXime4jYk8w73azc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786647531; c=relaxed/simple;
	bh=ieT3j4ATm+VvwOP6ZEo+gWzrvv6Thjmvaatd82ACSEs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=he/jMpHHxVlG0ZYJQrOax/0ZBkPULLwtZR5DlsQgFdow4Tvr0c0nd0kPKwsK1QjGkyPUBGUGZINUZw17e1qTj462I4cq1VQG4Pkm5CmCfghLW1thn76qJj/nscXBqlDFGjWluAMc41k/nL9Jk2+9LJMoE49ZA0xwENLO/xu9+xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pHabd6FV; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pHabd6FV"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38e08baf860so170124a91.2
        for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 11:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786647529; x=1787252329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DNrC+JRTptWjKfS940kfYbykFXy92wCoTM6c2X2KQos=;
        b=pHabd6FVq2kM0yDo4CRUVorADTmvSqg5lj/4DjK+t4U/plVyYl7ek1uXqLmdEupZwV
         01RsgIsv9gfd9sLvpr8c1iKzJIjrL1yuVkP6DmsVv4YxGCtINv4hDYTgZB3aycZSbcnY
         NgEXCzcCMa91DeVOAAnGusdhRLPSV9joXjVRg8vHRMtdBHuedHHcoViT6uzU2K4i/lKR
         dDRjWOn0mzTP7ph8bCKyJt/V29ihKqURYZrf5wXxXODGB0huyUowwxeeMNBaIhQywcIe
         aN25LOiANQRCUEO/NEuyEe4Mm91KM/y34L4NJbw0gRzqkl7ZlGm1l6zP5Yib4Gqo9wbF
         J4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786647529; x=1787252329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DNrC+JRTptWjKfS940kfYbykFXy92wCoTM6c2X2KQos=;
        b=iUCBzKB7oNn164vGAoZeQVpcbXveeZ/sUeSH4P3lcde8IL4wT6h1utWwp3p3DQ+hOX
         GBNT/TucypYsOSAQ9R716bZzez0VoCEDANs0B0BvL9LysajL3rdVsnNvB6lFg108UV84
         mlSWLNdzQQuLnzcl7gQrT2D+1FtTBZfBAf4lx3j6RI0xG+ooDWMERrqhhYcN9S/eRMhQ
         tNGg/uNMyJagCiqgv8WXPHhUi+tCh+3+QZuRkwZ/V7qcUX/lb4IqdhdCyxaXeqy/M0lJ
         2oIcZmYYyj+8JywZs3PRrQHcxdcBpOFLhOtZYU8MJKNLbEWihNrdZNL88Vo267hI6k+R
         ACsg==
X-Forwarded-Encrypted: i=1; AHgh+Ro9IzmmJsC/YilAULxDw7VE8/nT+Va9TWnv12SY8tqR1ZVW6Q+ZNXcud5Ab7igYV8MFGkxRmTjHGQ3FQs+pgKM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSQEEfu5N1L0figXXb1JxZu9Zm6V2xmtvv8TxmFX0sLSpmwtRi
	zBtmcmgXUDZPUVILhtoXh0WyJtXCHgkdWOrOPbLH2KOMendE+oRAoEFZ
X-Gm-Gg: AR+sD10jRvxKVso8GhPtdxxrjyrkgvIUyXK5BS3MMAlVln2gIjl3S33j71grj6xMV6P
	zp/WZWEdC8edpCyGuQG2vgIjicIjg5Dc472IIpYpxg3lm0duJVozBl2HUYGc9dbM/YTdudRs3gT
	sGf+/BLhcbC3g2EYkdbc/6qi0Cw6lRHVm3Xou5bHGHIhXMqbMkSP8z2Sg6MsagqhlPIRGFvqSbq
	IkzvvowSlx/cJO9LyZik1prll+STAIMgYTI1cIqvrjs+rpJsexr7iK0kH+10ZhjjO6amxb/aQvX
	KVeu6tLgRD3/qaK6K70f7CW73PxHatUV2fCbIQtk4iCGF67tF2mTc0N3TCs4H9JRJVEhx5gOBrL
	/baLpDxyegOHLb8raiozu4yC7p8grz0Qs7NEakGp1hfD0FTw2vyapIJH9T4L+OvGIhKwtDtmOoe
	BvYl8jYTmnrBziiRun3mTQAX1mQIoJpuNypnAJoJA0G36+0unRUxbxXLloAl6vnpwJTFE=
X-Received: by 2002:a17:90b:5447:b0:38e:2860:253f with SMTP id 98e67ed59e1d1-3933e5c8557mr24629a91.12.1786647529381;
        Thu, 13 Aug 2026 11:58:49 -0700 (PDT)
Received: from localhost ([2a03:2880:9ff:6f::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm943437c88.2.2026.08.13.11.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 11:58:48 -0700 (PDT)
From: Ziyang Men <ziyang.meme@gmail.com>
To: Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Ben Segall <bsegall@google.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Shuah Khan <shuah@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	JP Kobryn <inwardvessel@gmail.com>,
	Mykola Lysenko <mykolal@meta.com>,
	Ziyang Men <ziyang.meme@gmail.com>,
	kernel-team@meta.com,
	bpf@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] cgroup, sched: add bpf for cgroup cpu controller
Date: Thu, 13 Aug 2026 11:58:44 -0700
Message-ID: <20260813185846.1216892-1-ziyang.meme@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the title suggests, this series adds bpf kfuncs for the cgroup CPU
controller.

Motivation:
Collecting cgroup statistics is expensive: the existing
method is to open and parse a cgroup file. memcg already has an
efficient alternative through BPF; this series extends that idea to cpu.

Design:
- Leave reading the CFS bandwidth counters to the BPF program. They are
  plain fields of tg->cfs_bandwidth, so they need no kernel code.
- Add one kfunc to compute the throttled time. This is necessary because
  it is a sum over every possible cpu, which a user cannot do itself.

The only part it touches the scheduler part is to discard the static for
throttled_time_self() in order to use externally.

Patch 1 adds the kfuncs (kernel/cgroup/bpf_cpu.c); patch 2 adds a
test_progs selftest.

Tested on VM with v7.2-rc5. 

Ziyang Men (2):
  cgroup, sched: add BPF kfuncs to read a cpu cgroup's stats
  selftests/bpf: add cgroup_iter_cpu test for cpu cgroup kfuncs

 include/linux/cgroup.h                        |  15 +
 kernel/cgroup/Makefile                        |   2 +
 kernel/cgroup/bpf_cpu.c                       |  80 ++++++
 kernel/cgroup/cgroup-internal.h               |   3 +
 kernel/cgroup/rstat.c                         |  42 +++
 kernel/sched/core.c                           |   2 +-
 tools/testing/selftests/bpf/cgroup_iter_cpu.h |  22 ++
 tools/testing/selftests/bpf/config            |   3 +
 .../bpf/prog_tests/cgroup_iter_cpu.c          | 259 ++++++++++++++++++
 .../selftests/bpf/progs/cgroup_iter_cpu.c     |  53 ++++
 10 files changed, 480 insertions(+), 1 deletion(-)
 create mode 100644 kernel/cgroup/bpf_cpu.c
 create mode 100644 tools/testing/selftests/bpf/cgroup_iter_cpu.h
 create mode 100644 tools/testing/selftests/bpf/prog_tests/cgroup_iter_cpu.c
 create mode 100644 tools/testing/selftests/bpf/progs/cgroup_iter_cpu.c

-- 
2.53.0-Meta

