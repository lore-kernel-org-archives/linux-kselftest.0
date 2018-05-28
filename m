From: bhole_prashant_q7 at lab.ntt.co.jp (Prashant Bhole)
Date: Mon, 28 May 2018 13:38:03 +0900
Subject: [PATCH bpf v2 5/5] selftests/bpf: test_sockmap,
 print additional test options
In-Reply-To: <20180528043803.4824-1-bhole_prashant_q7@lab.ntt.co.jp>
References: <20180528043803.4824-1-bhole_prashant_q7@lab.ntt.co.jp>
Message-ID: <20180528043803.4824-6-bhole_prashant_q7@lab.ntt.co.jp>

Print values of test options like apply, cork, start, end so that
individual failed tests can be identified for manual run

Acked-by: John Fastabend <john.fastabend at gmail.com>
Signed-off-by: Prashant Bhole <bhole_prashant_q7 at lab.ntt.co.jp>
---
 tools/testing/selftests/bpf/test_sockmap.c | 28 +++++++++++++++-------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/bpf/test_sockmap.c b/tools/testing/selftests/bpf/test_sockmap.c
index e8faf4596dac..7970d48c4acb 100644
--- a/tools/testing/selftests/bpf/test_sockmap.c
+++ b/tools/testing/selftests/bpf/test_sockmap.c
@@ -869,6 +869,8 @@ static char *test_to_str(int test)
 #define OPTSTRING 60
 static void test_options(char *options)
 {
+	char tstr[OPTSTRING];
+
 	memset(options, 0, OPTSTRING);
 
 	if (txmsg_pass)
@@ -881,14 +883,22 @@ static void test_options(char *options)
 		strncat(options, "redir_noisy,", OPTSTRING);
 	if (txmsg_drop)
 		strncat(options, "drop,", OPTSTRING);
-	if (txmsg_apply)
-		strncat(options, "apply,", OPTSTRING);
-	if (txmsg_cork)
-		strncat(options, "cork,", OPTSTRING);
-	if (txmsg_start)
-		strncat(options, "start,", OPTSTRING);
-	if (txmsg_end)
-		strncat(options, "end,", OPTSTRING);
+	if (txmsg_apply) {
+		snprintf(tstr, OPTSTRING, "apply %d,", txmsg_apply);
+		strncat(options, tstr, OPTSTRING);
+	}
+	if (txmsg_cork) {
+		snprintf(tstr, OPTSTRING, "cork %d,", txmsg_cork);
+		strncat(options, tstr, OPTSTRING);
+	}
+	if (txmsg_start) {
+		snprintf(tstr, OPTSTRING, "start %d,", txmsg_start);
+		strncat(options, tstr, OPTSTRING);
+	}
+	if (txmsg_end) {
+		snprintf(tstr, OPTSTRING, "end %d,", txmsg_end);
+		strncat(options, tstr, OPTSTRING);
+	}
 	if (txmsg_ingress)
 		strncat(options, "ingress,", OPTSTRING);
 	if (txmsg_skb)
@@ -897,7 +907,7 @@ static void test_options(char *options)
 
 static int __test_exec(int cgrp, int test, struct sockmap_options *opt)
 {
-	char *options = calloc(60, sizeof(char));
+	char *options = calloc(OPTSTRING, sizeof(char));
 	int err;
 
 	if (test == SENDPAGE)
-- 
2.17.0


--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
