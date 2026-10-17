Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4F2221DAE
	for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 06:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792216952; cv=pass; b=me0LNXmmlzq/+Sgq5qaKkd8QALoavhrYRdSkO4VVGDmOwTNTmNYQhBS5K/5xSsgZpfBl/LvUnG39ZO/JzCFMEb+1IcfdTPZcSp+NOM+1iJRgfC7J54OhXwBPOM42t2OiIxI4GxZd1BOJ1lfZjvfa3EE1EJDGe9dnDfhTmhcEv8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792216952; c=relaxed/simple;
	bh=P0ZBhRkduNtAUuvPIR7fiOZhYatI4/DESmZM1n2Osfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rTeBo6USF072otoEFQWPlyrg2sTThaHpkOCbAhm46KmA+LzcvbOe5Nv+RLiAK11Dd4byOcq7Onwc3nxzWMIN184qfjVlUQHLgEu9s8CAAuXBtnsqnaOH+l9yWZXgDPMAGumlfjc0jlc4bFZhWefQnu7Z+moGeJEONSt6A05tt6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DVpWi/jE; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DVpWi/jE"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-53397554beaso6452751cf.3
        for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 23:02:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792216948; cv=none;
        d=google.com; s=arc-20260327;
        b=SUr9HpmBal+8Il23b/p1zBWdArQ3/QQ6k4tbcdB7eQliNgKCOhKTlO/8Q6yfd0w33n
         qjWKiIYGaL9cQpoFymmP8pWAjzh9bzpYOvISfhrrqD44pk0DtUiVKO06L8mL4Yp09k/U
         O2uzFwL0fSAARO9rFmlr7oGQJY2RbBgPkx5CovIfHOA983HNNwawIubv2sh23bv/nKhj
         5WhkZc3IkH/D7m2GlxvvG7thW9O3SENAHLU09smtRikDINhECsWtNxqa0YBEDB8olUte
         x8y6F39rnFt5pmsWD7pMDL9VzgesT59eH4s85+DoVUztFAZ9lfVR1Jeu2rEuBMb9md/3
         qpjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5HDNICnr+aqTYsHxhUZ96wV4FkvAcO/uXlMhPdcdQeM=;
        fh=SjO9IQIv+ehXFUtiuCMlG2xwXNygVR0NBY1qGN3ajAg=;
        b=Mb1y2UG+/r2WHGRkqdgJcX3AOow9nXW1vN+AH8LXoOjbGMElcGzksnh00wQYKE0vNl
         NxNmOazBKi2UU+5sPgNMtfazYJrRjW/Sj+t9YEoZqo0EOqa91vHTMC1BZ6PJ09xcUrNq
         N9CHHFFF2OcsMTTAGG1M8t1++f6564Ht7MpCAEnNM0tAS1QNMUJOJVrB1gjT12a9vIov
         Dw/J/IogtewOZ1mG2e9/MjvvUFr35HvzBYKMmh0kuUUJvc7rY9bRecAl2CK+1hsN1Mqh
         nPpP577mQRzDeeob+XfIspUv022lS3DLey4RpXw6C+26fMHJ6REnIl9oh+6xz7sQCir6
         m7YA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792216948; x=1792821748; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5HDNICnr+aqTYsHxhUZ96wV4FkvAcO/uXlMhPdcdQeM=;
        b=DVpWi/jEa5stWfuN8m94G/RyUhhouNuY5H5bsngcSYHm5uPfnyGKA+9Y/IyfsxUxo4
         NTPNAuzc4TEFhEg7EgTAkwZ0ecb2P4pchs+Pfa4YOswJ39xBH/pcJ4Vkyt87/olBAX5f
         FGARe0aEODuPIWeSXmtnJN8K8Tw5lkeyMJxg2gT17SzxidWKAvAS0MtykWwdcholLiUQ
         E00eb3hmhVelMnr3Rcxq5KfSsJPrEXPjcDLAlIpNlbdPUsLDMB0edgTZupKIgAHA2wif
         U8BNnh+rmk17C2xoHarV07JvCMoqdRgkOWo7YZM12vRNdIyB5qHR7X9xe+XT9pFqpQVt
         CpIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792216948; x=1792821748;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5HDNICnr+aqTYsHxhUZ96wV4FkvAcO/uXlMhPdcdQeM=;
        b=Hwiy9oc0CYPcV10sJ1aPqDPs9Wjv34PD8Br5do/KLwTsDdFuMtrsd4wOuzWzLYNqBD
         EBqBIovsWM+SenYpTHta//p5wpPFRM3qTnYQrBb2uYiDD0GT+aCrPuC+nvcrGabumP4r
         Or4oEH+3KVJwVKPFbjuiMpH2mcmQOPJe1RT19QjC0/8VRUGhUyiTPzA5LyA50hQAd+vC
         aWtEczEqT9JOaIPZrMuxtKU9Vq4z9hJUGfC2T6n6znS5amw8J99maPpbaGLYXtk7F5Dz
         hadMMQKliID3YEyr/x1J4K+orW7cRggrYmFxYX4mhv/Or2zKe0ptCI/2JxgXlX9bUcJy
         df9A==
X-Gm-Message-State: AFq9FYJM2xIu2/NkQGDZJCW0g3ZBTAw9fOn0V2Rl01BkN5wCM3jZzgtq
	LMaoZx+FgmG0K6QMi7kDSjyiphEBuXJ9MJSpSpD9XbSXUYlCLDH0mfalOtKlqP+HJP/E0FwDMsZ
	vA0TgrmHCN8fwkuXsMaAhdJ6yWQYFU0c=
X-Gm-Gg: AYBFou3L6qfZw8alyz6Ma9b3rZOx6u7v3vrc3meF6jW2pNs28B7KbI1tCwDA6iiCuaT
	fqtfKpCrcgBqBOLUOL9BPCOtko3tKn/N0bVce8JU8y6ZiTUZnGgli1+3HGLEkFyrKBLxfCFogta
	TYbYZuQvOuN9oPx8lh/vdgYaGYSRQ/zrs5zklJYXRDF/Uqf9DNeXEcFSFl1rWUKrX9KQ/cFgS1Z
	22joT619Cc99+WpTt/L1qshdkUifBt5r3faz+rJsHZL1a2UDdwW3onptC74CqPzIR107rO3TWRe
	bXDZQ/EI+F0CTf6LzcRQUfcumdKNLxNfKDPleJSjHWaxgazD3v6S2Eanih/ywaCfNhdQChIZ2da
	/qB/q+uOqnuPxg3zqJTcFlsze9Ot6/68CniiGZgOuNOB/KH//StA937ysZNyGwvYmPOlND5yacZ
	dili7QSK2VRgSw872XWVTGp0UeNuMv70IsMm6KEoSpBNWAfF3hi1RcNbiJyLF7q8XVKXyM58WZ0
	sAmaWHBzZrmKOy5kaJVP1GFMd6IPTujA3ARZ5E=
X-Received: by 2002:a05:622a:d0c:b0:533:355f:f65c with SMTP id
 d75a77b69052e-53646080e19mr16975361cf.50.1792216948099; Fri, 16 Oct 2026
 23:02:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJPVW+=XcHDV4aoXt5oAHYh49kX7m5wUxf7TucrcBy+q6MdXFA@mail.gmail.com>
In-Reply-To: <CAJPVW+=XcHDV4aoXt5oAHYh49kX7m5wUxf7TucrcBy+q6MdXFA@mail.gmail.com>
From: Megane Hebo <hebomegane@gmail.com>
Date: Sat, 17 Oct 2026 15:02:16 +0900
X-Gm-Features: AclHuK8jBTsqgn9FarNdM-cCDErN8_z34KV2N7J7cPghVlCAzKHF0uxN9fohhrE
Message-ID: <CAJPVW+nstfbagm9GxQ=i-5J6Xi_aZ52-YiQZeYrzmPD3OmDNiw@mail.gmail.com>
Subject: Re: [RFC PATCH net-next] selftests: net: exercise virtio checksum
 ingress outcomes
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, 
	mst@redhat.com, virtualization@lists.linux.dev, 
	willemdebruijn.kernel@gmail.com, habte.yibelo@gmail.com, jasowangio@gmail.com, 
	eperezma@redhat.com, xuanzhuo@linux.alibaba.com
Content-Type: multipart/mixed; boundary="0000000000008d6c9e065e030655"

--0000000000008d6c9e065e030655
Content-Type: text/plain; charset="UTF-8"

Correction: Gmail Web rewrote tabs and wrapped some long lines in the
inline diff I just sent, so that copy is not suitable for applying.

The attached format-patch file is the authoritative byte-exact patch.
Sorry for the transport noise.

SHA256: cd11c3970f0a23ac039cdfcdc6338c20c79dbff3db8fdc93ea53b4b8996437b8


On Sat, 17 Oct 2026 15:00:02 +0900, Megane Hebo <hebomegane@gmail.com> wrote:
> The virtio checksum hardening series gives virtio_net_hdr_to_skb()
> three outcomes for VIRTIO_NET_HDR_F_NEEDS_CSUM: known-good partial
> checksum metadata is retained, uncommon non-GSO metadata is resolved
> in software at ingress, and GSO metadata that cannot be resolved safely
> is rejected.
>
> Add focused TUN tests for these three outcomes. Keep the packet shape
> otherwise identical (IPv4/UDP, no encapsulation), so each test changes
> only the metadata needed to select a different branch.
>
> For the software-resolution case, verify the rx_csum_sw ethtool counter
> added by the hardening series. A recognized partial checksum must not
> increment it. An uncommon non-GSO checksum must increment it once. A
> GSO/protocol mismatch must be rejected without incrementing it.
>
> These are contract tests for ingress normalization: packet semantics
> must be made consistent before later protocol processing observes the
> packet.
>
> This is intended as a follow-up to [PATCH net-next v2 0/7]
> "more virtio-net csum hardening".
>
> Signed-off-by: Kiyotaka Tonegawa <hebomegane@gmail.com>
> ---
> Testing:
> - applied on current upstream master after Michael's v2 0/7 series
> - built tools/testing/selftests/net/tun with the normal YNL dependencies
> - runtime against a kernel containing v2: not run
>
> tools/testing/selftests/net/tun.c | 160 ++++++++++++++++++++++++++++++
> 1 file changed, 160 insertions(+)
>
> diff --git a/tools/testing/selftests/net/tun.c
> b/tools/testing/selftests/net/tun.c
> index afaa81c..8775315 100644
> --- a/tools/testing/selftests/net/tun.c
> +++ b/tools/testing/selftests/net/tun.c
> @@ -8,7 +8,9 @@
> #include <stdlib.h>
> #include <string.h>
> #include <unistd.h>
> +#include <linux/ethtool.h>
> #include <linux/if_tun.h>
> +#include <linux/sockios.h>
> #include <netinet/tcp.h>
> #include <sys/ioctl.h>
> #include <sys/socket.h>
> @@ -543,6 +545,76 @@ TEST_F(tun, reattach_close_delete)
> EXPECT_EQ(tun_delete(self->ifname), 0);
> }
>
> +static int tun_get_stat(const char *ifname, const char *name, uint64_t *value)
> +{
> + struct ethtool_drvinfo drvinfo = { .cmd = ETHTOOL_GDRVINFO };
> + struct ethtool_gstrings *strings = NULL;
> + struct ethtool_stats *stats = NULL;
> + struct ifreq ifr = {};
> + unsigned int i;
> + int fd, ret;
> +
> + fd = socket(AF_INET, SOCK_DGRAM, 0);
> + if (fd < 0)
> + return -errno;
> +
> + strncpy(ifr.ifr_name, ifname, IFNAMSIZ - 1);
> + ifr.ifr_data = (void *)&drvinfo;
> + if (ioctl(fd, SIOCETHTOOL, &ifr) < 0) {
> + ret = -errno;
> + goto out;
> + }
> +
> + if (!drvinfo.n_stats) {
> + ret = -ENOENT;
> + goto out;
> + }
> +
> + strings = calloc(1, sizeof(*strings) +
> + drvinfo.n_stats * ETH_GSTRING_LEN);
> + stats = calloc(1, sizeof(*stats) +
> + drvinfo.n_stats * sizeof(stats->data[0]));
> + if (!strings || !stats) {
> + ret = -ENOMEM;
> + goto out;
> + }
> +
> + strings->cmd = ETHTOOL_GSTRINGS;
> + strings->string_set = ETH_SS_STATS;
> + strings->len = drvinfo.n_stats;
> + ifr.ifr_data = (void *)strings;
> + if (ioctl(fd, SIOCETHTOOL, &ifr) < 0) {
> + ret = -errno;
> + goto out;
> + }
> +
> + stats->cmd = ETHTOOL_GSTATS;
> + stats->n_stats = drvinfo.n_stats;
> + ifr.ifr_data = (void *)stats;
> + if (ioctl(fd, SIOCETHTOOL, &ifr) < 0) {
> + ret = -errno;
> + goto out;
> + }
> +
> + ret = -ENOENT;
> + for (i = 0; i < drvinfo.n_stats; i++) {
> + const char *stat_name =
> + (const char *)&strings->data[i * ETH_GSTRING_LEN];
> +
> + if (!strncmp(stat_name, name, ETH_GSTRING_LEN)) {
> + *value = stats->data[i];
> + ret = 0;
> + break;
> + }
> + }
> +
> +out:
> + free(stats);
> + free(strings);
> + close(fd);
> + return ret;
> +}
> +
> FIXTURE(tun_vnet_gso)
> {
> char ifname[IFNAMSIZ];
> @@ -611,6 +683,35 @@ static int build_vlan_tcpv4_gso_packet(uint8_t
> *buf, int payload_len)
> return cur - buf;
> }
>
> +static int build_ipv4_udp_partial_packet(uint8_t *buf, int payload_len,
> + uint8_t gso_type,
> + uint16_t csum_offset)
> +{
> + uint8_t *cur = buf + sizeof(struct virtio_net_hdr);
> + struct virtio_net_hdr vh = { 0 };
> +
> + cur += build_eth(cur, ETH_P_IP, param_hwaddr_outer_src,
> + param_hwaddr_outer_dst);
> + cur += build_ipv4_header(cur, IPPROTO_UDP,
> + sizeof(struct udphdr) + payload_len,
> + &param_ipaddr4_outer_src,
> + &param_ipaddr4_outer_dst);
> + cur += build_udp_packet(cur, UDP_SRC_PORT, UDP_DST_PORT,
> + payload_len, AF_INET, true);
> +
> + vh.flags = VIRTIO_NET_HDR_F_NEEDS_CSUM;
> + vh.hdr_len = ETH_HLEN + sizeof(struct iphdr) + sizeof(struct udphdr);
> + vh.csum_start = ETH_HLEN + sizeof(struct iphdr);
> + vh.csum_offset = csum_offset;
> + vh.gso_type = gso_type;
> + if (gso_type != VIRTIO_NET_HDR_GSO_NONE)
> + vh.gso_size = 64;
> +
> + memcpy(buf, &vh, sizeof(vh));
> +
> + return cur - buf;
> +}
> +
> TEST_F(tun_vnet_gso, vlan_tcpv4_gso_no_csum)
> {
> struct virtio_net_hdr vh;
> @@ -678,6 +779,65 @@ TEST_F(tun_vnet_gso, vlan_tcpv4_gso_no_csum_64k)
> ASSERT_EQ(ret, len);
> }
>
> +TEST_F(tun_vnet_gso, csum_partial_known_good)
> +{
> + uint8_t pkt[512] = { 0 };
> + uint64_t before, after;
> + int len, ret;
> +
> + ASSERT_EQ(tun_get_stat(self->ifname, "rx_csum_sw", &before), 0);
> +
> + len = build_ipv4_udp_partial_packet(pkt, 128,
> + VIRTIO_NET_HDR_GSO_NONE,
> + __builtin_offsetof(struct
> udphdr, check));
> + ret = write(self->fd, pkt, len);
> + ASSERT_EQ(ret, len);
> +
> + ASSERT_EQ(tun_get_stat(self->ifname, "rx_csum_sw", &after), 0);
> + EXPECT_EQ(after, before);
> +}
> +
> +TEST_F(tun_vnet_gso, csum_partial_uncommon_resolved)
> +{
> + uint8_t pkt[512] = { 0 };
> + uint64_t before, after;
> + int len, ret;
> +
> + ASSERT_EQ(tun_get_stat(self->ifname, "rx_csum_sw", &before), 0);
> +
> + len = build_ipv4_udp_partial_packet(pkt, 128,
> + VIRTIO_NET_HDR_GSO_NONE,
> + __builtin_offsetof(struct
> udphdr, source));
> + ret = write(self->fd, pkt, len);
> + ASSERT_EQ(ret, len);
> +
> + ASSERT_EQ(tun_get_stat(self->ifname, "rx_csum_sw", &after), 0);
> + EXPECT_EQ(after, before + 1);
> +}
> +
> +TEST_F(tun_vnet_gso, csum_partial_gso_protocol_mismatch_rejected)
> +{
> + uint8_t pkt[512] = { 0 };
> + uint64_t before, after;
> + int len, ret;
> +
> + ASSERT_EQ(tun_get_stat(self->ifname, "rx_csum_sw", &before), 0);
> +
> + /* The checksum field is a valid UDP checksum field, but the
> + * virtio header claims TCPv4 GSO. GSO cannot be resolved as an
> + * arbitrary checksum write, so the ingress contract rejects it.
> + */
> + len = build_ipv4_udp_partial_packet(pkt, 256,
> + VIRTIO_NET_HDR_GSO_TCPV4,
> + __builtin_offsetof(struct
> udphdr, check));
> + ret = write(self->fd, pkt, len);
> + ASSERT_EQ(ret, -1);
> + ASSERT_EQ(errno, EINVAL);
> +
> + ASSERT_EQ(tun_get_stat(self->ifname, "rx_csum_sw", &after), 0);
> + EXPECT_EQ(after, before);
> +}
> +
> FIXTURE(tun_vnet_udptnl)
> {
> char ifname[IFNAMSIZ];
> --
> 2.53.0

--0000000000008d6c9e065e030655
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-selftests-net-exercise-virtio-checksum-ingress-outcomes.patch"
Content-Disposition: attachment; 
	filename="0001-selftests-net-exercise-virtio-checksum-ingress-outcomes.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mvbzo52w0>
X-Attachment-Id: f_mvbzo52w0

RnJvbSBiYTc1ZWI4Mzg4ZjNmMDU4MTk2YjYzNmI1OGEyYjU3ODNhNjgzMTU2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLaXlvdGFrYSBUb25lZ2F3YSA8aGVib21lZ2FuZUBnbWFpbC5j
b20+CkRhdGU6IFNhdCwgMTcgT2N0IDIwMjYgMTM6MjE6NDAgKzA5MDAKU3ViamVjdDogW1JGQyBQ
QVRDSCBuZXQtbmV4dF0gc2VsZnRlc3RzOiBuZXQ6IGV4ZXJjaXNlIHZpcnRpbyBjaGVja3N1bSBp
bmdyZXNzCiBvdXRjb21lcwoKVGhlIHZpcnRpbyBjaGVja3N1bSBoYXJkZW5pbmcgc2VyaWVzIGdp
dmVzIHZpcnRpb19uZXRfaGRyX3RvX3NrYigpCnRocmVlIG91dGNvbWVzIGZvciBWSVJUSU9fTkVU
X0hEUl9GX05FRURTX0NTVU06IGtub3duLWdvb2QgcGFydGlhbApjaGVja3N1bSBtZXRhZGF0YSBp
cyByZXRhaW5lZCwgdW5jb21tb24gbm9uLUdTTyBtZXRhZGF0YSBpcyByZXNvbHZlZAppbiBzb2Z0
d2FyZSBhdCBpbmdyZXNzLCBhbmQgR1NPIG1ldGFkYXRhIHRoYXQgY2Fubm90IGJlIHJlc29sdmVk
IHNhZmVseQppcyByZWplY3RlZC4KCkFkZCBmb2N1c2VkIFRVTiB0ZXN0cyBmb3IgdGhlc2UgdGhy
ZWUgb3V0Y29tZXMuIEtlZXAgdGhlIHBhY2tldCBzaGFwZQpvdGhlcndpc2UgaWRlbnRpY2FsIChJ
UHY0L1VEUCwgbm8gZW5jYXBzdWxhdGlvbiksIHNvIGVhY2ggdGVzdCBjaGFuZ2VzCm9ubHkgdGhl
IG1ldGFkYXRhIG5lZWRlZCB0byBzZWxlY3QgYSBkaWZmZXJlbnQgYnJhbmNoLgoKRm9yIHRoZSBz
b2Z0d2FyZS1yZXNvbHV0aW9uIGNhc2UsIHZlcmlmeSB0aGUgcnhfY3N1bV9zdyBldGh0b29sIGNv
dW50ZXIKYWRkZWQgYnkgdGhlIGhhcmRlbmluZyBzZXJpZXMuIEEgcmVjb2duaXplZCBwYXJ0aWFs
IGNoZWNrc3VtIG11c3Qgbm90CmluY3JlbWVudCBpdC4gQW4gdW5jb21tb24gbm9uLUdTTyBjaGVj
a3N1bSBtdXN0IGluY3JlbWVudCBpdCBvbmNlLiBBCkdTTy9wcm90b2NvbCBtaXNtYXRjaCBtdXN0
IGJlIHJlamVjdGVkIHdpdGhvdXQgaW5jcmVtZW50aW5nIGl0LgoKVGhlc2UgYXJlIGNvbnRyYWN0
IHRlc3RzIGZvciBpbmdyZXNzIG5vcm1hbGl6YXRpb246IHBhY2tldCBzZW1hbnRpY3MKbXVzdCBi
ZSBtYWRlIGNvbnNpc3RlbnQgYmVmb3JlIGxhdGVyIHByb3RvY29sIHByb2Nlc3Npbmcgb2JzZXJ2
ZXMgdGhlCnBhY2tldC4KClRoaXMgaXMgaW50ZW5kZWQgYXMgYSBmb2xsb3ctdXAgdG8gW1BBVENI
IG5ldC1uZXh0IHYyIDAvN10KIm1vcmUgdmlydGlvLW5ldCBjc3VtIGhhcmRlbmluZyIuCgpTaWdu
ZWQtb2ZmLWJ5OiBLaXlvdGFrYSBUb25lZ2F3YSA8aGVib21lZ2FuZUBnbWFpbC5jb20+Ci0tLQpU
ZXN0aW5nOgotIGFwcGxpZWQgb24gY3VycmVudCB1cHN0cmVhbSBtYXN0ZXIgYWZ0ZXIgTWljaGFl
bCdzIHYyIDAvNyBzZXJpZXMKLSBidWlsdCB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvdHVu
IHdpdGggdGhlIG5vcm1hbCBZTkwgZGVwZW5kZW5jaWVzCi0gcnVudGltZSBhZ2FpbnN0IGEga2Vy
bmVsIGNvbnRhaW5pbmcgdjI6IG5vdCBydW4KCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQv
dHVuLmMgfCAxNjAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgMTYwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9uZXQvdHVuLmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9uZXQvdHVuLmMKaW5kZXggYWZh
YTgxYy4uODc3NTMxNSAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbmV0L3R1
bi5jCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25ldC90dW4uYwpAQCAtOCw3ICs4LDkg
QEAKICNpbmNsdWRlIDxzdGRsaWIuaD4KICNpbmNsdWRlIDxzdHJpbmcuaD4KICNpbmNsdWRlIDx1
bmlzdGQuaD4KKyNpbmNsdWRlIDxsaW51eC9ldGh0b29sLmg+CiAjaW5jbHVkZSA8bGludXgvaWZf
dHVuLmg+CisjaW5jbHVkZSA8bGludXgvc29ja2lvcy5oPgogI2luY2x1ZGUgPG5ldGluZXQvdGNw
Lmg+CiAjaW5jbHVkZSA8c3lzL2lvY3RsLmg+CiAjaW5jbHVkZSA8c3lzL3NvY2tldC5oPgpAQCAt
NTQzLDYgKzU0NSw3NiBAQCBURVNUX0YodHVuLCByZWF0dGFjaF9jbG9zZV9kZWxldGUpCiAJRVhQ
RUNUX0VRKHR1bl9kZWxldGUoc2VsZi0+aWZuYW1lKSwgMCk7CiB9CiAKK3N0YXRpYyBpbnQgdHVu
X2dldF9zdGF0KGNvbnN0IGNoYXIgKmlmbmFtZSwgY29uc3QgY2hhciAqbmFtZSwgdWludDY0X3Qg
KnZhbHVlKQoreworCXN0cnVjdCBldGh0b29sX2RydmluZm8gZHJ2aW5mbyA9IHsgLmNtZCA9IEVU
SFRPT0xfR0RSVklORk8gfTsKKwlzdHJ1Y3QgZXRodG9vbF9nc3RyaW5ncyAqc3RyaW5ncyA9IE5V
TEw7CisJc3RydWN0IGV0aHRvb2xfc3RhdHMgKnN0YXRzID0gTlVMTDsKKwlzdHJ1Y3QgaWZyZXEg
aWZyID0ge307CisJdW5zaWduZWQgaW50IGk7CisJaW50IGZkLCByZXQ7CisKKwlmZCA9IHNvY2tl
dChBRl9JTkVULCBTT0NLX0RHUkFNLCAwKTsKKwlpZiAoZmQgPCAwKQorCQlyZXR1cm4gLWVycm5v
OworCisJc3RybmNweShpZnIuaWZyX25hbWUsIGlmbmFtZSwgSUZOQU1TSVogLSAxKTsKKwlpZnIu
aWZyX2RhdGEgPSAodm9pZCAqKSZkcnZpbmZvOworCWlmIChpb2N0bChmZCwgU0lPQ0VUSFRPT0ws
ICZpZnIpIDwgMCkgeworCQlyZXQgPSAtZXJybm87CisJCWdvdG8gb3V0OworCX0KKworCWlmICgh
ZHJ2aW5mby5uX3N0YXRzKSB7CisJCXJldCA9IC1FTk9FTlQ7CisJCWdvdG8gb3V0OworCX0KKwor
CXN0cmluZ3MgPSBjYWxsb2MoMSwgc2l6ZW9mKCpzdHJpbmdzKSArCisJCQkgZHJ2aW5mby5uX3N0
YXRzICogRVRIX0dTVFJJTkdfTEVOKTsKKwlzdGF0cyA9IGNhbGxvYygxLCBzaXplb2YoKnN0YXRz
KSArCisJCSAgICAgICBkcnZpbmZvLm5fc3RhdHMgKiBzaXplb2Yoc3RhdHMtPmRhdGFbMF0pKTsK
KwlpZiAoIXN0cmluZ3MgfHwgIXN0YXRzKSB7CisJCXJldCA9IC1FTk9NRU07CisJCWdvdG8gb3V0
OworCX0KKworCXN0cmluZ3MtPmNtZCA9IEVUSFRPT0xfR1NUUklOR1M7CisJc3RyaW5ncy0+c3Ry
aW5nX3NldCA9IEVUSF9TU19TVEFUUzsKKwlzdHJpbmdzLT5sZW4gPSBkcnZpbmZvLm5fc3RhdHM7
CisJaWZyLmlmcl9kYXRhID0gKHZvaWQgKilzdHJpbmdzOworCWlmIChpb2N0bChmZCwgU0lPQ0VU
SFRPT0wsICZpZnIpIDwgMCkgeworCQlyZXQgPSAtZXJybm87CisJCWdvdG8gb3V0OworCX0KKwor
CXN0YXRzLT5jbWQgPSBFVEhUT09MX0dTVEFUUzsKKwlzdGF0cy0+bl9zdGF0cyA9IGRydmluZm8u
bl9zdGF0czsKKwlpZnIuaWZyX2RhdGEgPSAodm9pZCAqKXN0YXRzOworCWlmIChpb2N0bChmZCwg
U0lPQ0VUSFRPT0wsICZpZnIpIDwgMCkgeworCQlyZXQgPSAtZXJybm87CisJCWdvdG8gb3V0Owor
CX0KKworCXJldCA9IC1FTk9FTlQ7CisJZm9yIChpID0gMDsgaSA8IGRydmluZm8ubl9zdGF0czsg
aSsrKSB7CisJCWNvbnN0IGNoYXIgKnN0YXRfbmFtZSA9CisJCQkoY29uc3QgY2hhciAqKSZzdHJp
bmdzLT5kYXRhW2kgKiBFVEhfR1NUUklOR19MRU5dOworCisJCWlmICghc3RybmNtcChzdGF0X25h
bWUsIG5hbWUsIEVUSF9HU1RSSU5HX0xFTikpIHsKKwkJCSp2YWx1ZSA9IHN0YXRzLT5kYXRhW2ld
OworCQkJcmV0ID0gMDsKKwkJCWJyZWFrOworCQl9CisJfQorCitvdXQ6CisJZnJlZShzdGF0cyk7
CisJZnJlZShzdHJpbmdzKTsKKwljbG9zZShmZCk7CisJcmV0dXJuIHJldDsKK30KKwogRklYVFVS
RSh0dW5fdm5ldF9nc28pCiB7CiAJY2hhciBpZm5hbWVbSUZOQU1TSVpdOwpAQCAtNjExLDYgKzY4
MywzNSBAQCBzdGF0aWMgaW50IGJ1aWxkX3ZsYW5fdGNwdjRfZ3NvX3BhY2tldCh1aW50OF90ICpi
dWYsIGludCBwYXlsb2FkX2xlbikKIAlyZXR1cm4gY3VyIC0gYnVmOwogfQogCitzdGF0aWMgaW50
IGJ1aWxkX2lwdjRfdWRwX3BhcnRpYWxfcGFja2V0KHVpbnQ4X3QgKmJ1ZiwgaW50IHBheWxvYWRf
bGVuLAorCQkJCQkgdWludDhfdCBnc29fdHlwZSwKKwkJCQkJIHVpbnQxNl90IGNzdW1fb2Zmc2V0
KQoreworCXVpbnQ4X3QgKmN1ciA9IGJ1ZiArIHNpemVvZihzdHJ1Y3QgdmlydGlvX25ldF9oZHIp
OworCXN0cnVjdCB2aXJ0aW9fbmV0X2hkciB2aCA9IHsgMCB9OworCisJY3VyICs9IGJ1aWxkX2V0
aChjdXIsIEVUSF9QX0lQLCBwYXJhbV9od2FkZHJfb3V0ZXJfc3JjLAorCQkJIHBhcmFtX2h3YWRk
cl9vdXRlcl9kc3QpOworCWN1ciArPSBidWlsZF9pcHY0X2hlYWRlcihjdXIsIElQUFJPVE9fVURQ
LAorCQkJCSBzaXplb2Yoc3RydWN0IHVkcGhkcikgKyBwYXlsb2FkX2xlbiwKKwkJCQkgJnBhcmFt
X2lwYWRkcjRfb3V0ZXJfc3JjLAorCQkJCSAmcGFyYW1faXBhZGRyNF9vdXRlcl9kc3QpOworCWN1
ciArPSBidWlsZF91ZHBfcGFja2V0KGN1ciwgVURQX1NSQ19QT1JULCBVRFBfRFNUX1BPUlQsCisJ
CQkJcGF5bG9hZF9sZW4sIEFGX0lORVQsIHRydWUpOworCisJdmguZmxhZ3MgPSBWSVJUSU9fTkVU
X0hEUl9GX05FRURTX0NTVU07CisJdmguaGRyX2xlbiA9IEVUSF9ITEVOICsgc2l6ZW9mKHN0cnVj
dCBpcGhkcikgKyBzaXplb2Yoc3RydWN0IHVkcGhkcik7CisJdmguY3N1bV9zdGFydCA9IEVUSF9I
TEVOICsgc2l6ZW9mKHN0cnVjdCBpcGhkcik7CisJdmguY3N1bV9vZmZzZXQgPSBjc3VtX29mZnNl
dDsKKwl2aC5nc29fdHlwZSA9IGdzb190eXBlOworCWlmIChnc29fdHlwZSAhPSBWSVJUSU9fTkVU
X0hEUl9HU09fTk9ORSkKKwkJdmguZ3NvX3NpemUgPSA2NDsKKworCW1lbWNweShidWYsICZ2aCwg
c2l6ZW9mKHZoKSk7CisKKwlyZXR1cm4gY3VyIC0gYnVmOworfQorCiBURVNUX0YodHVuX3ZuZXRf
Z3NvLCB2bGFuX3RjcHY0X2dzb19ub19jc3VtKQogewogCXN0cnVjdCB2aXJ0aW9fbmV0X2hkciB2
aDsKQEAgLTY3OCw2ICs3NzksNjUgQEAgVEVTVF9GKHR1bl92bmV0X2dzbywgdmxhbl90Y3B2NF9n
c29fbm9fY3N1bV82NGspCiAJQVNTRVJUX0VRKHJldCwgbGVuKTsKIH0KIAorVEVTVF9GKHR1bl92
bmV0X2dzbywgY3N1bV9wYXJ0aWFsX2tub3duX2dvb2QpCit7CisJdWludDhfdCBwa3RbNTEyXSA9
IHsgMCB9OworCXVpbnQ2NF90IGJlZm9yZSwgYWZ0ZXI7CisJaW50IGxlbiwgcmV0OworCisJQVNT
RVJUX0VRKHR1bl9nZXRfc3RhdChzZWxmLT5pZm5hbWUsICJyeF9jc3VtX3N3IiwgJmJlZm9yZSks
IDApOworCisJbGVuID0gYnVpbGRfaXB2NF91ZHBfcGFydGlhbF9wYWNrZXQocGt0LCAxMjgsCisJ
CQkJCSAgICBWSVJUSU9fTkVUX0hEUl9HU09fTk9ORSwKKwkJCQkJICAgIF9fYnVpbHRpbl9vZmZz
ZXRvZihzdHJ1Y3QgdWRwaGRyLCBjaGVjaykpOworCXJldCA9IHdyaXRlKHNlbGYtPmZkLCBwa3Qs
IGxlbik7CisJQVNTRVJUX0VRKHJldCwgbGVuKTsKKworCUFTU0VSVF9FUSh0dW5fZ2V0X3N0YXQo
c2VsZi0+aWZuYW1lLCAicnhfY3N1bV9zdyIsICZhZnRlciksIDApOworCUVYUEVDVF9FUShhZnRl
ciwgYmVmb3JlKTsKK30KKworVEVTVF9GKHR1bl92bmV0X2dzbywgY3N1bV9wYXJ0aWFsX3VuY29t
bW9uX3Jlc29sdmVkKQoreworCXVpbnQ4X3QgcGt0WzUxMl0gPSB7IDAgfTsKKwl1aW50NjRfdCBi
ZWZvcmUsIGFmdGVyOworCWludCBsZW4sIHJldDsKKworCUFTU0VSVF9FUSh0dW5fZ2V0X3N0YXQo
c2VsZi0+aWZuYW1lLCAicnhfY3N1bV9zdyIsICZiZWZvcmUpLCAwKTsKKworCWxlbiA9IGJ1aWxk
X2lwdjRfdWRwX3BhcnRpYWxfcGFja2V0KHBrdCwgMTI4LAorCQkJCQkgICAgVklSVElPX05FVF9I
RFJfR1NPX05PTkUsCisJCQkJCSAgICBfX2J1aWx0aW5fb2Zmc2V0b2Yoc3RydWN0IHVkcGhkciwg
c291cmNlKSk7CisJcmV0ID0gd3JpdGUoc2VsZi0+ZmQsIHBrdCwgbGVuKTsKKwlBU1NFUlRfRVEo
cmV0LCBsZW4pOworCisJQVNTRVJUX0VRKHR1bl9nZXRfc3RhdChzZWxmLT5pZm5hbWUsICJyeF9j
c3VtX3N3IiwgJmFmdGVyKSwgMCk7CisJRVhQRUNUX0VRKGFmdGVyLCBiZWZvcmUgKyAxKTsKK30K
KworVEVTVF9GKHR1bl92bmV0X2dzbywgY3N1bV9wYXJ0aWFsX2dzb19wcm90b2NvbF9taXNtYXRj
aF9yZWplY3RlZCkKK3sKKwl1aW50OF90IHBrdFs1MTJdID0geyAwIH07CisJdWludDY0X3QgYmVm
b3JlLCBhZnRlcjsKKwlpbnQgbGVuLCByZXQ7CisKKwlBU1NFUlRfRVEodHVuX2dldF9zdGF0KHNl
bGYtPmlmbmFtZSwgInJ4X2NzdW1fc3ciLCAmYmVmb3JlKSwgMCk7CisKKwkvKiBUaGUgY2hlY2tz
dW0gZmllbGQgaXMgYSB2YWxpZCBVRFAgY2hlY2tzdW0gZmllbGQsIGJ1dCB0aGUKKwkgKiB2aXJ0
aW8gaGVhZGVyIGNsYWltcyBUQ1B2NCBHU08uIEdTTyBjYW5ub3QgYmUgcmVzb2x2ZWQgYXMgYW4K
KwkgKiBhcmJpdHJhcnkgY2hlY2tzdW0gd3JpdGUsIHNvIHRoZSBpbmdyZXNzIGNvbnRyYWN0IHJl
amVjdHMgaXQuCisJICovCisJbGVuID0gYnVpbGRfaXB2NF91ZHBfcGFydGlhbF9wYWNrZXQocGt0
LCAyNTYsCisJCQkJCSAgICBWSVJUSU9fTkVUX0hEUl9HU09fVENQVjQsCisJCQkJCSAgICBfX2J1
aWx0aW5fb2Zmc2V0b2Yoc3RydWN0IHVkcGhkciwgY2hlY2spKTsKKwlyZXQgPSB3cml0ZShzZWxm
LT5mZCwgcGt0LCBsZW4pOworCUFTU0VSVF9FUShyZXQsIC0xKTsKKwlBU1NFUlRfRVEoZXJybm8s
IEVJTlZBTCk7CisKKwlBU1NFUlRfRVEodHVuX2dldF9zdGF0KHNlbGYtPmlmbmFtZSwgInJ4X2Nz
dW1fc3ciLCAmYWZ0ZXIpLCAwKTsKKwlFWFBFQ1RfRVEoYWZ0ZXIsIGJlZm9yZSk7Cit9CisKIEZJ
WFRVUkUodHVuX3ZuZXRfdWRwdG5sKQogewogCWNoYXIgaWZuYW1lW0lGTkFNU0laXTsKLS0gCjIu
NTMuMAoK
--0000000000008d6c9e065e030655--
