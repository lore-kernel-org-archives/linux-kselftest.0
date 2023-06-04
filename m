Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6344C77B73
	for <linux-kselftest@archiver.kernel.org>; Sun,  4 Jun 2023 10:47:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbjFDKrc (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sun, 4 Jun 2023 06:47:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229799AbjFDKrb (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Sun, 4 Jun 2023 06:47:31 -0400
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A20E7B4;
        Sun,  4 Jun 2023 03:47:29 -0700 (PDT)
Received: (from willy@localhost)
        by mail.home.local (8.17.1/8.17.1/Submit) id 354AlLOV001713;
        Sun, 4 Jun 2023 12:47:21 +0200
Date:   Sun, 4 Jun 2023 12:47:21 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@t-8ch.de>
Cc:     Zhangjin Wu <falcon@tinylab.org>, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] selftests/nolibc: test_fork: fix up duplicated print
Message-ID: <ZHxrueqyt0g+zvMx@1wt.eu>
References: <61bdfe7bacebdef8aa9195f6f2550a5b0d33aab3.1685426545.git.falcon@tinylab.org>
 <20230602024157.11151-1-falcon@tinylab.org>
 <a72cac9d-609f-4c4f-a7f8-7c6b89837e0a@t-8ch.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a72cac9d-609f-4c4f-a7f8-7c6b89837e0a@t-8ch.de>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Fri, Jun 02, 2023 at 12:20:34PM +0200, Thomas Weiﬂschuh wrote:
> On 2023-06-02 10:41:57+0800, Zhangjin Wu wrote:
> > Hi, Willy
> > 
> > What about this one for 2023xxxx-nolibc-rv32+stkp6?
> > 
> > @Thomas, welcome your Reviewed-by If it is ok for you ;-)
> 
> Indeed, good catch!
> 
> Reviewed-by: Thomas Weiﬂschuh <linux@weissschuh.net>

And queued, thanks to you both!
Willy
