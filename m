Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.153.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794442534;
	b=g65OGyANp1KYu9Gv4noY9/ubFdH9lDh5TG0rrTT/9EkMTandXfvlJSZpk7x8BvZXefAk
	 3SrWwgDyrBbB8wNgvRMIE/pyTfsEf9mnvAlNR6HX8FFCD4HRErMDd6aqpPhFxKawBJ7y3
	 QOAlLEGcEmrRW/m/HkxYN24bwrHR1NWdG8oEY369NdU3utW7KBXoDsTZBNgTxTxo+JJyH
	 hKWPLDSleebstbifBhgklTf7rWVpUs0xJOT41D+k2lgWL3rGdnOIYJQ2If2jMLyR7fNA+
	 vyIw1WjhtGImejwmClF2Bxy/nHpaOyWUS6IZh8IQGLbcYTtn41ROXP5S7sLlY6XHEvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442534;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version;
	bh=dZ3GOs4aZybdlaCFCRD6vRPuIUu3rdiSAF303L4E6h4=;
	b=VHkNrFT374LOe0VZP8djMS6GrOjwSBwkV05MzLcq5q35dBLjkf2BLlBDYpvAAlXh8azX
	 Z8tEFrVlV6bBlB9J4LAe2uWb1wLBct5EBsTRfWCLDhID1jNj63CwR2O5qwkQ4c0Z0Qb1m
	 HeXhDi2S5rQqPFztGfP6B9avw0PUZlnN8QomJ3dGlnbCQtp3FmrKskrGM2BQJYH82awj8
	 SUzpMgh3wdTcYlYeNUftEXh1jfZoy+u62zIvlgygoiLyjBtJ7DXPJ9cv81PA15fgb2Vyq
	 6TJ5Ky9ia4OX5g3p5eCRleXW9kOtIFjK7wk83IOwbxMpo+oFCeXgAVknW9x+oqKJ3NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=ncNX1b4p;
	arc=none smtp.remote-ip=67.231.153.30
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45209606A331;
	Thu, 12 Nov 2026 00:15:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45209606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=ncNX1b4p
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
	by m0001303.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AC02QW03482535;
	Wed, 11 Nov 2026 16:15:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=dZ3GOs4aZybdlaCFCRD6vRPuIUu3rdiSAF303
	L4E6h4=; b=ncNX1b4psDVW7X9ai1KnnYbb5jJSgkw67xQQ/wQYJ3K+aeFrgKngl
	Xzcp89/SI8O5VilsnAKuNuBMmB3VbunzqV3Si9c60Ehar9k2R4G68TVg9LyeL8vV
	zZ4OgoiI6hEt/1sTANMVhItLTPV2jvSO0u4RscpQVfamktc+IF1W7m4eo5fACVNO
	CD0yZWyB9lDZG77wIASuLgrjc4VVKXJg/FMuFe6yKgXU5Ww+5s/rl8mxUYZTocPH
	6sm7NT0FVUf1QZw8UHPyKn8A4cFU9zhDRgIF9bPFfW9w7U5oXInFiWIQxOtUcbyi
	KwpdRmw6svmmfRP09ZqyLmXJPXcaZqvAg==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by m0001303.ppops.net (PPS) with ESMTPS id 4hv72pujpm-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 11 Nov 2026 16:15:29 -0800 (PST)
Received: from localhost (2620:10d:c0a8:1b::30) by mail.thefacebook.com
 (2620:10d:c0a9:6f::8fd4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Thu, 12 Nov
 2026 00:15:28 +0000
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
Subject: [PATCH iproute2-next 2/3] tc: add the psp action
Date: Wed, 11 Nov 2026 16:15:11 -0800
Message-ID: <20261112001512.3598626-3-toddfreed@meta.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112001512.3598626-1-toddfreed@meta.com>
References: <20261112001512.3598626-1-toddfreed@meta.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAwMCBTYWx0ZWRfX5ELiK12V3qYp
 +PJrRJgoqRB8sQ5ZzyMI/5lW3V6lfqwJyjNan2EHQeDpsfAhN3vG5Mia16YGz6ZRFfA4IoIu3sI
 gEGvEa5n+QoErKxFrI7l4f46Oy1Jkw6JwB9GhnT1rcArhaNWpfuVgURososRpFZ87bQL+eFKzUw
 irXlhYZESyeb56dVV+diKdh45Yc38NxnS2HwrLw5IR/b9vvgjqSonit7f1z1SA7uQqt3iUm2liF
 uMtBfB778PifZYukXvQdZa/NPzYiosWFAb3VNK10qkWdlUvdIafXI7ms/nEJIGYg4Rga0WKykpG
 TEP8Ale2u4Nyfjqwzr6B5IgoezD40nXxhdfWzab1FKmCZ9KC11stX84CvdAnBOLGaoyoTgMoU3Y
 OIjzAlDNaSaiiFSabjM/oD1ExEB6Ijm42oTsQX9fiKOBsJ3+165UM2EK1jsFYEVSSnaZi5h2C0g
 XqMXH2Bp1VtGeUSs0SQ==
X-Proofpoint-GUID: qf0oo_37JWUI6ekT9bKUKpZxAW6-hXU1
X-Authority-Analysis: v=2.4 cv=TtlzFzXh c=1 sm=1 tr=0 ts=6af50521 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=_78whYxrdx1mplLwxq1U:22 a=VabnemYjAAAA:8 a=v4F3kEuSg3BA5fqWXOkA:9
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-ORIG-GUID: qf0oo_37JWUI6ekT9bKUKpZxAW6-hXU1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAwMCBTYWx0ZWRfX9+6nt9Bkn7Al
 1ttkCG4+X5C2a0MMlLvdVW1B8ZG+/C3Ofbz7zgMLX3RKbSh07dWsoP0u07qL1AgepHuthxOirKD
 PT8ot0IU+NP7cb8CjLyc0YeuHAXAIuw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_06,2026-11-11_03,2025-10-01_01

The psp action applies PSP (PSP Security Protocol) encap and encryption
to packets, separately from psp socket offload:

  psp encap assoc ASSOC_ID   attach a PSP Tx association, created with
                             assoc-add over the PSP netlink family; the
                             association's device encrypts the packet
                             on transmit
  psp decap                  remove the PSP Rx state of a packet the
                             PSP device decrypted

decap takes no association. To take only those packets which belong to a
single rx-spi-alloc call, a rule applies the corresponding flower psp_spi,
psp_ver and psp_dev matches.

In JSON, the verb is psp_action. The action is documented in tc-psp(8).

Signed-off-by: Todd Freed <toddfreed@meta.com>
---
 man/man8/tc-psp.8 |  90 +++++++++++++++++++++++++
 tc/Makefile       |   1 +
 tc/m_psp.c        | 166 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 257 insertions(+)
 create mode 100644 man/man8/tc-psp.8
 create mode 100644 tc/m_psp.c

diff --git a/man/man8/tc-psp.8 b/man/man8/tc-psp.8
new file mode 100644
index 000000000000..4973bbbe05fa
--- /dev/null
+++ b/man/man8/tc-psp.8
@@ -0,0 +1,90 @@
+.TH "PSP action in tc" 8 "9 Nov 2026" "iproute2" "Linux"
+
+.SH NAME
+psp - PSP transport mode action
+.SH SYNOPSIS
+.in +8
+.ti -8
+.BR tc " ... " "action psp" " { "
+.BI "encap assoc" " ASSOC_ID"
+.RB " | " decap " } [ "
+.IR CONTROL " ] [ "
+.BI index " INDEX"
+.RB " ]"
+
+.ti -8
+.IR CONTROL " := { "
+.BR reclassify " | " pipe " | " drop " | " continue " | " pass " | " goto " " chain " " CHAIN_INDEX " }"
+.SH DESCRIPTION
+The
+.B psp
+action applies PSP (PSP Security Protocol) encapsulation to packets using keys from the PSP netlink
+family: Rx SPIs and their keys from rx-spi-alloc, and Tx associations from assoc-add (assoc-get,
+assoc-del). The PSP device encrypts and decrypts the packets.
+.SH OPTIONS
+.TP
+.BI "encap assoc" " ASSOC_ID"
+Attach the Tx association
+.IR ASSOC_ID ,
+created with the PSP netlink
+.B assoc-add
+command, to the packet. The packet must then be transmitted on the netdev of
+the association's PSP device, which encrypts it: encap on that netdev's egress,
+or on another netdev's egress followed by a redirect to it
+.RB ( "mirred egress redirect" ).
+If it reaches another device the packet is dropped. In software, encap runs on
+egress only: encap on ingress is hardware offload only
+.RB ( skip_sw ),
+and in software the action drops the packet.
+.TP
+.B decap
+Remove the PSP Rx state of a packet which the PSP device decrypted, so that
+it can be forwarded. It takes no association. To take only the packets
+corresponding to one rx-spi-alloc, match packets with the
+.BR flower " keys " psp_spi ", " psp_ver " and " psp_dev .
+.IP
+An SPI from
+.B rx-spi-alloc
+is valid until the PSP device's key has been rotated twice. After that, the
+device can allocate the same SPI value again, and a rule which still matches it
+takes the packets of the new allocation. Delete such rules before the second
+key rotation after the allocation; the PSP netlink family notifies each key
+rotation
+.RB ( key-rotate-ntf ).
+.TP
+.I CONTROL
+How to continue after this action, see
+.BR tc-actions (8).
+The default is
+.BR pipe .
+.TP
+.BI index " INDEX"
+Use the action of index
+.IR INDEX ,
+to create it, or to reference an existing one.
+.SH EXAMPLES
+Encrypt the packets to 2001:db8::2 with Tx association 3, of the PSP device
+of eth0:
+
+.RS
+.EX
+tc filter add dev eth0 egress protocol ipv6 flower dst_ip 2001:db8::2 \\
+	action psp encap assoc 3
+.EE
+.RE
+
+Take the packets which eth0's PSP device (ID 1) decrypted with an SPI from
+rx-spi-alloc, and remove their PSP state:
+
+.RS
+.EX
+tc filter add dev eth0 ingress protocol ipv6 flower \\
+	psp_spi 0x80000001 psp_ver 0 psp_dev 1 \\
+	action psp decap
+.EE
+.RE
+.SH SEE ALSO
+.BR tc (8),
+.BR tc-actions (8),
+.BR tc-flower (8),
+.BR tc-mirred (8)
diff --git a/tc/Makefile b/tc/Makefile
index 6264a772e686..f0b3ddb10155 100644
--- a/tc/Makefile
+++ b/tc/Makefile
@@ -49,6 +49,7 @@ TCMODULES += m_ctinfo.o
 TCMODULES += m_bpf.o
 TCMODULES += m_tunnel_key.o
 TCMODULES += m_sample.o
+TCMODULES += m_psp.o
 TCMODULES += m_ct.o
 TCMODULES += m_gate.o
 TCMODULES += p_ip.o
diff --git a/tc/m_psp.c b/tc/m_psp.c
new file mode 100644
index 000000000000..37ddff25ed14
--- /dev/null
+++ b/tc/m_psp.c
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * m_psp.c		PSP encryption action
+ */
+
+#include <stdio.h>
+#include "utils.h"
+#include "tc_util.h"
+#include "tc_common.h"
+#include <linux/tc_act/tc_psp.h>
+
+static void explain(void)
+{
+	fprintf(stderr,
+		"Usage: psp encap assoc ASSOC_ID [CONTROL] [index INDEX]\n"
+		"       psp decap [CONTROL] [index INDEX]\n"
+		"where:\n"
+		"\tASSOC_ID := ID of a Tx association, from PSP netlink assoc-add\n"
+		"\tdecap takes no association: match the packets with flower\n"
+		"\tpsp_spi, psp_ver and psp_dev\n"
+		"\tCONTROL := reclassify | pipe | drop | continue | pass |\n"
+		"\t           goto chain <CHAIN_INDEX>\n");
+}
+
+static void usage(void)
+{
+	explain();
+	exit(-1);
+}
+
+static int psp_set_action(__u32 *action, __u32 a)
+{
+	if (*action && *action != a) {
+		fprintf(stderr, "psp: only one of \"encap\" and \"decap\"\n");
+		return -1;
+	}
+	*action = a;
+	return 0;
+}
+
+static int parse_psp(const struct action_util *a, int *argc_p, char ***argv_p,
+		     int tca_id, struct nlmsghdr *n)
+{
+	struct tc_psp p = { 0 };
+	bool assoc_set = false;
+	__u32 action = 0;
+	char **argv = *argv_p;
+	struct rtattr *tail;
+	int argc = *argc_p;
+	__u32 assoc;
+
+	if (matches(*argv, "psp") != 0)
+		return -1;
+	NEXT_ARG();
+
+	while (argc > 0) {
+		if (matches(*argv, "encap") == 0) {
+			if (psp_set_action(&action, TCA_PSP_ACT_ENCAP))
+				return -1;
+		} else if (matches(*argv, "decap") == 0) {
+			if (psp_set_action(&action, TCA_PSP_ACT_DECAP))
+				return -1;
+		} else if (matches(*argv, "assoc") == 0) {
+			NEXT_ARG();
+			if (get_u32(&assoc, *argv, 0)) {
+				fprintf(stderr, "psp: Illegal \"assoc\"\n");
+				return -1;
+			}
+			assoc_set = true;
+		} else if (matches(*argv, "help") == 0) {
+			usage();
+		} else {
+			break;
+		}
+		NEXT_ARG_FWD();
+	}
+
+	parse_action_control_dflt(&argc, &argv, &p.action, false, TC_ACT_PIPE);
+
+	if (argc && matches(*argv, "index") == 0) {
+		NEXT_ARG();
+		if (get_u32(&p.index, *argv, 10)) {
+			fprintf(stderr, "psp: Illegal \"index\"\n");
+			return -1;
+		}
+		NEXT_ARG_FWD();
+	}
+
+	if (!p.index) {
+		if (!action) {
+			fprintf(stderr, "psp: \"encap\" or \"decap\" required\n");
+			usage();
+		}
+		if (action == TCA_PSP_ACT_ENCAP && !assoc_set) {
+			fprintf(stderr, "psp: \"encap\" requires \"assoc\"\n");
+			usage();
+		}
+	}
+
+	tail = addattr_nest(n, MAX_MSG, tca_id);
+	addattr_l(n, MAX_MSG, TCA_PSP_PARMS, &p, sizeof(p));
+	if (action)
+		addattr32(n, MAX_MSG, TCA_PSP_ACTION, action);
+	if (assoc_set)
+		addattr32(n, MAX_MSG, TCA_PSP_ASSOC_ID, assoc);
+	addattr_nest_end(n, tail);
+
+	*argc_p = argc;
+	*argv_p = argv;
+	return 0;
+}
+
+static int print_psp(const struct action_util *au, FILE *f, struct rtattr *arg)
+{
+	struct rtattr *tb[TCA_PSP_MAX + 1];
+	struct tc_psp *p;
+	__u32 action = 0;
+
+	print_string(PRINT_ANY, "kind", "%s ", "psp");
+	if (!arg)
+		return 0;
+
+	parse_rtattr_nested(tb, TCA_PSP_MAX, arg);
+	if (!tb[TCA_PSP_PARMS]) {
+		fprintf(stderr, "Missing psp parameters\n");
+		return -1;
+	}
+	p = RTA_DATA(tb[TCA_PSP_PARMS]);
+	if (tb[TCA_PSP_ACTION])
+		action = rta_getattr_u32(tb[TCA_PSP_ACTION]);
+
+	switch (action) {
+	case TCA_PSP_ACT_ENCAP:
+		print_string(PRINT_ANY, "psp_action", "%s", "encap");
+		break;
+	case TCA_PSP_ACT_DECAP:
+		print_string(PRINT_ANY, "psp_action", "%s", "decap");
+		break;
+	default:
+		print_uint(PRINT_ANY, "psp_action", "action %u", action);
+	}
+	if (tb[TCA_PSP_ASSOC_ID])
+		print_uint(PRINT_ANY, "assoc", " assoc %u",
+			   rta_getattr_u32(tb[TCA_PSP_ASSOC_ID]));
+
+	print_action_control(" ", p->action, "");
+
+	print_nl();
+	print_uint(PRINT_ANY, "index", "\t index %u", p->index);
+	print_int(PRINT_ANY, "ref", " ref %d", p->refcnt);
+	print_int(PRINT_ANY, "bind", " bind %d", p->bindcnt);
+
+	if (show_stats && tb[TCA_PSP_TM]) {
+		struct tcf_t *tm = RTA_DATA(tb[TCA_PSP_TM]);
+
+		print_tm(tm);
+	}
+	print_nl();
+	return 0;
+}
+
+struct action_util psp_action_util = {
+	.id = "psp",
+	.parse_aopt = parse_psp,
+	.print_aopt = print_psp,
+};
-- 
2.53.0-Meta

