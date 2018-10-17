From: shuah at kernel.org (Shuah Khan)
Date: Wed, 17 Oct 2018 17:02:31 -0600
Subject: [PATCH] selftests/ftrace: Strip escape sequences for log file
In-Reply-To: <20181017164514.23bcc9c3@gandalf.local.home>
References: <20181017100305.0b3c03461b098f8943805455@gmail.com>
 <153974720272.17748.17439079576533415951.stgit@devbox>
 <20181017164514.23bcc9c3@gandalf.local.home>
Message-ID: <cd3b8cc9-fdf0-9b29-5445-1d8e24e148d8@kernel.org>

On 10/17/2018 02:45 PM, Steven Rostedt wrote:
> On Wed, 17 Oct 2018 12:33:23 +0900
> Masami Hiramatsu <mhiramat at kernel.org> wrote:
> 
>> Strip escape sequences from the stream to the ftracetest
>> summary log file. Note that all test-case results are
>> dumped raw in each file.
>>
> 
> Acked-by: Steven Rostedt (VMware) <rostedt at goodmis.org>
> 
> Shuah,
> 
> Please take this one too.
> 

Yup. Applied to linux-kselftest for 4.20-rc1.

thanks,
-- Shuah
