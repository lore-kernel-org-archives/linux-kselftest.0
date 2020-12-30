Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3AC0C433E0
	for <linux-kselftest@archiver.kernel.org>; Wed, 30 Dec 2020 12:59:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F5D222262
	for <linux-kselftest@archiver.kernel.org>; Wed, 30 Dec 2020 12:59:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbgL3M7U (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 30 Dec 2020 07:59:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726662AbgL3M7U (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 30 Dec 2020 07:59:20 -0500
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [IPv6:2a0a:51c0:0:12e:520::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCCC4C06179C;
        Wed, 30 Dec 2020 04:58:39 -0800 (PST)
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
        (envelope-from <fw@strlen.de>)
        id 1kub3m-0005X8-DR; Wed, 30 Dec 2020 13:58:38 +0100
Date:   Wed, 30 Dec 2020 13:58:38 +0100
From:   Florian Westphal <fw@strlen.de>
To:     Po-Hsu Lin <po-hsu.lin@canonical.com>
Cc:     netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
        shuah@kernel.org, steffen.klassert@secunet.com, fw@strlen.de
Subject: Re: [PATCH] selftests: xfrm: fix test return value override issue in
 xfrm_policy.sh
Message-ID: <20201230125838.GC30823@breakpoint.cc>
References: <20201230095204.21467-1-po-hsu.lin@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201230095204.21467-1-po-hsu.lin@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Po-Hsu Lin <po-hsu.lin@canonical.com> wrote:
> When running this xfrm_policy.sh test script, even with some cases
> marked as FAIL, the overall test result will still be PASS:
> 
> $ sudo ./xfrm_policy.sh
> PASS: policy before exception matches
> FAIL: expected ping to .254 to fail (exceptions)
> PASS: direct policy matches (exceptions)
> PASS: policy matches (exceptions)
> FAIL: expected ping to .254 to fail (exceptions and block policies)
> PASS: direct policy matches (exceptions and block policies)
> PASS: policy matches (exceptions and block policies)
> FAIL: expected ping to .254 to fail (exceptions and block policies after hresh changes)
> PASS: direct policy matches (exceptions and block policies after hresh changes)
> PASS: policy matches (exceptions and block policies after hresh changes)
> FAIL: expected ping to .254 to fail (exceptions and block policies after hthresh change in ns3)
> PASS: direct policy matches (exceptions and block policies after hthresh change in ns3)
> PASS: policy matches (exceptions and block policies after hthresh change in ns3)
> FAIL: expected ping to .254 to fail (exceptions and block policies after htresh change to normal)
> PASS: direct policy matches (exceptions and block policies after htresh change to normal)
> PASS: policy matches (exceptions and block policies after htresh change to normal)
> PASS: policies with repeated htresh change
> $ echo $?
> 0
> 
> This is because the $lret in check_xfrm() is not a local variable.

Acked-by: Florian Westphal <fw@strlen.de>
