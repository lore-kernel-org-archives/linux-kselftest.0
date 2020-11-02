Return-Path: <SRS0=9g6x=EI=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31DABC00A89
	for <linux-kselftest@archiver.kernel.org>; Mon,  2 Nov 2020 22:59:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D688922275
	for <linux-kselftest@archiver.kernel.org>; Mon,  2 Nov 2020 22:59:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xy3858vI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725864AbgKBW7k (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 2 Nov 2020 17:59:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725807AbgKBW7k (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 2 Nov 2020 17:59:40 -0500
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 483C8C061A47
        for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2020 14:59:40 -0800 (PST)
Received: by mail-il1-x144.google.com with SMTP id v18so14508699ilg.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2020 14:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WLiJRSZDtXGLiZVllQRQGLaR655Hs+rHimHW4Xh2uCI=;
        b=Xy3858vI46rSFVYKB418SAOtR8xhErvTZXC0kS+Ij+3CB4nlLReyT5p3EwP4xoog4L
         U806CmRrgiBeMvnFR4bOG0UPR0HyT64powJ0A0+HYqyoTEAuNKkPtFKD+xrD169A8aRt
         nAKCxmCfGuYjcYJ1rOVxcBsaxXPzKGcevIudZafx35sBjHUhzBjsHE2A/1nCjqOnNVjH
         1SL+rWTrPweOT0JQ1kX/3wzU6QrNZ2+Jw2kO1SvCOdgPO/j91ror3BcgyeGl40KLm9mk
         z8s1LkKFkuh37nPpbtLMWNh0S9upOlQ3xg8jUDN16g7AjO8BX1NFG3X5XzOli2F+fR++
         hgdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WLiJRSZDtXGLiZVllQRQGLaR655Hs+rHimHW4Xh2uCI=;
        b=FBR/2CaPrXhmq9P51AbentHQ9x4NHVn9BjID8isM5fC8p/wMTvc9SrugSq+LNpuix+
         GsfsHXh8hv0oJ2mQlRlcmeceo0OoFEz2wxHuaRjpBAP4/pZ6VMoEvSyqkIoiADN2HPWY
         fkxsnpdrwq6tm8VYNIcGR5YYN9zh3mfBYIjTyGkgrAQYgMMfqCsx3patu+Ex18KptJsD
         QrbRptSF23mlIVeMiGZabeNlLXvD/g+NRJs8e0Ox6gKOA+yJxY8SvT+R1jnpPTBcrD8h
         nQ/3rTaKgNfUeZRx0OKHZgpNagozCvBOUcmYKcfRzNP4cNsLY0JZimMkiFQZD1eaT95m
         YD0A==
X-Gm-Message-State: AOAM532ToAF9e3kwtchocE149CRHQZdNmEVyDJghAlETL+ZwY1SVobwu
        M5YcYOIeDrqfRUXysnm/ov/mQYP5H5C4+i7FuljNsw==
X-Google-Smtp-Source: ABdhPJyZNnTkCSdkuybuVtY86i/+/FnnBOksLKyQaq2Hm6+ySGMeObsSQN7r9P2EcPwqKSnG9hQemoVBYyH9q3cbPz8=
X-Received: by 2002:a92:7914:: with SMTP id u20mr12435436ilc.203.1604357979556;
 Mon, 02 Nov 2020 14:59:39 -0800 (PST)
MIME-Version: 1.0
References: <20201027233733.1484855-1-bgardon@google.com> <20201027233733.1484855-4-bgardon@google.com>
 <20201102212715.GD20600@xz-x1>
In-Reply-To: <20201102212715.GD20600@xz-x1>
From:   Ben Gardon <bgardon@google.com>
Date:   Mon, 2 Nov 2020 14:59:28 -0800
Message-ID: <CANgfPd8BDze5yeiyzdmdOV_p3as-KyqeoQuCT5UEAaUx6OMJ=A@mail.gmail.com>
Subject: Re: [PATCH 3/5] KVM: selftests: Simplify demand_paging_test with timespec_diff_now
To:     Peter Xu <peterx@redhat.com>
Cc:     LKML <linux-kernel@vger.kernel.org>, kvm <kvm@vger.kernel.org>,
        linux-kselftest@vger.kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Andrew Jones <drjones@redhat.com>,
        Peter Shier <pshier@google.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Thomas Huth <thuth@redhat.com>,
        Peter Feiner <pfeiner@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Mon, Nov 2, 2020 at 1:27 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Tue, Oct 27, 2020 at 04:37:31PM -0700, Ben Gardon wrote:
> > Add a helper function to get the current time and return the time since
> > a given start time. Use that function to simplify the timekeeping in the
> > demand paging test.
>
> Nit: timespec_diff_now() sounds less charming than timespec_elapsed() to
> me... "diff_now" is longer, and it also does not show positive/negative of the
> results (which in this case should always be end-start). "elapsed" should
> always mean something positive.

That's a great suggestion and much clearer. I'll make that change in v2.

>
> With/Without the change above:
>
> Reviewed-by: Peter Xu <peterx@redhat.com>
>
> --
> Peter Xu
>
