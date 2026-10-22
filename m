Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792658923;
	b=hwlbisWzjskdpoxNNUvtPPL2MAcU+MoOvMj8dVkMtkgProLtt2YI467xWbib2txhnayp
	 6ff5HgYYvb0J2QlEMGDrV5My4KhDMddscY5HgUgT2Z9Z3sALtp9NvBem5vExB1Vd5Ak2D
	 NMXyRk4OlPWXvSuBr/AJ2vjjDsPlf9FL8L44LcFcOReEeqUAjAZaUMj/bVNx430omD1j7
	 JCV5GBUyPpqf0EayVrmC8aPEUfut92DlvU06H5+RHig4B8/+iFU5DQIRSjNJcJhTX2N5h
	 Y/xujo4K7vAfmTwqJugVQZt0KJ+AicAfMrNgmmBsDN7HYTt78OLJK4R+cdWRdxUtt2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=d1Y/tnSFu3jseTt8hyIClx2oDqTKYF0fpHuN04970z8=;
	b=RYD5toiPmOAtim+ilkCiJMG/ZK5H4oFodRiv4+YUsp1drV+H80wIa+966lGKUQkvmVCS
	 nbtQ/gbo3rYvYU9JNCTutLv3avsISGb1PyGqKuRKXuOh/pwQCV/a7T2InItK8CaxSa8C8
	 z5+wXPI7/jIp/iHtxy8jvBmOqv19KCulkpJGryVogXCKB4Su6FqAgiJCBUXcMGokEKHGA
	 cgo1Uf0NqWNcW281/z02TKnD0ld/ScQpKyuvB2fFpYODWRLIL2Mor8GvC6zaQFk6+dJFh
	 Zp0nFKNi4tKN3rNSnqWP1l1AkKq3tnHXujrabUg8kxggVBOnjg/54g3gwtJAqb0ysGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iT5kLPwb;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB451606A31D
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 08:48:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB451606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iT5kLPwb
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35f1f76ea84so2334258eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 01:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792658922; x=1793263722; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d1Y/tnSFu3jseTt8hyIClx2oDqTKYF0fpHuN04970z8=;
        b=iT5kLPwbZrl5R9P8lz6hD0c9zeSmff/3wO0G7RK9cMOmX4xhvHDnCLDvyx1z7p+E+/
         9OzOls16Wp+v27SWcOmzfZTUoULhrWS+4KFSNvJ36baDPUVqdHLHeQiGkSdXKq+oi/gS
         tq1iDshzvOumOK+/vmqZe+Ancdki5re/sbNX735OfofcQg2bKyTa/+KbVMKB0Mx6M2jj
         h7CTcxNyACAzpYb1iVtN3TFbjmr8mF4x5IPlH+TcI6LoRtE2875J96gUVQVhoJ+X5E5K
         md1P3mNVbeuqu9exCORHUdXAMxhv+QO2pLjF9GPHoHjJk6k+lJ6bjR1MXzY03rScCl8t
         rHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792658922; x=1793263722;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d1Y/tnSFu3jseTt8hyIClx2oDqTKYF0fpHuN04970z8=;
        b=2rs/B1sfcwtBK6bSGKeKDSVyJkGLMQZW53GaPDAP2LzoXtKUEbrpsQP+WaV8amb8GN
         FOdc8OLCdfTfKyak2+YVvrZLAmJrORmbvUQrTAj7zp4OVqvke8Dzu7JRb+ayxLUqX41k
         qpx4rLEh5eGkVgl91chuJjPPyohQzgOC95XSjjHxsxB9PdcBv/QtaJV8WyWV1BOBe6Zg
         I2UkBiw9IVB2GduraWeaiiMyXSsqfjGcblERQTpKgkUMAuOTSvXcVkxSdMfT85aybPQ6
         eX2tolTskLAB/kxFhWjQmP12BXIwsnThzUHMmrCF0iu6Nwo2A+GACJoG0RpB4hHIgB2H
         WAEw==
X-Forwarded-Encrypted: i=1; AKwUvBwvFhCW3MJEgAjqgkCDnLBB30asgZS80+c8fiHGmD7GRifFYqGsb2vCALypJxeXgi73Va4TVnwE4JCRoSSLyuQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFH0eEu8vZwwTSIIEXMDjHWN+jciFwPHejAsrEzIF1mKaLEI5c
	kHI1drtte2O2XKp4gRG7h6xyxUnsVI18maeGzHiVqEu9sizOXyDho1ka
X-Gm-Gg: AYBFou3yVweWy29DVC0dYlvTMZqxd9pvwLHLYzfA8j6w9kAlBX7oZRnqeKFs98iIfmc
	6ZncOYVDn6/tbn9PUwk5MZLEFtJQuBw9G/r4m89fbHlHoeixZ7GHGo/9CrklAahmpbVQEQtZCYb
	sK4Ec8B8Cm8ff/ID8O4n1g2ydkflUywFS9aRSk84FURdsnnXGl19F0u5wlgURbKvkTcH1sjjJzK
	5XXIlOaeQlkdfe3W+KmQ2XqMzFrhmPuwQiliCxkx3AZIve2z/c50Wn6FMtMGBOkKReNjdwlB3FC
	NuANp1ALRfQRKh09OOaBWgnspjdya7JlVYivWi5mbM1fJ4oSb5WpJn9pwlUlIwg0Wxdn20TEuIl
	Bi+hU2KKsnWQ7a1wJ2vgihJmyJacNYZGtNpmVbm5+ECm8IxDNWmrKZDbij/v5etFdZd9iEiCsEX
	1YdfKPaV5kao19/dmBR1F0SVv4gvhKXd7JoeV8ZO2S9Yy/A3N8m1PNj1chV9XzemVuEzd4e+GKc
	tuB86lOUR8BFo5onDVi+bl7LDGPMD+N+OcUJrxygVXkNGQICw4=
X-Received: by 2002:a05:7301:122:b0:368:e6b5:35ad with SMTP id 5a478bee46e88-368e6b53aa7mr1986932eec.12.1792658921825;
        Thu, 22 Oct 2026 01:48:41 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367417a2fadsm13962472eec.21.2026.10.22.01.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 01:48:41 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Subject: [PATCH bpf-next v6 0/4] bpf: Fix a struct_ops use-after-free
 behind a flaky assoc_in_timer test
Date: Thu, 22 Oct 2026 16:48:35 +0800
Message-Id: <20261022-selftests-bpf-struct-ops-assoc-timer-v6-0-2c0f18e82582@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOPN2WoC/5XQTWrDMBAF4KsErTtFI1l21FXvUbrQzzgRxLHRq
 CYl+O5VvXK9cpePx3wP5imYciIWb6enyDQnTuO9hvblJMLV3S8EKdYslFQtSmmB6dYX4sLgpx6
 45K9QYJwYHPMYoKSBMhjyUllDQUspKjVl6tNjnfkQv3d3ehTxWZtr4jLm73V/xrX/39SMgGCd7
 Zz1OmL075fBpdtrGId1YFYbFOVBVIGE2LlGn20bfY97VG9RcxDVFaWe2kbHxiun92izRduDaFN
 R66LGoFApGfao2aJHf2oq2nVeEZ6RTPiDLsvyA/ts92k2AgAA
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
 Amery Hung <ameryhung@gmail.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

st_ops_assoc_in_timer_no_uref drops every reference to a struct_ops map
and expects a timer callback of its prog, 500ms later, to find no
struct_ops associated anymore. It fails now and then while test_progs
runs other tests in parallel.

Since commit 5db69b0fbdc8 ("bpf: Make struct_ops tasks_rcu grace period
optional"), a struct_ops map clears the association only after the RCU
grace period of bpf_map_put(), so nothing waits for a prog that reads
the association in between. A timer callback can then return into a
freed trampoline, and the kernel hits an int3 Oops.

Patch 1 lets the association be cleared in any context, and patch 2
clears it in map_free_pre_rcu(), so that the grace period bpf_map_put()
already waits for follows it. Patch 3 adds a test that catches a map
freed under a running .test_1. Patch 4 has the timer callback of
st_ops_assoc_in_timer_no_uref retry until the association is gone.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
V5 -> V6:
- Rebase onto current bpf-next

V4 -> V5:
- Drop the free_after_rcu_gp of struct_ops maps, which is dead now, and
  update the comment of free_after_mult_rcu_gp in struct bpf_struct_ops
  (Alexei)
- Also stop the tests when associating syscall_prog fails (Sashiko)

V3 -> V4:
- Clear the association in map_free_pre_rcu() instead of deferring the
  free of the map (Amery Hung)
- Add patch 1, replacing st_ops_assoc_mutex with a spinlock, since
  map_free_pre_rcu() may run in softirq
- Stop st_ops_assoc_in_timer_free and _no_uref when running syscall_prog
  fails, instead of waiting for the timer forever (Sashiko)
- Point Fixes of patch 4 at 0e841d19263ab, which added the test, as the
  delay left after patch 2 comes from freeing syscall_prog

V2 -> V3:
- Wait for an RCU tasks trace grace period in patch 1 for every map, so
  that progs reading the association under RCU tasks trace, e.g. from a
  bpf_wq callback, are waited for too (CI bot)

V1 -> V2:
- Add patch 1, fixing the use-after-free behind the flaky test (CI bot)
- Add patch 2, a test for the use-after-free
- Point Fixes of patch 3 at 5db69b0fbdc8 (CI bot)
- Move the restarting of the timer into patch 2, which needs it too,
  so patch 3 only turns it on for st_ops_assoc_in_timer_no_uref
- Rebase onto current bpf-next

v5: https://lore.kernel.org/r/20261019-selftests-bpf-struct-ops-assoc-timer-v5-0-77b2e181e5cc@gmail.com
v4: https://lore.kernel.org/r/20261016-selftests-bpf-struct-ops-assoc-timer-v4-0-9ad31c21220c@gmail.com
v3: https://lore.kernel.org/r/20261015-selftests-bpf-struct-ops-assoc-timer-v3-0-efe643d4b2a3@gmail.com
v2: https://lore.kernel.org/r/20261010-selftests-bpf-struct-ops-assoc-timer-v2-0-d7a43896dbf1@gmail.com
v1: https://lore.kernel.org/r/20261009-selftests-bpf-struct-ops-assoc-timer-v1-1-9a97a9b3d1db@gmail.com

---
Qiliang Yuan (4):
      bpf: Protect the struct_ops association with a spinlock
      bpf: Dissociate struct_ops progs before the grace period of the map
      selftests/bpf: Test freeing a struct_ops map under a running prog
      selftests/bpf: Wait for the struct_ops map to be freed in assoc_in_timer

 include/linux/bpf.h                                | 10 +++---
 kernel/bpf/bpf_struct_ops.c                        | 29 +++++++++--------
 kernel/bpf/core.c                                  |  3 +-
 .../bpf/prog_tests/test_struct_ops_assoc.c         | 37 ++++++++++++++++++----
 .../bpf/progs/struct_ops_assoc_in_timer.c          | 16 ++++++++++
 5 files changed, 70 insertions(+), 25 deletions(-)
---
base-commit: b116ac6087541d3d98031e786adbe9c733cd6df3
change-id: 20261009-selftests-bpf-struct-ops-assoc-timer-5eb0295ec300

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

