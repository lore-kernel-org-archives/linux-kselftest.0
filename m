From: andreyknvl@google.com (Andrey Konovalov)
Date: Mon, 18 Mar 2019 18:17:44 +0100
Subject: [PATCH v12 12/13] bpf,
 arm64: untag user pointers in stack_map_get_build_id_offset
In-Reply-To: <cover.1552929301.git.andreyknvl@google.com>
References: <cover.1552929301.git.andreyknvl@google.com>
Message-ID:
 <7883ff7cbe2e8075c3a0f450eade08587f49f3bc.1552929301.git.andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190318171744.YAIcPdaRq9YNGW1x7p32JCMfjHWDUYz8Htv9g4saKu8@z>

This patch is a part of a series that extends arm64 kernel ABI to allow to
pass tagged user pointers (with the top byte set to something else other
than 0x00) as syscall arguments.

stack_map_get_build_id_offset() uses provided user pointers for vma
lookups, which can only by done with untagged pointers.

Untag the user pointer in this function for doing the lookup and
calculating the offset, but save as is into the bpf_stack_build_id
struct.

Signed-off-by: Andrey Konovalov <andreyknvl at google.com>
---
 kernel/bpf/stackmap.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/kernel/bpf/stackmap.c b/kernel/bpf/stackmap.c
index 950ab2f28922..bb89341d3faf 100644
--- a/kernel/bpf/stackmap.c
+++ b/kernel/bpf/stackmap.c
@@ -320,7 +320,9 @@ static void stack_map_get_build_id_offset(struct bpf_stack_build_id *id_offs,
 	}
 
 	for (i = 0; i < trace_nr; i++) {
-		vma = find_vma(current->mm, ips[i]);
+		u64 untagged_ip = untagged_addr(ips[i]);
+
+		vma = find_vma(current->mm, untagged_ip);
 		if (!vma || stack_map_get_build_id(vma, id_offs[i].build_id)) {
 			/* per entry fall back to ips */
 			id_offs[i].status = BPF_STACK_BUILD_ID_IP;
@@ -328,7 +330,7 @@ static void stack_map_get_build_id_offset(struct bpf_stack_build_id *id_offs,
 			memset(id_offs[i].build_id, 0, BPF_BUILD_ID_SIZE);
 			continue;
 		}
-		id_offs[i].offset = (vma->vm_pgoff << PAGE_SHIFT) + ips[i]
+		id_offs[i].offset = (vma->vm_pgoff << PAGE_SHIFT) + untagged_ip
 			- vma->vm_start;
 		id_offs[i].status = BPF_STACK_BUILD_ID_VALID;
 	}
-- 
2.21.0.225.g810b269d1ac-goog
