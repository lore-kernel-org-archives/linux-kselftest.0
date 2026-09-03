Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021123.outbound.protection.outlook.com [40.107.130.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377614908AB;
	Thu,  3 Sep 2026 10:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788432653; cv=fail; b=Px/C0H1GiG5WDD7/Pf4lWn7bj7INNCDok8l5ma9HtJ+wyLUGIaO6+WLB4sAXoK4QrLUEVF+hqrLeuP6EOxE81wGvml/jbS47Vei26LGNS/a6OR/Xstdnoi1wvzNeIBZZ7nL04Gs9BtHuuCI9cwnLhaaFDyg5WgQPFa/7KGiK8vw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788432653; c=relaxed/simple;
	bh=9UkNPA8ZVc6TsZGis4DxjxYoTT5Uun5AyoAnucs56Sc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=s8nVS8sCmUzGRi42MzKl7qgpHQCZf/jO3w41vHAiryA6n6LyN6hQJ5X3I/+QbnJBGPDuR3dqxlb2ZCSALBLe8rt1JTzL8nPHAcFjrOvDSW/42nMm2L5anut4hTAPbsdswDVXsAqo4AFf2lUOMVS5zjOyDog9qaTpowRlqWZdToE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=codasip.com; spf=pass smtp.mailfrom=codasip.com; dkim=pass (2048-bit key) header.d=codasip.com header.i=@codasip.com header.b=l6bG3CAu; arc=fail smtp.client-ip=40.107.130.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=codasip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codasip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codasip.com header.i=@codasip.com header.b="l6bG3CAu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oN63mQbESXR7Djd+b8Ymzg2R37Kss3DdRi7SnvfGqQIH9bipeQYWZarWGquYrGWlzPMsTajYYiiIag0w0oBmgBMTVF3+zIcI6J84Oe11XedxPtpq5g2ih0JlGNQyJ+VLKQDPZ6JBixBq3rOWJan7y7MAeFpEPEhQ9rybfV36LWITvZUVLgCmVOKaA4GU0fbpiAmNKSetbxtDN5rPU3wWRo7UWPERAUzs4rYLSAu45xFVF1zzRWH27RQFbZs8/V7EmnnHsuz+cuQoGJi9UGhbZdpCHUaeWxpGNGqOr/OzNbBUZ4KuoArrvPm8sHAOFtD6LsqoFa70sP0XY5ZrXbPoqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=52RIKFC/POKjH/tp9EpwXQrArnBFjHEQfyQjYva7UpQ=;
 b=xMZhj2HbJFxZ494npTehgiAbOfI5LqQuvk7DZJcYaHj77L/iQeIV11BrWoc5EXqTJjC9bPKqBaaHsFUwlCvT41G7Ezr26cSsE602SdgiIxFqeI8xapBFdgD7Peed4NZW2nLA+W/XvHE6iHZDmp0Q9pJ4+9mLtUhx/7UPwCV2J2gA1fnA9zeuyGYZUcdqApO7rxEC0Hte4z9o5UTgpgc/f8Ou7HR5ClxyGYvke1uCk6I4/DdjepDwCD1fLkpNHfWaacn1YH/EubirUF9aFemUxKG/4WLC46TkuExfB7ASAiVF9VsHNtXaovkYoMY12jMLnTUDSolEQbI8wNLtdVVfdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=codasip.com; dmarc=pass action=none header.from=codasip.com;
 dkim=pass header.d=codasip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codasip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=52RIKFC/POKjH/tp9EpwXQrArnBFjHEQfyQjYva7UpQ=;
 b=l6bG3CAu8gApDSlgdKULGqBWT7an40aU2mimOAVRf6uPeujxCofrYJhYPaPJqTgmLGrv4M9rx26cnPC0RM+tbAlM91fN97yTliAzpLo5cr/0yXETRUOvRO/De2RBDlzxJ1lh1La08mOIAK4GDXB2zmjmstVJkI62H3oK3gEyL+vzcdZLVDv/N5hu+s9T+101gdFpKQAC6dDXMTtcHsRC4AQp6QeIpLlXDedyt7KgomDrHEhnWAVmH66tNWST+F8zQU1vNxOSUhFpMQ/HE/Eamgu1E4YBGFmYrh0ASWiHLRX9RZihhUcbNjKjZ+Z5kEnthrTcsudtrDMpOxcINzaEXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=codasip.com;
Received: from AM7P192MB0787.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:17c::14)
 by AMBP192MB3404.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:759::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 10:50:47 +0000
Received: from AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
 ([fe80::c1d1:f20d:9fb5:72d3]) by AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
 ([fe80::c1d1:f20d:9fb5:72d3%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 10:50:47 +0000
From: Chris Gellermann <christian.gellermann@codasip.com>
To: shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Cc: reddybalavignesh9979@gmail.com,
	richard.weiyang@gmail.com,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Chris Gellermann <christian.gellermann@codasip.com>
Subject: [PATCH 0/2] selftests/dma-buf: Minor improvements to udmabuf selftest
Date: Thu,  3 Sep 2026 12:50:16 +0200
Message-ID: <20260903105018.565425-1-christian.gellermann@codasip.com>
X-Mailer: git-send-email 2.47.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VIUP296CA0017.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34e::10) To AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:17c::14)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P192MB0787:EE_|AMBP192MB3404:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ae51257-60af-488b-eefc-08df09a935ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|10070799003|1800799024|366016|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	xtpkaVNGnZ9W9XI7kVuWY3AghF9yVdj82Uq8PW0I7zcXxxAeVCrUMcpZ+SIZ1xLkbU6/K2Ma18OgLRIWZZ8FkzBgQfbDoO9Xd9cAdFKqP3WmMdMWJjN+nBzPeXQMJatR7rlTXUpu1TUrEpdnnOwd2Uq8OzBnZFPNtm+uNLnKP+eKIvI7Br0Kw/NIU0ZqRYha8i0x0X7rYffaRORMpI0e7WV5RmyxbPbJ2w7DCrotBmjGD2k8Pb4sKkiGe3M9GvPMP2hU09EsTmTkCtC9f1SL4rzvgekK3NnhQa/GJuk2PTfrQqk0dgiWR5Mi8YNWFqTn1MeAYEzVueUrzy/a3n2nRwpvrEsQwshfQs0JDGBfmX/A4NZ8FGOhnjAA3W22NtvGc1zP6Yz0l/4u5VKlsgD9pNjlpuflFT89NJB9qlmBexrFJbhzcqsIoZlIQdoVbQWRJUSEe1Hix0AcWf5ckhB8QYhHbcBgR0AJFzH4sPTZwRctXA3MPYRgi8EYeak45Ro+lbwbgp5uq3L1tXKS39/vq6ZxyAASXSMafk3E6m6RCUs31aF57tbRCKQ/mLUFQ7fFl0cf03i6hog37o8ghiueOYIvAn/qdWCro0W4xrhEJlYApppSkKOPbVdnsnx0ptk5ryRhXkWyjFyCiE2HvNYWS07m1OtIjlO0bTE41r42yHM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P192MB0787.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(10070799003)(1800799024)(366016)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?027IOKaCzB8er8fajzvELWLYUpsLjYwbWz1zHGbn09bZVf4/fRHmruZ0O1BI?=
 =?us-ascii?Q?d9M57tYWgSorR74ReSh54NJGeZA/yup0MW19XtfbWviI+QScBRAbgm2b/f+t?=
 =?us-ascii?Q?o3vELWmLGjFM58EitlSETOPXO8BpAohgYHdI7pL0pl+X+vTCG/BI1CnfvRQu?=
 =?us-ascii?Q?hHbWIzxZG8wTwHEstHUZvPy2LuatWvxKOlClYUd49m9tY3+kRR5//AliG0uL?=
 =?us-ascii?Q?YpRag9f0NyiWdKLBQIbJd2W8MUOrMrWpG/dR32VKXvdmv0xWLbAEJZrhlorp?=
 =?us-ascii?Q?JlLfu4xjkzc/FTMuWXX5qyIM6P5CVaIlJ+ui92MXT3c/UIWa6AQ1c5rkKDE0?=
 =?us-ascii?Q?G0p2aHeih2SxLeGZhVhbcZCPHXgI/Ty+SOEr6IR2f7nitu8bLBPLzF4WnKZO?=
 =?us-ascii?Q?zVD3khj00Hy/Zdc/KcAYRYH4ENG04wFWjSREfI42Jk75o2aLJ0RYrcVe/Bjm?=
 =?us-ascii?Q?qHK6zOMpVmH/yqynECd7uZdtPK21wrNsxqYXFxWwnrr3H//USQG3OCw5SpoW?=
 =?us-ascii?Q?+jDwMFYyoqPCu9pLc7t4jlAI099pvmQZhqy2XFw3kJXI9T3xv5RjeLLRHsY8?=
 =?us-ascii?Q?38AFReqgSSwCyZzzNhGkdGMO/w1OUebgTZZD9B9/7msbTTz3EPMCX+C9wYnQ?=
 =?us-ascii?Q?Xig1w1DFbcKv/iauvfAmsfG/k/23OgwFpJfSQoS7tzuEUVexHhdk0JRuspEg?=
 =?us-ascii?Q?vXspRt2fchFunL3y8v47nC8f2xkk6AiDrxRhYh/4CsxCaPXThDT+oS4wTeGA?=
 =?us-ascii?Q?bXpkTn2z08RX5NQDlE0JpAAsaA7L0EgXy6f3SEe+yUaFkEDvB5pOycD5U1M5?=
 =?us-ascii?Q?SauNr2d8QIfkNn5aug/jK/xRAf8oVUfBfQeLnH6ElTwDwbmOsFHdFY08QECd?=
 =?us-ascii?Q?tMChyHYBu2ARlGfmhPs5UfGDiZhKa/eIPgxWK5HSzr0JesLrNs2A7cXNl4CL?=
 =?us-ascii?Q?mUIkY7xTTE2IKQ2Z8JizEu4C2nWPOT7fMJ3sZgyRJG0bmgv4sDHkvApUDmLQ?=
 =?us-ascii?Q?uZq4x3GvDMt4l9dKmFdhJX3fHqbcO85C6pte+KlIHcXNWPBGtagKmAvMHlqr?=
 =?us-ascii?Q?R99tP0GyEeMJv3GKOnNix8+avbc0Oo8DNZwfol2GcUKKlhIdzeC+VZQC1HEr?=
 =?us-ascii?Q?r3LRLb99QYIaXQpR25Pt+TIV1opnCBpiBP+AVc2KCoAuzxwVW9PXiEZ2hfvm?=
 =?us-ascii?Q?dSf8+z18gtqSEVuhzRf+5bZOaWR3gGDVpbwuBn2tlwcZGzpcF5zD6D6KzWC0?=
 =?us-ascii?Q?uG1jEK0WAZeZ1R9W5JkgMFc3f/9oDvR5kFRY3sOX0kstyv34pjWN17rNBavW?=
 =?us-ascii?Q?3H/zgKev90Cs7LV2n0H8pniGqUN6CUo3Nl60f6NV+hU2DZ17QtvUrBHhyon1?=
 =?us-ascii?Q?Wx9uN4a4wF5z8PZUfxmhXe8WQCr5wgggHpyg5EHLrIYbiTB5kHG+2p2Zm21O?=
 =?us-ascii?Q?W+WBNd8jpXrDJpdwgJMZpKobyarXokuxgV8H7BP7MRgrTEYLfHHIyEx3dj4Q?=
 =?us-ascii?Q?xTwCbRAQpBBfHBSZUkaoc7+pjVW4BtRC3ahqzBh9yS5Thi+OakCdxPVVaLrz?=
 =?us-ascii?Q?Q1DwEktStnC76rWg9Z7A/8o3bIQzcj9KHYLJjm8qy8eu/2ZjhYPOcMrPy9vb?=
 =?us-ascii?Q?iLiCEnvjnq7t9ge4vURx/45XyR10GHEtozQNYJ3ATCO/rDBdullZQaS4I5Vl?=
 =?us-ascii?Q?nDVeWjtOGabcD5Jo7Z+EFEQ1JmLQ95Z2DNPMA7jLdPupmaxE2e1gR4ostPkR?=
 =?us-ascii?Q?thZ96YMx2Yt6f+VHOzPEaKuPRTgfq6HaKAgOpavsmS+1cX3nCvTNTwV0AfLR?=
X-MS-Exchange-AntiSpam-MessageData-1:
	Gll6tTIXTuh41YNxIejHtzDhZD2Gprj3QcOPmHsx32tzj6UncdN/EDCm
X-OriginatorOrg: codasip.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae51257-60af-488b-eefc-08df09a935ef
X-MS-Exchange-CrossTenant-AuthSource: AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 10:50:47.1571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d91ffef-bb81-4cbd-b9b8-552583685f20
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EKqYBdLGyJU1H6mUYKToxPbdGvmMSIZzYO7NczsbAwY6WwRKw4WtbUOhzc5rwJcx2DAVlLyh/tXkpVIJpidDlxu9lR+eniyNImyiaAJXLTKbClzfzJhG2JA+ZRJfPMsH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP192MB3404

Hi there,

two minor improvements to the udmabuf selftest:
  - converting GNU-specific off64_t to 64-bit off_t for portability
  - instead of uncoditional failing if not enough huge pages are available, check
    beforehand and skip the affected tests

Best,
Chris

Chris Gellermann (2):
  selftests/dma-buf: Convert off64_t to off_t for portability
  selftests/dma-buf: Skip some tests if not enough free huge pages

 .../selftests/drivers/dma-buf/Makefile        |  1 +
 .../selftests/drivers/dma-buf/udmabuf.c       | 50 ++++++++++++++++---
 2 files changed, 44 insertions(+), 7 deletions(-)

--
2.47.3
