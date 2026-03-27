Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D425F3A5E87
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 13:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774617349; cv=pass; b=KIablbv3PN1CH7sS8B7cq7jq+rikifJv0o4tvWp9RBPpjCBvDVV7VeiownO01dksz5obgJzg3BCj7+PU7cbFXv1mDIqQWdBTzj6ghHIn3MbWO75P61gfihYehx/mF2NV8/1IxX4TwKvs88I7dQKJsgwBH2f0r0kkkfGz6gRppCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774617349; c=relaxed/simple;
	bh=0qSPYpaceiOiGC0EdEYrehQ5ivuxCJL8Is+O1ASoOEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=me2w200EjEGotAQZm1x+WnVFJqpgTEZA2wdaNEd0Uo2VwCUWsRWPeuuxacaKioFCINrmo+n2DoJAHR+C7s+ieSvY7NWeihKbwPae8ovTx3RmAWwjEW01mnU8rTFqXR1e6Lh9pZJeQOyx0C/2PWFgzMnLaAigTAt6cEFIPwkKzxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IYnyKXOA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=BLFCwvZR; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IYnyKXOA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="BLFCwvZR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774617347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/OVX1r9Iz0+z3/EtWsPL46cFf+Te6jgc3vVhsdqqxV4=;
	b=IYnyKXOACuy1Rc/c1Pd6d0zFiTuims4xw2gmR+0/tuzmsHptR2bmV+1wQpevwxWRcBU8Xh
	sjK7yzDf82z/t4WnrHmKSPOKBSaIcGU9hhU6zGp9mu/07qI6cwEmUAkFFtqs8qlpKZZkOx
	ex1k13m92WO5N3m2rpXnghRrkD6tUEI=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-koAf0b4_O6mDnVMPdYvbKg-1; Fri, 27 Mar 2026 09:15:44 -0400
X-MC-Unique: koAf0b4_O6mDnVMPdYvbKg-1
X-Mimecast-MFC-AGG-ID: koAf0b4_O6mDnVMPdYvbKg_1774617344
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-6445cf02fcbso3980134d50.2
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 06:15:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774617344; cv=none;
        d=google.com; s=arc-20240605;
        b=a95XlqkbARSWACt/r2MxA/+Muu7Kw8MIufM2+V6F3VjgHQ7nmnx6LQY1hZ+wOQXQ2Q
         61naXtv/0v+Wm6odoqONVxOqJY4JQQKsOGbPUl+LnWaYzcQwe3icYHIpUl1DtkTOPYKq
         n2rzwx/7vplJiXEYB2GwP2NHwSXw/J3edbHSw21zWtTGUX4YZSo2cwX0EvqDytlnfwSE
         8PGGeEFzz/jnaVBS1uktmOGwVzfdWvLuwn4YW4ufxd8emvRbNP/OXoc1hwgzcwb9DWeT
         oH9fWs5baISIv9DfEAVScx/gEXPu9+rYRTe2rnceTMBwGAHEwUQCMgXbSnqkyWQ1rras
         8U9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/OVX1r9Iz0+z3/EtWsPL46cFf+Te6jgc3vVhsdqqxV4=;
        fh=TJ9ZDix/jtMq0bCkGCCBlisYRwT32P5eKX9hlxFKeIU=;
        b=lexq2WBlfMpxmYaINU8PqGJQ8IGOPA6d4641FJgQSSQ6lUSmftnxmtHXIS1Ul7wS0W
         hyzV8U33icsOpArT0kLArdbOhOhpYaxq5LLyDyr/ghFCA12P1gbjOw8qBnQ2UQeP58ht
         ZMKL0HBQlYJEO96OtI8c+kiFngB/RZldTuD4qtAX3G1fojhQvGSq2Kp5uftCqYNdRC+D
         9z8nXtYtjZP60Zm0PMGyLLOQSC8v2P4+Gf6L0lCX2lUvCZ9lOtakUVv5//dPfbxk5NEL
         t1zq494p5MUtV8vJuUFZIhmEFWmDKgZC6oGzqohDN3djrReQbrMZU9MXuKEp2UXHCifx
         N48Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774617344; x=1775222144; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/OVX1r9Iz0+z3/EtWsPL46cFf+Te6jgc3vVhsdqqxV4=;
        b=BLFCwvZRM7sXCHzBbGot3pEzjUDgnT0NDKfX68e8PiYcmlMJVr2jmCCK8rZQTx65X9
         iZLOheGpJ0joN+aKrHCNFzXohxshTr0PxfaCBkZXVecE7Y5pti64x52Vo/vtcI2YDW+Y
         ZK3ao/wBxezzq/6ANKqAFgZ2CdkcDPK+BopmkECl0UjIzPDh1LSenIIdQLF0/lgAECe8
         KkvOyuu9BFqHIT3xK1tAblYNuES8PwBvB4Jp6qk68WgSQPVUcNxBLtIBvdGBr+j0KTOF
         QqSTwyUd1ym56Hk9UIJMp/Poc/oZN80zHiAXXOqt/48yQoSLCalrwKTutpzpR2rZaFQC
         t7oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774617344; x=1775222144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/OVX1r9Iz0+z3/EtWsPL46cFf+Te6jgc3vVhsdqqxV4=;
        b=sl54mS0aTp0A4T4LC7r+b8K2nnIGja6LPR0vuKmRF2hg6IuG0ayuFMEWBQ3XhL5W7d
         yFkxlnamopwf9GZtx63aPlxFYI8b2XaCRqFg5m7c+MqvaZ1PgnFN2zkehtuKoZgo4nHh
         XF3j9WzAazoCOvG/tzcg+DnpczxmTJ7ru7pwNYC+NEVynP9gX2MzJ5IBVhx8H864qVQq
         ftLtXt/W4amAEe8Ry2w8BQ15/CKNT4xtnhEsRL9fxF5/QKWX6Ho0E6Vz6tY/ldd7Sxk1
         EchhoYefF4W0fpdZA3NP85eYvkAHmGmBQjkelfmmQrVdgnk/X7rvcLfxdKlYWkH87SV7
         dv9g==
X-Forwarded-Encrypted: i=1; AJvYcCVLoh9BjtQn7ByVPfYf4XuiZ7aDQ7VbsDFkMYzv0qpbWr/HGarhaWsVj5r1m8sW+0+cDpccGU/Lgy9voIYZ7Wc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzltK+OcSMF6D07ePLroxM+1+evpuy5L+j63qkNGYemy5obBFsS
	TiPNaWMrZdOeU+K/egJRicfixvWDCexCkiBwVFCjXMSE2PpfttYWSEGajptFNGd9wc7vVI/GDUH
	/epNxErhgJoapm93q0zaq8X83tE1y7+rb5HgrNpScXQ4i6C9xmc9d1mC20o+3H4JP5oi8F9f/ar
	9cks7rNmlQ6ObNlYFs58yVd5AGydAqphJ3Ee46BvmkhSyr
X-Gm-Gg: ATEYQzzV9R7lHtY+xtRaeCfXorMYBiHF+hJL0JNAQ9c740t7X59nnCjRY3N8cdR0Yts
	c52LLqEYZJrAaT3Yuv7QU3ctBB8klQ389yi25Z2qhi1ORksx+3MJzfflVpiMMeCW4qiFdrWHCgp
	4kc7jyGnzSntRhIVU73+mTlCS6hgz8iOcpKqVJObdd1+4V9x8x5jj4d2J7G0aWi358sYS6HWvGj
	CF7FA==
X-Received: by 2002:a05:690e:440c:b0:64e:efc7:b1bf with SMTP id 956f58d0204a3-64ff73cb444mr1504785d50.52.1774617343786;
        Fri, 27 Mar 2026 06:15:43 -0700 (PDT)
X-Received: by 2002:a05:690e:440c:b0:64e:efc7:b1bf with SMTP id
 956f58d0204a3-64ff73cb444mr1504743d50.52.1774617342983; Fri, 27 Mar 2026
 06:15:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-kunit_cgroups-v1-0-971b3c739a00@redhat.com> <20260327-kunit_cgroups-v1-2-971b3c739a00@redhat.com>
In-Reply-To: <20260327-kunit_cgroups-v1-2-971b3c739a00@redhat.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 27 Mar 2026 14:15:31 +0100
X-Gm-Features: AQROBzCCLothWISj3adq6fH_wHdPhuMARGLGzX96TLnmrtQEQgxz5yaILeRpy2s
Message-ID: <CADSE00LHuHbYF4stJhLrBjTkZRud_qLWzHXk4uLtuXs=NJJSNg@mail.gmail.com>
Subject: Re: [PATCH 2/3] selftests: cgroup: Add dmem selftest coverage
To: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, mripard@redhat.com, echanude@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 9:53=E2=80=AFAM Albert Esteve <aesteve@redhat.com> =
wrote:
>
> Currently, tools/testing/selftests/cgroup/ does not include
> a dmem-specific test binary. This leaves dmem charge and
> limit behavior largely unvalidated in kselftest coverage.
>
> Add test_dmem and wire it into the cgroup selftests Makefile.
> The new test exercises dmem controller behavior through the
> dmem_selftest debugfs interface for the dmem_selftest region.
>
> The test adds three complementary checks:
> - test_dmem_max creates a nested hierarchy with per-leaf
>   dmem.max values and verifies that over-limit charges
>   fail while in-limit charges succeed with bounded rounding
>   in dmem.current.
> - test_dmem_min and test_dmem_low verify that charging
>   from a cgroup with the corresponding protection knob
>   set updates dmem.current as expected.
> - test_dmem_charge_byte_granularity validates accounting
>   bounds for non-page-aligned charge sizes and
>   uncharge-to-zero behavior.
>
> This provides deterministic userspace coverage for dmem
> accounting and hard-limit enforcement using a test helper
> module, without requiring subsystem-specific production
> drivers.
>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
>  tools/testing/selftests/cgroup/.gitignore  |   1 +
>  tools/testing/selftests/cgroup/Makefile    |   2 +
>  tools/testing/selftests/cgroup/test_dmem.c | 487 +++++++++++++++++++++++=
++++++
>  3 files changed, 490 insertions(+)
>
> diff --git a/tools/testing/selftests/cgroup/.gitignore b/tools/testing/se=
lftests/cgroup/.gitignore
> index 952e4448bf070..ea2322598217d 100644
> --- a/tools/testing/selftests/cgroup/.gitignore
> +++ b/tools/testing/selftests/cgroup/.gitignore
> @@ -2,6 +2,7 @@
>  test_core
>  test_cpu
>  test_cpuset
> +test_dmem
>  test_freezer
>  test_hugetlb_memcg
>  test_kill
> diff --git a/tools/testing/selftests/cgroup/Makefile b/tools/testing/self=
tests/cgroup/Makefile
> index e01584c2189ac..e1a5e9316620e 100644
> --- a/tools/testing/selftests/cgroup/Makefile
> +++ b/tools/testing/selftests/cgroup/Makefile
> @@ -10,6 +10,7 @@ TEST_GEN_FILES :=3D wait_inotify
>  TEST_GEN_PROGS  =3D test_core
>  TEST_GEN_PROGS +=3D test_cpu
>  TEST_GEN_PROGS +=3D test_cpuset
> +TEST_GEN_PROGS +=3D test_dmem
>  TEST_GEN_PROGS +=3D test_freezer
>  TEST_GEN_PROGS +=3D test_hugetlb_memcg
>  TEST_GEN_PROGS +=3D test_kill
> @@ -26,6 +27,7 @@ include lib/libcgroup.mk
>  $(OUTPUT)/test_core: $(LIBCGROUP_O)
>  $(OUTPUT)/test_cpu: $(LIBCGROUP_O)
>  $(OUTPUT)/test_cpuset: $(LIBCGROUP_O)
> +$(OUTPUT)/test_dmem: $(LIBCGROUP_O)
>  $(OUTPUT)/test_freezer: $(LIBCGROUP_O)
>  $(OUTPUT)/test_hugetlb_memcg: $(LIBCGROUP_O)
>  $(OUTPUT)/test_kill: $(LIBCGROUP_O)
> diff --git a/tools/testing/selftests/cgroup/test_dmem.c b/tools/testing/s=
elftests/cgroup/test_dmem.c
> new file mode 100644
> index 0000000000000..cdd5cb7206f16
> --- /dev/null
> +++ b/tools/testing/selftests/cgroup/test_dmem.c
> @@ -0,0 +1,487 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Test the dmem (device memory) cgroup controller.
> + *
> + * Depends on dmem_selftest kernel module.
> + */
> +
> +#define _GNU_SOURCE
> +
> +#include <linux/limits.h>
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <sys/stat.h>
> +#include <sys/types.h>
> +#include <unistd.h>
> +
> +#include "kselftest.h"
> +#include "cgroup_util.h"
> +
> +/* kernel/cgroup/dmem_selftest.c */
> +#define DM_SELFTEST_REGION     "dmem_selftest"
> +#define DM_SELFTEST_CHARGE     "/sys/kernel/debug/dmem_selftest/charge"
> +#define DM_SELFTEST_UNCHARGE   "/sys/kernel/debug/dmem_selftest/uncharge=
"
> +
> +/*
> + * Parse the first line of dmem.capacity (root):
> + *   "<name> <size_in_bytes>"
> + * Returns 1 if a region was found, 0 if capacity is empty, -1 on read e=
rror.
> + */
> +static int parse_first_region(const char *root, char *name, size_t name_=
len,
> +                             unsigned long long *size_out)
> +{
> +       char buf[4096];
> +       char nm[256];
> +       unsigned long long sz;
> +
> +       if (cg_read(root, "dmem.capacity", buf, sizeof(buf)) < 0)
> +               return -1;
> +
> +       if (sscanf(buf, "%255s %llu", nm, &sz) < 2)
> +               return 0;
> +
> +       if (name_len <=3D strlen(nm))
> +               return -1;
> +
> +       strcpy(name, nm);
> +       *size_out =3D sz;
> +       return 1;
> +}
> +
> +/*
> + * Read the numeric limit for @region_name from a multiline
> + * dmem.{min,low,max} file. Returns bytes,
> + * or -1 if the line is "<name> max", or -2 if missing/err.
> + */
> +static long long dmem_read_limit_for_region(const char *cgroup, const ch=
ar *ctrl,
> +                                           const char *region_name)
> +{
> +       char buf[4096];
> +       char *line, *saveptr =3D NULL;
> +       char fname[256];
> +       char fval[64];
> +
> +       if (cg_read(cgroup, ctrl, buf, sizeof(buf)) < 0)
> +               return -2;
> +
> +       for (line =3D strtok_r(buf, "\n", &saveptr); line;
> +            line =3D strtok_r(NULL, "\n", &saveptr)) {
> +               if (!line[0])
> +                       continue;
> +               if (sscanf(line, "%255s %63s", fname, fval) !=3D 2)
> +                       continue;
> +               if (strcmp(fname, region_name))
> +                       continue;
> +               if (!strcmp(fval, "max"))
> +                       return -1;
> +               return strtoll(fval, NULL, 0);
> +       }
> +       return -2;
> +}
> +
> +static long long dmem_read_limit(const char *cgroup, const char *ctrl)
> +{
> +       return dmem_read_limit_for_region(cgroup, ctrl, DM_SELFTEST_REGIO=
N);
> +}
> +
> +static int dmem_write_limit(const char *cgroup, const char *ctrl,
> +                           const char *val)
> +{
> +       char wr[512];
> +
> +       snprintf(wr, sizeof(wr), "%s %s", DM_SELFTEST_REGION, val);
> +       return cg_write(cgroup, ctrl, wr);
> +}
> +
> +static int dmem_selftest_charge_bytes(unsigned long long bytes)
> +{
> +       char wr[32];
> +
> +       snprintf(wr, sizeof(wr), "%llu", bytes);
> +       return write_text(DM_SELFTEST_CHARGE, wr, strlen(wr));
> +}
> +
> +static int dmem_selftest_uncharge(void)
> +{
> +       return write_text(DM_SELFTEST_UNCHARGE, "\n", 1);
> +}
> +
> +/*
> + * First, this test creates the following hierarchy:
> + * A
> + * A/B     dmem.max=3D1M
> + * A/B/C   dmem.max=3D75K
> + * A/B/D   dmem.max=3D25K
> + * A/B/E   dmem.max=3D8K
> + * A/B/F   dmem.max=3D0
> + *
> + * Then for each leaf cgroup it tries to charge above dmem.max
> + * and expects the charge request to fail and dmem.current to
> + * remain unchanged.
> + *
> + * For leaves with non-zero dmem.max, it additionally charges a
> + * smaller amount and verifies accounting grows within one PAGE_SIZE
> + * rounding bound, then uncharges and verifies dmem.current returns
> + * to the previous value.
> + *
> + */
> +static int test_dmem_max(const char *root)
> +{
> +       static const char * const leaf_max[] =3D { "75K", "25K", "8K", "0=
" };
> +       static const unsigned long long fail_sz[] =3D {
> +               (75ULL * 1024ULL) + 1ULL,
> +               (25ULL * 1024ULL) + 1ULL,
> +               (8ULL * 1024ULL) + 1ULL,
> +               1ULL
> +       };
> +       static const unsigned long long pass_sz[] =3D {
> +               4096ULL, 4096ULL, 4096ULL, 0ULL
> +       };
> +       char *parent[2] =3D {NULL};
> +       char *children[4] =3D {NULL};
> +       unsigned long long cap;
> +       char region[256];
> +       long long page_size;
> +       long long cur_before, cur_after;
> +       int ret =3D KSFT_FAIL;
> +       int charged =3D 0;
> +       int in_child =3D 0;
> +       long long v;
> +       int i;
> +
> +       if (access(DM_SELFTEST_CHARGE, W_OK) !=3D 0)
> +               return KSFT_SKIP;
> +
> +       if (parse_first_region(root, region, sizeof(region), &cap) !=3D 1=
)
> +               return KSFT_SKIP;
> +       if (strcmp(region, DM_SELFTEST_REGION) !=3D 0)
> +               return KSFT_SKIP;
> +
> +       page_size =3D sysconf(_SC_PAGESIZE);
> +       if (page_size <=3D 0)
> +               goto cleanup;
> +
> +       parent[0] =3D cg_name(root, "dmem_prot_0");
> +       parent[1] =3D cg_name(parent[0], "dmem_prot_1");
> +       if (!parent[0] || !parent[1])
> +               goto cleanup;
> +
> +       if (cg_create(parent[0]))
> +               goto cleanup;
> +
> +       if (cg_write(parent[0], "cgroup.subtree_control", "+dmem"))
> +               goto cleanup;
> +
> +       if (cg_create(parent[1]))
> +               goto cleanup;
> +
> +       if (cg_write(parent[1], "cgroup.subtree_control", "+dmem"))
> +               goto cleanup;
> +
> +       for (i =3D 0; i < 4; i++) {
> +               children[i] =3D cg_name_indexed(parent[1], "dmem_child", =
i);
> +               if (!children[i])
> +                       goto cleanup;
> +               if (cg_create(children[i]))
> +                       goto cleanup;
> +       }
> +
> +       if (dmem_write_limit(parent[1], "dmem.max", "1M"))
> +               goto cleanup;
> +       for (i =3D 0; i < 4; i++)
> +               if (dmem_write_limit(children[i], "dmem.max", leaf_max[i]=
))
> +                       goto cleanup;
> +
> +       v =3D dmem_read_limit(parent[1], "dmem.max");
> +       if (!values_close(v, 1024LL * 1024LL, 3))
> +               goto cleanup;
> +       v =3D dmem_read_limit(children[0], "dmem.max");
> +       if (!values_close(v, 75LL * 1024LL, 3))
> +               goto cleanup;
> +       v =3D dmem_read_limit(children[1], "dmem.max");
> +       if (!values_close(v, 25LL * 1024LL, 3))
> +               goto cleanup;
> +       v =3D dmem_read_limit(children[2], "dmem.max");
> +       if (!values_close(v, 8LL * 1024LL, 3))
> +               goto cleanup;
> +       v =3D dmem_read_limit(children[3], "dmem.max");
> +       if (v !=3D 0)
> +               goto cleanup;
> +
> +       for (i =3D 0; i < 4; i++) {
> +               if (cg_enter_current(children[i]))
> +                       goto cleanup;
> +               in_child =3D 1;
> +
> +               cur_before =3D dmem_read_limit(children[i], "dmem.current=
");
> +               if (cur_before < 0)
> +                       goto cleanup;
> +
> +               if (dmem_selftest_charge_bytes(fail_sz[i]) =3D=3D 0)

This should be '>=3D 0', dmem_selftest_charge_bytes() returns the
written bytes on success.

I will fix it in the next iteration.

> +                       goto cleanup;
> +
> +               cur_after =3D dmem_read_limit(children[i], "dmem.current"=
);
> +               if (cur_after !=3D cur_before)
> +                       goto cleanup;
> +
> +               if (pass_sz[i] > 0) {
> +                       if (dmem_selftest_charge_bytes(pass_sz[i]) < 0)
> +                               goto cleanup;
> +                       charged =3D 1;
> +
> +                       cur_after =3D dmem_read_limit(children[i], "dmem.=
current");
> +                       if (cur_after < cur_before + (long long)pass_sz[i=
])
> +                               goto cleanup;
> +                       if (cur_after > cur_before + (long long)pass_sz[i=
] + page_size)
> +                               goto cleanup;
> +
> +                       if (dmem_selftest_uncharge() < 0)
> +                               goto cleanup;
> +                       charged =3D 0;
> +
> +                       cur_after =3D dmem_read_limit(children[i], "dmem.=
current");
> +                       if (cur_after !=3D cur_before)
> +                               goto cleanup;
> +               }
> +
> +               if (cg_enter_current(root))
> +                       goto cleanup;
> +               in_child =3D 0;
> +       }
> +
> +       ret =3D KSFT_PASS;
> +
> +cleanup:
> +       if (charged)
> +               dmem_selftest_uncharge();
> +       if (in_child)
> +               cg_enter_current(root);
> +       for (i =3D 3; i >=3D 0; i--) {
> +               if (!children[i])
> +                       continue;
> +               cg_destroy(children[i]);
> +               free(children[i]);
> +       }
> +       for (i =3D 1; i >=3D 0; i--) {
> +               if (!parent[i])
> +                       continue;
> +               cg_destroy(parent[i]);
> +               free(parent[i]);
> +       }
> +       return ret;
> +}
> +
> +/*
> + * This test sets dmem.min and dmem.low on a child cgroup, then charge
> + * from that context and verify dmem.current tracks the charged bytes
> + * (within one page rounding).
> + */
> +static int test_dmem_charge_with_attr(const char *root, bool min)
> +{
> +       char region[256];
> +       unsigned long long cap;
> +       const unsigned long long charge_sz =3D 12345ULL;
> +       const char *attribute =3D min ? "dmem.min" : "dmem.low";
> +       int ret =3D KSFT_FAIL;
> +       char *cg =3D NULL;
> +       long long cur;
> +       long long page_size;
> +       int charged =3D 0;
> +       int in_child =3D 0;
> +
> +       if (access(DM_SELFTEST_CHARGE, W_OK) !=3D 0)
> +               return KSFT_SKIP;
> +
> +       if (parse_first_region(root, region, sizeof(region), &cap) !=3D 1=
)
> +               return KSFT_SKIP;
> +       if (strcmp(region, DM_SELFTEST_REGION) !=3D 0)
> +               return KSFT_SKIP;
> +
> +       page_size =3D sysconf(_SC_PAGESIZE);
> +       if (page_size <=3D 0)
> +               goto cleanup;
> +
> +       cg =3D cg_name(root, "test_dmem_attr");
> +       if (!cg)
> +               goto cleanup;
> +
> +       if (cg_create(cg))
> +               goto cleanup;
> +
> +       if (cg_enter_current(cg))
> +               goto cleanup;
> +       in_child =3D 1;
> +
> +       if (dmem_write_limit(cg, attribute, "16K"))
> +               goto cleanup;
> +
> +       if (dmem_selftest_charge_bytes(charge_sz) < 0)
> +               goto cleanup;
> +       charged =3D 1;
> +
> +       cur =3D dmem_read_limit(cg, "dmem.current");
> +       if (cur < (long long)charge_sz)
> +               goto cleanup;
> +       if (cur > (long long)charge_sz + page_size)
> +               goto cleanup;
> +
> +       if (dmem_selftest_uncharge() < 0)
> +               goto cleanup;
> +       charged =3D 0;
> +
> +       cur =3D dmem_read_limit(cg, "dmem.current");
> +       if (cur !=3D 0)
> +               goto cleanup;
> +
> +       ret =3D KSFT_PASS;
> +
> +cleanup:
> +       if (charged)
> +               dmem_selftest_uncharge();
> +       if (in_child)
> +               cg_enter_current(root);
> +       cg_destroy(cg);
> +       free(cg);
> +       return ret;
> +}
> +
> +static int test_dmem_min(const char *root)
> +{
> +       return test_dmem_charge_with_attr(root, "dmem.min");
> +}
> +
> +static int test_dmem_low(const char *root)
> +{
> +       return test_dmem_charge_with_attr(root, "dmem.low");
> +}
> +
> +/*
> + * This test charges non-page-aligned byte sizes and verify dmem.current
> + * stays consistent: it must account at least the requested bytes and
> + * never exceed one kernel page of rounding overhead. Then uncharge must
> + * return usage to 0.
> + */
> +static int test_dmem_charge_byte_granularity(const char *root)
> +{
> +       static const unsigned long long sizes[] =3D { 1ULL, 4095ULL, 4097=
ULL, 12345ULL };
> +       char *cg =3D NULL;
> +       unsigned long long cap;
> +       char region[256];
> +       long long cur;
> +       long long page_size;
> +       int ret =3D KSFT_FAIL;
> +       int charged =3D 0;
> +       int in_child =3D 0;
> +       size_t i;
> +
> +       if (access(DM_SELFTEST_CHARGE, W_OK) !=3D 0)
> +               return KSFT_SKIP;
> +
> +       if (parse_first_region(root, region, sizeof(region), &cap) !=3D 1=
)
> +               return KSFT_SKIP;
> +       if (strcmp(region, DM_SELFTEST_REGION) !=3D 0)
> +               return KSFT_SKIP;
> +
> +       page_size =3D sysconf(_SC_PAGESIZE);
> +       if (page_size <=3D 0)
> +               goto cleanup;
> +
> +       cg =3D cg_name(root, "dmem_dbg_byte_gran");
> +       if (!cg)
> +               goto cleanup;
> +
> +       if (cg_create(cg))
> +               goto cleanup;
> +
> +       if (dmem_write_limit(cg, "dmem.max", "8M"))
> +               goto cleanup;
> +
> +       if (cg_enter_current(cg))
> +               goto cleanup;
> +       in_child =3D 1;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(sizes); i++) {
> +               if (dmem_selftest_charge_bytes(sizes[i]) < 0)
> +                       goto cleanup;
> +               charged =3D 1;
> +
> +               cur =3D dmem_read_limit(cg, "dmem.current");
> +               if (cur < (long long)sizes[i])
> +                       goto cleanup;
> +               if (cur > (long long)sizes[i] + page_size)
> +                       goto cleanup;
> +
> +               if (dmem_selftest_uncharge() < 0)
> +                       goto cleanup;
> +               charged =3D 0;
> +
> +               cur =3D dmem_read_limit(cg, "dmem.current");
> +               if (cur !=3D 0)
> +                       goto cleanup;
> +       }
> +
> +       ret =3D KSFT_PASS;
> +
> +cleanup:
> +       if (charged)
> +               dmem_selftest_uncharge();
> +       if (in_child)
> +               cg_enter_current(root);
> +       if (cg) {
> +               cg_destroy(cg);
> +               free(cg);
> +       }
> +       return ret;
> +}
> +
> +#define T(x) { x, #x }
> +struct dmem_test {
> +       int (*fn)(const char *root);
> +       const char *name;
> +} tests[] =3D {
> +       T(test_dmem_max),
> +       T(test_dmem_min),
> +       T(test_dmem_low),
> +       T(test_dmem_charge_byte_granularity),
> +};
> +#undef T
> +
> +int main(int argc, char **argv)
> +{
> +       char root[PATH_MAX];
> +       int i;
> +
> +       ksft_print_header();
> +       ksft_set_plan(ARRAY_SIZE(tests));
> +
> +       if (cg_find_unified_root(root, sizeof(root), NULL))
> +               ksft_exit_skip("cgroup v2 isn't mounted\n");
> +
> +       if (cg_read_strstr(root, "cgroup.controllers", "dmem"))
> +               ksft_exit_skip("dmem controller isn't available (CONFIG_C=
GROUP_DMEM?)\n");
> +
> +       if (cg_read_strstr(root, "cgroup.subtree_control", "dmem"))
> +               if (cg_write(root, "cgroup.subtree_control", "+dmem"))
> +                       ksft_exit_skip("Failed to enable dmem controller\=
n");
> +
> +       for (i =3D 0; i < ARRAY_SIZE(tests); i++) {
> +               switch (tests[i].fn(root)) {
> +               case KSFT_PASS:
> +                       ksft_test_result_pass("%s\n", tests[i].name);
> +                       break;
> +               case KSFT_SKIP:
> +                       ksft_test_result_skip(
> +                               "%s (need CONFIG_DMEM_SELFTEST, modprobe =
dmem_selftest)\n",
> +                               tests[i].name);
> +                       break;
> +               default:
> +                       ksft_test_result_fail("%s\n", tests[i].name);
> +                       break;
> +               }
> +       }
> +
> +       ksft_finished();
> +}
>
> --
> 2.52.0
>

