From: rostedt@goodmis.org (Steven Rostedt)
Date: Fri, 23 Mar 2018 12:36:47 -0400
Subject: [PATCH v6 05/21] tracing: probeevent: Cleanup print argument
 functions
In-Reply-To: <152129047203.31874.3188700720826213215.stgit@devbox>
References: <152129024033.31874.15800253385376959274.stgit@devbox>
 <152129047203.31874.3188700720826213215.stgit@devbox>
Message-ID: <20180323123647.4398ae48@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180323163647.5xdLEKZUFOP8aHHzrTfoJBGAs8e7xrXRYEWBdn9vhGA@z>

On Sat, 17 Mar 2018 21:41:12 +0900
Masami Hiramatsu <mhiramat@kernel.org> wrote:

> Current print argument functions prints the argument
> name too. It is not good for printing out multiple
> values for one argument. This change it to just print
> out the value.

Hi Masami,

This is a confusing change log, as I have no idea what this patch does.
Can you add a "before" and "after" of what you mean. Some examples of
what it currently does to show why it looks bad, and then an example of
what it looks like after the patch.

Thanks!

-- Steve


> 
> Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
