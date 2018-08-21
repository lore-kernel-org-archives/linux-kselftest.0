From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Tue, 21 Aug 2018 15:53:24 +0900
Subject: [PATCH v2 01/32] tracing: Allow gcov profiling on only ftrace
 subsystem
In-Reply-To: <20180820113349.4fefbe0e@gandalf.local.home>
References: <153443695002.23257.13628220023468200991.stgit@devbox>
 <153443697980.23257.9233992547183322108.stgit@devbox>
 <20180820113213.09497e0a@gandalf.local.home>
 <20180820113349.4fefbe0e@gandalf.local.home>
Message-ID: <20180821155324.1c99360e7edf1023b1659fa1@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180821065324.rxH_Lo-p-X_niYchcBDdmpMOOJej2Rzg1-zEu1FVTKA@z>

Hi Steve,

On Mon, 20 Aug 2018 11:33:49 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Mon, 20 Aug 2018 11:32:13 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
> > Other than that, it looks fine to me.
> 
> This patch also seems out of place for the series.

Yes, this one is the patch for ftrace, not ftracetest.

> Want to resend it
> separately, and I'll apply it?

OK, I'll fix "config" and resend it :)

Thank you,

-- 
Masami Hiramatsu <mhiramat at kernel.org>
