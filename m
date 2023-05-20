Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D56CC77B7A
	for <linux-kselftest@archiver.kernel.org>; Sat, 20 May 2023 08:46:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231358AbjETIq6 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sat, 20 May 2023 04:46:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231395AbjETIq4 (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Sat, 20 May 2023 04:46:56 -0400
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8C659E62;
        Sat, 20 May 2023 01:46:51 -0700 (PDT)
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 34K8kjSg027220;
        Sat, 20 May 2023 10:46:45 +0200
Date:   Sat, 20 May 2023 10:46:45 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc:     Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] tools/nolibc/unistd: add syscall()
Message-ID: <20230520084645.GB27206@1wt.eu>
References: <20230517-nolibc-syscall-v1-1-af232d84577a@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230517-nolibc-syscall-v1-1-af232d84577a@weissschuh.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Sat, May 20, 2023 at 09:58:57AM +0200, Thomas Weißschuh wrote:
> syscall() is used by "normal" libcs to allow users to directly call
> syscalls.
> By having the same syntax inside nolibc users can more easily write code
> that works with different libcs.
> 
> The macro logic is adapted from systemtaps STAP_PROBEV() macro that is
> released in the public domain / CC0.

Well done! And now queued, thanks Thomas!
Willy
