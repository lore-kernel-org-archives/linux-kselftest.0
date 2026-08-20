Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A0C429CC6
	for <linux-kselftest@vger.kernel.org>; Thu, 20 Aug 2026 21:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787260691; cv=none; b=B0lYChrwg7HiT3LCurGPOf0RsYiqeBp2qOXvFiGsYJfs7tawENf+KhqcHwVs27Rd43pKoKXcWJVkvLNsgS42N+WtcDjLNTjpOT1DlF4clqWkgUVgnwoWikz2gYjWBOXl8bb+Nf22JX+QhO2B9KIRizpN3vAew3b8/goYTKxhMgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787260691; c=relaxed/simple;
	bh=s+xHRLwug+91QseSF1hFyaeGpZzipT2GIECh7LNsCVM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ANs6KawblxEAmlqn5g/cI5zzZWNQ3oprMpYxnMGsKv+qu8EuMFimpn3bYj6ABH3ImNXnncSxS6o3sKZoyzmEdtDbYHw3HpPiffWiAlm5OCGfFKteWs8U2AQikYeggBB9f/SL98kfmjkhUej6STyi9qxSysj6JJSAZs3uDM2RQCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nesmngrv; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nesmngrv"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38f620399a0so223814a91.2
        for <linux-kselftest@vger.kernel.org>; Thu, 20 Aug 2026 14:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787260681; x=1787865481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2g8PaBDQGIwXBrVnO3bpMNhMlHqmGaOGXY4xkQnDUJU=;
        b=NesmngrvCZkCCySq7z+HuRPKFmZlBpHXR7OtWO2hMr46U0KCnWqX22JxNZHBhQZBFx
         Jv8D8SH0zM+gg3jqLdjsO0p7dDLWGH8u0F3y0XIqiXamLL9CvhggUHKLgT4Ba6qAj6rD
         imzo8F258jVTkQP2VbCe1KrV2/i9E9PLH0viRY/ZHKgQvQ2Ntgekr3CJGdyMHf0T2K2A
         67Hys5Zprimmf9WO7gZa+UFuK+L4nlWzFwqCBAX/hTLh7NOZp8B2N1hE9vNZjvIPr1RL
         niH+5Rko7MbkVvuubAd7ylgW/rHInkjdiIlhJJ7aLU1WVbIK7UY7Iq+CCtGrexaNcrEF
         MgsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787260681; x=1787865481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2g8PaBDQGIwXBrVnO3bpMNhMlHqmGaOGXY4xkQnDUJU=;
        b=r21FNmVphkOgH/c0Iepvw6sdDi5rfj7bKvJ77HiV/7nMU64/wd3Owz/CSbGyriCzsW
         Eiz/HYmYJ93WiQ0BOuMs4PQqYClkOwdY4pEJoOTLTVxv1e2Ut6nG+ridSYK+FZcoeeBE
         2eAuxowX3YTDSHAi7K3NdDOE7HGyW5HjHoNFnCgw2diJ0+/bBvdRPdw1FDnwfUiiN84T
         V6i34dRE1UAMkWRMsWFSgx2S3o5ZbYQA3m/SDTNLwCuTeUnYXcQH79FbS+m7mqKTICER
         sUVtf0bcxW89Kgu+6xYiIi7Z0UCupGriayE9JbUHSRxcaMYQWcrkz3zm5nBPH0KS/Wvl
         8Zeg==
X-Forwarded-Encrypted: i=1; AHgh+RoKRVeSG6xXLi9DKHsBRytAW3USRSJ5KXe9TQ/Fj0WTpYNehpc3XhxtxVgZAqFgM0T35nngYtp0x3OD/xWedA8=@vger.kernel.org
X-Gm-Message-State: AFuF++ndnOW5+szxgAw5A7ti3Vg4WEpeSkChi6hQhAgH76Upl7icy9jR
	AOS6f4lO1n0zfzgn6wPd9kCDOFp68TRfV0pbcnBjAAzVn7lpzVuwWh0V
X-Gm-Gg: AR+sD123dmYQAaHl5Cgr72vPIySaNzy0XMtosUFF/0GzmDx+8qOgqdgAWM7bj4TbR0r
	zdYEOMbYnUge8iQTBaLlEBa+q+Jw+IZypZWqevd1U2M8wr56tvsXtvm98VNqdaGcesbYfwijfmE
	k/Ppyg+gx+hhos1nN2Ml58naVnsqGgVVh1SQIM0NAWw36Yl7eBOORSL0iEbauLSt7dZP2rKEWKs
	5EH2S1DcDEh1ZyY+n+XG6bzncIFDikTwF5IYh98Cj3d2Tygb+SyufAmHpfxlE5ZYkdv2oAjMjRi
	JkNl9WTqdVPr0oHOrm0DreuJwvJnWaLlhS7hi1xyfGbQAzpQ8W6O3d1Y6T4dSLQcv93triTb/tx
	jBbb0kjthZ9g5s3R+cr8AuMdHj0WzQuDS4ORSSQ7hDexteaTSClOypvmbjQNyt6AXsKcYurTmzq
	y3KEiEFURBGBRNzwBMgssXd8JesRIM6upK39YqNLPb8HdPV3rTjG7ZhWw=
X-Received: by 2002:a17:90b:1c0a:b0:395:4290:46e0 with SMTP id 98e67ed59e1d1-395c336c815mr1918498a91.5.1787260681317;
        Thu, 20 Aug 2026 14:18:01 -0700 (PDT)
Received: from localhost ([2a03:2880:9ff:41::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae1416dsm26285630c88.11.2026.08.20.14.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 14:18:00 -0700 (PDT)
From: Ziyang Men <ziyang.meme@gmail.com>
To: kernel-team@meta.com,
	Jens Axboe <axboe@kernel.dk>,
	Tejun Heo <tj@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Ben Segall <bsegall@google.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	JP Kobryn <inwardvessel@gmail.com>,
	Mykola Lysenko <mykolal@meta.com>,
	Ziyang Men <ziyang.meme@gmail.com>,
	linux-block@vger.kernel.org,
	bpf@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] cgroup: expose cpu.stat and io.stat to BPF
Date: Thu, 20 Aug 2026 14:17:54 -0700
Message-ID: <20260820211758.3393984-1-ziyang.meme@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Collecting cgroup statistics is expensive: the existing method is to
open and parse a cgroup file for every cgroup of interest. The memory
controller already has an efficient alternative through BPF; this series
extends that model to the CPU and block I/O controllers.

Patch 1 adds the CPU kfuncs, and patch 2 adds their selftest. Patch 3
adds the blkcg kfuncs, and patch 4 adds their selftest.

This v3 combines the two previously posted v2 series:
CPU v2: https://lore.kernel.org/all/20260818002450.3071325-1-ziyang.meme@gmail.com/
blkcg v2: https://lore.kernel.org/all/20260817214205.723267-1-ziyang.meme@gmail.com/

===
Changes since CPU v2:
- Rename bpf_cpu.c to bpf_cgroup.c and use unlikely() and container_of()
  for the task_group conversion.
- Remove bpf_css_flush_rstat() and register the existing
  css_rstat_flush() in the common kfunc set.
- Remove the SLEEPABLE mark bpf_cgroup_base_stat().

Changes since blkcg v2:
- Add bpf_cgroup_css() and bpf_css_release() to keep a controller css
  alive across the sleepable rstat flush.
- Add an RCU-protected checked css-to-blkcg conversion and make the blkg
  iterator take the typed blkcg pointer.
- Use the existing css_rstat_flush() and remove bpf_blkcg_flush_stats().
- Do not expose root io.stat values.

===
Changes since CPU v1:
- Make the rstat flush generic, move it to rstat.c, and make it take a css.
- Expose cgroup_base_stat directly instead of repacking its CPU times.
- Replace the throttled-time aggregation kfunc with a checked RCU cast in
  the CPU cgroup BPF code. The cast preserves the verifier type needed for
  the BPF program to perform the per-CPU sum itself.
- Remove the scheduler changes.

Built with LLVM. Pass test on v7.2-rc5.

Ziyang Men (4):
  cgroup: add BPF kfuncs to read a cpu cgroup's stats
  selftests/bpf: add cgroup_iter_cpu test for cpu cgroup kfuncs
  block: add BPF kfuncs to read blkcg io.stat
  selftests/bpf: add test for blkcg io.stat BPF kfuncs

 MAINTAINERS                                   |   1 +
 block/Makefile                                |   3 +
 block/bpf_blkcg.c                             | 138 ++++++++++
 kernel/cgroup/Makefile                        |   2 +
 kernel/cgroup/bpf_cgroup.c                    | 100 +++++++
 kernel/cgroup/rstat.c                         |  54 +++-
 tools/testing/selftests/bpf/cgroup_iter_cpu.h |  22 ++
 tools/testing/selftests/bpf/cgroup_iter_io.h  |  17 ++
 tools/testing/selftests/bpf/config            |   4 +
 .../bpf/prog_tests/cgroup_iter_cpu.c          | 259 ++++++++++++++++++
 .../selftests/bpf/prog_tests/cgroup_iter_io.c | 254 +++++++++++++++++
 .../selftests/bpf/progs/cgroup_iter_cpu.c     | 113 ++++++++
 .../selftests/bpf/progs/cgroup_iter_io.c      |  74 +++++
 13 files changed, 1037 insertions(+), 4 deletions(-)
 create mode 100644 block/bpf_blkcg.c
 create mode 100644 kernel/cgroup/bpf_cgroup.c
 create mode 100644 tools/testing/selftests/bpf/cgroup_iter_cpu.h
 create mode 100644 tools/testing/selftests/bpf/cgroup_iter_io.h
 create mode 100644 tools/testing/selftests/bpf/prog_tests/cgroup_iter_cpu.c
 create mode 100644 tools/testing/selftests/bpf/prog_tests/cgroup_iter_io.c
 create mode 100644 tools/testing/selftests/bpf/progs/cgroup_iter_cpu.c
 create mode 100644 tools/testing/selftests/bpf/progs/cgroup_iter_io.c


base-commit: 3b5f4b83c4abc0c9b0a7b9e2b44e816611b7f2ec
-- 
2.53.0-Meta
