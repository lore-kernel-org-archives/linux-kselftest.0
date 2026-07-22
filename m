Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013034.outbound.protection.outlook.com [40.93.201.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879DA3630AC;
	Wed, 22 Jul 2026 03:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784692794; cv=fail; b=SNayav+oD6fciFjpQm4gpUilBYv4yVoAbFXIkZttNoLMuOY27X0zXWncPrFsEUF0Ux+vB6Y9P9S3uj0Z1gtlYhbdJknw3JImZ2y77dBfR/p/DyGBwIvRxA2bAWAq/iMgXEvIHbRLyeLrV/4OluFyUzDedLkI3X2b1a5NM0ca/5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784692794; c=relaxed/simple;
	bh=zpXyGbYgiDugPSASEqVvJLtNP9QATmZDLwOfOUPUxhA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=t52NxbLj6Q+Bd0mLj83NL5I3vvC92op/3bXOl5brL+/O4o7n5J2wizLNhU5CmWHtv1SPbatLfFi+jQg/I9M/0tNoTk3VnrP+LIE//oxabZ/KjGSgmiJRn77keMjAIsJNKTHWh0qnSJKo/PLFr+n8bCn8kydyaYe/Spnu7vgRTWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=q9/Xm54y; arc=fail smtp.client-ip=40.93.201.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="q9/Xm54y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zRuoBxDlP1y88mVxXP6JG1Hs5kFqq0Ad+uVHBiUCTDXDW42zRIPjnIHa+Y3rrU80ZLobvG9bM5jUwvSdPbMb0E/2FYjzXdvI8cUX8lI06CB7G1MWp87woHN+pA0DS7jFUYRQueBgGRpzoyuEUhMVHX8Y09Z5A2olxktRRf62NmwiOWoG07mliyfnu2Ns3EpsSMKMLc+M3mHVrUSa1R9v7MlQIg1Npyd8qI4vcY0GrbX4P9VNmsKusFJO4HEk9EshwnGlHEvbQvAsX4k6x9aLMzquq6iKW7G1h9jdzLRwofvniO+pSSmyC3kLLonpcDJfMLo/qpZwnDrkpodclvhOyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hNjaJuiyCW8n1pGfa79gI1qZxxOZXIqRrywpDzZBHA4=;
 b=SSqCwtA6oYW0m/LuLjSblsY0KBzJdxfDu6JaY7ansm/4hhMgHo9phw3nQbhgbz+n5v402zpuxNC7qIeM2+CUW9+bnvB3O8Bw9pPXTkA9oZpSmEpNLlVFpbWEW2M3aTMMh7zv2R8jHWv8XPMGwQYl3ogP94H0fGiITOuEVJW+ndvhAeWxxuILnF52PKiUSQKocYa7XbnNyeOvutwrHU2mOeAE11a6XK2jbpEff/P60QMIa1g3Cxr9bu9cAflLT7/PFVkcn3aVUVwOBG5XrmKxzbZPL+Y241H3VZ2a7P90PF0dajtJ+mWOk2c+TBsqGILvLwBXII0dhfHGWpmqBE1gkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hNjaJuiyCW8n1pGfa79gI1qZxxOZXIqRrywpDzZBHA4=;
 b=q9/Xm54yP6EaD2wriq5njYzLHdJEzcZLckP0WkgdAhPL2hNhgajGEKpRxLTbLgZvfQO4/p88gORRMjZdtFG5N6euaHKNy6nKCXKUBMqmMYwaf2j9P7v3vfer2mf8aVxP/CJJNE2d8M4tMmTObIAZ+Free1B+61sr7ZCEaeZR/FIe5sKftrCB1Qd4CNUgpd6AzdSh4DeKuZ1gG9HydQfERdr6VEVRXgq210tNnXdJYerJsEyywpY7ngeBri/VmidBOTvfW/D2VMXBOH7KsmxLKXgOc2tguzi7VgWXYBl6qiRRjE0RAlTEilMUFF8t9zzm0cO/EsXpdLU5zHyb1z+Tyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by SA1PR12MB8093.namprd12.prod.outlook.com (2603:10b6:806:335::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Wed, 22 Jul
 2026 03:59:50 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 03:59:49 +0000
From: Richard Cheng <icheng@nvidia.com>
To: tony.luck@intel.com,
	reinette.chatre@intel.com,
	x86@kernel.org
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
	fenghuay@nvidia.com,
	ltrager@nvidia.com,
	Richard Cheng <icheng@nvidia.com>
Subject: [PATCH v4 0/3] selftests/resctrl: Fix resctrl selftests issues on aarch64
Date: Wed, 22 Jul 2026 11:59:40 +0800
Message-ID: <20260722035943.32337-1-icheng@nvidia.com>
X-Mailer: git-send-email 2.50.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TP0P295CA0057.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::16) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|SA1PR12MB8093:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fd4f3f3-2f73-42b8-456f-08dee7a5ad2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|6133799003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	/6x+uYik1A3kITr3Nlec5BkjldlsN2dsPM5rXYEmCCU2+hv2lJR/F6qn8kaFF8c+7jSm/aQhq2Q+nXvg3eAyTSMXQp2li7YmPr6BH+JnvzEQ72QJJ4n0niit1vRYL1ahmAWii7/lm/dN9yNTKLTsl1LP4SFevV5uaZyhtiS6hGoonOsw4e5Jf5zpWxjNg3XchJkdRfhgz2FUC9jtM3XlrnvRPgYUr6oW/+vdc23HkhkjyMnXPeJGTUw0gBu0+hDjjXy8KaQtA76VM+MyNB+B92/7gSZmZYEHkWrM8HyuZuy1sU9TKNch/yHnaCqpIS4jxIhtSXp0I2nB6axw2qQWadch6I58O7sHRav+ldT8yrMI8sDn2kWsGFD3s6thazruGezLbKFL3yMMimGdjZ93Go93qiU4IjbJEf+Uuc3wHIb+Cyz5+OPr/7ZCyyV6j2m3b4jF2U6tyPLtieNtVbtg1f48p4wdPVJNHvRoSYJ9DA3xpN3xc5wUtcrAmS8kMv7kcNotbBEHQlJRjeyoXyvk3iW+Mn4LaHv0K6zbnVZq1t+reac+3kmRpbeELr0+c5b+n/ScjfJqiUpgtbr8o47eXJzIrkazes9+aLZSNPCYRMG/+XivugfwVwwlTa6FLGF9UXEV5MMQgfIcxw7CZXwYossLz4ezSUOncndRLP9k6Ok=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHpvY25CTWxQa2dwZ2ViQm1kTjBOOHBsaWxrRWxPN0hYZzhOV0pqdVo0V0hx?=
 =?utf-8?B?NFFucmZ0cFQ4WS9KeWtqNE1UN081aFRyODhvcGpzM09lMHRLQllIdkVYRW04?=
 =?utf-8?B?ajZxWGlqaDZQMTZCdGZFZEJjaDAvbWFrZ25JaGJqcThWTDQ3VjAraG15RUo5?=
 =?utf-8?B?TXBDMmFRMldFTDNTZzhTTnJkRks4S29rWXVUdlRQYUxwVUExeWJ2YkthaWJP?=
 =?utf-8?B?RzMyUWJpeElGOHVhd3RJRGRwUnBYdTFJOW1tYkxFUllGNzBGWitjdGprOGVU?=
 =?utf-8?B?eGJhV0toVnhqKzVLaVh1L2lZWjJiampyblZnWm9ES01WYXlwMnhielZXa2Qz?=
 =?utf-8?B?Yy96SVljVnBVMFNzK2FNSHRScWNFZm9XRWRuZU44a3RzZXM0QkZZTFdIWmxp?=
 =?utf-8?B?Ynhzamg0OU1OTnpOYTNxencxaDA1RWZmRnJXcEtydWJFaHJLSkRZOFh3MUd3?=
 =?utf-8?B?VmIxaGk2dG9jMGQyMHd3K2pjclNVT0dXU3prTTFHU0hpWSt3dVN3YU5ZckFK?=
 =?utf-8?B?RGFzdTlsemFPTzJKa1Y3SkEySGVQTEVTU2JGdS9RQ0ZleXlCU1Uvc0ZHY1NR?=
 =?utf-8?B?TWJPcXpMdVgrRGxoU3k1Z0FadmlqdGdXUlNEcFhVbEx4L2M1TnBkSGVtclZy?=
 =?utf-8?B?UG5lVE1IdzdMaElKWFpSc2RhY3hiRkc3Zkx4YTR2c0RuaXBDS2hjZjliVDg2?=
 =?utf-8?B?Rmk4KzNhRzJadEtOWHRnSGxkYkFaZWNzdlYzRDhsRTZPY09jdWgyUU93QUxq?=
 =?utf-8?B?S0x2VVNUZlBpcCtISnk2U0h6NU9DUnUybTVRK2wrTGE5SWlEd2MwS09GOUxL?=
 =?utf-8?B?N25NWXdLcENkeHhhQXRYR2dPWUVrV3ZSODRZbE5BcDRCWUt1c01ldU1ScVg2?=
 =?utf-8?B?dVMzaXd1b3FUU1NXV1ZDMU5uVlRQK3pDbzQxMUtVN3ZnNklsQUdWSEltSWxl?=
 =?utf-8?B?dmx6d0hMK0tWdS8rdXBpWHM0dmhkeEk4SUp4VDB3Mm5DcDE1alpodWlaZmpy?=
 =?utf-8?B?VXU5and4VWJ4STJTcFM1cUIzUkVBMXRqMzFGY1lRWDE3UXpHMnd2TUpqWEh1?=
 =?utf-8?B?Uys5dHVNUkw1V2kwQk53TFFiT2ZTdUFwSFE0TFhLNUJQU1VTM2QwUTVjWCs3?=
 =?utf-8?B?aFIxSUorRVAydHRKbGx5SzQ5N1JldHhsTEtobU9ya1lmdFU0YVUyV3NaZXBv?=
 =?utf-8?B?eWNFR2tWYVBXbXJscVFxc3VPMjgwUnoyT05Zc0ZtMFdwaFpNWElWN2VtaHU2?=
 =?utf-8?B?STE2WDFiTzMwZm9LcHZmdklibFRWM1RZazVwNzZOa1VIWXd3RUpFb0cwdW85?=
 =?utf-8?B?VjZrMEE3SHAzK1krK1d4MGlzOGUzRUZaL3NSaTZwZG5YVmJHRDNEcStkeWtW?=
 =?utf-8?B?VUVndzZWTXNPb29nSkVId0ViVlZCL2dTZENjRk4zS0pQMlR3Myt3S21sOTgx?=
 =?utf-8?B?akg3bHc2SGZjaEE4VVlwYmV0aEduRTN4WUw1UC9vWC83WHN0UWtyMTQvL2Fn?=
 =?utf-8?B?cmZTeDJqcUhmTmxkU29IQjRCQjlXemQ2RTFpNlBKMjNHaHB4K2YyaGc5ZkF2?=
 =?utf-8?B?T29iNk42SGZLUXY0bUQrZkVMY041a0pCNXNWUUhuek5IdHlHcFh1S3NJQnlE?=
 =?utf-8?B?cXlOd1pYRms4RUNEc2FjRm1aem9GMnovQjArS2M2emtmbWs2Y0piWjRhZG05?=
 =?utf-8?B?UGhXTGVlWTkwbThsOEZGQWtnOTBrZDZsYW1NNE5NUkh6SWF4QVNpeUdtUmQ2?=
 =?utf-8?B?LzEzS2hKamxDQVVYZmVZZnZTay9IdlgrWlJvRlZjWnBiWERvTk5ndEhBUnNh?=
 =?utf-8?B?VFR4Z01aYVRBdTVqdHllZUxtc3RBQ3l6czlxdXpmQ1gvMXdMNGh0QnpGd0Nz?=
 =?utf-8?B?VUJUUWJzMGM2NmJGelVLRzVsNEI0d2NabzBwa3MrSHQwU3BVL0E2R2pYd3lp?=
 =?utf-8?B?ZnAwZFJnek1iOC8vOWlJT3BZSExTYWIrUnh0ampTZW1ISXNibVVLMTlZVGdl?=
 =?utf-8?B?STh2WmhzY0oyNGZ4ODNMNndkWUZPR255NERWV1lpR3Exc2pzZ2FQclFoY3VR?=
 =?utf-8?B?Z1Z0Tk00eDVwejZDTHVEeUdTZWF1R3NKV3NPdnF0NWFRdWptaTJwMnBPM2pv?=
 =?utf-8?B?N2FTc2d0ZVVoeHVGeEVQT3NyMHhMSk1HT2NSdEhzNG9EdW5LdDlDU1NRNk93?=
 =?utf-8?B?OWIwNFNVWXowRGlBRUFkaVlQWHViVE5EbXIyOTBaa3FQalk0MmZmNmZEZG9h?=
 =?utf-8?B?eTZaU1dCR3FvMzdpR3Y2VEx1UDE2Rm1aSGM1RnVRS2U2bWpScnE3TEVKTDkv?=
 =?utf-8?B?SkxGL3VZV0NSL3dWY3VITjIvd1hKM3krT0xXOVlKSkd5ZExIdjJZUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fd4f3f3-2f73-42b8-456f-08dee7a5ad2f
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 03:59:49.7801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rPF7nEBu5yUILDNj3xuoYCp/3CJcI1h+r7y59bAAUI97XNVniBfwqoNc52jXOw6WyQPy06LRl2l0wM0n7wATDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8093

This series fixes numerous issues in the resctrl selftests on aarch64,
where they currently misreport failures.

Patch 1 skips L3_CAT at feature-check time when MPAM legitimately
reports every CBM bit as shareable, instead of failing the test.

Patch 2 adds aarch64 implementations of cl_flush() and sb() in
fill_buf.c so cache flushes are no longer silent no-ops.

Patch 3 teaches detect_vendor() about aarch64 (which exposes no
vendor_id in /proc/cpuinfo) and lets arch_supports_noncont_cat()
return true for ARM, fixing spurious L3_NONCONT_CAT failures.

Changes since v3:
    - Patch 2: replace "dc civac" in cl_flush() with a dirty store, per
      Ben Horgan's feedback that dc civac only cleans to the Point of
      Coherency and does not reach the SLC where MPAM cache portions
      are enforced.
    - Patch 1, Patch 3: no code changes.

Richard Cheng (3):
  selftests/resctrl: Skip L3_CAT when no exclusive cache portion exists
  selftests/resctrl: Implement cl_flush() and sb() for aarch64
  selftests/resctrl: Recognise aarch64 as a vendor for L3_NONCONT_CAT

 tools/testing/selftests/resctrl/cat_test.c    | 32 +++++++++++++++++--
 tools/testing/selftests/resctrl/fill_buf.c    | 11 +++++++
 tools/testing/selftests/resctrl/resctrl.h     |  1 +
 .../testing/selftests/resctrl/resctrl_tests.c | 21 ++++++++++++
 4 files changed, 62 insertions(+), 3 deletions(-)

-- 
2.43.0

