From: shuah@kernel.org (shuah)
Date: Mon, 25 Feb 2019 06:00:44 -0700
Subject: [RESEND PATCH v2 2/2] selftests/ftrace: Replace \e with \033
In-Reply-To: <20190223132551.5afc02bb@smeagol>
References: <20190222091021.10178-1-juergh@canonical.com>
 <20190222205351.743-1-juergh@canonical.com>
 <20190222205351.743-3-juergh@canonical.com>
 <aedb3a7e-058e-ec62-93c7-0767717b9ea9@kernel.org>
 <20190223132551.5afc02bb@smeagol>
Message-ID: <92139bfa-0538-f912-a164-f962b37856ee@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190225130044.r370C0-xDF3WiwI94YfXWCWhUl5H1Ckzuz_Rpky17YE@z>

On 2/23/19 5:25 AM, Juerg Haefliger wrote:
> On Fri, 22 Feb 2019 15:46:03 -0700
> shuah <shuah@kernel.org> wrote:
> 
>> On 2/22/19 1:53 PM, Juerg Haefliger wrote:
>>> The \e sequence character is not POSIX. Fix that by using \033 instead.
>>>
>>> Acked-by: Steven Rostedt (VMware) <rostedt at goodmis.org>
>>> Acked-by: Masami Hiramatsu <mhiramat at kernel.org>
>>> Signed-off-by: Juerg Haefliger <juergh at canonical.com>
>>> ---
>>>    tools/testing/selftests/ftrace/ftracetest | 8 ++++----
>>>    1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/tools/testing/selftests/ftrace/ftracetest b/tools/testing/selftests/ftrace/ftracetest
>>> index 20c9c0ad8682..136387422b00 100755
>>> --- a/tools/testing/selftests/ftrace/ftracetest
>>> +++ b/tools/testing/selftests/ftrace/ftracetest
>>> @@ -161,10 +161,10 @@ color_green=
>>>    color_blue=
>>>    # If stdout exists and number of colors is eight or more, use them
>>>    if [ -t 1 -a "$ncolors" -ge 8 ]; then
>>> -  color_reset="\e[0m"
>>> -  color_red="\e[31m"
>>> -  color_green="\e[32m"
>>> -  color_blue="\e[34m"
>>> +  color_reset="\033[0m"
>>> +  color_red="\033[31m"
>>> +  color_green="\033[32m"
>>> +  color_blue="\033[34m"
>>>    fi
>>>    
>>>    strip_esc() {
>>>    
>>
>> Which release is this patch based on?
>>
>> This one failed to apply to linux-kselftest next - I resolved a minor
>> merge conflict and applied it. Please review to make sure it looks good.
> 
> Looks good. It didn't apply cleanly because you don't have
> https://lore.kernel.org/lkml/20190220153706.24686-1-juergh at canonical.com/T/#u
> Sorry about not copying you on that patch. Want me to resend?
> 
> ...Juerg
> 

Yes. Please.

thanks,
-- Shuah
