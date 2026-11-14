Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.58
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794664893;
	b=S/HX/DZnCK+MRYDL3wHIkLfHBJOFiy+S268pNREtSzEhEzsKNgF6F/11KpLjcIsuEuY7
	 MGtykI7OIvVUDYGX74PqNJsI4L3Vf8XL//uLAEz6F8s7/TLfLbjc9UNocIO7HNM/lcpIF
	 MJpRqxAN0D0CxhTPLbVOjAjiKchaNhA4li1qJ00YH02rm1qNz18SRJlt9hZrvUjgvDVvk
	 Kx0BPEthYJ2h0Ls96FHAGgUaTyetOWL6qWXf/8nW9tyUj7Ca+tDjbioDsW2U2mshf9lED
	 A6yDqs8xetDe1KAeI1FuGGOng3oiYXBOHw7WNzbLCWI09A4MAe3yQ0q3DeloDnO7mew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794664893;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=+SLTM6oj4Hp+3JVEJeLw0qiEEKr0kwGunMWiDoj4IXc=;
	b=Ezw5bCIQf7u5Tgj/DuHahlAsiGv3S+WBECtIlzWhPHZmqqJwJJZE60eX075Ba0TpWGMZ
	 HoOVvNRkQxjcy16KT4x6FaDF88X3/G2A1RYbMJBj6xiftbKcc2qdf7ZA7gko7IqCV6C7p
	 2npuAL7UcGylV3qeHMlDUFZAVmz7YS2tS83NUtQlkdcYsOlXXCSqwVqJS76KRaxK7pmxn
	 FBoTPbzmGZekRiFVosc14Yj2/R/urzSsh/HGTpu31ICzGTNoFshsP7v/fYkHmL0t6JqpC
	 vAY5SP5JlBslKd54VwCW/Zt99/n3FO2PhW7RGMb8vvVe6Sdx3SHdSOlSfxiSuDymEtg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qAyb+pJS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.58
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011058.outbound.protection.outlook.com [40.107.208.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0011606A330;
	Sat, 14 Nov 2026 14:01:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0011606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qAyb+pJS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q2ncHhBBiIk4jyf4jLPD/ZQ3cJYx4XYhaRAZW3WFSmyQv/1NQb9p6KoyGo869OOFLQakEJtaXBJjh5p8PtoRmQURffiF0Q2h39mGObkZtL6+QV0Vhji+LRkx+d4aMMzVpjdYkMOQTwyWBDmqs+VFJnUp2SKT1tBme9toTdN2lOG8FhZX3aOT4n7KHdJlfwrgoHmPAt3x6bsTdTjBJwzHS5H4NHr/6n+DAJWVdO2krWGutzpSLYPiOQztIXyY4CPXRVDcyflnn/Q35igAEXTV33PTM3WTFQxaFWTd5xVqt4sAtSkRifzo10WsraeSCoFOFIkBk3Vera+0eKIho5Rj7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+SLTM6oj4Hp+3JVEJeLw0qiEEKr0kwGunMWiDoj4IXc=;
 b=osxq0MqFnpS3zhb/5tHUtcqZYvuSzp/kdYH4vuXDdbIVw/u11A6sslMoVOhhJr9JzYkYzXFzaqJDhnRgkUMXsRLXA81d1xxqeX+3mJtAQZjyN6QNcBy/SRoYojup6X+qgusHN38IWYOldzW4IheSzYmMHZ9LmbWE/LBpk5IC8lhJiVK7peY6dzXdzLlKbw0OJ84hbRIyH+FrWF3FDkNVUQ+HUx6vHUISe734K0esY1sLDX4DWC+y9aNDdFNmt2hdRKMwdlGziqxDSDE1xDdUjues00Q2+6caWzTsZ5fiZOlAneRZGSQhTAs0H9nzPiy6FauK16Of9ypfzE5ioxfaCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+SLTM6oj4Hp+3JVEJeLw0qiEEKr0kwGunMWiDoj4IXc=;
 b=qAyb+pJSfrgDzw5JFkP4a4yRXOtgK+t3Xfi92h9gBYp2kVGyQ5uoiV94oribFDm9x343q5n10CcnoxKk2p/78rrJEh9Fh7uh2zellAZlk81roL6xrqB3UMCS5mVH8lXApc3KWvuFxEag/CHHhUTChUMndktU/thQEcUUQ2FThuH0UQqVYYjLHqVESBVeQL2HNsL4K9dTnOczh2KBncJNEgBeIH/ffEsl7YidbRijSPbDEJzAD3Ce1Uf8giFLQdxaUKhDV8cPXUAvFLef8d7j523iQFrsXdB0jZOg9lGj1yNJvMgNSGavlTfKcXXhtMHCnKiesTAhqlh8xL9Mvazi+A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by SJ0PR12MB8613.namprd12.prod.outlook.com (2603:10b6:a03:44d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Sat, 14 Nov
 2026 14:01:28 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0615.009; Sat, 14 Nov 2026
 14:01:28 +0000
From: Richard Cheng <icheng@nvidia.com>
To: tony.luck@intel.com,
	reinette.chatre@intel.com,
	shuah@kernel.org,
	ben.horgan@arm.com,
	fenghuay@nvidia.com
Cc: x86@kernel.org,
	Dave.Martin@arm.com,
	james.morse@arm.com,
	babu.moger@amd.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kaihengf@nvidia.com,
	kobak@nvidia.com,
	newtonl@nvidia.com,
	kristinc@nvidia.com,
	Richard Cheng <icheng@nvidia.com>
Subject: [PATCH v6 2/2] selftests/resctrl: Check that CBM limits LLC occupancy in CMT test
Date: Sat, 14 Nov 2026 22:01:08 +0800
Message-ID: <20261114140108.36954-3-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261114140108.36954-1-icheng@nvidia.com>
References: <20261114140108.36954-1-icheng@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0047.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::16) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|SJ0PR12MB8613:EE_
X-MS-Office365-Filtering-Correlation-Id: 9eb302d1-ddc7-4935-5031-08df4257c6fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|10067099003|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261102123227099003|261026121527099003|261026140227099003|261022113327099003|261022105027099003|261028144727099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	cOl22d2mTsq7ssHhNlASLX+rJmjezWftAsMSnQL2sem43kbr+6/bqxeHqA+OHKN/95zpWrKzu+2lmPX9SKBBKvefS3/ez2ENL9HEx/HNWbxwmnvvPjzlA4c0i8m4faeqbq03L2Ao7QUp1Pe6ZnCI7P/yTvADAsDNKtlEZseFE/PlMjAP9Zn646Vl9ySA2DXDIL0TOm8KKCzpmogA69rrA9GxIjTc3FEY6iQhtHhutDNb+K8PgZ3JRY2sYuiSy8i21eSsDccCwPKuCWljoYMrWlmIBEkArkjYRgI9Zv80h2Ajzkky/Yf7x70mGKavly7ELzev4cUR0HM1HoJROebFEQdCQhiyv3GKLo9T2M2C9b89mM12IDvJJn0mfXTteGJ2l6gmJnYImPYK/uNK/n5Cl6wWDLQgVFnSBw05JQiepSCWE9OULIPEqYjMERj8h3AhEUsm1VTX2tPQCTT5jDqxKXQGZl0DukMTDhDg1GkIeVu+lLqodKjBGx9c6xTKwb1exoDhJ4Pq+DPwJiwwurYn8r0BcjKv7t25VocklIu9MVIn8jRHg+/rRbHesldBurkoihyTpp1xLWHAND7z4vz0o3fMS2S4iURTBDuQ6/no43XTOXsdCBbJVpMYtCZO8Ql/iqgyCrD+yHz8NkIJsSbG9Ks0mDZL4ma7Kl23DzORzVw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(10067099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(261026121527099003)(261026140227099003)(261022113327099003)(261022105027099003)(261028144727099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3ri+HL0Jh3hLcJZq4HkBoFEOiHK1XXopJF1ZkS9Lpx9C0OmsCSCNCynQ23W+?=
 =?us-ascii?Q?eST30oLIhHAWKM1zVRVX5HAD5LEfyqi2Wa1NB+2DErTx2Oe9s0t+WSU7lP/T?=
 =?us-ascii?Q?WF3UqlMlS4dN/SSA0E5FFxwkYTnL4uFy3nByIG7v6LBCy8J/c1gjP8AZFAjO?=
 =?us-ascii?Q?/tgMX6EgsgP+LIrss3iK76ZMNbBwyFix9dANPICdQOmusijvOn8ee+YBt7z1?=
 =?us-ascii?Q?josq/V3uLnEgZEU3L629WyNNRv5DnsXCQyV2P8TIWbyyFULuHTSVVoZKQ9D+?=
 =?us-ascii?Q?3h9yJhUEbCm9Ms0uzibS0LwvVijO0FcP3Kj5jXyXnPUyARjZbRqvUyTvpztD?=
 =?us-ascii?Q?M04T16Wm8rA66lvj6YcO22EDYAhyMcWl5lmYeA/pRtpQ1Oa1yG0BGdUGqG+P?=
 =?us-ascii?Q?U7eHDlvXY4EjJ2REXsndcfhbPfehTghX+DjuXavK2rxbyRfAOlMEdA6dzJCA?=
 =?us-ascii?Q?DtJ1hG10xxDAzgBeetuayJePdLdeiu1LQkm6OvowFTApBVpQCsgMVeNJZF7G?=
 =?us-ascii?Q?m5q2LXfShA3UYNkokfNAV/4BGH6gJAF7L3CuZPeckzBgdGSew0v7AJPOWM1F?=
 =?us-ascii?Q?aTYewGnm1UE132xDJJjfZe0x9mRwqHiabOkXkkPng5VQavgC+bXByncjPFV+?=
 =?us-ascii?Q?xK63JKKw57hewS9FsOPIlCW1/ktbgYraMcwEa5rPQAS3OF+bH1iyUNKnzl/c?=
 =?us-ascii?Q?UuIeHnDNs4sKbxrmx6OOOToiuYLx/YQ4yvz8sM2ypiAlZQBWyeGKqn8E0Tvy?=
 =?us-ascii?Q?F/mX8IMyTDgDV4F79AOk+SX1ksmGgNsYrvYB2CqZ/AkeaJaDXxpr3gBAT/G9?=
 =?us-ascii?Q?atY/TyaTYrRSIxX0LKKPKo/530kDa1tO8AnaQnqhJ4tpZJmSVnd117oftRZQ?=
 =?us-ascii?Q?XOLA/12TR4BHn//rvU/Lp+nCxKCBEUykH7bud11A8bXOCa0Ce8nHk6pQG042?=
 =?us-ascii?Q?cjzJ14MB7be5PvRWv3plQPRtMbV8DQZz18C7cuNja8lnsLotU6bhI30qhau2?=
 =?us-ascii?Q?0CfsYMNXk2rAbBz2U57NrUnvw6OQ/QiepU4XAb8bcwviL2xOzIN1hfjdzogx?=
 =?us-ascii?Q?65K97rZ4b+a69vqDl1L8cNinEp6LSCj6nzdwowB0w6t8rrmw/zWxnbDz8p/Z?=
 =?us-ascii?Q?MKxfWPldH7Rv7f8JQ2OsCKnsWlD9zY+5fyhYWK9M4/mr0egQDMMh+1ft/FTd?=
 =?us-ascii?Q?MZERnPb4uSO88h2qvT487XrarBpE7GmC5kpxFjBOcToY4OFrxBle5skx0WKC?=
 =?us-ascii?Q?K/Obudhy+xWEQvV3fMm9Eur+ltObvz26ZZgEs333xDUknMy5bxHt2nwiL8a3?=
 =?us-ascii?Q?8WtTH56ZrCAJY91lr8C5xgkQdc4WlsADY0kvjHvFGfD6Qh0E+6QoLCPr/Jc3?=
 =?us-ascii?Q?tzBYD6InWmiRqcGkzVo1X2HygA/CRqRelgQsHO+iODKxjwVFbXpNOQsYfgU2?=
 =?us-ascii?Q?jitZzEki0+/Oll8nqyg7/bvyC6/krpkSJhZzADLc/3lFI54LcjOVPeHekXDm?=
 =?us-ascii?Q?v609ptXlLUr7nRUvPb70XdDB0zyO2gPiwNVQqTPYCTmiTjK/NGnIAHR5b2z7?=
 =?us-ascii?Q?4zTKNL9RFLSWTn1gZ3u1wxeaOF0KH15pU8GT2kyKUB8DS+sRbfC1GtM0ZaPR?=
 =?us-ascii?Q?S7KHYTa1nXFAP5wFSYeWsnhwDwP7yUfHGxtwWElJ1UCREWt+u9PYz47fYsRA?=
 =?us-ascii?Q?ven+OnHsjyWIhkPw+AwXXJ/mSsrJOnuvJj58MbyTSJ5AceZtbY1R72iqTwz5?=
 =?us-ascii?Q?d0Hoten3eg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eb302d1-ddc7-4935-5031-08df4257c6fc
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2026 14:01:28.1790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k80eOj5qHOQsdqDgIWnusb/Yz9QXG+2NBOMNFDqBWX/i9cnoMCOSrI86fwpPW8/tvR3AJFUgp61UYrbMW0AOow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8613

The CMT test measures LLC occupancy with one CBM and never checks that
the CBM limits it.

Measure again with all CBM bits set while the benchmark keeps running.
This needs no cache flush, what the group has in the cache is covered by
the wider CBM too.

The buffer is twi the tested portion, so occupancy should about double.
Only require an increase above MAX_DIFF_PERCENT.

Skip this for an user-provided benchmark or a buffer larger than the
cache.

Signed-off-by: Richard Cheng <icheng@nvidia.com>
---
 tools/testing/selftests/resctrl/cmt_test.c | 74 +++++++++++++++++++---
 1 file changed, 66 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/resctrl/cmt_test.c b/tools/testing/selftests/resctrl/cmt_test.c
index 5d0bb27b7817..5962aeb0cd8b 100644
--- a/tools/testing/selftests/resctrl/cmt_test.c
+++ b/tools/testing/selftests/resctrl/cmt_test.c
@@ -19,6 +19,12 @@
 #define CON_MON_LCC_OCCUP_PATH		\
 	"%s/%s/mon_data/mon_L3_%02d/llc_occupancy"
 
+/*
+ * CBM that the control group being tested is widened to after the first
+ * NUM_OF_RUNS measurements. Zero when measuring with a single CBM only.
+ */
+static unsigned long wide_mask;
+
 /*
  * Initialize capacity bitmasks (CBMs) of:
  * - control group being tested per test parameters,
@@ -62,10 +68,26 @@ static int cmt_setup(const struct resctrl_test *test,
 		     const struct user_params *uparams,
 		     struct resctrl_val_param *p)
 {
-	/* Run NUM_OF_RUNS times */
-	if (p->num_of_runs >= NUM_OF_RUNS)
+	char schemata[64];
+	int ret;
+
+	/* Run NUM_OF_RUNS times with each CBM */
+	if (p->num_of_runs >= (wide_mask ? 2 * NUM_OF_RUNS : NUM_OF_RUNS))
 		return END_OF_TESTS;
 
+	/*
+	 * Widen the CBM while the benchmark keeps running. All that the
+	 * control group has in the cache was allocated using the narrower
+	 * CBM and thus is covered by the wider CBM also, no flush is needed
+	 * between the two sets of measurements.
+	 */
+	if (wide_mask && p->num_of_runs == NUM_OF_RUNS) {
+		snprintf(schemata, sizeof(schemata), "%lx", wide_mask);
+		ret = write_schemata(p->ctrlgrp, schemata, uparams->cpu, test->resource);
+		if (ret)
+			return ret;
+	}
+
 	p->num_of_runs++;
 
 	return 0;
@@ -107,10 +129,12 @@ static int show_results_info(unsigned long sum_llc_val, int no_of_bits,
 
 static int check_results(struct resctrl_val_param *param, size_t span, int no_of_bits)
 {
+	unsigned long sum_llc_occu_resc = 0, sum_llc_occu_wide = 0;
 	char *token_array[8], temp[512];
-	unsigned long sum_llc_occu_resc = 0;
-	int runs = 0;
+	int runs = 0, runs_wide = 0;
+	unsigned long llc_occu, avg, avg_wide;
 	FILE *fp;
+	int ret, ret_wide;
 
 	ksft_print_msg("Checking for pass/fail\n");
 	fp = fopen(param->filename, "r");
@@ -130,13 +154,36 @@ static int check_results(struct resctrl_val_param *param, size_t span, int no_of
 		}
 
 		/* Field 3 is llc occ resc value */
-		sum_llc_occu_resc += strtoul(token_array[3], NULL, 0);
-		runs++;
+		llc_occu = strtoul(token_array[3], NULL, 0);
+		if (runs < NUM_OF_RUNS) {
+			sum_llc_occu_resc += llc_occu;
+			runs++;
+		} else {
+			sum_llc_occu_wide += llc_occu;
+			runs_wide++;
+		}
 	}
 	fclose(fp);
 
-	return show_results_info(sum_llc_occu_resc, no_of_bits, span,
-				 MAX_DIFF, MAX_DIFF_PERCENT, runs, true);
+	ret = show_results_info(sum_llc_occu_resc, no_of_bits, span,
+				MAX_DIFF, MAX_DIFF_PERCENT, runs, true);
+	if (!runs_wide)
+		return ret;
+
+	/*
+	 * The buffer is twice the size of the cache portion being tested and
+	 * LLC occupancy is expected to about double with the wider CBM. Only
+	 * check that it increased by more than the tolerated difference.
+	 */
+	avg = sum_llc_occu_resc / runs;
+	avg_wide = sum_llc_occu_wide / runs_wide;
+	ret_wide = avg_wide <= avg + avg * MAX_DIFF_PERCENT / 100;
+	ksft_print_msg("%s Check cache occupancy increased with wider CBM\n",
+		       ret_wide ? "Fail:" : "Pass:");
+	ksft_print_msg("Number of bits: %u\n", count_bits(wide_mask));
+	ksft_print_msg("Average LLC val: %lu\n", avg_wide);
+
+	return ret || ret_wide;
 }
 
 static void cmt_test_cleanup(void)
@@ -193,6 +240,17 @@ static int cmt_run_test(const struct resctrl_test *test, const struct user_param
 		param.fill_buf = &fill_buf;
 	}
 
+	/*
+	 * The buffer is twice the size of the cache portion being tested. If
+	 * the entire buffer fits in the cache then also measure with the full
+	 * CBM to check that the tested CBM is what limits the LLC occupancy.
+	 */
+	wide_mask = 0;
+	if (param.fill_buf && 2 * n <= count_of_bits)
+		wide_mask = long_mask;
+	else
+		ksft_print_msg("Not measuring with wider CBM\n");
+
 	remove(RESULT_FILE_NAME);
 
 	ret = resctrl_val(test, uparams, &param);
-- 
2.43.0

