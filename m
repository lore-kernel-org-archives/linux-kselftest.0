Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2159EC3DA7D
	for <linux-kselftest@archiver.kernel.org>; Tue,  3 Jan 2023 14:28:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233466AbjACO2x (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 3 Jan 2023 09:28:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233507AbjACO2W (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 3 Jan 2023 09:28:22 -0500
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [IPv6:2a0a:51c0:0:237:300::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 490B2204;
        Tue,  3 Jan 2023 06:28:20 -0800 (PST)
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
        (envelope-from <fw@strlen.de>)
        id 1pCiH3-0004Wl-PL; Tue, 03 Jan 2023 15:28:17 +0100
Date:   Tue, 3 Jan 2023 15:28:17 +0100
From:   Florian Westphal <fw@strlen.de>
To:     Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>
Cc:     linux-kselftest@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Shuah Khan <shuah@kernel.org>, Florian Westphal <fw@strlen.de>,
        Jakub Kicinski <kuba@kernel.org>
Subject: Re: PROBLEM: Hang in selftests/netfilter/nft_trans_stress.sh
Message-ID: <20230103142817.GA19686@breakpoint.cc>
References: <281b5a5e-4b56-ef6f-9896-49b364924662@alu.unizg.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <281b5a5e-4b56-ef6f-9896-49b364924662@alu.unizg.hr>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr> wrote:
> Hi all,
> 
> The `make kselftest` hangs in netfilter/nft_trans_stress.sh test when testing 6.2.0-rc2
> (attempted 2 times, waiting half an hour at least):

This script completes in 49 seconds for me.

> # selftests: netfilter: nft_trans_stress.sh
> # PASS: nft add/delete test returned 0
> # PASS: nft reload test returned 0
> 
> The test script seems to be stuck in ping flood:

No, it gets stuck in the sub-test after 'PASS: nft reload test returned 0'

Can you send me the output of 'bash -x nft_trans_stress.sh'?
It should tell which command/program isn't making progress.
