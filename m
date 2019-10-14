Return-Path: <SRS0=cFNE=YH=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E181AC4CECE
	for <linux-kselftest@archiver.kernel.org>; Mon, 14 Oct 2019 18:01:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BA74D21925
	for <linux-kselftest@archiver.kernel.org>; Mon, 14 Oct 2019 18:01:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I1x1Z8t/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731404AbfJNSBj (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 14 Oct 2019 14:01:39 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:36627 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731184AbfJNSBj (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 14 Oct 2019 14:01:39 -0400
Received: by mail-ot1-f66.google.com with SMTP id 67so14558859oto.3
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Oct 2019 11:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xyCSAk4ZobdR/xeJ0/E5vnN7i5VLU1sZ6lMD0865OQ8=;
        b=I1x1Z8t/J1yynjUcQTaYcMAGlN47njD35U9306oaZGwet7E/ZBWTyw79fMty3Sa/RK
         jNwz8QvsXEa/3cyF5QkHhhHLve/QinyFaA7Agy9aj1p+AnR+z3j8k6lrs03DUL228MFg
         l8iUcJTUJpDvM//PJdKIhYQodgVX5aUDpuo940IIeoCN64AO9s5qtLgop0i1e3e7Fyul
         v4NeG2eK6T1TFr3P9I8Pgf8GUBhq3m9BYkcppXzd4WbWMSo17r2krD+y2MbewOxpBPnG
         62TsJgRjY2rTFg93oghC2gS0WVUXZaNMWTxA7mikuTmITqWLzKgrZSohb1WMiZZ5qzmJ
         QR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xyCSAk4ZobdR/xeJ0/E5vnN7i5VLU1sZ6lMD0865OQ8=;
        b=NArN1XAE1Pxh6lWgFX99ahXyFyQwqba2be7Dy2S+V+adL+5EEJuZNdIDvPQKEwlkqt
         +8YioUU6b/dmZE1U8M7EjFsY8f0O2EhD9WfEvYNW1Vdq/AX5g0JfFjHiOoWJs7UuR1KD
         LTZTfnVN6g6XFIjH10jAGnbl9lWhgioAkcr9r4812znmPAXZuV4xdW8soaSP9QjhTDqN
         0MOWlylpfc1ZSHusJ1QzRQ8DK5sCafOUCzQ6zzQT1UQFZq+1WOakNJbYOTvMDZ9yPgPT
         9UFWEkXVYmYkHsn8tYCIEp+0Y+bMxNjZMPynty8M+WPX05nPuZ1YKnKrMn8bcBdezXIP
         QfrQ==
X-Gm-Message-State: APjAAAVK8sEYp8naObtKBnwNobln6XrcoVR+J3O/iFROUzxRs4GkrqFx
        DPP4/AUBmo/MjPDX0VuqewNQ1Kw+auMPdIAY6rhXBg==
X-Google-Smtp-Source: APXvYqzVsft4JN8B/GJGRX09Dvv1lrQER8w/xEy+w3Z8782YyTQT2VRjA+RR6H607O8jyRrySTOiA2k4j9ly9K9xLKs=
X-Received: by 2002:a9d:6e92:: with SMTP id a18mr24524365otr.313.1571076097842;
 Mon, 14 Oct 2019 11:01:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190919222421.27408-1-almasrymina@google.com>
 <3c73d2b7-f8d0-16bf-b0f0-86673c3e9ce3@oracle.com> <CAHS8izN1Q7XH84Srem_McB+Jz67-fu6KPCMQjzbnPDTPzgwC2A@mail.gmail.com>
 <CAHS8izNhZc8zsdf=eXU5L_ouKwk9s00S-Q21P=QA+vAF3BsXcg@mail.gmail.com> <f042aba0-7e0f-80c5-1285-6b6fd2b3cbac@oracle.com>
In-Reply-To: <f042aba0-7e0f-80c5-1285-6b6fd2b3cbac@oracle.com>
From:   Mina Almasry <almasrymina@google.com>
Date:   Mon, 14 Oct 2019 11:01:26 -0700
Message-ID: <CAHS8izOkcsrCVSu-O2oBVB6NErJmUp+=HC8dDFxZ8fUZt=dgBg@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] hugetlb_cgroup: Add hugetlb_cgroup reservation limits
To:     Mike Kravetz <mike.kravetz@oracle.com>
Cc:     Aneesh Kumar <aneesh.kumar@linux.vnet.ibm.com>,
        shuah <shuah@kernel.org>, David Rientjes <rientjes@google.com>,
        Shakeel Butt <shakeelb@google.com>,
        Greg Thelen <gthelen@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        khalid.aziz@oracle.com, open list <linux-kernel@vger.kernel.org>,
        linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
        cgroups@vger.kernel.org,
        =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Mon, Oct 14, 2019 at 10:33 AM Mike Kravetz <mike.kravetz@oracle.com> wrote:
>
> On 10/11/19 1:41 PM, Mina Almasry wrote:
> > On Fri, Oct 11, 2019 at 12:10 PM Mina Almasry <almasrymina@google.com> wrote:
> >>
> >> On Mon, Sep 23, 2019 at 10:47 AM Mike Kravetz <mike.kravetz@oracle.com> wrote:
> >>>
> >>> On 9/19/19 3:24 PM, Mina Almasry wrote:
> >>
> >> Mike, note your suggestion above to check if the page hugetlb_cgroup
> >> is null doesn't work if we want to keep the current counter working
> >> the same: the page will always have a hugetlb_cgroup that points that
> >> contains the old counter. Any ideas how to apply this new counter
> >> behavior to a private NORESERVE mappings? Is there maybe a flag I can
> >> set on the pages at allocation time that I can read on free time to
> >> know whether to uncharge the hugetlb_cgroup or not?
> >
> > Reading the code and asking around a bit, it seems the pointer to the
> > hugetlb_cgroup is in page[2].private. Is it reasonable to use
> > page[3].private to store the hugetlb_cgroup to uncharge for the new
> > counter and increment HUGETLB_CGROUP_MIN_ORDER to 3? I think that
> > would solve my problem. When allocating a private NORESERVE page, set
> > page[3].private to the hugetlb_cgroup to uncharge, then on
> > free_huge_page, check page[3].private, if it is non-NULL, uncharge the
> > new counter on it.
>
> Sorry for not responding sooner.  This approach should work, and it looks like
> you have a v6 of the series.  I'll take a look.
>

Great! Thanks! That's the approach I went with in v6.

> --
> Mike Kravetz
