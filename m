Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9468F21ABC9
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 00:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785200100; cv=none; b=kBpTpJJMJKzirod5rz/607A3ltdRlo8jeEXbxGZXNQcPwoYLbZvXYJd/dI6ujEnNwmh1mOwMpyMi4T333/El92A7x6bl6/afg/3GgF01YYFNKyFg7pZvNdQ6VGg5uE+w9lsUR8qEoBNuOXZ5ljyOIdcy5b2M5fsBU+bRn1b8y6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785200100; c=relaxed/simple;
	bh=bE/cF7rDFDmDg/K13IVD6WT+vgfmLtwJd1vZtXfhvMg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=m98QjMsEfbD3eWJsOfu53r7wrTLigVykciMkdjzQZEqC9esgeJQVbtM9NWIUwQQfCu3GXyzMMwA4XGSp8qjMh8FhpCXDbyCd/vK3c9bu7vLePqgvGF2HpjB/V8u/zH+UHWSmhAECcW72jmJ2vm3imGx2+yCov/02TGmBBMGJ1Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=knOi5ZCU; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="knOi5ZCU"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-381216921aaso3218675a91.1
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 17:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1785200098; x=1785804898; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8pp75BTZRBMs2YBS0P6BlOR/cBBd2UOnLYzK3C+0Sw8=;
        b=knOi5ZCU+QxQAXyqwUb+h1A6ZB0NHaB0BIMCkBBTuzST0t3z+ssgUZ9AtkiftO0Zsf
         PfChEEf42aj3r0POZyaW6Ay0SFe2flhcprxxlM5MVe1Fyn/t1WzdnP7T59H89JsSAOFu
         e4Xx3I0lhzwj9BZvrsRGKVTwSnEVyGTCTEtPcOt0KuYnp0KyZyDWQhi++SbgJEw5ZI90
         uarCt0Gfj0Y+fWIOl1G6u0NLvaQAlgMWYLOtzXoQ4hzVNZG5+DTEMFgCIaE4yzPSmf1Y
         A9jYQAysIMBzeYxsEmBFIZlvt7u0vjd8IltWORippbf6F3q4PMAua2r8L7KRKazpaC6Y
         YnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785200098; x=1785804898;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8pp75BTZRBMs2YBS0P6BlOR/cBBd2UOnLYzK3C+0Sw8=;
        b=jS50oN8RNq5dZxNP/M33YzozGfoBLcDf54B2KWzDNFCNA/NS9gUoK5sYT0VQVKaCT/
         Zk0y8F29OYs3QXJiKHsfXKRhSUTe66W3AYhHig0TPi03Jyw9osGJb5ihtD6BlRutTZtU
         oQZI4THrTuKh5HPoh4CMuaWCmL+ZD0lu4iErg8opESOvXesfWxvlN/O2OHumiwrnkLI+
         wcbiF6P6qF4k3Pr5UfJww1gcDxsyxDzvko551gYzjghcA4conRPPyNkA7H+kKwWP2Gkv
         apineM/ao5DsPjE5QK6y97+WEmJAmyrDziyrGCn68bVbtAJdU7u0yCnjBlqvGcozNIL3
         88FQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr48ZFxHEqMfiGIuf1Zg9MGneyACTPkd3WPL+CUr+c09izF/3YodidHclLX03/D6oPw1aLUlM65Pj2mFjIsZvk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLsQZcIIzukzkbagKf6aQtaOGwjP2j1IMPi2AC4ziOi6NiU8Q9
	7ocIpIN9zWReQhj4mgWY3C/ywsK1bp0CvCIO1XToP6DafY1VQx/IseUZs46VyZpYqwY=
X-Gm-Gg: AR+sD12C/BHROvvNZE3UGcxJVajaJElM3NetQaes4XchVmmEWlRU/kwbnGWRCn6uspO
	kjnDuvNuogaDWJISWJp7FABfgtGnVgBafXrow3FrSbkdReiR8ogrgkVnaaCYlFqbZoCGDynqkdy
	H3BQqWpzatdduQWRO9t3ala2XinEmg6CnljtWrc8cxG+epcOXSND/VmhdkTfpfFnwPoA7s/y7V9
	y3wPIky4PEvYTrUOCs91HrBLgZz+fNfjMfTkL37B4zYa3afH+NEq5lNMROexK455pNsdTmshVi3
	duiNp5igbdBBPv3bVuTK0/fZ2stRI2emRPEMCk95Vdoyexm0Fy6OowR5Wz79J1boj9Bs3BqD4nY
	SSuhxx7eoJFAiROoVLaWRt6/fHmzRiWrThmww0UAS//c3XYLgI8HX+MjH5kW1Im2+tdyS/k3jOh
	l16HEwQD09tL+tSbyn6s4n3BWtFJF4FlPVPV+oULJpEKLs9kbsJDhNunbDguL4r8zIteSETnTBx
	+rpG+ttWKxT9jCHxA==
X-Received: by 2002:a17:90a:d64d:b0:382:1aaf:4bab with SMTP id 98e67ed59e1d1-38f6a426773mr182155a91.27.1785200097807;
        Mon, 27 Jul 2026 17:54:57 -0700 (PDT)
Received: from localhost (107-190-31-17.cpe.teksavvy.com. [107.190.31.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f64105194sm479045a91.4.2026.07.27.17.54.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 17:54:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 20:54:56 -0400
Message-Id: <DK9SMAEXY39E.195HV3J7GB8AI@etsalapatis.com>
Cc: "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "John
 Fastabend" <john.fastabend@gmail.com>, "Shuah Khan" <shuah@kernel.org>,
 "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>, "Clark Williams"
 <clrkwllms@kernel.org>, "Steven Rostedt" <rostedt@goodmis.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-rt-devel@lists.linux.dev>
Subject: Re: [PATCH bpf-next 3/3] selftests/bpf: Add a test for arena
 fault-in under memory.max
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Jiayuan Chen" <jiayuan.chen@linux.dev>, <bpf@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260727062521.376231-1-jiayuan.chen@linux.dev>
 <20260727062521.376231-4-jiayuan.chen@linux.dev>
In-Reply-To: <20260727062521.376231-4-jiayuan.chen@linux.dev>

On Mon Jul 27, 2026 at 2:24 AM EDT, Jiayuan Chen wrote:
> A child joins a memcg capped at 64M and faults an arena in until it runs
> out of the budget. Without the kernel fix the child dies with SIGSEGV on
> a valid arena address; with it, the child is killed by the memcg OOM
> killer.
>
> With the fix:
>
>   serial_test_arena_memcg:PASS:child killed by signal
>   serial_test_arena_memcg:PASS:not killed by SIGSEGV
>   #5       arena_memcg:OK
>
>   # dmesg
>    arena_vm_fault+0x655/0xa90
>   Memory cgroup out of memory: Killed process 512, file-rss:67920kB
>
> Without the fix:
>
>   serial_test_arena_memcg:PASS:child killed by signal
>   serial_test_arena_memcg:FAIL:not killed by SIGSEGV: actual 11
>   #5       arena_memcg:FAIL
>
>   # dmesg
>   test_progs[508]: segfault at 100004025000 ...
>
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> ---
>  .../selftests/bpf/prog_tests/arena_memcg.c    | 158 ++++++++++++++++++
>  .../testing/selftests/bpf/progs/arena_memcg.c |  24 +++
>  2 files changed, 182 insertions(+)
>  create mode 100644 tools/testing/selftests/bpf/prog_tests/arena_memcg.c
>  create mode 100644 tools/testing/selftests/bpf/progs/arena_memcg.c
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/arena_memcg.c b/tools=
/testing/selftests/bpf/prog_tests/arena_memcg.c
> new file mode 100644
> index 000000000000..9665946fa29e
> --- /dev/null
> +++ b/tools/testing/selftests/bpf/prog_tests/arena_memcg.c
> @@ -0,0 +1,158 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <test_progs.h>
> +#include <fcntl.h>
> +#include <signal.h>
> +#include <sys/mman.h>
> +#include <sys/wait.h>
> +#include <unistd.h>
> +#include <sys/user.h>
> +#ifndef PAGE_SIZE /* on some archs it comes in sys/user.h */
> +#include <unistd.h>
> +#define PAGE_SIZE getpagesize()
> +#endif
> +
> +#include "cgroup_helpers.h"
> +#include "arena_memcg.skel.h"
> +
> +#define CG_PATH		"/arena_memcg"
> +
> +/* Budget the arena gets on top of whatever is already charged after loa=
d. */
> +#define ARENA_BUDGET	(64 * 1024 * 1024)
> +
> +/*
> + * cgroup_helpers builds paths from getpid(), but the work dir belongs t=
o the
> + * process that set the environment up. The child references it through =
that
> + * pid, so build the path explicitly.
> + */
> +static void cg_file_path(char *buf, size_t sz, pid_t owner, const char *=
file)
> +{
> +	snprintf(buf, sz, "/mnt/cgroup-test-work-dir%d%s/%s", owner, CG_PATH, f=
ile);

These are copied over from cgroup_helpers.c, but it's not obvious they
originate from there. Maybe let's move them to cgroup_helpers.h where we
can use them everywhere for consistency.

The main issue I see is that this only triggers consistently with PREEMPT_R=
T, correct?
I tried with the default vmtest config we have but it does not trigger
at all. More importantly, it doesn't trigger reliably with PREEMPT_RT,
either. Does it for you? Can we cycle forks/frees multiple times to try
and trigger this more reliably?

> +}
> +
> +static long cg_read_ulong(pid_t owner, const char *file)
> +{
> +	char path[PATH_MAX], buf[64];
> +	long val =3D -1;
> +	FILE *f;
> +
> +	cg_file_path(path, sizeof(path), owner, file);
> +	f =3D fopen(path, "r");
> +	if (!f)
> +		return -1;
> +	if (fgets(buf, sizeof(buf), f))
> +		val =3D strtol(buf, NULL, 10);
> +	fclose(f);
> +	return val;
> +}
> +
> +static int cg_write(pid_t owner, const char *file, const char *val)
> +{
> +	char path[PATH_MAX];
> +	int fd, len, ret =3D -1;
> +
> +	cg_file_path(path, sizeof(path), owner, file);
> +	fd =3D open(path, O_WRONLY);
> +	if (fd < 0)
> +		return -1;
> +	len =3D strlen(val);
> +	if (write(fd, val, len) =3D=3D len)
> +		ret =3D 0;
> +	close(fd);
> +	return ret;
> +}
> +
> +void serial_test_arena_memcg(void)
> +{
> +	int cgroup_fd =3D -1, status;
> +	const long ps =3D PAGE_SIZE;
> +	pid_t owner, pid;
> +
> +	if (setup_cgroup_environment())
> +		return;
> +	owner =3D getpid();
> +
> +	cgroup_fd =3D create_and_get_cgroup(CG_PATH);
> +	if (!ASSERT_OK_FD(cgroup_fd, "create_and_get_cgroup"))
> +		goto out;
> +
> +	/* No memory controller -> nothing to test. */
> +	if (cg_read_ulong(owner, "memory.current") < 0) {
> +		test__skip();
> +		goto out;
> +	}
> +
> +	pid =3D fork();
> +	if (!ASSERT_GE(pid, 0, "fork"))
> +		goto out;
> +	if (pid =3D=3D 0) {
> +		struct arena_memcg *cskel;
> +		__u32 i, npages;
> +		char buf[32];
> +		char *base;
> +		size_t sz;
> +		long cur;
> +
> +		/*
> +		 * Do everything from the child: the arena vma is VM_DONTCOPY so
> +		 * it would not survive fork(), only the child should be under the
> +		 * limit so that a memcg OOM cannot pick test_progs, and a map is
> +		 * charged to the memcg of the task that creates it - so join
> +		 * before load. Errors are reported to the parent through the exit
> +		 * code, since ASSERT_* in a forked child does not reach it.
> +		 */
> +		snprintf(buf, sizeof(buf), "%d", getpid());
> +		if (cg_write(owner, "cgroup.procs", buf))
> +			_exit(2);
> +
> +		cskel =3D arena_memcg__open_and_load();
> +		if (!cskel)
> +			_exit(3);
> +
> +		base =3D bpf_map__initial_value(cskel->maps.arena, &sz);
> +		if (!base)
> +			_exit(4);
> +		npages =3D bpf_map__max_entries(cskel->maps.arena);
> +
> +		/*
> +		 * Cap only now, after load: everything but the fault-in is
> +		 * charged, so the arena gets a fixed budget regardless of what
> +		 * the load itself cost, and the load can never hit the limit.
> +		 */
> +		cur =3D cg_read_ulong(owner, "memory.current");
> +		if (cur < 0)
> +			_exit(5);
> +		snprintf(buf, sizeof(buf), "%ld", cur + ARENA_BUDGET);
> +		if (cg_write(owner, "memory.max", buf))
> +			_exit(6);
> +
> +		for (i =3D 0; i < npages; i++)
> +			base[(size_t)i * ps] =3D 1;
> +		_exit(0);
> +	}
> +
> +	if (!ASSERT_EQ(waitpid(pid, &status, 0), pid, "waitpid"))
> +		goto out;
> +
> +	/* A non-zero exit means the child failed to set up; the code says wher=
e. */
> +	if (WIFEXITED(status) && WEXITSTATUS(status)) {
> +		ASSERT_OK(WEXITSTATUS(status), "child setup");
> +		goto out;
> +	}
> +
> +	/*
> +	 * Faulting a valid arena address until memory.max is hit must not look
> +	 * like an invalid access. Without the fix the fault path allocated wit=
h
> +	 * the non-blocking allocator, turned its -ENOMEM into VM_FAULT_SIGSEGV=
,
> +	 * and the child died with SIGSEGV on a valid address; now it is handle=
d
> +	 * by the memcg OOM path and the child is killed by SIGKILL instead. A
> +	 * clean exit means the child failed to set up (see the exit codes).
> +	 */
> +	if (!ASSERT_TRUE(WIFSIGNALED(status), "child killed by signal"))
> +		goto out;
> +	ASSERT_NEQ(WTERMSIG(status), SIGSEGV, "not killed by SIGSEGV");
> +out:
> +	if (cgroup_fd >=3D 0)
> +		close(cgroup_fd);
> +	cleanup_cgroup_environment();
> +}
> diff --git a/tools/testing/selftests/bpf/progs/arena_memcg.c b/tools/test=
ing/selftests/bpf/progs/arena_memcg.c
> new file mode 100644
> index 000000000000..adecd9e8463e
> --- /dev/null
> +++ b/tools/testing/selftests/bpf/progs/arena_memcg.c
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <vmlinux.h>
> +#include <bpf/bpf_helpers.h>
> +#include "bpf_arena_common.h"
> +
> +struct {
> +	__uint(type, BPF_MAP_TYPE_ARENA);
> +	__uint(map_flags, BPF_F_MMAPABLE);
> +	__uint(max_entries, 100000); /* number of pages */
> +#ifdef __TARGET_ARCH_arm64
> +	__ulong(map_extra, 0x1ull << 32); /* start of mmap() region */
> +#else
> +	__ulong(map_extra, 0x1ull << 44); /* start of mmap() region */
> +#endif
> +} arena SEC(".maps");
> +
> +SEC("syscall")
> +int noop(void *ctx)
> +{
> +	return 0;
> +}
> +
> +char _license[] SEC("license") =3D "GPL";

