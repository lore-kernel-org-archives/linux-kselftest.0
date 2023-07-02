Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 807B3EB64DA
	for <linux-kselftest@archiver.kernel.org>; Sun,  2 Jul 2023 19:34:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbjGBTeN (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sun, 2 Jul 2023 15:34:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbjGBTeN (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Sun, 2 Jul 2023 15:34:13 -0400
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 46100C2;
        Sun,  2 Jul 2023 12:34:12 -0700 (PDT)
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 362JY118017547;
        Sun, 2 Jul 2023 21:34:01 +0200
Date:   Sun, 2 Jul 2023 21:34:01 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Zhangjin Wu <falcon@tinylab.org>
Cc:     thomas@t-8ch.de, arnd@arndb.de, david.laight@aculab.com,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 00/14] tools/nolibc: add a new syscall helper
Message-ID: <20230702193401.GL16233@1wt.eu>
References: <cover.1687187451.git.falcon@tinylab.org>
 <cover.1687957589.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1687957589.git.falcon@tinylab.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Wed, Jun 28, 2023 at 09:07:16PM +0800, Zhangjin Wu wrote:
> Willy, Thomas
> 
> This is the revision of our 'tools/nolibc: add a new syscall helper'
> series [1].
(...)

just to let you know that I've read them all and am fine with the ones
I didn't comment on.

Thanks Zhangjin!
Willy
