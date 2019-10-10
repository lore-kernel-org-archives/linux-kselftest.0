Return-Path: <SRS0=61gv=YD=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F533C10F14
	for <linux-kselftest@archiver.kernel.org>; Thu, 10 Oct 2019 14:27:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 673F620B7C
	for <linux-kselftest@archiver.kernel.org>; Thu, 10 Oct 2019 14:27:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726131AbfJJO1s (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 10 Oct 2019 10:27:48 -0400
Received: from mx2.suse.de ([195.135.220.15]:48286 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726007AbfJJO1r (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 10 Oct 2019 10:27:47 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 65690AC11;
        Thu, 10 Oct 2019 14:27:46 +0000 (UTC)
Date:   Thu, 10 Oct 2019 16:27:44 +0200
From:   Cyril Hrubis <chrubis@suse.cz>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Shuah Khan <shuah@kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        automated-testing@yoctoproject.org, kernelci@groups.io,
        syzkaller <syzkaller@googlegroups.com>
Subject: Re: [Automated-testing] syzkaller reproducers
Message-ID: <20191010142744.GA10083@rei.lan>
References: <CACT4Y+YjOxmOzzPt_xaYE44QNZfq9haNfbnVBrTnPXe7zuSEfA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACT4Y+YjOxmOzzPt_xaYE44QNZfq9haNfbnVBrTnPXe7zuSEfA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Hi!
> We discussed collecting and uploading all syzkaller reproducers
> somewhere. You wanted to see how they look. I've uploaded all current
> reproducers here:
> https://github.com/dvyukov/syzkaller-repros
> Minimalistic build/run scripts are included.

What is the reason behind statically linking the reproducers?

The difference between static and dynamic binary is a bit less than 4MB,
which gives difference of several gigabytes for the whole repo. This
amount of binary data would complicate and slow down any CI
significantly...

-- 
Cyril Hrubis
chrubis@suse.cz
