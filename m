From: drjones@redhat.com (Andrew Jones)
Date: Thu, 23 May 2019 11:11:33 +0200
Subject: [PATCH v2] KVM: selftests: Compile code with warnings enabled
In-Reply-To: <f998da41-c75d-0afa-02cd-e2e5d8f0f546@redhat.com>
References: <20190517090445.4502-1-thuth@redhat.com>
 <f998da41-c75d-0afa-02cd-e2e5d8f0f546@redhat.com>
Message-ID: <20190523091133.wemwsmz6xslsz3va@kamzik.brq.redhat.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190523091133.Cqs6VqjpOkxI7DsKJvcirbWGLa9zjr90G_QKjTxmwFI@z>

On Mon, May 20, 2019@12:03:08PM +0200, Paolo Bonzini wrote:
> On 17/05/19 11:04, Thomas Huth wrote:
> > So far the KVM selftests are compiled without any compiler warnings
> > enabled. That's quite bad, since we miss a lot of possible bugs this
> > way. Let's enable at least "-Wall" and some other useful warning flags
> > now, and fix at least the trivial problems in the code (like unused
> > variables).
> > 
> > Signed-off-by: Thomas Huth <thuth at redhat.com>
> > ---
> >  v2:
> >  - Rebased to kvm/queue
> >  - Fix warnings in state_test.c and evmcs_test.c, too
> > 
> >  tools/testing/selftests/kvm/Makefile                       | 4 +++-
> >  tools/testing/selftests/kvm/dirty_log_test.c               | 6 +++++-
> >  tools/testing/selftests/kvm/lib/kvm_util.c                 | 3 ---
> >  tools/testing/selftests/kvm/lib/x86_64/processor.c         | 4 +---
> >  tools/testing/selftests/kvm/x86_64/cr4_cpuid_sync_test.c   | 1 +
> >  tools/testing/selftests/kvm/x86_64/evmcs_test.c            | 7 +------
> >  tools/testing/selftests/kvm/x86_64/platform_info_test.c    | 1 -
> >  tools/testing/selftests/kvm/x86_64/smm_test.c              | 3 +--
> >  tools/testing/selftests/kvm/x86_64/state_test.c            | 7 +------
> >  .../selftests/kvm/x86_64/vmx_close_while_nested_test.c     | 5 +----
> >  tools/testing/selftests/kvm/x86_64/vmx_tsc_adjust_test.c   | 5 ++---
> >  11 files changed, 16 insertions(+), 30 deletions(-)
> 
> Queued, with a squashed fix to kvm_get_supported_hv_cpuid.
>

I've done the fixups needed to keep aarch64 compiling and will send
the patch shortly.

drew 
