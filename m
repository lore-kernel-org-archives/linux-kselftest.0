Received: from mail-yx2-f9.google.com (mail-yx2-f9.google.com [74.125.224.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A6256C648
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 14:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965578; cv=pass; b=VpoBik0ZMl2Ff2bficpYYIaxHzyCf20GJY8Al0zlVoGQnvxWfttCnbKlzvGHkmdjYypTpRw0JWUrapmn2oDXCe8rDOp4agB92yZg+6ZFMw7CSdMrVJHRn3tY7UPciR+s7JLg6wIcvNQf38TcmNssWcjpyqkb6HsOg4ixiVOtE1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965578; c=relaxed/simple;
	bh=IvuVgXtzg+PW3WsJyb8eWnV+a5ycZtkTPhA0W31/AqE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=sJ7acnYGrstUmTAIREhVnaEdU5EmpC+U1He3WkAFais49sxg3alYyVdZkToDocC5Q7WqhEIM0o4l77RhV5LMPd12NbAy2wTPxIu2XRZGsYDKmgWKoq2uFGHZlQWNflDOjU3YhTdUNBlX+OX4EscsrQqxGg03YvQNK0MRlOnCCfc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+Ox5B5k; arc=pass smtp.client-ip=74.125.224.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+Ox5B5k"
Received: by mail-yx2-f9.google.com with SMTP id 956f58d0204a3-66e5f4dc13bso1433112d50.1
        for <linux-kselftest@vger.kernel.org>; Wed, 09 Sep 2026 07:52:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788965573; cv=none;
        d=google.com; s=arc-20260327;
        b=pUGZ75hIhdNuVVNq+Z1ivBxGhcGFtzJPWA3WdbFhxDuuBvbLCat7rQDWwVmKNJELVM
         YfF4rvqv5ChPCnE3MDPpazz9rKMFyZttIgqbE3pgi5Ok7PkvaDF2gwbQSKR+PoNLpT9Y
         PR1F4CByMyHgOrKmCSxECxcVYcOrY+1AXKgDJ44kc0OhcboYyGunF+pbpYBh6ASZw0tT
         CJMp2VzKLhIkf58VkDHx+lstolAm1FoExBbXlp2RQMutlnlyczvjnIcvQ8ycGFpunrHe
         4reQ6VGrjyHx2seLSmL7HGjr6vzgtUwnpmJq2LkCCUH7Tq9BawVh71sRa6PuW2CVtiff
         emxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=RwJ9BaoNRw2XUxKdRuqOWTaCFPLrZEbkBSC1yAfl2n8=;
        fh=5scAELxb3Uu1r/E0k8qliI1cNDpubQ7ZGC2RApckKHo=;
        b=kIm/HtgBOlz6OP9K06GzN4L5DiRn+DtzEW9egdgXqaB0PP0WQ363vGjv3uXmAOTeZM
         Rz/jV0baQgUnTMz/5HQqUCmskiEGt0qV5bYvk4VocwLPX28bJkjIlgkuI7byzy4N9sux
         ODEL1GK0G75ZshrbnPZ69ZQwGi7LJjduP+tV/m2GR270nqFQkmkwieGtdMIfF0nCzVXR
         5inFI9u+HopRgdMPgRtr45E3H0+HdV+qWsy7mMxqDxJ3rK5+NpKrDv3RREGAsEUsxmzP
         Fqto3l/LkebZBbIdKXuT4ahlJ81CiRI/iiRxHNBwvEgE/I6rDCYcXDLPspysvLI5xvB2
         LCNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788965573; x=1789570373; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RwJ9BaoNRw2XUxKdRuqOWTaCFPLrZEbkBSC1yAfl2n8=;
        b=D+Ox5B5k11jjdIriBLGwL805Pn8ZG7VxJ0ao6SNLVvil4GQ0yQhTIMAZ6r+nGFTOjh
         ksp3yQlRbs5hCgz0c6EyjhAQ6I2tI1jHhNMrADjD13QvHrsq0kWr9/YNs0SEBJb0P+UM
         5fCbJtRirJm0Dw8XzdbJYmV3nhUjP1OWrmvg369/759SNxRv/GWkpFU+G+mAGo0YFvKK
         +g4QT3d5nOfgJmQX2x1RDMo7W28p0vO+OqPBuexMpLYVFr2ONPYqAYLcfzzCp/D74czx
         1fIRQdaz87eq9xNq3T5Qj6CybaVjX8uUMQF3ugC75CJUotWhjkI3whdz2Sk1CCxGZCVB
         eQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965573; x=1789570373;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RwJ9BaoNRw2XUxKdRuqOWTaCFPLrZEbkBSC1yAfl2n8=;
        b=PyjhE3pnYrmL2dwHdGT4JlC+kgO2bBjT8usmiojR7eVhTDlQc7rk/P84dIRUfD/CnX
         pi7yNmhG5bAfKHvuY9R4PRldmxws4zLBzlQcupz6Qc5EJX9Rh2n9lE6xtwY/R+4uiyxB
         HWhD0aaLrLapWJMswc8yVyjKb37FJmuRbm70e4F2xqHRVR9gfsQZYAzrkF2UE+sGnw0a
         /e+gcMATc09puxYpL4PZDUCOxpAS5czdU4RfLLhK4hHyL0Dai0GfeWIIu+4Doa7skf7s
         iCaRz5KglSUMY+a1gGnDBkAtfeR18Wzv6jcScxQ+Qzw+RcjTmu0xaB/EhXEft61DnmgZ
         CkDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsVDIMSM/jScMYbnwhglSI07tHTXLZ/Dixr69WcJEeo4zLYv/Pl3SJ3EXS9Bd/FhMtuoQtJ8GljMrd+8i9uu0=@vger.kernel.org
X-Gm-Message-State: AFuF++lk7LmQjojhz+F+g1wf5/rfB5SgTHcri9WZ4xEqwQJMkBnEmOeC
	sM7WPWg8rUkQmiUYICMTW8Hv54LRHe6VAdLAUrvr6e1DhwKH0pxPQsaLqeEYIdkbBb39rG7oZLM
	sypnbsWyisQyAfgd219t8qTUg9hxXFrQ=
X-Gm-Gg: AYBFou33spydSSP6Bm+OkDNKSAEZhxNS0K1oy/I6DtEv4mw0FT7wNT8tgTgM/UrhH1b
	kr+YgdjTgwtc4909AXEu3to4aPbhTpPCvKbHidnVPAFbhVq233QEjZPYtNFcsXG57wadMrwVPGc
	6pkEBdhZj6wSoI/CaRRE7bh0WKdKtImHl7xGc/esbOK/2/wUKaBAthS0LtDMypl2p3u1hBaa1c8
	eG2n2NcldDtg8azs7amo4njAgQqszsWJD4iSMG6AOGGUTiaF0leGxCUj9m0HTtuFJ+RIRwUUQJG
	KNJo5fSBYLOE6EU/xswXW3iXRwfLl+TdH16WHMi3QXXm9lypEpEghQ==
X-Received: by 2002:a53:a44c:0:b0:66f:c1bc:402b with SMTP id
 956f58d0204a3-66fc1bc4611mr7449425d50.88.1788965573319; Wed, 09 Sep 2026
 07:52:53 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 07:52:52 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 07:52:52 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Tianyi Chen <diannaaav@gmail.com>
Date: Wed, 9 Sep 2026 07:52:52 -0700
X-Gm-Features: AcwNN1W1BAWoXddrkNiAeAET4QY2y25VwsVKw_MOPnWrmOuHsPqYEsTulYrFU6Y
Message-ID: <CACGbirQ-xfWymbY9Z440sjbUseLRuaPFT17mBAwddeN7wqVi-w@mail.gmail.com>
Subject: [PATCH v2 RESEND] selftests/sched_ext: Validate select_cpu_and mask constraints
To: Tejun Heo <tj@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, sched-ext@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Tianyi Chen <diannaaav@gmail.com>
Content-Type: text/plain; charset="UTF-8"

From: Tianyi Chen <hi@tychen.cc>
Date: Sun, 06 Sep 2026 22:34:48 +0800

The syscall test only prints the CPU selection result after checking
whether BPF_PROG_TEST_RUN succeeds.

Require -EBUSY for empty and affinity-disjoint custom masks, and allow
a legal singleton candidate to be selected or busy. Reject unexpected
errors and selections outside the custom mask or configured affinity.
Check cpus_mask because migration disabling can temporarily narrow
cpus_ptr under CONFIG_PREEMPT_RCU.

Grow dynamically allocated affinity masks until sched_getaffinity()
succeeds, retaining that allocation size for pinning and restoration.
Restore affinity on all exits after pinning, and skip only the disjoint
case when fewer than two CPUs are allowed.

Assisted-by: LLM
Signed-off-by: Tianyi Chen <hi@tychen.cc>
---
Resending from my Gmail address because delivery from my previous address
failed for the kernel.org and kernel mailing-list recipients. The patch
is unchanged from v2 and still applies to sched_ext/for-7.4.

Changes in v2:
- Check configured affinity through p->cpus_mask, avoiding temporary
  cpus_ptr narrowing when migration is disabled.
- Use zeroed, dynamically allocated affinity masks, retrying EINVAL with
  a larger size and handling restoration and cleanup on failure paths.
- Rebase onto sched_ext/for-7.4.

Validation:
- Build and allowed_cpus tests passed with CONFIG_PREEMPT_RCU, including
  single-CPU affinity and ten runs under load with preempt=full.
- A guest with 2048 possible CPUs and two online CPUs reproduced v1's
  EINVAL. V2 grew the mask from 128 to 256 bytes and passed with both
  full and single-CPU affinity.
- Injected affinity-read, pinning, restoration and BPF test-run errors
  exercised failure handling, including restoration after a BPF failure.
  Forced mask growth with malloc perturbation also passed.

v1: https://lore.kernel.org/r/20260906144029.848978-1-hi@tychen.cc
Review: https://lore.kernel.org/r/53d04980eecb0e5f6eeea25a5cf0dcf5@kernel.org

 .../selftests/sched_ext/allowed_cpus.bpf.c    |  24 +++-
 .../selftests/sched_ext/allowed_cpus.c        | 129 ++++++++++++++++--
 2 files changed, 135 insertions(+), 18 deletions(-)

diff --git a/tools/testing/selftests/sched_ext/allowed_cpus.bpf.c
b/tools/testing/selftests/sched_ext/allowed_cpus.bpf.c
index 9dd72d0da29..f14d7e5bef9 100644
--- a/tools/testing/selftests/sched_ext/allowed_cpus.bpf.c
+++ b/tools/testing/selftests/sched_ext/allowed_cpus.bpf.c
@@ -147,23 +147,41 @@ void BPF_STRUCT_OPS(allowed_cpus_exit, struct
scx_exit_info *ei)
 }

 struct task_cpu_arg {
-	pid_t pid;
+	u64 pid;
+	s64 custom_cpu;
 };

 SEC("syscall")
 int select_cpu_from_user(struct task_cpu_arg *input)
 {
 	struct task_struct *p;
-	int cpu;
+	struct bpf_cpumask *mask;
+	s32 cpu;

 	p = bpf_task_from_pid(input->pid);
 	if (!p)
 		return -EINVAL;

+	mask = bpf_cpumask_create();
+	if (!mask) {
+		bpf_task_release(p);
+		return -ENOMEM;
+	}
+
+	/* A negative custom_cpu leaves the custom mask empty. */
+	if (input->custom_cpu >= 0)
+		bpf_cpumask_set_cpu(input->custom_cpu, mask);
+
 	bpf_rcu_read_lock();
-	cpu = scx_bpf_select_cpu_and(p, bpf_get_smp_processor_id(), 0,
p->cpus_ptr, 0);
+	cpu = scx_bpf_select_cpu_and(p, bpf_get_smp_processor_id(), 0,
+				     cast_mask(mask), 0);
+	if (cpu >= 0 &&
+	    (!bpf_cpumask_test_cpu(cpu, cast_mask(mask)) ||
+	     !bpf_cpumask_test_cpu(cpu, &p->cpus_mask)))
+		cpu = -ERANGE;
 	bpf_rcu_read_unlock();

+	bpf_cpumask_release(mask);
 	bpf_task_release(p);

 	return cpu;
diff --git a/tools/testing/selftests/sched_ext/allowed_cpus.c
b/tools/testing/selftests/sched_ext/allowed_cpus.c
index 093f285ab4b..773699d120e 100644
--- a/tools/testing/selftests/sched_ext/allowed_cpus.c
+++ b/tools/testing/selftests/sched_ext/allowed_cpus.c
@@ -2,7 +2,10 @@
 /*
  * Copyright (c) 2025 Andrea Righi <arighi@nvidia.com>
  */
+#define _GNU_SOURCE
 #include <bpf/bpf.h>
+#include <limits.h>
+#include <sched.h>
 #include <scx/common.h>
 #include <sys/wait.h>
 #include <unistd.h>
@@ -23,17 +26,19 @@ static enum scx_test_status setup(void **ctx)
 	return SCX_TEST_PASS;
 }

-static int test_select_cpu_from_user(const struct allowed_cpus *skel)
+static int test_select_cpu_from_user(const struct allowed_cpus *skel,
+				     const char *name, int custom_cpu,
+				     bool expect_busy)
 {
 	int fd, ret;
-	__u64 args[1];
+	__s32 cpu;
+	__u64 args[] = { getpid(), (__u64)(__s64)custom_cpu };

 	LIBBPF_OPTS(bpf_test_run_opts, attr,
 		.ctx_in = args,
 		.ctx_size_in = sizeof(args),
 	);

-	args[0] = getpid();
 	fd = bpf_program__fd(skel->progs.select_cpu_from_user);
 	if (fd < 0)
 		return fd;
@@ -42,29 +47,123 @@ static int test_select_cpu_from_user(const struct
allowed_cpus *skel)
 	if (ret < 0)
 		return ret;

-	fprintf(stderr, "%s: CPU %d\n", __func__, attr.retval);
+	/* test_run returns the signed BPF result through an unsigned field. */
+	cpu = (__s32)attr.retval;
+	if ((expect_busy && cpu != -EBUSY) ||
+	    (!expect_busy && cpu != -EBUSY && cpu != custom_cpu)) {
+		SCX_ERR("%s: unexpected CPU selection result %d", name, cpu);
+		return -EINVAL;
+	}

 	return 0;
 }

+/* Grow until the mask covers the kernel's CPU range, including
offline CPUs. */
+static int alloc_affinity(cpu_set_t **mask, size_t *size)
+{
+	int nr_cpus = CPU_SETSIZE;
+	cpu_set_t *cpus;
+	int err;
+
+	for (;;) {
+		*size = CPU_ALLOC_SIZE(nr_cpus);
+		cpus = CPU_ALLOC(nr_cpus);
+		if (!cpus)
+			return -ENOMEM;
+		CPU_ZERO_S(*size, cpus);
+		if (!sched_getaffinity(0, *size, cpus)) {
+			*mask = cpus;
+			return nr_cpus;
+		}
+		err = errno;
+		CPU_FREE(cpus);
+		if (err != EINVAL)
+			return -err;
+		if (nr_cpus > INT_MAX / 2)
+			return -EOVERFLOW;
+		nr_cpus *= 2;
+	}
+}
+
 static enum scx_test_status run(void *ctx)
 {
 	struct allowed_cpus *skel = ctx;
-	struct bpf_link *link;
+	enum scx_test_status status = SCX_TEST_FAIL;
+	cpu_set_t *original = NULL, *pinned = NULL;
+	bool affinity_changed = false;
+	size_t size;
+	int first = -1, second = -1, cpu, nr_cpus;
+	struct bpf_link *link = NULL;
+
+	nr_cpus = alloc_affinity(&original, &size);
+	if (nr_cpus < 0) {
+		SCX_ERR("Failed to get affinity (%d)", -nr_cpus);
+		goto out;
+	}
+	pinned = CPU_ALLOC(nr_cpus);
+	if (!pinned) {
+		SCX_ERR("Failed to allocate affinity mask");
+		goto out;
+	}
+	for (cpu = 0; cpu < nr_cpus; cpu++) {
+		if (!CPU_ISSET_S(cpu, size, original))
+			continue;
+		if (first < 0) {
+			first = cpu;
+		} else {
+			second = cpu;
+			break;
+		}
+	}
+	if (first < 0) {
+		SCX_ERR("No CPU in affinity mask");
+		goto out;
+	}

 	link = bpf_map__attach_struct_ops(skel->maps.allowed_cpus_ops);
-	SCX_FAIL_IF(!link, "Failed to attach scheduler");
-
-	/* Pick an idle CPU from user-space */
-	SCX_FAIL_IF(test_select_cpu_from_user(skel), "Failed to pick idle CPU");
-
-	/* Just sleeping is fine, plenty of scheduling events happening */
+	if (!link) {
+		SCX_ERR("Failed to attach scheduler");
+		goto out;
+	}
+
+	if (test_select_cpu_from_user(skel, "empty mask", -1, true))
+		goto out;
+
+	/* A legal candidate may be busy; selection need not succeed. */
+	if (test_select_cpu_from_user(skel, "legal candidate", first, false))
+		goto out;
+
+	if (second >= 0) {
+		CPU_ZERO_S(size, pinned);
+		CPU_SET_S(first, size, pinned);
+		if (sched_setaffinity(0, size, pinned)) {
+			SCX_ERR("Failed to pin task (%d)", errno);
+			goto out;
+		}
+		affinity_changed = true;
+		if (test_select_cpu_from_user(skel, "disjoint masks", second, true))
+			goto out;
+	} else {
+		fprintf(stderr, "Skipping disjoint masks: need two allowed CPUs\n");
+	}
+
+	/* Just sleeping is fine, plenty of scheduling events happening. */
 	sleep(1);
-
-	SCX_EQ(skel->data->uei.kind, EXIT_KIND(SCX_EXIT_NONE));
+	if (skel->data->uei.kind != EXIT_KIND(SCX_EXIT_NONE)) {
+		SCX_ERR("Scheduler exited unexpectedly");
+		goto out;
+	}
+	status = SCX_TEST_PASS;
+
+out:
+	if (affinity_changed && sched_setaffinity(0, size, original)) {
+		SCX_ERR("Failed to restore affinity (%d)", errno);
+		status = SCX_TEST_FAIL;
+	}
 	bpf_link__destroy(link);
-
-	return SCX_TEST_PASS;
+	CPU_FREE(pinned);
+	CPU_FREE(original);
+	return status;
 }

 static void cleanup(void *ctx)
-- 
2.55.0
