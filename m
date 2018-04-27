From: rostedt@goodmis.org (Steven Rostedt)
Date: Thu, 26 Apr 2018 21:42:53 -0400
Subject: [PATCH v7 00/16] tracing: probeevent: Improve fetcharg features
In-Reply-To: <152465856498.26224.16969986455942749517.stgit@devbox>
References: <152465856498.26224.16969986455942749517.stgit@devbox>
Message-ID: <20180426214253.64ec8762@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180427014253.OLVPaQwuipvEUhlch9fXJ9EK0BakJUfewXdQBh-BvNE@z>

On Wed, 25 Apr 2018 21:16:06 +0900
Masami Hiramatsu <mhiramat@kernel.org> wrote:

> Hi,
> 
> This is the 7th version of the fetch-arg improvement series.
> This includes variable changes on fetcharg framework like,
> 
> - Add fetcharg testcases (syntax, argN, symbol, string and array)
>   and probepoint testcase.
> - Rewrite fetcharg framework with fetch_insn, switch-case based
>   instead of function pointer.
> - Add "symbol" type support, which shows symbol+offset instead of
>   address value.
> - Add "$argN" fetcharg, which fetches function parameters.
>   (currently only for x86-64)
> - Add array type support (including string arrary :) ) ,
>   which enables to get fixed length array from probe-events.
> - Add array type support for perf-probe, so that user can
>   dump partial array entries.
> 

Masami,

Thanks for posting this! I'm currently trying to get a set of patches
in the -rc releases, and this would be for 4.18 (or 5.0?), I'll try to
get some time next week to look at this.

Thanks!

-- Steve
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
