Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D76F9C48BDF
	for <linux-kselftest@archiver.kernel.org>; Thu, 10 Jun 2021 21:36:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4587613E3
	for <linux-kselftest@archiver.kernel.org>; Thu, 10 Jun 2021 21:36:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230169AbhFJVik (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 10 Jun 2021 17:38:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:52722 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229963AbhFJVik (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 10 Jun 2021 17:38:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D848613BC;
        Thu, 10 Jun 2021 21:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
        s=korg; t=1623361003;
        bh=VPiu+326ifHN2/G78z3abv1E9z0XDI+YU7cXCgX001Q=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=VuQ4lsOMievNZQblMuF0nRy9ZL10RTvi5MN7JyQqypvCKdIEhj9jf4aH4rvz6Xs8M
         q51Vhve8nJpZKKqc9WbMyvx6wBKIfjjrFVeb/0uMGjZzlI1XntsrnsCRcNM4BVc98D
         0hPqj3icMwnfR4HtixvMv5jV+xf/XQ1OHcfD8wm8=
Date:   Thu, 10 Jun 2021 14:36:42 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Bernd Edlinger <bernd.edlinger@hotmail.de>
Cc:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>,
        Kees Cook <keescook@chromium.org>,
        Andy Lutomirski <luto@amacapital.net>,
        Will Drewry <wad@chromium.org>, Shuah Khan <shuah@kernel.org>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Michal Hocko <mhocko@suse.com>,
        Serge Hallyn <serge@hallyn.com>,
        James Morris <jamorris@linux.microsoft.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Charles Haithcock <chaithco@redhat.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Yafang Shao <laoar.shao@gmail.com>,
        Helge Deller <deller@gmx.de>,
        YiFei Zhu <yifeifz2@illinois.edu>,
        Adrian Reber <areber@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jens Axboe <axboe@kernel.dk>,
        "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-kselftest@vger.kernel.org
Subject: Re: [PATCHv8] exec: Fix dead-lock in de_thread with ptrace_attach
Message-Id: <20210610143642.e4535dbdc0db0b1bd3ee5367@linux-foundation.org>
In-Reply-To: <AM8PR10MB4708AFBD838138A84CE89EF8E4359@AM8PR10MB4708.EURPRD10.PROD.OUTLOOK.COM>
References: <AM8PR10MB4708AFBD838138A84CE89EF8E4359@AM8PR10MB4708.EURPRD10.PROD.OUTLOOK.COM>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Thu, 10 Jun 2021 09:31:42 +0200 Bernd Edlinger <bernd.edlinger@hotmail.de> wrote:

> This introduces signal->unsafe_execve_in_progress,
> which is used to fix the case when at least one of the
> sibling threads is traced, and therefore the trace
> process may dead-lock in ptrace_attach, but de_thread
> will need to wait for the tracer to continue execution.

Deadlocks are serious.  Is this exploitable by unprivileged userspace?

> Signed-off-by: Bernd Edlinger <bernd.edlinger@hotmail.de>

Was a -stable backport considered?


