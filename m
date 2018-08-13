From: colin.king at canonical.com (Colin King)
Date: Mon, 13 Aug 2018 15:00:32 +0100
Subject: [PATCH][bpf-next] bpf: test: fix spelling mistake "REUSEEPORT" ->
 "REUSEPORT"
Message-ID: <20180813140032.2208-1-colin.king@canonical.com>

From: Colin Ian King <colin.king at canonical.com>

Trivial fix to spelling mistake in error message

Signed-off-by: Colin Ian King <colin.king at canonical.com>
---
 tools/testing/selftests/bpf/test_maps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/test_maps.c b/tools/testing/selftests/bpf/test_maps.c
index 4b7c74f5faa7..6f54f84144a0 100644
--- a/tools/testing/selftests/bpf/test_maps.c
+++ b/tools/testing/selftests/bpf/test_maps.c
@@ -1191,7 +1191,7 @@ static void prepare_reuseport_grp(int type, int map_fd,
 
 		err = setsockopt(fd64, SOL_SOCKET, SO_REUSEPORT,
 				 &optval, sizeof(optval));
-		CHECK(err == -1, "setsockopt(SO_REUSEEPORT)",
+		CHECK(err == -1, "setsockopt(SO_REUSEPORT)",
 		      "err:%d errno:%d\n", err, errno);
 
 		/* reuseport_array does not allow unbound sk */
-- 
2.17.1
