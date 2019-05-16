From: sashal@kernel.org (Sasha Levin)
Date: Thu, 16 May 2019 07:39:26 -0400
Subject: [PATCH AUTOSEL 5.0 29/34] KVM: selftests: make hyperv_cpuid test pass
 on AMD
In-Reply-To: <20190516113932.8348-1-sashal@kernel.org>
References: <20190516113932.8348-1-sashal@kernel.org>
Message-ID: <20190516113932.8348-29-sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190516113926.j0Ujn4kpPLLMzURqAxhVGbpEdsDzpvQSz4gi5Xgy-ZM@z>

From: Vitaly Kuznetsov <vkuznets@redhat.com>

[ Upstream commit eba3afde1cea7dbd7881683232f2a85e2ed86bfe ]

Enlightened VMCS is only supported on Intel CPUs but the test shouldn't
fail completely.

Signed-off-by: Vitaly Kuznetsov <vkuznets at redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini at redhat.com>
Signed-off-by: Sasha Levin <sashal at kernel.org>
---
 tools/testing/selftests/kvm/x86_64/hyperv_cpuid.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/x86_64/hyperv_cpuid.c b/tools/testing/selftests/kvm/x86_64/hyperv_cpuid.c
index 264425f75806b..9a21e912097c4 100644
--- a/tools/testing/selftests/kvm/x86_64/hyperv_cpuid.c
+++ b/tools/testing/selftests/kvm/x86_64/hyperv_cpuid.c
@@ -141,7 +141,13 @@ int main(int argc, char *argv[])
 
 	free(hv_cpuid_entries);
 
-	vcpu_ioctl(vm, VCPU_ID, KVM_ENABLE_CAP, &enable_evmcs_cap);
+	rv = _vcpu_ioctl(vm, VCPU_ID, KVM_ENABLE_CAP, &enable_evmcs_cap);
+
+	if (rv) {
+		fprintf(stderr,
+			"Enlightened VMCS is unsupported, skip related test\n");
+		goto vm_free;
+	}
 
 	hv_cpuid_entries = kvm_get_supported_hv_cpuid(vm);
 	if (!hv_cpuid_entries)
@@ -151,6 +157,7 @@ int main(int argc, char *argv[])
 
 	free(hv_cpuid_entries);
 
+vm_free:
 	kvm_vm_free(vm);
 
 	return 0;
-- 
2.20.1
