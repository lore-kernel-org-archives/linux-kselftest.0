Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FFF4C7EE2C
	for <linux-kselftest@archiver.kernel.org>; Sun, 28 May 2023 07:53:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbjE1Hxk (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sun, 28 May 2023 03:53:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbjE1Hxb (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Sun, 28 May 2023 03:53:31 -0400
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7811F1BF;
        Sun, 28 May 2023 00:53:17 -0700 (PDT)
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 34S7qZL7001986;
        Sun, 28 May 2023 09:52:35 +0200
Date:   Sun, 28 May 2023 09:52:35 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@t-8ch.de>
Cc:     Zhangjin Wu <falcon@tinylab.org>, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
        palmer@dabbelt.com, paul.walmsley@sifive.com
Subject: Re: [PATCH 06/13] selftests/nolibc: allow specify a bios for qemu
Message-ID: <20230528075235.GD1956@1wt.eu>
References: <cover.1684949267.git.falcon@tinylab.org>
 <63bee74a7b3754a1b0e82bc57de52c18d2de003d.1684949268.git.falcon@tinylab.org>
 <2ab94136-d341-4a26-964e-6d6c32e66c9b@t-8ch.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2ab94136-d341-4a26-964e-6d6c32e66c9b@t-8ch.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Fri, May 26, 2023 at 09:00:02AM +0200, Thomas Weißschuh wrote:
> On 2023-05-25 01:52:29+0800, Zhangjin Wu wrote:
> > riscv qemu has a builtin bios (opensbi), but it may not match the latest
> > kernel and some old versions may hang during boot, let's allow user pass
> > a newer version to qemu via the -bios option.
> 
> Nitpick:
> 
> This seems very specific and hopefully only necessary temporarily.
> 
> Instead it could be changed to some generic mechanim like
> "QEMU_ARGS_EXTRA"?

FWIW I, too, think that QEMU_ARGS_EXTRA could be very convenient for
various test cases on any architecture (change number of CPUs, RAM
size, boot options etc).

Willy
