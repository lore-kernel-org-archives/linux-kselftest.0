Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0994483BD7
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 16:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788280959; cv=pass; b=eHlM61ljAIj/41RiXTMWI7vcNSSq5XO+4SHK5+ad8iK3RId7ALrxY5tkxCMM/fzP14eDyqZYqCAKO7oPu7AUf0kCy93RRCU0HINatj3qFYxEjvVcOQOUGEnjYNuE0k7Z2JQP21XARoYkApznsbylKfmOrrBuI7FJ3PpjTipoDBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788280959; c=relaxed/simple;
	bh=APD9AC0VOr/0fRwikJ9+mcsezV71BAyGtcZk+VzYP7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HTCxIMif0WQLVbsRCodiDjwg7Gq2hTecRxAG9qnSYV7JMDsnPsqRRLpWmGAeLiwRRkciApaRZk/MkEmPcQA5++8FaSQ1SRsNU4omFbVKmFwYAX+8fuGRN+Z86c/L4HMmaVO75m0flWbKo1LvWMaQX53Y2+xCRrR34LRw8+Z5KkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QFvcYJrw; arc=pass smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QFvcYJrw"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4b21f09ea42so48814b6e.2
        for <linux-kselftest@vger.kernel.org>; Tue, 01 Sep 2026 09:42:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788280957; cv=none;
        d=google.com; s=arc-20260327;
        b=iKes9OLRYKsQDuNMdN2H6ntbWyosadl/wMdmfAp60ok6iXuxEqFgPv/7gcAWtpp4BJ
         uxsTbrUjLKuf7Q3bqFQn7Iesg4+lfenT7idvN4vELDAxq1osyu+Mj+bJROvIBEQbQ8Po
         myl3FMeZbOR2buadN7s1NXOt7W9jcsdAVoa3pR7nrOzFcfpRyD4Qtw/AMv771cxO0pMR
         q6JFqED+LErhvxJ0B4Y4bJjukRPmNN8NuM/2MCDcYl7jGAcrAyy9zcNuNyMTJIc/EBJn
         AUrp7nrMfw7oxBXlxn4lQ6ddlwTS9+2971yy1XWZILtnw1CmsuCteC4NlO91EXsj94cQ
         EWag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6m3dH9dLlajhbBspVJfRfQW3YlOmSaiwmzKjeGKmwMs=;
        fh=xy8TFasVC8Adg04AzF/XjAHqZI74g5jdkic9a7Qy12M=;
        b=VOwYOxRMDO7QyIgghGYlV7sqHx4a72NDpycQgwS3QRRItDitsHxXHGuTmE0kJ8ppAO
         N115xBiA8dRrQMn+XiXN5yxJYYlORmrB7yOreemu8YKJTweXqIJY3l+bUqtU2WMBpnMZ
         YTkE9BE3mIsRATTVDnhcilGAvMW2JrkOZs+Q2DL0wlxXzHFxh1fJArfPgHggl6pAY8ek
         IOH6YjJO7LKk9s7pmdwkE9w2oLo/vZhMSFHeNMq7oyivEQ745Me/ClToyG9xaIwntmlt
         fe1fubD5TytnH5XnhaB4Z7PrU8f6x589WHrPyvcjpWpGN1ICd6o3QKUhxhTXUFARIoqd
         4U+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788280957; x=1788885757; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6m3dH9dLlajhbBspVJfRfQW3YlOmSaiwmzKjeGKmwMs=;
        b=QFvcYJrw0LCntf8iHn62OP+TBJFIwuOL5d5xrw9fxz1fpD/TFaKHA1FzZG61ET/2y6
         uDHufMXKKbXeSvIzbIfR+k/HjhuP2vk3TSlJ3Mq+6kvERFjBnQI5Ny2TbmmNRp6H9UyB
         ijncTJ15oRwIAMuTTHC7eH5WoezrIyYY4Uwr+z8whkF769cHS2EwbQQHCIZLCuCRNaSW
         XJdERkG2yEfp11tIpTdS/axOwYI9c1KO512eDmB30qgc24CUYaubTqYnRSM+zhtdBCb+
         jhgcAYl3FHmGjy49OOHJHxNcQbADrjfwpgHvoFXFbQcBRGbaIdKBWV+6r5HSMqk0hQuZ
         skWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788280957; x=1788885757;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6m3dH9dLlajhbBspVJfRfQW3YlOmSaiwmzKjeGKmwMs=;
        b=aygF+pnUpZuQDsW6hAeppJXMgc/zbUj1SprwqrbnvcVutIE/DCts4lNO/h/ktd0mbC
         8yNo+RbKsJiLESJfmWhe0udm3jKTI7QWHzv9ZQ2eCFswlm41HQ1MzQAy4aXgi+cLuBE8
         qyLl6l8X4nbMU9Yb+8u2otQI0ZzSGObdGWN/b3zHgBdzibCX7HwNSyMY2WJ26QrhqfrR
         L6WevCoN7V4VgXqrbdlbjyISJIB0txbngPmrlpfgbXED5Wf7zyCdv3TrBFag1kXy7MA5
         +Ood2FYnOoMYHyZ80hiiJ75RogK8GopyuVXQ7OKIEAaaEXLqSXo2LeyS1f4t9XhJViiX
         lXrg==
X-Forwarded-Encrypted: i=1; AHgh+RoUaGEZ0n1dXkTIDb+tncrB0EATL4in7gCmvifjXe5zH6RKk+rB6YvR6x1S10vh0qaIw2jkqXTyyorkzuL5tR8=@vger.kernel.org
X-Gm-Message-State: AFuF++kSozo5g5BYTqjNv2BECN5LKJbjJOPQSTIK73zXf2JPnWNxNsQa
	JJlwt/jtyQjCQMVZNb8czqvXnoi6SsNT+99uePEdNWGgzLOXt/FbPFYX/ESA/Zswjeb3gO4AB9s
	q1BS+d3hm1Vjd9cPh1Byb/hfL2fFSc0E=
X-Gm-Gg: AR+sD10KQuqLUSQYI1Wwk13WzPrqzTAx6SK6U79PmgZRHq3aAYwi9ya0wd4q61dXo5c
	GkeBTS+CB1AXsXOmDtPxy9ivob90+gXk2o22+uCBDGnUE92yuPy3ibOv8CETAEjDITLpYdarPKp
	2zrDbVAcU7LNtGCqlW2nuLh8eCp0AVpvUfK6uFmz/2m3GQHs+2tkDE2xXvvWKa9MLXYd7wqGWyG
	ulmgoMx8fkEmxi81WRiIjhISt9LABZBWlBYv6PaFrW8a6M9Molno0Bi6tmrhpjR0uSEiiwaNfNm
	KDCmAH00m4vovXrCjurx/HHLJkwMrr1oPqE3n/FhoVvSaHGqJnOovLAg053IUk9+gM06dIPAV9c
	kkA0=
X-Received: by 2002:a05:6808:c1ad:b0:495:f8a6:81f8 with SMTP id
 5614622812f47-4b3981e5467mr36568177b6e.13.1788280956611; Tue, 01 Sep 2026
 09:42:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901141954.29449-1-suchitkarunakaran@gmail.com> <f987bc5dcd678e13cd661ba9830f30d43cf612f3ee8548020491c791c35308fc@mail.kernel.org>
In-Reply-To: <f987bc5dcd678e13cd661ba9830f30d43cf612f3ee8548020491c791c35308fc@mail.kernel.org>
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Date: Tue, 1 Sep 2026 22:12:25 +0530
X-Gm-Features: AcwNN1VTsGU1S3oWDW34w5U40oz9d5dVHDDH7j-njxkFdJ5jL3ARP666FqPTbvM
Message-ID: <CAO9wTFigd7Wgx9x0fZTK1uYht06G0sKjkecyTEJPyDbyuQSRAg@mail.gmail.com>
Subject: Re: [PATCH] selftests/bpf: Fix map_lookup_percpu_elem on sparse CPU IDs
To: bot+bpf-ci@kernel.org
Cc: andrii@kernel.org, ast@kernel.org, daniel@iogearbox.net, eddyz87@gmail.com, 
	memxor@gmail.com, shuah@kernel.org, emil@etsalapatis.com, 
	ihor.solodrai@linux.dev, jolsa@kernel.org, martin.lau@linux.dev, 
	song@kernel.org, yonghong.song@linux.dev, zhoufeng.zf@bytedance.com, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, martin.lau@kernel.org, mason@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Sept 2026 at 21:04, <bot+bpf-ci@kernel.org> wrote:
>
> > diff --git a/tools/testing/selftests/bpf/prog_tests/map_lookup_percpu_elem.c b/tools/testing/selftests/bpf/prog_tests/map_lookup_percpu_elem.c
> > index bfb1bf3fd427b..849f33259c003 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/map_lookup_percpu_elem.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/map_lookup_percpu_elem.c
> > @@ -2,29 +2,45 @@
> >  /* Copyright (c) 2022 Bytedance */
> >
> >  #include <test_progs.h>
> > +#include "bpf/libbpf_internal.h"
> >  #include "test_map_lookup_percpu_elem.skel.h"
> >
> >  void test_map_lookup_percpu_elem(void)
> >  {
> >       struct test_map_lookup_percpu_elem *skel;
> > -     __u64 key = 0, sum;
> > -     int ret, i, nr_cpus = libbpf_num_possible_cpus();
> > +     bool *possible = NULL;
> > +     __u64 key = 0, sum = 0;
> > +     int cpu, nr_cpu_ids, nr_cpus, ret, slot = 0;
> >       __u64 *buf;
> >
> > -     buf = malloc(nr_cpus*sizeof(__u64));
> > -     if (!ASSERT_OK_PTR(buf, "malloc"))
> > +     ret = parse_cpu_mask_file("/sys/devices/system/cpu/possible", &possible,
> > +                               &nr_cpu_ids);
> > +     if (!ASSERT_OK(ret, "parse possible CPU mask"))
> >               return;
> >
> > -     for (i = 0; i < nr_cpus; i++)
> > -             buf[i] = i;
> > -     sum = (nr_cpus - 1) * nr_cpus / 2;
> > +     nr_cpus = libbpf_num_possible_cpus();
> > +     if (!ASSERT_GT(nr_cpus, 0, "libbpf_num_possible_cpus"))
> > +             goto free_mask;
> > +
> > +     buf = malloc(nr_cpus * sizeof(*buf));
> > +     if (!ASSERT_OK_PTR(buf, "malloc"))
> > +             goto free_mask;
> > +
> > +     for (cpu = 0; cpu < nr_cpu_ids; cpu++) {
> > +             if (!possible[cpu])
> > +                     continue;
> > +             buf[slot++] = cpu;
> > +             sum += cpu;
> > +     }
>
> Does this buffer layout match how the kernel expects it?
>
> The userspace side fills buf[] with one entry per possible CPU, storing
> the logical CPU ID at packed index 'slot' (0, 1, 2, ...). For a mask
> like 0,2-3, this creates buf = {0, 2, 3} with 3 entries total.
>
> Looking at the kernel's update path, both percpu array and hash maps
> index the user buffer by logical CPU ID:
>
> kernel/bpf/arraymap.c:469 bpf_percpu_array_update()
>     for_each_possible_cpu(cpu) {
>             ptr = per_cpu_ptr(pptr, cpu);
>             val = (map_flags & BPF_F_ALL_CPUS) ? value : value + size * cpu;
>
> kernel/bpf/hashtab.c:1038 pcpu_copy_value()
>     for_each_possible_cpu(cpu) {
>             ...
>             copy_map_value_long(&htab->map, per_cpu_ptr(pptrs, cpu),
>                     value + off + size * cpu);
>
> With the mask 0,2-3 (num_possible_cpus() = 3, nr_cpu_ids = 4), the
> update walks possible CPUs {0, 2, 3} and indexes the buffer as:
>
>   cpu 0:  *(value + 0)  = buf[0] = 0   (intended)
>   cpu 2:  *(value + 16) = buf[2] = 3   (expects 2, gets 3)
>   cpu 3:  *(value + 24)             (past the 24-byte buffer end)
>
> The userspace layout is packed (3 entries), but the kernel accesses it
> as sparse (indexed by CPU ID). The test sized the buffer for
> num_possible_cpus() bytes, but the kernel's 'size * cpu' indexing can
> exceed that when the possible mask has holes.
>
> Should the userspace buffer either be laid out by CPU ID (sized for
> nr_cpu_ids, with holes at non-possible indices), or should the kernel's
> update path use packed indexing like the lookup direction does?
>
> > +     if (!ASSERT_EQ(slot, nr_cpus, "possible CPU mask weight"))
> > +             goto exit;
> >
> >       skel = test_map_lookup_percpu_elem__open();
> >       if (!ASSERT_OK_PTR(skel, "test_map_lookup_percpu_elem__open"))
> >               goto exit;
> >
> >       skel->rodata->my_pid = getpid();
> > -     skel->rodata->nr_cpus = nr_cpus;
> > +     skel->rodata->nr_cpu_ids = nr_cpu_ids;
> >
> >       ret = test_map_lookup_percpu_elem__load(skel);
>
> [ ... ]
>
>
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
>
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/33521264909

For context on the review, there's a commit that's directly relevant
here but isn't in the mainline or bpf-next tree yet, so flagging it
explicitly:
Commit: 75b0a6db4300e4c2c9e97a0848deaa7acfb42fb7 ("bpf: Fix percpu map
update indexing with sparse CPU IDs")
That commit changes the array, hash, and cgroup-storage update paths
from value + size * cpu to a dense running offset, matching the lookup
side. With it, a possible mask of 0,2-3 maps the packed buffer as:
    slot 0 -> CPU 0
    slot 1 -> CPU 2
    slot 2 -> CPU 3
  I developed this selftest change on top of that commit but failed to
state the dependency.
