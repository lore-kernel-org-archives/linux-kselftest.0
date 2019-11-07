Return-Path: <SRS0=Ov2l=Y7=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B739DFA372C
	for <linux-kselftest@archiver.kernel.org>; Thu,  7 Nov 2019 01:36:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8BB32218AE
	for <linux-kselftest@archiver.kernel.org>; Thu,  7 Nov 2019 01:36:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728415AbfKGBgJ (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 6 Nov 2019 20:36:09 -0500
Received: from shards.monkeyblade.net ([23.128.96.9]:59328 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728306AbfKGBgI (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 6 Nov 2019 20:36:08 -0500
Received: from localhost (unknown [IPv6:2601:601:9f00:1e2::d71])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 0F6E9150301AD;
        Wed,  6 Nov 2019 17:36:08 -0800 (PST)
Date:   Wed, 06 Nov 2019 17:36:07 -0800 (PST)
Message-Id: <20191106.173607.54986119128433453.davem@davemloft.net>
To:     fruggeri@arista.com
Cc:     dsahern@gmail.com, shuah@kernel.org, netdev@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v2] selftest: net: add some traceroute tests
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20191105224835.D134F95C0C6F@us180.sjc.aristanetworks.com>
References: <20191105224835.D134F95C0C6F@us180.sjc.aristanetworks.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Wed, 06 Nov 2019 17:36:08 -0800 (PST)
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

From: fruggeri@arista.com (Francesco Ruggeri)
Date: Tue, 05 Nov 2019 14:48:35 -0800

> Added the following traceroute tests.
> 
> IPV6:
> Verify that in this scenario
> 
>        ------------------------ N2
>         |                    |
>       ------              ------  N3  ----
>       | R1 |              | R2 |------|H2|
>       ------              ------      ----
>         |                    |
>        ------------------------ N1
>                  |
>                 ----
>                 |H1|
>                 ----
> 
> where H1's default route goes through R1 and R1's default route goes
> through R2 over N2, traceroute6 from H1 to H2 reports R2's address
> on N2 and not N1.
> 
> IPV4:
> Verify that traceroute from H1 to H2 shows 1.0.1.1 in this scenario
> 
>                    1.0.3.1/24
> ---- 1.0.1.3/24    1.0.1.1/24 ---- 1.0.2.1/24    1.0.2.4/24 ----
> |H1|--------------------------|R1|--------------------------|H2|
> ----            N1            ----            N2            ----
> 
> where net.ipv4.icmp_errors_use_inbound_ifaddr is set on R1 and
> 1.0.3.1/24 and 1.0.1.1/24 are respectively R1's primary and secondary
> address on N1.
> 
> v2: fixed some typos, and have bridge in R1 instead of R2 in IPV6 test.
> 
> Signed-off-by: Francesco Ruggeri <fruggeri@arista.com>

Applied, thank you.
