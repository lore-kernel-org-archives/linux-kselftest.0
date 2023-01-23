Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B368EC25B50
	for <linux-kselftest@archiver.kernel.org>; Mon, 23 Jan 2023 17:52:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232194AbjAWRwK (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 23 Jan 2023 12:52:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230128AbjAWRwJ (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 23 Jan 2023 12:52:09 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E280712078;
        Mon, 23 Jan 2023 09:52:08 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 884A660EA2;
        Mon, 23 Jan 2023 17:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E24CAC433D2;
        Mon, 23 Jan 2023 17:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674496328;
        bh=lRw+ACKdRGIp4Pmf5z8AONIl55+4MQVQLJVgA15h0/c=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=oBqcNhdR6mJh7m4Sd78XigmhpLQP/72V+b5+C5nYghsYLW6OELnTcFIazhIVFfsrZ
         bPaB1XEeGLJ093IXgrSSsxqMb0hSf5LZlIu8xrtDElsnnD78hyPEk8pFPhowDQWyOS
         jwn9YGPc3udSs+38EyfUUULxsS5M5iCLglqX57w3bBpxNp/bRTC/uDDBJZe00Lec1r
         6+jUtHhtn3/AUoqeY5czg+dlR9jMxsWEcrGHVBCfnYwhOxYO1DfKvvmKp2vZLf4ACQ
         LwBTQ8QucRq+kkLtF9Riz11+OfOXJZ4vxgtBf8+1lsMu+y86U0teg0y7M+bTJjmnhS
         cYk6ja+t2VreA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id 7FCD05C0510; Mon, 23 Jan 2023 09:52:07 -0800 (PST)
Date:   Mon, 23 Jan 2023 09:52:07 -0800
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Ammar Faizi <ammarfaizi2@gnuweeb.org>
Cc:     Willy Tarreau <w@1wt.eu>, linux-kernel@vger.kernel.org,
        Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 0/2] selftests/nolibc: small simplification of test
 development phase
Message-ID: <20230123175207.GW2948950@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20230121085320.11712-1-w@1wt.eu>
 <20230121200038.GG2948950@paulmck-ThinkPad-P17-Gen-1>
 <Y87FM1yyZy6iOXcj@biznet-home.integral.gnuweeb.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y87FM1yyZy6iOXcj@biznet-home.integral.gnuweeb.org>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Tue, Jan 24, 2023 at 12:34:43AM +0700, Ammar Faizi wrote:
> On Sat, Jan 21, 2023 at 12:00:38PM -0800, Paul E. McKenney wrote:
> > Nice, thank you!
> > 
> > I have these placed on top of the -rcu "dev" branch initially for further
> > review and testing.  If things go well over the next week or so, I will
> > set it up for the upcoming merge window.
> > 
> > One dependency is of course qemu-x86_64, so in the meantime I will figure
> > out where I get that from.  ;-)
> 
> Thank you all, I'll base my work on top of the -rcu "dev" branch.
> 
> Tested-by: Ammar Faizi <ammarfaizi2@gnuweeb.org>

I will apply this on my next rebase, thank you!

							Thanx, Paul
