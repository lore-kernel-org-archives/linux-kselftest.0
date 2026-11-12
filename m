Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794511488;
	b=eFCOz2KmuaRPdQ5L8lsCLcKw350MC8zKUlqqHQ1CA/bxlkTv29VyobMQJYfy5G8h8bEt
	 llvI2FgNk8V6uGs6n9awS3xEYrXIWqTNefxblmumlq8KFd1Xx0jBhHEP3hGQKYOR3VCIe
	 7MkXxfnkjPsqPg2hgSOgBaBZko5+BNpm9wWhoj2MXFvzlHv7VZZ/B7163SCiSEHPqz5a2
	 qvzTcLNSfmoiq6HlQPtjgzaDd5/fj+iQRZaBnH9UEzMZDTZRPiZh9FLAh9SbqHw8n/JeY
	 VM4WURvZ726cEcLO9sUSCWBf6rIlZNsIiAKh+jopXnCqPu6tWuHAhI9sRz2k53TCVzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794511488;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version;
	bh=aXPVbybfZ2K+Jl8YN0tgOP5dffw3F3RWQsmOOU3BV0M=;
	b=vZs43VIuxFgvSR3qP8NuFme509qAStuYY4SUW/6etDm8kgIjKeR79hRQ8QLyo2ic+Dxz
	 H971pe5CFrBq9/07a+oPcV7MQrXSL4cUuY09GQ1gj8goN7aktBYCbM0vij2Ow5XQ4l/fZ
	 jAA9Bp0er+NQw2JfXYgYblm62Ygr1eqGRkGZRnsaQZY+xiaEkVmnHgVwdaOPgmpBJuJ41
	 jlljermR/2YlVr7jMl+WvIpyEYrxJCVtkqDd71PDaix8JqpyRFczdJBwaM1mXn5E8KdWV
	 ti+W05A43Cqgx6SjTZmv4HTACV+7izHo6eFpRovpUFRbYwU4ReYrlDNz3v4zlmPM4Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=jxKoqo0Z;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F710606A33B;
	Thu, 12 Nov 2026 19:24:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F710606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=jxKoqo0Z
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFaiA53764456;
	Thu, 12 Nov 2026 11:24:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=aXPVbybfZ2K+Jl8YN0tgOP5dffw3F3RWQsmOO
	U3BV0M=; b=jxKoqo0ZPU8H3xAKbxC4ODm89oLq2j8Fpy4wUxpsHfX5hSJ6+dOI7
	XoifY5W237W5Ws0VCKm6Bv6TeLe9sIO1epGqobDyQeXb094JI0X+aVKwJolKNmfO
	mLKvJ5Ja/TrE7BV46gbVQc5xiee7rWlZJti5Cgu1q/dPgRiTQuAwvmL+UCCHMYZy
	zZlwIX6g3rxNLA8B+zWx/qcppz5QLAtK2UqSCdggFV+IZ6+ydBmYnlwRzmuNXg/q
	dgMWkejXVBagDp6UlHGin0/v9APiqU7r44O/sp2BG8fTxyI2uyKM15nyTP/pwsVV
	eiRi9Uwe/4nvUrr/UiF8tNdAza/IXJ4FQ==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hw101y32s-14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 12 Nov 2026 11:24:43 -0800 (PST)
Received: from localhost (2620:10d:c085:108::4) by mail.thefacebook.com
 (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Thu, 12 Nov
 2026 19:24:33 +0000
From: Todd Freed <toddfreed@meta.com>
To: <netdev@vger.kernel.org>, <toddfreed@meta.com>
CC: David Ahern <dsahern@kernel.org>,
        Stephen Hemminger
	<stephen@networkplumber.org>,
        Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko
	<jiri@resnulli.us>,
        Daniel Zahka <daniel.zahka@gmail.com>,
        Willem de Bruijn
	<willemdebruijn.kernel@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: [PATCH iproute2-next v2 3/3] tc: flower: add matches psp_spi, psp_ver and psp_dev
Date: Thu, 12 Nov 2026 11:24:26 -0800
Message-ID: <20261112192426.397604-4-toddfreed@meta.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112192426.397604-1-toddfreed@meta.com>
References: <20261112192426.397604-1-toddfreed@meta.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA3NyBTYWx0ZWRfXxw4zXV4dnoeI
 Yo7HVo5+lobFtSZSuGOrIterWQ3ikL/2jVIGDVgSnAbG1ltN3EfuvfYMibnXkXHKi9cM74M7h0k
 QWpxJzZ05WTyVO0TFRZwXnWZgz3YLk0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA3NyBTYWx0ZWRfX+DuTJ4j01l1N
 Mwu/R78O6Np0roBx9nXDindxZc4EmfhQjMkMWcomndjct1ZG7j7zKjjC0Og/GNSERx7Ka+35U+x
 +0bxGuRzmvWFgwc+I1fH1jCER3vIgJQ438QjNWC9T5DrKeaa8pvuGBGgZ+k4QaU6F8bYFH9hiW3
 UesJTdvZ3eq9Ob5T5bKpIcnRHNGsuIeDw30QJDIQuA7PfIT91O+CyhUKuWv7Iy5lWBtDJuzRsga
 PseESvZIrQU2TajUkUWG+5cCpfCYB5xXG9ztjWQ/KSYRU1UIRN6lLHPkBf3ce+4rLmY7wUuK+0X
 RRjvgPBiegL1F0KmMSrM569WV8cq9msWCouxtWzkgrCQyGjYh+ds4Xw3JjWvRI2aC5yCN/AqrCz
 l5Cs1OErL9QogtQLqR0oKYzoM/RPbGXeSh/QCfFhOD6KrGVz8G9pO8O94qkkCtwt4qwdnhUxXvQ
 zqTSeV/dkIweK/ct9yw==
X-Proofpoint-ORIG-GUID: MeGFn39qO6vC3mE--yPzPGPhoC83qKt2
X-Authority-Analysis: v=2.4 cv=HaaB3SE8 c=1 sm=1 tr=0 ts=6af6127b cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=tpM8CJlwf7uhpglF1g9U:22 a=VabnemYjAAAA:8 a=l9_kp1f6lo_aXq9mhy8A:9
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-GUID: MeGFn39qO6vC3mE--yPzPGPhoC83qKt2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01

Match on the PSP Rx state of a packet the device decrypted: the SPI it
was decrypted with (psp_spi, with an optional mask), the PSP version
(psp_ver), and the ID of the PSP device which decrypted it (psp_dev).

For example, to take the packets decrypted with one Rx SPI, from
rx-spi-alloc, and remove their PSP state:

  tc filter add dev eth0 ingress protocol ipv6 flower
      psp_spi 0x80000001 psp_ver 0 psp_dev 1
      action psp decap

These keys only match decrypted packets, even with a zero mask, so
"psp_spi 0/0" matches any decrypted PSP packet.

psp_spi and its mask are hexadecimal, like spi. tc-flower(8) documents
the keys.

Signed-off-by: Todd Freed <toddfreed@meta.com>
---
 man/man8/tc-flower.8 | 29 ++++++++++++++++++
 tc/f_flower.c        | 71 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 100 insertions(+)

diff --git a/man/man8/tc-flower.8 b/man/man8/tc-flower.8
index 3f8ba4656ef4..88881671c693 100644
--- a/man/man8/tc-flower.8
+++ b/man/man8/tc-flower.8
@@ -56,6 +56,12 @@ flower \- flow based traffic control filter
 .IR TTL " | "
 .B l2tpv3_sid
 .IR LSID " | "
+.B psp_spi
+.IR SPI "[/" MASK "] | "
+.B psp_ver
+.IR VERSION " | "
+.B psp_dev
+.IR PSP_DEV_ID " | "
 .BR ip_proto " { " tcp " | " udp " | " sctp " | " icmp " | " icmpv6 " | " l2tp " | "
 .IR IP_PROTO " } | "
 .B ip_tos
@@ -323,6 +329,29 @@ Match on L2TPv3 session id field transported over IPv4 or IPv6.
 .I LSID
 is an unsigned 32 bit value in decimal format.
 .TP
+.BI psp_spi " SPI[/MASK]"
+Match on the SPI which a PSP device decrypted the packet with.
+.I SPI
+and
+.I MASK
+are unsigned 32 bit values in hexadecimal format.
+.TP
+.BI psp_ver " VERSION"
+Match on the PSP version which the packet was decrypted with, as numbered
+by the PSP netlink family (0 for hdr0-aes-gcm-128, 1 for hdr0-aes-gcm-256,
+2 for hdr0-aes-gmac-128, 3 for hdr0-aes-gmac-256).
+.TP
+.BI psp_dev " PSP_DEV_ID"
+Match on the ID of the PSP device which decrypted the packet, from the PSP
+netlink family.
+.IP
+The PSP keys only ever match packets which a PSP device decrypted, even with
+a zero mask:
+.B psp_spi 0/0
+matches any packet decrypted with PSP. See
+.BR tc-psp (8)
+for an example.
+.TP
 .BI ip_proto " IP_PROTO"
 Match on layer four protocol.
 .I IP_PROTO
diff --git a/tc/f_flower.c b/tc/f_flower.c
index 6fc2c6a1ccc6..6539856ba9d5 100644
--- a/tc/f_flower.c
+++ b/tc/f_flower.c
@@ -73,6 +73,9 @@ static void explain(void)
 		"			mpls_bos BOS |\n"
 		"			mpls_ttl TTL |\n"
 		"			spi SPI-INDEX  |\n"
+		"			psp_spi SPI[/MASK] |\n"
+		"			psp_ver VERSION |\n"
+		"			psp_dev PSP-DEV-ID |\n"
 		"			l2tpv3_sid LSID |\n"
 		"			dst_ip PREFIX |\n"
 		"			src_ip PREFIX |\n"
@@ -678,6 +681,25 @@ static int flower_parse_icmp(char *str, __u16 eth_type, __u8 ip_proto,
 	return flower_parse_u8(str, value_type, mask_type, NULL, NULL, n);
 }
 
+static int flower_parse_psp_spi(char *str, struct nlmsghdr *n)
+{
+	__u32 spi, mask = UINT32_MAX;
+	char *slash;
+
+	slash = strchr(str, '/');
+	if (slash) {
+		*slash = '\0';
+		if (get_u32(&mask, slash + 1, 16))
+			return -1;
+	}
+	if (get_u32(&spi, str, 16))
+		return -1;
+
+	addattr32(n, MAX_MSG, TCA_FLOWER_KEY_PSP_SPI, htonl(spi));
+	addattr32(n, MAX_MSG, TCA_FLOWER_KEY_PSP_SPI_MASK, htonl(mask));
+	return 0;
+}
+
 static int flower_parse_spi(char *str, __u8 ip_proto, struct nlmsghdr *n)
 {
 	__be32 spi;
@@ -2074,6 +2096,31 @@ static int flower_parse_opt(const struct filter_util *qu, char *handle,
 			ret = flower_parse_l2tpv3(*argv, ip_proto, n);
 			if (ret < 0)
 				return -1;
+		} else if (!strcmp(*argv, "psp_spi")) {
+			NEXT_ARG();
+			ret = flower_parse_psp_spi(*argv, n);
+			if (ret < 0) {
+				fprintf(stderr, "Illegal \"psp_spi\"\n");
+				return -1;
+			}
+		} else if (!strcmp(*argv, "psp_ver")) {
+			__u8 ver;
+
+			NEXT_ARG();
+			if (get_u8(&ver, *argv, 10)) {
+				fprintf(stderr, "Illegal \"psp_ver\"\n");
+				return -1;
+			}
+			addattr8(n, MAX_MSG, TCA_FLOWER_KEY_PSP_VERSION, ver);
+		} else if (!strcmp(*argv, "psp_dev")) {
+			__u32 dev;
+
+			NEXT_ARG();
+			if (get_u32(&dev, *argv, 10)) {
+				fprintf(stderr, "Illegal \"psp_dev\"\n");
+				return -1;
+			}
+			addattr32(n, MAX_MSG, TCA_FLOWER_KEY_PSP_DEV, dev);
 		} else if (!strcmp(*argv, "spi")) {
 			NEXT_ARG();
 			ret = flower_parse_spi(*argv, ip_proto, n);
@@ -3236,6 +3283,30 @@ static int flower_print_opt(const struct filter_util *qu, FILE *f,
 			   rta_getattr_be32(attr));
 	}
 
+	if (tb[TCA_FLOWER_KEY_PSP_SPI]) {
+		__u32 mask = UINT32_MAX;
+
+		if (tb[TCA_FLOWER_KEY_PSP_SPI_MASK])
+			mask = rta_getattr_be32(tb[TCA_FLOWER_KEY_PSP_SPI_MASK]);
+		print_nl();
+		print_hex(PRINT_ANY, "psp_spi", "  psp_spi 0x%x",
+			  rta_getattr_be32(tb[TCA_FLOWER_KEY_PSP_SPI]));
+		if (mask != UINT32_MAX)
+			print_hex(PRINT_ANY, "psp_spi_mask", "/0x%x", mask);
+	}
+
+	if (tb[TCA_FLOWER_KEY_PSP_VERSION]) {
+		print_nl();
+		print_uint(PRINT_ANY, "psp_ver", "  psp_ver %u",
+			   rta_getattr_u8(tb[TCA_FLOWER_KEY_PSP_VERSION]));
+	}
+
+	if (tb[TCA_FLOWER_KEY_PSP_DEV]) {
+		print_nl();
+		print_uint(PRINT_ANY, "psp_dev", "  psp_dev %u",
+			   rta_getattr_u32(tb[TCA_FLOWER_KEY_PSP_DEV]));
+	}
+
 	flower_print_ip4_addr("arp_sip", tb[TCA_FLOWER_KEY_ARP_SIP],
 			     tb[TCA_FLOWER_KEY_ARP_SIP_MASK]);
 	flower_print_ip4_addr("arp_tip", tb[TCA_FLOWER_KEY_ARP_TIP],
-- 
2.53.0-Meta

