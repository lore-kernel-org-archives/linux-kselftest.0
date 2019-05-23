From: mrostecki@opensuse.org (Michal Rostecki)
Date: Thu, 23 May 2019 14:53:54 +0200
Subject: [PATCH bpf-next v2 RESEND 1/2] selftests: bpf: Move bpf_printk to
 bpf_helpers.h
In-Reply-To: <20190523125355.18437-1-mrostecki@opensuse.org>
References: <20190523125355.18437-1-mrostecki@opensuse.org>
Message-ID: <20190523125355.18437-2-mrostecki@opensuse.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190523125354.WAR9-YWFAb_2pkwaTvjRjyaeWyAPXFkkCHtgSqbGOf0@z>

bpf_printk is a macro which is commonly used to print out debug messages
in BPF programs and it was copied in many selftests and samples. Since
all of them include bpf_helpers.h, this change moves the macro there.

Signed-off-by: Michal Rostecki <mrostecki at opensuse.org>
---
 tools/testing/selftests/bpf/bpf_helpers.h                | 8 ++++++++
 tools/testing/selftests/bpf/progs/sockmap_parse_prog.c   | 7 -------
 tools/testing/selftests/bpf/progs/sockmap_tcp_msg_prog.c | 7 -------
 tools/testing/selftests/bpf/progs/sockmap_verdict_prog.c | 7 -------
 tools/testing/selftests/bpf/progs/test_lwt_seg6local.c   | 7 -------
 tools/testing/selftests/bpf/progs/test_xdp_noinline.c    | 7 -------
 tools/testing/selftests/bpf/test_sockmap_kern.h          | 7 -------
 7 files changed, 8 insertions(+), 42 deletions(-)

diff --git a/tools/testing/selftests/bpf/bpf_helpers.h b/tools/testing/selftests/bpf/bpf_helpers.h
index 5f6f9e7aba2a..4b27840b8109 100644
--- a/tools/testing/selftests/bpf/bpf_helpers.h
+++ b/tools/testing/selftests/bpf/bpf_helpers.h
@@ -8,6 +8,14 @@
  */
 #define SEC(NAME) __attribute__((section(NAME), used))
 
+/* helper macro to print out debug messages */
+#define bpf_printk(fmt, ...)				\
+({							\
+	char ____fmt[] = fmt;				\
+	bpf_trace_printk(____fmt, sizeof(____fmt),	\
+			 ##__VA_ARGS__);		\
+})
+
 /* helper functions called from eBPF programs written in C */
 static void *(*bpf_map_lookup_elem)(void *map, const void *key) =
 	(void *) BPF_FUNC_map_lookup_elem;
diff --git a/tools/testing/selftests/bpf/progs/sockmap_parse_prog.c b/tools/testing/selftests/bpf/progs/sockmap_parse_prog.c
index 0f92858f6226..ed3e4a551c57 100644
--- a/tools/testing/selftests/bpf/progs/sockmap_parse_prog.c
+++ b/tools/testing/selftests/bpf/progs/sockmap_parse_prog.c
@@ -5,13 +5,6 @@
 
 int _version SEC("version") = 1;
 
-#define bpf_printk(fmt, ...)					\
-({								\
-	       char ____fmt[] = fmt;				\
-	       bpf_trace_printk(____fmt, sizeof(____fmt),	\
-				##__VA_ARGS__);			\
-})
-
 SEC("sk_skb1")
 int bpf_prog1(struct __sk_buff *skb)
 {
diff --git a/tools/testing/selftests/bpf/progs/sockmap_tcp_msg_prog.c b/tools/testing/selftests/bpf/progs/sockmap_tcp_msg_prog.c
index 12a7b5c82ed6..65fbfdb6cd3a 100644
--- a/tools/testing/selftests/bpf/progs/sockmap_tcp_msg_prog.c
+++ b/tools/testing/selftests/bpf/progs/sockmap_tcp_msg_prog.c
@@ -5,13 +5,6 @@
 
 int _version SEC("version") = 1;
 
-#define bpf_printk(fmt, ...)					\
-({								\
-	       char ____fmt[] = fmt;				\
-	       bpf_trace_printk(____fmt, sizeof(____fmt),	\
-				##__VA_ARGS__);			\
-})
-
 SEC("sk_msg1")
 int bpf_prog1(struct sk_msg_md *msg)
 {
diff --git a/tools/testing/selftests/bpf/progs/sockmap_verdict_prog.c b/tools/testing/selftests/bpf/progs/sockmap_verdict_prog.c
index 2ce7634a4012..bdc22be46f2e 100644
--- a/tools/testing/selftests/bpf/progs/sockmap_verdict_prog.c
+++ b/tools/testing/selftests/bpf/progs/sockmap_verdict_prog.c
@@ -5,13 +5,6 @@
 
 int _version SEC("version") = 1;
 
-#define bpf_printk(fmt, ...)					\
-({								\
-	       char ____fmt[] = fmt;				\
-	       bpf_trace_printk(____fmt, sizeof(____fmt),	\
-				##__VA_ARGS__);			\
-})
-
 struct bpf_map_def SEC("maps") sock_map_rx = {
 	.type = BPF_MAP_TYPE_SOCKMAP,
 	.key_size = sizeof(int),
diff --git a/tools/testing/selftests/bpf/progs/test_lwt_seg6local.c b/tools/testing/selftests/bpf/progs/test_lwt_seg6local.c
index 0575751bc1bc..7c7cb3177463 100644
--- a/tools/testing/selftests/bpf/progs/test_lwt_seg6local.c
+++ b/tools/testing/selftests/bpf/progs/test_lwt_seg6local.c
@@ -6,13 +6,6 @@
 #include "bpf_helpers.h"
 #include "bpf_endian.h"
 
-#define bpf_printk(fmt, ...)				\
-({							\
-	char ____fmt[] = fmt;				\
-	bpf_trace_printk(____fmt, sizeof(____fmt),	\
-			##__VA_ARGS__);			\
-})
-
 /* Packet parsing state machine helpers. */
 #define cursor_advance(_cursor, _len) \
 	({ void *_tmp = _cursor; _cursor += _len; _tmp; })
diff --git a/tools/testing/selftests/bpf/progs/test_xdp_noinline.c b/tools/testing/selftests/bpf/progs/test_xdp_noinline.c
index 5e4aac74f9d0..4fe6aaad22a4 100644
--- a/tools/testing/selftests/bpf/progs/test_xdp_noinline.c
+++ b/tools/testing/selftests/bpf/progs/test_xdp_noinline.c
@@ -15,13 +15,6 @@
 #include <linux/udp.h>
 #include "bpf_helpers.h"
 
-#define bpf_printk(fmt, ...)				\
-({							\
-	char ____fmt[] = fmt;				\
-	bpf_trace_printk(____fmt, sizeof(____fmt),	\
-			##__VA_ARGS__);			\
-})
-
 static __u32 rol32(__u32 word, unsigned int shift)
 {
 	return (word << shift) | (word >> ((-shift) & 31));
diff --git a/tools/testing/selftests/bpf/test_sockmap_kern.h b/tools/testing/selftests/bpf/test_sockmap_kern.h
index e7639f66a941..4e7d3da21357 100644
--- a/tools/testing/selftests/bpf/test_sockmap_kern.h
+++ b/tools/testing/selftests/bpf/test_sockmap_kern.h
@@ -28,13 +28,6 @@
  * are established and verdicts are decided.
  */
 
-#define bpf_printk(fmt, ...)					\
-({								\
-	       char ____fmt[] = fmt;				\
-	       bpf_trace_printk(____fmt, sizeof(____fmt),	\
-				##__VA_ARGS__);			\
-})
-
 struct bpf_map_def SEC("maps") sock_map = {
 	.type = TEST_MAP_TYPE,
 	.key_size = sizeof(int),
-- 
2.21.0
