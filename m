From: sashal at kernel.org (Sasha Levin)
Date: Thu, 14 Feb 2019 21:11:20 -0500
Subject: [PATCH AUTOSEL 4.19 64/65] kvm: selftests: Fix region overlap check
 in kvm_util
In-Reply-To: <20190215021121.177674-1-sashal@kernel.org>
References: <20190215021121.177674-1-sashal@kernel.org>
Message-ID: <20190215021121.177674-64-sashal@kernel.org>

From: Ben Gardon <bgardon at google.com>

[ Upstream commit 94a980c39c8e3f8abaff5d3b5bbcd4ccf1c02c4f ]

Fix a call to userspace_mem_region_find to conform to its spec of
taking an inclusive, inclusive range. It was previously being called
with an inclusive, exclusive range. Also remove a redundant region bounds
check in vm_userspace_mem_region_add. Region overlap checking is already
performed by the call to userspace_mem_region_find.

Tested: Compiled tools/testing/selftests/kvm with -static
	Ran all resulting test binaries on an Intel Haswell test machine
	All tests passed

Signed-off-by: Ben Gardon <bgardon at google.com>
Reviewed-by: Jim Mattson <jmattson at google.com>
Signed-off-by: Paolo Bonzini <pbonzini at redhat.com>
Signed-off-by: Sasha Levin <sashal at kernel.org>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 6fd8c089cafc..fb5d2d1e0c04 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -590,7 +590,7 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm,
 	 * already exist.
 	 */
 	region = (struct userspace_mem_region *) userspace_mem_region_find(
-		vm, guest_paddr, guest_paddr + npages * vm->page_size);
+		vm, guest_paddr, (guest_paddr + npages * vm->page_size) - 1);
 	if (region != NULL)
 		TEST_ASSERT(false, "overlapping userspace_mem_region already "
 			"exists\n"
@@ -606,15 +606,10 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm,
 		region = region->next) {
 		if (region->region.slot == slot)
 			break;
-		if ((guest_paddr <= (region->region.guest_phys_addr
-				+ region->region.memory_size))
-			&& ((guest_paddr + npages * vm->page_size)
-				>= region->region.guest_phys_addr))
-			break;
 	}
 	if (region != NULL)
 		TEST_ASSERT(false, "A mem region with the requested slot "
-			"or overlapping physical memory range already exists.\n"
+			"already exists.\n"
 			"  requested slot: %u paddr: 0x%lx npages: 0x%lx\n"
 			"  existing slot: %u paddr: 0x%lx size: 0x%lx",
 			slot, guest_paddr, npages,
-- 
2.19.1
