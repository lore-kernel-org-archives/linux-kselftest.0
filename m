Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012027.outbound.protection.outlook.com [52.101.43.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8EF412BFB;
	Mon, 28 Sep 2026 16:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790612646; cv=fail; b=MxLzcRydGSEXoj09jDmrzyBTIP27/5JTbG93gU+2huTP5Pz3APjxwaUZpaQKWvrg3QjnF8/JVtRkYs6RnJXWlQdEdblo6n1znvnLejaKkxzAkN4IuoExpzssDVnggMz5+ypOU6yA8sAi//AG9PgOkZhb1VHRmtrpqvxVniyg03E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790612646; c=relaxed/simple;
	bh=DW8H+C7SD1rTyp8gL6nz/xKMYGXlXKGnz3+6qiR3VM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MGdj9yPRUpbgXZ1Kopl9Z6IZTBjXAymYj0/0AZNp+aQ5qOQTAsB+R2RQqv05+E8bNBMnI/Okv9DhH01d/gAAdw7AW2nJIYl8ui5N8jAfKeKiTc9oAzsNF7FWFgASJifOnpw32ZYun00OPGb7202KjY/ChIevaVZGluA7BrCDWLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=r6munUIC; arc=fail smtp.client-ip=52.101.43.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="r6munUIC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=acg5Nsibzc0ohMjHxtLue7YuOQFFpW1EB+iYWOEkvkzVlv/OFRABQeS3vhkhzYAbYtbg0/+7/QWUVUyEO32GTFKZ9DP+pjgaZrWNzm3uO4nQZjOLuS7pnkuC5KI5pRjHVzuGNMl6zCCVIp4YsEqxGt8DrYFzWNo8ioc4dK/29p4lQtA1SMB5q6xV8djeg0FZ0bXrotEwlCxXKUXKGEF03iAgE7/d0e78KLxzQNTq0GOooFU17wYZHNAmUCicuBn2YF/Zc4miuFBLqwYGqjzGfbjugzu6r1z1MujhS3ItWXsL0Gid87EC50xVXCKKvnpjd4UDl36d/eaWyngfb6Jurg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BTlnQnnG4HgBlKdhPchmD43LuitZpKAryl8HpxnxIlw=;
 b=sgPm7ISlDgGP1dVdYkxn04zDKCTmlBjprMbZcFv7tTNs1UQXl6vWbkl0SUpxUAoEOqLKAQjnQMAir9DDF+A23pJGckF811Z4C95ykyKkoFYSupprZxw+y3mvsRH5zJaE1N6IFQ83S900N/jJ1s3iWIG5BwSP8gFjrzdULY0Dy4kMfgTHy/sE4SBy6PZ7xLx4ZKct1nxejtpPICRgjuIOp6Bdyob6qPsbAQfXNgelxmW1u4qoEI2+6FiR/nyEuKizGzAt+DLtMACflKzhR5wj/aknipai21QRogEE+0JxyeV72+g4/8ANYSahSgRNbxWkDWsi9+70fd5ryto+7b5gGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BTlnQnnG4HgBlKdhPchmD43LuitZpKAryl8HpxnxIlw=;
 b=r6munUIClPZmUv+lOIWiBiF3b8McAfrzlEYbkU4TD6xNMBloaJXAJz5YxpXuX0sc6kfyUelYkDyjLIXCPpThJNDcYnAdVdzeqiHzxioltNeIktUjy0ksA0YEsbXqob0ytwSspGJf+uO1SGHbyo8GmWxSEUw7rovk2lPcAT3HTV0=
Received: from SJ2P220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5da::17)
 by SA1PR12MB5669.namprd12.prod.outlook.com (2603:10b6:806:237::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Mon, 28 Sep
 2026 16:23:57 +0000
Received: from SJ1PEPF00001CEB.namprd03.prod.outlook.com
 (2603:10b6:a03:5da:cafe::9b) by SJ2P220CA0005.outlook.office365.com
 (2603:10b6:a03:5da::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 16:23:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CEB.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 16:23:56 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 11:23:41 -0500
Received: from [192.168.0.103] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 28 Sep 2026 11:23:37 -0500
Message-ID: <3bd1195d-35fb-44b4-bc96-4ec32c70e3d1@amd.com>
Date: Mon, 28 Sep 2026 21:53:36 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] selftests/resctrl: Add MBM and MBA test support
 for AMD
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <babu.moger@amd.com>,
	<fenghua.yu@intel.com>, <shuah@kernel.org>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <peternewman@google.com>,
	<eranian@google.com>, <tan.shaopeng@fujitsu.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<x86@kernel.org>
References: <20260810184806.1089507-1-swapnil.sapkal@amd.com>
Content-Language: en-GB
From: Swapnil Sapkal <swapnil.sapkal@amd.com>
In-Reply-To: <20260810184806.1089507-1-swapnil.sapkal@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEB:EE_|SA1PR12MB5669:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f0e89da-f8d5-4a33-c331-08df1d7ce51d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|36860700016|82310400026|13003099007|260925021311599003|260925021911599003|6133799003|3023799007|10067099003|18002099003|22082099003|56012099006|11063799006|260925022911599003;
X-Microsoft-Antispam-Message-Info:
	bCwvAggiD7ceMpznGN4MOWeEAWcFs+yINflUT5vWeuTlXU7jlD5U/Mlh9eB2XBWdAwVVQKh55BEtddxoqUxy9En1F2yOE81gnf8I6P4I+ZnjFBfM0Ipdit0zzQXS9QNBoEOJlR4dnV6ySWitbDjTNba6M0XDDLQHLVvsRHXFtFDhxrkxNVN8L7xhdbvxBgKhxFcT0gNCRWhMmV8UIOx2M2uo1TiumfA7OQaeyWDYqAR1z8YlDPIE602oSG5guYE0HWz1JG2a33EdKBWSX/PD80t3nyxSxtm7mPTo6ORycfyU+mXwuB2bLsS3QNYHxAWbv+30I73rHELqyk0ZAtKVATxe+OfR68rVJT0xXXJqHvhMYHROBdZoQfIzUEgrYhc5ZzsGVNr3Bjz3Vl59WaTisR6H9U3q7YEB7PkEUQ6YrvSpKwgU0eCM7gwJAek566VtsrJMWofT7jHUdZ0izW1zDjoYi7U0JDuaB1c1o5y+xRPXsDu9NMdao7GwOh1RDpkJPOH5qhzqx4J0lxG+kg5peK0bHQGUs0VriEeDdSC5RQMkjXE4BypFqp1/bBjQRJqnF8cWU+ElnlTq+Vj9lhjjN7NHDOmxAqXm0uAGIkWUpqgEGz8nnT9XcHjF3fc7hFU5cEhYeLXAdlfJVcykY5VwqwZb5A0NFUiqa8ykeXFtS4Y=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(36860700016)(82310400026)(13003099007)(260925021311599003)(260925021911599003)(6133799003)(3023799007)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(260925022911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qrZaajzFtWHluNZJLFiWvSlQa7BT3Wyqw2IjH8CccvpX7pYUGUXoKA2Rs5nJ/E9Ojb3ArZDZxav/Q+tJhOaNYc/Mk4FXMAVUHj4iwiU8uZnQObqH8sfXeVHi0g0GxOM4h4XXJBMP+34lgiN1mczAPiJre+3HtSsXoTXJPELmAZ/S++4sAFvRYdUmxcnJTcTygcJK+LQFuMgJMscY7mMpyQXY2UOsJnGuPnFQjHcxsCgbpWKokYEPh0UHmDtWIOHInEGRC3yBgObfRENaYzBeN9uTzvWtlIuliislHVaI9AxHub5XwlfEM26uWYDiTX6ahsYaUqWCowxPdkOOMezAFlIronE6+Y77t3ztNeKk1lBgzFzuqyVXSOLDJypLtXzVpF6+QION5reUr8q1nkYzSEa+kNgwaV2sOZpmFKi6xQCmmIeWdMpc4SyKjPKzBD04
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 16:23:56.6301
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f0e89da-f8d5-4a33-c331-08df1d7ce51d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5669

Gentle Ping

On 11-08-2026 00:18, Swapnil Sapkal wrote:
> The MBM (Memory Bandwidth Monitoring) and MBA (Memory Bandwidth
> Allocation) resctrl selftests validate the bandwidth numbers reported by
> resctrl against the memory controller performance counters. Today this
> only works on Intel, where the counters are the iMC (Integrated Memory
> Controller) PMUs and the tests are gated behind an ARCH_INTEL vendor
> check.
> 
> This series teaches the tests about the AMD UMC (Unified Memory
> Controller) PMUs and enables MBM and MBA on AMD.
> 
> The work is done in a few steps:
> 
>    1. Rename the Intel specific imc/IMC identifiers to the generic
>       mc/MC so the code can serve both vendors.
> 
>    2. Detect the vendor and select the memory controller PMU sysfs name
>       accordingly, keeping the rest of the code generic.
> 
>    3. Add the AMD UMC support. Unlike Intel, the UMC PMU does not expose
>       the CAS command events via sysfs, so the read event is programmed
>       directly (EventCode 0x0a, umask 0x1). All vendor detection is
>       contained in num_of_mem_controllers() and dispatched to per-vendor
>       routines. On AMD each UMC is a per-NUMA-node PMU, so only the UMCs
>       local to the benchmark CPU are opened; remote-node UMCs would
>       otherwise fail perf_event_open() with -ENODEV.
> 
>    4. Sweep the AMD MBA schemata using absolute bandwidth values (4 GB/s
>       to 40 GB/s) instead of the Intel style percentages (10% to 100%).
> 
>    5. Extend the vendor_specific gate of the tests to Intel and AMD so
>       they run on AMD as well. The gate is kept (rather than removed)
>       so vendors that num_of_mem_controllers() does not know about are
>       skipped instead of reported as a failure.
> 
> Testing
> -------
> Tested on AMD Zen4 and Zen5 (multi-NUMA) system
> 
> History
> -------
> This series continues the work Babu Moger started; v1-v3 were posted by
> Babu. I have taken it over, rebased it onto v7.2-rc7, addressed
> Reinette's review feedback and added the AMD MBA bandwidth-value patch.
> 
> v3: https://lore.kernel.org/all/cover.1718385426.git.babu.moger@amd.com/
> 
> Changes since v3 (per patch changelog is present in each patch):
> - Rebased onto v7.2-rc7 and reworked for the upstream resctrl_val.c
>    refactor.
> - Contained all vendor detection in num_of_mem_controllers() with a
>    shared helper for the common counter "type" read. (Reinette)
> - Fixed remaining Intel specific naming and the ksft diagnostics.
>    (Reinette)
> - Handled the AMD per-node UMC PMU topology (skip remote-node UMCs) to
>    fix perf_event_open() -ENODEV on multi-node systems.
> - New patch: use absolute bandwidth values for the AMD MBA schemata,
>    with build-time checks that the sweep count matches the result arrays.
> - Kept the vendor gate at Intel | AMD so unsupported vendors are skipped
>    rather than failed.
> 
> Babu Moger (4):
>    selftests/resctrl: Rename variables and functions to generic names
>    selftests/resctrl: Detect vendor to select memory controller sysfs
>      name
>    selftests/resctrl: Add support for MBM and MBA tests on AMD
>    selftests/resctrl: Enable MBM and MBA tests on AMD
> 
> Swapnil Sapkal (1):
>    selftests/resctrl: Use bandwidth values for AMD MBA schemata
> 
>   tools/testing/selftests/resctrl/mba_test.c    | 105 +++--
>   tools/testing/selftests/resctrl/mbm_test.c    |  24 +-
>   tools/testing/selftests/resctrl/resctrl.h     |   4 +-
>   tools/testing/selftests/resctrl/resctrl_val.c | 366 +++++++++++-------
>   4 files changed, 320 insertions(+), 179 deletions(-)
> 

