Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12CE9C77B7A
	for <linux-kselftest@archiver.kernel.org>; Fri,  2 Jun 2023 19:44:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234860AbjFBTou (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 2 Jun 2023 15:44:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236115AbjFBTot (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 2 Jun 2023 15:44:49 -0400
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 67B8B123;
        Fri,  2 Jun 2023 12:44:48 -0700 (PDT)
Received: (from willy@localhost)
        by mail.home.local (8.17.1/8.17.1/Submit) id 352JiC25026412;
        Fri, 2 Jun 2023 21:44:12 +0200
Date:   Fri, 2 Jun 2023 21:44:12 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Zhangjin Wu <falcon@tinylab.org>
Cc:     arnd@arndb.de, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
        thomas@t-8ch.de
Subject: Re: [PATCH v2 00/13] nolibc: add part2 of support for rv32
Message-ID: <ZHpGjMHPzyRcEX3C@1wt.eu>
References: <cover.1685387484.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1685387484.git.falcon@tinylab.org>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Hi Zhangjin,

On Tue, May 30, 2023 at 03:45:23AM +0800, Zhangjin Wu wrote:
> Hi, all
> 
> Thanks very much for your review suggestions of the v1 series [1], we
> just sent out the generic part1 [2], and here is the part2 of the whole
> v2 revision.
(...)

Just to let you know, I'm now done with my release and will slowly try
to catch up with all your series!

Stay tuned!
Willy
