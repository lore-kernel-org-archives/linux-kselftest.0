Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012045.outbound.protection.outlook.com [40.107.200.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6058D3019CD;
	Mon, 12 Oct 2026 07:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791791262; cv=fail; b=b0g2Fj3ih1HH7TG1Tyez+AmLEPPdyGKztgUbTL20H6UKqdr6DM8Jsu9LWgsj8XGeTQM2uvgRn3G3sp4anRXkWB2scWNRjg/ZllC0hwPpeJ8wX+rCQn2WdktZH6Ofc288cqUA4mJPqWyXKomd2gAGC4jZEhKeMVqPIMnMTknyhAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791791262; c=relaxed/simple;
	bh=4E1eUhjK1Uvar0ABd59fOIUNAGcL1eH3F6ks0iF6NJg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Q9IjQj34k9+In6lxiH4lPx87Fc4iIBCSGc8C+7BvTMXaR9ZT+eiOfwt0VdgENyC0Qw4N0r1Bab7xEJJ8SVd8InvNpcAfidy9TVG7zrNGz/WK5UNHG6JHeU/kWgXCj3ludLoXeCSZp7ZS4ZSFRNTXZO+oUtatZNRCXsUN1vVeRXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=a6S87XLR; arc=fail smtp.client-ip=40.107.200.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="a6S87XLR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H42DpEgzgyRnz2iagpkDzf5/522pNvhcfDob5h9JxZEtr1e0WsuuFOv0TmNWssO8u/kRiwrbbYzKOkf9e4wyMxsTbDNbijH08BIxethbBD7ab2TIey0v0fYekWcgjktUB+VWXGw+ZrEicquYT41wPqb29H6+/z5ZgjE4dMhMtJ80t+nIrobJWhGkNJjOeKMUwVNOJTmV/akiVc7UYrOZ+TO5zfDkZoYq3kMfaBTvsQp0+s550AucG4rFIlBPei0lFbD9Ep+gTRxWEtTqOIk4X1DWa9IEEDK2w5YoJnp1sdePxhc3UjWTVC5gcTdCDCG35i96vfFORqpO4Eci/4Iaew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o42IjvHnKJzRcYn4TQGqojP8G8BmzQhHF9y6Ts+yTw8=;
 b=m7BWxCTl1tT2RH9kmpWRwrZRe3Zef5H0vDlfOJ5o3iTFV5GSGTkm5AJiEOhAJl5gdSMGYfmTNXtf34i5e9rhzHlcxBP13Wiv0KGo/xAoffTwdtjo6BlwxPU2j24EcbUAqmoyXiaoNhOjixk5XkqzqfvbEAN1U0FrTVFt41ng+uT7uEcwLYQDqUHAXWJDVB/Cn0wOFxvtKqQvE4SLxvjmaLDuDKMSVxfYGnmEvq41VWPh5wEqYWz3DWGbQgWZm+F54kTiHHYsGkMxkj2SnTQI6KEhqQxT/J/IifIzc8C3fUh7G2YtkjjcoFvQQMNGbdLdzIx7UnIHHVlyeW2bWy5PAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o42IjvHnKJzRcYn4TQGqojP8G8BmzQhHF9y6Ts+yTw8=;
 b=a6S87XLR3uA3f8qNgxJ8colrzd+VNVdKhwBcw4F9VG2qrYap2hGUiwlE8iBdnw3MySMbxMw2GrMSgIGJequyr+Xw4n1BXgs5/2LnkUekGAk5zC+bLTYyuNLzSnj76jhuidXGXJHqLaIEUaW43foD0va350th31zlbDdm+tYWzcHlA62/j91iwH4V9oO/u4M9UGTFyOTpB2piME+ZfqjcIt1jeT1OQ3Wvi1/pXBuTPdIcJaSqEcgS8an8w80ulUylnbKAIoPwGsWqkoz9XiWKfQWEkJ4GWxD9vlyofYZl9MObWThWABAEcUsi5QWTVUShfgzL9hw8uM2TH7qURbf7mQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by CY1PR12MB9700.namprd12.prod.outlook.com (2603:10b6:930:108::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 07:47:38 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 07:47:37 +0000
From: Richard Cheng <icheng@nvidia.com>
To: tony.luck@intel.com,
	reinette.chatre@intel.com,
	x86@kernel.org,
	shuah@kernel.org,
	fenghuay@nvidia.com
Cc: Dave.Martin@arm.com,
	james.morse@arm.com,
	babu.moger@amd.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kaihengf@nvidia.com,
	kobak@nvidia.com,
	newtonl@nvidia.com,
	kristinc@nvidia.com,
	Richard Cheng <icheng@nvidia.com>
Subject: [PATCH v5 0/2] selftests/resctrl: Fix resctrl selftests issues on aarch64
Date: Mon, 12 Oct 2026 15:47:27 +0800
Message-ID: <20261012074729.40042-1-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::8) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|CY1PR12MB9700:EE_
X-MS-Office365-Filtering-Correlation-Id: 87db8943-61de-4eef-bef0-08df283515b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|10067099003|18002099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	+biQc/6AqiKdNVCErexEK3+J/h93LhA7gsEPbOjWgyxQOzUdQQDEhFQXqkFpL+qinN318H0H/0+CAzTfIgT02Y2FCWj3SNPhswKLizdysK0kXsWUB7srbnJzYRC7aj3yjrtTi8PA2S0kBY4Y0izVv/S1TSj39s49WtffnGHmXkp6+oSGYoOjwmp/2i9eGd3jopqkAr0XvUMkQqg2K1WC3rOsvJs5IMEk8vMXTltfzvpzY3AqdVMQOyHyML8jtwSh7vtOEndXbbXv3mvsal8R/X/JGZAa6VRWefn2PCYmAD81OuIJTYDFDIA44g+M1+3ReNPIl/wXrVjue0zwdRm3VqEgHmJ1c8DRQuVAstslCjnaMzQ0YhhbhEKViSqNGdo2pj2MVwji8k52/bkfKdDAQ0PL3PlkmG2+538sMWMMqZYeRXOLbnb/EbyIeWp4LbmE6b+1iBpJKzeGik4k1GEQdeAF5UozZQZ6P0811mrPSPZzXD93eC6Fm4G+RLK9qr1UEokDEzE1HBW+o/4IU1tXd2SCT0RC4oWk5rQlW8l1uZDiyfbWFM5PiAOWUnA3U44qQidhxXsQ9Vf8A+oHDUetx5qQdXG1JUApt+LGmUwULZmrNNqoxg4jUzhXaUHa3aNYSdDXrraTJetKtegd4BxOJLUmK9KKxHZSt4L+HV98QV0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(10067099003)(18002099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnFtMUwxZENPS0hPUndkMDA4a2xnNkhWTklMOERJS2pHdVllVFBrdmNPbGRD?=
 =?utf-8?B?VHBRMEhIMmdoN2JzbjYxendmSVZxTFBrMTJ0U2hKVE1nZzgyL2M0N3l2Z1hM?=
 =?utf-8?B?T0pnd3dtTG95Zmp2MkJjZEc2UzdNYUg0ZGIyMkUyRktxM2V4SkF3UTB6UUxV?=
 =?utf-8?B?TXBjOS85OWNISGUrUTEreXI2NGNXa1hRckdTQi9iWG5KMWVpdnlJTkJZWWxz?=
 =?utf-8?B?S25YdWg5eG9qbkNEb0Y1cUV4S1hLOUE1REx3clVBbC9GUWRZWmpCZmRrVEts?=
 =?utf-8?B?TlZDRHpCeGplTGJMUEJiNHJsN29xdVdudjdJUExyNHVLOW9GbmNTcUh4TGxT?=
 =?utf-8?B?R09SSjEyY09tTExSeE1kc1RFR05sZ1lnWngyQ1YrYlJwZDc2T3dGY0xHTjlX?=
 =?utf-8?B?Y0F4Ymo4NXJmZE1ZQVk2dnovOENENDZrSDcwREhsT0NnZkk4VU12UnJJQ0RC?=
 =?utf-8?B?VGo5clJDbWV2a3gwalh5ZDNueEtiZTY2MEdvUjRBTnBiZURLR2Y0NFNBTnlM?=
 =?utf-8?B?T3hPWUhqakduMTdGZExuMDhSVmJzZ2dKYWVSWVErMHloZlk3dTRZUGhRY09O?=
 =?utf-8?B?OW9yRUhudlFkUEdyaWNrcTF1WFZ5bXVnZm5Hb05iUGNGbmYwYWgvZG8yUnhZ?=
 =?utf-8?B?K09EOGlQdk11Z2M3ZUR3TjlHajN6ZVdWSzE3aDl2RFhmQzVNd0xXdEhzWTQ4?=
 =?utf-8?B?YzQ1RDJQdHBSM0srbXNlanhqYWZneVhnb2RHeXVoYndQSjdvV3pPVUNESS9v?=
 =?utf-8?B?aXRHOEVZTWs1WnpyTUdVd2ZEZVRmcTA4eHk3dnBudEY5Q0FhTTFJNy9MZEhO?=
 =?utf-8?B?aXlsOG5tUDJEaGhZaTBKY3djZ3llVnFLMzZyemFEczlmemZib1JJZGFTNlEy?=
 =?utf-8?B?L0w5TjZROEhoWHlvamtwZEM4OVJnNC9XM2E5QkI4Y1h3clgvVCtUUk9SbkIy?=
 =?utf-8?B?N2l5K04zQ2h5VllyL0h5ZUo1L3VCZmlyaVFiWld0YitlRVNXQXhCbW1RNFdW?=
 =?utf-8?B?YTRjY3ZrOWNFUC9sY3J0dmV6Z2hrSXdHcW9Sd2hEbzRNbFVnd1BrcXN6czVI?=
 =?utf-8?B?VEtnMkVSVjM4R1NvdDhoODh6Y29MVm4zY3J5UTNQQXhSRS9Xcng1YkdsUkR3?=
 =?utf-8?B?SHRHYlNINWVubUh4Y3A0NERxTUJ5Q0lUdDdtSzh5SWwvbldGWDJFMG56M25M?=
 =?utf-8?B?bU82ejZMSGhWOEdpbmhNWCtIZzBacm1MMnBaa08wcnJ0bUFubHBNRzB1OGdl?=
 =?utf-8?B?clRIN0xYSEZXdWVzaGpmZklpT3BFQ3N1enE3amlKYkxGeC9JMVBteDNrVnZy?=
 =?utf-8?B?RXZFVTRhcGtvUE1nS1F4dm5jelZpd0F5YmRydFRxK2EveVNzc0Y2UzFTKzBZ?=
 =?utf-8?B?SmFlaEdCUUFtTlNsaC8vaW4zWWliN2lKM2NwNEMyYzROSnhYUitZczJDYi9l?=
 =?utf-8?B?WGFPVHJOWllPWFcrd2hxcHdUTk1GZFN0QnR1cW56V3FNdWVaY09QTU96Qlgv?=
 =?utf-8?B?U0VUalpMRlhwQnFRSm9HbWN0RE1yTmVVMXcxY3R4Nm1MdDR4Z3hvbHNHeUpB?=
 =?utf-8?B?RHg0VXZwam9Wa01yUGo3dWhQUkVtMytrbWczeUUxMWx2dm5vbGR2cUJHaExY?=
 =?utf-8?B?OVc1dGE5cFNYSEVDSDNwUkFhQjkrVk1oUlJxK2UvK0picnpqUElCSEhCK0tx?=
 =?utf-8?B?TjZvRjEraDlBc01PdlBHNm9nZVlyS3Q2bk9jeU1uVitUakJJQjhBcEdoaklx?=
 =?utf-8?B?TmpVZTJaak1HTTRNNzQraTJadnVjQU1SeDFsVnQ5UUhtSDBpWVJud2ZreXhH?=
 =?utf-8?B?LzFuVElEdjFlWXkzYW5IaVEySFdpYW1aMy9SbS82WmIvNkwxSzFtZlBVeDFR?=
 =?utf-8?B?V3ozbnlSUzdWMFRyWmgxSFY1QmRNZGlGcVJlTWVWRDNmSmZFYmJqWjY4aVl5?=
 =?utf-8?B?U1h5K3RseGEyLzV1ZkZsdFdkd0NQaHBuWTlQM0psdkRoZS9ISzZWYmt4T0xh?=
 =?utf-8?B?d0kvZ2VUOGltYmpCNFNXRERKbzUyU2dpQUZOQ2ZOYzJkSWdyMEJPdHlBcCsw?=
 =?utf-8?B?QTJmZVVPdm9PR3lJNmVoNmZLNjd6ajNyWEQxVDhNSXlTc2RPbVdNVE0zeENZ?=
 =?utf-8?B?aUdPZWZtdGRZLzRrcVhodUwwV21ObjZ3VTlJQzdYOWc2MzdvbjFUQXc0MXo5?=
 =?utf-8?B?NjkxbjZVWnI3Y0JrQlFrTmErYWc3amFLOGxsSlFvSmpPU1d0eHEveWVrYXFt?=
 =?utf-8?B?T2xjVHRPMGxmOW9oQlA5S29JZnp3TkdYTXoyNk5SL1dPVWt2TW9LLys3RlRX?=
 =?utf-8?Q?NwndfGWioqIVSOhrNS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87db8943-61de-4eef-bef0-08df283515b9
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 07:47:37.7009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B1ZydI++X2J6guXa1mY//+iFXY0xihcx5+kUdnETipElCibL22rB9nvI4MFJ1mr+fUgaEzNnsHiNnFzoFYS+8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9700

This series fixes issues in the resctrl selftests on aarch64,
where they currently misreport failures.

Patch 1 adds aarch64 implementations of cl_flush() and sb() in
fill_buf.c so cache flushes are no longer silent no-ops.

Patch 2 teaches detect_vendor() about aarch64 (which exposes no
vendor_id in /proc/cpuinfo) and lets arch_supports_noncont_cat()
return true for ARM, fixing spurious L3_NONCONT_CAT failures.

Changes since v4:
- Drop v4 patch 1/3, which was applied to linux-kselftest/next.
- Rebase the remaining patches onto linux-kselftest/next and
  renumber v4 patches 2/3 and 3/3 as patches 1/2 and 2/2.
  No code changes to the remaining patches.

Richard Cheng (2):
  selftests/resctrl: Implement cl_flush() and sb() for aarch64
  selftests/resctrl: Recognise aarch64 as a vendor for L3_NONCONT_CAT

 tools/testing/selftests/resctrl/cat_test.c    |  9 ++++++--
 tools/testing/selftests/resctrl/fill_buf.c    | 11 ++++++++++
 tools/testing/selftests/resctrl/resctrl.h     |  1 +
 .../testing/selftests/resctrl/resctrl_tests.c | 21 +++++++++++++++++++
 4 files changed, 40 insertions(+), 2 deletions(-)


base-commit: 30af56a227e27b892d34bc44c23298b5274913e3
-- 
2.43.0

