Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012033.outbound.protection.outlook.com [52.101.53.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAC033F5B3;
	Mon,  8 Jun 2026 11:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780916815; cv=fail; b=JlCcbDJIb3oF8Pda8w+15t4mBUOqqjRRS8qUhFz6L1SImOuLDRmQxUcqJI21cY+askzSq0JaYojWBrEN4hWk3bmk6E+5+ArxWqx7kl3KNDJPzHAvaLmYKtjB4rkjY8xLChrCni19JBEqAMu/6p8mU9zm+1Y8iDjjdWNSOQ0G7CM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780916815; c=relaxed/simple;
	bh=ZvBZplAJNXLm2M6ietQS+8DX+lsVFAXXGMQwlTj1ECQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=N22pOPLxTygG5buHVJuWeflO6NVoqw9PUb/DeQvppOR73Xpc9PFQOaiXd6kpjhqvfz38K4P2sVufrDd5i0XBaR4cuQ4TvehOV4Cg0S794lx9TLtcjBCda2288XESqfvd5eLgM4nTPLfN7aWGwxUTPkd1bVWIemZpe867qGMmUTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=T/WcaK/E; arc=fail smtp.client-ip=52.101.53.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="T/WcaK/E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=czlsGJ3/7I0lUY0ZEfT1P5dbWr1ZPpid3TPwhyQ4xLYlG1CE5RcG28hrTFzbnbgS3Jka7ovbtZdm3AK/tRV86rD5v+jxrfYwc57p4eBO33Op1aIgFWGy0b5PBGvNQjFqVIYS1gjiZ167nd4gobxxrs0A/BZkFVJUQfUKQUsHZc1Y8E4EZNjjvWmWL0HnItTLBwegZGhvSgqb6+HCikJpjK223x7OhyGRfyfd79Y+Jfa1QNGVaS1uEgY4N97Lx68c2lz/E1YwQWtSiua53Kyw2Q9kJrprjoxfLp243kgIijIDYBt29NCv9nsY/hQJC28131juKHTfQOa94tcVkKra2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pPXaQBtwT/A1LaY7Y4ZeWmgfSO3UZZODtli83Kz3K2Q=;
 b=QWCgDRhq4Y4223MyNMrNFNkD5C1uNmqimqx5dH6Z/QoRWwIKVkdY/azbZYoR8ct7TIqagWos75KyIcRqlL8Pr+XVE498nzOnwKq+NWnKPQoOuXcBShtkWfZUdMGLaejke9LFBZnzg915T9F9h21GB61uXPBrggorMJOuF0CnGA2D2BQvaCSK/HD8Lr5JDWjK+4cuQ/ov2uqo0Tl5RQ9wjGHGA+YmQAbG7M4p9lev62U1HPYlZccCg+Er4OguoP7nYKfqwv21QkWnNhEfeGavvlWiz6hvWBGL/0/K08mHxc8RbMHvhnM3HlY5WdOtyTb8a3VQTix6wfT/GhizsOTC1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pPXaQBtwT/A1LaY7Y4ZeWmgfSO3UZZODtli83Kz3K2Q=;
 b=T/WcaK/EtvvprcjwhDgbPWEInKzlnQDAtKgvGi1lOThDcn3/m6L4BCxQRzadJJepkp3w4UWaKgNbQirxR3hSTfX1M8NXIleu66Kaa/PZ6cypDmnn+HocH2cxn9fTAIpKs5AVadNd7IIzmp2kMzlOJmUKuxU7HqxmnW+Eds5x0cO6TSTj+P4xbLL2QrarOaFU4MpaMdg+NXnvCqIx4pSkkjdBcRuidju9EoaLX1VNf+MznS25/7BAa3HSNsMvLJPw1fgFoBt6T8XHI4/lMrRXXtKrIg5Udpap9xvXkOF/GjldxI1Gg9McEAqji81CzhHtv9VxlmV/K3zJnkGlnjfiDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by SA3PR12MB7830.namprd12.prod.outlook.com (2603:10b6:806:315::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 11:06:47 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 11:06:46 +0000
From: Richard Cheng <icheng@nvidia.com>
To: tony.luck@intel.co,
	reinette.chatre@intel.com,
	shuah@kernel.org
Cc: Dave.Martin@arm.com,
	james.morse@arm.com,
	babu.moger@amd.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	fenghuay@nvidia.com,
	newtonl@nvidia.com,
	kristinc@nvidia.com,
	kaihengf@nvidia.com,
	kobak@nvidia.com,
	sdonthineni@nvidia.com,
	Richard Cheng <icheng@nvidia.com>
Subject: [PATCH 0/3] selftests/resctrl: increase L3 cache test coverage
Date: Mon,  8 Jun 2026 19:06:38 +0800
Message-ID: <20260608110641.44457-1-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0020.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::10) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|SA3PR12MB7830:EE_
X-MS-Office365-Filtering-Correlation-Id: e85e4df9-5555-43f3-5046-08dec54e080a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|6133799003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	15b+yNZt4apSPkrALmdJzXyU9jC7AaZteYLxihbcCPAte8Xl7q/bLBP2QttAIMVXl8NUuyPbfU4BEPzrXBsjw0AMKop7NcAAWJDpb4vvZS3bVLl6OxlRUk9yzy4ZTU0JxDC81c8/FgfS8m1UMd8UWvMf/zOhc45kTfguUrLkjuE7YQTuuswI2FKdlenVc1o+BkF5CPNuFjMJttul/e871onlkVZiFrYV//Re6XTlNyfWKod/boT7BLgUiOsQU3048c9oFGeC1/BewiHjQ7ec0Z3Jz4OFms1uQm1Vxk7V8j/ZzQMWbNY6hDuMjoJzRAJl0Qnxb+9EvJQh+A1oUs+whlvXhwkhMtdzFIrCzMnt+ymPzHBmESxrikiruaAb01g/4NiHbXVCe9nARyY6OwropODmuNtyGXLSWZ+FAWhmpi92LSTmH6uw4qFfiFNwXYwhrnt6BsLjP4cR4GVDXlLvjSTWxuYi16mZjCCiLv50yUF1ZTu09DPwxBFY1232yXVgG+PafWAm6mV9s0GlvZ+X0eJrh/n7WWJSsJLammG/pytQXRBBBY0bl3gtk6MnpYc5h8TyoMz9xmzV1QvhFrCMQ+Ch+LP/K2x0n/pYGkJqRgf4CXa1UDWdLBpM92sDXzl1B3ba5OHhfizB8mzLkhtfswj9geRd7Lz8MMZ+BI6mFtCgRtinhb98jKKFXncHkVYM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(6133799003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8ghhS9GR0BnpohT/HZSqx3IkT1MFhGSWy544R5Ctrkm1xujE8K+o3dr+BmqX?=
 =?us-ascii?Q?EzkAKoyzzlj2p/yZX8pUDpnXT03Gz0665moA7VG+uU6L5azKyPWllLzlEsCo?=
 =?us-ascii?Q?to6pLfg9hSYoiBh0OB2vvI/3uO6fWtwQaHEIdskjLnmdgI7OYK/zN+hFgLFA?=
 =?us-ascii?Q?IiMwULIl7CDVEk4c2uEyUAzhzqUOa7qJ4Qc2xNzn50fFfOPcgYolPDc41ECZ?=
 =?us-ascii?Q?DsnoQytLDogEtfI5tP1apePOnHgz+3UcI4AONQEWhEj/XYasHBRpVONcQpja?=
 =?us-ascii?Q?VpP8oBDNXN8d1HSm9iKzl2MS8ZPG8u9wxzgoHiRYoz/SgrGFkAzg2NlasJ+/?=
 =?us-ascii?Q?DIPMee8BadwJfy+QhgxMV8qn3ryiR3EX7FzCTa4TQ+csOcCiEp7ZrfSs46rZ?=
 =?us-ascii?Q?uzgU4JRD0noQC9igomBVEFxCgFHT8wWH8oWait/5T3hUK258wWAm27IpITJd?=
 =?us-ascii?Q?rRa3ZhxcxBGgGCyzVCgH0asyE9q55ZhLNa3tLt1xysGYw3FZR3ZwaAKI4J30?=
 =?us-ascii?Q?GVg/ZsXefbxzf1c6uQRvBqEciuhD7DKcSxmnHEXRdMb4PZWYEDYw1y/+28NN?=
 =?us-ascii?Q?qu55ece8fcxwtB4ZCcK5JDJOXCZfkjgV+86zAmKn/V3NY1zc4w1z50LP0ZPx?=
 =?us-ascii?Q?fBy5J8L+WuV+TUZPFd9XFo6bOKMxcCv+zVTb1NiD/iwhgPUYf/Sjal4NttA5?=
 =?us-ascii?Q?F3qAcT94NyTKtEj9iMzRzgX54MmQMu4Qlc9bmh9FAHNOd6cknM5ac3FGZn2+?=
 =?us-ascii?Q?vZetd3Onh+KA6ZA/bEKTD7C+DHZBHHMD8xm/a9CaqHCTwUx8iM5Ukr1vLhvb?=
 =?us-ascii?Q?8OBtWw3JsVEJUDubYu5RGWsGyO+k74gF0o3V8cxg1+AfYw2JZUceqZLgnWXD?=
 =?us-ascii?Q?CoVqQ7usFBOglH26NkmITOMI5xEUtqDAD4nVP0PWu+UKZkkdqM2Ps+c13+RI?=
 =?us-ascii?Q?gM7UMpHui/XyXDR43/k7+VgeuFpd2ZeCY7qj2hKFA79PL/OsuTKYysUhsywG?=
 =?us-ascii?Q?A6fDqlHD/rxTt8S5sHj1knzIWtu5G4E2oLiCwdY9tl6sxFD05/H2nt5TIvfR?=
 =?us-ascii?Q?q04MtT2/9P4lrA4+CogM9UHM2oK8rn11rwNnvquo9raowz0hnTKgae+dT1Qf?=
 =?us-ascii?Q?F2Pqt2K+f0+alDZQkaodpId2jiWbmTSgUbF5+aV42KvAt3hddSsWoxZObbmr?=
 =?us-ascii?Q?bPVaYW5hXuu/0U+pdAdrKwjBYcYN6UyZ01u1OUL98xa4aiZchTqezJMjpmJL?=
 =?us-ascii?Q?Si4zMM5qejZek01WEe1F5rvHcfwliJOl+ABAne8wMo+Wt92S4kJS6+k3t+Ec?=
 =?us-ascii?Q?82Ea/xgL6NKRQ3swCiiqKrAW4FK1uPrfjWO2CdsVt5p0m87oyrQY94soRwVl?=
 =?us-ascii?Q?vAUWfAkZzYmK0EaCeszkv2PIGZSyUdh57rTP54c8BmY2FOSIS3Zpc8MABOrg?=
 =?us-ascii?Q?MpeuB9BwDmnSUZA1/FpKr2/MAqs76vxMaSWL+1zn01yk5eGmXB3uZKyDnCij?=
 =?us-ascii?Q?VFJMiLfQwPabi6DXDsBTOYi8tgDYSYJVhpRfEgDBrA8d4Ai3C9r/A4aL9GKI?=
 =?us-ascii?Q?WhWaWHFyo8pqthVys2ydlFrn/KeFNy9/F8PbTA/SBaW5YKMM+ImSMBddlcry?=
 =?us-ascii?Q?2pXo/EOxnXMl43aqUZdioF/qjvhKiLqbA0XmHjQZfR9VpEO+BSuBJY0cZ+V6?=
 =?us-ascii?Q?lNCXluUE7T0VQz8W6BbYkcZCeM9siUJ4aL/NKaT/QccPIQD9z54FddifCD//?=
 =?us-ascii?Q?HQdg3fdp7g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e85e4df9-5555-43f3-5046-08dec54e080a
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 11:06:46.8993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jG0i8EaXN68NqunG9kPCTxWeSwoYHOPRX84Jf6T2VOrAA39oVxy+0qUhypb2PaNMDSQ4DJTLFxw1hJ2Ct0r03A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7830

The resctrl selftests check L3 cache isolation (L3_CAT) and occupancy
accuracy (CMT), but some basic L3 behaviour is untested: that an allocation
actually bounds a group's cache use, that invalid CBMs are rejected, and
that info/L3/bit_usage reports allocations correctly.

Add three self-contained tests for these. Each gates on the feature
it needs, so it runs wherever that feature exists and skips otherwise.
They were exercised on an arm64 MPAM platform.

Richard Cheng (3):
  selftests/resctrl: Add L3_CAT_OCCUP test to verify CAT bounds
    occupancy
  selftests/resctrl: Add L3_CAT_VALIDATE to check invalid CBMs
  selftests/resctrl: Add L3_BIT_USAGE to check bit_usage tracks
    allocation

 tools/testing/selftests/resctrl/cat_test.c    | 433 ++++++++++++++++++
 tools/testing/selftests/resctrl/cmt_test.c    |   3 -
 tools/testing/selftests/resctrl/resctrl.h     |   6 +
 .../testing/selftests/resctrl/resctrl_tests.c |   3 +
 4 files changed, 442 insertions(+), 3 deletions(-)

-- 
2.43.0

