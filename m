Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7AADC4742C
	for <linux-kselftest@archiver.kernel.org>; Fri, 13 Nov 2020 22:41:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A8CE122255
	for <linux-kselftest@archiver.kernel.org>; Fri, 13 Nov 2020 22:41:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ClGu4V82"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726088AbgKMWlD (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 13 Nov 2020 17:41:03 -0500
Received: from mail.zx2c4.com ([192.95.5.64]:32947 "EHLO mail.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726039AbgKMWlC (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 13 Nov 2020 17:41:02 -0500
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0204c346;
        Fri, 13 Nov 2020 22:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
        :references:in-reply-to:from:date:message-id:subject:to:cc
        :content-type; s=mail; bh=OJIQBsQN9YtZ59U8T292O32PRFg=; b=ClGu4V
        82JgxtH+96ZdKad/6V8fFydSOranrAO/P2pWzperym6X5Ebk09NlEza1LxNfH5et
        zSccOxVP0OWl1XKN6LjyktNrQqgOmz79PV0rBqrCRHfHkISyxy6J9rBi4CzLwEYB
        auVwVjk5oBrsbChH66Ihd9JI0kI+S//aLV+1eDLhCM1+jw0sA0+jxMkYX9/WqR/Q
        t0gXQTzeFlBeHMl+ym6jLjEhVQXOZ77bdlIrvMa5J8eo/ZO1lm4cu4VE+2pm0YPp
        TcXnEex7CyoC0JOC+YhYRsFysplWsMT876W9gq4chBHaFzQQQP4yP1l7oF6u5pU1
        /EYRvyWvU8XGohzQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7c6e6c09 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Fri, 13 Nov 2020 22:37:37 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id s8so10102244yba.13;
        Fri, 13 Nov 2020 14:40:59 -0800 (PST)
X-Gm-Message-State: AOAM530sYcXF4hFhZX5+N8pBV1umx3jxtC4wkcAwfRLMcTI6H0adZC/O
        uRKYpP+UbcbKxslDffgLPs7NalYpdCGeTTCUqIc=
X-Google-Smtp-Source: ABdhPJy4GHaEV+sM67RNRkegMlf+s/XVygZw2mSKbBF4g5x7T20uFd0ua6JodgxMauamrd8pWTxcgPSeuv0shuxsYaQ=
X-Received: by 2002:a25:6f83:: with SMTP id k125mr6338937ybc.123.1605307258734;
 Fri, 13 Nov 2020 14:40:58 -0800 (PST)
MIME-Version: 1.0
References: <20201110035318.423757-1-sashal@kernel.org> <20201110035318.423757-26-sashal@kernel.org>
 <CAHmME9pPbitUYU4CcLaikQLOMjj-=b16nVXgp6+jh1At4Y=vNg@mail.gmail.com> <X6rMJe+bF+/ZyyTz@kroah.com>
In-Reply-To: <X6rMJe+bF+/ZyyTz@kroah.com>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Fri, 13 Nov 2020 23:40:47 +0100
X-Gmail-Original-Message-ID: <CAHmME9r0Oar0Js5hhO=5U9JTqS1P04VkYjSq1cqXW19ZOvgh+g@mail.gmail.com>
Message-ID: <CAHmME9r0Oar0Js5hhO=5U9JTqS1P04VkYjSq1cqXW19ZOvgh+g@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 5.9 26/55] wireguard: selftests: check that
 route_me_harder packets use the right sk
To:     Greg KH <greg@kroah.com>
Cc:     Sasha Levin <sashal@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        stable <stable@vger.kernel.org>,
        Chen Minqiang <ptpt52@gmail.com>,
        Pablo Neira Ayuso <pablo@netfilter.org>,
        WireGuard mailing list <wireguard@lists.zx2c4.com>,
        Netdev <netdev@vger.kernel.org>, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Tue, Nov 10, 2020 at 6:20 PM Greg KH <greg@kroah.com> wrote:
>
> On Tue, Nov 10, 2020 at 01:29:41PM +0100, Jason A. Donenfeld wrote:
> > Note that this requires
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=46d6c5ae953cc0be38efd0e469284df7c4328cf8
> > And that commit should be backported to every kernel ever, since the
> > bug is so old.
>
> Sasha queued this up to 5.4.y and 5.9.y, but it looks like it doesn't
> easily apply to older kernels.  If you think that it's needed beyond
> that, I'll gladly take backported patches.

Backport to older kernels coming your way shortly.
