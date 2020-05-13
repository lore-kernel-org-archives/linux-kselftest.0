Return-Path: <SRS0=r1F3=63=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EACBC433E0
	for <linux-kselftest@archiver.kernel.org>; Wed, 13 May 2020 19:57:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 275C8206A5
	for <linux-kselftest@archiver.kernel.org>; Wed, 13 May 2020 19:57:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390613AbgEMT5M (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 13 May 2020 15:57:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2390158AbgEMT5K (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 13 May 2020 15:57:10 -0400
Received: from shards.monkeyblade.net (shards.monkeyblade.net [IPv6:2620:137:e000::1:9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A782DC061A0C
        for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2020 12:57:10 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id EAE45127F6DC8;
        Wed, 13 May 2020 12:57:09 -0700 (PDT)
Date:   Wed, 13 May 2020 12:57:09 -0700 (PDT)
Message-Id: <20200513.125709.1574810036252704473.davem@davemloft.net>
To:     vladbu@mellanox.com
Cc:     linux-kselftest@vger.kernel.org, shuah@kernel.org,
        xiyou.wangcong@gmail.com, jhs@mojatatu.com, dcaratti@redhat.com,
        marcelo.leitner@gmail.com
Subject: Re: [PATCH net-next] selftests: fix flower parent qdisc
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200513175746.7294-1-vladbu@mellanox.com>
References: <20200513175746.7294-1-vladbu@mellanox.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Wed, 13 May 2020 12:57:10 -0700 (PDT)
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org


You put "net-next" in your subject line but failed to include
netdev in the CC: list.
