From: shuah at kernel.org (shuah)
Date: Tue, 11 Dec 2018 17:54:38 -0700
Subject: [PATCH] selftests/seccomp: Remove SIGSTOP si_pid check
In-Reply-To: <CAGXu5jJ-OZho9Ft7imNuayNjr0Rnz3p4sKg-yZp2_d4go=G9fA@mail.gmail.com>
References: <20181206235038.GA18273@beast>
 <CAGXu5jJ-OZho9Ft7imNuayNjr0Rnz3p4sKg-yZp2_d4go=G9fA@mail.gmail.com>
Message-ID: <431274ac-9ddc-b5e2-dd00-b4d629d14562@kernel.org>

On 12/11/18 5:43 PM, Kees Cook wrote:
> On Thu, Dec 6, 2018 at 3:50 PM Kees Cook <keescook at chromium.org> wrote:
>>
>> Commit f149b3155744 ("signal: Never allocate siginfo for SIGKILL or SIGSTOP")
>> means that the seccomp selftest cannot check si_pid under SIGSTOP anymore.
>> Since it's believed[1] there are no other userspace things depending on the
>> old behavior, this removes the behavioral check in the selftest, since it's
>> more a "extra" sanity check (which turns out, maybe, not to have been
>> useful to test).
>>
>> [1] https://lkml.kernel.org/r/CAGXu5jJaZAOzP1qFz66tYrtbuywqb+UN2SOA1VLHpCCOiYvYeg at mail.gmail.com
>>
>> Reported-by: Tycho Andersen <tycho at tycho.ws>
>> Suggested-by: Eric W. Biederman <ebiederm at xmission.com>
>> Signed-off-by: Kees Cook <keescook at chromium.org>
>> ---
>> Shuah, can you make sure that Linus gets this before v4.20 is released? Thanks!
> 
> Ping. Shuah, can you get this to Linus (or should I send it directly?)
> 

I will send this. Thanks for the ping.

-- Shuah
