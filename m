From: colin.king at canonical.com (Colin King)
Date: Tue, 10 Apr 2018 13:38:56 +0100
Subject: [PATCH][next] kvm: selftests: fix spelling mistake: "divisable" and
 "divisible"
Message-ID: <20180410123856.24869-1-colin.king@canonical.com>

From: Colin Ian King <colin.king at canonical.com>

Trivial fix to spelling mistakes in comment and message text

Signed-off-by: Colin Ian King <colin.king at canonical.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c  | 2 +-
 tools/testing/selftests/kvm/lib/sparsebit.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 7ca1bb40c498..e213d513dc61 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1435,7 +1435,7 @@ vm_paddr_t vm_phy_page_alloc(struct kvm_vm *vm,
 	sparsebit_idx_t pg;
 
 	TEST_ASSERT((paddr_min % vm->page_size) == 0, "Min physical address "
-		"not divisable by page size.\n"
+		"not divisible by page size.\n"
 		"  paddr_min: 0x%lx page_size: 0x%x",
 		paddr_min, vm->page_size);
 
diff --git a/tools/testing/selftests/kvm/lib/sparsebit.c b/tools/testing/selftests/kvm/lib/sparsebit.c
index 0c5cf3e0cb6f..b132bc95d183 100644
--- a/tools/testing/selftests/kvm/lib/sparsebit.c
+++ b/tools/testing/selftests/kvm/lib/sparsebit.c
@@ -121,7 +121,7 @@
  *     avoided by moving the setting of the nodes mask bits into
  *     the previous nodes num_after setting.
  *
- *   + Node starting index is evenly divisable by the number of bits
+ *   + Node starting index is evenly divisible by the number of bits
  *     within a nodes mask member.
  *
  *   + Nodes never represent a range of bits that wrap around the
@@ -1741,7 +1741,7 @@ void sparsebit_validate_internal(struct sparsebit *s)
 
 		/* Validate node index is divisible by the mask size */
 		if (nodep->idx % MASK_BITS) {
-			fprintf(stderr, "Node index not divisable by "
+			fprintf(stderr, "Node index not divisible by "
 				"mask size,\n"
 				"  nodep: %p nodep->idx: 0x%lx "
 				"MASK_BITS: %lu\n",
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
