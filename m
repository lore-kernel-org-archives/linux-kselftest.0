Return-Path: <SRS0=A1cL=5J=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30B60C43331
	for <linux-kselftest@archiver.kernel.org>; Tue, 24 Mar 2020 17:43:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0AEBC2074D
	for <linux-kselftest@archiver.kernel.org>; Tue, 24 Mar 2020 17:43:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KrRtb/WC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727314AbgCXRnF (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 24 Mar 2020 13:43:05 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40734 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727273AbgCXRnF (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 24 Mar 2020 13:43:05 -0400
Received: by mail-wr1-f66.google.com with SMTP id u10so2248133wro.7
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2020 10:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LbJGyxS21FEV88+GhI3Kztu2LQlp+tbZk/mv+EeL9vg=;
        b=KrRtb/WCwVOE3Yofiqo25n2GrqCh9MYlYF+pH7YKrj6IqWq9dYdz6dXwjih4odd78a
         03Mp+nNPPKHkjraIZLyxvYmulBEiCkfqFBo/ySBKTnxpoKWZx5mojmPJYUg1BPl+upOK
         XpS43pmp5U8ZBf6hNQBfTpPm4+Ads9Qo7RkUz/vs0GHdau/oF8LkV3MaDvhBZrJiAzHK
         PM48JjJL1kEeBbcJkBe5uz6v+PrkxiSso1YxTD7aDlq9rSb50qbx7v0AZNYbHykeBNld
         SDSdXFgIddm6rL48/Nmn/u0riy9RzfJ0RJUZ0sbMnm2o2dnkXswDiFePoF91JbsBaTn5
         VnaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LbJGyxS21FEV88+GhI3Kztu2LQlp+tbZk/mv+EeL9vg=;
        b=VqahdvTJ4Gs9DFtbUNTXT2Qbgei4xwI7QW8NNFfHlUAFGATJFAk+FCBXquTBD3Ae+Z
         5OH9+rx4QuWsPxZn0o7ukDfE9XdT2fGmRQwuWwM34GJxfnM8ETFpB99KzoYecquLswW3
         q42gAFFUBnLvK0aqzX42+Y6CwJUo2YtvANW4q7+As0patKzT+HZc+K5EAVKRbiZgcnKz
         kaIINKRGgvICK8D/q8h3j1jpth6bes/XTN6rw1oO63snrzQZajGwH2j0/w7VB7BMnTqV
         M+kvxE7YQ1sQShucmenZA6gZYh6z8HeG2FOllijggjZU/TYTEhvaX/ubUX4ANW2XH9Kr
         XPLA==
X-Gm-Message-State: ANhLgQ39S8eKNMyYkNITqGcT9vU31eqlRexMaVO0APAqMeSN2KLJdM7Y
        AqUf9bdyprJz1DzaIwoBTS69UEj1Wue2sG/6klK7FA==
X-Google-Smtp-Source: ADFU+vuY55b1i550qyCWvAJDdha/jsXGT7t7S/WR85g/XPJgq8NUulwDyx/KYGRHxtYprPYUQKbl+GKumofr6+Scims=
X-Received: by 2002:a5d:4ac8:: with SMTP id y8mr37687404wrs.272.1585071783098;
 Tue, 24 Mar 2020 10:43:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200319164227.87419-1-trishalfonso@google.com>
 <20200319164227.87419-2-trishalfonso@google.com> <alpine.LRH.2.21.2003241635230.30637@localhost>
In-Reply-To: <alpine.LRH.2.21.2003241635230.30637@localhost>
From:   Patricia Alfonso <trishalfonso@google.com>
Date:   Tue, 24 Mar 2020 10:42:51 -0700
Message-ID: <CAKFsvULUx3qi_kMGJx69ndzCgq=m2xf4XWrYRYBCViud0P7qqA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/3] Add KUnit Struct to Current Task
To:     Alan Maguire <alan.maguire@oracle.com>
Cc:     David Gow <davidgow@google.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        kunit-dev@googlegroups.com,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Tue, Mar 24, 2020 at 9:40 AM Alan Maguire <alan.maguire@oracle.com> wrote:
>
>
> On Thu, 19 Mar 2020, Patricia Alfonso wrote:
>
> > In order to integrate debugging tools like KASAN into the KUnit
> > framework, add KUnit struct to the current task to keep track of the
> > current KUnit test.
> >
> > Signed-off-by: Patricia Alfonso <trishalfonso@google.com>
> > ---
> >  include/linux/sched.h | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/include/linux/sched.h b/include/linux/sched.h
> > index 04278493bf15..1fbfa0634776 100644
> > --- a/include/linux/sched.h
> > +++ b/include/linux/sched.h
> > @@ -1180,6 +1180,10 @@ struct task_struct {
> >       unsigned int                    kasan_depth;
> >  #endif
> >
> > +#if IS_BUILTIN(CONFIG_KUNIT)
>
> This patch set looks great! You might have noticed I
> refreshed the kunit resources stuff to incorporate
> feedback from Brendan, but I don't think any API changes
> were made that should have consequences for your code
> (I'm building with your patches on top to make sure).
> I'd suggest promoting from RFC to v3 on the next round
> unless anyone objects.
>
> As Dmitry suggested, the above could likely be changed to be
> "#ifdef CONFIG_KUNIT" as kunit can be built as a
> module also. More on this in patch 2..
>
I suppose this could be changed so that this can be used in possible
future scenarios, but for now, since built-in things can't rely on
modules, the KASAN integration relies on KUnit being built-in.

> > +     struct kunit                    *kunit_test;
> > +#endif /* IS_BUILTIN(CONFIG_KUNIT) */
> > +
> >  #ifdef CONFIG_FUNCTION_GRAPH_TRACER
> >       /* Index of current stored address in ret_stack: */
> >       int                             curr_ret_stack;
> > --
> > 2.25.1.696.g5e7596f4ac-goog
> >
> >

-- 
Best,
Patricia
