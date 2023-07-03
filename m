Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFAADC001DD
	for <linux-kselftest@archiver.kernel.org>; Mon,  3 Jul 2023 19:54:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbjGCTyQ (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 3 Jul 2023 15:54:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbjGCTyP (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 3 Jul 2023 15:54:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB88BE69;
        Mon,  3 Jul 2023 12:54:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 781E661028;
        Mon,  3 Jul 2023 19:54:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC66CC433C7;
        Mon,  3 Jul 2023 19:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688414053;
        bh=d+AP8tXTYAIkm2zcr8fYSVXCshNoVuxy/EPjV+yy8jY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BZ/dMJMvi4Z8Ib4exUlof3FGwSd/FzMIeJidxKNlFaw2Q1vTS0pR/DTsqnubbnXvN
         ygc7URXQoGVXGPA3gA4uPowjsTGRo1qEOHagL06DA76HB0QHDr2G1E73w45Dbb6tI4
         GaCtzrfUnkKfmYlvyf0SsiCDpKxsoeM7RA92E9MWYQcnZUlb0jG0l695DffNoi7mcx
         6SeN81szRt3op0Rl4zPDvmtsqqxhQm+qetVduzulTQviV+pb9d7FZ8Jmt2XLb/ZfdD
         7x8bND01/LYMRaAgHCLkBOFFbUoGNVmZ937PSj+3o121t0+5IgDLgxRX2TSlrNlesZ
         xh9efM/+Hki0w==
From:   SeongJae Park <sj@kernel.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     SeongJae Park <sj@kernel.org>, stable@vger.kernel.org,
        sashal@kernel.org, David Gow <davidgow@google.com>,
        Daniel Latypov <dlatypov@google.com>,
        brendanhiggins@google.com, rmoar@google.com,
        linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kselftest@vger.kernel.org, skhan@linuxfoundation.org,
        johannes@sipsolutions.net
Subject: Re: [PATCH] kunit: tool: undo type subscripts for subprocess.Popen
Date:   Mon,  3 Jul 2023 19:54:11 +0000
Message-Id: <20230703195411.16567-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2023070322-retype-lanky-6f2d@gregkh>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Mon, 3 Jul 2023 21:44:53 +0200 Greg KH <gregkh@linuxfoundation.org> wrote:

> On Mon, Jul 03, 2023 at 07:27:04PM +0000, SeongJae Park wrote:
[...]
> > This patch is now in the mainline (e30f65c4b3d671115bf2a9d9ef142285387f2aff).
> > However, this fix is not in 6.4.y yet, so the original issue is reproducible on
> > 6.4.y.  Could you please add this to 6.4.y?  I confirmed the mainline commit
> > can cleanly applied on latest 6.1.y tree, and it fixes the issue.
> 
> As this was not specifically tagged with a "cc: stable..." marking, that
> is why it was not picked up automatically.

I understand that.  I thought this would be merged into the mainline before
v6.4 release, but I was wrong.

> Also, we do not normally add patches to any stable releases until it is in a
> released kernel from Linus (i.e. a -rc release), unless you have a specific
> reason for it to be merged earlier.
> 
> Should this be merged "now" into the stable trees and not wait for
> 6.5-rc1?

The problem is not urgent, so I can wait until 6.5-rc1.


Thanks,
SJ

> 
> thanks,
> 
> greg k-h
