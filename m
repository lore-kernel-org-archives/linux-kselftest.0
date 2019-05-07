From: alakesh.haloi at gmail.com (Alakesh Haloi)
Date: Tue, 7 May 2019 23:12:24 +0000
Subject: [PATCH] selftests/bpf: Fix compile warning in bpf selftest
Message-ID: <20190507231224.GA3787@ip-172-31-29-54.us-west-2.compute.internal>

This fixes the following compile time warning

flow_dissector_load.c: In function ‘detach_program’:
flow_dissector_load.c:55:19: warning: format not a string literal and no format arguments [-Wformat-security]
   error(1, errno, command);
                   ^~~~~~~
Signed-off-by: Alakesh Haloi <alakesh.haloi at gmail.com>
---
 tools/testing/selftests/bpf/flow_dissector_load.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/flow_dissector_load.c b/tools/testing/selftests/bpf/flow_dissector_load.c
index 77cafa66d048..7136ab9ffa73 100644
--- a/tools/testing/selftests/bpf/flow_dissector_load.c
+++ b/tools/testing/selftests/bpf/flow_dissector_load.c
@@ -52,7 +52,7 @@ static void detach_program(void)
 	sprintf(command, "rm -r %s", cfg_pin_path);
 	ret = system(command);
 	if (ret)
-		error(1, errno, command);
+		error(1, errno, "%s", command);
 }
 
 static void parse_opts(int argc, char **argv)
-- 
2.17.1
