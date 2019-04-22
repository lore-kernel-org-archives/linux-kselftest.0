From: sashal@kernel.org (Sasha Levin)
Date: Mon, 22 Apr 2019 15:41:50 -0400
Subject: [PATCH AUTOSEL 5.0 83/98] KVM: selftests: assert on exit reason in
 CR4/cpuid sync test
In-Reply-To: <20190422194205.10404-1-sashal@kernel.org>
References: <20190422194205.10404-1-sashal@kernel.org>
Message-ID: <20190422194205.10404-83-sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190422194150.DQEUbgscBlGjcsYOkmtCYIYbwtS3od9SbQ_34X_9iS0@z>

From: Sean Christopherson <sean.j.christopherson@intel.com>

[ Upstream commit 8df98ae0ab2ead9a02228756eec26f8d7b17f499 ]

...so that the test doesn't end up in an infinite loop if it fails for
whatever reason, e.g. SHUTDOWN due to gcc inserting stack canary code
into ucall() and attempting to derefence a null segment.

Fixes: ca359066889f7 ("kvm: selftests: add cr4_cpuid_sync_test")
Cc: Wei Huang <wei at redhat.com>
Signed-off-by: Sean Christopherson <sean.j.christopherson at intel.com>
Signed-off-by: Paolo Bonzini <pbonzini at redhat.com>
Signed-off-by: Sasha Levin (Microsoft) <sashal at kernel.org>
---
 .../kvm/x86_64/cr4_cpuid_sync_test.c          | 35 ++++++++++---------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86_64/cr4_cpuid_sync_test.c b/tools/testing/selftests/kvm/x86_64/cr4_cpuid_sync_test.c
index d503a51fad30..7c2c4d4055a8 100644
--- a/tools/testing/selftests/kvm/x86_64/cr4_cpuid_sync_test.c
+++ b/tools/testing/selftests/kvm/x86_64/cr4_cpuid_sync_test.c
@@ -87,22 +87,25 @@ int main(int argc, char *argv[])
 	while (1) {
 		rc = _vcpu_run(vm, VCPU_ID);
 
-		if (run->exit_reason == KVM_EXIT_IO) {
-			switch (get_ucall(vm, VCPU_ID, &uc)) {
-			case UCALL_SYNC:
-				/* emulate hypervisor clearing CR4.OSXSAVE */
-				vcpu_sregs_get(vm, VCPU_ID, &sregs);
-				sregs.cr4 &= ~X86_CR4_OSXSAVE;
-				vcpu_sregs_set(vm, VCPU_ID, &sregs);
-				break;
-			case UCALL_ABORT:
-				TEST_ASSERT(false, "Guest CR4 bit (OSXSAVE) unsynchronized with CPUID bit.");
-				break;
-			case UCALL_DONE:
-				goto done;
-			default:
-				TEST_ASSERT(false, "Unknown ucall 0x%x.", uc.cmd);
-			}
+		TEST_ASSERT(run->exit_reason == KVM_EXIT_IO,
+			    "Unexpected exit reason: %u (%s),\n",
+			    run->exit_reason,
+			    exit_reason_str(run->exit_reason));
+
+		switch (get_ucall(vm, VCPU_ID, &uc)) {
+		case UCALL_SYNC:
+			/* emulate hypervisor clearing CR4.OSXSAVE */
+			vcpu_sregs_get(vm, VCPU_ID, &sregs);
+			sregs.cr4 &= ~X86_CR4_OSXSAVE;
+			vcpu_sregs_set(vm, VCPU_ID, &sregs);
+			break;
+		case UCALL_ABORT:
+			TEST_ASSERT(false, "Guest CR4 bit (OSXSAVE) unsynchronized with CPUID bit.");
+			break;
+		case UCALL_DONE:
+			goto done;
+		default:
+			TEST_ASSERT(false, "Unknown ucall 0x%x.", uc.cmd);
 		}
 	}
 
-- 
2.19.1
