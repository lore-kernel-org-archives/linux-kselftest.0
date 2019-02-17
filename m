From: colin.king@canonical.com (Colin King)
Date: Sun, 17 Feb 2019 22:40:11 +0000
Subject: [PATCH] kvm: selftests: fix spelling mistake "begining" -> "beginning"
Message-ID: <20190217224011.16949-1-colin.king@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190217224011.4oiz62vqbvF8KRa4Jc7KzUWFk0BujJY7Qsxe0RFPpzQ@z>

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the message test of a TEST_ASSERT macro,
fix it.

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
2.20.1
