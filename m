Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794664884;
	b=tVf1Ugi2d2RSbcL2XdQk3xki9b6+rcZPXSgq7VAGsk4ltXqUIzJzrJaP1JcawLQotinq
	 WqLJ3qzfC9E+6frPYEvRS8KZaYFqpMReAN0D3zp7NIT1RR7JTW0gmYTckSQxWrWZkfyCO
	 m+OvRiAWPfV0uCpU8GFzFaPjb7uwoY7I6d8J/aOZ/oBZvdtGc/co8DcYqn1DKptgxjwOq
	 cIW+EpvmE0tGkFynlDP+LC0PSUlwF3mLs29IuMYWz1NVBAZmv0Rf1KFPsX9d4YMdGYhb8
	 /2AC4VkQias6VaD5IPh6OjkzwV048RiAOsCcpoPcHnEwFCcC8hPDewLBXoyjaWZfAgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794664884;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Di0ft0ysPyLVWj6ryRMwVbU0d8oNj/geZT1epehcqlk=;
	b=2MQtLXr0gi++J00kPoTy0OowycSTJ4AreZK9mvyuBWodKXe03egsxuJT+5oqFjns91u1
	 RAh8nGXX87f2ENIuMjNU0BtLIJbfWUHk33mXEhob+JgwEBNvVcZezE4J3nV7FZ6CH2u2b
	 vLYsRZ1iHeTBveIwh4mZkpnyxJ39zcKZk2bT7RCzAaQizdwcBMQigIwmhvXhrRU1+eTAW
	 AXKfKVtOrTZhONZJyhTxcLH6ApWUK0SKBodANIKhRWiSC2CNj7ZqVZKxkkw+oOwP480J4
	 1Ke9AcyuaQTF7aAnFEh737pK5Whq/EHPZv3D6qJP179Jv0yvBnPRlVePnjLwDV/nj5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rHKgFVAV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.49
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012049.outbound.protection.outlook.com [40.107.209.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E75606A327;
	Sat, 14 Nov 2026 14:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00E75606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rHKgFVAV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=klu7vRFgT5UY6FG2O90Az9RcjGNye2apW6ubOhN08g+L51PQASvkYXIFuOnTbHWteohkCIOEMpVIeY1bj/uYKQ3rc5uJc2sIMZ2xcx9vfcl7L/YvqLTpRF5DPRZxqnW6oduSEFunTjW5l2Vde6n3htf4/RvDFrng0mmT7/Ggh8HVQmMKA5c92fqWBWb8C4eAXTR0plEN3R3Rofc0fafcqW/uNhCw3Nbe4rtggX+bazpwH7RMDpHqX07Hir76Xejy/+GzFoGBb2/epSZ3QtdITDpZa5p21T9aP5Kh2SNu9yy3DhB0AyYW4xSkHtEohxP8Bq9IP7hEVo+K7gcyhiXIlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Di0ft0ysPyLVWj6ryRMwVbU0d8oNj/geZT1epehcqlk=;
 b=SYsbJbWeThsZc4CeGJqCdlqIcD6jOWi1PyrvqsqMkAFv+MOwlnnPmOhH+eVFc3H6BPW6KHNLXhWhgcSwB4c8WYh/u+6JrOQofs/CGQ88385QKTneijKqKML9ByjkPfNcylPqXapo1pX3fBuxmFO2Dj5pldK03xJjHdMbDfaqZdBLN2kxFnktfnsBDgZxKLtMMBUHeIgorR4npWvXoqmrru8lX3AkziOLv7GepyD73KKgGfkL5jA3P5+SMZ1YrVFrdIIC2suRWu8h/NLh0NoYvYbSRCbV6yjl/y5gENhpUdvoGlMMlhYmdV+0ujaAo3hQf1BXegyAhOvSVI1bRi+dew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Di0ft0ysPyLVWj6ryRMwVbU0d8oNj/geZT1epehcqlk=;
 b=rHKgFVAVJqc0bUOj9JESNpKaE1Be/yfrOpQWhL3yIfnbZt10L6R31llYAniYpffVWe7WMkslpQsGGzsp8QL3F+Yqjaa233ziCnnRqFh6YZWbf77ypC3Q+vFikWFrYfUb64St/4D2oK2z8LanMInw40D1aT4tncP3iKp6FP4Ve57EZwwDEMskqk3Px2VLE5l/3SIb452J+oX7Jt3eplXiBD8ah/b6Xkc33iCY1oB36MMbXJ9WwjCb+ttoprhPHAcVmtTxfQ1kE/WEF0D8KxP1tkY0NmTbtYTuFqkuNQqA8xWoeywpdG7nR3Z47MIRK41qoqxOs1nXuZnQ8oShbGl0ig==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by SJ0PR12MB8613.namprd12.prod.outlook.com (2603:10b6:a03:44d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Sat, 14 Nov
 2026 14:01:15 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0615.009; Sat, 14 Nov 2026
 14:01:15 +0000
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
Subject: [PATCH v6 0/2] selftests/resctrl: Check the effect of the CBM in CMT test
Date: Sat, 14 Nov 2026 22:01:06 +0800
Message-ID: <20261114140108.36954-1-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0057.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::16) To BL0PR12MB2370.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 357ffacb-27cf-4bec-d7d1-08df4257bf99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|10067099003|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261102123227099003|261026121527099003|261026140227099003|261022105027099003|261028144727099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	pot9AE7pnkwFqjVwfn3Ykae3RtCRrIkBD7HSy0L0L44p7+gItNVDg0dgpiT/zbZZ2dFWX2GlqVWg9/BVSoZXuyoLGUnBKLB2W+45cR6GbTv4BfUJdVPfry1qpfxS/4EIs1kL8qgy/CjzObaflf0SYGoloVKVAORKM+5pL6A+1Vy+pongeN0HK5tNRgYS+qG9BvpMAOvcn/odsYlVWQTV/MvdvbgGpmYcJHpNtQEJlsyGeEl4HEYSGwSGnyATkqyZkDBVmZosx691N2j0o2/pUphBkFAZulxEUeNNiUCD4GigxXmqqzi6LIrvJk+Ey+o4TcXkYtQSNmTUOSymqEz+5XOlpMIy34OKpUhqDRFUii5nSnrOFChWyccIaKOf0cDcSnri5fvy76g5necQDQ13dwSQ4BNtotLbWgj/Wa+ZfeMPl/Ce+FdLCYRH6/+YrS9HthRTH/jrh1cpdKy9mEPByox6lW5cWxlZR/IGt1IA4CmdxG8WAuWPno+MXHvN74XrPFoOnvoXvAUpBW/WaCSEZk7rIFoQ25b7o0AjnZflPSTX4sYYtvjWMtNI3jy1xFfW9BqdPKkwc43liRF4Du9LawPbdi2ZfyF17xzHMueJFE1CWeH/b++islAZ2jW5vLtoKPi7l2r+jisJX7kgVfIeL56o9Rwu6YNNi/7fFOCt2+s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(10067099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(261026121527099003)(261026140227099003)(261022105027099003)(261028144727099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bJkpVK87k71NgrJs/vC/2z9xKMaMKU/hJveEge73RKLpx83AQiyFEgufVKob?=
 =?us-ascii?Q?MVkYSfbiRicULzdGj3qgGX4BG0WMqbOdUDzHTmn9S4LXxz15104c/G2z53Gp?=
 =?us-ascii?Q?fe9OUaVFnjRWVpXprv2TeUOaVUGloqBITciv2J+Z2BeIJNw3qiL75u0M8ftK?=
 =?us-ascii?Q?CLo2kODAiA/4uSMpjycedX3TRxlw07SmUwr9ZJK40YA0a3CT/Hmnikv2QI0y?=
 =?us-ascii?Q?oroO3AYsjQfHaZCX3hE6RFYP86r7G9K3reN7cLL1TMwvWxStgfS3nGMc/WXa?=
 =?us-ascii?Q?AqUSga0Q3qnPWaB1H6FEqaR9U+wNpQGTwpKlXs292sXMDJupxzxYXE/40Ycp?=
 =?us-ascii?Q?jT99y7tYI1etVJQ/F51eTTYALnAVvd46uLn0NvemNN8TzJnS+g0OhHOau9+B?=
 =?us-ascii?Q?ov8fUKLlMQAebF4pQmQQmYDtC3VitVKSQu6E2FVwUoohA5Jdp5gW2eHo6hQf?=
 =?us-ascii?Q?ofvTi/1ELLBHVQUUj3PMYhRJQBG20YFMV7Hlp/jpDiovHdAibTJMx03iMZXw?=
 =?us-ascii?Q?jBQrECVbuORHlr3y4xSYfAH+iBGrA1IHkOORViQpRsCmcyUEzrZmyQXwfwG/?=
 =?us-ascii?Q?vNctrONMjWmObGEeKSpv6O/l14rxopZINuDXIENKI6k0uV41D53MzQ6ZRfLX?=
 =?us-ascii?Q?JkkPVKmWfMhBeWGoxZ+z5EM2R89/g+qBkctpLNHqCZx1fLQbvtrKWOYPZG9V?=
 =?us-ascii?Q?Ka7hXVh2sNOhhY+b4YXKmTkPCtJ4HeqwJcRdclCW8dcboc6RkGEyCuAupd2j?=
 =?us-ascii?Q?n6ia6zuZ/Y3e6QwWidv+YVFb3XTQfJ9Myv9bccx/QzRA+MGWbD1BjQSylkYa?=
 =?us-ascii?Q?XCGmKHRBWWCHiNRGHBJ1IaIjpWOhI3dP8BXjay0KzlwFRl+tg8JW/yreZvMc?=
 =?us-ascii?Q?XeuloKF+4H8BLylcXmiWZ7gcWDbxHZDElu4cu6Ya2Fn/MGQcn7opQuPEPi9a?=
 =?us-ascii?Q?HVWda2pUvXyg4kGkQ0IK+w3cwnyxSFJsw+bHRzndPlnqxvO/5J/mTfFzvQOA?=
 =?us-ascii?Q?6vrIK60mboy2kWHJdEQ72mDZXLn3tLtgdQk4/GeRsxdgLXuwvx3VbaJjKa30?=
 =?us-ascii?Q?qLCJ0c2Ch9zfxgLMpLCKjCRDJHv4RoizNiGnUuAAPsAMzqXWSUc+eJ4A/BGz?=
 =?us-ascii?Q?JD/ZWYFws8PILwUZRLd72FdVdKkQneEwW/T/StxR+Y4K091UyzIAVtoZPbPP?=
 =?us-ascii?Q?5mH+iROosrdQuj7HsWJrDRt5q69oY264fL9UD6G7kYAvjGbq0I9m0H9dRDpR?=
 =?us-ascii?Q?ywZxzg1XNb5yQY5/7YXW0KpDsUKdWvDqFOFkFoZCbOuLMwjBKWKEgoJSYXDf?=
 =?us-ascii?Q?h6fO351V1Dqq+W/LjqhmR6BAEcklvVsNMCMe4FyaK6XQdBLAicCqILfLASW2?=
 =?us-ascii?Q?nVeCHEHaIerAKN6oGJaDX0jkGhpqisE5nLCXjWmQzn4kbflU9DLlzlWShqjX?=
 =?us-ascii?Q?kXP2NjlGrWhcQbyts05tR/j35JwqmaxiZ5QkfmFkSihoZoEOgf3jAp7xQsmr?=
 =?us-ascii?Q?vwv/iZmktgecznHdJ4zsH8Blj1mMfSEvjWXxYE4lEWjYpymMNK4+dVDNJBB5?=
 =?us-ascii?Q?BqypYOp4BOkaqDvbQlwAfx84KewDJMKu+f1b0PSrX1x662CY8hDjEADaIxSu?=
 =?us-ascii?Q?m6H8soy8HubXhKo54pf96QgULdCqkoI18ES2CzYND0FIVg1z6lrJ93Ht1Ych?=
 =?us-ascii?Q?nxe0qx8G7W0MvB9RRNeXco0jNw1PhwiJ26oxbchC4TmDAuU5vmR6N9h28+p6?=
 =?us-ascii?Q?f0RVCTEGdQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 357ffacb-27cf-4bec-d7d1-08df4257bf99
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2026 14:01:15.7906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0NLtBxFXc9XpqTMcWajp36AsVZgMqxaOEualbE7aELlJk5oAuyzn/jAY8VpPrQ1fUL2MEQGiG4LjyIsRnyHddA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8613

Previous version [1] added cl_flush() and sb() for aarch64.
As discussed there this does not work on arm64, and Ben and
Reinette suggested to enhance the CMT test with a forgiving
check instead.
This series does that without needing a cache flush.

Patch 1 fixes the CMT test failing when all cache bits are tested.

Patch 2 measures a second time with all CBM bits set while the same
benchmark keeps running, and checks that LLC occupancy increased by
more than 15%.

Tested on one MPAM system (16 bit CBM, 172 MB L3).
- Default (5 bits) and -n 2, 4, 8: occupancy increases by 75% to 130%
  with the wider CBM, test passes.
- -n 9 and -n 16: second measurement is skipped, test passes. -n 16
  fails without patch 1 (write of "L3:1=0" fails).
- With the second schemata write changed to not widen the CBM the new
  check fails as it should. Widening 8 bits to 9 (+11%) fails, to 10
  (+23%) passes.
- -n 1 fails the existing check with and without this series,
  occupancy is 35% below the expected value on this system.
- The CMT test takes about 5 seconds longer.

Changes since v5:
- Drop "Implement cl_flus() and sb() for aarch64", replaced by
  patch 2.
- Add patch 1.
- "Recognise aarch64 as a vendor for L3_NONCONT_CAT" is sent
  separately, it does not depend on this series.

[1] https://lore.kernel.org/r/20261012074729.40042-1-icheng@nvidia.com


Richard Cheng (2):
  selftests/resctrl: Fix CMT test failure when all cache bits are tested
  selftests/resctrl: Check that CBM limits LLC occupancy in CMT test

 tools/testing/selftests/resctrl/cmt_test.c | 85 +++++++++++++++++++---
 1 file changed, 73 insertions(+), 12 deletions(-)


base-commit: 30af56a227e27b892d34bc44c23298b5274913e3
-- 
2.43.0

