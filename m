From: mhiramat at kernel.org (Masami Hiramatsu)
Date: Thu, 22 Feb 2018 15:35:14 +0900
Subject: [PATCH v2 01/17] tracing: probeevent: Fix to support minus
 offset from symbol
In-Reply-To: <20180221205341.3fd69b35@gandalf.local.home>
References: <151922484560.6217.1143686155616343906.stgit@devbox>
 <151922487738.6217.16114601174401123273.stgit@devbox>
 <20180222084153.e057d86729063fe39b8232f0@kernel.org>
 <20180221205341.3fd69b35@gandalf.local.home>
Message-ID: <20180222153514.db309d98bbd2b741f7a76dd6@kernel.org>

On Wed, 21 Feb 2018 20:53:41 -0500
Steven Rostedt <rostedt at goodmis.org> wrote:

> On Thu, 22 Feb 2018 08:41:53 +0900
> Masami Hiramatsu <mhiramat at kernel.org> wrote:
> 
> > Hi Steve,
> > 
> > Could you pick this separately since this is a bugfix?
> >
> 
> Yes definitely. I'll have to run my tests on it too, and I'll send it
> as urgent (current -rc release). 
> 
> Although you didn't mark it for stable. Which commit does it fix?

Wait, it actually fixes the 2fba0c8867af ("tracing/kprobes: Fix 
probe offset to be unsigned") but I found that I was doing the 
opposite thing...

OK, I'll update this to add a sanity check for kprobe.offset.

Thank you,

-- 
Masami Hiramatsu <mhiramat at kernel.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
