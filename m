Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA399C433F5
	for <linux-kselftest@archiver.kernel.org>; Wed, 27 Oct 2021 03:14:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA6D16109E
	for <linux-kselftest@archiver.kernel.org>; Wed, 27 Oct 2021 03:14:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237861AbhJ0DQt (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 26 Oct 2021 23:16:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:43122 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237793AbhJ0DQs (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 26 Oct 2021 23:16:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6C40B6058D;
        Wed, 27 Oct 2021 03:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635304464;
        bh=ThmsX7usvNVCUGc6vRHvY2s821PYyElO4mQiqD8wrzU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=EUOzOwdfvn97rW1qcnes1+sFYWubQ4M7PV6nC5HDc/LDKp4blNQJU4m/LyC/uY8mr
         WynYYh86a2GO6J3lmfvh9OAQw1ambNYjoe9CJbJkwydWTvya978QnPKLTqVGjD2Hqz
         Qj77CL4/h9aFnEUQ8h0JwqKnIoPIQ/pfDuk+3QKU3t6x/Nwe4dI1fmidYqCFx81fIG
         b5VnIxpESJL+odRoacfxThD+6hlg9xfr3tn3rslhi6KH69YFLka34UFMydJH5hFxYh
         xTCPia1ip9H+z9QwBo8zk5UlRHRAhWF1YGF97YKCPTA9Kli+8fCCgfZ3wzhO6sWFyD
         l3LsXnijB544g==
Date:   Wed, 27 Oct 2021 12:14:20 +0900
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Kalesh Singh <kaleshsingh@google.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>, surenb@google.com,
        hridya@google.com, namhyung@kernel.org, kernel-team@android.com,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Tom Zanussi <zanussi@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 7/8] tracing/selftests: Add tests for hist trigger
 expression parsing
Message-Id: <20211027121420.03a09fca1efc414189bb40bb@kernel.org>
In-Reply-To: <CAC_TJvf8areGd1rQMbJV4r+J6JP2-DWXBLQwKRZEOzNWL_rqrQ@mail.gmail.com>
References: <20211025200852.3002369-1-kaleshsingh@google.com>
        <20211025200852.3002369-8-kaleshsingh@google.com>
        <20211026214311.583c728d90d41778c38201dd@kernel.org>
        <CAC_TJvfQQCyuSZqjzC0fuAah84uLgHJv5T+WtR8=9h5fN9nrLA@mail.gmail.com>
        <20211026174420.0056bde2@gandalf.local.home>
        <CAC_TJveMumb=BkGL53d_rS08uQ35fz1B7cM9jp8eKoCz0MUG_Q@mail.gmail.com>
        <20211026202020.026e7907@rorschach.local.home>
        <CAC_TJvf8areGd1rQMbJV4r+J6JP2-DWXBLQwKRZEOzNWL_rqrQ@mail.gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Hi Kalesh,

On Tue, 26 Oct 2021 18:15:34 -0700
Kalesh Singh <kaleshsingh@google.com> wrote:

> On Tue, Oct 26, 2021 at 5:20 PM Steven Rostedt <rostedt@goodmis.org> wrote:
> >
> > On Tue, 26 Oct 2021 16:36:03 -0700
> > Kalesh Singh <kaleshsingh@google.com> wrote:
> >
> > > On my setup I without any of the changes applied (config hist triggers enabled):
> > >
> > > ./ftracetests
> > >
> > > # of passed:  41
> > > # of failed:  40
> > > # of unresolved:  0
> > > # of untested:  0
> > > # of unsupported:  32
> > > # of xfailed:  0
> > > # of undefined(test bug):  0
> > >
> > > Do all the tests pass for you, before any of the changes in this
> > > series? Maybe some of the tests need updating?
> >
> > All my tests past, and I don't push any code if they fail.
> >
> > I'd like to understand why you have these failures. Are the test from
> > the kernel you are testing?
> 
> The results are from the kernel before I apply any of the patches. I
> am testing on an Android emulator (cuttlefish) with 5.15.0-rc6 kernel.
> The tests clearly work so it must be something on my end. I'll
> investigate and get back to you.

Interesting. There should be test logs under logs/ directory in the
ftracetest. Can you share the logs/*/ftracetest.log and your kernel kconfig?

Thank you,


-- 
Masami Hiramatsu <mhiramat@kernel.org>
