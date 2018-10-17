From: shuah at kernel.org (Shuah Khan)
Date: Wed, 17 Oct 2018 17:01:46 -0600
Subject: [PATCH] selftests/ftrace: Use colored output when available
In-Reply-To: <20181017164103.4fb8692f@gandalf.local.home>
References: <20181016170220.31156-1-daniel.diaz@linaro.org>
 <20181017164103.4fb8692f@gandalf.local.home>
Message-ID: <ba605b17-9de2-3fc8-4b2a-daf9edfa96c9@kernel.org>

On 10/17/2018 02:41 PM, Steven Rostedt wrote:
> On Tue, 16 Oct 2018 12:02:20 -0500
> Daniel Díaz <daniel.diaz at linaro.org> wrote:
> 
>> If test is being directly executed (with stdout opened on the
>> terminal) and the terminal capabilities indicate enough
>> colors, then use the existing scheme of green, red, and blue
>> to show when tests pass, fail or end in a different way.
>>
>> When running the tests redirecting the stdout, for instance,
>> to a file, then colors are not shown, thus producing a more
>> readable output.
>>
>> Signed-off-by: Daniel Díaz <daniel.diaz at linaro.org>
> 
> Acked-by: Steven Rostedt (VMware) <rostedt at goodmis.org>
> 
> Shuah, can you pull this into your tree?
> 
Applied to linux-ksefltest next for 4.20-rc1

thanks,
-- Shuah
