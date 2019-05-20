From: pbonzini@redhat.com (Paolo Bonzini)
Date: Mon, 20 May 2019 12:00:44 +0200
Subject: [PATCH v2] KVM: selftests: Compile code with warnings enabled
In-Reply-To: <1834df0f-b377-2231-0e5c-c5acd3298973@redhat.com>
References: <20190517090445.4502-1-thuth@redhat.com>
 <20190517093000.GO16681@xz-x1> <8736ldquyw.fsf@vitty.brq.redhat.com>
 <1834df0f-b377-2231-0e5c-c5acd3298973@redhat.com>
Message-ID: <505274ec-e73f-f362-8130-5f70673bfc80@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190520100044.E9Y0YCy0TsQSn33KvJyWZQHn7h4qCU6KjbSZycg4EEM@z>

On 17/05/19 12:07, Thomas Huth wrote:
> 
> lib/ucall.c: In function ‘get_ucall’:
> lib/ucall.c:145:3: warning: dereferencing type-punned pointer will break
> strict-aliasing rules [-Wstrict-aliasing]
>    gva = *(vm_vaddr_t *)run->mmio.data;
> 
> x86_64/vmx_set_nested_state_test.c: In function
> ‘set_revision_id_for_vmcs12’:
> x86_64/vmx_set_nested_state_test.c:78:2: warning: dereferencing
> type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]
>   *(u32 *)(state->data) = vmcs12_revision;
> 
> ... how do we want to handle such spots in the kvm selftest code?
> Compile with -fno-strict-aliasing? Or fix it with type-punning through
> unions?

I would use memcpy.  I'll send a patch shortly.

Paolo
