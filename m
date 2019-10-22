Return-Path: <SRS0=V/Vv=YP=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B417CA9EA0
	for <linux-kselftest@archiver.kernel.org>; Tue, 22 Oct 2019 09:33:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0C24A20679
	for <linux-kselftest@archiver.kernel.org>; Tue, 22 Oct 2019 09:33:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730619AbfJVJdd (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 22 Oct 2019 05:33:33 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:33774 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728182AbfJVJdd (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 22 Oct 2019 05:33:33 -0400
Received: from [213.220.153.21] (helo=wittgenstein)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <christian.brauner@ubuntu.com>)
        id 1iMqXk-0004g2-Iv; Tue, 22 Oct 2019 09:33:32 +0000
Date:   Tue, 22 Oct 2019 11:33:32 +0200
From:   Christian Brauner <christian.brauner@ubuntu.com>
To:     kernel-team@lists.ubuntu.com
Cc:     kernel test robot <rong.a.chen@intel.com>,
        linux-kselftest@vger.kernel.org, Tycho Andersen <tycho@tycho.ws>
Subject: Re: [PATCH 2/2][SRU][DISCO][EOAN] UBUNTU: SAUCE: seccomp: fix
 SECCOMP_USER_NOTIF_FLAG_CONTINUE test
Message-ID: <20191022093331.tqg4tuksxvz6kj7a@wittgenstein>
References: <20191022093210.26663-1-christian.brauner@ubuntu.com>
 <20191022093210.26663-3-christian.brauner@ubuntu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191022093210.26663-3-christian.brauner@ubuntu.com>
User-Agent: NeoMutt/20180716
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Ignore this, please I forgot to add --supress-cc=all.

Sorry for the noise!
Christian
