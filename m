Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557623E0C66
	for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 06:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792216816; cv=pass; b=sqpZt9HpZLf4Jie9Ntjt0MTtk9DlKlHayx3nDRURh2mHOVTYRSTuHuFSudMStIDQCzJX2FHQAsjITEv0qp+ZuCdxljuvlpezd7H/kJ202MI7VfdsopJvTpm9lX45Z7tKlpqhWbLFlOhmMhTJ7XkcSvl423iXqeptdbD3nNxzQqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792216816; c=relaxed/simple;
	bh=bkvh1i5FG37o5A9ttSAH20Uqm6CK5XS7/r4HenKlm/A=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ZEdjGPAVFc9HmQCtOHJ0Xq5x+22JRR3ZBbbvOWw5wqYmBY2DvOcMLPhhizHBCrlD7xP/oq7EEoCjWv9baXv7pW4GnUP1dcMvT0u1Gx8fd2D9lC2yuuaUgmMiRhKin/KVHr8IwgiYMcRieBlwbMSKHM84f9dXRTOwG4jk1LMXqJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iwFZKsYJ; arc=pass smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iwFZKsYJ"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91054f537ccso48506d6.1
        for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 23:00:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792216814; cv=none;
        d=google.com; s=arc-20260327;
        b=BW+NZjZwmxGZrGaMvTn8vfzQzwf8qYJwAeENmEzpZib4mny6XWerfawjavcJ3x0mTY
         d3HATan7aygkOOLn7VVWely0XqcnqQ08XLuSH3lF2hxWLTVw66MLUO8jh6QdqoIUdg7u
         em3ereoNMnzpOIvI49ye5ddTqwbO5KlQyLPe1Hom0osPlW+B037kB/qLxU48UbMWvz03
         L4GU+oXdesIyk1l1Y9ojMw0PcrC9yn5o5CZFEBWjLee9jXM9jJTJbyJDVTsAEI6vUfIo
         xmFnhWD2GJYbLlRia/+JjgOsYeVI5KXOTQuEzwenvlut848JpzuOP91dYM9RGxU6Aijj
         S8kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=63A2I3xSyjrdJxbGENFhY9IuJPK1dZ8nnNSKYaZbcvw=;
        fh=SjO9IQIv+ehXFUtiuCMlG2xwXNygVR0NBY1qGN3ajAg=;
        b=Zh+eqSadj3ys8NI0jLed0gH8xUNWdgOPI6ufiBk6dffsHmtmYTW+W+GK0qLqOEtMh4
         adKLLsL8v9W5oOQ9NfY3WP5xdo6n1XXRJu6MEctpZedIy1J5xvR3KyvmzAJH67lLnNx1
         BZ+uZ0jYmg1VOzKiUTQSnarXjQ+9eaR/VLm4AiB9Zf8C9lXiiulqoUVPShs399DPYEbz
         sy2Rsf/Dti5bNfy0ZJEp5/3x6x3jpOA5ydYO0aikSuIQ1aOfM9toZmuzvaWBV1neRjnn
         kzEAAb8gL4DU4OZ5wiIv2TNNIl86fpp7+b60OFi+7sskngZsA4360Jnq/Tovmo12OeMc
         aICw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792216814; x=1792821614; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=63A2I3xSyjrdJxbGENFhY9IuJPK1dZ8nnNSKYaZbcvw=;
        b=iwFZKsYJSqfa9yjYYaMqOh3X61zJiymVq108vbwUjBQ6HRvMtBX7trHNh9ana+yxjQ
         QyTkADWb6SEMDnPqrdqHLfXTyElG+OG7ITvtrowp8944uzdeHhPPqYV0aW+BfdM/cx/V
         LFVhR3eSQj/Gwtr1juXIcI7Z+1N7eltsxAhuvumaydmI7/REdbnoCCPrB1gvZDmRN/k2
         jmtJpSys8ew/6u2BP5K27vJFLpXbqubv2gKisUlOMhg61TrJEst4kCNlaktWBalE1Ajj
         d5gDFtHiPwSeIJWmJpIXjLs6snj7HZIclUbI9vT/vXlroxE83NDcwPqbwFR4tn8tRT2b
         64yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792216814; x=1792821614;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=63A2I3xSyjrdJxbGENFhY9IuJPK1dZ8nnNSKYaZbcvw=;
        b=A6KXvzgv4eTT0FWu7nWKdHaWw03TGkhSZnrYLU+nl6ZQ6cvxKADDlZqHSlHO2ANOJC
         XtoteIQN89I9iv5I8fEEJlgcArfgR4+LKFFF20buRzr3qlDHakqkrYz53Q1I5eefF50C
         nqyWwoXZeuNfuq+YBtwCBHQ1AIkbOxG7SzqM4cJ5H6f1M93272QMmumzl/ZZpyAle1pk
         Vh3tD5Cy6Dwy5xn/HaMrIqQqprkZTyGlwrApTeQrRTi46fvaEq1UImSxWpa2FGvZr27d
         iMtP/AmiXdRx5J6ZMDl9F83ZxoeMtkiUiCt7Z2DzqwpFO3DvVQED5pI459uS61EXGHWO
         HiBA==
X-Gm-Message-State: AFq9FYLof53/ugzay84zLY4LEPppCNYaQlzwnl6/TEkXRwqcbQ/0pKoW
	pAPgZWnkmXi0IuE1Wcws8o8Rx35lqH80Z4dPHxLx8mN9HMq1FIdszSoRdFvtDqgPathaKcblW+x
	RSEPC3QHkwNrQ5I8myYTHp+GZCYWYThE=
X-Gm-Gg: AYBFou11ny1d8YWp08nx5BYf48wY/Diz5WqT+2QO9QT7kqpRRBdX2fdVSPlkaoswQV0
	d63BCHSenPFerYgquIxExtMGA1UTIEmy1G46mSqBV3V3cKxCixMTpuk89ceX5uEFkjLr7RfaJIL
	q3GhE+rqjgLCDCMBpbdVApC4vBYiGSav8lC9wi24FMbrN+Ov5xTsk+Q9axT8C3QZe/71B5DXUl5
	zmVS7Kz4k0z+rmlqjFB+FfOI+QioeDJaGI8z/3SGdOiW9+77Y/WNjy5brH2EcQwapiRMmL8vdcO
	iEk9nBRa1OiP1kHW/MvzwPw2cod8YgXJSy4JuVQcym5trZPhQoSYbIyDrgm7yPmRtCmY99coO43
	h01ImdBfc/GOPZdJSTsIyuKlsbbgUlxV2dIUuSnEG03M5DmOPZl7uWf4l8n39fciTnk0e+DeSzT
	BLmnbKSrvmLDR2F4AEfBaGn9wEoeIITRBIkqIqppAIEoAx3tQSkMtAS5Biz0lpY4DTF8w+OiSkU
	vdddzApKS401cevSFybBVk/
X-Received: by 2002:a05:6214:b69:b0:91b:d948:c415 with SMTP id
 6a1803df08f44-91bdf17d414mr36514556d6.44.1792216813780; Fri, 16 Oct 2026
 23:00:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Megane Hebo <hebomegane@gmail.com>
Date: Sat, 17 Oct 2026 15:00:02 +0900
X-Gm-Features: AclHuK_sX1uqxVMBR6hp7esLRZ_VlhANEBWvmp_0y_cBfyPLvu2acqyIrbaKGgs
Message-ID: <CAJPVW+=XcHDV4aoXt5oAHYh49kX7m5wUxf7TucrcBy+q6MdXFA@mail.gmail.com>
Subject: [RFC PATCH net-next] selftests: net: exercise virtio checksum ingress outcomes
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, 
	mst@redhat.com, virtualization@lists.linux.dev, 
	willemdebruijn.kernel@gmail.com, habte.yibelo@gmail.com, jasowangio@gmail.com, 
	eperezma@redhat.com, xuanzhuo@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"

The virtio checksum hardening series gives virtio_net_hdr_to_skb()
three outcomes for VIRTIO_NET_HDR_F_NEEDS_CSUM: known-good partial
checksum metadata is retained, uncommon non-GSO metadata is resolved
in software at ingress, and GSO metadata that cannot be resolved safely
is rejected.

Add focused TUN tests for these three outcomes. Keep the packet shape
otherwise identical (IPv4/UDP, no encapsulation), so each test changes
only the metadata needed to select a different branch.

For the software-resolution case, verify the rx_csum_sw ethtool counter
added by the hardening series. A recognized partial checksum must not
increment it. An uncommon non-GSO checksum must increment it once. A
GSO/protocol mismatch must be rejected without incrementing it.

These are contract tests for ingress normalization: packet semantics
must be made consistent before later protocol processing observes the
packet.

This is intended as a follow-up to [PATCH net-next v2 0/7]
"more virtio-net csum hardening".

Signed-off-by: Kiyotaka Tonegawa <hebomegane@gmail.com>
---
Testing:
- applied on current upstream master after Michael's v2 0/7 series
- built tools/testing/selftests/net/tun with the normal YNL dependencies
- runtime against a kernel containing v2: not run

 tools/testing/selftests/net/tun.c | 160 ++++++++++++++++++++++++++++++
 1 file changed, 160 insertions(+)

diff --git a/tools/testing/selftests/net/tun.c
b/tools/testing/selftests/net/tun.c
index afaa81c..8775315 100644
--- a/tools/testing/selftests/net/tun.c
+++ b/tools/testing/selftests/net/tun.c
@@ -8,7 +8,9 @@
 #include <stdlib.h>
 #include <string.h>
 #include <unistd.h>
+#include <linux/ethtool.h>
 #include <linux/if_tun.h>
+#include <linux/sockios.h>
 #include <netinet/tcp.h>
 #include <sys/ioctl.h>
 #include <sys/socket.h>
@@ -543,6 +545,76 @@ TEST_F(tun, reattach_close_delete)
        EXPECT_EQ(tun_delete(self->ifname), 0);
 }

+static int tun_get_stat(const char *ifname, const char *name, uint64_t *value)
+{
+       struct ethtool_drvinfo drvinfo = { .cmd = ETHTOOL_GDRVINFO };
+       struct ethtool_gstrings *strings = NULL;
+       struct ethtool_stats *stats = NULL;
+       struct ifreq ifr = {};
+       unsigned int i;
+       int fd, ret;
+
+       fd = socket(AF_INET, SOCK_DGRAM, 0);
+       if (fd < 0)
+               return -errno;
+
+       strncpy(ifr.ifr_name, ifname, IFNAMSIZ - 1);
+       ifr.ifr_data = (void *)&drvinfo;
+       if (ioctl(fd, SIOCETHTOOL, &ifr) < 0) {
+               ret = -errno;
+               goto out;
+       }
+
+       if (!drvinfo.n_stats) {
+               ret = -ENOENT;
+               goto out;
+       }
+
+       strings = calloc(1, sizeof(*strings) +
+                        drvinfo.n_stats * ETH_GSTRING_LEN);
+       stats = calloc(1, sizeof(*stats) +
+                      drvinfo.n_stats * sizeof(stats->data[0]));
+       if (!strings || !stats) {
+               ret = -ENOMEM;
+               goto out;
+       }
+
+       strings->cmd = ETHTOOL_GSTRINGS;
+       strings->string_set = ETH_SS_STATS;
+       strings->len = drvinfo.n_stats;
+       ifr.ifr_data = (void *)strings;
+       if (ioctl(fd, SIOCETHTOOL, &ifr) < 0) {
+               ret = -errno;
+               goto out;
+       }
+
+       stats->cmd = ETHTOOL_GSTATS;
+       stats->n_stats = drvinfo.n_stats;
+       ifr.ifr_data = (void *)stats;
+       if (ioctl(fd, SIOCETHTOOL, &ifr) < 0) {
+               ret = -errno;
+               goto out;
+       }
+
+       ret = -ENOENT;
+       for (i = 0; i < drvinfo.n_stats; i++) {
+               const char *stat_name =
+                       (const char *)&strings->data[i * ETH_GSTRING_LEN];
+
+               if (!strncmp(stat_name, name, ETH_GSTRING_LEN)) {
+                       *value = stats->data[i];
+                       ret = 0;
+                       break;
+               }
+       }
+
+out:
+       free(stats);
+       free(strings);
+       close(fd);
+       return ret;
+}
+
 FIXTURE(tun_vnet_gso)
 {
        char ifname[IFNAMSIZ];
@@ -611,6 +683,35 @@ static int build_vlan_tcpv4_gso_packet(uint8_t
*buf, int payload_len)
        return cur - buf;
 }

+static int build_ipv4_udp_partial_packet(uint8_t *buf, int payload_len,
+                                        uint8_t gso_type,
+                                        uint16_t csum_offset)
+{
+       uint8_t *cur = buf + sizeof(struct virtio_net_hdr);
+       struct virtio_net_hdr vh = { 0 };
+
+       cur += build_eth(cur, ETH_P_IP, param_hwaddr_outer_src,
+                        param_hwaddr_outer_dst);
+       cur += build_ipv4_header(cur, IPPROTO_UDP,
+                                sizeof(struct udphdr) + payload_len,
+                                &param_ipaddr4_outer_src,
+                                &param_ipaddr4_outer_dst);
+       cur += build_udp_packet(cur, UDP_SRC_PORT, UDP_DST_PORT,
+                               payload_len, AF_INET, true);
+
+       vh.flags = VIRTIO_NET_HDR_F_NEEDS_CSUM;
+       vh.hdr_len = ETH_HLEN + sizeof(struct iphdr) + sizeof(struct udphdr);
+       vh.csum_start = ETH_HLEN + sizeof(struct iphdr);
+       vh.csum_offset = csum_offset;
+       vh.gso_type = gso_type;
+       if (gso_type != VIRTIO_NET_HDR_GSO_NONE)
+               vh.gso_size = 64;
+
+       memcpy(buf, &vh, sizeof(vh));
+
+       return cur - buf;
+}
+
 TEST_F(tun_vnet_gso, vlan_tcpv4_gso_no_csum)
 {
        struct virtio_net_hdr vh;
@@ -678,6 +779,65 @@ TEST_F(tun_vnet_gso, vlan_tcpv4_gso_no_csum_64k)
        ASSERT_EQ(ret, len);
 }

+TEST_F(tun_vnet_gso, csum_partial_known_good)
+{
+       uint8_t pkt[512] = { 0 };
+       uint64_t before, after;
+       int len, ret;
+
+       ASSERT_EQ(tun_get_stat(self->ifname, "rx_csum_sw", &before), 0);
+
+       len = build_ipv4_udp_partial_packet(pkt, 128,
+                                           VIRTIO_NET_HDR_GSO_NONE,
+                                           __builtin_offsetof(struct
udphdr, check));
+       ret = write(self->fd, pkt, len);
+       ASSERT_EQ(ret, len);
+
+       ASSERT_EQ(tun_get_stat(self->ifname, "rx_csum_sw", &after), 0);
+       EXPECT_EQ(after, before);
+}
+
+TEST_F(tun_vnet_gso, csum_partial_uncommon_resolved)
+{
+       uint8_t pkt[512] = { 0 };
+       uint64_t before, after;
+       int len, ret;
+
+       ASSERT_EQ(tun_get_stat(self->ifname, "rx_csum_sw", &before), 0);
+
+       len = build_ipv4_udp_partial_packet(pkt, 128,
+                                           VIRTIO_NET_HDR_GSO_NONE,
+                                           __builtin_offsetof(struct
udphdr, source));
+       ret = write(self->fd, pkt, len);
+       ASSERT_EQ(ret, len);
+
+       ASSERT_EQ(tun_get_stat(self->ifname, "rx_csum_sw", &after), 0);
+       EXPECT_EQ(after, before + 1);
+}
+
+TEST_F(tun_vnet_gso, csum_partial_gso_protocol_mismatch_rejected)
+{
+       uint8_t pkt[512] = { 0 };
+       uint64_t before, after;
+       int len, ret;
+
+       ASSERT_EQ(tun_get_stat(self->ifname, "rx_csum_sw", &before), 0);
+
+       /* The checksum field is a valid UDP checksum field, but the
+        * virtio header claims TCPv4 GSO. GSO cannot be resolved as an
+        * arbitrary checksum write, so the ingress contract rejects it.
+        */
+       len = build_ipv4_udp_partial_packet(pkt, 256,
+                                           VIRTIO_NET_HDR_GSO_TCPV4,
+                                           __builtin_offsetof(struct
udphdr, check));
+       ret = write(self->fd, pkt, len);
+       ASSERT_EQ(ret, -1);
+       ASSERT_EQ(errno, EINVAL);
+
+       ASSERT_EQ(tun_get_stat(self->ifname, "rx_csum_sw", &after), 0);
+       EXPECT_EQ(after, before);
+}
+
 FIXTURE(tun_vnet_udptnl)
 {
        char ifname[IFNAMSIZ];
--
2.53.0
