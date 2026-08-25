Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCA33254A0
	for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 17:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787679228; cv=pass; b=AvkjPUA7U9/jYlYt57QEa37lZMVLpWA8Y9Obc2JD7bRqTnrCkuXHXtzJlzkKHjqjMgWZ6atEJS757cd3SB88gQbZQ78r1ZuyvS0gPgT3Yj/fQpUBDMuW5YwCFk1Wb0vMKN8WssZr1arETnU2DrwOjUVwf2cWpvr2TLILN7E6nb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787679228; c=relaxed/simple;
	bh=l1aj7BohNvs2xdJln1gXzXfwjR5L6Cxqg3GYR6oVrYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W8mo7t42MS1HJJHpKH8bvlcz0SvGEeYqDVEr3bU443T7Y5xAKjqxIIvLSCoaCc9POYivJ990m+pHJYLx+NmUW4SrqgxYa1WvILXuVAMQwBebqWw3OHEzL3bu0MsWpy/AWXvmtCOtEDJ+ziNzqR6jGVk//H0utBCKPVoFZmAbmnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tP70tSGw; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tP70tSGw"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51c15a5b265so17831cf.0
        for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 10:33:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787679223; cv=none;
        d=google.com; s=arc-20260327;
        b=DHA2NR7nEEva5UouGzg2DlaunAJjU6pnR1nS72jZYK4Y7AT87rMTZYpXPdeDfTI8+F
         KRy9Eejr9mIvoVhOYypEdlEwpkFeY/mfb4YlS0gD6WvgNmrVehX9WUKL5xybkGsbdDMm
         41wYqXLinfTruhTkxTQT+D2STbjIqwhOE+96pEPD8AIfupOYzDl6QgqlGAWwfFFRvsiM
         Z9dB/6OixXSIhiIovXUd2NI0HwPG1DZ7W6VGrLH1yx5E+oB/3d6gC3v35mwESZWhKaMb
         j5mf3Wu7tqdRuaSm08NmWgvmvnzuOYJPr6XgBpJuFad2t8KVpvOsG2S8JGsgDqPx9gu2
         v1OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=miL6j/NyiHkbM2s3B1v3pMNIcwfZ7GHGyvSTdJxNxv4=;
        fh=m3QkMM5htK23PQR7MPhGi3kgR/czzmFto4IvnhQLBpw=;
        b=T1LZKBO+xiRdtHl2rzXByk+NeynmyQW4XDt6u6y1LFhRCOGGKS6GVJ2Pxl+FQ9llV6
         nakEazl9apUeU6VJizW47sZGITgVPrOsEuNbjSTJAmrWbJwsGFPUzoD7Zo9meUygORa8
         vzsDk4wdiNl8cELlUO3SyWtjAQtrRguxPf2lspnAo/MYEUE1MTyhl2PeYzt9SHkVQE4m
         N6nevOJ2BFKHUjLjTVQDIIxoUzSyirQ8e0m1x5fIwhxWcp2QxFO7BwgXEzcoC8uWTZts
         tm/LLsE7I8OhbZ9qUY+Er4LXO48mQDVB2JHgOO6/MwznMT4jWu7mCEdAA2NP+pQixNAL
         P1KQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787679223; x=1788284023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=miL6j/NyiHkbM2s3B1v3pMNIcwfZ7GHGyvSTdJxNxv4=;
        b=tP70tSGw/sSWcls/EHp1z8wlLqcstSZ9PU0kum62cczsh6waPI/qiOnkKNpnbj0Hll
         G9u3tO8ZbG587xRcse/nmlG4X9Y6hZ6tNIjIZJ4XTEKcSA0MPtXoIsJyQdKVDNk99BvT
         PcRIe1uYWttD+urG1xbxGnhLcWgyF2ZO0sy6+PSzkWCY0JamDn6mKNPOTML5OJIUUyXb
         SkJ0w5BF7cld/OcQWe3KqBKex9WlTU5dnl9J6HAA4nDLS20zelfIpa0pX/ffIdEQz6Fk
         c6eTFxrIgzNrbUpGp+Zh+NT9fedQ/MkNxztFbqLIutbklF+IsER2uBwShdvBd901AN3U
         c8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787679223; x=1788284023;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=miL6j/NyiHkbM2s3B1v3pMNIcwfZ7GHGyvSTdJxNxv4=;
        b=GJ75oIXq6PvROlLmJnOQlU5mIosOutmau0xjVBo0jjV7/+GxC/uYd7GXtrYHWo/7+Q
         ITlKdUg9QCdu5ap6nq5gf2VwVV3Aw5nug2zmboie/g1b/naTnIsu9+ksPftb/nNGiLr3
         36jPGUAN1tYzGIHPekpHVPAYvJriDhmUcEwySO4Nl5Wu6j6CNBGT2Z07COtOWffPglSJ
         fN2WRfsvL57EHVBprIb3PQJnTj517m4UTiQQt4cKSm4cbzLhU+Qx7qXqhuJJ/0OX1D/E
         G3nS5+KKD93hqOF37lLdQkf6McvD6gfC7WWmxT5AhdSiKhudm2+fNG3UvmYg61IyPegG
         FksA==
X-Forwarded-Encrypted: i=1; AHgh+RrDR+CGS2Km06l8OJF3grVDcj3D4cA2rWdH4T1Eu9dNrYoFDuN9PltYQ1EAXp4xhHYRQ24KG6+YIbC6dxFMFzo=@vger.kernel.org
X-Gm-Message-State: AFuF++lAYU4h6pH4EbUhrzlKOSqVLh6pFcJnamoUZVkWXmo8nrsWDOOt
	8tSb/qU5qQSolcUp4HKXci/bWexdhUpCxSwLW9rgQcdd3qJ5SiGFpKi8PVQcVewjWLu0IKla7CW
	jI80w75J0ksXlj27wuD/VhDmauISbjZlJJiuJTp4K
X-Gm-Gg: AR+sD12DRWY1Wi7FdGzf4ocsKk3/ycxWLKSwH5Xj1O5YCCSiHElGFAuISANiWcuRXgy
	aMGCP07QJvItUPnS5IR1tFT2+0AQvDQI0c90oW1FBTpsAEjQZj4mBP7p/awAJ9vQwhd9bhbn8Cx
	DZlF/qauTtEivJsSJDwZLAPc8iQDBT50V8siOE6Bc9769LxKudbnhkcgysnv/lDDWSHtoe0Qn36
	9629Cz0xvsJ5iixhxXLOZCP6M8jvqa/sjKUfFVYsny412eiddXFICixnDeWedHHMworduNwpibK
	kT4rHZdIZpfwiMXBpQ3BshxQt1IHoR+SwkSq+XKWi0lI7IWQo7o+3EDKyGOwOTwNCrA2Ngwre/s
	=
X-Received: by 2002:a05:622a:134b:b0:52e:1e8:21f4 with SMTP id
 d75a77b69052e-52e30914d50mr22535491cf.5.1787679221519; Tue, 25 Aug 2026
 10:33:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824085913.546741-1-cui.tao@linux.dev>
In-Reply-To: <20260824085913.546741-1-cui.tao@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 25 Aug 2026 10:33:29 -0700
X-Gm-Features: AcwNN1UXMUleJ6BNlw8H69MeT8_dwagfX_OtLaHLXWsiYb32zP_YP4NE_g7CUgk
Message-ID: <CAJuCfpHgYW4WHf3AH1Oj9TAthvCN_aqNW1uxMN2O109wd6Lckw@mail.gmail.com>
Subject: Re: [PATCH v4] selftests/cgroup: add PSI pressure trigger and
 validation tests
To: Tao Cui <cui.tao@linux.dev>
Cc: Michal Koutny <mkoutny@suse.com>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ziyang Men <ziyang.meme@gmail.com>, Tao Cui <cuitao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 1:59=E2=80=AFAM Tao Cui <cui.tao@linux.dev> wrote:
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
> Changes since v3 (Suren Baghdasaryan review):
> - Convert to the kselftest harness: each case is a TEST_F(psi, ...)
>   with the cgroup root/PSI availability checks in FIXTURE_SETUP() and
>   the teardown (kill hogs, destroy cgroup) in FIXTURE_TEARDOWN(),
>   which also removes the "ret"/"created" bookkeeping.
> - A trigger that does not fire within the poll timeout is now a FAIL
>   instead of a SKIP: ncpus+1 hogs with a 1usec threshold must stall,
>   so a timeout indicates a real problem.
> - Treat a poll() timeout and a poll() error uniformly via ASSERT.
> - Check sysconf(_SC_NPROCESSORS_ONLN) only for -1 and report
>   strerror(errno); declare variables one per line; for(;;) {}.
> - Make hog_cpu() die with the runner via PR_SET_PDEATHSIG so an
>   interrupted run does not leave orphaned hogs pinning every CPU.
>
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
> v1: https://lore.kernel.org/all/20260724025826.504586-1-cui.tao@linux.dev=
/
> v2: https://lore.kernel.org/all/20260728083742.2359320-1-cui.tao@linux.de=
v/
> v3: https://lore.kernel.org/all/20260813133723.1663605-1-cui.tao@linux.de=
v/
> ---
>  tools/testing/selftests/cgroup/.gitignore |   1 +
>  tools/testing/selftests/cgroup/Makefile   |   2 +
>  tools/testing/selftests/cgroup/config     |   1 +
>  tools/testing/selftests/cgroup/test_psi.c | 206 ++++++++++++++++++++++
>  4 files changed, 210 insertions(+)
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
> index 000000000000..d5fab10f4fd4
> --- /dev/null
> +++ b/tools/testing/selftests/cgroup/test_psi.c
> @@ -0,0 +1,206 @@
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
> +#include <sys/prctl.h>
> +#include <linux/limits.h>
> +
> +#include "../kselftest_harness.h"
> +#include "cgroup_util.h"
> +
> +#define PSI_POLL_TIMEOUT_MS    5000
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
> +               fprintf(stderr, "open %s: %s\n", path, strerror(errno));

Use ksft_perror() instead please.

> +       return fd;
> +}
> +
> +FIXTURE(psi)
> +{
> +       char root[PATH_MAX];
> +       char *cg;
> +};
> +
> +FIXTURE_SETUP(psi)
> +{
> +       int psi_fd;
> +
> +       self->cg =3D NULL;
> +
> +       if (cg_find_unified_root(self->root, sizeof(self->root), NULL))
> +               SKIP(return, "cgroup v2 isn't mounted");
> +
> +       /* PSI must be enabled (CONFIG_PSI=3Dy, not disabled on the cmdli=
ne). */
> +       psi_fd =3D open("/proc/pressure/memory", O_RDONLY);
> +       if (psi_fd < 0)
> +               SKIP(return, "PSI unavailable (CONFIG_PSI=3Dn or psi=3D0)=
");
> +       close(psi_fd);

Why can't cgroup setup be done here? IOW, why not do

self->cg =3D cg_name(self->root, "psi_trigger_test");
cg_create(self->cg))

here only once? Usually FIXTURE_SETUP and FIXTURE_TEARDOWN are
symmetric: you teardown what you setup.


> +}
> +
> +FIXTURE_TEARDOWN(psi)
> +{
> +       if (self->cg) {
> +               cg_killall(self->cg);
> +               cg_destroy(self->cg);
> +               free(self->cg);
> +       }
> +}
> +
> +/*
> + * /proc/pressure/<resource> accepts exactly one trigger per file
> + * descriptor. For io, memory and cpu verify that a "some" trigger arms
> + * and that a second trigger on the same fd is rejected with EBUSY.
> + */
> +TEST_F(psi, proc_trigger_io)
> +{
> +       int fd;
> +
> +       fd =3D pressure_open("io");
> +       ASSERT_GE(fd, 0);
> +       ASSERT_GT(write_trigger(fd, "some 150000 2000000"), 0);
> +       ASSERT_EQ(-1, write_trigger(fd, "full 150000 2000000"));
> +       ASSERT_EQ(EBUSY, errno);
> +       close(fd);
> +}
> +
> +TEST_F(psi, proc_trigger_memory)
> +{
> +       int fd;
> +
> +       fd =3D pressure_open("memory");
> +       ASSERT_GE(fd, 0);
> +       ASSERT_GT(write_trigger(fd, "some 150000 2000000"), 0);
> +       ASSERT_EQ(-1, write_trigger(fd, "full 150000 2000000"));
> +       ASSERT_EQ(EBUSY, errno);
> +       close(fd);
> +}
> +
> +TEST_F(psi, proc_trigger_cpu)
> +{
> +       int fd;
> +
> +       fd =3D pressure_open("cpu");
> +       ASSERT_GE(fd, 0);
> +       ASSERT_GT(write_trigger(fd, "some 150000 2000000"), 0);
> +       ASSERT_EQ(-1, write_trigger(fd, "full 150000 2000000"));
> +       ASSERT_EQ(EBUSY, errno);
> +       close(fd);
> +}

proc_trigger_io, proc_trigger_memory and proc_trigger_cpu do almost
the same thing. You can refactor them:

static void test_psi_write(const char *filename)
{
       int fd;

       fd =3D pressure_open(filename);
       ASSERT_GE(fd, 0);
       ASSERT_GT(write_trigger(fd, "some 150000 2000000"), 0);
       ASSERT_EQ(-1, write_trigger(fd, "full 150000 2000000"));
       ASSERT_EQ(EBUSY, errno);
       close(fd);
}

TEST_F(psi, proc_trigger_io)
{
       test_psi_write("io");
}

TEST_F(psi, proc_trigger_memory)
{
       test_psi_write("memory");
}

TEST_F(psi, proc_trigger_cpu)
{
       test_psi_write("cpu");
}

> +
> +/*
> + * irq only tracks "full", so a "some" trigger must be rejected while a
> + * "full" trigger arms. irq is optional -- it only exists with IRQ-time
> + * accounting -- so a missing /proc/pressure/irq is SKIP, not FAIL.
> + */
> +TEST_F(psi, proc_trigger_irq)
> +{
> +       int fd;
> +
> +       fd =3D pressure_open("irq");
> +       if (fd < 0)
> +               SKIP(return, "/proc/pressure/irq unavailable");
> +
> +       ASSERT_EQ(-1, write_trigger(fd, "some 150000 2000000"));
> +       ASSERT_GT(write_trigger(fd, "full 150000 2000000"), 0);
> +       close(fd);
> +}
> +
> +/*
> + * cgroup.pressure gates visibility of the per-resource *.pressure files
> + * inside a cgroup: writing 0 hides them, writing 1 shows them again.
> + * Drive one hide/show cycle and check that memory.pressure appears and
> + * disappears along with it.
> + */
> +TEST_F(psi, cgroup_pressure_toggle)
> +{
> +       char buf[BUF_SIZE];
> +
> +       self->cg =3D cg_name(self->root, "psi_toggle_test");
> +       ASSERT_NE(NULL, self->cg);
> +       ASSERT_EQ(0, cg_create(self->cg));
> +
> +       ASSERT_EQ(0, cg_write(self->cg, "cgroup.pressure", "0"));
> +       ASSERT_EQ(0, cg_read_strcmp(self->cg, "cgroup.pressure", "0\n"));
> +       ASSERT_LT(cg_read(self->cg, "memory.pressure", buf, sizeof(buf)),=
 0);
> +
> +       ASSERT_EQ(0, cg_write(self->cg, "cgroup.pressure", "1"));
> +       ASSERT_EQ(0, cg_read_strcmp(self->cg, "cgroup.pressure", "1\n"));
> +       ASSERT_GE(cg_read(self->cg, "memory.pressure", buf, sizeof(buf)),=
 0);
> +}
> +
> +/*
> + * A child that burns CPU forever; stopped by cg_killall() on teardown.
> + * It also dies with the runner, so an interrupted run (e.g. Ctrl-C
> + * during poll()) does not leave orphaned hogs pinning every CPU.
> + */
> +static int hog_cpu(const char *cgroup, void *arg)
> +{
> +       prctl(PR_SET_PDEATHSIG, SIGKILL);
> +       for (;;) {}
> +       return 0;
> +}
> +
> +/*
> + * Arm a "some" trigger on a cgroup's cpu.pressure, oversubscribe the
> + * cgroup with more spinning hogs than there are CPUs, and check that th=
e
> + * trigger fires once the cgroup stalls on CPU.
> + */
> +TEST_F(psi, cgroup_trigger_fire)
> +{
> +       char *cpupress;
> +       struct pollfd pfd =3D { .events =3D POLLPRI };
> +       long ncpus;
> +       int fd;
> +       int i;
> +
> +       self->cg =3D cg_name(self->root, "psi_trigger_test");
> +       ASSERT_NE(NULL, self->cg);
> +       ASSERT_EQ(0, cg_create(self->cg));
> +
> +       cpupress =3D cg_control(self->cg, "cpu.pressure");
> +       ASSERT_NE(NULL, cpupress);
> +       fd =3D open(cpupress, O_RDWR);
> +       free(cpupress);
> +       ASSERT_GE(fd, 0);
> +       pfd.fd =3D fd;
> +
> +       /*
> +        * 1usec threshold over a 2s window: any CPU stall fires it. The =
2s
> +        * window is the smallest unprivileged users are allowed to arm.
> +        */
> +       ASSERT_GT(write_trigger(fd, "some 1 2000000"), 0);
> +
> +       ncpus =3D sysconf(_SC_NPROCESSORS_ONLN);
> +       if (ncpus =3D=3D -1)
> +               TH_LOG("sysconf(_SC_NPROCESSORS_ONLN): %s", strerror(errn=
o));
> +       ASSERT_NE(-1, ncpus);
> +
> +       /* ncpus+1 hogs guarantee CPU contention inside the cgroup. */
> +       for (i =3D 0; i < ncpus + 1; i++)
> +               ASSERT_GE(cg_run_nowait(self->cg, hog_cpu, NULL), 0);
> +
> +       ASSERT_EQ(1, poll(&pfd, 1, PSI_POLL_TIMEOUT_MS));
> +       ASSERT_NE(0, pfd.revents & POLLPRI);
> +       close(fd);
> +}
> +
> +TEST_HARNESS_MAIN
> --
> 2.43.0
>
