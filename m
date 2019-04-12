From: shuah at kernel.org (shuah)
Date: Fri, 12 Apr 2019 11:07:11 -0600
Subject: [PATCH] selftests/seccomp: Handle namespace failures gracefully
In-Reply-To: <20190412152543.GB25793@cisco>
References: <20190411235631.GA31624@beast> <20190412152543.GB25793@cisco>
Message-ID: <8fca6205-4983-2ba1-c1eb-c80be2dc8769@kernel.org>

On 4/12/19 9:25 AM, Tycho Andersen wrote:
> On Thu, Apr 11, 2019 at 04:56:31PM -0700, Kees Cook wrote:
>> When running without USERNS or PIDNS the seccomp test would hang since
>> it was waiting forever for the child to trigger the user notification
>> since it seems the glibc() abort handler makes a call to getpid(),
>> which would trap again. This changes the getpid filter to getppid, and
>> makes sure ASSERTs execute to stop from spawning the listener.
>>
>> Reported-by: Shuah Khan <shuah at kernel.org>
>> Fixes: 6a21cc50f0c7 ("seccomp: add a return code to trap to userspace")
>> Signed-off-by: Kees Cook <keescook at chromium.org>
> 
> Sorry for the delay, thanks for looking at this!
> 
> Reviewed-by: Tycho Andersen <tycho at tycho.ws>
> 

Thanks both. Should it go into stables. I will pull this and
add stable if that is appropriate.

thanks,
-- Shuah
