From: shuah@kernel.org (shuah)
Date: Tue, 21 May 2019 08:12:43 -0600
Subject: [PATCH 1/2] selftests: Remove forced unbuffering for test running
In-Reply-To: <s5hlfz0757d.wl-tiwai@suse.de>
References: <20190520223749.13476-1-keescook@chromium.org>
 <20190520223749.13476-2-keescook@chromium.org> <s5hlfz0757d.wl-tiwai@suse.de>
Message-ID: <e6a41345-7c98-751a-80bd-34d96e6de001@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190521141243.e2lNMLrda2FS8QoXrTpVYwzRMhMCdmM_NQPJModho9g@z>

On 5/20/19 11:21 PM, Takashi Iwai wrote:
> On Tue, 21 May 2019 00:37:48 +0200,
> Kees Cook wrote:
>>
>> As it turns out, the "stdbuf" command will actually force all
>> subprocesses into unbuffered output, and some implementations of "echo"
>> turn into single-character writes, which utterly wrecks writes to /sys
>> and /proc files.
>>
>> Instead, drop the "stdbuf" usage, and for any tests that want explicit
>> flushing between newlines, they'll have to add "fflush(stdout);" as
>> needed.
>>
>> Reported-by: Takashi Iwai <tiwai at suse.de>
>> Fixes: 5c069b6dedef ("selftests: Move test output to diagnostic lines")
>> Signed-off-by: Kees Cook <keescook at chromium.org>
> 
> Tested-by: Takashi Iwai <tiwai at suse.de>
> 
> BTW, this might be specific to shell invocation.  As in the original
> discussion thread, it starts working when I replace "echo" with
> "/usr/bin/echo".
> 
> Still it's not easy to control in a script itself, so dropping the
> unbuffered mode is certainly safer, yes.
> 
> Thanks!

Thank you both.

I will get this in for next rc.

-- Shuah
