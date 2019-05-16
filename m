From: mrostecki@opensuse.org (Michal Rostecki)
Date: Thu, 16 May 2019 13:20:58 +0200
Subject: [PATCH bpf-next 2/2] samples: bpf: Do not define bpf_printk macro
In-Reply-To: <20190516112105.12887-1-mrostecki@opensuse.org>
References: <20190516112105.12887-1-mrostecki@opensuse.org>
Message-ID: <20190516112105.12887-3-mrostecki@opensuse.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190516112058.Xex7QSuqivMeZi0KOF2i1cC-Ep8BdXxxzWqVv29NARg@z>

The bpf_printk macro was moved to bpf_helpers.h which is included in all
example programs.

Signed-off-by: Michal Rostecki <mrostecki at opensuse.org>
---
 samples/bpf/hbm_kern.h             | 12 +++---------
 samples/bpf/hbm_out_kern.c         |  2 ++
 samples/bpf/tcp_basertt_kern.c     |  7 -------
 samples/bpf/tcp_bufs_kern.c        |  7 -------
 samples/bpf/tcp_clamp_kern.c       |  7 -------
 samples/bpf/tcp_cong_kern.c        |  7 -------
 samples/bpf/tcp_iw_kern.c          |  7 -------
 samples/bpf/tcp_rwnd_kern.c        |  7 -------
 samples/bpf/tcp_synrto_kern.c      |  7 -------
 samples/bpf/tcp_tos_reflect_kern.c |  7 -------
 samples/bpf/xdp_sample_pkts_kern.c |  7 -------
 11 files changed, 5 insertions(+), 72 deletions(-)

diff --git a/samples/bpf/hbm_kern.h b/samples/bpf/hbm_kern.h
index c5635d924193..0ac6823abbb7 100644
--- a/samples/bpf/hbm_kern.h
+++ b/samples/bpf/hbm_kern.h
@@ -30,16 +30,8 @@
 #define ALLOW_PKT	1
 #define TCP_ECN_OK	1
 
+#ifndef HBM_DEBUG
 #define HBM_DEBUG 0  // Set to 1 to enable debugging
-#if HBM_DEBUG
-#define bpf_printk(fmt, ...)					\
-({								\
-	char ____fmt[] = fmt;					\
-	bpf_trace_printk(____fmt, sizeof(____fmt),		\
-			 ##__VA_ARGS__);			\
-})
-#else
-#define bpf_printk(fmt, ...)
 #endif
 
 #define INITIAL_CREDIT_PACKETS	100
@@ -102,7 +94,9 @@ static __always_inline void hbm_get_pkt_info(struct __sk_buff *skb,
 
 static __always_inline void hbm_init_vqueue(struct hbm_vqueue *qdp, int rate)
 {
+#if HBM_DEBUG
 		bpf_printk("Initializing queue_state, rate:%d\n", rate * 128);
+#endif
 		qdp->lasttime = bpf_ktime_get_ns();
 		qdp->credit = INIT_CREDIT;
 		qdp->rate = rate * 128;
diff --git a/samples/bpf/hbm_out_kern.c b/samples/bpf/hbm_out_kern.c
index f806863d0b79..4374583b4242 100644
--- a/samples/bpf/hbm_out_kern.c
+++ b/samples/bpf/hbm_out_kern.c
@@ -111,9 +111,11 @@ int _hbm_out_cg(struct __sk_buff *skb)
 	// Check if we should update rate
 	if (qsp != NULL && (qsp->rate * 128) != qdp->rate) {
 		qdp->rate = qsp->rate * 128;
+#if HBM_DEBUG
 		bpf_printk("Updating rate: %d (1sec:%llu bits)\n",
 			   (int)qdp->rate,
 			   CREDIT_PER_NS(1000000000, qdp->rate) * 8);
+#endif
 	}
 
 	// Set flags (drop, congestion, cwr)
diff --git a/samples/bpf/tcp_basertt_kern.c b/samples/bpf/tcp_basertt_kern.c
index 6ef1625e8b2c..9dba48c2b920 100644
--- a/samples/bpf/tcp_basertt_kern.c
+++ b/samples/bpf/tcp_basertt_kern.c
@@ -21,13 +21,6 @@
 
 #define DEBUG 1
 
-#define bpf_printk(fmt, ...)					\
-({								\
-	       char ____fmt[] = fmt;				\
-	       bpf_trace_printk(____fmt, sizeof(____fmt),	\
-				##__VA_ARGS__);			\
-})
-
 SEC("sockops")
 int bpf_basertt(struct bpf_sock_ops *skops)
 {
diff --git a/samples/bpf/tcp_bufs_kern.c b/samples/bpf/tcp_bufs_kern.c
index e03e204739fa..af8486f33771 100644
--- a/samples/bpf/tcp_bufs_kern.c
+++ b/samples/bpf/tcp_bufs_kern.c
@@ -22,13 +22,6 @@
 
 #define DEBUG 1
 
-#define bpf_printk(fmt, ...)					\
-({								\
-	       char ____fmt[] = fmt;				\
-	       bpf_trace_printk(____fmt, sizeof(____fmt),	\
-				##__VA_ARGS__);			\
-})
-
 SEC("sockops")
 int bpf_bufs(struct bpf_sock_ops *skops)
 {
diff --git a/samples/bpf/tcp_clamp_kern.c b/samples/bpf/tcp_clamp_kern.c
index a0dc2d254aca..26c0fd091f3c 100644
--- a/samples/bpf/tcp_clamp_kern.c
+++ b/samples/bpf/tcp_clamp_kern.c
@@ -22,13 +22,6 @@
 
 #define DEBUG 1
 
-#define bpf_printk(fmt, ...)					\
-({								\
-	       char ____fmt[] = fmt;				\
-	       bpf_trace_printk(____fmt, sizeof(____fmt),	\
-				##__VA_ARGS__);			\
-})
-
 SEC("sockops")
 int bpf_clamp(struct bpf_sock_ops *skops)
 {
diff --git a/samples/bpf/tcp_cong_kern.c b/samples/bpf/tcp_cong_kern.c
index 4fd3ca979a06..6d4dc4c7dd1e 100644
--- a/samples/bpf/tcp_cong_kern.c
+++ b/samples/bpf/tcp_cong_kern.c
@@ -21,13 +21,6 @@
 
 #define DEBUG 1
 
-#define bpf_printk(fmt, ...)					\
-({								\
-	       char ____fmt[] = fmt;				\
-	       bpf_trace_printk(____fmt, sizeof(____fmt),	\
-				##__VA_ARGS__);			\
-})
-
 SEC("sockops")
 int bpf_cong(struct bpf_sock_ops *skops)
 {
diff --git a/samples/bpf/tcp_iw_kern.c b/samples/bpf/tcp_iw_kern.c
index 9b139ec69560..da61d53378b3 100644
--- a/samples/bpf/tcp_iw_kern.c
+++ b/samples/bpf/tcp_iw_kern.c
@@ -22,13 +22,6 @@
 
 #define DEBUG 1
 
-#define bpf_printk(fmt, ...)					\
-({								\
-	       char ____fmt[] = fmt;				\
-	       bpf_trace_printk(____fmt, sizeof(____fmt),	\
-				##__VA_ARGS__);			\
-})
-
 SEC("sockops")
 int bpf_iw(struct bpf_sock_ops *skops)
 {
diff --git a/samples/bpf/tcp_rwnd_kern.c b/samples/bpf/tcp_rwnd_kern.c
index cc71ee96e044..d011e38b80d2 100644
--- a/samples/bpf/tcp_rwnd_kern.c
+++ b/samples/bpf/tcp_rwnd_kern.c
@@ -21,13 +21,6 @@
 
 #define DEBUG 1
 
-#define bpf_printk(fmt, ...)					\
-({								\
-	       char ____fmt[] = fmt;				\
-	       bpf_trace_printk(____fmt, sizeof(____fmt),	\
-				##__VA_ARGS__);			\
-})
-
 SEC("sockops")
 int bpf_rwnd(struct bpf_sock_ops *skops)
 {
diff --git a/samples/bpf/tcp_synrto_kern.c b/samples/bpf/tcp_synrto_kern.c
index ca87ed34f896..720d1950322d 100644
--- a/samples/bpf/tcp_synrto_kern.c
+++ b/samples/bpf/tcp_synrto_kern.c
@@ -21,13 +21,6 @@
 
 #define DEBUG 1
 
-#define bpf_printk(fmt, ...)					\
-({								\
-	       char ____fmt[] = fmt;				\
-	       bpf_trace_printk(____fmt, sizeof(____fmt),	\
-				##__VA_ARGS__);			\
-})
-
 SEC("sockops")
 int bpf_synrto(struct bpf_sock_ops *skops)
 {
diff --git a/samples/bpf/tcp_tos_reflect_kern.c b/samples/bpf/tcp_tos_reflect_kern.c
index de788be6f862..369faca70a15 100644
--- a/samples/bpf/tcp_tos_reflect_kern.c
+++ b/samples/bpf/tcp_tos_reflect_kern.c
@@ -20,13 +20,6 @@
 
 #define DEBUG 1
 
-#define bpf_printk(fmt, ...)					\
-({								\
-	       char ____fmt[] = fmt;				\
-	       bpf_trace_printk(____fmt, sizeof(____fmt),	\
-				##__VA_ARGS__);			\
-})
-
 SEC("sockops")
 int bpf_basertt(struct bpf_sock_ops *skops)
 {
diff --git a/samples/bpf/xdp_sample_pkts_kern.c b/samples/bpf/xdp_sample_pkts_kern.c
index f7ca8b850978..6c7c7e0aaeda 100644
--- a/samples/bpf/xdp_sample_pkts_kern.c
+++ b/samples/bpf/xdp_sample_pkts_kern.c
@@ -7,13 +7,6 @@
 #define SAMPLE_SIZE 64ul
 #define MAX_CPUS 128
 
-#define bpf_printk(fmt, ...)					\
-({								\
-	       char ____fmt[] = fmt;				\
-	       bpf_trace_printk(____fmt, sizeof(____fmt),	\
-				##__VA_ARGS__);			\
-})
-
 struct bpf_map_def SEC("maps") my_map = {
 	.type = BPF_MAP_TYPE_PERF_EVENT_ARRAY,
 	.key_size = sizeof(int),
-- 
2.21.0
