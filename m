From: alexei.starovoitov@gmail.com (Alexei Starovoitov)
Date: Thu, 16 May 2019 11:36:24 -0700
Subject: [PATCH] selftests: fix bpf build/test workflow regression when
 KBUILD_OUTPUT is set
In-Reply-To: <20190511043729.3o4enh35lrmne3kd@ast-mbp>
References: <20190511025249.32678-1-skhan@linuxfoundation.org>
 <20190511043729.3o4enh35lrmne3kd@ast-mbp>
Message-ID:
 <CAADnVQK2eyFdEULS6z-M1R77d-AKe5sACKCHxHShJFOqhqy0rw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190516183624.8eqCLMKWSbgS1dMwNhueNiMGtR7tEmWfG5RafX2N5yk@z>

On Fri, May 10, 2019 at 9:37 PM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Fri, May 10, 2019@08:52:49PM -0600, Shuah Khan wrote:
> > commit 8ce72dc32578 ("selftests: fix headers_install circular dependency")
> > broke bpf build/test workflow. When KBUILD_OUTPUT is set, bpf objects end
> > up in KBUILD_OUTPUT build directory instead of in ../selftests/bpf.
> >
> > The following bpf workflow breaks when it can't find the test_verifier:
> >
> > cd tools/testing/selftests/bpf; make; ./test_verifier;
> >
> > Fix it to set OUTPUT only when it is undefined in lib.mk. It didn't need
> > to be set in the first place.
> >
> > Fixes: commit 8ce72dc32578 ("selftests: fix headers_install circular dependency")
> >
> > Reported-by: Alexei Starovoitov <alexei.starovoitov at gmail.com>
> > Signed-off-by: Shuah Khan <skhan at linuxfoundation.org>
>
> 'git am' couldn't apply this patch because "sha1 information is lacking",
> but the patch itself looks good.
> Acked-by: Alexei Starovoitov <ast at kernel.org>
> Thanks for the quick fix.

Ping! What is the status of the fix?
