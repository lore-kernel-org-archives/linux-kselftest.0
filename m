From: ahmedsoliman@mena.vt.edu (Ahmed Abd El Mawgood)
Date: Thu, 15 Nov 2018 20:09:07 +0200
Subject: [PATCH] SelfTest: KVM: Drop Asserts for madvise failures
Message-ID: <20181115180907.13974-1-ahmedsoliman0x666@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181115180907.J_qRAHdDiznVAuFeF1M-YvkqbF7DfB-LYv81y8_PcUk@z>

From: Ahmed Abd El Mawgood <ahmedsoliman@mena.vt.edu>

madvise() returns -1 without CONFIG_TRANSPARENT_HUGEPAGE=y. That would
trigger asserts when checking for return value of madvice. Following
similar decision to [1]. I thought it is ok to assume that madvise()
failures implies that THP is not supported by host kernel.

Other options were to check for Transparent Huge Page support in
/sys/kernel/mm/transparent_hugepage/enabled.

-- links --
[1] https://lists.gnu.org/archive/html/qemu-devel/2015-11/msg04514.html

Signed-off-by: Ahmed Abd El Mawgood <ahmedsoliman at mena.vt.edu>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 1b41e71283d5..7725cfdf1b79 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -586,14 +586,12 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm,
 				 src_type == VM_MEM_SRC_ANONYMOUS_THP ?  huge_page_size : 1);
 
 	/* As needed perform madvise */
-	if (src_type == VM_MEM_SRC_ANONYMOUS || src_type == VM_MEM_SRC_ANONYMOUS_THP) {
-		ret = madvise(region->host_mem, npages * vm->page_size,
-			     src_type == VM_MEM_SRC_ANONYMOUS ? MADV_NOHUGEPAGE : MADV_HUGEPAGE);
-		TEST_ASSERT(ret == 0, "madvise failed,\n"
-			    "  addr: %p\n"
-			    "  length: 0x%lx\n"
-			    "  src_type: %x",
-			    region->host_mem, npages * vm->page_size, src_type);
+	if (src_type == VM_MEM_SRC_ANONYMOUS) {
+		madvise(region->host_mem, npages * vm->page_size,
+				MADV_NOHUGEPAGE);
+	} else if (src_type == VM_MEM_SRC_ANONYMOUS_THP) {
+		madvise(region->host_mem, npages * vm->page_size,
+				MADV_HUGEPAGE);
 	}
 
 	region->unused_phy_pages = sparsebit_alloc();
-- 
2.18.1
