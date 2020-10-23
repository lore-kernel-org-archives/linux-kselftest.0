Return-Path: <SRS0=IbkC=D6=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 814A3C388F9
	for <linux-kselftest@archiver.kernel.org>; Fri, 23 Oct 2020 10:48:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1FB0B21D43
	for <linux-kselftest@archiver.kernel.org>; Fri, 23 Oct 2020 10:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603450132;
	bh=okFwPrydoGiONohT9lhoiD249vghLTsgSLgVFfhvqdw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=cGUcECdLQJekgtg4w4CGRl6LZx9+m7LNyrMa+Q9GHLGamDvbMsnipdqmGtbyqfk8e
	 6y4hbbFgiNHJKxgp1UBb8tr6W/26sbgLkYioW2+8e6RhoEtYeQMh8VKt63DAfEB9T4
	 6RE/OVCGURlO13vApLP4l8bYU1Ilfr3gaFtSMWGI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S372245AbgJWKsv (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 23 Oct 2020 06:48:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:53970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S372087AbgJWKsv (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 23 Oct 2020 06:48:51 -0400
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F177C20FC3;
        Fri, 23 Oct 2020 10:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603450130;
        bh=okFwPrydoGiONohT9lhoiD249vghLTsgSLgVFfhvqdw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=PWEwhD3KmYmoVjdVcYVNEyftKayA1VHvZzgCdhHYg9Jg0fZOiVuJ6K7op/M+CqBqj
         TuReAosClu7IbTTQih/G7NsVojYlxaoWXlnv1armCZylAYf5bASUpmajhBu5GuWDR+
         LfQtrN1Fi02Sj8hjnMP3ua8BGzo91nYoooXm6igE=
Date:   Fri, 23 Oct 2020 19:48:46 +0900
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Alexander Gordeev <agordeev@linux.ibm.com>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc:     linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH] selftests/ftrace: remove _do_fork() leftovers
Message-Id: <20201023194846.7f159d06260cfa2456132aa3@kernel.org>
In-Reply-To: <1603443123-17457-1-git-send-email-agordeev@linux.ibm.com>
References: <1603443123-17457-1-git-send-email-agordeev@linux.ibm.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Fri, 23 Oct 2020 10:52:03 +0200
Alexander Gordeev <agordeev@linux.ibm.com> wrote:

> The _do_fork() is not completely removed from selftests
> in favor of the kernel_clone().
> 

Looks good to me.

Acked-by: Masami Hiramatsu <mhiramat@kernel.org>

Thank you!

> Fixes: eea11285dab3 ("tracing: switch to kernel_clone()")
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Christian Brauner <christian.brauner@ubuntu.com>
> Cc: Masami Hiramatsu <mhiramat@kernel.org>
> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
> ---
>  tools/testing/selftests/ftrace/test.d/ftrace/func-filter-notrace-pid.tc | 2 +-
>  tools/testing/selftests/ftrace/test.d/ftrace/func-filter-pid.tc         | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/ftrace/test.d/ftrace/func-filter-notrace-pid.tc b/tools/testing/selftests/ftrace/test.d/ftrace/func-filter-notrace-pid.tc
> index acb17ce..0ddb948 100644
> --- a/tools/testing/selftests/ftrace/test.d/ftrace/func-filter-notrace-pid.tc
> +++ b/tools/testing/selftests/ftrace/test.d/ftrace/func-filter-notrace-pid.tc
> @@ -39,7 +39,7 @@ do_test() {
>      disable_tracing
>  
>      echo do_execve* > set_ftrace_filter
> -    echo *do_fork >> set_ftrace_filter
> +    echo kernel_clone >> set_ftrace_filter
>  
>      echo $PID > set_ftrace_notrace_pid
>      echo function > current_tracer
> diff --git a/tools/testing/selftests/ftrace/test.d/ftrace/func-filter-pid.tc b/tools/testing/selftests/ftrace/test.d/ftrace/func-filter-pid.tc
> index 9f0a968..71319b3 100644
> --- a/tools/testing/selftests/ftrace/test.d/ftrace/func-filter-pid.tc
> +++ b/tools/testing/selftests/ftrace/test.d/ftrace/func-filter-pid.tc
> @@ -39,7 +39,7 @@ do_test() {
>      disable_tracing
>  
>      echo do_execve* > set_ftrace_filter
> -    echo *do_fork >> set_ftrace_filter
> +    echo kernel_clone >> set_ftrace_filter
>  
>      echo $PID > set_ftrace_pid
>      echo function > current_tracer
> -- 
> 1.8.3.1
> 


-- 
Masami Hiramatsu <mhiramat@kernel.org>
