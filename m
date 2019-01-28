From: sashal at kernel.org (Sasha Levin)
Date: Mon, 28 Jan 2019 10:42:56 -0500
Subject: [PATCH AUTOSEL 4.20 259/304] selftests: kvm: report failed stage when
 exit reason is unexpected
In-Reply-To: <20190128154341.47195-1-sashal@kernel.org>
References: <20190128154341.47195-1-sashal@kernel.org>
Message-ID: <20190128154341.47195-259-sashal@kernel.org>

From: Vitaly Kuznetsov <vkuznets at redhat.com>

[ Upstream commit b85c32dd27495075380350fcd5d614a6b45311b8 ]

When we get a report like

==== Test Assertion Failure ====
  x86_64/state_test.c:157: run->exit_reason == KVM_EXIT_IO
  pid=955 tid=955 - Success
     1	0x0000000000401350: main at state_test.c:154
     2	0x00007fc31c9e9412: ?? ??:0
     3	0x000000000040159d: _start at ??:?
  Unexpected exit reason: 8 (SHUTDOWN),

it is not obvious which particular stage failed. Add the info.

Signed-off-by: Vitaly Kuznetsov <vkuznets at redhat.com>
Signed-off-by: Radim Krčmář <rkrcmar at redhat.com>
Signed-off-by: Sasha Levin <sashal at kernel.org>
---
 tools/testing/selftests/kvm/x86_64/evmcs_test.c | 4 ++--
 tools/testing/selftests/kvm/x86_64/state_test.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86_64/evmcs_test.c b/tools/testing/selftests/kvm/x86_64/evmcs_test.c
index 92c2cfd1b182..ea3c73e8f4f6 100644
--- a/tools/testing/selftests/kvm/x86_64/evmcs_test.c
+++ b/tools/testing/selftests/kvm/x86_64/evmcs_test.c
@@ -113,8 +113,8 @@ int main(int argc, char *argv[])
 	for (stage = 1;; stage++) {
 		_vcpu_run(vm, VCPU_ID);
 		TEST_ASSERT(run->exit_reason == KVM_EXIT_IO,
-			    "Unexpected exit reason: %u (%s),\n",
-			    run->exit_reason,
+			    "Stage %d: unexpected exit reason: %u (%s),\n",
+			    stage, run->exit_reason,
 			    exit_reason_str(run->exit_reason));
 
 		memset(&regs1, 0, sizeof(regs1));
diff --git a/tools/testing/selftests/kvm/x86_64/state_test.c b/tools/testing/selftests/kvm/x86_64/state_test.c
index 03da41f0f736..4b3f556265f1 100644
--- a/tools/testing/selftests/kvm/x86_64/state_test.c
+++ b/tools/testing/selftests/kvm/x86_64/state_test.c
@@ -152,8 +152,8 @@ int main(int argc, char *argv[])
 	for (stage = 1;; stage++) {
 		_vcpu_run(vm, VCPU_ID);
 		TEST_ASSERT(run->exit_reason == KVM_EXIT_IO,
-			    "Unexpected exit reason: %u (%s),\n",
-			    run->exit_reason,
+			    "Stage %d: unexpected exit reason: %u (%s),\n",
+			    stage, run->exit_reason,
 			    exit_reason_str(run->exit_reason));
 
 		memset(&regs1, 0, sizeof(regs1));
-- 
2.19.1
