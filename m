From: vkuznets@redhat.com (Vitaly Kuznetsov)
Date: Fri, 17 May 2019 12:52:44 +0200
Subject: [PATCH v2] KVM: selftests: Compile code with warnings enabled
In-Reply-To: <1834df0f-b377-2231-0e5c-c5acd3298973@redhat.com>
References: <20190517090445.4502-1-thuth@redhat.com>
 <20190517093000.GO16681@xz-x1> <8736ldquyw.fsf@vitty.brq.redhat.com>
 <1834df0f-b377-2231-0e5c-c5acd3298973@redhat.com>
Message-ID: <87zhnlpd37.fsf@vitty.brq.redhat.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190517105244.lIO3gZUyXDWJLM1IHCqN-1KnCw-1ac4P3mazGXwtW7M@z>

Thomas Huth <thuth at redhat.com> writes:

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

These are tests, let's keep code simple. Casting my vote for the former
option)

-- 
Vitaly
