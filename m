Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011021.outbound.protection.outlook.com [52.101.57.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F28923C8AE;
	Fri, 21 Aug 2026 00:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787272763; cv=fail; b=ix8t3lWiJ3BdduLRvJN/Ct98YQWgOFbi+TuB8L9e3f+3qF+ak73AvbUtXCYPsU1cZN6Mw3kyIx4qxrutBpgfPz8B4MY6cTgQ9qvkVOJIpkcJyYpOjnzLXUKy3Xyeq/59C/uNYramjn+SoK+IMiQMwo/YHhQxAotvUp4pHzKl3fc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787272763; c=relaxed/simple;
	bh=NyAw5XXoVkvSXqANOYhcpYKDxH1tbEhIfvaMgMlrf/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ViYH6BWNwxngMSUJtjsBJRjzW6ilsPwv3BZqm6QlV02N3AzD5QlFs3uwwkkGbxfOkOwjkZVFqBZUJ2r07rW+cd8w0bwwwW4k8WZm9hJGRkVDJ0Ji6U6BWBu8x3A73df/zfNPJTXJzawXt+SPNaxEnOsPH4HkD6w/m/7BJ+7464A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lzieRvsO; arc=fail smtp.client-ip=52.101.57.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lzieRvsO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BAWtUUTIp0W/1Qde0l86Q0mhD/2UpkBVhZ7EEQ4/xB9yr7Osyi6rZoaPJ6i+pQZmgQwI4YDW/3u6ofXPHDa/M0h/ZKasjMvhH1+EvAw6jMUBWtjJDN+0vdF3MzvwxQi48dA7oNuDxQ0fg/sPlqVBHb0TQ5yj2BbcTSgmd1PVYMuGkzBvBrO5xJaHoIpHab2ywx3tqeEz/0LkZBTmtDuxG4N9ZW7yb2h7ToEzzQM4ajyl6Xc4nAwmUdOA/JOCHtw5F7uELKFGpnXbG63w8pCI3kgnF6Ey1j1Xe43OspAHBYz/6pmcYf6UQMjOcvRoUvpnwAimGAIdC2P8Ek8t/1MDGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSFY9rWukCyqqYmWlkWWGNb0R1x/Gt/k20V2MBg/fcM=;
 b=TvYFK8YvrGRkCLgEQVZsh9KQq+fUo/WiPJT+WiZlFUAQc6tfu2HoZUbVbzOKmFLi3IKH7caqfH+t3Yw0pRW1Cunc5BmF4wyeh8GBlOfKZnL8ft+PGA+AQiMFbJwbuLgLpbcs1kzqRrW87aYFKFoQBdRCkcCd3Cru7qe3N4OI0u0y+uHgpcs3eK4PxOtCqJs0RLy2BKpRISWZ72xszQu9u+XU8tZSN57u77RRGqVX9/F0NuNPdtENqsIrCLYv7L94k8iqwJ00BBMdjp60HanqKU8/OgPs6+TCtmqFmsztA4Ace7ly7i+WmvFP9LOnTgKCwJnUEmZ1n0liBa9WjxJ6hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSFY9rWukCyqqYmWlkWWGNb0R1x/Gt/k20V2MBg/fcM=;
 b=lzieRvsO9MFWrGf4ndHI+w/3ZInEVyquZUVI4pVgKzPCR9aEvQNFSPR82hGwFaBAMe7LZZRQIGsIDgMs++fm51XILOWjmd8q30sbyljJ7UXDOLG3IlUv0vhX0yrpFKY4INfzQ7ZTjUSamXllQJggwq/JPJodcGdP5FfFjFfaq+udBNvhgdrPUSaGoawiNFelTsPTU7d2ctSVt7QN8q8rNBRniDDWcDCG7YNLeszB25+4M0GB2TwkiVcK5FercXpdkTRenOdJYk99z15sAxmB+H6ODmFbptm+2gB8jW9k3t+tM31odcHNeicvGedoGd3uwx6tYWI80TmpIhxFdx62lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM5PR12MB2376.namprd12.prod.outlook.com (2603:10b6:4:b9::11) by
 IA0PR12MB8325.namprd12.prod.outlook.com (2603:10b6:208:407::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 00:39:17 +0000
Received: from DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::8f:c340:8bac:c36d]) by DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::8f:c340:8bac:c36d%6]) with mapi id 15.21.0315.014; Fri, 21 Aug 2026
 00:39:17 +0000
From: Richard Cheng <icheng@nvidia.com>
To: tony.luck@intel.com,
	reinette.chatre@intel.com,
	x86@kernel.org,
	fenghuay@nvidia.com
Cc: Dave.Martin@arm.com,
	james.morse@arm.com,
	babu.moger@amd.com,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	newtonl@nvidia.com,
	kristinc@nvidia.com,
	kobak@nvidia.com,
	kaihengf@nvidia.com,
	ltrager@nvidia.com,
	yu.c.chen@intel.com,
	ilpo.jarvinen@linux.intel.com,
	Richard Cheng <icheng@nvidia.com>
Subject: [PATCH v5] selftests/resctrl: Skip L3_CAT when no exclusive cache portion exists
Date: Fri, 21 Aug 2026 08:39:08 +0800
Message-ID: <20260821003908.12977-1-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KL1PR0401CA0036.apcprd04.prod.outlook.com
 (2603:1096:820:e::23) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB2376:EE_|IA0PR12MB8325:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d16c7b9-1473-430a-97ff-08deff1ca11c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|56012099006|10067099003|6133799003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	vPknYlA2p6q7y3CWqSlLcONSiOK6T+2DNJ8AVVSlQvhSX59XT8N/KiHTW1+JwJtkl8TqTJV8W3CzM3wYLe0BtcWVab4QpXLUfctfp5s9pTui5NyLY8OtkXbZD/+Bwazz+sDbVkotvX0+X8HO5sfWYs1XSq0Bzrnz8hpYtCCtv+StsXBpd9c+rS+uYCfWgf7iZbD2SA9fUFOIgaus2xN3axNe5dL9K2sSYdSi0zhwuKKM5VQR9lqwIXVbKTaIuqRY53NR+AiPGokT4cpAbBJiumbDZ9/u6GlU0zzB+20tu6BP7qi2uLdTmnmdgQfC3khTIKo5yz8GB4bN8QFGCa4YlgPwoGBglEE9SxkT3ZRIPIwg13rIoohG84hxWIKLQdKJ0fI66bXGAw72Q3I+2xDwdu1QNJdKivxAT6NKDPzlZ2simVCD2o0Tc4dOyiZ3onOq5VdwKLTCxwMZ/T/cD/6l5jcdxb0sSSZd8Ep+zNCnB0wAfHCHIqHcagjkdg/P4j27w61UK9qWW0GtaQABoNYUW0UKAIyo4q2qTZYhgJkpU6I8r+4PeZTTnUrTeMOk1ym3buRgH4ggU+i03NGKHzZFaSe/bQTsuziZloLrPocrRIzZkLplFrE7YFGoHqtm2tRYYT76Vii0xjbhHMC8VS7893Ai5UdTwfHr731bwO0eXnU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB2376.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(56012099006)(10067099003)(6133799003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGdCWkh0bEpjc0tXbTNVRnN1K01kM2YzZEZuTjd4Zmk0WFpuUm5NYnJKYXFQ?=
 =?utf-8?B?NEpsT1dnTHZsV09SKzNDVURrMzA5Y2U1YXpVbVZxYzFDeHlUaVpzYjcvWEVV?=
 =?utf-8?B?K3pCaldabEFnWFpDY0tsTkZqelJZME0vSjZyZzdCN0J6REJlVzF1L0kzTGZs?=
 =?utf-8?B?RFl5Wi9jUDRNMkZLWmpwSUoxWjJhRnNmdjZ0WDhwSHJ1aWovQ0o2ZExjeU5L?=
 =?utf-8?B?ZkprZ3pJUzhVSEpMbTJSS2I4emtZYm0vQXgveXZ3V0R6RzlDcG5IY25OOHdL?=
 =?utf-8?B?T3EzeHV1YUpyd01PUGVWajBZWDJLSk04alN4bkMrM0x6Y0Z1dTlEUHhIaWU3?=
 =?utf-8?B?ZjI3UlVxbHZUcnJteExoV09PRXI2R3FGOXlDZXU1aUczS2NhdjhjZDVIMWkw?=
 =?utf-8?B?QmV5TGhvUU1pZ1piSDdZTjNLQ3d3WXJwUU1DQjdvcnkzN3pUak92Y0NtS2tQ?=
 =?utf-8?B?cVByVHNrbHBwZzlZR0RVV0JIZmhHdWJyU2VCdHJoYnFPYVpwY2FaREwyVXpi?=
 =?utf-8?B?OWtLb1BCb014QjhlbXdpekwzSWZkdm1Qb29RZFl4ZTlTWWltSkYvazZ4WCtV?=
 =?utf-8?B?YkUvSk5NR085dHBOVjRzWnZUT0VicG1NZnhBMkJuU2tkSXpYRDdJT0RocCtO?=
 =?utf-8?B?Nmgycy9Vd2ZPM2dMWTF3UkVVWGxzcmJOVDd4WnlURkNXbDRnTWRMYnFpQnlt?=
 =?utf-8?B?aXorNlh5ZUcrQk9KNStxdS9ZQWtSdWREY0xTRjZKdG1JdEdtbGE0MHZ4Ukov?=
 =?utf-8?B?NmNROU9kN0VNSXhNY0pmY21scDBzRERVSFNweDFSZ1ZwUnF1TWFodEtsTXpx?=
 =?utf-8?B?RjRLZ1RHRWhaR2gxWE5OYkJwdnBxaWxzdlZNQSt4N2VVNmRQdEY5OFZzWEFY?=
 =?utf-8?B?VXM4RDZDWk9ETzlBTHZQV1ZsYitLV3VSa2VLWUJiTkUwSXphNjZTSUtjNldl?=
 =?utf-8?B?aFJweWRtQzk5a2JyZnFjM3Y1Vkp5NGFsNFF6aGJUR2lwNHVvQWlnVDhJQ3Zk?=
 =?utf-8?B?MFAvVjR0UUJFTUMwcW5STmtPcUJsKzN3SmVJa3gvUXFQS2M1NU5pcEdZQWdK?=
 =?utf-8?B?ek1uVFBWaTRPMjc5cjh3RERiZUNkTUtrOFR3WURyK3U5a0MvSEVoZW1HSnFK?=
 =?utf-8?B?c0ZlYUxPdERncnFkMytoY00wNlRyc0NHZGVraGNsUnVyby95VW1HNGxQRzM4?=
 =?utf-8?B?S28zUkNVWnUxUWlPS3pDVjFIN1RwMG9sT2wvZnhDbUEvc2hDdkxvajRHdUNH?=
 =?utf-8?B?VVFXRlpSUVdzQ2pxMm5UVmxPWmpaNDdtV2NITFFrZ3NMaEg2bFFKZmQzU1Y1?=
 =?utf-8?B?RVRsR09NcnQvdm9iK09VSjI2WHV0SGVDZmVvazd6Yndoa0FCUGdYTm16Zno0?=
 =?utf-8?B?SmM5MnVFSjBLRWYrbUpLREZINVJmUWk1NUpNRlluNzFrSEJadDUvWk5FcGts?=
 =?utf-8?B?Z09JbG81LytLTGUwY3d0dXcydWVRSmNmdnhERGlwVDBMUk5vczRLWFBFZGM4?=
 =?utf-8?B?MVhIcTFmUHFXOEtxN2tqeWVKaE9adDlRaEFpV1J5T0tiTFZNYXhTYlBNM1Rw?=
 =?utf-8?B?M3FEciszMWRSZEhNSDUyK0JDWVZuQTdyblkrUTFQdlhHVnVyM3FGL1loMWc2?=
 =?utf-8?B?Y05kUjVOK2hJMkRrZjNKSFJqT1ZoRU5ETzdFVFM1bm1jSlpHTld3VE1Oa0Y5?=
 =?utf-8?B?Z3BRWjk1TWNJbW5td1BPd1BFbzUvckZuMGVVb2diOGNXTGhMR2NkQzEzR2p5?=
 =?utf-8?B?UWVjaHBiN1VxVFhheXhWQlVNdGpOMVllNEYxRjFhQVp6SHdjRkM2VTRiTDBr?=
 =?utf-8?B?eWQ3M0YwZjFKaHZHa0xzZUFmdTN5L2EwYkVIL01NOFpIM1hZSlFRaGVDK1pF?=
 =?utf-8?B?aDBMVms0bmRyR2hFaFFncFBGbmUralNzZlFCN2UzQjRhWUlVbms3MXBhd3Ru?=
 =?utf-8?B?dFFKamxwd3p2RElsU25HYW1tV0lZaHUvU3pBWUdHL3JmRTN5ZnB1bkxCamY0?=
 =?utf-8?B?aFljWGlTQ05RaEgvZzIxNTNrVkZtWldQUnJyc2R0dlRicURNMzU4MDd4UTBO?=
 =?utf-8?B?Uk14VG44K2FsNXRKaUhtZ0FlUW1wSzg0UytDZHAyZWE4eHQwTFEyT3N1d1la?=
 =?utf-8?B?d2tUdGJWdFZEYkNPbnRaMWZwWG14OWNPQVIycnJuVWt6T05jd3JyMDZkRllv?=
 =?utf-8?B?N09STXNrTXFuNFpqUk8zVTd2bnYvam5CSU1PT3ovcFFyOEVLdGRGdEhmdlRR?=
 =?utf-8?B?bjdHanI3ZzFCUVlzdEFsNGdyQmlrTFUxVlYrSGZpU0lKUEVlR0M5ejFBOVRX?=
 =?utf-8?B?WnNBUUZTN0lYRk5TMndtaTEzNGM3VW1TNGVxTWZQeXh2T0J5ME5odz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d16c7b9-1473-430a-97ff-08deff1ca11c
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 00:39:17.2193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XK8V9ycLYYKbIcS5PLn7z7OuwUsK2BnG7Kh2qEHE3tNnXJY2IBk1OL+pj1QAJnridEUL76YO8ZCh4jdGd1zlsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8325

L3_CAT requires an exclusive cache portion to test cache allocation.
This means that the cache portion used by the test can't overlap with
cache portions into which other agents may allocate.

Some platforms legitimately report every cache portion as shareable,
leaving no exclusive cache portion for the test and causing L3_CAT to
fail.

Skip the L3_CAT when the platform has no exclusive cache portion that
the test can use.

Tested-by: Chen Yu <yu.c.chen@intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Richard Cheng <icheng@nvidia.com>
---
Changelog:

v4 -> v5:
- Split the patch from the arm64-specific series and post it standalone
- Reword the commit message
- Make the code comment and diagnostic platform-neutral and describe the
  exclusive-cache-portion requirement.

Best regards,
Richard Cheng.
---
 tools/testing/selftests/resctrl/cat_test.c | 23 +++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/resctrl/cat_test.c b/tools/testing/selftests/resctrl/cat_test.c
index 371a2f26dc47..0a417267dd74 100644
--- a/tools/testing/selftests/resctrl/cat_test.c
+++ b/tools/testing/selftests/resctrl/cat_test.c
@@ -357,11 +357,32 @@ static bool noncont_cat_feature_check(const struct resctrl_test *test)
 	return resource_info_file_exists(test->resource, "sparse_masks");
 }
 
+static bool cat_feature_check(const struct resctrl_test *test)
+{
+	unsigned long mask;
+
+	if (!test_resource_feature_check(test))
+		return false;
+
+	/*
+	 * Test requires an exclusive cache portion. Some platforms may
+	 * legitimately report all bits as shareable, skip the test if that
+	 * is the case.
+	 */
+	if (get_mask_no_shareable(test->resource, &mask)) {
+		ksft_print_msg("All %s bits are shareable, test requires an exclusive cache portion\n",
+			       test->resource);
+		return false;
+	}
+
+	return true;
+}
+
 struct resctrl_test l3_cat_test = {
 	.name = "L3_CAT",
 	.group = "CAT",
 	.resource = "L3",
-	.feature_check = test_resource_feature_check,
+	.feature_check = cat_feature_check,
 	.run_test = cat_run_test,
 	.cleanup = cat_test_cleanup,
 };

base-commit: a4ff2be345d0abc943da8dd8da98151843b750dc
-- 
2.43.0

