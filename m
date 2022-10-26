Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7ED4C433FE
	for <linux-kselftest@archiver.kernel.org>; Wed, 26 Oct 2022 20:41:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233986AbiJZUln (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 26 Oct 2022 16:41:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233536AbiJZUlm (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 26 Oct 2022 16:41:42 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 970539E0FD;
        Wed, 26 Oct 2022 13:41:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4BED3B82406;
        Wed, 26 Oct 2022 20:41:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00EB5C433D6;
        Wed, 26 Oct 2022 20:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666816899;
        bh=OiDy0J7N0gG89OlO1sTJTMLRoyLa6wUK63NLTwswiYo=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=e2kiXrsKyVJ5VAY16xGSFHU3ojplVtxkLebWApev69ep5EIkci5ZtMxB4LkSNWOJu
         07hDBr4TNy4z24dEjYLJbWewgl/eyoGkdugUTeqjB6hsdDEMEnxntitMU+4XGQsiEd
         hjIzX6wOfYZvEZawOKLEIQ/fXkkW1j4TNCGMg0Zjxwk3CvfWDOS+gC1F022hZbE7jL
         fyKkLj3wHzDjZ1iDZX09Ze15t/MCIxF0elo68WCFnaT3Pp4BGgT6FhX9FHle3vjAIW
         uxdTlLJ35GYavwhjmIIkp3BSDUk+k64Lk7Jk5cXsXNbkM8inHxpZvW4aoyIQTH2A7F
         1qk+/xzP2d98Q==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id 9BC6B5C05F8; Wed, 26 Oct 2022 13:41:38 -0700 (PDT)
Date:   Wed, 26 Oct 2022 13:41:38 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Willy Tarreau <w@1wt.eu>
Cc:     linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/nolibc: always rebuild the sysroot when
 running a test
Message-ID: <20221026204138.GQ5600@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20221026054508.19634-1-w@1wt.eu>
 <20221026164825.GN5600@paulmck-ThinkPad-P17-Gen-1>
 <20221026195902.GB24197@1wt.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221026195902.GB24197@1wt.eu>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Wed, Oct 26, 2022 at 09:59:02PM +0200, Willy Tarreau wrote:
> On Wed, Oct 26, 2022 at 09:48:25AM -0700, Paul E. McKenney wrote:
> > On Wed, Oct 26, 2022 at 07:45:08AM +0200, Willy Tarreau wrote:
> > Works like a champ with reverting and unreverting c9388e0c1c6c
> > ("tools/nolibc/string: Fix memcmp() implementation"), thank you!!!
> 
> Thanks for the feedback, and glad it suits your needs as well. I
> hope that it will progressively encourage a few of us to enhance
> it with more tests.

Here is hoping!  ;-)

> > I have queued this.  I expect to push this into the next merge window,
> > thus avoiding the need to document the need for "make clean" in my
> > pull request.  ;-)
> 
> Stupid question, is it really worth postponing it, considering that
> we've just introduced this series right now ? I mean, if the current
> usage is confusing, it's probably better to propose the fix before
> 6.1-final ? It's not a new feature here but rather a fix for a recently
> introduced one, thus I think it could be part of the next fix series.
> Rest assured I don't want to put a mess into your patch workflow, just
> asking :-)

You lost me here.

My intent is to push these nolicb patches into the upcoming v6.2
merge window:

2318a710bffbd tools/nolibc: Fix missing strlen() definition and infinite loop with gcc-12
6937b8de8f1c3 tools/nolibc/string: Fix memcmp() implementation
e1bbfe393c900 selftests/nolibc: Add 7 tests for memcmp()
3f2c1c45a3a9a selftests/nolibc: Always rebuild the sysroot when running a test

I didn't see the problem until I queued the third patch (e1bbfe393c900),
and it is still in -rcu, not in v6.1.

What am I missing here?

							Thanx, Paul
