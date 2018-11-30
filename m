From: keescook@chromium.org (Kees Cook)
Date: Thu, 29 Nov 2018 18:57:43 -0800
Subject: seccomp/seccomp_bpf: test terminated by the not expected behavior
In-Reply-To: <F40213214988A94A9DDBFC5F7146FC5E01AF2E2998@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <F40213214988A94A9DDBFC5F7146FC5E01AF2E2998@G08CNEXMBPEKD01.g08.fujitsu.local>
Message-ID:
 <CAGXu5j+B_+UggW50bFVuZKM2Fsou7g6ZMrCL_kPHyc7tsWFDSA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181130025743.KEBO_gXgthgoJ7F9aPsc9vTfkmiYdkLq8XAmnyPayHs@z>

On Thu, Nov 29, 2018@6:52 PM Liu, Wenlong <liuwl.fnst@cn.fujitsu.com> wrote:
> m3ulcb:/opt/kselftest/seccomp# ./seccomp_bpf 64
> [ RUN      ] global.get_metadata
> seccomp_bpf.c:2914:global.get_metadata:Expected sizeof(md) (16) == ptrace(0x420d, pid, sizeof(md), &md) (-1)
> global.get_metadata: Test terminated by assertion
> [     FAIL ] global.get_metadata
>
> ---
> Although I am not so familiar with SECCOMP and BPF, I checked some related documents and codes.
> About the failures above, what the most confused me is that why it always give ENOSYS.
>
> Am I missing something?
> Thanks in advance.
>
> PS:
> I didn't run "make kselftest-merge" before compiling the kernel that I'm using.
>
> ---
> The Test Environment:
> - Kernel version: v4.14.0

Hi!

It appears you're attempting to use a newer seccomp selftest on an
older kernel. That isn't a supported way to test seccomp. You'll need
to build 4.14's seccomp_bpf test binary and run it instead.

-- 
Kees Cook
