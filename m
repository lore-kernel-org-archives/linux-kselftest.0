From: colin.king@canonical.com (Colin King)
Date: Thu, 22 Nov 2018 10:13:45 +0000
Subject: [PATCH][next] tools/bpf: fix spelling mistake "memeory" -> "memory"
Message-ID: <20181122101345.16271-1-colin.king@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181122101345.iR3-V7LRcgN2mEbxk8vHHKhVvGPu4Jgk3YAUR08HqFM@z>

From: Colin Ian King <colin.king@canonical.com>

The CHECK message contains a spelling mistake, fix it.

Signed-off-by: Colin Ian King <colin.king at canonical.com>
---
 tools/testing/selftests/bpf/test_btf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/test_btf.c b/tools/testing/selftests/bpf/test_btf.c
index 7b1b160d6e67..bcbda7037840 100644
--- a/tools/testing/selftests/bpf/test_btf.c
+++ b/tools/testing/selftests/bpf/test_btf.c
@@ -2573,7 +2573,7 @@ static int do_test_file(unsigned int test_num)
 	}
 
 	func_info = malloc(info.func_info_cnt * rec_size);
-	if (CHECK(!func_info, "out of memeory")) {
+	if (CHECK(!func_info, "out of memory")) {
 		err = -1;
 		goto done;
 	}
@@ -3299,7 +3299,7 @@ static int do_test_func_type(int test_num)
 	}
 
 	func_info = malloc(info.func_info_cnt * rec_size);
-	if (CHECK(!func_info, "out of memeory")) {
+	if (CHECK(!func_info, "out of memory")) {
 		err = -1;
 		goto done;
 	}
-- 
2.19.1
