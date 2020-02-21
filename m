Return-Path: <SRS0=+zqf=4J=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA83C11D00
	for <linux-kselftest@archiver.kernel.org>; Fri, 21 Feb 2020 01:53:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 75F8A208E4
	for <linux-kselftest@archiver.kernel.org>; Fri, 21 Feb 2020 01:53:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fipejZ7K"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729301AbgBUBxF (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 20 Feb 2020 20:53:05 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:41807 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729045AbgBUBxF (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 20 Feb 2020 20:53:05 -0500
Received: by mail-oi1-f195.google.com with SMTP id i1so75837oie.8
        for <linux-kselftest@vger.kernel.org>; Thu, 20 Feb 2020 17:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ed/ULQux6UGHmXOZ5IaN1TKuoav4MaQaUXExci3Yy7w=;
        b=fipejZ7K5WnG6SXrZ80ASoZ5TGGWl3vqTWYavMHSfZT7FhkAJuDP3Gec4Y8Tkc3kIq
         k+A+MtU9VEay6hpyl0nPlsALIfsWzjSJvl34jvi5nKYHrF3Likd8E1NzpI54bCq0hD13
         uZ2cVBG3xy/XXl4Zj6WnwhXA0K0RV3imaPJCS2huh9A2C7yAQVs5+Y0/7u/qzd89Drzu
         JdE6BgUkerPnKyyMLGbh0RnHJb/kOTgPmRfue4kT4IQ6owDzY4mXgTqtjrrj8ctMhc1L
         zjuAstA0xMpKN0ZnxRlpECVKfTbLlWKwoMOOfZWYGzEw33Z7AbtQ6oMixuUnYRC6Zxye
         iQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ed/ULQux6UGHmXOZ5IaN1TKuoav4MaQaUXExci3Yy7w=;
        b=Jh5FVhHwfgBehXCtdMuaEuGoclrKWmYM5TUdpvKkaU5DpuXR+iKZPR0rj85pAVP1Xo
         CQjjC0tuP0N4S/sdZX47vbgDecwVl9Wrac1YBrO3v/e1eabgS+gcNHqGqYqvPLqC6PIz
         4HhvTAX1t0hcHDtlWW2QbZrweoNjzdVz7Rs0QOqbPHPvazit5UEx36bjbRE5wDeThrgp
         XH8jc0DNOn4zhalYgnuvTDjmwITTijmjk8YemYAScus3rS3ztlwV7bUT5vhyKQXle7an
         RKqwT3nZ4Kv37G7HeI0HOJkm6dqfZBuaaRGOPOjiyAnn6JFt1VBq5AlG6bGZ0b6P8yvl
         UWYw==
X-Gm-Message-State: APjAAAWbE6CBOXw1scy/5i0vyUStf13m3UeXHieJ0J7i4Uz1YzFpE6L2
        JPDCKpzulD60mEq9Y6iad/O5E54uC1TjaW3MDj16yQ==
X-Google-Smtp-Source: APXvYqzPP8CwfNhvNCN6ImhUwktGGsfq3wy3xd04wzn27NwLa10gpu4eB4YRS8qbHOtGI0P5++1xMs1VCaKfkK4w0TQ=
X-Received: by 2002:a54:4086:: with SMTP id i6mr61878oii.65.1582249983496;
 Thu, 20 Feb 2020 17:53:03 -0800 (PST)
MIME-Version: 1.0
References: <20200211213128.73302-1-almasrymina@google.com>
 <20200211151906.637d1703e4756066583b89da@linux-foundation.org>
 <CAHS8izPUFQWq3PzhhRzp7u11173_-cmRkNuQWEswS51Xz6ZM0Q@mail.gmail.com>
 <20200219130648.83e6810848774c6fd649c445@linux-foundation.org>
 <CAHS8izN_FJektipBwiLsCO8ysMTM7k=CR_k3OV7+_y0ZbrGw+A@mail.gmail.com>
 <20200220162813.aea8a14fe050473b73440323@linux-foundation.org> <0cdd654b-a1f6-fea2-e448-209fbbe14b5c@oracle.com>
In-Reply-To: <0cdd654b-a1f6-fea2-e448-209fbbe14b5c@oracle.com>
From:   Mina Almasry <almasrymina@google.com>
Date:   Thu, 20 Feb 2020 17:52:52 -0800
Message-ID: <CAHS8izPZPDB=nK9Sm3znXxegSSr8Qf4NU5MiDcBb8EAF53LPLg@mail.gmail.com>
Subject: Re: [PATCH v12 1/9] hugetlb_cgroup: Add hugetlb_cgroup reservation counter
To:     Mike Kravetz <mike.kravetz@oracle.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        shuah <shuah@kernel.org>, David Rientjes <rientjes@google.com>,
        Shakeel Butt <shakeelb@google.com>,
        Greg Thelen <gthelen@google.com>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>, linux-kselftest@vger.kernel.org,
        cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Thu, Feb 20, 2020 at 4:41 PM Mike Kravetz <mike.kravetz@oracle.com> wrote:
>
> On 2/20/20 4:28 PM, Andrew Morton wrote:
> > It all looks pretty good and I expect we can get everything into
> > 5.7-rc1, unless some issues pop up.
> >

Awesome! I'll be on the lookout for issues.

Folks that reviewed (and especially Mike), thank you so much for the
patient reviews!

> > It's unclear to me whether
> > http://lkml.kernel.org/r/CAHS8izOTipknnYaKz=FdzL-7yW-Z61ck1yPnYWixyMSJuTUYLQ@mail.gmail.com
> > was going to result in an update?
>
> Yes there was,
>
> https://lore.kernel.org/linux-mm/20200219233610.13808-1-almasrymina@google.com/
>
> BTW, I've been through the selftest code at a high level.  Not at the level
> of detail Shuah may provide.  I am just happy that Mina provided a relatively
> comprehensive test for this new functionality.  Will give it an ACK shortly.
> --
> Mike Kravetz
