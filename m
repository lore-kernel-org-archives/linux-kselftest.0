Return-Path: <SRS0=KgYl=5T=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DBC6C43331
	for <linux-kselftest@archiver.kernel.org>; Fri,  3 Apr 2020 13:22:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 272042078C
	for <linux-kselftest@archiver.kernel.org>; Fri,  3 Apr 2020 13:22:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728254AbgDCNWG (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 3 Apr 2020 09:22:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:60320 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728143AbgDCNWG (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 3 Apr 2020 09:22:06 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D90DE20721;
        Fri,  3 Apr 2020 13:22:05 +0000 (UTC)
Date:   Fri, 3 Apr 2020 09:22:04 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Xiao Yang <yangx.jy@cn.fujitsu.com>
Cc:     <mingo@redhat.com>, <shuah@kernel.org>, <ice_yangxiao@163.com>,
        <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH] selftests/ftrace: Always enable ftrace_enabled for
 ftrace testcases
Message-ID: <20200403092204.79bb6dc7@gandalf.local.home>
In-Reply-To: <20200403082929.1869-1-yangx.jy@cn.fujitsu.com>
References: <20200403082929.1869-1-yangx.jy@cn.fujitsu.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Fri, 3 Apr 2020 16:29:29 +0800
Xiao Yang <yangx.jy@cn.fujitsu.com> wrote:

> A lot of ftrace testcases get failure if ftrace_enabled is disabled by default
> because ftrace_enabled is a big on/off switch for the whole function tracer.

Why would it be disabled by default? Anyway, I'm thinking failure is the
right answer if ftrace_enable is off.

-- Steve
