Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B7BC64E7B
	for <linux-kselftest@archiver.kernel.org>; Tue,  1 Dec 2020 18:42:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB86821D42
	for <linux-kselftest@archiver.kernel.org>; Tue,  1 Dec 2020 18:42:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qRokkZ5K"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727914AbgLASmc (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 1 Dec 2020 13:42:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726814AbgLASmc (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 1 Dec 2020 13:42:32 -0500
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3315C0613CF
        for <linux-kselftest@vger.kernel.org>; Tue,  1 Dec 2020 10:41:51 -0800 (PST)
Received: by mail-io1-xd43.google.com with SMTP id p187so1945766iod.4
        for <linux-kselftest@vger.kernel.org>; Tue, 01 Dec 2020 10:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ifLMTCdzkypMnKPu3DENVsgsRmsClQAlvMw8Ok6iiAU=;
        b=qRokkZ5KuP39HZaO5JOt7KGeoqhmN85W00thoyigFbmg3j/o9ov2WHLCHd1WLQmWqo
         KKeaiO7UIqiUwDvuO5HXNiS3cvETsMZfMXqX4Haua2TkE4d4lU0Kg2ZgCH0fs3I6KRE/
         pL82YpuI/jwbxyF4rNjfGj6t2RCRsczDhCy5iS8/gc4/3eXjSvK8qboCduiazpZtl6CF
         aO1XTnuCm/80gy61ryXKi2834ZvkbWUHeM3vBy9AvOZAyNzu4ZaIvqTSJiz/SCSaQgsD
         99NloyqvvbrqdijkryKLwzI2VSJ9Vy2i0RQu/sJAC1yZ2ju0B7rrc6FLIkHsQplas3L+
         VsMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ifLMTCdzkypMnKPu3DENVsgsRmsClQAlvMw8Ok6iiAU=;
        b=PZGHZQkEoRLO1cY7B9uYW5F2mmvnhag5rY8EP2EXudi0khglURAPwGbwLyWqvdvmSE
         hYdQ/3wplCYJ0xG0J3lvYotYISqrB/3SCUzBfv6ubw8cQmIgXVOhq4/4yHZ5AJfE24/A
         iGGC0PL/lsWujnp/m3XG6L61H6EO1FB60xtW9gQJreuMk7DWhfkvsXqhDfVZGPGav5Bc
         PK0GS+jCKeDmM1BLZyIjTnBXgKu+WtjcOceQte98Mne5jHi5PYXxm2+6O7fUfgkItDxs
         0qcbobV9nY52T+Gs0/2fWQ9hixyEa9OhCA5RByFXAYdA28qJBVNQ1zXrXIKd0eP/nGrq
         hV+w==
X-Gm-Message-State: AOAM532ZelWzog0m0uyFKEAARJ5IwEtqWmD4vEkReboLLxuAWTDB/5b2
        6JvPDqVsub2yCiA0Zs2ePpHieFmjZTqFJhMdJNvBKA==
X-Google-Smtp-Source: ABdhPJyec76CXBVIfKYeX0dCaUek6qDX//GwRZuF5v3JWnkcINH2r7jRKEgj5uXOlI33emBdMLGV6QMf6Gl65aLke3M=
X-Received: by 2002:a05:6638:22bc:: with SMTP id z28mr3866376jas.62.1606848110912;
 Tue, 01 Dec 2020 10:41:50 -0800 (PST)
MIME-Version: 1.0
References: <20201130233242.78413-1-dlatypov@google.com> <20201130233242.78413-4-dlatypov@google.com>
 <CABVgOSnMAGcMH-Y0o_KhMbyNYb1y4Wx6SFZO2d3=XUjefvmuSg@mail.gmail.com>
In-Reply-To: <CABVgOSnMAGcMH-Y0o_KhMbyNYb1y4Wx6SFZO2d3=XUjefvmuSg@mail.gmail.com>
From:   Daniel Latypov <dlatypov@google.com>
Date:   Tue, 1 Dec 2020 10:41:39 -0800
Message-ID: <CAGS_qxr3PYi16tpQg8WcQBeDpD_j2ZwB91snjKOm6C=_ptTF=A@mail.gmail.com>
Subject: Re: [PATCH 4/5] kunit: tool: use `with open()` in unit test
To:     David Gow <davidgow@google.com>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Mon, Nov 30, 2020 at 11:33 PM David Gow <davidgow@google.com> wrote:
>
> On Tue, Dec 1, 2020 at 7:33 AM Daniel Latypov <dlatypov@google.com> wrote:
> >
> > The use of manual open() and .close() calls seems to be an attempt to
> > keep the contents in scope.
> > But Python doesn't restrict variables like that, so we can introduce new
> > variables inside of a `with` and use them outside.
> >
> > Do so to make the code more Pythonic.
> >
> > Signed-off-by: Daniel Latypov <dlatypov@google.com>
> > ---
> I'm fine with this, and it clearly works fine for me. Out of
> curiosity, though, is there any difference here other than it being
> more usual Python style?

Files aren't leaked if we error out due to some exception before we
call close().
And self.assertEqual() and friends raise exceptions on failure, so
we're toeing that line here.

But other than being more robust, it should be equivalent.

>
> We've struggled a bit in the past toeing a line between trying to
> follow "normal" Python style versus adapting it a bit to be more
> "kernel-y". Experience thus far has actually been that going out on
> our own has caused more problems than it solves, so I'm all for this
> change, but I do admit that my brain does understand the older code a
> touch more easily.

Ack. Python's lack of lexical scopes is a bit disconcerting.
But from a readability standpoint, it's a bit more self-evident than
having to write it would be, imo.
So I think following more standard Python style here outweighs the cost.

>
> In any case,
> Reviewed-by: David Gow <davidgow@google.com>
>
>
> -- David
