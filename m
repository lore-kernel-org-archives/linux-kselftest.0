Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023139.outbound.protection.outlook.com [40.107.162.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4953B3DCDA3
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 10:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777458529; cv=fail; b=mex57iK7uuLFarZlTfsPyOLqgIzKF7aIdqoph00lEOtuNuXVCv+nQTGKHq4t9mWZxeuCbmu6LUU/BEBXEw+Fv5JmqDnK71xxCO4QN2jzi/GJ1WQjamQGfwl3dQC1aIyq+V2/xXP5T+UDgB9uyGhg+Ipg3LnTCrLp2lM5iqE+ScY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777458529; c=relaxed/simple;
	bh=9594+nDPSl/EXKX8g/A1Mzfjkjrouz5lD3jIjLlSHVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pSzpX9GTVNHAPgZEoIdFToxif9g+WWKlrhj/UOS7sr0l5StQdnNcSHAYGTpth6oPs5/0ntPpSjwpElg3Kg2J0Bse4NSVACB5TXjDiPi8IHChDSf5d6yMVsXQzDmvFs0zEGqQ5eWMwyEesYFCBsHKbzMFdmScqr/G7wnEtes4mZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=dK+x8n21; arc=fail smtp.client-ip=40.107.162.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="dK+x8n21"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ne2ownLH1dErDKqCfhC9ePxZlt2a28lYHNo1uvEn91d53REytU5Frx2r0mYgigEXE8FKSs6fQ0kQptqlezFcMLfCuBc921Wrb+RXKzGKkNYJU1XMTpqwIz6usGIuyDbZsjxYZajsaH9yhaIsAKQyaDaF0bgzUkVS5kypuRykiu1dST/++5A4NIaXgWVkztUx20MaYOxh9ZXtPILysPZMJkoqKo3fPjClZpLaXIH6cpqd0LQteAa5aTVKNENXHIDJbwfZaGPiaEFNmqqCDDpKjEwYOTG6qd7ILdqZ2ThXqe3fdv4UDo2ac+pt5fqiBvJF5b1bguxWb/U/0fWQ3FAt1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Viw/RlxhEci9SxEyPIoabeRNfPR2vz+PKjLBS+wjqEE=;
 b=e6CEjKTwOqdQu6OqgiCdC2W6QDhWUyjBcM2+fQ210xt3WoB2Fxiz4q9Sh7d5OuHDcaZgkaAJPkyFkFS0Lxr1fksb5ASY9WThYGxQ+qSTWe7weTJAH4IbQmca7iUZYHLtX1G1RNEjjYHOO0INH7JwzqIstM+R6Ox9THKqnexOH643nGa39izvETmDHo/4cpDtCNuVQwWutNZC7zYdZ0LcnFAewyQtFFE0TXHpf9j7kZrvC0FRptVVHbqWJPy1CV58aGKGXsN/m/Av/d2Q1txz1UZqZM/84rLdLtDgj7ac48u96T02IrrU01ICPSPhV3h7Gm/SftVHTYRGrV0mKebaGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Viw/RlxhEci9SxEyPIoabeRNfPR2vz+PKjLBS+wjqEE=;
 b=dK+x8n21uk7BmOYre94mY0F5iFovdP0FO01+WGPfwBFx2eBt2eidK/C6aey8fQzueY5/EiuhvempauhOKJbnHq841YW+fZ7MTgqLOBTvcClVl7klP+RSDEhNw6MXVS8rKSCu+/a6BredH/+qZ6Di1gRnWIc/OuJLjm5PHIPQlu+UFTbzJR0n8qG9PCPd/OlhogxjkUQfN5eV3sORzsl/vocrjBRKIxZ8WawdeezRoHSiEr8M/nFdxbZuaar34zgrEBtmwulw5H8qEWLyjtNfmogiFfPklr/7HGn3m4hl334AT/JcqybngFlm8eBVjNoMLsJfw4vh5ujvUV9Xkg65Og==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com (2603:10a6:20b:4fd::12)
 by DU4PR08MB11078.eurprd08.prod.outlook.com (2603:10a6:10:576::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 10:28:33 +0000
Received: from AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6]) by AS4PR08MB7555.eurprd08.prod.outlook.com
 ([fe80::7d00:380e:b72:55e6%4]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 10:28:33 +0000
From: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
To: linux-kselftest@vger.kernel.org
Cc: eva.kurchatova@virtuozzo.com,
	khorenko@virtuozzo.com
Subject: [PATCH 04/15] selftests/netfilter: remove unused variable 'plen' in conntrack_reverse_clash
Date: Wed, 29 Apr 2026 13:28:00 +0300
Message-ID: <20260429102811.47214-5-eva.kurchatova@virtuozzo.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260429102811.47214-1-eva.kurchatova@virtuozzo.com>
References: <20260429102811.47214-1-eva.kurchatova@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA2P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::18) To AS4PR08MB7555.eurprd08.prod.outlook.com
 (2603:10a6:20b:4fd::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR08MB7555:EE_|DU4PR08MB11078:EE_
X-MS-Office365-Filtering-Correlation-Id: 81c2a245-c437-4330-8530-08dea5da1073
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	lqBji8evTWLVGjyCUnQS01My+Q/YHgvkXPNbncqKUcDtLx2NhLMBO74Yhm6I+oUcFa3fqxDySM48F4jjSS3oekz4H15G6AT0ab0BlKGavTbC0/7tmFk9OVzXHMS4NpIZlV6bmeYyxZewWGo8MGp3Q5hapkcoZovcdwx0DmGiPjU/lxZ5Kv1ed2ptqFxnKxquFaOsmOK67otII09zKPYiTEVjtpd7LJuIwRStV3q3O13wF1c543FwpsXhu6gAkQ0oMvjIb4ZF5j33PDG34nkuBERLuvVBH7pCCM0zbdEW/FRi5dUj6PqiF+eTQ0M2QrYpQjJJAfzkIWcyP1hmeTbj9OH0zu0xi/qeeq6lj1geOrevDSTveFZ296CvyvU3BjObvGM+oZRmugUeeJIGfBNLd3JUVCucXy5zZuuFDhZGk8oTuH7EKXVBKFX83EModgaZx4y0TyMKoJitotZFuFbjrK/ADG0OsvXFYQKZhwrrjFd6+SBlCjjYT/IQSRuOzDWMQekCawHDd5TlDNfZyEfLppQts2uuB9r0NW+sltUnlQxT7i1yt7X09nrZpFu1S4nV5e5PZ7mQzL75wW4XSkbbGagvpd1ulnoPZUC6AaXh5H5QvzVvaO8h3gfNvUPT8UixlR5tE2g+jPolUvBM73fL3vHL/2U/GGAIzi6oWyq2u+TiXKWTNpSrz2/WMSFQ5HaMxHHz4ekD8nx3ZRZOmfUpdzyNEcrnoJeIrH6JAL5fDrk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7555.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2UC5gCGW/ho5I3Sf8mRwXtdlL9rLZmNbd1uVeAbkjSAXlVAjYfXh75Hxfv7v?=
 =?us-ascii?Q?NxTPeomUUNFBXhtXiXyLoOvEf1ZtZc8NbkikT4uSPGbh4CeY+yvqpxfiRY+u?=
 =?us-ascii?Q?SYr4aEaFiJ1OQYZYqeyrdOYbotlntr2NXB1A6Wk5p3MXE3H6dd1I+Cmwe3EF?=
 =?us-ascii?Q?6KvsfU0rnIglcxY8IK95Rv7EeXH/74UzFQl1CYFyreF5R2LBvUVNq9jmhhKA?=
 =?us-ascii?Q?t396Xks4EzzcRBKAm/CrNPbMfJKeWp2SH6W0k445+WHtcom6CF4/CaIwbhY3?=
 =?us-ascii?Q?DGlhAOLp1k+NOiEzn9pA85wTfYaIqzuTvGMpntBk4RnC7z/I4xNQznHMUdY8?=
 =?us-ascii?Q?8YmRbC9fd7ClqxY82OkeDqv5Qkf6YFjt/9dzJTOAm19Oqb7RAnECpSiCo05x?=
 =?us-ascii?Q?Khkj1jf418ZAGxjg6+drlPzk6/zR+pMqO0argJg5C0htQ1kAlLkLzzWAoAeg?=
 =?us-ascii?Q?yo6cm/PVYASQ/g7AH5fKzIJOVgDPVChkfiQ5Kp1fSJclM7z3QczogGLi8JJx?=
 =?us-ascii?Q?bneH/qnHwZPB6nBWJ7xv3ETZPaO2fKDC1/8/EQmprICBpTdmzLKtGGolB2Xf?=
 =?us-ascii?Q?84POJxKCbdNTQXqc2EeUJwfAj5SxlvWgWjRSkQIb5K4HaVfJQT5ZJk1u5dOL?=
 =?us-ascii?Q?7wW4AcM42DeJH9Z2/f5bHKavRDn+TZsTwhWFdSauJaO7+w7SLzPIzY4udRhr?=
 =?us-ascii?Q?5YsTCnTzB71XXezO+2Wf4FkHunsNKFvzV7QphC4M/0IyKJLPwUKTqKx7BuTL?=
 =?us-ascii?Q?PzcfkUkSzn/+CfMNjV/9pcd5pvM7u562/fKgehUG1DHwJsF71P9Rcvq+TOKp?=
 =?us-ascii?Q?U1cPK5NAbiFSSvZopIpvvGGo3Dy+bv/YP8VE/eY2EzzuPWaj4dsNNsFtZVCy?=
 =?us-ascii?Q?S1bwATgqz4XUzCSL5puITFNGXL3X6xprQY1BwLMgVrZvZRYHCuShN4TecaE9?=
 =?us-ascii?Q?lBnSzgoTV/odr/4cjHOZu+NNsBKhJzfmAYEAjIMlb74wstVJbhiELDsPZUoL?=
 =?us-ascii?Q?nQJBONtRTqyO859SalLJh/Spws7yNCc2IZgfy7P/jRZ8X83DzGLIqONv/LXN?=
 =?us-ascii?Q?UQNPCCaq5aMslYeDyyMWv/5SE3w3z4Urnqf0XFmw4dbenLv3BW6BSwzJn0vd?=
 =?us-ascii?Q?Jf0MmbaOnKI7+kudlcORWlPF/H5NhMD4GG3+JJpb6DmYQBZfEJhPzwva4WDp?=
 =?us-ascii?Q?u5rjOXjVNCjmnt78jWo24cBbLj71bI2q+hVesgyaD+J3yqzb5UH1KooUQZwV?=
 =?us-ascii?Q?iFFqRnUB0F6pcu8ap+i4PIzUTI29cT6ge74aQzqbzzBOmDK21bfdbVYVn4be?=
 =?us-ascii?Q?fqsZ2zIAWWOVIch72J2HO7pVNYLaqKXOR+mpfx3fxRSVpYhMNcOkBLZ33Kqx?=
 =?us-ascii?Q?fKh0+hvxvrGRymO76SaUMnf0jNsvZfghJetl6UEyUxqsW+n2fnswRZ990mPS?=
 =?us-ascii?Q?7+VHSAofOiSDtZiGwLMgFi3t5042PsK491vpHqzcEAniiWL7fQZbiMRXkz2R?=
 =?us-ascii?Q?B0m7e6Bzi8UrvxO/C+8a0EQdO5UlPzL2CKwA3U4xe01N2VH9gsf3lHDnqbPM?=
 =?us-ascii?Q?PLczBy++lb5V9gA80bbRCKBdsMt79J4h8aP/a9SiCtOhagDlQfn6dTbnl1l1?=
 =?us-ascii?Q?nwpRXgLxWqlgi7bNH2AUvWjLl7Aa3uTExRKqP7yDvSuKXTDoLENRxYl5Lsez?=
 =?us-ascii?Q?aHXPoPVqlmx70TqP8D6rzyja+wrpsT0yHxjCaK9apxeF1uP+81Z1ecy2aL/u?=
 =?us-ascii?Q?CpSfVyo4JS4+a5u57sO0J7AcbL1LQA4=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81c2a245-c437-4330-8530-08dea5da1073
X-MS-Exchange-CrossTenant-AuthSource: AS4PR08MB7555.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 10:28:33.3276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6e5/qrWVuPqpW233ERtPnm6hLaChnhu9PTgzlsM/C8ZpwpZupi8P/wmrx6oUBuzcOz6AKFHIl8KFfvZpFtkkazdwL/i9Nhmo8MUmA7dEyDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11078

From: Konstantin Khorenko <khorenko@virtuozzo.com>

  conntrack_reverse_clash.c: In function 'main':
  conntrack_reverse_clash.c:66:19: warning: unused variable 'plen'
  [-Wunused-variable]
     66 |         socklen_t plen;
        |                   ^~~~

Remove unused 'plen' to fix -Wunused-variable warning.

Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>
---
 tools/testing/selftests/net/netfilter/conntrack_reverse_clash.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/net/netfilter/conntrack_reverse_clash.c b/tools/testing/selftests/net/netfilter/conntrack_reverse_clash.c
index 462d628cc3bd..441ac9a93eac 100644
--- a/tools/testing/selftests/net/netfilter/conntrack_reverse_clash.c
+++ b/tools/testing/selftests/net/netfilter/conntrack_reverse_clash.c
@@ -68,7 +68,6 @@ int main(int argc, char *argv[])
 	};
 	int s1, s2, status;
 	time_t end, now;
-	socklen_t plen;
 	char buf[LEN];
 	bool child;
 
-- 
2.54.0

