Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793118613;
	b=hB2wj+J+Vl4oWS0CzKe/u4XVjNafzBPJF7tM9rezFEuiPXQh8pWIpp3yo1qiFpiTDoVE
	 N3JlPZ+GHgF1fJoEYG6OYZp4nf8tO2kDfMveoPbNGkeD0UqEfAA2UIkdPusNQjHybu8on
	 7QwuR+8DIq1bC+w+utFA/wk5zygWGY29VDuVpgpbuSiXaqgZ7+sz6oBRGA9KeoAcbNCsc
	 dwNwd0vTdqkRHiD/elp6BR0EEAUWP1Z5RWn0xQ2Vts8VPT5xhJyJLT6bjhP0Mx+h4tqm2
	 FA3CPXtw+2+GfQoxQK83LMAx7Wit0/jJF7UoWhHJ7L6uZPI3yPVQIAudSATtfQdiwiQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118613;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-NV-OnPremToCloud:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=284UMRxBUGDUu63oGfoCGorc3x8OpZwv73h+hLxuTCE=;
	b=ZaWEcrIUDvLE0j/0dU4Mahx0W7+nee4O4jcopvUuhx3/CnTvbqy4+IMZ6Uy+zGZmB+65
	 7N6jpOnF1k3LWc3sklk9usVrgDnN8tDRRvIJCnei/043H0PEkRMn/gdWn4HKLFrMJvkvW
	 zZc1pD2PUGeIe5DsqfSmHNtl8+kcUo8I7q+ojR8+6SBnU3sCYeIU3waBbW0RdUGpIqFlh
	 1lRSvmNEPSPwoxJxJL/PeuWSGmVCK+xAEIFmRbRY7Si3NauAGuP+SxvhWAECMBSHwaqAJ
	 CXtKAOasdLSmkh5qyICeVsk+PgdNYwhePAa49dAK33cqwEAC+zfO2SFlRQC/VegbUlQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=uLOIthP4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.14
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010014.outbound.protection.outlook.com [52.101.193.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2C7606A325;
	Tue, 27 Oct 2026 16:30:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E2C7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=uLOIthP4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mOZzTW7wcJTAVTDO1O6Z9mfGySMIa0qeXjGGYVHFsLBvGV4pmedexCWXnHxcspi2vFzmT+PMncxg+b7i2LLy1WPeXVbFsTlbKWE6PL1fSE0EkMm9y/c6XU7fSe3GWgWWr38aWt1hMvkyj1J8LcSlHrsbPoO3e9buaZjD74CrAR4eYZ+TWGiTEJTOobb7mcc2LE4ZgaF5RP2n/5vA4CJO7rPG7xOXnlrvei/i6IKUtoVGo7l5K1oxw1Vfe9Nm+51+JUDLTQM2/HZG37+6z+mZnQQ44gH4vSDLaT+k9B2rFDppB1YJe/ZM/DpGW4iwmP/3UO+QkgOZhpHCuSFhQfmSrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=284UMRxBUGDUu63oGfoCGorc3x8OpZwv73h+hLxuTCE=;
 b=o0vOvGmCsc3j3dKLFeg2fzBLAyd+1z9fvtX1I1/nd3CDsVUEKkG0ZtHBWiXqkYIxhkMLZmldUN5G+lBgELsvOzpTRNsXhG9VpeTLmfSS18GHMLUNVc2jTy60PkNI/2OJKxCr6l649iuX5AuVGUKMra90WdSrZ/6dNZXXay0zimlMcweJgQjEFFI8WYI92e4dcZ8J9oX8O2G6YvyuVu49A7xnRdV7xinQE73a2VQEYvlLnFHR/QAnZV+5TFB+gxsvVVV4bMIx26f084M/b/1jsgdi0a5ZXSK+iZiV50/OCpwWp0G5GwHPOfHAyzrIegcwGnJE4C9cVYPo1jZZt42j6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=284UMRxBUGDUu63oGfoCGorc3x8OpZwv73h+hLxuTCE=;
 b=uLOIthP47L9TuW9K8qRv0Lz6gUYDDjiq/hER1KclBfIs4gyXeD9H0NnUsYcDBwFDwE6inc2Xi8272kXGJCPBW3SA56fFLIBjzoxZzXOOM9O9h3c9jsuEkqwPg+Dda94VVUAFqmunwJH8VEefWXPqf1TG3He83fLqDFRzZ0Ta2CHA75IumBQtZmoqcdgiR21YF2R04X4ApR8FilJsfeOU5awzLx8pFPF6VGnKd/3pwxu7x/EBX5uci9asjZ0cwapT6i1fF7VoVlyjgI49Dw7DlaArXEL3vCVTQHwD/M7GQH3IZZJ3zCdDDsp2bQFNfqhtyh+oV0CTcSTra0IpsKX+yg==
Received: from BN0PR04CA0170.namprd04.prod.outlook.com (2603:10b6:408:eb::25)
 by DM3PR12MB9415.namprd12.prod.outlook.com (2603:10b6:8:1ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 16:30:06 +0000
Received: from BL6PEPF0006C3DC.namprd02.prod.outlook.com
 (2603:10b6:408:eb:cafe::63) by BN0PR04CA0170.outlook.office365.com
 (2603:10b6:408:eb::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Tue,
 27 Oct 2026 16:30:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.118.233) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL6PEPF0006C3DC.mail.protection.outlook.com (10.167.249.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Tue, 27 Oct 2026 16:30:06 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 27 Oct
 2026 09:29:45 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 27 Oct 2026 09:29:45 -0700
Received: from dgx-1v-42.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Tue, 27 Oct 2026 09:29:45 -0700
From: Jamie Nguyen <jamien@nvidia.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	<netdev@vger.kernel.org>
CC: <kerneljasonxing@gmail.com>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <horms@kernel.org>,
	<shuah@kernel.org>, <linux-kselftest@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH net] selftests: net: txtimestamp: fix out-of-bounds read in raw UDP checksum
Date: Tue, 27 Oct 2026 09:29:45 -0700
Message-ID: <20261027162945.2122306-1-jamien@nvidia.com>
X-Mailer: git-send-email 2.43.0
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
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0006C3DC:EE_|DM3PR12MB9415:EE_
X-MS-Office365-Filtering-Correlation-Id: f395d200-b589-4533-874c-08df34478f7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|376014|7416014|36860700016|261026135527099003|261026140227099003|261022075727099003|261026130827099003|11063799006|56012099006|261022113327099003|261021133027099003|261021135927099003|261022105027099003|261021130227099003|261021123027099003|261022115727099003|261009223027099003|10067099003|261021121427099003|18002099003|261026121527099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	3TAukMUDhcXtHH8Fj46PTAdMT7DadJc72E84PS2J4ZVl88r86OdSpgjQv7r/cYfz1jjF/Dn60bimuK39yh0Rtk4RjfGeVel9lzyW5ssxlaOIowN/8Mv4bOlOII3Vk0PK0/SVekDU+ggNlCqJfKOOJFpmJ/PVr5j708JCL2BlBvAClaJxKjzmZRk682TO7X+isci0m+dTbXreDHjWFpO3m+6cZGP/1xQPLL+ETX03SxcL14LmDygY21O2P0J7FJvPjQEOnp3J55IDhVKHUc5eyQbJJRhk9k36kOWj0O83gRQC3ASnyaa2D8eovRLSdQn57LuNJEa/x8jH81uVlBhG8+/gy3jTHHfzYtEdq5OuD5G6Zgpf97HMXV89zqm/wR9x3NJLMvkG5lMujW7jZpdYFtrivmnhRfLWK/L8AGtrlhSqTXEHnMeVKZcxy5ufVUpxxIKhQ1b2KyV27Sr+xmCueYct7JKPuL3RajQ4X8Rj5lEdeD/CVY7W+urlCvnJZhZNnSlPvYW3TAMDUZFpEstTJa3FrirXmcpi6c2eae0bg9Arw14GXeuJ0BIOIK8bn5Z3ZJmQoQHhslBPbxBs6qah5rzQZD8E6aNEofMKitkyoPOhPc8O6X9oieyK+/8gMMYp1PeSS/e1UXiWtx6yNa2Uozz00cCebNLprSr36pdPCSA4D/VIFgcMdFy+vgbJFfrPJ7nmrxM6mxsInsBY6dGRmQ==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(7416014)(36860700016)(261026135527099003)(261026140227099003)(261022075727099003)(261026130827099003)(11063799006)(56012099006)(261022113327099003)(261021133027099003)(261021135927099003)(261022105027099003)(261021130227099003)(261021123027099003)(261022115727099003)(261009223027099003)(10067099003)(261021121427099003)(18002099003)(261026121527099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	E1QyS3ji+5ufEsHHTVOQyeztBB1FSM551aEvdsY2sUZtXtOhuHw41MzG4IWgjKjL7qwkP1Jj/kBE9JEFVAcwgK4btDj8zIm589LFhmxBEoJoJvQjUjGxdcT6w81GPxJN0KSsmt4X7bQz52j0B1fStZVoRJYLNTLoTJTVSnHcLTyFDR3n7wp15+1iHxASmZjlVZKp5AOBehkMyXZvwRGldLcno9LOPls7P8FBsmAPkSRotnumhuVmQIybiqGxtasiX6wRR0CYYGGR4D2iD0nphwfmXsWtLmy1SUd1mo6Kc5qqFNosk3PsCD19WJXb5G2bt3Syw7RAZA2AbKNCXf5QT6eUQqhKDuPg+qGmrSSSJN1awsMoggXTRmZpPjo2lqsjWhvjKoIzQyq0evoPLjpbWGbOTYsc0qBDVfSssdEDU4/bVYPHbJl+AGCm8AKcxWJX
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 16:30:06.2862
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f395d200-b589-4533-874c-08df34478f7f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0006C3DC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9415

With -r (SOCK_RAW, IPPROTO_UDP) the test writes only the UDP header and
payload, and the kernel adds the IP header. get_udp_csum() still expects
the IP source and destination addresses to directly precede the UDP
header, and reads 2 * alen bytes before the start of the buffer: 8 bytes
for IPv4, 32 bytes for IPv6.

ASan reports a heap-buffer-overflow for both -4 -r and -6 -r. Without
ASan the read usually goes unnoticed, but it faults when the buffer is
the first chunk in the heap. That happens on Ubuntu 26.04, where the
kselftest runner wraps the test in uutils stdbuf, and txtimestamp.sh
fails with SIGSEGV on every run.

Even without a crash, -r packets were sent with a checksum computed
over unrelated heap memory, so their UDP checksum was invalid.

Build the pseudo-header from the destination address and checksum only
the UDP header and payload. -R and -P already write daddr as both the
source and destination address, so their checksums are unchanged. With
-r the kernel selects the source address, which equals daddr for the
loopback addresses used by txtimestamp.sh.

Fixes: b52354aa068e ("selftests: expand txtimestamp with ipv6 dgram + raw and pf_packet")
Signed-off-by: Jamie Nguyen <jamien@nvidia.com>
---
 tools/testing/selftests/net/txtimestamp.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/net/txtimestamp.c b/tools/testing/selftests/net/txtimestamp.c
index 170be19..f7bdf30 100644
--- a/tools/testing/selftests/net/txtimestamp.c
+++ b/tools/testing/selftests/net/txtimestamp.c
@@ -418,19 +418,25 @@ static uint16_t get_ip_csum(const uint16_t *start, int num_words,
 	return ~sum;
 }
 
-static uint16_t get_udp_csum(const struct udphdr *udph, int alen)
+static uint16_t get_udp_csum(const struct udphdr *udph, bool is_ipv4)
 {
-	unsigned long pseudo_sum, csum_len;
-	const void *csum_start = udph;
+	const void *addr = is_ipv4 ? (void *)&daddr.sin_addr : &daddr6.sin6_addr;
+	int alen = is_ipv4 ? sizeof(struct in_addr) : sizeof(struct in6_addr);
+	uint16_t addr16[sizeof(struct in6_addr) / sizeof(uint16_t)];
+	unsigned long pseudo_sum;
+	int i;
 
 	pseudo_sum = htons(IPPROTO_UDP);
 	pseudo_sum += udph->len;
 
-	/* checksum ip(v6) addresses + udp header + payload */
-	csum_start -= alen * 2;
-	csum_len = ntohs(udph->len) + alen * 2;
+	/* pseudo-header source and destination: both are daddr */
+	memcpy(addr16, addr, alen);
+	for (i = 0; i < alen / 2; i++)
+		pseudo_sum += 2 * addr16[i];
 
-	return get_ip_csum(csum_start, csum_len >> 1, pseudo_sum);
+	/* checksum udp header + payload */
+	return get_ip_csum((const uint16_t *)udph, ntohs(udph->len) >> 1,
+			   pseudo_sum);
 }
 
 static int fill_header_ipv4(void *p)
@@ -479,8 +485,7 @@ static void fill_header_udp(void *p, bool is_ipv4)
 	udph->len    = ntohs(sizeof(*udph) + cfg_payload_len);
 	udph->check  = 0;
 
-	udph->check  = get_udp_csum(udph, is_ipv4 ? sizeof(struct in_addr) :
-						    sizeof(struct in6_addr));
+	udph->check  = get_udp_csum(udph, is_ipv4);
 }
 
 static void do_test(int family, unsigned int report_opt)
-- 
2.43.0

