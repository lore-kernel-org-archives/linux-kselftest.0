From: alexei.starovoitov@gmail.com (Alexei Starovoitov)
Date: Thu, 21 Mar 2019 19:39:30 -0700
Subject: [PATCH net-next] selftests: bpf: modify urandom_read and link it
 non-statically
In-Reply-To: <20190315200414.32346-1-ivecera@redhat.com>
References: <20190315200414.32346-1-ivecera@redhat.com>
Message-ID:
 <CAADnVQKBWXNzbDwAveUwgoBQe8TuHqTSH049JZmC9aBtnPGMhA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190322023930.XTZqAvuJeAv1lLItK0DH9_mVKbP5D36Dx9vvyhgHCRo@z>

On Fri, Mar 15, 2019@1:04 PM Ivan Vecera <ivecera@redhat.com> wrote:
>
> After some experiences I found that urandom_read does not need to be
> linked statically. When the 'read' syscall call is moved to separate
> non-inlined function then bpf_get_stackid() is able to find
> the executable in stack trace and extract its build_id from it.
>
> Signed-off-by: Ivan Vecera <ivecera at redhat.com>

Applied. Thanks
