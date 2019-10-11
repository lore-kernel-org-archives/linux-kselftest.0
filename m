Return-Path: <SRS0=3l34=YE=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F73C47404
	for <linux-kselftest@archiver.kernel.org>; Fri, 11 Oct 2019 18:02:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5080921A4A
	for <linux-kselftest@archiver.kernel.org>; Fri, 11 Oct 2019 18:02:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728689AbfJKSCx (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 11 Oct 2019 14:02:53 -0400
Received: from mx2.suse.de ([195.135.220.15]:45304 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728374AbfJKSCw (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 11 Oct 2019 14:02:52 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 3A5B6B357;
        Fri, 11 Oct 2019 18:02:51 +0000 (UTC)
Date:   Fri, 11 Oct 2019 20:02:48 +0200
From:   Cyril Hrubis <chrubis@suse.cz>
To:     shuah <shuah@kernel.org>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        automated-testing@yoctoproject.org, kernelci@groups.io,
        George Kennedy <george.kennedy@oracle.com>,
        Dhaval Giani <dhaval.giani@gmail.com>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Jan Setje-Eilers <jan.setjeeilers@oracle.com>,
        syzkaller <syzkaller@googlegroups.com>
Subject: Re: [Automated-testing] syzkaller reproducers
Message-ID: <20191011180248.GA24089@rei.lan>
References: <CACT4Y+YjOxmOzzPt_xaYE44QNZfq9haNfbnVBrTnPXe7zuSEfA@mail.gmail.com>
 <CACT4Y+ZaN900gwx=PHS10hrKofZib7HA7JFxE_DkwChyttYW+A@mail.gmail.com>
 <876a2abe-41ab-5819-4ae8-ad26186d0d1c@kernel.org>
 <226099bc-9763-3a73-e26a-b292f601494c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <226099bc-9763-3a73-e26a-b292f601494c@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Hi!
> Playing with the git getting ready to host it on kernel.org git repo.
> Build worked fine and I can't get the run.sh to work.
> 
> I expected it to run what is in
> 
> syzkaller-repros/bin
> 
> It doesn't seem to do that. Looks like it wants to build. Here is what
> I see. What am I doing wrong?

You are suposed to run the run.sh script in the bin directory.

> I did a build which worked. There are some errors due to sys/cdefs.h
> missing.

That is because you are missing 32bit gcc and devel libs.

-- 
Cyril Hrubis
chrubis@suse.cz
