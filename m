From: rostedt@goodmis.org (Steven Rostedt)
Date: Fri, 23 Mar 2018 12:19:40 -0400
Subject: [PATCH v6 04/21] selftests: ftrace: Add a testcase for probepoint
In-Reply-To: <152129043097.31874.14273580606301767394.stgit@devbox>
References: <152129024033.31874.15800253385376959274.stgit@devbox>
 <152129043097.31874.14273580606301767394.stgit@devbox>
Message-ID: <20180323121940.44cb79af@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180323161940.ENJYUklcVz6IcYnb1Y2JvQZCGYtMuAICDq789JVX2cQ@z>

On Sat, 17 Mar 2018 21:40:31 +0900
Masami Hiramatsu <mhiramat@kernel.org> wrote:

> Add a testcase for probe point definition. This tests
> symbol, address and symbol+offset syntax. The offset
> must be positive and smaller than UINT_MAX.
> 
> Signed-off-by: Masami Hiramatsu <mhiramat at kernel.org>
>

I've pulled the first 4 patches into my urgent tree and I'm currently
testing it. When it finishes the tests (and I'm sure they will pass ;-)
I'll push it to Linus.

-- Steve
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
