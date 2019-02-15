From: sashal@kernel.org (Sasha Levin)
Date: Thu, 14 Feb 2019 21:08:54 -0500
Subject: [PATCH AUTOSEL 4.20 76/77] KVM: selftests: check returned evmcs
 version range
In-Reply-To: <20190215020855.176727-1-sashal@kernel.org>
References: <20190215020855.176727-1-sashal@kernel.org>
Message-ID: <20190215020855.176727-76-sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190215020854.zSpuOI4OCE3cqk-wHneC_VjX87Z6weHj0CXpMQhdJeU@z>

From: Vitaly Kuznetsov <vkuznets@redhat.com>

[ Upstream commit 35b531a1e7fc30ac8c62e5ac1794eb1460da614e ]

Check that KVM_CAP_HYPERV_ENLIGHTENED_VMCS returns correct version range.

Signed-off-by: Vitaly Kuznetsov <vkuznets at redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini at redhat.com>
Signed-off-by: Sasha Levin <sashal at kernel.org>
---
 tools/testing/selftests/kvm/x86_64/evmcs_test.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/kvm/x86_64/evmcs_test.c b/tools/testing/selftests/kvm/x86_64/evmcs_test.c
index 92c2cfd1b182..5d89b30ddde2 100644
--- a/tools/testing/selftests/kvm/x86_64/evmcs_test.c
+++ b/tools/testing/selftests/kvm/x86_64/evmcs_test.c
@@ -103,6 +103,12 @@ int main(int argc, char *argv[])
 
 	vcpu_ioctl(vm, VCPU_ID, KVM_ENABLE_CAP, &enable_evmcs_cap);
 
+	/* KVM should return supported EVMCS version range */
+	TEST_ASSERT(((evmcs_ver >> 8) >= (evmcs_ver & 0xff)) &&
+		    (evmcs_ver & 0xff) > 0,
+		    "Incorrect EVMCS version range: %x:%x\n",
+		    evmcs_ver & 0xff, evmcs_ver >> 8);
+
 	run = vcpu_state(vm, VCPU_ID);
 
 	vcpu_regs_get(vm, VCPU_ID, &regs1);
-- 
2.19.1
