From: rostedt@goodmis.org (Steven Rostedt)
Date: Wed, 21 Feb 2018 20:53:41 -0500
Subject: [PATCH v2 01/17] tracing: probeevent: Fix to support minus
 offset from symbol
In-Reply-To: <20180222084153.e057d86729063fe39b8232f0@kernel.org>
References: <151922484560.6217.1143686155616343906.stgit@devbox>
 <151922487738.6217.16114601174401123273.stgit@devbox>
 <20180222084153.e057d86729063fe39b8232f0@kernel.org>
Message-ID: <20180221205341.3fd69b35@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180222015341.3qjdwIFhABHGl5pa373bESWY1hIwjSZ_WjWiqfcEqqs@z>

On Thu, 22 Feb 2018 08:41:53 +0900
Masami Hiramatsu <mhiramat@kernel.org> wrote:

> Hi Steve,
> 
> Could you pick this separately since this is a bugfix?
>

Yes definitely. I'll have to run my tests on it too, and I'll send it
as urgent (current -rc release). 

Although you didn't mark it for stable. Which commit does it fix?

Thanks!

-- Steve
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
