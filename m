Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16ED282F36
	for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 05:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787118465; cv=pass; b=pukhVTCeAqQw1Wn9/2ZsHjDUAlO/QNtaxo1k+SW7napNiBgwYYXv+bGFJMZM16YGlet8EKBOPU7Ch7dM27qiLScqw6oqswr2JEOChjK3nwxCAbMHtGEs3OyU1gtw4jF27UR+hwBSs2PlvL6sarvqvWAYruaX7Dt4A/qGclaCmTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787118465; c=relaxed/simple;
	bh=QqGG9zg2g0po8JmQMzYcP4aUxzwp1FRZdlQ+QuGD8sA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IEtm2KIpwukSqkqLP0rcJnbm03bHb/87YZUuvDSi631HG64aKNZGv0oaBxPu0J1barBauNjdTi8NSmgTU7Q6x5oFKtlVZFzPBECiZJ6LAKEfVF1NADGSuLr9vm/GQ3ge2XUdDpLOc4GxrVGYshklHpYz62NbB9eQrA4U9TMzNNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eAL8a4V8; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eAL8a4V8"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51c10ed63c0so92461cf.1
        for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 22:47:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787118463; cv=none;
        d=google.com; s=arc-20260327;
        b=syKEUo3y/mnD45Dz2VF3mpJA8VI00ZZ3XaSXZDQdmoHzzVtk2SjMUoP+JkxWlLE4l7
         Yd+uPi4oGKCoZayOSha0q0fv7LPiQJtaauTbXRk9Cw0WjlsD277lhYgkApb94nT+plMp
         3iVK2AMSuiz+7Y/B8/xUdza4w514Ynn8miguYKk2/HPOF6wdkQ6cIOQ9WDSpLTSOtCgM
         x77QdOCOfUn1xZZVM4NQwXSevo3sCuqIExRFfgi0jhJfPW8JeaMuYdpIpXigldPZ+PfH
         8JCTqFeICTvfxuILNgUPIV6Jes7G/kNx+LlZi0XM1L+5WCE/xoqwTVqIeG1wvYhoTGO5
         8Q8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eAikeRUtrk2w//RLMQmTPI70kjePGXV7Mxow/7ryR7Q=;
        fh=HOX71gUPPqoGqwS9Bm+1vpavzs+F0vbtDX6DHmhBtLU=;
        b=qK1EsOkxGFuI0ZHcQ+swddPilLjFgi9MD2KlQl4Gr+2N5X0DifLVg4v4pbYE8yrK9S
         WADnXl5fFON3kUQjK61rklT7AI6PeH8bqxhK/LCy/5rOzeSXWKxuaDq/30PgF1jvTOzA
         UGbTZAEMy8/ifYDZowwy81j2XptpWth9+p44FcKTXXwwKyoB9K1bjr2I8cqCrk8v6raB
         cykspRwguyy+a5Zh+Mdd+5fwrm4xDah0DP81ZgyqZQXKz3cr912SrDXGgUYOsIjX57Y9
         9vo/ExoqnZ3PTxzpoSED4/+8veOfcntIRbbnbEELoSPxWgZA6Cd7eW6lsC6YeCBpK7lM
         s0pA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787118463; x=1787723263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eAikeRUtrk2w//RLMQmTPI70kjePGXV7Mxow/7ryR7Q=;
        b=eAL8a4V8q5WI/EKQQrrMEJopuJ/6Ao3t8ZTOvyfHRMmSfbvJ5F5aHQ+zwDEkbJ3URq
         xEG9Vww5C/758ORC/+oMmpPgR+R9o/iYeSh1zraPrs1kWNlOZ2dp+lv9IO+xhkaj1LNy
         31g+T3PZeXg3zcghmLEQS/TTuhAy6nD6lgL5ozntDTnEWknz1bWindQOu9KcOq1/v9vs
         0IsbhMyP9R76wLFsWJNApAniPeyDI9xML9n0s2rIoWRxB2NIJTdLOt2B6nlxVGQAAcxN
         lC1x2UVEGSb9Rq0xJsBgK4o/VHw9e0mPdcLMOgDCfFSbTAFeRI40uyGIKcO3YZa/NVPe
         JgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787118463; x=1787723263;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eAikeRUtrk2w//RLMQmTPI70kjePGXV7Mxow/7ryR7Q=;
        b=XSWCUaikbm7kyCNVj+VEQVeSLlIXYSPyt4UZLbR+AbTWnxuM0GvcUftMBACjxu0z+i
         hlXdfkuQ9gvWkPVXwtCqI9HBAjXYLLn/isSVJysio42UljUtR8Xo2BM5wIHdOB6urHtm
         NmH1MZh4SG6bN0ksZcFC66+sjB+QLa7jwltTsowp6IE+nRdzrrsivEli9n1cCWT16Rgy
         LYs4GfPrwHD2HiLtditKpXLnYVjHI2RVgmO/wrzsk2lVxjAh7Ep2jSYZLE3XCspAWseM
         Aw5rwgXhwAfB58VGEgrjvThDPswh4lCh1SgOyGsZcTnyXF0gHtR7HIfMGKZySyTcKFJQ
         WqSw==
X-Forwarded-Encrypted: i=1; AHgh+RrrcrRW+4doq2JJSXJBWc4LS4AyMqEOZin9GYI5m3s4Ym8DhVeTDfjpHDk3XOux+IO29eNhrrow4+2sItDp36Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPQP/b9s6v+SQZb4qH5UAOxHPYWhAGJi0oVKC8j7+jTIIDxzwu
	gNIW+VygZ2yx6FoX+LUA007oyr1BIZvJrynx4FVvvYyY6pkshTmjurhzq6RdztJYce+p5slC4VJ
	arb7QtAbVT2T9VBrPKNK06w+Ru73jKl6wbzdxerIR
X-Gm-Gg: AR+sD11fGeQ2DAZlUVWjWLCnXXLs5Fwhisb1rp1ocD5hEz76U7DN/ubYE0a/c+nbEfa
	Cp00wamjtJxNI94dJHIeLZnCPuQNNa3YXW0To0/cwzKmKHBRgP7s8J+9dZAQXAqaFUvSvevZ6fF
	0F1U0oR+DiRiPuZUzWH1ZevbrOPp8e7qmLs+4dD/d4mHjaQedJUvll41Ue+Lehc0iI3PjaVPY94
	EFJ2EcuZLwAUalcA2j//RX2o2018jfGj+LkN8x1UjJZBVJ6qgASwMkYXHbUopmdDU5chTgpIgh8
	Prd/PEVwyEP40isazq47YXJDev2c2ggGXL1/ajBV2ALctfK4CieV4Ko=
X-Received: by 2002:a05:622a:2618:b0:51c:ca9:3d15 with SMTP id
 d75a77b69052e-52dd680e44bmr7427291cf.12.1787118460911; Tue, 18 Aug 2026
 22:47:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813133723.1663605-1-cui.tao@linux.dev>
In-Reply-To: <20260813133723.1663605-1-cui.tao@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 18 Aug 2026 22:47:29 -0700
X-Gm-Features: AcwNN1Ww-2AUdmi3cNzwwoRYAHg__BmITPjdT4wg_3f7OUWF7SILjlo5EEjtKuc
Message-ID: <CAJuCfpGxK62YWGS+0Ht63h-CZtiY+WPkvqTnYw+4W4Yna0onmg@mail.gmail.com>
Subject: Re: [PATCH v3] selftests/cgroup: add PSI pressure trigger and
 validation tests
To: Tao Cui <cui.tao@linux.dev>
Cc: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Shuah Khan <shuah@kernel.org>, 
	cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ziyang Men <ziyang.meme@gmail.com>, 
	Tao Cui <cuitao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 6:37=E2=80=AFAM Tao Cui <cui.tao@linux.dev> wrote:
>
> From: Tao Cui <cuitao@kylinos.cn>
>
> The cgroup selftests have no PSI coverage. Add test_psi.c: per-resource
> trigger smoke tests (one trigger per fd, IRQ full-only), a
> cgroup.pressure hide/show toggle test, and a CPU-pressure trigger test
> using over-subscription. Skips when PSI is disabled or a resource is
> absent.
>
> Signed-off-by: Tao Cui <cuitao@kylinos.cn>
>
> ---
> Changes since v2 (Suren Baghdasaryan, Michal Koutny review):
> - Restructure the trigger test into per-resource cases (io, memory, cpu,
>   irq) so a failure points at the specific resource; irq is skipped when
>   /proc/pressure/irq is absent.
> - Spawn the CPU hogs with cg_run_nowait() instead of open-coding fork(),
>   and arm the trigger with a 2s window so unprivileged users can set it.
> - Address the remaining review comments on cleanup and robustness:
>   guard teardown with a "created" flag, use cg_read_strcmp() instead of
>   atoi(), report strerror() on errors, and fix the unused-parameter and
>   sign-compare nits.
>
> Changes since v1 (Michal Koutny, sashiko review):
> - Keep trigger tests smoke-level; switch the firing test from memory to
>   CPU pressure; drop churn_memory().
> - Keep the runner out of the cgroup; add PSI/IRQ skip-guards and a
>   .gitignore entry.
>
> Link: https://lore.kernel.org/all/20260724025826.504586-1-cui.tao@linux.d=
ev/
> Link: https://lore.kernel.org/all/20260728083742.2359320-1-cui.tao@linux.=
dev/
> ---
>  tools/testing/selftests/cgroup/.gitignore |   1 +
>  tools/testing/selftests/cgroup/Makefile   |   2 +
>  tools/testing/selftests/cgroup/config     |   1 +
>  tools/testing/selftests/cgroup/test_psi.c | 296 ++++++++++++++++++++++
>  4 files changed, 300 insertions(+)
>  create mode 100644 tools/testing/selftests/cgroup/test_psi.c
>
> diff --git a/tools/testing/selftests/cgroup/.gitignore b/tools/testing/se=
lftests/cgroup/.gitignore
> index 952e4448bf07..ce2b907c57ea 100644
> --- a/tools/testing/selftests/cgroup/.gitignore
> +++ b/tools/testing/selftests/cgroup/.gitignore
> @@ -8,5 +8,6 @@ test_kill
>  test_kmem
>  test_memcontrol
>  test_pids
> +test_psi
>  test_zswap
>  wait_inotify
> diff --git a/tools/testing/selftests/cgroup/Makefile b/tools/testing/self=
tests/cgroup/Makefile
> index e01584c2189a..a8c69e37332a 100644
> --- a/tools/testing/selftests/cgroup/Makefile
> +++ b/tools/testing/selftests/cgroup/Makefile
> @@ -16,6 +16,7 @@ TEST_GEN_PROGS +=3D test_kill
>  TEST_GEN_PROGS +=3D test_kmem
>  TEST_GEN_PROGS +=3D test_memcontrol
>  TEST_GEN_PROGS +=3D test_pids
> +TEST_GEN_PROGS +=3D test_psi
>  TEST_GEN_PROGS +=3D test_zswap
>
>  LOCAL_HDRS +=3D $(selfdir)/clone3/clone3_selftests.h $(selfdir)/pidfd/pi=
dfd.h
> @@ -32,4 +33,5 @@ $(OUTPUT)/test_kill: $(LIBCGROUP_O)
>  $(OUTPUT)/test_kmem: $(LIBCGROUP_O)
>  $(OUTPUT)/test_memcontrol: $(LIBCGROUP_O)
>  $(OUTPUT)/test_pids: $(LIBCGROUP_O)
> +$(OUTPUT)/test_psi: $(LIBCGROUP_O)
>  $(OUTPUT)/test_zswap: $(LIBCGROUP_O)
> diff --git a/tools/testing/selftests/cgroup/config b/tools/testing/selfte=
sts/cgroup/config
> index 39f979690dd3..8a3ef479e83d 100644
> --- a/tools/testing/selftests/cgroup/config
> +++ b/tools/testing/selftests/cgroup/config
> @@ -4,3 +4,4 @@ CONFIG_CGROUP_FREEZER=3Dy
>  CONFIG_CGROUP_SCHED=3Dy
>  CONFIG_MEMCG=3Dy
>  CONFIG_PAGE_COUNTER=3Dy
> +CONFIG_PSI=3Dy
> diff --git a/tools/testing/selftests/cgroup/test_psi.c b/tools/testing/se=
lftests/cgroup/test_psi.c
> new file mode 100644
> index 000000000000..cfb412f61458
> --- /dev/null
> +++ b/tools/testing/selftests/cgroup/test_psi.c
> @@ -0,0 +1,296 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#define _GNU_SOURCE
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <poll.h>
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <unistd.h>
> +#include <linux/limits.h>
> +
> +#include "kselftest.h"
> +#include "cgroup_util.h"
> +
> +#define PSI_POLL_TIMEOUhas this check T_MS    5000
> +
> +/* PSI triggers are written with a trailing NUL the kernel parser expect=
s. */
> +static ssize_t write_trigger(int fd, const char *trigger)
> +{
> +       return write(fd, trigger, strlen(trigger) + 1);
> +}
> +
> +static int pressure_open(const char *resource)
> +{
> +       char path[PATH_MAX];
> +       int fd;
> +
> +       snprintf(path, sizeof(path), "/proc/pressure/%s", resource);
> +       fd =3D open(path, O_RDWR);
> +       if (fd < 0)
> +               ksft_print_msg("open %s: %s\n", path, strerror(errno));
> +       return fd;
> +}
> +
> +/*
> + * /proc/pressure/<resource> accepts exactly one trigger per file
> + * descriptor. For io, memory and cpu verify that a "some" trigger arms
> + * and that a second trigger on the same fd is rejected with EBUSY. For
> + * irq, which only tracks "full", verify that "some" is rejected and
> + * "full" arms. irq is optional -- it only exists with IRQ-time
> + * accounting -- so a missing /proc/pressure/irq is SKIP, not FAIL.
> + */
> +static int test_proc_trigger(const char *resource, bool full_only)
> +{
> +       int fd, ret =3D KSFT_FAIL;
> +
> +       fd =3D pressure_open(resource);
> +       if (fd < 0)
> +               return full_only ? KSFT_SKIP : KSFT_FAIL;
> +
> +       if (!full_only) {
> +               if (write_trigger(fd, "some 150000 2000000") <=3D 0) {
> +                       ksft_print_msg("%s: 'some' trigger rejected: %s\n=
",
> +                                      resource, strerror(errno));
> +                       goto out;
> +               }
> +               if (write_trigger(fd, "full 150000 2000000") !=3D -1 ||
> +                   errno !=3D EBUSY) {
> +                       ksft_print_msg("%s: second trigger not EBUSY\n",
> +                                      resource);
> +                       goto out;
> +               }
> +       } else {
> +               if (write_trigger(fd, "some 150000 2000000") !=3D -1) {
> +                       ksft_print_msg("irq: 'some' trigger unexpectedly =
accepted\n");
> +                       goto out;
> +               }
> +               if (write_trigger(fd, "full 150000 2000000") <=3D 0) {
> +                       ksft_print_msg("irq: 'full' trigger rejected: %s\=
n",
> +                                      strerror(errno));
> +                       goto out;
> +               }
> +       }
> +
> +       ret =3D KSFT_PASS;
> +out:
> +       close(fd);
> +       return ret;

You don't really need "ret" variable. Just "return KSFT_FAIL;" here is enou=
gh.

> +}
> +
> +/*
> + * cgroup.pressure gates visibility of the per-resource *.pressure files
> + * inside a cgroup: writing 0 hides them, writing 1 shows them again.
> + * Drive one hide/show cycle and check that memory.pressure appears and
> + * disappears along with it.
> + */
> +static int test_cgroup_pressure_toggle(const char *root)
> +{
> +       char buf[BUF_SIZE];
> +       char *cg =3D NULL;
> +       int ret =3D KSFT_FAIL, created =3D 0;

Again, you don't need "ret" variable here.

> +
> +       cg =3D cg_name(root, "psi_toggle_test");
> +       if (!cg)
> +               goto cleanup;
> +       if (cg_create(cg)) {
> +               ksft_print_msg("cg_create: %s\n", strerror(errno));
> +               goto cleanup;
> +       }
> +       created =3D 1;

Nope. The way we usually do the cleanup is by jumping to the
appropriate label instead of adding extra state flags. In this case
that would look something like this:

       cg =3D cg_name(root, "psi_toggle_test");
       if (!cg)
               return KSFT_FAIL;

       if (cg_create(cg)) {
               ksft_print_msg("cg_create: %s\n", strerror(errno));
               goto free_cg;
       }

       if (cg_write(cg, "cgroup.pressure", "0")) {
               ksft_print_msg("write cgroup.pressure=3D0: %s\n", strerror(e=
rrno));
               goto cleanup;
       }
...
       return KSFT_PASS;
cleanup:
       cg_destroy(cg);
free_cg:
       free(cg);
       return KSFT_FAIL;
}

> +
> +       if (cg_write(cg, "cgroup.pressure", "0")) {
> +               ksft_print_msg("write cgroup.pressure=3D0: %s\n", strerro=
r(errno));
> +               goto cleanup;
> +       }
> +       if (cg_read_strcmp(cg, "cgroup.pressure", "0\n")) {
> +               ksft_print_msg("cgroup.pressure readback !=3D 0\n");
> +               goto cleanup;
> +       }
> +       if (cg_read(cg, "memory.pressure", buf, sizeof(buf)) >=3D 0) {
> +               ksft_print_msg("memory.pressure readable while hidden\n")=
;
> +               goto cleanup;
> +       }
> +
> +       if (cg_write(cg, "cgroup.pressure", "1")) {
> +               ksft_print_msg("write cgroup.pressure=3D1: %s\n", strerro=
r(errno));
> +               goto cleanup;
> +       }
> +       if (cg_read_strcmp(cg, "cgroup.pressure", "1\n")) {
> +               ksft_print_msg("cgroup.pressure readback !=3D 1\n");
> +               goto cleanup;
> +       }
> +       if (cg_read(cg, "memory.pressure", buf, sizeof(buf)) < 0) {
> +               ksft_print_msg("memory.pressure unreadable after enabling=
\n");
> +               goto cleanup;
> +       }
> +
> +       ret =3D KSFT_PASS;
> +cleanup:
> +       if (created)
> +               cg_destroy(cg);
> +       free(cg);
> +       return ret;
> +}
> +
> +/* A child that burns CPU forever; stopped by cg_killall() in the parent=
. */
> +static int hog_cpu(const char *cgroup, void *arg)
> +{
> +       for (;;)
> +               ;

This loop looks strange. Maybe:

       for (;;) {}

> +       return 0;
> +}
> +
> +/*
> + * Arm a "some" trigger on a cgroup's cpu.pressure, oversubscribe the
> + * cgroup with more spinning hogs than there are CPUs, and check that th=
e
> + * trigger fires once the cgroup stalls on CPU.
> + */
> +static int test_cgroup_trigger_fire(const char *root)
> +{
> +       char *cg =3D NULL, *cpupress =3D NULL;
> +       int fd =3D -1, ret =3D KSFT_FAIL, created =3D 0, i;

Please define each variable on a separate line.

> +       long ncpus;
> +
> +       cg =3D cg_name(root, "psi_trigger_test");
> +       if (!cg)
> +               goto cleanup;
> +       if (cg_create(cg)) {
> +               ksft_print_msg("cg_create: %s\n", strerror(errno));
> +               goto cleanup;
> +       }
> +       created =3D 1;

Same as above. Jump to the appropriate label.

> +
> +       cpupress =3D cg_control(cg, "cpu.pressure");
> +       if (!cpupress)
> +               goto cleanup;
> +       fd =3D open(cpupress, O_RDWR);
> +       if (fd < 0) {
> +               ksft_print_msg("open cpu.pressure: %s\n", strerror(errno)=
);
> +               goto cleanup;
> +       }
> +
> +       /*
> +        * 1usec threshold over a 2s window: any CPU stall fires it. The =
2s
> +        * window is the smallest unprivileged users are allowed to arm.
> +        */
> +       if (write_trigger(fd, "some 1 2000000") <=3D 0) {
> +               ksft_print_msg("arm trigger: %s\n", strerror(errno));
> +               goto cleanup;
> +       }
> +
> +       ncpus =3D sysconf(_SC_NPROCESSORS_ONLN);
> +       if (ncpus <=3D 0) {

I don't think this syscall will ever return 0, so you just need to
check for -1. Also reporting -1 in the error log isn't very
informative. Instead report strerror(errno).

> +               ksft_print_msg("sysconf(_SC_NPROCESSORS_ONLN) returned %l=
d\n",
> +                              ncpus);
> +               goto cleanup;
> +       }
> +
> +       /* ncpus+1 hogs guarantee CPU contention inside the cgroup. */
> +       for (i =3D 0; i < ncpus + 1; i++) {
> +               if (cg_run_nowait(cg, hog_cpu, NULL) < 0) {
> +                       ksft_print_msg("spawn hog %d: %s\n", i, strerror(=
errno));
> +                       goto cleanup;
> +               }
> +       }
> +
> +       struct pollfd pfd =3D { .fd =3D fd, .events =3D POLLPRI };
> +
> +       switch (poll(&pfd, 1, PSI_POLL_TIMEOUT_MS)) {
> +       case -1:
> +               ksft_print_msg("poll: %s\n", strerror(errno));
> +               goto cleanup;

So, goto cleanup here but break everywhere else? Consistency would be
nice, so please use break here as well.

> +       case 0:
> +               ksft_print_msg("trigger did not fire (could not induce CP=
U pressure)\n");
> +               ret =3D KSFT_SKIP;

This means your trigger timed out. Why is this treated as KSFT_SKIP
and not as KSFT_FAIL?

> +               break;
> +       default:
> +               if (pfd.revents & POLLPRI)
> +                       ret =3D KSFT_PASS;
> +               else
> +                       ksft_print_msg("poll returned 0x%x\n", pfd.revent=
s);
> +               break;
> +       }
> +
> +cleanup:
> +       if (fd >=3D 0)
> +               close(fd);
> +       if (created) {
> +               cg_killall(cg);
> +               cg_destroy(cg);
> +       }
> +       free(cpupress);
> +       free(cg);
> +       return ret;
> +}
> +
> +struct psi_proc_test {
> +       const char *name;
> +       const char *resource;
> +       bool full_only;
> +};
> +static const struct psi_proc_test proc_tests[] =3D {
> +       { "proc_trigger_io",     "io",     false },
> +       { "proc_trigger_memory", "memory", false },
> +       { "proc_trigger_cpu",    "cpu",    false },
> +       { "proc_trigger_irq",    "irq",    true  },
> +};
> +
> +struct psi_cg_test {
> +       const char *name;
> +       int (*fn)(const char *root);
> +};
> +static const struct psi_cg_test cg_tests[] =3D {
> +       { "cgroup_pressure_toggle", test_cgroup_pressure_toggle },
> +       { "cgroup_trigger_fire",    test_cgroup_trigger_fire },
> +};
> +
> +int main(int argc, char **argv)
> +{
> +       char root[PATH_MAX];
> +       int psi_fd, i;
> +
> +       ksft_print_header();
> +       ksft_set_plan(ARRAY_SIZE(proc_tests) + ARRAY_SIZE(cg_tests));
> +
> +       if (cg_find_unified_root(root, sizeof(root), NULL))
> +               ksft_exit_skip("cgroup v2 isn't mounted\n");
> +
> +       /* PSI must be enabled (CONFIG_PSI=3Dy, not disabled on the cmdli=
ne). */
> +       psi_fd =3D open("/proc/pressure/memory", O_RDONLY);
> +       if (psi_fd < 0)
> +               ksft_exit_skip("PSI unavailable (CONFIG_PSI=3Dn or psi=3D=
0)\n");
> +       close(psi_fd);
> +
> +       for (i =3D 0; i < ARRAY_SIZE(proc_tests); i++) {
> +               switch (test_proc_trigger(proc_tests[i].resource,
> +                                         proc_tests[i].full_only)) {
> +               case KSFT_PASS:
> +                       ksft_test_result_pass("%s\n", proc_tests[i].name)=
;
> +                       break;
> +               case KSFT_SKIP:
> +                       ksft_test_result_skip("%s\n", proc_tests[i].name)=
;
> +                       break;
> +               default:
> +                       ksft_test_result_fail("%s\n", proc_tests[i].name)=
;
> +                       break;
> +               }
> +       }
> +
> +       for (i =3D 0; i < ARRAY_SIZE(cg_tests); i++) {
> +               switch (cg_tests[i].fn(root)) {
> +               case KSFT_PASS:
> +                       ksft_test_result_pass("%s\n", cg_tests[i].name);
> +                       break;
> +               case KSFT_SKIP:
> +                       ksft_test_result_skip("%s\n", cg_tests[i].name);
> +                       break;
> +               default:
> +                       ksft_test_result_fail("%s\n", cg_tests[i].name);
> +                       break;
> +               }
> +       }

Please convert this to use
https://docs.kernel.org/dev-tools/kselftest.html#test-harness as I
suggested before. This code will look much simpler. Even if some other
tests are not using it, there is no reason for new tests not to take
advantage of the existing harness. You will find planty of examples
which use them.

> +
> +       ksft_finished();
> +}
> --
> 2.43.0
>
