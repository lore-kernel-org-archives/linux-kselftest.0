From: shuah at kernel.org (shuah)
Date: Mon, 10 Jun 2019 16:08:10 -0600
Subject: [PATCH v16 16/16] selftests, arm64: add a selftest for passing
 tagged pointers to kernel
In-Reply-To: <201906072055.7DFED7B@keescook>
References: <cover.1559580831.git.andreyknvl@google.com>
 <9e1b5998a28f82b16076fc85ab4f88af5381cf74.1559580831.git.andreyknvl@google.com>
 <201906072055.7DFED7B@keescook>
Message-ID: <2bc277f8-e67e-30e0-5824-8184c2b03237@kernel.org>

On 6/7/19 9:56 PM, Kees Cook wrote:
> On Mon, Jun 03, 2019 at 06:55:18PM +0200, Andrey Konovalov wrote:
>> This patch is a part of a series that extends arm64 kernel ABI to allow to
>> pass tagged user pointers (with the top byte set to something else other
>> than 0x00) as syscall arguments.
>>
>> This patch adds a simple test, that calls the uname syscall with a
>> tagged user pointer as an argument. Without the kernel accepting tagged
>> user pointers the test fails with EFAULT.
>>
>> Signed-off-by: Andrey Konovalov <andreyknvl at google.com>
> 
> I'm adding Shuah to CC in case she has some suggestions about the new
> selftest.

Thanks Kees.

> 
> Reviewed-by: Kees Cook <keescook at chromium.org>
> 
> -Kees
> 

Looks good to me.

Acked-by: Shuah Khan <skhan at linuxfoundation.org>

thanks,
-- Shuah
