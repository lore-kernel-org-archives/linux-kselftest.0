Return-Path: <SRS0=J0+f=EK=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5144CC2D0A3
	for <linux-kselftest@archiver.kernel.org>; Wed,  4 Nov 2020 17:02:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5D1320735
	for <linux-kselftest@archiver.kernel.org>; Wed,  4 Nov 2020 17:01:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qif5C86Y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731587AbgKDRB7 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 4 Nov 2020 12:01:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731326AbgKDRB7 (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 4 Nov 2020 12:01:59 -0500
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20041C0613D4
        for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2020 09:01:59 -0800 (PST)
Received: by mail-io1-xd42.google.com with SMTP id u21so12333587iol.12
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2020 09:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lKt/7khf/p0FBH94EgBjgYowDupQdP5eOw+aVFWnIE4=;
        b=Qif5C86YMdm2wITkiOw1A3DHnWkrj5BznSur9w6S9h05s4uEH0tpfJfwkirw+OCsIa
         5ZUWAUw2Xr0Y+yBcfMul3p6BrzjIdeyVKYTObdOQpXyGA8Jc0onI0PLPZPkY5rWtjuiX
         KwvEwFnF1QCroLya8QNYKLFqbYxlf+Oxcuhsj/2kUx3aX6FlLQP70+THTejWseON5vTZ
         ZBsnYJ71IQEmS3ODRZggk7Qxw4OUAzqErw5JjwSmPxCbg1lvm9Mw5zPS9hKeCh8j+tNk
         3UZEnuPFiAywWXQTW9+s4q/6AGurkFrhGK7OBOjl186bChjLK2Wf5LPfStOaQNQY70ht
         MXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lKt/7khf/p0FBH94EgBjgYowDupQdP5eOw+aVFWnIE4=;
        b=k6Ql0QW5D831n1juql2A0IhyuUsOVQmNdQHt13zraEriuIaAK75F0JSyVDxG4IvONa
         Om34G4wzTH4HFW45NxKCTTiCVBeGAE0cMzn7hAIAahex1mDZm9en4JAU4Twj0IVYnVVR
         RK0Mxg4vxcW3sikc45N2VLRbyid3ycZJ0d6XnaX1KwajKhYwTC3/9r/fEQ6iPANEY0DI
         AgN4mcEI7o28rKkiNMv1PB+PSyAERQ3l+5Qb1nNxIVr8zABLAg0lTA1OLcAbhA3TriAG
         2FKlST7ihhWq+o8j5MfCrBkY2J4E2oI5IXfTU/v0ciTNONH6nObKLsbJM0s/Q+fDUVkL
         cbNw==
X-Gm-Message-State: AOAM5313olZpgzKlweFSavz4G0QcfsuHVRSOTXoHQtNqociqcda0GZ7G
        YOoNdDwRVoZPXWgwEd/MSom91sT7gjXeBDC/OF1/mA==
X-Google-Smtp-Source: ABdhPJzL1QewBuecQ3Wuja+O1RDK1wskv/Oq/mAWRQpKntRVQ3pfff2m+nGSvCw8+CkfpP3zR3jF0Ttk0JEAXEi4DgY=
X-Received: by 2002:a6b:e012:: with SMTP id z18mr14242690iog.157.1604509318295;
 Wed, 04 Nov 2020 09:01:58 -0800 (PST)
MIME-Version: 1.0
References: <20201103234952.1626730-1-bgardon@google.com> <20201103234952.1626730-3-bgardon@google.com>
 <20201104121631.wvodsw7agsrdhje4@kamzik.brq.redhat.com> <20201104150017.GN20600@xz-x1>
 <20201104152823.qxdlbygza7ykn5x2@kamzik.brq.redhat.com>
In-Reply-To: <20201104152823.qxdlbygza7ykn5x2@kamzik.brq.redhat.com>
From:   Ben Gardon <bgardon@google.com>
Date:   Wed, 4 Nov 2020 09:01:47 -0800
Message-ID: <CANgfPd9RPiyX9BeYpWLHGyqfO83uWZKKynfP4vkbvSbzBK9syg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] KVM: selftests: Factor code out of demand_paging_test
To:     Andrew Jones <drjones@redhat.com>
Cc:     Peter Xu <peterx@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
        kvm <kvm@vger.kernel.org>, linux-kselftest@vger.kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Shier <pshier@google.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Thomas Huth <thuth@redhat.com>,
        Peter Feiner <pfeiner@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Wed, Nov 4, 2020 at 7:28 AM Andrew Jones <drjones@redhat.com> wrote:
>
> On Wed, Nov 04, 2020 at 10:00:17AM -0500, Peter Xu wrote:
> > On Wed, Nov 04, 2020 at 01:16:31PM +0100, Andrew Jones wrote:
> > > If you don't mind I'd like to try and cleanup / generalize / refactor
> > > demand_paging_test.c and dirty_log_test.c with a few patches first for
> > > you to base this work on. I can probably get something posted today
> > > or tomorrow.
> >
> > Drew,
> >
> > Would you consider picking up the two patches below in the dirty ring series if
> > you plan to rework the dirty log tests?  I got your r-b so I am making bold to
> > think I'm ok to ask this; I just want to avoid another potential conflict
> > within the series.
>
> Sure, no problem.
>
> I'll go ahead and get that cleanup / refactor series out.

Thanks Drew! I agree this will all be a lot cleaner when refactored
for multi-vcpu tests generally.

>
> Thanks,
> drew
>
> >
> > Thanks!
> >
> > [1] https://lore.kernel.org/kvm/20201023183358.50607-11-peterx@redhat.com/
> > [2] https://lore.kernel.org/kvm/20201023183358.50607-12-peterx@redhat.com/
> >
> > --
> > Peter Xu
> >
>
