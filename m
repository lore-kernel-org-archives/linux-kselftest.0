Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794511488;
	b=Avz30gRXyJZddPtn/hqqdg4dgGKxTwXu0inazJEvuBBRX70CziyfRWuGO6sXXmbn0Q09
	 8go3RaC1iZjagljVYt1yNWyouqykeCdIiSK/EJktRkQ+Y7CzD6D8qU4ebxiVBQDTQ+H+s
	 s8vi6YD30jBp3yRUIN7RbUheQoE/zbKf0hHtHQI2fOPXFw7AOJEbBZSXdCRTYbvwRYyou
	 KcSUjIm4w9BMyoKWm3EOc+JkxAuLjz385CMB3HCdrFR/Uzd7qdkKZ6VE0dB6/ZXlwUDyD
	 2KqPSpePsnesaBcft7dgVmHOuUu+aOMCrXJ2nnj2q2QQ+QtNZVxI2rbK7PdsflLkZiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794511488;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version;
	bh=NeRISJFgArcnSOqYe0kFJa/TowtXkoK9EGSsMbTtCpg=;
	b=Xlc2ioaJOfJznTEig+Vlf3jbJvEDTRoPjqxvDgbyZIjCPPBACsVY7F3KMUpE3FuUXI2t
	 qTaiK7LxlorC78Q6uyX0sfsIrwn8dxz9IFzTQLPITXcXITMppSloSpCAu+m6sVwaJXbcD
	 0C2EJzyifJS2/vxp83Pahucnh5Ym0JA7RdDA8yKCm8ir13YScHZH+M3IUhNhg66r6hHNA
	 umLvoK6vEYyOcJuVIuGdSCRbHwhqs39BDCdjIQbzSH67S4DaBphuxqaOJ3/LMWiXC6gBy
	 Lf/V1CVnXZrjCwanWp3Lb/UkzIh8zCkDkIYW0DiPpMGRkKp8e/HSUyqf7CC/95AWaJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=WV5RBF7e;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A73606A334;
	Thu, 12 Nov 2026 19:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4A73606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=WV5RBF7e
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFaiA33764456;
	Thu, 12 Nov 2026 11:24:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=NeRISJFgArcnSOqYe0kFJa/TowtXkoK9EGSsM
	bTtCpg=; b=WV5RBF7e1aR/FyTK0091e3BxTIREMJY4WEX6rLrdJLOBYu8E0PcYe
	yu77S++LwtADtWtCgZHwELonK6/6F0MUw0KzHZxpdogKvfMoc4Hn2mqX3SMqdtao
	XgQscDYCqAPAHs9/XiWZpsh+JhJRXLEPFirw9v6Aw6e8BmrIDMZkmK+Hh8YIACJM
	9ZUn8ziGXKO2G2F/jYarjVO1zf2Q+x7L8rSi3kEG1LggaGtXqHD1ORZ88XdvG1do
	PEd9Ty2T4AC+cnAdgozKeui04qYR0lgJwlNPLNvzwdRVDexcLm34cljksJ02CTsp
	t9JelVxTPj7SuJ+83U8IT2aklgObZn6Jg==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hw101y32s-12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 12 Nov 2026 11:24:42 -0800 (PST)
Received: from localhost (2620:10d:c085:208::f) by mail.thefacebook.com
 (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Thu, 12 Nov
 2026 19:24:32 +0000
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
Subject: [PATCH iproute2-next v2 2/3] tc: add the psp action
Date: Thu, 12 Nov 2026 11:24:25 -0800
Message-ID: <20261112192426.397604-3-toddfreed@meta.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA3NyBTYWx0ZWRfX50NbHOcuY66Q
 lflqgrMW5e/pPo/mbu1p9KthdB8dT9t8xOlChelSSvJGFIoRDP2bJKE/B8jaolDNNTCOpSPEBta
 wmOuEPUilIMo5KGrTONYz5Cz3aQntsI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA3NyBTYWx0ZWRfX6h0qtqc4oLvI
 ZFsmKWaV0Qzw6RiEaEe30QqfuiwDL1qy6s/DXZnxcXqURZK5PGHxqKkM1UYmfu5Mz4SVN9gehEd
 jdgL7kjD/JinIZ6kUMGDQX18jSdNb9ZwqknGw+me/r01ruuu5XZV1VHnhKcY5LcqIP6qIuB3udd
 B6YmhM7ngLtEmZEfV+4fS2kCZvulSFA6U1mbE8TNFj+lXVwqkKq+QGHUvvlwJuz1IQtOYhUL+P3
 Y/lvmJfQlC+JgYNPOLghXWXf7cbrvU9IyjbTRQS2YstNO8pc5KqYfntdQRj0YFls9OQ4HO2b5ca
 Rkyy4QtcN2JBUbDArCUQS+/uImyj0t/mRj1lm+gyk0vB14ZnqgwtG9TiR9uMUvZUkiGZ/Srn5Zu
 tiwKWe8oVTH95tiyAAP8H84iqEnbhUMT+6CQUzARcusO/kCEFqSs/IVPAl4cBvZQSQn9vDRQpBG
 SG162MeixXGBHDev64A==
X-Proofpoint-ORIG-GUID: 2--E-NdZN-h64ZrFb-IGr8YPkIKqFl49
X-Authority-Analysis: v=2.4 cv=HaaB3SE8 c=1 sm=1 tr=0 ts=6af6127a cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=tpM8CJlwf7uhpglF1g9U:22 a=VabnemYjAAAA:8 a=Czbuyi_FJt95X6wmAQUA:9
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-GUID: 2--E-NdZN-h64ZrFb-IGr8YPkIKqFl49
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01

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
 man/man8/tc-psp.8 |  98 ++++++++++++++++++++++++++
 tc/Makefile       |   1 +
 tc/m_psp.c        | 173 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 272 insertions(+)
 create mode 100644 man/man8/tc-psp.8
 create mode 100644 tc/m_psp.c

diff --git a/man/man8/tc-psp.8 b/man/man8/tc-psp.8
new file mode 100644
index 000000000000..a820ec291015
--- /dev/null
+++ b/man/man8/tc-psp.8
@@ -0,0 +1,98 @@
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
+.BR tc " ... " "action psp index"
+.I INDEX
+
+.ti -8
+.IR CONTROL " := { "
+.BR reclassify " | " pipe " | " drop " | " continue " | " pass " | " goto " " chain " " CHAIN_INDEX " | " jump " " JUMP_COUNT " }"
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
+the association's PSP device, which encrypts it. Use encap either on that
+netdev's egress, or on another netdev's egress followed by a redirect to it
+.RB ( "mirred egress redirect" ).
+If it reaches another device the packet is dropped. Encap on ingress is
+hardware offload only
+.RB ( skip_sw ),
+and in software the action drops the packet.
+.TP
+.B decap
+Remove the PSP Rx state of a packet which the PSP device decrypted, so that
+it can be forwarded. To take only the packets corresponding to one
+rx-spi-alloc, match packets with the
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
+to create it, or to reference an existing one. Without
+.B encap
+or
+.BR decap ,
+reference an existing action.
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
index 000000000000..8356b6fa6a4f
--- /dev/null
+++ b/tc/m_psp.c
@@ -0,0 +1,173 @@
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
+		"       psp index INDEX\n"
+		"where:\n"
+		"\tASSOC_ID := ID of a Tx association, from PSP netlink assoc-add\n"
+		"\tdecap takes no association: match the packets with flower\n"
+		"\tpsp_spi, psp_ver and psp_dev\n"
+		"\tCONTROL := reclassify | pipe | drop | continue | pass |\n"
+		"\t           goto chain <CHAIN_INDEX> | jump <JUMP_COUNT>\n");
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
+	if (strcmp(*argv, "psp") != 0)
+		return -1;
+	NEXT_ARG();
+
+	while (argc > 0) {
+		if (strcmp(*argv, "encap") == 0) {
+			if (psp_set_action(&action, TCA_PSP_ACT_ENCAP))
+				return -1;
+		} else if (strcmp(*argv, "decap") == 0) {
+			if (psp_set_action(&action, TCA_PSP_ACT_DECAP))
+				return -1;
+		} else if (strcmp(*argv, "assoc") == 0) {
+			NEXT_ARG();
+			if (assoc_set)
+				duparg("assoc", *argv);
+			if (get_u32(&assoc, *argv, 0)) {
+				fprintf(stderr, "psp: Illegal \"assoc\"\n");
+				return -1;
+			}
+			assoc_set = true;
+		} else if (strcmp(*argv, "help") == 0) {
+			usage();
+		} else {
+			break;
+		}
+		NEXT_ARG_FWD();
+	}
+
+	parse_action_control_dflt(&argc, &argv, &p.action, false, TC_ACT_PIPE);
+
+	if (argc && strcmp(*argv, "index") == 0) {
+		NEXT_ARG();
+		if (get_u32(&p.index, *argv, 10)) {
+			fprintf(stderr, "psp: Illegal \"index\"\n");
+			return -1;
+		}
+		NEXT_ARG_FWD();
+	}
+
+	/* index alone references an existing action */
+	if (!p.index && !action) {
+		fprintf(stderr, "psp: \"encap\" or \"decap\" required\n");
+		usage();
+	}
+	if (action == TCA_PSP_ACT_ENCAP && !assoc_set) {
+		fprintf(stderr, "psp: \"encap\" requires \"assoc\"\n");
+		usage();
+	}
+	if (assoc_set && action != TCA_PSP_ACT_ENCAP) {
+		fprintf(stderr, "psp: \"assoc\" requires \"encap\"\n");
+		usage();
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
+	if (tb[TCA_PSP_ACTION]) {
+		__u32 action = rta_getattr_u32(tb[TCA_PSP_ACTION]);
+
+		switch (action) {
+		case TCA_PSP_ACT_ENCAP:
+			print_string(PRINT_ANY, "psp_action", "%s", "encap");
+			break;
+		case TCA_PSP_ACT_DECAP:
+			print_string(PRINT_ANY, "psp_action", "%s", "decap");
+			break;
+		default:
+			print_string(PRINT_JSON, "psp_action", NULL, "unknown");
+			print_uint(PRINT_FP, NULL, "action %u", action);
+		}
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

