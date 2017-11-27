From: arnd@arndb.de (Arnd Bergmann)
Date: Mon, 27 Nov 2017 17:19:25 +0100
Subject: [Linux-kselftest-mirror] [PATCH 2/2] [RFC] packet: experimental
	support for 64-bit timestamps
In-Reply-To: <20171127162001.4055813-1-arnd@arndb.de>
References: <20171127162001.4055813-1-arnd@arndb.de>
Message-ID: <20171127162001.4055813-2-arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20171127161925.GAuUXHJovuA479gJiLf3uPhgxPjoJee8hZA7n9W_G34@z>

I tried to figure out what it would take to do a version 4 mmap packet
socket interface to completely avoid the y2106 overflow problem. This is
what I came up with, reusing most of the v3 code, except for the parts
where we access the timestamps.

For kselftest, I'm adding support for testing v4 in addition to v1-v3,
but the test currently does not look at the timestamps, so it won't
check that the timestamp format actually works as intended, only that
I didn't break the parts that worked in the v3 selftest.

Overall, this is more of a mess than I expected, so it's probably not
worth doing a v4 format just for the timestamp, but the patch can serve
as a reference for anyone that needs a new format for other reasons and
fixes this along with the other changes.

Signed-off-by: Arnd Bergmann <arnd at arndb.de>
---
Untested and rather invasive, so don't apply this part without
discussion and testing
---
 include/uapi/linux/if_packet.h              |  24 +++++-
 net/packet/af_packet.c                      | 115 ++++++++++++++++++++--------
 tools/testing/selftests/net/psock_tpacket.c |  65 +++++++++-------
 3 files changed, 142 insertions(+), 62 deletions(-)

diff --git a/include/uapi/linux/if_packet.h b/include/uapi/linux/if_packet.h
index 67b61d91d89b..c2cf29acdd40 100644
--- a/include/uapi/linux/if_packet.h
+++ b/include/uapi/linux/if_packet.h
@@ -177,8 +177,27 @@ struct tpacket3_hdr {
 	__u8		tp_padding[8];
 };
 
+struct tpacket4_hdr {
+	__u32		tp_next_offset;
+	__u32		tp_nsec_hi;
+	__u32		tp_nsec_lo;
+	__u32		tp_snaplen;
+	__u32		tp_len;
+	__u32		tp_status;
+	__u16		tp_mac;
+	__u16		tp_net;
+	/* pkt_hdr variants */
+	union {
+		struct tpacket_hdr_variant1 hv1;
+	};
+	__u8		tp_padding[8];
+};
+
 struct tpacket_bd_ts {
-	unsigned int ts_sec;
+	union {
+		unsigned int ts_nsec_hi;
+		unsigned int ts_sec;
+	};
 	union {
 		unsigned int ts_usec;
 		unsigned int ts_nsec;
@@ -250,7 +269,8 @@ struct tpacket_block_desc {
 enum tpacket_versions {
 	TPACKET_V1,
 	TPACKET_V2,
-	TPACKET_V3
+	TPACKET_V3,
+	TPACKET_V4,
 };
 
 /*
diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
index 7432c6699818..34a07e4a93a5 100644
--- a/net/packet/af_packet.c
+++ b/net/packet/af_packet.c
@@ -164,6 +164,7 @@ union tpacket_uhdr {
 	struct tpacket_hdr  *h1;
 	struct tpacket2_hdr *h2;
 	struct tpacket3_hdr *h3;
+	struct tpacket4_hdr *h4;
 	void *raw;
 };
 
@@ -200,7 +201,7 @@ static void prb_retire_current_block(struct tpacket_kbdq_core *,
 		struct packet_sock *, unsigned int status);
 static int prb_queue_frozen(struct tpacket_kbdq_core *);
 static void prb_open_block(struct tpacket_kbdq_core *,
-		struct tpacket_block_desc *);
+		struct tpacket_block_desc *, struct packet_sock *po);
 static void prb_retire_rx_blk_timer_expired(struct timer_list *);
 static void _prb_refresh_rx_retire_blk_timer(struct tpacket_kbdq_core *);
 static void prb_fill_rxhash(struct tpacket_kbdq_core *, struct tpacket3_hdr *);
@@ -404,6 +405,7 @@ static void __packet_set_status(struct packet_sock *po, void *frame, int status)
 		flush_dcache_page(pgv_to_page(&h.h2->tp_status));
 		break;
 	case TPACKET_V3:
+	case TPACKET_V4:
 		h.h3->tp_status = status;
 		flush_dcache_page(pgv_to_page(&h.h3->tp_status));
 		break;
@@ -430,6 +432,7 @@ static int __packet_get_status(struct packet_sock *po, void *frame)
 		flush_dcache_page(pgv_to_page(&h.h2->tp_status));
 		return h.h2->tp_status;
 	case TPACKET_V3:
+	case TPACKET_V4:
 		flush_dcache_page(pgv_to_page(&h.h3->tp_status));
 		return h.h3->tp_status;
 	default:
@@ -439,17 +442,17 @@ static int __packet_get_status(struct packet_sock *po, void *frame)
 	}
 }
 
-static __u32 tpacket_get_timestamp(struct sk_buff *skb, struct timespec64 *ts,
+static __u32 tpacket_get_timestamp(struct sk_buff *skb, s64 *stamp,
 				   unsigned int flags)
 {
 	struct skb_shared_hwtstamps *shhwtstamps = skb_hwtstamps(skb);
 
 	if (shhwtstamps &&
 	    (flags & SOF_TIMESTAMPING_RAW_HARDWARE) &&
-	    ktime_to_timespec64_cond(shhwtstamps->hwtstamp, ts))
+	    (*stamp = ktime_to_ns(shhwtstamps->hwtstamp)))
 		return TP_STATUS_TS_RAW_HARDWARE;
 
-	if (ktime_to_timespec64_cond(skb->tstamp, ts))
+	if ((*stamp = ktime_to_ns(skb->tstamp)))
 		return TP_STATUS_TS_SOFTWARE;
 
 	return 0;
@@ -460,19 +463,15 @@ static __u32 __packet_set_timestamp(struct packet_sock *po, void *frame,
 {
 	union tpacket_uhdr h;
 	struct timespec64 ts;
+	s64 stamp;
 	__u32 ts_status;
 
-	if (!(ts_status = tpacket_get_timestamp(skb, &ts, po->tp_tstamp)))
+	if (!(ts_status = tpacket_get_timestamp(skb, &stamp, po->tp_tstamp)))
 		return 0;
 
 	h.raw = frame;
-	/*
-	 * versions 1 through 3 overflow the timestamps in y2106, since they
-	 * all store the seconds in a 32-bit unsigned integer.
-	 * If we create a version 4, that should have a 64-bit timestamp,
-	 * either 64-bit seconds + 32-bit nanoseconds, or just 64-bit
-	 * nanoseconds.
-	 */
+
+	ts = ns_to_timespec64(stamp);
 	switch (po->tp_version) {
 	case TPACKET_V1:
 		h.h1->tp_sec = ts.tv_sec;
@@ -486,6 +485,9 @@ static __u32 __packet_set_timestamp(struct packet_sock *po, void *frame,
 		h.h3->tp_sec = ts.tv_sec;
 		h.h3->tp_nsec = ts.tv_nsec;
 		break;
+	case TPACKET_V4:
+		h.h4->tp_nsec_hi = upper_32_bits(stamp);
+		h.h4->tp_nsec_lo = lower_32_bits(stamp);
 	default:
 		WARN(1, "TPACKET version not supported.\n");
 		BUG();
@@ -633,7 +635,7 @@ static void init_prb_bdqc(struct packet_sock *po,
 	p1->max_frame_len = p1->kblk_size - BLK_PLUS_PRIV(p1->blk_sizeof_priv);
 	prb_init_ft_ops(p1, req_u);
 	prb_setup_retire_blk_timer(po);
-	prb_open_block(p1, pbd);
+	prb_open_block(p1, pbd, po);
 }
 
 /*  Do NOT update the last_blk_num first.
@@ -730,7 +732,7 @@ static void prb_retire_rx_blk_timer_expired(struct timer_list *t)
 				* opening a block thaws the queue,restarts timer
 				* Thawing/timer-refresh is a side effect.
 				*/
-				prb_open_block(pkc, pbd);
+				prb_open_block(pkc, pbd, po);
 				goto out;
 			}
 		}
@@ -792,30 +794,43 @@ static void prb_close_block(struct tpacket_kbdq_core *pkc1,
 {
 	__u32 status = TP_STATUS_USER | stat;
 
-	struct tpacket3_hdr *last_pkt;
+	struct tpacket3_hdr *last_pkt_v3;
+	struct tpacket4_hdr *last_pkt_v4;
 	struct tpacket_hdr_v1 *h1 = &pbd1->hdr.bh1;
 	struct sock *sk = &po->sk;
 
 	if (po->stats.stats3.tp_drops)
 		status |= TP_STATUS_LOSING;
 
-	last_pkt = (struct tpacket3_hdr *)pkc1->prev;
-	last_pkt->tp_next_offset = 0;
+	last_pkt_v3 = (struct tpacket3_hdr *)pkc1->prev;
+	last_pkt_v4 = (struct tpacket4_hdr *)pkc1->prev;
+	last_pkt_v3->tp_next_offset = 0;
 
 	/* Get the ts of the last pkt */
 	if (BLOCK_NUM_PKTS(pbd1)) {
-		h1->ts_last_pkt.ts_sec = last_pkt->tp_sec;
-		h1->ts_last_pkt.ts_nsec	= last_pkt->tp_nsec;
+		if (po->tp_version == TPACKET_V3) {
+			h1->ts_last_pkt.ts_sec = last_pkt_v3->tp_sec;
+			h1->ts_last_pkt.ts_nsec	= last_pkt_v3->tp_nsec;
+		} else {
+			h1->ts_last_pkt.ts_nsec_hi = last_pkt_v4->tp_nsec_hi;
+			h1->ts_last_pkt.ts_nsec	= last_pkt_v4->tp_nsec_lo;
+		}
 	} else {
 		/* Ok, we tmo'd - so get the current time.
 		 *
 		 * It shouldn't really happen as we don't close empty
 		 * blocks. See prb_retire_rx_blk_timer_expired().
 		 */
-		struct timespec64 ts;
-		ktime_get_real_ts64(&ts);
-		h1->ts_last_pkt.ts_sec = ts.tv_sec;
-		h1->ts_last_pkt.ts_nsec	= ts.tv_nsec;
+		if (po->tp_version == TPACKET_V3) {
+			struct timespec64 ts;
+			ktime_get_real_ts64(&ts);
+			h1->ts_last_pkt.ts_sec = ts.tv_sec;
+			h1->ts_last_pkt.ts_nsec	= ts.tv_nsec;
+		} else {
+			u64 ns = ktime_get_real_ns();
+			h1->ts_last_pkt.ts_nsec_hi = upper_32_bits(ns);
+			h1->ts_last_pkt.ts_nsec = lower_32_bits(ns);
+		}
 	}
 
 	smp_wmb();
@@ -841,9 +856,8 @@ static void prb_thaw_queue(struct tpacket_kbdq_core *pkc)
  *
  */
 static void prb_open_block(struct tpacket_kbdq_core *pkc1,
-	struct tpacket_block_desc *pbd1)
+	struct tpacket_block_desc *pbd1, struct packet_sock *po)
 {
-	struct timespec64 ts;
 	struct tpacket_hdr_v1 *h1 = &pbd1->hdr.bh1;
 
 	smp_rmb();
@@ -856,10 +870,19 @@ static void prb_open_block(struct tpacket_kbdq_core *pkc1,
 	BLOCK_NUM_PKTS(pbd1) = 0;
 	BLOCK_LEN(pbd1) = BLK_PLUS_PRIV(pkc1->blk_sizeof_priv);
 
-	ktime_get_real_ts64(&ts);
 
-	h1->ts_first_pkt.ts_sec = ts.tv_sec;
-	h1->ts_first_pkt.ts_nsec = ts.tv_nsec;
+	if (po->tp_version == TPACKET_V3) {
+		struct timespec64 ts;
+
+		ktime_get_real_ts64(&ts);
+		h1->ts_first_pkt.ts_sec = ts.tv_sec;
+		h1->ts_first_pkt.ts_nsec = ts.tv_nsec;
+	} else {
+		s64 ns = ktime_get_real_ns();
+
+		h1->ts_first_pkt.ts_nsec_hi = upper_32_bits(ns);
+		h1->ts_first_pkt.ts_nsec = lower_32_bits(ns);
+	}
 
 	pkc1->pkblk_start = (char *)pbd1;
 	pkc1->nxt_offset = pkc1->pkblk_start + BLK_PLUS_PRIV(pkc1->blk_sizeof_priv);
@@ -936,7 +959,7 @@ static void *prb_dispatch_next_block(struct tpacket_kbdq_core *pkc,
 	 * open this block and return the offset where the first packet
 	 * needs to get stored.
 	 */
-	prb_open_block(pkc, pbd);
+	prb_open_block(pkc, pbd, po);
 	return (void *)pkc->nxt_offset;
 }
 
@@ -1068,7 +1091,7 @@ static void *__packet_lookup_frame_in_block(struct packet_sock *po,
 			 * opening a block also thaws the queue.
 			 * Thawing is a side effect.
 			 */
-			prb_open_block(pkc, pbd);
+			prb_open_block(pkc, pbd, po);
 		}
 	}
 
@@ -1113,6 +1136,7 @@ static void *packet_current_rx_frame(struct packet_sock *po,
 					po->rx_ring.head, status);
 		return curr;
 	case TPACKET_V3:
+	case TPACKET_V4:
 		return __packet_lookup_frame_in_block(po, skb, status, len);
 	default:
 		WARN(1, "TPACKET version not supported\n");
@@ -1171,6 +1195,7 @@ static void packet_increment_rx_head(struct packet_sock *po,
 	case TPACKET_V2:
 		return packet_increment_head(rb);
 	case TPACKET_V3:
+	case TPACKET_V4:
 	default:
 		WARN(1, "TPACKET version not supported.\n");
 		BUG();
@@ -1279,7 +1304,7 @@ static int __packet_rcv_has_room(struct packet_sock *po, struct sk_buff *skb)
 			return ROOM_NONE;
 	}
 
-	if (po->tp_version == TPACKET_V3) {
+	if (po->tp_version == TPACKET_V3 || po->tp_version == TPACKET_V4) {
 		if (__tpacket_v3_has_room(po, ROOM_POW_OFF))
 			ret = ROOM_NORMAL;
 		else if (__tpacket_v3_has_room(po, 0))
@@ -2192,6 +2217,7 @@ static int tpacket_rcv(struct sk_buff *skb, struct net_device *dev,
 	unsigned short macoff, netoff, hdrlen;
 	struct sk_buff *copy_skb = NULL;
 	struct timespec64 ts;
+	u64 ns;
 	__u32 ts_status;
 	bool is_drop_n_account = false;
 	bool do_vnet = false;
@@ -2318,7 +2344,9 @@ static int tpacket_rcv(struct sk_buff *skb, struct net_device *dev,
 
 	skb_copy_bits(skb, 0, h.raw + macoff, snaplen);
 
-	if (!(ts_status = tpacket_get_timestamp(skb, &ts, po->tp_tstamp)))
+	if ((ts_status = tpacket_get_timestamp(skb, &ns, po->tp_tstamp)))
+		ts = ns_to_timespec64(ns);
+	else
 		ktime_get_real_ts64(&ts);
 
 	status |= ts_status;
@@ -2365,6 +2393,19 @@ static int tpacket_rcv(struct sk_buff *skb, struct net_device *dev,
 		memset(h.h3->tp_padding, 0, sizeof(h.h3->tp_padding));
 		hdrlen = sizeof(*h.h3);
 		break;
+	case TPACKET_V4:
+		/* identical to v3, except for the timestamp */
+		h.h4->tp_status |= status;
+		h.h4->tp_len = skb->len;
+		h.h4->tp_snaplen = snaplen;
+		h.h4->tp_mac = macoff;
+		h.h4->tp_net = netoff;
+		ns = timespec64_to_ns(&ts);
+		h.h4->tp_nsec_hi = upper_32_bits(ns);
+		h.h4->tp_nsec_lo = lower_32_bits(ns);
+		memset(h.h3->tp_padding, 0, sizeof(h.h3->tp_padding));
+		hdrlen = sizeof(*h.h3);
+		break;
 	default:
 		BUG();
 	}
@@ -2570,6 +2611,7 @@ static int tpacket_parse_header(struct packet_sock *po, void *frame,
 	ph.raw = frame;
 
 	switch (po->tp_version) {
+	case TPACKET_V4:
 	case TPACKET_V3:
 		if (ph.h3->tp_next_offset != 0) {
 			pr_warn_once("variable sized slot not supported");
@@ -2596,6 +2638,7 @@ static int tpacket_parse_header(struct packet_sock *po, void *frame,
 		off_max = po->tx_ring.frame_size - tp_len;
 		if (po->sk.sk_type == SOCK_DGRAM) {
 			switch (po->tp_version) {
+			case TPACKET_V4:
 			case TPACKET_V3:
 				off = ph.h3->tp_net;
 				break;
@@ -2608,6 +2651,7 @@ static int tpacket_parse_header(struct packet_sock *po, void *frame,
 			}
 		} else {
 			switch (po->tp_version) {
+			case TPACKET_V4:
 			case TPACKET_V3:
 				off = ph.h3->tp_mac;
 				break;
@@ -3658,6 +3702,7 @@ packet_setsockopt(struct socket *sock, int level, int optname, char __user *optv
 			len = sizeof(req_u.req);
 			break;
 		case TPACKET_V3:
+		case TPACKET_V4:
 		default:
 			len = sizeof(req_u.req3);
 			break;
@@ -3693,6 +3738,7 @@ packet_setsockopt(struct socket *sock, int level, int optname, char __user *optv
 		case TPACKET_V1:
 		case TPACKET_V2:
 		case TPACKET_V3:
+		case TPACKET_V4:
 			break;
 		default:
 			return -EINVAL;
@@ -3868,7 +3914,7 @@ static int packet_getsockopt(struct socket *sock, int level, int optname,
 		memset(&po->stats, 0, sizeof(po->stats));
 		spin_unlock_bh(&sk->sk_receive_queue.lock);
 
-		if (po->tp_version == TPACKET_V3) {
+		if (po->tp_version == TPACKET_V3 || po->tp_version == TPACKET_V4) {
 			lv = sizeof(struct tpacket_stats_v3);
 			st.stats3.tp_packets += st.stats3.tp_drops;
 			data = &st.stats3;
@@ -3906,6 +3952,7 @@ static int packet_getsockopt(struct socket *sock, int level, int optname,
 			val = sizeof(struct tpacket2_hdr);
 			break;
 		case TPACKET_V3:
+		case TPACKET_V4:
 			val = sizeof(struct tpacket3_hdr);
 			break;
 		default:
@@ -4250,6 +4297,7 @@ static int packet_set_ring(struct sock *sk, union tpacket_req_u *req_u,
 			po->tp_hdrlen = TPACKET2_HDRLEN;
 			break;
 		case TPACKET_V3:
+		case TPACKET_V4:
 			po->tp_hdrlen = TPACKET3_HDRLEN;
 			break;
 		}
@@ -4284,6 +4332,7 @@ static int packet_set_ring(struct sock *sk, union tpacket_req_u *req_u,
 		if (unlikely(!pg_vec))
 			goto out;
 		switch (po->tp_version) {
+		case TPACKET_V4:
 		case TPACKET_V3:
 			/* Block transmit is not supported yet */
 			if (!tx_ring) {
diff --git a/tools/testing/selftests/net/psock_tpacket.c b/tools/testing/selftests/net/psock_tpacket.c
index 7f6cd9fdacf3..b497632b6a70 100644
--- a/tools/testing/selftests/net/psock_tpacket.c
+++ b/tools/testing/selftests/net/psock_tpacket.c
@@ -3,7 +3,8 @@
  * Author: Daniel Borkmann <dborkman at redhat.com>
  *         Chetan Loke <loke.chetan at gmail.com> (TPACKET_V3 usage example)
  *
- * A basic test of packet socket's TPACKET_V1/TPACKET_V2/TPACKET_V3 behavior.
+ * A basic test of packet socket's TPACKET_V1/TPACKET_V2/TPACKET_V3/TPACKET_V4
+ * behavior.
  *
  * Control:
  *   Test the setup of the TPACKET socket with different patterns that are
@@ -19,6 +20,7 @@
  *   - TPACKET_V1: RX_RING, TX_RING
  *   - TPACKET_V2: RX_RING, TX_RING
  *   - TPACKET_V3: RX_RING
+ *   - TPACKET_V4: RX_RING
  *
  * License (GPLv2):
  *
@@ -310,12 +312,12 @@ static inline void __v2_tx_user_ready(struct tpacket2_hdr *hdr)
 	__sync_synchronize();
 }
 
-static inline int __v3_tx_kernel_ready(struct tpacket3_hdr *hdr)
+static inline int __v3_v4_tx_kernel_ready(struct tpacket3_hdr *hdr)
 {
 	return !(hdr->tp_status & (TP_STATUS_SEND_REQUEST | TP_STATUS_SENDING));
 }
 
-static inline void __v3_tx_user_ready(struct tpacket3_hdr *hdr)
+static inline void __v3_v4_tx_user_ready(struct tpacket3_hdr *hdr)
 {
 	hdr->tp_status = TP_STATUS_SEND_REQUEST;
 	__sync_synchronize();
@@ -329,7 +331,8 @@ static inline int __tx_kernel_ready(void *base, int version)
 	case TPACKET_V2:
 		return __v2_tx_kernel_ready(base);
 	case TPACKET_V3:
-		return __v3_tx_kernel_ready(base);
+	case TPACKET_V4:
+		return __v3_v4_tx_kernel_ready(base);
 	default:
 		bug_on(1);
 		return 0;
@@ -346,7 +349,8 @@ static inline void __tx_user_ready(void *base, int version)
 		__v2_tx_user_ready(base);
 		break;
 	case TPACKET_V3:
-		__v3_tx_user_ready(base);
+	case TPACKET_V4:
+		__v3_v4_tx_user_ready(base);
 		break;
 	}
 }
@@ -372,6 +376,7 @@ static inline void *get_next_frame(struct ring *ring, int n)
 	case TPACKET_V2:
 		return ring->rd[n].iov_base;
 	case TPACKET_V3:
+	case TPACKET_V4:
 		return f0 + (n * ring->req3.tp_frame_size);
 	default:
 		bug_on(1);
@@ -454,7 +459,8 @@ static void walk_tx(int sock, struct ring *ring)
 				       packet_len);
 				total_bytes += ppd.v2->tp_h.tp_snaplen;
 				break;
-			case TPACKET_V3: {
+			case TPACKET_V3:
+			case TPACKET_V4: {
 				struct tpacket3_hdr *tx = next;
 
 				tx->tp_snaplen = packet_len;
@@ -517,22 +523,22 @@ static void walk_v1_v2(int sock, struct ring *ring)
 		walk_tx(sock, ring);
 }
 
-static uint64_t __v3_prev_block_seq_num = 0;
+static uint64_t __v3_v4_prev_block_seq_num = 0;
 
-void __v3_test_block_seq_num(struct block_desc *pbd)
+void __v3_v4_test_block_seq_num(struct block_desc *pbd)
 {
-	if (__v3_prev_block_seq_num + 1 != pbd->h1.seq_num) {
+	if (__v3_v4_prev_block_seq_num + 1 != pbd->h1.seq_num) {
 		fprintf(stderr, "\nprev_block_seq_num:%"PRIu64", expected "
 			"seq:%"PRIu64" != actual seq:%"PRIu64"\n",
-			__v3_prev_block_seq_num, __v3_prev_block_seq_num + 1,
+			__v3_v4_prev_block_seq_num, __v3_v4_prev_block_seq_num + 1,
 			(uint64_t) pbd->h1.seq_num);
 		exit(1);
 	}
 
-	__v3_prev_block_seq_num = pbd->h1.seq_num;
+	__v3_v4_prev_block_seq_num = pbd->h1.seq_num;
 }
 
-static void __v3_test_block_len(struct block_desc *pbd, uint32_t bytes, int block_num)
+static void __v3_v4_test_block_len(struct block_desc *pbd, uint32_t bytes, int block_num)
 {
 	if (pbd->h1.num_pkts && bytes != pbd->h1.blk_len) {
 		fprintf(stderr, "\nblock:%u with %upackets, expected "
@@ -542,23 +548,23 @@ static void __v3_test_block_len(struct block_desc *pbd, uint32_t bytes, int bloc
 	}
 }
 
-static void __v3_test_block_header(struct block_desc *pbd, const int block_num)
+static void __v3_v4_test_block_header(struct block_desc *pbd, const int block_num)
 {
 	if ((pbd->h1.block_status & TP_STATUS_USER) == 0) {
 		fprintf(stderr, "\nblock %u: not in TP_STATUS_USER\n", block_num);
 		exit(1);
 	}
 
-	__v3_test_block_seq_num(pbd);
+	__v3_v4_test_block_seq_num(pbd);
 }
 
-static void __v3_walk_block(struct block_desc *pbd, const int block_num)
+static void __v3_v4_walk_block(struct block_desc *pbd, const int block_num)
 {
 	int num_pkts = pbd->h1.num_pkts, i;
 	unsigned long bytes = 0, bytes_with_padding = ALIGN_8(sizeof(*pbd));
 	struct tpacket3_hdr *ppd;
 
-	__v3_test_block_header(pbd, block_num);
+	__v3_v4_test_block_header(pbd, block_num);
 
 	ppd = (struct tpacket3_hdr *) ((uint8_t *) pbd +
 				       pbd->h1.offset_to_first_pkt);
@@ -580,17 +586,17 @@ static void __v3_walk_block(struct block_desc *pbd, const int block_num)
 		__sync_synchronize();
 	}
 
-	__v3_test_block_len(pbd, bytes_with_padding, block_num);
+	__v3_v4_test_block_len(pbd, bytes_with_padding, block_num);
 	total_bytes += bytes;
 }
 
-void __v3_flush_block(struct block_desc *pbd)
+void __v3_v4_flush_block(struct block_desc *pbd)
 {
 	pbd->h1.block_status = TP_STATUS_KERNEL;
 	__sync_synchronize();
 }
 
-static void walk_v3_rx(int sock, struct ring *ring)
+static void walk_v3_v4_rx(int sock, struct ring *ring)
 {
 	unsigned int block_num = 0;
 	struct pollfd pfd;
@@ -614,8 +620,8 @@ static void walk_v3_rx(int sock, struct ring *ring)
 		while ((pbd->h1.block_status & TP_STATUS_USER) == 0)
 			poll(&pfd, 1, 1);
 
-		__v3_walk_block(pbd, block_num);
-		__v3_flush_block(pbd);
+		__v3_v4_walk_block(pbd, block_num);
+		__v3_v4_flush_block(pbd);
 
 		block_num = (block_num + 1) % ring->rd_num;
 	}
@@ -623,7 +629,7 @@ static void walk_v3_rx(int sock, struct ring *ring)
 	pair_udp_close(udp_sock);
 
 	if (total_packets != 2 * NUM_PACKETS) {
-		fprintf(stderr, "walk_v3_rx: received %u out of %u pkts\n",
+		fprintf(stderr, "walk_v3_v4_rx: received %u out of %u pkts\n",
 			total_packets, NUM_PACKETS);
 		exit(1);
 	}
@@ -631,10 +637,10 @@ static void walk_v3_rx(int sock, struct ring *ring)
 	fprintf(stderr, " %u pkts (%u bytes)", NUM_PACKETS, total_bytes >> 1);
 }
 
-static void walk_v3(int sock, struct ring *ring)
+static void walk_v3_v4(int sock, struct ring *ring)
 {
 	if (ring->type == PACKET_RX_RING)
-		walk_v3_rx(sock, ring);
+		walk_v3_v4_rx(sock, ring);
 	else
 		walk_tx(sock, ring);
 }
@@ -655,7 +661,7 @@ static void __v1_v2_fill(struct ring *ring, unsigned int blocks)
 	ring->flen = ring->req.tp_frame_size;
 }
 
-static void __v3_fill(struct ring *ring, unsigned int blocks, int type)
+static void __v3_v4_fill(struct ring *ring, unsigned int blocks, int type)
 {
 	if (type == PACKET_RX_RING) {
 		ring->req3.tp_retire_blk_tov = 64;
@@ -671,7 +677,7 @@ static void __v3_fill(struct ring *ring, unsigned int blocks, int type)
 				 ring->req3.tp_block_nr;
 
 	ring->mm_len = ring->req3.tp_block_size * ring->req3.tp_block_nr;
-	ring->walk = walk_v3;
+	ring->walk = walk_v3_v4;
 	ring->rd_num = ring->req3.tp_block_nr;
 	ring->flen = ring->req3.tp_block_size;
 }
@@ -695,7 +701,8 @@ static void setup_ring(int sock, struct ring *ring, int version, int type)
 		break;
 
 	case TPACKET_V3:
-		__v3_fill(ring, blocks, type);
+	case TPACKET_V4:
+		__v3_v4_fill(ring, blocks, type);
 		ret = setsockopt(sock, SOL_PACKET, type, &ring->req3,
 				 sizeof(ring->req3));
 		break;
@@ -804,6 +811,7 @@ static const char *tpacket_str[] = {
 	[TPACKET_V1] = "TPACKET_V1",
 	[TPACKET_V2] = "TPACKET_V2",
 	[TPACKET_V3] = "TPACKET_V3",
+	[TPACKET_V4] = "TPACKET_V4",
 };
 
 static const char *type_str[] = {
@@ -854,6 +862,9 @@ int main(void)
 	ret |= test_tpacket(TPACKET_V3, PACKET_RX_RING);
 	ret |= test_tpacket(TPACKET_V3, PACKET_TX_RING);
 
+	ret |= test_tpacket(TPACKET_V4, PACKET_RX_RING);
+	ret |= test_tpacket(TPACKET_V4, PACKET_TX_RING);
+
 	if (ret)
 		return 1;
 
-- 
2.9.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
