Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.34
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792676532;
	b=R/YaIQM15mxAs1ELSCDfVZlXlCjRyTupU7O/QJ8u+XFQJLc901lYvQsXG+CXL2FmRlFK
	 m15VIXZqOI9U1xPIjMa8I4PpTPlWse8/3ezf7I8uzbWMZ4TU8CCywzNPRDd+kjY2ea0Vb
	 t9XvZTuzAypTuhRDIqaFkaz37H30RugFMGUHEL6tplEOqMf9QHIerRJQ6U0lIPhf6pVYG
	 2CT9AyxGmVTJBjkd2Md6WO5Pm4os/5seNwrd321YUBm9iUrU6LkKoWYfiAonuFJ9igHyU
	 OhOnK6zeIqWjPITONTeaNme4AvyuNLklHwIvBm1Pby1HKHiaqjRrM3yg8VHI8GxzYKw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792676532;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=k0lEg9AtN7A6GwPkZqxbTkNorffmZLvBBJVSZcN1WGY=;
	b=B0lVzDbQZenuLLPNna+qMFsV9qD8HtbVFHLYrq5J/gR/yLijKP+eoUcpeiJakN7XWjVR
	 u8KiRiRcVeYfAgfpm+bsFHfLqvcUNkSB9Ba/wuozKZfx+cvPbO0+JkcycUy8M8kRaR5/a
	 ZPUMTUc5+BVLajI1KBHhQ8G2L4Jx+jNdXMYyCdY6NtXad4hw69YjWbgwTQjW3itBfwap3
	 NXxNH78g5Yr6ynL4PjHmWoO8SjwDiF6tvmCfdZlZKBo+P2CnXxwKMLx8y0LPv2pjd1qJ8
	 NsDbfj0pO0WiUcA6Fq4Y/PPXhWVqTlZkBslKfDhhLt70AdHf6L/23CPjyUHvseyL3pA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=lTirRIu1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.34
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010034.outbound.protection.outlook.com [52.101.193.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B7E606A323;
	Thu, 22 Oct 2026 13:42:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0B7E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=lTirRIu1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tRi6i11tU4NNDdkZks5OGnEhF0kRF1TP9SU8TVbIu9nsD5d8x50sar9DzK7Ia5+dBJ1OC87x5CjM5KwfDdflXG13S8o1GD3JcvV0n7CI63epKgYxSOkJeRGMjtNgf+ZzG/C8KPPzFkvmT4F5B+oQWTl5hRR5M0JVQOTIKlL7LGSVc7JRvjxVlfGwDGCflRgG2LNejN9LMeGpy8BkLd62nKStugIG06Bs9SocmTJQYWmjQr6DHtHp+jE8fVyncAS9kBy9UR2FJdAHH5gEFbu3SuGL8kwWtR5pUuRImvxViyiyi0dhIUQZCu24u1m5OcnCmr58Cw3/b/w3iJN5bTKwFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k0lEg9AtN7A6GwPkZqxbTkNorffmZLvBBJVSZcN1WGY=;
 b=zPxrbc2X6CSIVPyZetD2ICHNoDVjeuDeqiGZ2ZZuZJLJzIDHWVXuJKERhBgC+NuZt7tP67Capp9BRZI2Nr9FjoIT9gDOmpvLzXgzL/XhNFdse98F092ISVpYGwSN23HYYLE5gNGRWVAsHUW4yP4O5XS/tqg+OkVm8PIaP6lUX9oUXTRIm+2qMYjFfPkmBNJm+Y1BTkVtAa/5EJitG/UhHlhdoNziYmWaMxYP/++VfaKnGvjoK7sOMz+6y0YxrIuShSXTB6B8AnRlLT/nPQu85kbjz0ceNeR/vRibSLYLcBfoJJsdVlZxVgKON5OYhHvpYPMo6cYcUeTqSoa1VEqGsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0lEg9AtN7A6GwPkZqxbTkNorffmZLvBBJVSZcN1WGY=;
 b=lTirRIu1zoB9+u9yvaeiQTJTLeVbEUEoz6/VKY8NiRTS8LL8lFvn8mmoxNR28rXppPXk+GqwlV4j2vYzVcvclLO0KayvpLSS7SklbnqVKWMwSMEH+yoXodBT22fNLVKFyLhm2V4MKbn0HXu8T73//dgIs/p+WFWBse+VGqTj2OY=
Received: from PH7P220CA0098.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32d::9)
 by DS0PR12MB9422.namprd12.prod.outlook.com (2603:10b6:8:1bb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 13:42:04 +0000
Received: from CY4PEPF000392D7.namprd03.prod.outlook.com
 (2603:10b6:510:32d:cafe::12) by PH7P220CA0098.outlook.office365.com
 (2603:10b6:510:32d::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Thu,
 22 Oct 2026 13:42:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF000392D7.mail.protection.outlook.com (10.167.247.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 13:42:03 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 22 Oct
 2026 08:42:02 -0500
Received: from [192.168.0.103] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 22 Oct 2026 08:41:58 -0500
Message-ID: <73b6b045-c305-4d8f-a37b-00fc4a810b59@amd.com>
Date: Thu, 22 Oct 2026 19:11:52 +0530
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] selftests/resctrl: Add MBM and MBA test support
 for AMD
To: Reinette Chatre <reinette.chatre@intel.com>, <tony.luck@intel.com>,
	<babu.moger@amd.com>, <fenghua.yu@intel.com>, <shuah@kernel.org>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <peternewman@google.com>,
	<eranian@google.com>, <tan.shaopeng@fujitsu.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<x86@kernel.org>
References: <20260810184806.1089507-1-swapnil.sapkal@amd.com>
 <3bd1195d-35fb-44b4-bc96-4ec32c70e3d1@amd.com>
 <5193ca97-0ad4-4a3a-ac01-5b5efcbc249d@intel.com>
Content-Language: en-GB
From: Swapnil Sapkal <swapnil.sapkal@amd.com>
In-Reply-To: <5193ca97-0ad4-4a3a-ac01-5b5efcbc249d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF000392D7:EE_|DS0PR12MB9422:EE_
X-MS-Office365-Filtering-Correlation-Id: 39873698-0d48-4def-1fa3-08df3042418b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|1800799024|7416014|22082099003|18002099003|13003099007|11063799006|4143699003|261009223027099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	DfTgPww3zPwQUFYxaJj5yuuSKGnjeDossbYLHXSUicSSriGkCbVj+HOIkHYnAVSeGEbxIvKMrkwstLNnUUMrkgWXS3z+4JTk2//PrjXu+xzioqwNr2pzwIdtdRvnggDkHLLbShiZIDoddJzBoIYk8xEGXeQeQuvGrbnhjU6ZuFNu0p68NzILEj6V3hPS8vPyt3SDpsRniUb7g3Q+VzAxe+UMVCcj5Z99qeaUSJ6xU8xG+1P1LTdHCB5daMrgvjTaNRQBc4YURYrzMjiSRG2tG8kT7TXhB9d4q/lXhvE8Kxh+jwoQhTwPKQD/1fpePOwCw8lyZ62w/hfRfDfQFweBkTaBgwVf7tFC7pJW+s7b4ES182EZb3nVjSpktfpXmNZCforIkszHq8+ypDoEpcmLWIygHFAER+XjqTBMF86efmLAhdRH7+1q4vdM7zixJd9Gye+mtoygMUt28oYyjw5TygLC1Lax5OPSYjARKhRd4ubYMu7d0/k7p5lWDQWiAvmyLj/07jkA/xaQf+1Dil/UC2gy4hc3z3lOcX0R0VX8cqkl8+Kkio7d5qpC9SMjSb3cQTcAfu5D0vEZFzUpoGSXyDyKGEM4JRXTXS4HG/q1e5o8tw0ifjeMXNdl1Rm3kY4PYmBBH1e/XU+rpHHTz9uWXNI5T5yFn2CInpucD6zyy5w=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(7416014)(22082099003)(18002099003)(13003099007)(11063799006)(4143699003)(261009223027099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	crdTUI6V+ZE8ba80fiRKIFAbAtQ4tRMX4bx/SfprQpHOGYa+iMnCwWcsGWv7L9N7/KOg0L5otn9/Y/MmgcAQl6ml7/2Egx3SdRCzCU+HTbYHMDe7eA+TpcTkl3O93dnvDkPtN9IU6yVp2QKRNIO3Ji/xpx6dG/v6WWllR+1/myO95sFHR6aMjAiJj5CyKClDAtfudJznZ5bjqRxny4O4JejzcP21DXkZr4b04OiVpew5hRYBA3aD+v/pxB42cFra4rcPePne+Tvq499aKSJWTl3Ln1HdG/rV26wdH+orthqLwcUeBYRdWXJ6wRABJIJoWLTE18Gcab1OZ0I4BlmXqoA94cwfaIfbkGRONb+4SI9e0Px+gNEp/xLlABawoKO6ySpkoXWPYEoMPpUDopahIcYjo9LCIL74PdnnisYIZsjdKqs1fuC4r7j3G9jp+Tp/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 13:42:03.4848
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39873698-0d48-4def-1fa3-08df3042418b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF000392D7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9422

Hi Reinette,

Thank you for the response.

On 30-09-2026 00:10, Reinette Chatre wrote:
> Hi Swapnil,
> 
> On 9/28/26 9:23 AM, Swapnil Sapkal wrote:
>> Gentle Ping
> It is in my review queue. Unfortunately during this same time resctrl received
> many contributions (including a couple from AMD) on the kernel side and I prioritized
> that at the expense of this work. Others are always welcome to take a look.
> 

Ack.

> To help with the review, could you please take the queued resctrl selftest
> changes into account by rebasing this series on top of the "next" branch of
> git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git
> 

I have rebased and sent v5 patches on top of kselftest/next.
V5: 
https://lore.kernel.org/all/20261022132517.46805-1-swapnil.sapkal@amd.com/

> Thank you
> 
> Reinette
--
Thanks and Regards,
Swapnil
