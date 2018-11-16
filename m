From: ahmedsoliman@mena.vt.edu (Ahmed Abd El Mawgood)
Date: Fri, 16 Nov 2018 13:50:55 +0200
Subject: [PATCH V2] SelfTest: KVM: Drop Asserts for madvise MADV_NOHUGEPAGE
 failure
Message-ID: <20181116115055.7415-1-ahmedsoliman0x666@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181116115055.e6yCuyOJYzTng_qflZn4pF2uH0eImkpVOBsN5p4CQFU@z>

From: Ahmed Abd El Mawgood <ahmedsoliman@mena.vt.edu>

madvise() returns -1 without CONFIG_TRANSPARENT_HUGEPAGE=y. That would
trigger asserts when checking for return value of madvice. Following
similar decision to [1]. I thought it is ok to assume that madvise()
MADV_NOHUGEPAGE failures implies that THP is not supported by host kernel.

Other options was to check for Transparent Huge Page support in
/sys/kernel/mm/transparent_hugepage/enabled.

-- links --
[1] https://lists.gnu.org/archive/html/qemu-devel/2015-11/msg04514.html

Signed-off-by: Ahmed Abd El Mawgood <ahmedsoliman at mena.vt.edu>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 1b41e71283d5..437c5bb48061 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -586,14 +586,23 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm,
 				 src_type == VM_MEM_SRC_ANONYMOUS_THP ?  huge_page_size : 1);
 
 	/* As needed perform madvise */
-	if (src_type == VM_MEM_SRC_ANONYMOUS || src_type == VM_MEM_SRC_ANONYMOUS_THP) {
+	if (src_type == VM_MEM_SRC_ANONYMOUS) {
+		/*
+		 * Neglect madvise error because it is ok to not have THP
+		 * support in this case.
+		 */
+		madvise(region->host_mem, npages * vm->page_size,
+			MADV_NOHUGEPAGE);
+	} else if (src_type == VM_MEM_SRC_ANONYMOUS_THP) {
 		ret = madvise(region->host_mem, npages * vm->page_size,
-			     src_type == VM_MEM_SRC_ANONYMOUS ? MADV_NOHUGEPAGE : MADV_HUGEPAGE);
+			MADV_HUGEPAGE);
 		TEST_ASSERT(ret == 0, "madvise failed,\n"
-			    "  addr: %p\n"
-			    "  length: 0x%lx\n"
-			    "  src_type: %x",
-			    region->host_mem, npages * vm->page_size, src_type);
+			"Does the kernel have CONFIG_TRANSPARENT_HUGEPAGE=y\n"
+			"  addr: %p\n"
+			"  length: 0x%lx\n"
+			"  src_type: %x\n",
+			region->host_mem, npages * vm->page_size,
+			src_type);
 	}
 
 	region->unused_phy_pages = sparsebit_alloc();
-- 
2.18.1
