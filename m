Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A227AC77B7E
	for <linux-kselftest@archiver.kernel.org>; Sun, 28 May 2023 07:31:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbjE1Hbt (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sun, 28 May 2023 03:31:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjE1Hbs (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Sun, 28 May 2023 03:31:48 -0400
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AB14CC7;
        Sun, 28 May 2023 00:31:47 -0700 (PDT)
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 34S7VY2w001963;
        Sun, 28 May 2023 09:31:34 +0200
Date:   Sun, 28 May 2023 09:31:34 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc:     Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 0/2] tools/nolibc: avoid coredumps and speed up tests
Message-ID: <20230528073134.GA1956@1wt.eu>
References: <20230526-nolibc-test-no-dump-v1-0-62e724a96db2@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230526-nolibc-test-no-dump-v1-0-62e724a96db2@weissschuh.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Fri, May 26, 2023 at 08:30:34AM +0200, Thomas Weißschuh wrote:
> Small optimization to avoid coredump writing during the stack protector
> tests.
> Adds prctl() as prerequisite.
> 
> This series is based on nolibc/20230524-nolibc-rv32+stkp4

Looks good and now queued, thank you Thomas,
Willy
