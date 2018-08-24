From: rostedt@goodmis.org (Steven Rostedt)
Date: Fri, 24 Aug 2018 17:46:54 -0400
Subject: [PATCH v2 05/32] selftests/ftrace: More initialize features in
 initialize_ftrace
In-Reply-To: <20180824174601.581f499d@gandalf.local.home>
References: <153443695002.23257.13628220023468200991.stgit@devbox>
 <153443709338.23257.2179609309041817332.stgit@devbox>
 <20180824174601.581f499d@gandalf.local.home>
Message-ID: <20180824174654.07b68472@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180824214654.yDg604eNP5m8iOUzN1YaJ0nuOhs5i8ig_iNl4mL0ZLk@z>

On Fri, 24 Aug 2018 17:46:01 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Fri, 17 Aug 2018 01:31:33 +0900
> Masami Hiramatsu <mhiramat@kernel.org> wrote:
> 
> > Clear pid filter, synthetic_events, snapshots,
> > ftrace filter, and trace log in initialize_ftrace(),
> > since those are used in test cases.
> > 
> > Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>  
> 
> Acked-by: Steven Rostedt (VMware) <rostedt at goodmis.org>
> 

Bah, this was suppose to be for the previous patch (which I just got
done testing). I'll send out a separate ack for that.

-- Steve
