Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B7DC32771
	for <linux-kselftest@archiver.kernel.org>; Mon, 26 Sep 2022 23:20:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230394AbiIZXUR (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 26 Sep 2022 19:20:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231207AbiIZXTI (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 26 Sep 2022 19:19:08 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2CD9D98CE
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Sep 2022 16:18:56 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d82so8129093pfd.10
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Sep 2022 16:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Jo63jB5aNkOmZDxGlU8EM0gFxXH2llzd7sTVLu1lWkc=;
        b=MIMLv+fnxX3/NujgpjMsljKROeTEsehckMHu/VtUXTQ6lmxDM+4W56RtENRiIpoOcD
         T9yxqUa9KXPczd7Glb4rMT7AAWsa9huqQDk9pGaDIv4O7F1nDuM2FrxOlFx72i2r3b+4
         AmI8YMthUGJkG+GKj3Kmtzyk/N+UoybrcC69BgcOfIfoLmrftAxhdEHoFAs/v/E4/oed
         9yhHs663VNYfrkHDAOWT8Gz8xgkaC0BI76niXWQasZXP07OtqPIgll/tqiyIcCoZW3Af
         APBufVCyll4LqSP4RQm2XfsaKfwf2afNIMBIvMZhrNISLDgwLBzSsdXJDulcyis1TsCc
         Y28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Jo63jB5aNkOmZDxGlU8EM0gFxXH2llzd7sTVLu1lWkc=;
        b=1lpnCEx6+Xv2OhHIVIgGNc6JrS/Fn/LFnFscWOiKHmAObX1mJmam3AJO/vv14lhMrh
         Q4bjXvKlrjCvaVDAzXbLnKfVTb6i0n0uhfgrfTiDMlQgArA7XlEALbi8p6/CsIZ9DkRS
         352LLCAJSnSQpvRfVwBivtEJeyI6JQWURL9pTy0OObhrbS9F3fwMZ51Dzx4UzGfCoWmO
         FQepL76MBpkt32+DF1Ow3AlVdbKu2/9YPoftgdiNcbHP71mhCv3PZ+jCZ5T8nwp2v2eg
         21NzFf2RNIoeFdAGOuVBa7YX891ClOfLVztewPu/nEq/cunmJWoMR8In93oagOaKRCtK
         UAbA==
X-Gm-Message-State: ACrzQf2lv+Y4kmDQE64UUkSfRgElqFxln2u1XwxJMQKIc1HyGcSrBwl9
        VIiKi4NXTlGv20v7eZFf3T6JWyfRsYDrmoO59+2qrw==
X-Google-Smtp-Source: AMsMyM4S/0VFRIw7ZIAOSmkH/RM0a/mtR2soWIHzWpFEX/5z9uplwlebgbwcSlX90m2tOtR4FyMLzIYefOcWWrlEd3g=
X-Received: by 2002:a63:b4f:0:b0:439:cc64:50e6 with SMTP id
 a15-20020a630b4f000000b00439cc6450e6mr21426874pgl.483.1664234336144; Mon, 26
 Sep 2022 16:18:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220915000448.1674802-1-vannapurve@google.com>
 <20220915000448.1674802-3-vannapurve@google.com> <Yyt5MHc1bwPfvBq/@google.com>
In-Reply-To: <Yyt5MHc1bwPfvBq/@google.com>
From:   Vishal Annapurve <vannapurve@google.com>
Date:   Mon, 26 Sep 2022 16:18:45 -0700
Message-ID: <CAGtprH_BMgeLX14f8J+rmKBtOFs12GY+egGBPW7Un41oDAfcoA@mail.gmail.com>
Subject: Re: [V2 PATCH 2/8] KVM: selftests: Add arch specific initialization
To:     David Matlack <dmatlack@google.com>
Cc:     x86 <x86@kernel.org>, kvm list <kvm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-kselftest@vger.kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>, shuah <shuah@kernel.org>,
        Ben Gardon <bgardon@google.com>,
        Sean Christopherson <seanjc@google.com>,
        Oliver Upton <oupton@google.com>, peterx@redhat.com,
        Vitaly Kuznetsov <vkuznets@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Wed, Sep 21, 2022 at 1:51 PM David Matlack <dmatlack@google.com> wrote:
>
> On Thu, Sep 15, 2022 at 12:04:42AM +0000, Vishal Annapurve wrote:
> > Introduce arch specific API: kvm_selftest_arch_init to allow each arch to
> > handle initialization before running any selftest logic.
> >
> > Suggested-by: Sean Christopherson <seanjc@google.com>
> > Signed-off-by: Vishal Annapurve <vannapurve@google.com>
> > ---
> >  .../selftests/kvm/include/kvm_util_base.h      |  5 +++++
> >  .../selftests/kvm/lib/aarch64/processor.c      | 18 +++++++++---------
> >  tools/testing/selftests/kvm/lib/kvm_util.c     |  2 ++
> >  .../selftests/kvm/lib/riscv/processor.c        |  4 ++++
> >  .../selftests/kvm/lib/s390x/processor.c        |  4 ++++
> >  .../selftests/kvm/lib/x86_64/processor.c       |  4 ++++
> >  6 files changed, 28 insertions(+), 9 deletions(-)
> >
> > diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
> > index 24fde97f6121..98edbbda9f97 100644
> > --- a/tools/testing/selftests/kvm/include/kvm_util_base.h
> > +++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
> > @@ -834,4 +834,9 @@ static inline int __vm_disable_nx_huge_pages(struct kvm_vm *vm)
> >       return __vm_enable_cap(vm, KVM_CAP_VM_DISABLE_NX_HUGE_PAGES, 0);
> >  }
> >
> > +/*
> > + * API to execute architecture specific setup before executing selftest logic.
>
> nit: s/before executing selftest logic/before main()/
>

Ack, will fix this in the next series.

> ("selftest logic" is vague)
>
> > + */
> > +void kvm_selftest_arch_init(void);
> > +
> >  #endif /* SELFTEST_KVM_UTIL_BASE_H */
> > diff --git a/tools/testing/selftests/kvm/lib/aarch64/processor.c b/tools/testing/selftests/kvm/lib/aarch64/processor.c
> > index 6f5551368944..2281d6c5d02f 100644
> > --- a/tools/testing/selftests/kvm/lib/aarch64/processor.c
> > +++ b/tools/testing/selftests/kvm/lib/aarch64/processor.c
> > @@ -495,15 +495,6 @@ void aarch64_get_supported_page_sizes(uint32_t ipa,
> >       close(kvm_fd);
> >  }
> >
> > -/*
> > - * arm64 doesn't have a true default mode, so start by computing the
> > - * available IPA space and page sizes early.
> > - */
> > -void __attribute__((constructor)) init_guest_modes(void)
> > -{
> > -       guest_modes_append_default();
> > -}
> > -
> >  void smccc_hvc(uint32_t function_id, uint64_t arg0, uint64_t arg1,
> >              uint64_t arg2, uint64_t arg3, uint64_t arg4, uint64_t arg5,
> >              uint64_t arg6, struct arm_smccc_res *res)
> > @@ -528,3 +519,12 @@ void smccc_hvc(uint32_t function_id, uint64_t arg0, uint64_t arg1,
> >                      [arg4] "r"(arg4), [arg5] "r"(arg5), [arg6] "r"(arg6)
> >                    : "x0", "x1", "x2", "x3", "x4", "x5", "x6", "x7");
> >  }
> > +
> > +/*
> > + * arm64 doesn't have a true default mode, so start by computing the
> > + * available IPA space and page sizes early.
> > + */
> > +void kvm_selftest_arch_init(void)
> > +{
> > +     guest_modes_append_default();
> > +}
> > diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> > index 3c83838999f5..dafe4471a6c7 100644
> > --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> > +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> > @@ -1984,4 +1984,6 @@ void __attribute((constructor)) kvm_selftest_init(void)
> >  {
> >       /* Tell stdout not to buffer its content. */
> >       setbuf(stdout, NULL);
> > +
> > +     kvm_selftest_arch_init();
> >  }
>
> Suggest defining a default no-op implementation of
> kvm_selftest_arch_init() using __weak since most architectures do not
> actually need an implementation.
>

Ack, will update this in the next series.

> > ...
> >
