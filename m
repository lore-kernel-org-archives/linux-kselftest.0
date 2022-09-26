Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECFDEC32771
	for <linux-kselftest@archiver.kernel.org>; Mon, 26 Sep 2022 23:48:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbiIZXsP (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 26 Sep 2022 19:48:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230055AbiIZXsO (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 26 Sep 2022 19:48:14 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 688DE9411E
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Sep 2022 16:48:13 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id lx7so1291655pjb.0
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Sep 2022 16:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=1s21+lS83pLYX71MT6ciy21wLuhZLK05BQsfQd+BxjU=;
        b=rWDAcDvSW0v+juJ3nm6pam7AooYCMCOCr67yEk9YcFrj+sWW9936Gf94fSBBowmuvY
         BCSvQrh1dqZh+FoalwAE+3Q4IYrhHt8vHYgVbgC4qX8BeLMQJHQ9t+0DYhO+mV2jUqjr
         nz6YfTGuq2pXFQXgpbZVzGovkAus7n06jK/QxBBkk46z3ZODVL5BgaIcVt9JO+n2HLLh
         dAlKRqS/NrNl4k8iPGxTirTxFTpib2w1AsF6umgMjWlVz50HTusVnwIiIXK3G/d3kcVm
         xLyMVsc2DQhqJWlj7S/BJx6/Q39FsoSC32XgxxbWn5xo54upnrIG5VuV3no6JPpQ/91H
         yqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=1s21+lS83pLYX71MT6ciy21wLuhZLK05BQsfQd+BxjU=;
        b=Zl3a9U8lOasPzhs4Zzw1jsCspo3k3k/zRQN19+AO6zq6kMArGriF20lXL/alwjRbx/
         W9rIYAITCmBTZz6onfBzZkMIo1K3LL1aylzDeuw6tjA0ZMx18gM4Q2SatgAmGUIbJz+s
         Bt1YaWDwn1Q6spCE+YPklXWQj5eyZkBwfEpw3js3LAcKbnsjHYh5L0Q12yTfxor907Ne
         XG2DG4IjcCQPWerbumocOugqyBQj97HYlzP6iMpvCniDKwbfboYrVp96IwKG6uHp7wRf
         14jTzW4sfWPqcI4gdj7Z/ojj41kdijbhPdfJctvStVHZ4KETaJDA+TyexRa/bEhHUhJD
         9D4g==
X-Gm-Message-State: ACrzQf0oCnOySSotNjmA5eosRILRSxKFbz/+ptgzI7R64Bdh2bhygDL5
        oKifZ/g6FvbjVGuLQQggrvXPxWbmBJgJtecMNMWWMg==
X-Google-Smtp-Source: AMsMyM74skeRHgwTvpDtJqFStX8ZUG+H1vsGA7vXJ6ng3obEtom59E5zhyYrPrFGPrg18+9oa9lCONeI/VFTj6i2m5Y=
X-Received: by 2002:a17:902:d143:b0:178:456b:8444 with SMTP id
 t3-20020a170902d14300b00178456b8444mr24550422plt.137.1664236092737; Mon, 26
 Sep 2022 16:48:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220915000448.1674802-1-vannapurve@google.com>
 <20220915000448.1674802-5-vannapurve@google.com> <YyuEhxW4URWVvHyW@google.com>
In-Reply-To: <YyuEhxW4URWVvHyW@google.com>
From:   Vishal Annapurve <vannapurve@google.com>
Date:   Mon, 26 Sep 2022 16:48:01 -0700
Message-ID: <CAGtprH-YsgkeD2qpY4kRvhX=goRC20wzLPrEKHBVX73urhqh4g@mail.gmail.com>
Subject: Re: [V2 PATCH 4/8] KVM: selftests: x86: Precompute the result for is_{intel,amd}_cpu()
To:     David Matlack <dmatlack@google.com>
Cc:     x86 <x86@kernel.org>, kvm list <kvm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linuxkselftest <linux-kselftest@vger.kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>, shuah <shuah@kernel.org>,
        Ben Gardon <bgardon@google.com>,
        Sean Christopherson <seanjc@google.com>,
        Oliver Upton <oupton@google.com>, Peter Xu <peterx@redhat.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Wed, Sep 21, 2022 at 2:39 PM David Matlack <dmatlack@google.com> wrote:
>
> On Thu, Sep 15, 2022 at 12:04:44AM +0000, Vishal Annapurve wrote:
> > Cache the vendor CPU type in a global variable so that multiple calls
> > to is_intel_cpu() do not need to re-execute CPUID.
> >
> > Add cpu vendor check in kvm_hypercall() so that it executes correct
> > vmcall/vmmcall instruction when running on Intel/AMD hosts. This avoids
> > exit to KVM which anyway tries to patch the instruction according to
> > the cpu type.
>
> Out of curiousity, why do we want to avoid this exit?

Referring to the patch set posted for UPM selftests with
non-confidential VMs [1], vmcall patching will not work for selftests
executed with UPM feature enabled since guest memory can not be
modified by KVM. So I tried to add a kvm_hypercall implementation that
will execute the hypercall according to the cpu type.

Hypercall updates in this series are done to ensure that such a change
is done for all callers to allow consistency and avoid relying on KVM
behavior to patch the vmmcall/vmcall instruction.

[1] https://lore.kernel.org/lkml/20220819174659.2427983-5-vannapurve@google.com/
