Return-Path: <SRS0=M4Vu=CW=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B6CC433E2
	for <linux-kselftest@archiver.kernel.org>; Sun, 13 Sep 2020 12:34:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1CEEF217BA
	for <linux-kselftest@archiver.kernel.org>; Sun, 13 Sep 2020 12:34:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="f71/w2KM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725929AbgIMMe1 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sun, 13 Sep 2020 08:34:27 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:59793 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725919AbgIMMe0 (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Sun, 13 Sep 2020 08:34:26 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bq87h2WpSz9sTN;
        Sun, 13 Sep 2020 22:34:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1600000464;
        bh=MfrKU0LhAJpDwzrWV63jdtuWYas2csr/wfuuxiK5Gw0=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=f71/w2KMbdN7vc5XZb2yLbQY3kQwJGMCerD/F+niDvnXCM0ZMxJX/LkTH2OH2d4wW
         Sq96Bg/09pigytVTjYyHs9jXXjP7U0j82eG8x+FN3DAK5EUsckcRG4hSiDM47+qhAd
         nzAuy76OAacSy8toXBcAI2P512N8BKnhZ14eBQ7nkZwzN5LQ3M4XnB/766W5dX/Xeo
         E+ACqndSGhHk6Qt9xP4lpzUwEJeAQkIGfC6ZEx3KV7zisjHXbn9CIzt3oHOxywEQhe
         MQlicW4dUscnvYmKUDMKYeq/jpSxhM7t72mCyTizImPnZqLZ84Tlp7eJ8o2LkyYsbL
         6RfguuLtElsBg==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
        Kees Cook <keescook@chromium.org>
Cc:     linux-kselftest@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>,
        Shuah Khan <shuah@kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] selftests/seccomp: fix ptrace tests on powerpc
In-Reply-To: <20200911180637.GI4002@mussarela>
References: <20200630164739.1268222-1-cascardo@canonical.com> <202009081505.D9FE52510B@keescook> <20200911180637.GI4002@mussarela>
Date:   Sun, 13 Sep 2020 22:34:23 +1000
Message-ID: <875z8hrh2o.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Thadeu Lima de Souza Cascardo <cascardo@canonical.com> writes:
> On Tue, Sep 08, 2020 at 04:18:17PM -0700, Kees Cook wrote:
>> On Tue, Jun 30, 2020 at 01:47:39PM -0300, Thadeu Lima de Souza Cascardo wrote:
...
>> > @@ -1809,10 +1818,15 @@ void tracer_ptrace(struct __test_metadata *_metadata, pid_t tracee,
>> >  	EXPECT_EQ(entry ? PTRACE_EVENTMSG_SYSCALL_ENTRY
>> >  			: PTRACE_EVENTMSG_SYSCALL_EXIT, msg);
>> >  
>> > -	if (!entry)
>> > +	if (!entry && !syscall_nr)
>> >  		return;
>> >  
>> > -	nr = get_syscall(_metadata, tracee);
>> > +	if (entry)
>> > +		nr = get_syscall(_metadata, tracee);
>> > +	else
>> > +		nr = *syscall_nr;
>> 
>> This is weird? Shouldn't get_syscall() be modified to do the right thing
>> here instead of depending on the extra arg?
>> 
>
> R0 might be clobered. Same documentation mentions it as volatile. So, during
> syscall exit, we can't tell for sure that R0 will have the original syscall
> number. So, we need to grab it during syscall enter, save it somewhere and
> reuse it. I used the test context/args for that.

The user r0 (in regs->gpr[0]) shouldn't be clobbered.

But it is modified if the tracer skips the syscall, by setting the
syscall number to -1. Or if the tracer changes the syscall number.

So if you need the original syscall number in the exit path then I think
you do need to save it at entry.

cheers
