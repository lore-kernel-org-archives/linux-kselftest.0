From: colin.king at canonical.com (Colin King)
Date: Mon, 26 Nov 2018 16:08:14 +0000
Subject: [PATCH] kvm: selftests: fix spelling mistake "begining" -> "beginning"
Message-ID: <20181126160814.27473-1-colin.king@canonical.com>

From: Colin Ian King <colin.king at canonical.com>

The text in a TEST_ASSERT message contains a spelling mistake, fix it.

Signed-off-by: Colin Ian King <colin.king at canonical.com>
---
 tools/testing/selftests/kvm/lib/elf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/elf.c b/tools/testing/selftests/kvm/lib/elf.c
index 5eb857584aa3..53c48f7587d3 100644
--- a/tools/testing/selftests/kvm/lib/elf.c
+++ b/tools/testing/selftests/kvm/lib/elf.c
@@ -141,7 +141,7 @@ void kvm_vm_elf_load(struct kvm_vm *vm, const char *filename,
 		offset = hdr.e_phoff + (n1 * hdr.e_phentsize);
 		offset_rv = lseek(fd, offset, SEEK_SET);
 		TEST_ASSERT(offset_rv == offset,
-			"Failed to seek to begining of program header %u,\n"
+			"Failed to seek to beginning of program header %u,\n"
 			"  filename: %s\n"
 			"  rv: %jd errno: %i",
 			n1, filename, (intmax_t) offset_rv, errno);
-- 
2.19.1
