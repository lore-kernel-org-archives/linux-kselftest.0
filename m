Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55157C6FA82
	for <linux-kselftest@archiver.kernel.org>; Mon, 26 Sep 2022 23:37:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbiIZXhm (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 26 Sep 2022 19:37:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230311AbiIZXhl (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 26 Sep 2022 19:37:41 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 093FE87FBB
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Sep 2022 16:37:37 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id g1-20020a17090a708100b00203c1c66ae3so8485734pjk.2
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Sep 2022 16:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=KjIJcMu3j47863rruoPF+gRowBl1pX33rzUpZJzpgKY=;
        b=kA3Wow+Cy1NPefOHwt4wlLxeC3b4cz0oOKWyCx8F6hj0fHOKBrI5p/iJKBaXHWEZ/0
         dg8TKvgE4ZisSNAg+pvZ2rrH6uPErC15MDJcPUBOHRFfv/n40crMquSW9uAZh5tNpO97
         oYKAKSIbjzO6DB9ivITC48fSSmSkvpPv57YbuczBAHp/IyaU5wTCZo2xTpQhmJl80HDA
         L8dAxxbLUuGq/EvQEf08+mKOS4pv+nGZRozVveLl3enya8GECDeykoItZI9tUZFcg2es
         eisFgmhl+oN8AvJy3bTszGK/leazPVzDWdgHib4WBV1dBWfkA9/YJnLCs3IZavSMVpD/
         Bj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=KjIJcMu3j47863rruoPF+gRowBl1pX33rzUpZJzpgKY=;
        b=0GUySuuQlTmMmDCEBb0pvo7+1HKIDQ0EY/bj8CI0eysKo9hadhvoebvhWHijPozsUc
         L2ixPe6qyy/OfRTC3D/VuvjRXlx2ATkmNcewXUmutW0Q1PJz5GXtBJPwzF4KtVP3Cfgx
         EJCgsTFg8fTL76wNuBCD5OHz8VENINfUdd3gg7Q8FIx5iBVXdar2xPi+OI4DD55WJqTT
         +lJjbgpP3k+mA8L+BJYaHvcNCTQ1W+qZ2/bTQBTw7M/q918zDynTBbmOovt1AiWyhQ+o
         TpCF2I/e226kdQOpTsnz6fZTaSnuF5VKyocezcEcPzugKkoi1lwXBrtqVULlLRMTan9k
         nGKA==
X-Gm-Message-State: ACrzQf255Ab+AZcV23/dbSb1WWmLMWRqAtEUkA7SO77m/TZIWGCvrcCZ
        zFVoB+vQG8f90SqSGHSIZxUAca9CuL2mK/czJDJ/9w==
X-Google-Smtp-Source: AMsMyM6AQvbyCxZs18zCw8yhX3gLnr4hVjYGPIHK/1lOaW50c7UnNTF6H7HSfrNfwg5vbOtFxhhGXJTUXuiWW54RNpE=
X-Received: by 2002:a17:902:d143:b0:178:456b:8444 with SMTP id
 t3-20020a170902d14300b00178456b8444mr24515711plt.137.1664235457301; Mon, 26
 Sep 2022 16:37:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220915000448.1674802-1-vannapurve@google.com>
 <20220915000448.1674802-9-vannapurve@google.com> <YyuGgX/wA+wvLiOg@google.com>
In-Reply-To: <YyuGgX/wA+wvLiOg@google.com>
From:   Vishal Annapurve <vannapurve@google.com>
Date:   Mon, 26 Sep 2022 16:37:26 -0700
Message-ID: <CAGtprH9n10JgKAR1ims-KJSG0ehOkqYR5EWx7MNZne7MXnAsPg@mail.gmail.com>
Subject: Re: [V2 PATCH 8/8] KVM: selftests: x86: xen: Execute cpu specific
 vmcall instruction
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

On Wed, Sep 21, 2022 at 2:47 PM David Matlack <dmatlack@google.com> wrote:
>
> On Thu, Sep 15, 2022 at 12:04:48AM +0000, Vishal Annapurve wrote:
> > Update xen specific hypercall invocation to execute cpu specific vmcall
> > instructions.
> >
> > Suggested-by: Sean Christopherson <seanjc@google.com>
> > Signed-off-by: Vishal Annapurve <vannapurve@google.com>
> > ---
> >  .../selftests/kvm/x86_64/xen_shinfo_test.c    | 64 +++++++------------
> >  .../selftests/kvm/x86_64/xen_vmcall_test.c    | 14 ++--
> >  2 files changed, 34 insertions(+), 44 deletions(-)
> > ...
> > diff --git a/tools/testing/selftests/kvm/x86_64/xen_vmcall_test.c b/tools/testing/selftests/kvm/x86_64/xen_vmcall_test.c
> > index 88914d48c65e..e78f1b5d3af8 100644
> > --- a/tools/testing/selftests/kvm/x86_64/xen_vmcall_test.c
> > +++ b/tools/testing/selftests/kvm/x86_64/xen_vmcall_test.c
> > @@ -37,10 +37,16 @@ static void guest_code(void)
> >       register unsigned long r9 __asm__("r9") = ARGVALUE(6);
> >
> >       /* First a direct invocation of 'vmcall' */
> > -     __asm__ __volatile__("vmcall" :
> > -                          "=a"(rax) :
> > -                          "a"(rax), "D"(rdi), "S"(rsi), "d"(rdx),
> > -                          "r"(r10), "r"(r8), "r"(r9));
> > +     if (is_amd_cpu())
> > +             __asm__ __volatile__("vmmcall" :
> > +                     "=a"(rax) :
> > +                     "a"(rax), "D"(rdi), "S"(rsi), "d"(rdx),
> > +                     "r"(r10), "r"(r8), "r"(r9));
> > +     else
> > +             __asm__ __volatile__("vmcall" :
> > +                     "=a"(rax) :
> > +                     "a"(rax), "D"(rdi), "S"(rsi), "d"(rdx),
> > +                     "r"(r10), "r"(r8), "r"(r9));
>
> Can we create common helper functions or macros for doing hypercalls to
> reduce the amount of duplicated inline assembly?
>

Ack, will fix this in the next series.

> >       GUEST_ASSERT(rax == RETVALUE);
> >
> >       /* Fill in the Xen hypercall page */
> > --
> > 2.37.2.789.g6183377224-goog
> >
