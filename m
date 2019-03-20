From: andreyknvl@google.com (Andrey Konovalov)
Date: Wed, 20 Mar 2019 15:51:32 +0100
Subject: [PATCH v13 18/20] tee/optee,
 arm64: untag user pointers in check_mem_type
In-Reply-To: <cover.1553093420.git.andreyknvl@google.com>
References: <cover.1553093420.git.andreyknvl@google.com>
Message-ID:
 <665632a911273ab537ded9acb78f4bafd91cbc19.1553093421.git.andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190320145132.K65huHvpyNPY3cWpy-D4uNcfpaYugtdPLJVEU4e4RwY@z>

This patch is a part of a series that extends arm64 kernel ABI to allow to
pass tagged user pointers (with the top byte set to something else other
than 0x00) as syscall arguments.

check_mem_type() uses provided user pointers for vma lookups (via
__check_mem_type()), which can only by done with untagged pointers.

Untag user pointers in this function.

Signed-off-by: Andrey Konovalov <andreyknvl at google.com>
---
 drivers/tee/optee/call.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.c
index a5afbe6dee68..e3be20264092 100644
--- a/drivers/tee/optee/call.c
+++ b/drivers/tee/optee/call.c
@@ -563,6 +563,7 @@ static int check_mem_type(unsigned long start, size_t num_pages)
 	int rc;
 
 	down_read(&mm->mmap_sem);
+	start = untagged_addr(start);
 	rc = __check_mem_type(find_vma(mm, start),
 			      start + num_pages * PAGE_SIZE);
 	up_read(&mm->mmap_sem);
-- 
2.21.0.225.g810b269d1ac-goog
