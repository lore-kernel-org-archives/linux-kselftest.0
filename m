From: mhiramat@kernel.org (Masami Hiramatsu)
Date: Mon, 26 Mar 2018 13:17:33 +0900
Subject: [PATCH v6 05/21] tracing: probeevent: Cleanup print argument
 functions
In-Reply-To: <20180323123647.4398ae48@gandalf.local.home>
References: <152129024033.31874.15800253385376959274.stgit@devbox>
 <152129047203.31874.3188700720826213215.stgit@devbox>
 <20180323123647.4398ae48@gandalf.local.home>
Message-ID: <20180326131733.ac156981d82c4a38dae307f4@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180326041733.EDPa6jiag1rLr8571j1iT0pb__1x9I8fPGRGiY25pjg@z>

On Fri, 23 Mar 2018 12:36:47 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Sat, 17 Mar 2018 21:41:12 +0900
> Masami Hiramatsu <mhiramat@kernel.org> wrote:
> 
> > Current print argument functions prints the argument
> > name too. It is not good for printing out multiple
> > values for one argument. This change it to just print
> > out the value.
> 
> Hi Masami,
> 
> This is a confusing change log, as I have no idea what this patch does.
> Can you add a "before" and "after" of what you mean. Some examples of
> what it currently does to show why it looks bad, and then an example of
> what it looks like after the patch.

OK, this is actually just a cleanup patch. No functional difference between 
"before" and "after". For more flexible argument, like array type, we need
to decouple with argument name and its value printing. Is below more clear
to you?


Cleanup argument-printing functions to decouple it into name-printing and
value-printing, so that it can support more flexible argument expression,
like array type.

Thanks,



> 
> Thanks!
> 
> -- Steve
> 
> 
> > 
> > Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
> > 


-- 
Masami Hiramatsu <mhiramat at kernel.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
