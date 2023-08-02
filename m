Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4195EC001DE
	for <linux-kselftest@archiver.kernel.org>; Wed,  2 Aug 2023 07:51:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233170AbjHBHvz (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 2 Aug 2023 03:51:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232864AbjHBHvZ (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 2 Aug 2023 03:51:25 -0400
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 163DE1FCF;
        Wed,  2 Aug 2023 00:48:54 -0700 (PDT)
Received: (from willy@localhost)
        by mail.home.local (8.17.1/8.17.1/Submit) id 3727mg0M017568;
        Wed, 2 Aug 2023 09:48:42 +0200
Date:   Wed, 2 Aug 2023 09:48:42 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Zhangjin Wu <falcon@tinylab.org>
Cc:     thomas@t-8ch.de, arnd@arndb.de, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux@weissschuh.net
Subject: Re: [PATCH v4 08/12] selftests/nolibc: add test support for ppc
Message-ID: <ZMoKWheH5mrCXogy@1wt.eu>
References: <0833846b9fc9e2260f9aa2c732a12d9dfa329286.1690916314.git.falcon@tinylab.org>
 <20230802052150.138283-1-falcon@tinylab.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802052150.138283-1-falcon@tinylab.org>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Hi Zhangjin,

On Wed, Aug 02, 2023 at 01:21:50PM +0800, Zhangjin Wu wrote:
> Hi, Willy, Thomas
> 
> Yuan is helping me to test this series and the tinyconfig series with
> the latest compilers.
> 
> His first test found this ppc support failed with stackprotector when
> using a newer compiler (I used an older compiler without stackprotector
> for ppc), I'm debugging it, so, please ignore this revision too, of
> course, if time allows, welcome to take a look at the other patches.
> 
> His other tests are trying to find out the exact poweroff support
> options for every architecture one by one, let's fill this gap ...

Thanks for notifying us. I strongly suggest that you leave ppc32 aside
for now, until the rest is completely validated and merged. It turns
out that your willingness to work around some of the oddities met on
this one have resulted in a lot of drift away from the "keep it simple"
principle and significantly delayed the possibilities to integrate the
rest of your work. It would be much saner to only focus on ppc64/ppc64le
and figure later how to make ppc32 work (or decide not to support it if
it's not worth the effort in the end).

Regards,
willy
