From: thuth@redhat.com (Thomas Huth)
Date: Mon, 20 May 2019 12:55:11 +0200
Subject: [PATCH] KVM: selftests: Remove duplicated TEST_ASSERT in
 hyperv_cpuid.c
Message-ID: <20190520105511.12471-1-thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190520105511.qH8NRcUcsnjdB5Pmu1MCCjjHBYrIM6SewVnujFfUZc8@z>

The check for entry->index == 0 is done twice. One time should
be sufficient.

Suggested-by: Vitaly Kuznetsov <vkuznets at redhat.com>
Signed-off-by: Thomas Huth <thuth at redhat.com>
---
 Vitaly already noticed this in his review to the "Fix a condition
 in test_hv_cpuid()" patch a couple of days ago, but so far I haven't
 seen any patch yet on the list that fixes this ... if I missed it
 instead, please simply ignore this patch.

 tools/testing/selftests/kvm/x86_64/hyperv_cpuid.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86_64/hyperv_cpuid.c b/tools/testing/selftests/kvm/x86_64/hyperv_cpuid.c
index 9a21e912097c..8bdf1e7da6cc 100644
--- a/tools/testing/selftests/kvm/x86_64/hyperv_cpuid.c
+++ b/tools/testing/selftests/kvm/x86_64/hyperv_cpuid.c
@@ -52,9 +52,6 @@ static void test_hv_cpuid(struct kvm_cpuid2 *hv_cpuid_entries,
 		TEST_ASSERT(entry->index == 0,
 			    ".index field should be zero");
 
-		TEST_ASSERT(entry->index == 0,
-			    ".index field should be zero");
-
 		TEST_ASSERT(entry->flags == 0,
 			    ".flags field should be zero");
 
-- 
2.21.0
