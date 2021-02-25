Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC1F7C433DB
	for <linux-kselftest@archiver.kernel.org>; Thu, 25 Feb 2021 23:27:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 75EE4601FD
	for <linux-kselftest@archiver.kernel.org>; Thu, 25 Feb 2021 23:27:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230019AbhBYX1y (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 25 Feb 2021 18:27:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232113AbhBYX1x (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 25 Feb 2021 18:27:53 -0500
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D85BEC061788
        for <linux-kselftest@vger.kernel.org>; Thu, 25 Feb 2021 15:27:12 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id 81so4130404iou.11
        for <linux-kselftest@vger.kernel.org>; Thu, 25 Feb 2021 15:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5BVyJ8VvhMa5lHXCBOiQO5IyxOHW0ykPgLhaVVKuF7o=;
        b=UWBdQmX5mxAijUdurfYOQi6c43opvi1a/wi/+4KyyiHnJJSuhXhjNw9bYkLjqtkxAs
         vGiJ8MhFQKJ9R0mZ0SxqK1g6dO98KHuEjnrvyhhYaZPQT4+aEocJAmoL4I2Xk8Gohcjc
         qVh2FHH2skEnlBFGnTtXAiStbuFid709J4jHNahXQxocrUXTLcwNI5rjUZEBY8Pswxq5
         LEta9r9H5PHla4jnN4W7I2fatYYsf5emIp+5DRJt63xeOdoGGTrkIt6uFhtLbmM44TiB
         ixQap30K4R0vg3a19ZXZBjIXE2cflvXK/dCudrVp159dl07OXVp8tM2YaqM6PbVX4otY
         4lmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5BVyJ8VvhMa5lHXCBOiQO5IyxOHW0ykPgLhaVVKuF7o=;
        b=ZH1fTiDD7rJbykvTn06MrqYHhKMHri9XhRFCQX4171p/g7TSoz6XZx64JSCTcKi/T/
         6dy82Uno5qxt92k0CKlh2fh9WGCc1lVPe3tMo48cyDcMM+gmzIVwc1SWLXHB79YV8n5n
         311S50vuDf62hs6BV+9lRrYoL9OuVE4SPwFWLiLdCJBarKE+jp3CDHFViKVjf2PL/S3m
         Ut72TG328RjbaIGhsI3zBKRg+akVNyd+KL2S9C1XHR8ilsl7R9ThcFYye2YMYRrirrw3
         hJ2HfJ2x4l5aO2srzq7DxN62Lp/a87xcpjZomgMIkl1p4xJaRWaphJZTevDA4YhC1KIU
         GJkQ==
X-Gm-Message-State: AOAM531ZqyQ0P3U1KWUf56ohPV0VFz03GEPd/hg1lhqFqACufHOgCBi0
        4xb2KaDdLnxywB3gX+bdiU4kjf+2T4LC5nN7ipdPnA==
X-Google-Smtp-Source: ABdhPJwxP/CvB1vsBhRA6CV3ZO+uz2PjuW+nzH1ZzaEPt9UicnfG7Q8mmt7mINLxqNLB6ZHvaVrOMs5R+ln5kmfDveU=
X-Received: by 2002:a02:30cb:: with SMTP id q194mr159018jaq.57.1614295632018;
 Thu, 25 Feb 2021 15:27:12 -0800 (PST)
MIME-Version: 1.0
References: <20210225055940.18748-1-wangyanan55@huawei.com> <20210225055940.18748-5-wangyanan55@huawei.com>
In-Reply-To: <20210225055940.18748-5-wangyanan55@huawei.com>
From:   Ben Gardon <bgardon@google.com>
Date:   Thu, 25 Feb 2021 15:27:00 -0800
Message-ID: <CANgfPd8rSmKr_G9HFqt30hFGJ9jW387yUODYH+f+BUJPv7-sCA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/7] KVM: selftests: Add a helper to get system
 configured THP page size
To:     Yanan Wang <wangyanan55@huawei.com>
Cc:     kvm <kvm@vger.kernel.org>, linux-kselftest@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Ingo Molnar <mingo@kernel.org>,
        Andrew Jones <drjones@redhat.com>,
        Peter Xu <peterx@redhat.com>, Marc Zyngier <maz@kernel.org>,
        wanghaibin.wang@huawei.com, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Wed, Feb 24, 2021 at 10:00 PM Yanan Wang <wangyanan55@huawei.com> wrote:
>
> If we want to have some tests about transparent hugepages, the system
> configured THP hugepage size should better be known by the tests, which
> can be used for kinds of alignment or guest memory accessing of vcpus...
> So it makes sense to add a helper to get the transparent hugepage size.
>
> With VM_MEM_SRC_ANONYMOUS_THP specified in vm_userspace_mem_region_add(),
> we now stat /sys/kernel/mm/transparent_hugepage to check whether THP is
> configured in the host kernel before madvise(). Based on this, we can also
> read file /sys/kernel/mm/transparent_hugepage/hpage_pmd_size to get THP
> hugepage size.
>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>

Reviewed-by: Ben Gardon <bgardon@google.com>

> ---
>  .../testing/selftests/kvm/include/test_util.h |  2 ++
>  tools/testing/selftests/kvm/lib/test_util.c   | 36 +++++++++++++++++++
>  2 files changed, 38 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/include/test_util.h b/tools/testing/selftests/kvm/include/test_util.h
> index b7f41399f22c..ef24c76ba89a 100644
> --- a/tools/testing/selftests/kvm/include/test_util.h
> +++ b/tools/testing/selftests/kvm/include/test_util.h
> @@ -78,6 +78,8 @@ struct vm_mem_backing_src_alias {
>         enum vm_mem_backing_src_type type;
>  };
>
> +bool thp_configured(void);
> +size_t get_trans_hugepagesz(void);
>  void backing_src_help(void);
>  enum vm_mem_backing_src_type parse_backing_src_type(const char *type_name);
>
> diff --git a/tools/testing/selftests/kvm/lib/test_util.c b/tools/testing/selftests/kvm/lib/test_util.c
> index c7c0627c6842..f2d133f76c67 100644
> --- a/tools/testing/selftests/kvm/lib/test_util.c
> +++ b/tools/testing/selftests/kvm/lib/test_util.c
> @@ -10,6 +10,7 @@
>  #include <limits.h>
>  #include <stdlib.h>
>  #include <time.h>
> +#include <sys/stat.h>
>  #include "linux/kernel.h"
>
>  #include "test_util.h"
> @@ -117,6 +118,41 @@ const struct vm_mem_backing_src_alias backing_src_aliases[] = {
>         {"anonymous_hugetlb", VM_MEM_SRC_ANONYMOUS_HUGETLB,},
>  };
>
> +bool thp_configured(void)
> +{
> +       int ret;
> +       struct stat statbuf;
> +
> +       ret = stat("/sys/kernel/mm/transparent_hugepage", &statbuf);
> +       TEST_ASSERT(ret == 0 || (ret == -1 && errno == ENOENT),
> +                   "Error in stating /sys/kernel/mm/transparent_hugepage: %d",
> +                   errno);
> +
> +       return ret == 0;
> +}
> +
> +size_t get_trans_hugepagesz(void)
> +{
> +       size_t size;
> +       char buf[16];
> +       FILE *f;
> +
> +       TEST_ASSERT(thp_configured(), "THP is not configured in host kernel");
> +
> +       f = fopen("/sys/kernel/mm/transparent_hugepage/hpage_pmd_size", "r");
> +       TEST_ASSERT(f != NULL,
> +                   "Error in opening transparent_hugepage/hpage_pmd_size: %d",
> +                   errno);
> +
> +       if (fread(buf, sizeof(char), sizeof(buf), f) == 0) {
> +               fclose(f);
> +               TEST_FAIL("Unable to read transparent_hugepage/hpage_pmd_size");
> +       }
> +
> +       size = strtoull(buf, NULL, 10);
> +       return size;
> +}
> +
>  void backing_src_help(void)
>  {
>         int i;
> --
> 2.19.1
>
