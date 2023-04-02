Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 788F5C76196
	for <linux-kselftest@archiver.kernel.org>; Sun,  2 Apr 2023 18:29:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbjDBS3L (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sun, 2 Apr 2023 14:29:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjDBS3K (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Sun, 2 Apr 2023 14:29:10 -0400
Received: from 1wt.eu (wtarreau.pck.nerim.net [62.212.114.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5BEB5B45E;
        Sun,  2 Apr 2023 11:29:08 -0700 (PDT)
Received: (from willy@localhost)
        by mail.home.local (8.17.1/8.17.1/Submit) id 332IT1uM020816;
        Sun, 2 Apr 2023 20:29:01 +0200
Date:   Sun, 2 Apr 2023 20:29:01 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc:     Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 0/3] tools/nolibc: add testcases for vfprintf
Message-ID: <ZCnJbUsmwW6BC4B7@1wt.eu>
References: <20230328-nolibc-printf-test-v2-0-f72bdf210190@weissschuh.net>
 <ZCmwqcwxHIlODz2i@1wt.eu>
 <dd8547a7-d794-409e-baa2-b431b0196360@t-8ch.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dd8547a7-d794-409e-baa2-b431b0196360@t-8ch.de>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Sun, Apr 02, 2023 at 05:17:53PM +0000, Thomas Weißschuh wrote:
> Wouldn't it be nicer to implement fflush/fclose in nolibc?

Yes that was my point, I just didn't know whether you still had some
time left to assign to this or not, hence my question.

> I can send a v3 with that.

Its currently running tests here. It looks pretty good, I guess I'm
going to bless it.

Thanks!
Willy
