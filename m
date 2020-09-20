Return-Path: <SRS0=XBiW=C5=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23CA9C43465
	for <linux-kselftest@archiver.kernel.org>; Sun, 20 Sep 2020 23:54:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E55DE20727
	for <linux-kselftest@archiver.kernel.org>; Sun, 20 Sep 2020 23:54:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726221AbgITXye (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sun, 20 Sep 2020 19:54:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726156AbgITXye (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Sun, 20 Sep 2020 19:54:34 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 706A9C061755
        for <linux-kselftest@vger.kernel.org>; Sun, 20 Sep 2020 16:54:34 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: krisman)
        with ESMTPSA id 01CCB289AC9
From:   Gabriel Krisman Bertazi <krisman@collabora.com>
To:     shuah@kernel.org
Cc:     linux-kselftest@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH] selftests: Add missing gitignore entries
Organization: Collabora
References: <20200905053139.3769803-1-krisman@collabora.com>
Date:   Sun, 20 Sep 2020 19:54:29 -0400
In-Reply-To: <20200905053139.3769803-1-krisman@collabora.com> (Gabriel Krisman
        Bertazi's message of "Sat, 5 Sep 2020 01:31:39 -0400")
Message-ID: <87a6xkf1hm.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Gabriel Krisman Bertazi <krisman@collabora.com> writes:

> Prevent them from polluting git status after building selftests.
>
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>

Hi Shuah,

Friendly ping here.  Thoughts?

-- 
Gabriel Krisman Bertazi
