Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D4F0C54EE9
	for <linux-kselftest@archiver.kernel.org>; Thu,  1 Sep 2022 14:38:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234889AbiIAOid (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 1 Sep 2022 10:38:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234933AbiIAOiI (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 1 Sep 2022 10:38:08 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BDC67C1ED
        for <linux-kselftest@vger.kernel.org>; Thu,  1 Sep 2022 07:38:01 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id f12so17094141plb.11
        for <linux-kselftest@vger.kernel.org>; Thu, 01 Sep 2022 07:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date;
        bh=o6yMdDL9GGqHD1GiDwF9wfetaKhW1e9T/BEjpmKh4O4=;
        b=RDZEl+KUVoHh18UaGCBFBp6JNa0eHKGh8KzFzPTiwMrkR0u2OHp25dXSQKmA/jNamb
         IiKkrZ5lBVdWxnI/LcUkzPip6f0NQsONbHoVQih7x6c2N1mbmQFmzkeEBTpMRfn2ECBF
         U1TXJUawm//eU8tU0W9UgJfYC1lju6CfmO4Rio+cDZbgEy623Xx2rF2sTwVFq71diuz1
         6vOhPgQsVmJ0Pgu6XzGZMfTos/Xw1mX1UvMKkKvUQcIcQSDc/1DxULEZ45lsw8Vzy8rK
         8Q2aonNJ3cKN916WWywRB9QLD8716prsM5ubHbGMyH0BPo8/J4R1TR84ImBp3v7FOape
         9I3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=o6yMdDL9GGqHD1GiDwF9wfetaKhW1e9T/BEjpmKh4O4=;
        b=s6hKAsOPAuQ3WYSaJYmfG1xACrL3Djq5WFmUrPn943RGkHaOPNWdTh+RC8T1hd9H/j
         cxdC3xzjwXzIAvjHi1qPXj6wN+Tm+qlSIHKbG2WkvMXL7ioeBwIf3flz4IZ+OBFctklp
         QoMoKGMAAEF5MlBf5d87Q5N6Pra1Tlo72DTr7S4MZ06gH+UFHOvsM5Rjfwtaz2lV4j27
         OPeqthXzWHCvRHBLkKrPmz8KGMnVCqo50+MUI6x1y7a2TiHBDLAqm1xJuphthvG9xhXu
         zT0bBKr50U6/JFTMztTkPd0w00MPyqCQsXY0MOXz/WzADIbnEuePzcKcYEP2B40HhMDo
         jo7A==
X-Gm-Message-State: ACgBeo1GF0rBhfU9BV1BD4tGnJfuuRSGC0N5PJk6GrRg/kLqblOYUNTQ
        G8YaOS6fnIkSHcXlbrSdHHnxqqfpDvJFSw==
X-Google-Smtp-Source: AA6agR4lWS8LqRjOi35EuZrK28RrGmRfFYIo8kNT9zxA1ZYtmfQGrOFUbDVbHHjeErQDZZDxt3XYRQ==
X-Received: by 2002:a17:90b:2c12:b0:1fd:78fa:5ea7 with SMTP id rv18-20020a17090b2c1200b001fd78fa5ea7mr9247426pjb.29.1662043080062;
        Thu, 01 Sep 2022 07:38:00 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id f5-20020a170902684500b001635b86a790sm13788150pln.44.2022.09.01.07.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 07:37:59 -0700 (PDT)
Date:   Thu, 1 Sep 2022 14:37:56 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Isaku Yamahata <isaku.yamahata@gmail.com>
Cc:     Sagi Shahar <sagis@google.com>, linux-kselftest@vger.kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Isaku Yamahata <isaku.yamahata@intel.com>,
        Erdem Aktas <erdemaktas@google.com>,
        Ryan Afranji <afranji@google.com>,
        Roger Wang <runanwang@google.com>,
        Shuah Khan <shuah@kernel.org>,
        Andrew Jones <drjones@redhat.com>,
        Marc Zyngier <maz@kernel.org>, Ben Gardon <bgardon@google.com>,
        Jim Mattson <jmattson@google.com>,
        David Matlack <dmatlack@google.com>,
        Peter Xu <peterx@redhat.com>, Oliver Upton <oupton@google.com>,
        Ricardo Koller <ricarkol@google.com>,
        Yang Zhong <yang.zhong@intel.com>,
        Wei Wang <wei.w.wang@intel.com>,
        Xiaoyao Li <xiaoyao.li@intel.com>,
        Peter Gonda <pgonda@google.com>, Marc Orr <marcorr@google.com>,
        Emanuele Giuseppe Esposito <eesposit@redhat.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Eric Auger <eric.auger@redhat.com>,
        Yanan Wang <wangyanan55@huawei.com>,
        Aaron Lewis <aaronlewis@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Peter Shier <pshier@google.com>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Zhenzhong Duan <zhenzhong.duan@intel.com>,
        "Maciej S . Szmigiero" <maciej.szmigiero@oracle.com>,
        Like Xu <like.xu@linux.intel.com>,
        linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [RFC PATCH v2 03/17] KVM: selftest: Adding TDX life cycle test.
Message-ID: <YxDDxKEdqEORDz72@google.com>
References: <20220830222000.709028-1-sagis@google.com>
 <20220830222000.709028-4-sagis@google.com>
 <20220901004631.GC2711697@ls.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220901004631.GC2711697@ls.amr.corp.intel.com>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Wed, Aug 31, 2022, Isaku Yamahata wrote:
> Sometimes compiler (my gcc is (Ubuntu 11.1.0-1ubuntu1~20.04) 11.1.0) doesn't like
> clobering the frame pointer as follows. (I edited the caller site for other test.)
> 
>    x86_64/tdx_vm_tests.c:343:1: error: bp cannot be used in ‘asm’ here
> 
> I ended up the following workaround.  I didn't use pushq/popq pair because
> I didn't want to play with offset in the stack of the caller.
> 
> 
> diff --git a/tools/testing/selftests/kvm/lib/x86_64/tdx.h b/tools/testing/selftests/kvm/lib/x86_64/tdx.h
> index aa6961c6f304..8ddf3b64f003 100644
> --- a/tools/testing/selftests/kvm/lib/x86_64/tdx.h
> +++ b/tools/testing/selftests/kvm/lib/x86_64/tdx.h
> @@ -122,7 +122,11 @@ void prepare_source_image(struct kvm_vm *vm, void *guest_code,
>   */
>  static inline void tdcall(struct kvm_regs *regs)
>  {
> +       unsigned long saved_rbp = 0;
> +
>         asm volatile (
> +               /* gcc complains that frame pointer %rbp can't be clobbered. */
> +                       "movq %%rbp, %28;\n\t"
>                         "mov %13, %%rax;\n\t"
>                         "mov %14, %%rbx;\n\t"
>                         "mov %15, %%rcx;\n\t"
> @@ -152,6 +156,8 @@ static inline void tdcall(struct kvm_regs *regs)
>                         "mov %%r15, %10;\n\t"
>                         "mov %%rsi, %11;\n\t"
>                         "mov %%rdi, %12;\n\t"
> +                       "movq %28, %%rbp\n\t"
> +                       "movq $0, %28\n\t"
>                         : "=m" (regs->rax), "=m" (regs->rbx), "=m" (regs->rdx),
>                         "=m" (regs->r8), "=m" (regs->r9), "=m" (regs->r10),
>                         "=m" (regs->r11), "=m" (regs->r12), "=m" (regs->r13),
> @@ -161,9 +167,10 @@ static inline void tdcall(struct kvm_regs *regs)
>                         "m" (regs->rdx), "m" (regs->r8), "m" (regs->r9),
>                         "m" (regs->r10), "m" (regs->r11), "m" (regs->r12),
>                         "m" (regs->r13), "m" (regs->r14), "m" (regs->r15),
> -                       "m" (regs->rbp), "m" (regs->rsi), "m" (regs->rdi)
> +                       "m" (regs->rbp), "m" (regs->rsi), "m" (regs->rdi),
> +                       "m" (saved_rbp)
>                         : "rax", "rbx", "rcx", "rdx", "r8", "r9", "r10", "r11",
> -                       "r12", "r13", "r14", "r15", "rbp", "rsi", "rdi");
> +                         "r12", "r13", "r14", "r15", "rsi", "rdi");
>  }

Inline assembly for TDCALL is going to be a mess.  Assuming proper assembly doesn't
Just Work for selftests, we should solve that problem and build this on top.
