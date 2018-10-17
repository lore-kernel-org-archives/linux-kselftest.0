From: rostedt@goodmis.org (Steven Rostedt)
Date: Wed, 17 Oct 2018 16:45:14 -0400
Subject: [PATCH] selftests/ftrace: Strip escape sequences for log file
In-Reply-To: <153974720272.17748.17439079576533415951.stgit@devbox>
References: <20181017100305.0b3c03461b098f8943805455@gmail.com>
 <153974720272.17748.17439079576533415951.stgit@devbox>
Message-ID: <20181017164514.23bcc9c3@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181017204514.W38ofyPiuZ5SWw4Uycupq9XOOQBdDVG0z_Jskq0S7Gc@z>

On Wed, 17 Oct 2018 12:33:23 +0900
Masami Hiramatsu <mhiramat@kernel.org> wrote:

> Strip escape sequences from the stream to the ftracetest
> summary log file. Note that all test-case results are
> dumped raw in each file.
> 

Acked-by: Steven Rostedt (VMware) <rostedt at goodmis.org>

Shuah,

Please take this one too.

Thanks!

-- Steve
