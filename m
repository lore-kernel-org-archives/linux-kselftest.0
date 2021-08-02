Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6AB6C4320A
	for <linux-kselftest@archiver.kernel.org>; Mon,  2 Aug 2021 12:39:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CCF4260FF2
	for <linux-kselftest@archiver.kernel.org>; Mon,  2 Aug 2021 12:39:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233622AbhHBMjX (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 2 Aug 2021 08:39:23 -0400
Received: from foss.arm.com ([217.140.110.172]:34434 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233700AbhHBMjX (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 2 Aug 2021 08:39:23 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79A1111D4;
        Mon,  2 Aug 2021 05:39:13 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 92BA73F70D;
        Mon,  2 Aug 2021 05:39:12 -0700 (PDT)
Date:   Mon, 2 Aug 2021 13:37:50 +0100
From:   Dave Martin <Dave.Martin@arm.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 3/4] kselftest/arm64: Add tests for SVE vector
 configuration
Message-ID: <20210802123749.GB25258@arm.com>
References: <20210729151518.46388-1-broonie@kernel.org>
 <20210729151518.46388-4-broonie@kernel.org>
 <20210729160642.GP1724@arm.com>
 <20210729173411.GT4670@sirena.org.uk>
 <20210802102517.GA25258@arm.com>
 <20210802113330.GD4668@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210802113330.GD4668@sirena.org.uk>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Mon, Aug 02, 2021 at 12:33:30PM +0100, Mark Brown wrote:
> On Mon, Aug 02, 2021 at 11:25:29AM +0100, Dave Martin wrote:
> 
> > That's a reasonable position, but thinking about it a bit more, there's
> > not really any loop at all here.
> > 
> > There definitely is an unwaited-for child and we don't pass WHONANG to
> > wait(), so it will either return the child pid, or fail.
> > 
> > Without WUNTRACED or similar, the child must terminate to wake up the
> > wait().
> 
> > So is this just a matter of
> 
> > 	pid = wait(&ret);
> > 	if (pid == -1) {
> > 		/* barf */
> > 	}
> > 	assert(pid == child);
> > 
> > 	if (!WIFEXITED(ret)) {
> > 		/* barf */
> > 	}
> > 
> > 	if (WEXITSTATUS(ret) != 0) {
> > 		/* barf */
> > 	}
> > 
> > 	/* parse child's stdout etc. */
> 
> That really doesn't seem like a good idea - it's just asking for
> fragility if a signal gets delivered to the parent process or something.
> Even if almost all the time there will only be one trip through the loop
> we should still have the loop there for those few cases where it
> triggers.

This concern only applies when the program actually registers signal
handlers.

wait() can't return for any other reason, and it mustn't, precisely
because historically software would have made this assumption.  This is
one reason why wait3() etc. are separate functions.

That aside though, can't we use popen(3)?

I tend to forget about popen because it is "boring" to use it, but it
looks like it fits this case quite well.  Then it would be libc's
problem how to fork and wait safely.

[...]

Cheers
---Dave
