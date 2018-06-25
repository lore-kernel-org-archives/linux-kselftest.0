From: luto@kernel.org (Andy Lutomirski)
Date: Mon, 25 Jun 2018 08:47:40 -0700
Subject: qemu-system-x86_64: mov_ss_trap_64 PANIC: double fault,
 error_code: 0x0
In-Reply-To: <CA+G9fYu0E0fM+WaFim1WKup5BZvjtGZ_4ii5FhTUjNZEqaAuwA@mail.gmail.com>
References: <CA+G9fYu0E0fM+WaFim1WKup5BZvjtGZ_4ii5FhTUjNZEqaAuwA@mail.gmail.com>
Message-ID:
 <CALCETrWZ=sipwoVic16LM08+-FKV5knO7Cv3pSM_5w=KLCqTKw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180625154740.wYf49ay_I3x4f-BFqcFm_VSwuTZDHMi4lNNpr-Nj9-U@z>

On Sun, Jun 24, 2018 at 10:41 PM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> Kselftest test case mov_ss_trap_64 is causing kernel panic on
> qemu-system-x86_64 and PASS on real x86_64 hardware.
>
> Test code snippet,
> main() {
> <>
>       printf("[RUN]\tMOV SS; CS CS INT3\n");
>       asm volatile ("mov %[ss], %%ss; .byte 0x2e, 0x2e; int3" :: [ss] "m" (ss));
> <>
> }
>

This smells like CVE-2018-1087.  Can you confirm that your *host*
kernel is patched?

CVE-2018-1087 is extremely severe, and if your host kernel is not
patched, I think you need to apply some serious pressure on your
vendor to get with the program.

--Andy
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
