Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2593EB64DC
	for <linux-kselftest@archiver.kernel.org>; Sun,  9 Jul 2023 10:03:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230163AbjGIKDC (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sun, 9 Jul 2023 06:03:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjGIKDC (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Sun, 9 Jul 2023 06:03:02 -0400
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 68B1FDF;
        Sun,  9 Jul 2023 03:03:01 -0700 (PDT)
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 369A2rk8021750;
        Sun, 9 Jul 2023 12:02:53 +0200
Date:   Sun, 9 Jul 2023 12:02:53 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Zhangjin Wu <falcon@tinylab.org>
Cc:     arnd@arndb.de, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, thomas@t-8ch.de
Subject: Re: [PATCH v4 00/18] selftests/nolibc: allow run with minimal kernel
 config
Message-ID: <20230709100253.GK9321@1wt.eu>
References: <cover.1688750763.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1688750763.git.falcon@tinylab.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Zhangjin,

for your convenience, I've queued your pending series and Thomas's patches
in the following order here: 20230709-nolibc-ser2-tom-syscall-configv4

  series2, thomas' chmod_net and ioperm patches, your new syscall series,
  and your tiny config version 4 series.

Thomas and Zhangjin, do not hesitate to let me know if I missed anything.
The two series I left aside for now are still just under discussion
(output reformating and reorganisation of the arch include files).

We're getting closer to having something done now!

Thanks!
Willy
