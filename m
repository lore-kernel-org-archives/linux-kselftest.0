From: alan.maguire@oracle.com (Alan Maguire)
Date: Mon,  1 Apr 2019 16:32:08 +0100
Subject: [PATCH bpf-next 1/4] selftests_bpf: extend test_tc_tunnel for UDP
 encap
In-Reply-To: <1554132731-3095-1-git-send-email-alan.maguire@oracle.com>
References: <1554132731-3095-1-git-send-email-alan.maguire@oracle.com>
Message-ID: <1554132731-3095-2-git-send-email-alan.maguire@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190401153208.YZGibuokBbuivKETLvgBIWwNogWzu1j7sZVjrfK4Ddg@z>

In

commit 868d523535c2 ("bpf: add bpf_skb_adjust_room encap flags")

...Willem introduced support to bpf_skb_adjust_room for GSO-friendly
GRE and UDP encapsulation and later introduced associated test_tc_tunnel
tests.  Here those tests are extended to cover UDP encapsulation also.

Signed-off-by: Alan Maguire <alan.maguire at oracle.com>
---
 tools/testing/selftests/bpf/progs/test_tc_tunnel.c | 149 ++++++++++++++-------
 tools/testing/selftests/bpf/test_tc_tunnel.sh      |  72 +++++++---
 2 files changed, 157 insertions(+), 64 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/test_tc_tunnel.c b/tools/testing/selftests/bpf/progs/test_tc_tunnel.c
index f541c2d..cc88379 100644
--- a/tools/testing/selftests/bpf/progs/test_tc_tunnel.c
+++ b/tools/testing/selftests/bpf/progs/test_tc_tunnel.c
@@ -12,6 +12,7 @@
 #include <linux/ip.h>
 #include <linux/ipv6.h>
 #include <linux/tcp.h>
+#include <linux/udp.h>
 #include <linux/pkt_cls.h>
 #include <linux/types.h>
 
@@ -20,16 +21,27 @@
 
 static const int cfg_port = 8000;
 
-struct grev4hdr {
-	struct iphdr ip;
+static const int cfg_udp_src = 20000;
+static const int cfg_udp_dst = 5555;
+
+struct gre_hdr {
 	__be16 flags;
 	__be16 protocol;
 } __attribute__((packed));
 
-struct grev6hdr {
+union l4hdr {
+	struct udphdr udp;
+	struct gre_hdr gre;
+};
+
+struct v4hdr {
+	struct iphdr ip;
+	union l4hdr l4hdr;
+} __attribute__((packed));
+
+struct v6hdr {
 	struct ipv6hdr ip;
-	__be16 flags;
-	__be16 protocol;
+	union l4hdr l4hdr;
 } __attribute__((packed));
 
 static __always_inline void set_ipv4_csum(struct iphdr *iph)
@@ -47,10 +59,11 @@ static __always_inline void set_ipv4_csum(struct iphdr *iph)
 	iph->check = ~((csum & 0xffff) + (csum >> 16));
 }
 
-static __always_inline int encap_ipv4(struct __sk_buff *skb, bool with_gre)
+static __always_inline int encap_ipv4(struct __sk_buff *skb, __u8 encap_proto)
 {
-	struct grev4hdr h_outer;
 	struct iphdr iph_inner;
+	struct v4hdr h_outer;
+	struct udphdr *udph;
 	struct tcphdr tcph;
 	__u64 flags;
 	int olen;
@@ -70,12 +83,29 @@ static __always_inline int encap_ipv4(struct __sk_buff *skb, bool with_gre)
 	if (tcph.dest != __bpf_constant_htons(cfg_port))
 		return TC_ACT_OK;
 
-	flags = BPF_F_ADJ_ROOM_FIXED_GSO | BPF_F_ADJ_ROOM_ENCAP_L3_IPV4;
-	if (with_gre) {
-		flags |= BPF_F_ADJ_ROOM_ENCAP_L4_GRE;
-		olen = sizeof(h_outer);
-	} else {
-		olen = sizeof(h_outer.ip);
+	olen = sizeof(h_outer.ip);
+
+	flags = BPF_F_ADJ_ROOM_ENCAP_L3_IPV4;
+	switch (encap_proto) {
+	case IPPROTO_GRE:
+		flags |= BPF_F_ADJ_ROOM_ENCAP_L4_GRE | BPF_F_ADJ_ROOM_FIXED_GSO;
+		olen += sizeof(h_outer.l4hdr.gre);
+		h_outer.l4hdr.gre.protocol = bpf_htons(ETH_P_IP);
+		h_outer.l4hdr.gre.flags = 0;
+		break;
+	case IPPROTO_UDP:
+		flags |= BPF_F_ADJ_ROOM_ENCAP_L4_UDP;
+		olen += sizeof(h_outer.l4hdr.udp);
+		h_outer.l4hdr.udp.source = __bpf_constant_htons(cfg_udp_src);
+		h_outer.l4hdr.udp.dest = __bpf_constant_htons(cfg_udp_dst);
+		h_outer.l4hdr.udp.check = 0;
+		h_outer.l4hdr.udp.len = bpf_htons(bpf_ntohs(iph_inner.tot_len) +
+						  sizeof(h_outer.l4hdr.udp));
+		break;
+	case IPPROTO_IPIP:
+		break;
+	default:
+		return TC_ACT_OK;
 	}
 
 	/* add room between mac and network header */
@@ -85,16 +115,10 @@ static __always_inline int encap_ipv4(struct __sk_buff *skb, bool with_gre)
 	/* prepare new outer network header */
 	h_outer.ip = iph_inner;
 	h_outer.ip.tot_len = bpf_htons(olen +
-				      bpf_htons(h_outer.ip.tot_len));
-	if (with_gre) {
-		h_outer.ip.protocol = IPPROTO_GRE;
-		h_outer.protocol = bpf_htons(ETH_P_IP);
-		h_outer.flags = 0;
-	} else {
-		h_outer.ip.protocol = IPPROTO_IPIP;
-	}
+				       bpf_htons(h_outer.ip.tot_len));
+	h_outer.ip.protocol = encap_proto;
 
-	set_ipv4_csum((void *)&h_outer.ip);
+	set_ipv4_csum(&h_outer.ip);
 
 	/* store new outer network header */
 	if (bpf_skb_store_bytes(skb, ETH_HLEN, &h_outer, olen,
@@ -104,11 +128,12 @@ static __always_inline int encap_ipv4(struct __sk_buff *skb, bool with_gre)
 	return TC_ACT_OK;
 }
 
-static __always_inline int encap_ipv6(struct __sk_buff *skb, bool with_gre)
+static __always_inline int encap_ipv6(struct __sk_buff *skb, __u8 encap_proto)
 {
 	struct ipv6hdr iph_inner;
-	struct grev6hdr h_outer;
+	struct v6hdr h_outer;
 	struct tcphdr tcph;
+	__u16 tot_len;
 	__u64 flags;
 	int olen;
 
@@ -124,14 +149,31 @@ static __always_inline int encap_ipv6(struct __sk_buff *skb, bool with_gre)
 	if (tcph.dest != __bpf_constant_htons(cfg_port))
 		return TC_ACT_OK;
 
-	flags = BPF_F_ADJ_ROOM_FIXED_GSO | BPF_F_ADJ_ROOM_ENCAP_L3_IPV6;
-	if (with_gre) {
-		flags |= BPF_F_ADJ_ROOM_ENCAP_L4_GRE;
-		olen = sizeof(h_outer);
-	} else {
-		olen = sizeof(h_outer.ip);
-	}
+	olen = sizeof(h_outer.ip);
 
+	flags = BPF_F_ADJ_ROOM_ENCAP_L3_IPV6;
+	switch (encap_proto) {
+	case IPPROTO_GRE:
+		flags |= BPF_F_ADJ_ROOM_ENCAP_L4_GRE | BPF_F_ADJ_ROOM_FIXED_GSO;
+		olen += sizeof(h_outer.l4hdr.gre);
+		h_outer.l4hdr.gre.protocol = bpf_htons(ETH_P_IPV6);
+		h_outer.l4hdr.gre.flags = 0;
+		break;
+	case IPPROTO_UDP:
+		flags |= BPF_F_ADJ_ROOM_ENCAP_L4_UDP;
+		olen += sizeof(h_outer.l4hdr.udp);
+		h_outer.l4hdr.udp.source = __bpf_constant_htons(cfg_udp_src);
+		h_outer.l4hdr.udp.dest = __bpf_constant_htons(cfg_udp_dst);
+		h_outer.l4hdr.udp.check = 0;
+		tot_len = bpf_ntohs(iph_inner.payload_len) + sizeof(iph_inner);
+		h_outer.l4hdr.udp.len = bpf_htons(tot_len +
+					sizeof(h_outer.l4hdr.udp));
+		break;
+	case IPPROTO_IPV6:
+		break;
+	default:
+		return TC_ACT_OK;
+	}
 
 	/* add room between mac and network header */
 	if (bpf_skb_adjust_room(skb, olen, BPF_ADJ_ROOM_MAC, flags))
@@ -141,13 +183,8 @@ static __always_inline int encap_ipv6(struct __sk_buff *skb, bool with_gre)
 	h_outer.ip = iph_inner;
 	h_outer.ip.payload_len = bpf_htons(olen +
 					   bpf_ntohs(h_outer.ip.payload_len));
-	if (with_gre) {
-		h_outer.ip.nexthdr = IPPROTO_GRE;
-		h_outer.protocol = bpf_htons(ETH_P_IPV6);
-		h_outer.flags = 0;
-	} else {
-		h_outer.ip.nexthdr = IPPROTO_IPV6;
-	}
+
+	h_outer.ip.nexthdr = encap_proto;
 
 	/* store new outer network header */
 	if (bpf_skb_store_bytes(skb, ETH_HLEN, &h_outer, olen,
@@ -161,7 +198,7 @@ static __always_inline int encap_ipv6(struct __sk_buff *skb, bool with_gre)
 int __encap_ipip(struct __sk_buff *skb)
 {
 	if (skb->protocol == __bpf_constant_htons(ETH_P_IP))
-		return encap_ipv4(skb, false);
+		return encap_ipv4(skb, IPPROTO_IPIP);
 	else
 		return TC_ACT_OK;
 }
@@ -170,7 +207,16 @@ int __encap_ipip(struct __sk_buff *skb)
 int __encap_gre(struct __sk_buff *skb)
 {
 	if (skb->protocol == __bpf_constant_htons(ETH_P_IP))
-		return encap_ipv4(skb, true);
+		return encap_ipv4(skb, IPPROTO_GRE);
+	else
+		return TC_ACT_OK;
+}
+
+SEC("encap_udp")
+int __encap_udp(struct __sk_buff *skb)
+{
+	if (skb->protocol == __bpf_constant_htons(ETH_P_IP))
+		return encap_ipv4(skb, IPPROTO_UDP);
 	else
 		return TC_ACT_OK;
 }
@@ -179,7 +225,7 @@ int __encap_gre(struct __sk_buff *skb)
 int __encap_ip6tnl(struct __sk_buff *skb)
 {
 	if (skb->protocol == __bpf_constant_htons(ETH_P_IPV6))
-		return encap_ipv6(skb, false);
+		return encap_ipv6(skb, IPPROTO_IPV6);
 	else
 		return TC_ACT_OK;
 }
@@ -188,23 +234,34 @@ int __encap_ip6tnl(struct __sk_buff *skb)
 int __encap_ip6gre(struct __sk_buff *skb)
 {
 	if (skb->protocol == __bpf_constant_htons(ETH_P_IPV6))
-		return encap_ipv6(skb, true);
+		return encap_ipv6(skb, IPPROTO_GRE);
+	else
+		return TC_ACT_OK;
+}
+
+SEC("encap_ip6udp")
+int __encap_ip6udp(struct __sk_buff *skb)
+{
+	if (skb->protocol == __bpf_constant_htons(ETH_P_IPV6))
+		return encap_ipv6(skb, IPPROTO_UDP);
 	else
 		return TC_ACT_OK;
 }
 
 static int decap_internal(struct __sk_buff *skb, int off, int len, char proto)
 {
-	char buf[sizeof(struct grev6hdr)];
-	int olen;
+	char buf[sizeof(struct v6hdr)];
+	int olen = len;
 
 	switch (proto) {
 	case IPPROTO_IPIP:
 	case IPPROTO_IPV6:
-		olen = len;
 		break;
 	case IPPROTO_GRE:
-		olen = len + 4 /* gre hdr */;
+		olen += sizeof(struct gre_hdr);
+		break;
+	case IPPROTO_UDP:
+		olen += sizeof(struct udphdr);
 		break;
 	default:
 		return TC_ACT_OK;
diff --git a/tools/testing/selftests/bpf/test_tc_tunnel.sh b/tools/testing/selftests/bpf/test_tc_tunnel.sh
index c805adb..3ae54f0 100755
--- a/tools/testing/selftests/bpf/test_tc_tunnel.sh
+++ b/tools/testing/selftests/bpf/test_tc_tunnel.sh
@@ -15,6 +15,9 @@ readonly ns2_v4=192.168.1.2
 readonly ns1_v6=fd::1
 readonly ns2_v6=fd::2
 
+# Must match port used by bpf program
+readonly udpport=5555
+
 readonly infile="$(mktemp)"
 readonly outfile="$(mktemp)"
 
@@ -103,6 +106,18 @@ if [[ "$#" -eq "0" ]]; then
 	echo "ip6 gre gso"
 	$0 ipv6 ip6gre 2000
 
+	echo "ip udp"
+	$0 ipv4 udp 100
+
+	echo "ip6 udp"
+	$0 ipv6 ip6udp 100
+
+	echo "ip udp gso"
+	$0 ipv4 udp 2000
+
+	echo "ip6 udp gso"
+        $0 ipv6 ip6udp 2000
+
 	echo "OK. All tests passed"
 	exit 0
 fi
@@ -117,12 +132,14 @@ case "$1" in
 "ipv4")
 	readonly addr1="${ns1_v4}"
 	readonly addr2="${ns2_v4}"
-	readonly netcat_opt=-4
+	readonly ipproto=4
+	readonly netcat_opt=-${ipproto}
 	;;
 "ipv6")
 	readonly addr1="${ns1_v6}"
 	readonly addr2="${ns2_v6}"
-	readonly netcat_opt=-6
+	readonly ipproto=6
+	readonly netcat_opt=-${ipproto}
 	;;
 *)
 	echo "unknown arg: $1"
@@ -158,27 +175,46 @@ server_listen
 # serverside, insert decap module
 # server is still running
 # client can connect again
-ip netns exec "${ns2}" ip link add dev testtun0 type "${tuntype}" \
-	remote "${addr1}" local "${addr2}"
-# Because packets are decapped by the tunnel they arrive on testtun0 from
-# the IP stack perspective.  Ensure reverse path filtering is disabled
-# otherwise we drop the TCP SYN as arriving on testtun0 instead of the
-# expected veth2 (veth2 is where 192.168.1.2 is configured).
-ip netns exec "${ns2}" sysctl -qw net.ipv4.conf.all.rp_filter=0
-# rp needs to be disabled for both all and testtun0 as the rp value is
-# selected as the max of the "all" and device-specific values.
-ip netns exec "${ns2}" sysctl -qw net.ipv4.conf.testtun0.rp_filter=0
-ip netns exec "${ns2}" ip link set dev testtun0 up
-echo "test bpf encap with tunnel device decap"
-client_connect
-verify_data
+
+# Skip tunnel tests for ip6udp.  For IPv6, a UDP checksum is required
+# and there seems to be no way to tell a fou6 tunnel to allow 0
+# checksums.  Accordingly for both these cases, we skip tests against
+# tunnel peer, and test encap using BPF decap only.
+if [[ "$tuntype" != "ip6udp" ]]; then
+	if [[ "$tuntype" == "udp" ]]; then
+		# Set up fou tunnel.
+		ttype=ipip
+		targs="encap fou encap-sport auto encap-dport $udpport"
+		# fou may be a module; allow this to fail.
+		modprobe fou ||true
+		ip netns exec "${ns2}" ip fou add port 5555 ipproto "${ipproto}"
+	else
+		ttype=$tuntype
+		targs=""
+	fi
+	ip netns exec "${ns2}" ip link add name testtun0 type "${ttype}" \
+		remote "${addr1}" local "${addr2}" $targs
+	# Because packets are decapped by the tunnel they arrive on testtun0
+	# from the IP stack perspective.  Ensure reverse path filtering is
+	# disabled otherwise we drop the TCP SYN as arriving on testtun0
+	# instead of the expected veth2 (veth2 is where 192.168.1.2 is
+	# configured).
+	ip netns exec "${ns2}" sysctl -qw net.ipv4.conf.all.rp_filter=0
+	# rp needs to be disabled for both all and testtun0 as the rp value is
+	# selected as the max of the "all" and device-specific values.
+	ip netns exec "${ns2}" sysctl -qw net.ipv4.conf.testtun0.rp_filter=0
+	ip netns exec "${ns2}" ip link set dev testtun0 up
+	echo "test bpf encap with tunnel device decap"
+	client_connect
+	verify_data
+	ip netns exec "${ns2}" ip link del dev testtun0
+	server_listen
+fi
 
 # serverside, use BPF for decap
-ip netns exec "${ns2}" ip link del dev testtun0
 ip netns exec "${ns2}" tc qdisc add dev veth2 clsact
 ip netns exec "${ns2}" tc filter add dev veth2 ingress \
 	bpf direct-action object-file ./test_tc_tunnel.o section decap
-server_listen
 echo "test bpf encap with bpf decap"
 client_connect
 verify_data
-- 
1.8.3.1
