From: pbonzini at redhat.com (Paolo Bonzini)
Date: Mon, 20 May 2019 13:20:03 +0200
Subject: [RFC PATCH 0/4] KVM selftests for s390x
In-Reply-To: <20190516111253.4494-1-thuth@redhat.com>
References: <20190516111253.4494-1-thuth@redhat.com>
Message-ID: <b412e591-3983-ebef-510b-43f9b7be4147@redhat.com>

On 16/05/19 13:12, Thomas Huth wrote:
> This patch series enables the KVM selftests for s390x. As a first
> test, the sync_regs from x86 has been adapted to s390x.
> 
> Please note that the ucall() interface is not used yet - since
> s390x neither has PIO nor MMIO, this needs some more work first
> before it becomes usable (we likely should use a DIAG hypercall
> here, which is what the sync_reg test is currently using, too...).

No objections at all, though it would be like to have ucall plumbed in
from the beginning.

Paolo
