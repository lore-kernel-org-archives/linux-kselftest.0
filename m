From: thuth at redhat.com (Thomas Huth)
Date: Mon, 20 May 2019 13:30:31 +0200
Subject: [RFC PATCH 0/4] KVM selftests for s390x
In-Reply-To: <b412e591-3983-ebef-510b-43f9b7be4147@redhat.com>
References: <20190516111253.4494-1-thuth@redhat.com>
 <b412e591-3983-ebef-510b-43f9b7be4147@redhat.com>
Message-ID: <9423ba89-b10e-5e6e-3cc8-8088f3088233@redhat.com>

On 20/05/2019 13.20, Paolo Bonzini wrote:
> On 16/05/19 13:12, Thomas Huth wrote:
>> This patch series enables the KVM selftests for s390x. As a first
>> test, the sync_regs from x86 has been adapted to s390x.
>>
>> Please note that the ucall() interface is not used yet - since
>> s390x neither has PIO nor MMIO, this needs some more work first
>> before it becomes usable (we likely should use a DIAG hypercall
>> here, which is what the sync_reg test is currently using, too...).
> 
> No objections at all, though it would be like to have ucall plumbed in
> from the beginning.

I'm still looking at the ucall interface ... what I don't quite get yet
is the question why the ucall_type there is selectable during runtime?

Are there plans to have test that could either use UCALL_PIO or
UCALL_MMIO? If not, what about moving ucall_init() and ucall() to
architecture specific code in tools/testing/selftests/kvm/lib/aarch64/
and tools/testing/selftests/kvm/lib/x86_64 instead, and to remove the
ucall_type stuff again (so that x86 is hard-wired to PIO and aarch64
is hard-wired to MMIO)? ... then I could add a DIAG-based ucall
on s390x more easily, I think.

 Thomas
