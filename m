Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 721BDEE49B6
	for <linux-kselftest@archiver.kernel.org>; Wed, 23 Aug 2023 14:33:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236478AbjHWOd2 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 23 Aug 2023 10:33:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236475AbjHWOd2 (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 23 Aug 2023 10:33:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF759E75
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Aug 2023 07:33:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 613736590E
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Aug 2023 14:33:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36C37C433C7;
        Wed, 23 Aug 2023 14:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1692801200;
        bh=qQx11LfSno6jM75+HJPDx8bMm5EKXjZ7K5nn2tjb6gU=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=FKrwQ1nu+YsxuBdgJu0Q9Jdp5xoKG7e9nXwTTa9ZOKQde75WmpCo0kRjafEt33gZ3
         LNUvbJxev0mXnohc796u6O91+8IWkyRJBePpaVoBfkFJ5zHg9lkbkxjoAON7NxnCHj
         aKoGk2DnPQFKMmfzL4zjZRrTB01zm+Y6GDk3J5ko=
Date:   Wed, 23 Aug 2023 16:33:17 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Wolfram Sang <wsa@kernel.org>, linux-kselftest@vger.kernel.org
Subject: Re: Repo for tests which fail currently?
Message-ID: <2023082335-retail-gallows-1fdc@gregkh>
References: <ZOXxSA1UKBkU/ou4@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZOXxSA1UKBkU/ou4@ninjato>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Wed, Aug 23, 2023 at 01:45:12PM +0200, Wolfram Sang wrote:
> Hi all,
> 
> for my talk at EOSS23 about object life-time issues[1], I created a
> loose set of tests checking some longstanding problems in the Linux
> Kernel. I would like to improve these tests. Now, I wonder where I could
> contribute them to because their scope seems different to me. They are
> not for regression testing because I don't have a fix for most of them.
> Some fixes mean rewriting private data allocations for a whole subsystem
> and drivers. The tests are rather meant for documenting known problems
> and checking if someone started working on it. But it seems that
> kselftest (and LTP also?) only accept tests which do not fail by
> default. The question is now, is there another test collection project I
> could contribute these tests to? I'd be very happy for pointers, I
> started looking around but to no avail...

Why not just add them to the kernel tree, with ksft_test_result_skip()
being the result for now while they still fail, and then when the kernel
code is fixed up, change that back to the correct
ksft_test_result_error() call instead?

"SKIP" is a good thing to take advantage of here.

thanks,

greg k-h
