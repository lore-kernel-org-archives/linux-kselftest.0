Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06056C761A6
	for <linux-kselftest@archiver.kernel.org>; Thu, 30 Mar 2023 13:02:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231367AbjC3NC2 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 30 Mar 2023 09:02:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231776AbjC3NCY (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 30 Mar 2023 09:02:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF566A257;
        Thu, 30 Mar 2023 06:02:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6EF476204D;
        Thu, 30 Mar 2023 13:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B441C433D2;
        Thu, 30 Mar 2023 13:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1680181337;
        bh=eL7jm5gd+5ZsgoTBIP9rc35Pml6ystEKTuwu1acD9w8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SK764DNW0QPN6Am7P9YMET1SQlVWaPgih1HQ+YikKxNE3yYTuoM+phZzNAvbo3uly
         xHIloHyehKt6gAZ7Zh+NIzdBMJ5mFPMTtdawz4JyYm5l+j/tyXfmT0OZeDQsy07OGD
         qSWlYJokXNw0apNW5BUv+JmJBP+/Zxbt1gE8PeU8=
Date:   Thu, 30 Mar 2023 15:02:15 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Rishabh Bhatnagar <risbhat@amazon.com>
Cc:     shaoyi@amazon.com, stable@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        shuah@kernel.org, davem@davemloft.net
Subject: Re: [PATCH 5.4] selftests: Fix the executable permissions for
 fib_tests.sh
Message-ID: <ZCWIV19s0ycA4jRX@kroah.com>
References: <20230330110147.32052-1-risbhat@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330110147.32052-1-risbhat@amazon.com>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Thu, Mar 30, 2023 at 11:01:47AM +0000, Rishabh Bhatnagar wrote:
> Commit 04a331c9dd66 reverted change 2537b637eac0 (ipv4: Fix
> incorrect route flushing when source address is deleted) that
> added the fib_tests.sh file back with wrong permissions.
> Fix that in this commit.
> 
> Signed-off-by: Rishabh Bhatnagar <risbhat@amazon.com>
> ---
>  tools/testing/selftests/net/fib_tests.sh | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  mode change 100644 => 100755 tools/testing/selftests/net/fib_tests.sh
> 
> diff --git a/tools/testing/selftests/net/fib_tests.sh b/tools/testing/selftests/net/fib_tests.sh
> old mode 100644
> new mode 100755
> -- 
> 2.39.2
> 

As my scripts mess this up all the time, let me just push out a new
5.4.y release with this change in it "manually" so that I don't screw it
up again...

thanks,

greg k-h
