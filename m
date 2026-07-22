Received: from out203-205-221-231.mail.qq.com (out203-205-221-231.mail.qq.com [203.205.221.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3424481A9A;
	Wed, 22 Jul 2026 09:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784711434; cv=none; b=AHgJM/W96DaCAlUy0lhn30klsDYPeahz43bP6qUf+DOp3Ktwu4m0aVv1BVVIOxXzJ93Sj4PPTkUa3ozFRriKgBwcMrpoGCJs7otEo/X304H6L7IMkgABbqNe6Bymb99YZei+S2ew6GjrARk2IsuWIkfGs9ClSMXSqcBsMpCqs/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784711434; c=relaxed/simple;
	bh=T/1wmSMkk/grzV5sVJ4qUlxUtqWG5xcY9sZumKm40aI=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=a3G0StEpVHi0KX2uTYaPDuVnrH4aXErp1V7cquwy1tLhDmxLNHY7B1/hcUScQMMbjZ05BUJGAtK4Fzc+c+dD/N7Xex+rRFufB4JGVN4RRFAFmWlb7FoiD+yVOTJPxfU8Lwn4U4Dm5RojJuAnuCjQc004nn0IkrwkJSjMWXHfwy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cyyself.name; spf=pass smtp.mailfrom=cyyself.name; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=O6hhzIsU; arc=none smtp.client-ip=203.205.221.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cyyself.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyyself.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="O6hhzIsU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1784711415; bh=g68cvpPIGFzjcQ1AtlDFWK9DDYju3Wz5u6WRjRdVMtI=;
	h=From:To:Cc:Subject:Date;
	b=O6hhzIsUralvDJ4Q7h/pwiXQPp74mVgSdPLOoLZ1LgotJiiO+/iqAvCi4XZ3vCm9+
	 DYyjpEMpzeXPDP8kOQmchYYMnwg6iq8iox7ZvF8i5MGtxqhu7ZdBnZja7futtEkAvw
	 bqrmyQHqvIfjIf3ElJx8wHxl/RVHQp3A/uB0v1fQ=
Received: from localhost.localdomain ([240e:37c:2242:cf00:5054:a3ff:fe89:345b])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 23B22226; Wed, 22 Jul 2026 17:08:59 +0800
X-QQ-mid: xmsmtpt1784711339t06d1aa9j
Message-ID: <tencent_93116D14C771DC8C988C10E3C634BE0CC107@qq.com>
X-QQ-XMAILINFO: MRMtjO3A6C9X34JJJaZtPfxxvYMtYNC8DTUcYf/ifbuapbe1q2N7juXaaYvWLn
	 MDPeU+YmGYvP8haSo/6cZuNkbvEJ/PnHHpgQZiWwf1dvjYpkvKD6vAZJPXfd3oEozE5nImLnF9T1
	 UA62ZFKl7mgpnfgi2fkKdSzG29uCVGnif0/+aKeKUz6tuDme0rr2w7PE2/j2rXwRw86GkJLs47Ej
	 H31KNoipwh2DDwkrQdKw2v0T6X8eEnKEgDnJz9s+wyViDZ+IWbH0YOtD8vh7dHv3/beCr4/Ylkci
	 36niSqGyJ+q1cE7wscfiOTr2H97OcXeWoGwP0sqNkZs5Dk7Iho7+b7ks6G1nDmR0Mzw9M++UCSHD
	 V62ndYdrtCJEAGsTIFCIGyGi3BlQwbDG9O+gXmlR237LAQaES4+7KyYxUPpykajqXk3tUcaUs4LN
	 6TL1lKNo0EKD0hrfWoNuXN3L2XVq/yJSM+gsULzCzHnYpJ1RdWvnZoKQI1b1egWNFzkpnOVvSxJz
	 MGI/dTtyZKqaj6l8XP9rvdnkY9PWoel3itCJcKMS+iEfxAoP2LO9iiYDuC22AVNeRyEGu2Ke638m
	 RnvExe6u7PkSV0nNeFdAztoeg9d5YM6w16VrZWsOIFb2hezulKZ8qzB5mIcI+1LJ6vpp0zAR2lwL
	 vyiIgHYaH2SpK/691VplwGKN2VnsFhDK1/JTxu4l24fGcAduURhksP1wUTf3tOFbcUQCmnd2E3Ke
	 jg2c2HeBIlld1et5Zan8O5LpxiqC3jBARjNbw9nK3qiEsejZNo3/4WW9l90ojSCLkH8tNJMlwpKg
	 HyDLdz1sPAh5WK5B80srI2gtSC25ztlmlUFRSuuZ4XfMeQNZOFnx/UdO4PebtQhlLbZj5TYlWeFk
	 bFWoH17kIc2Ph8Mg02jlM8dT+LFT4FGiUE9vDjfGa7RKnT9VqQqkw2dQBgFR6MxG38VF2scy1HNG
	 xwaEyYh8i1NIz3+d88i27CFxyzWo+CGp8PJZCcKxSMD92kJFgLQSWPHRK6o5wllxCGNvj5hZB2Gz
	 CQMlzsodx4+NDB34VJkedaJslg+WDfct7yXpXw1esUzGpcpGuzGs6xX4Zhkcyy0oVlKHNe1fU4JW
	 XD+VDgWTOtITkZ0wY=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Yangyu Chen <cyy@cyyself.name>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Chen Yu <yu.c.chen@intel.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Yangyu Chen <yangyu.chen@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH 0/4] sched/cache: per-process control of cache aware scheduling
Date: Wed, 22 Jul 2026 17:08:45 +0800
X-OQ-MSGID: <20260722090845.1590468-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cache aware scheduling is currently controlled only through global
debugfs knobs, but the right aggressiveness is workload and platform
specific. A multi-threaded Verilator run is one example: its RSS is
large while only a small part of it is hot, so an RSS-based footprint
estimate should not decide whether it is aggregated; and packing its
threads onto the SMT siblings of one LLC beats spreading them across
LLCs on some platforms (e.g. AMD EPYC Turin) but not on others (e.g.
EPYC Milan). Such choices cannot be made globally for the whole
machine.

This series adds per-process (per mm_struct) control. The first
patch splits the llc_aggr_tolerance debugfs knob into independent
thread-count and footprint tolerances and hardens the unbounded
percentage knobs against multiplication overflow. The second adds
prctl(PR_SCHED_CACHE), a single prctl command whose sub-command
selects GET or SET, covering a per-process enable, both tolerances
and the overaggr percentage, plus an inherit mask choosing which
attributes survive execve() (fork() always inherits). The remaining
two patches add selftests and documentation.

A numactl-like launcher built on this interface, llcctl, is
available at:

  https://github.com/cyyself/llcctl

It sets the attributes and the inherit mask on itself and executes
the target command, so the whole process tree runs with the
requested settings, e.g.:

  llcctl -d -- ./membw-hungry        # opt out, spread across LLCs
  llcctl -n 2 -p 100 -- make -j16    # pack up to 2 threads/core

Tested on x86-64 in QEMU with an EPYC-like topology (128 CPUs, 8 LLC
domains of 8 cores / 16 threads each): the selftests pass as both
root and an unprivileged user, and aggregation was verified end to
end by observing thread placement of a 24-thread spinner with and
without llcctl (evenly spread by default; packed into a single LLC
with raised tolerances). No new dmesg warnings.

Yangyu Chen (4):
  sched/cache: Split llc_aggr_tolerance into nr and size tolerances
  sched/cache: Add PR_SCHED_CACHE prctl for per-mm control
  selftests/prctl: Add PR_SCHED_CACHE tests
  docs/scheduler: Document cache aware scheduling controls

 Documentation/scheduler/index.rst             |   1 +
 Documentation/scheduler/sched-cache.rst       | 125 ++++++
 include/linux/mm_types.h                      |  10 +-
 include/linux/sched.h                         |  16 +
 include/uapi/linux/prctl.h                    |  38 ++
 kernel/fork.c                                 |   2 +-
 kernel/sched/debug.c                          |   6 +-
 kernel/sched/fair.c                           | 205 +++++++--
 kernel/sched/sched.h                          |   3 +-
 kernel/sched/syscalls.c                       | 120 ++++++
 kernel/sys.c                                  |   5 +
 .../trace/beauty/include/uapi/linux/prctl.h   |  37 ++
 tools/testing/selftests/prctl/.gitignore      |   1 +
 tools/testing/selftests/prctl/Makefile        |  15 +-
 tools/testing/selftests/prctl/config          |   1 +
 tools/testing/selftests/prctl/sched-cache.c   | 394 ++++++++++++++++++
 16 files changed, 931 insertions(+), 48 deletions(-)
 create mode 100644 Documentation/scheduler/sched-cache.rst
 create mode 100644 tools/testing/selftests/prctl/sched-cache.c


base-commit: 248951ddc14de84de3910f9b13f51491a8cd91df
-- 
2.47.3

