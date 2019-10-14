Return-Path: <SRS0=cFNE=YH=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,PDS_TONAME_EQ_TOLOCAL_SHORT,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8159C4CECE
	for <linux-kselftest@archiver.kernel.org>; Mon, 14 Oct 2019 08:54:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B3CEE207FF
	for <linux-kselftest@archiver.kernel.org>; Mon, 14 Oct 2019 08:54:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730443AbfJNIyR (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 14 Oct 2019 04:54:17 -0400
Received: from mx2.suse.de ([195.135.220.15]:50540 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729928AbfJNIyR (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 14 Oct 2019 04:54:17 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id B654BAF21;
        Mon, 14 Oct 2019 08:54:15 +0000 (UTC)
Date:   Mon, 14 Oct 2019 10:54:14 +0200
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
Message-ID: <20191014085414.GB31760@rei.lan>
References: <CACT4Y+YjOxmOzzPt_xaYE44QNZfq9haNfbnVBrTnPXe7zuSEfA@mail.gmail.com>
 <CACT4Y+ZaN900gwx=PHS10hrKofZib7HA7JFxE_DkwChyttYW+A@mail.gmail.com>
 <876a2abe-41ab-5819-4ae8-ad26186d0d1c@kernel.org>
 <226099bc-9763-3a73-e26a-b292f601494c@kernel.org>
 <20191011180248.GA24089@rei.lan>
 <b715f3d7-547f-9a43-dc41-2e46ec3bfd51@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b715f3d7-547f-9a43-dc41-2e46ec3bfd51@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Hi!
> > You are suposed to run the run.sh script in the bin directory.
> 
> Yeah that does work.
> 
> Would be helpful to have usage instructions instead of failing. :)

I do not think that these scripts are ever supposed to be the used in
production testing, you need much more than this to produce results
reliably. I would expect that they are supposed to be a form of very
minimal documentation.

-- 
Cyril Hrubis
chrubis@suse.cz
