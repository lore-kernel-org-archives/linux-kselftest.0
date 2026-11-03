Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793686777;
	b=LoJ8DS6vaph3dyQ1B47MnSapMjn0aiTpHK920eWZBCL366C2AKUiKLzvaCvG2KZ+Hr6z
	 WLKULWcpg5OjPhOlf5j+OPTA+Ul+NbsH+9uttNIrlX0+LCwOp/GnOeRLtzb6f/U4ZhRV+
	 VZ7pTMrq4PfpYeKgzIveot6CSSuvXhHo8LCITq02VvRIgEfpOAyqKFhtCL4yxFa+zDC2W
	 mkdD8LpcR3OQE+gymL+fVS0Nkj7XPJWFkRK7iuyL50C3ZJTbCO9hcyY2VzGKjFlz7I5v0
	 6YM74yTW9Ti4azlpvhQoxbx2huiBZQTmZJNkbXUor2yi6anZINVlUEtjwV8Qv6mxp0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793686777;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:
	 CC:References:Content-Language:From:In-Reply-To:Content-Type:
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
	bh=rPx+Tpb43dZnRJno+bO3Ak1qIrJHv8a+e6L6DnzGy4Q=;
	b=oFl0n40DzztrB6yOXfrM0t4QVkz/jxNGuQ5YLX5ynbdZ1K2Kzx45tgFAF850jhet9rkE
	 nyPa8CrAbGl8HZUJe3NZCycMJBe9hWe5Df4UbYMuvjmvfUP3QWZ9puwXRsdIBTmBnw4q0
	 K2tWJnIJoQvZ3P2zWu3TqS4ad+7zeH17xBLtVxOSHyg4nBDQiOjO9k+VS2c9OBsxqVryE
	 zOk3jd4EQcKMuxw3UMEW/PXJC21t/8Go/9UvrS7/VZPWvD26HSoun+xM++MofjBmVku1I
	 S8Zmcnjez9qaDoi28kXbIPjCxT/6syvj5HhVGpRaqqaZOLJsBTcaQMnpVSJHHwNTCSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=etT5fOH7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.53
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013053.outbound.protection.outlook.com [40.93.196.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AF0606A329;
	Tue,  3 Nov 2026 06:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74AF0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=etT5fOH7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YFMija7yabaJ6DFh7jKnI3DYeIbjQ81A9LJNanf27wTiv9FJAU9wNOMzSkUlNyWZjnrjuU0edO/YprK/hrJ5LeOs1DGW3+KTQvxr6JB96QSM3prZtxTydylBp8SbFJa0tOIZRZNXe0FkLj6j9yP65Fy9HXlxttSWbL0sZYTZFRgn20TOPYSBs+fBqfM3FwPpBsRuVfuGMLFFis67RvZGQECAd1IWbygGDzXVpax3SYRCD5Tmfk9JIFOZYkm7/2fhJGLrNrJBn0Ab1TShovW94madjlrmYGHvKBdJD11FVqwqXSXnyr0YmW/C6K7P8qIa9ZKDBsEO3igho3fBvgD4jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPx+Tpb43dZnRJno+bO3Ak1qIrJHv8a+e6L6DnzGy4Q=;
 b=YTgP+Ty4sAszkn1UnnM1zoWc82tTA8EenS2qpVFJdWTNm2QfEa9Q1l981bcueoQ+8mMGTkQ6kpQ/jWSk5U1lvosiREKVlhVA/8WvT5aa4jI81o6ayAMciOftiUHN9ogmtng+XhAYp4NIW8mlB7lpqpXaKrCqhKYxKypc90jcY0c9uBqQoCWnDWV/brRDlUxvROBWJSKg+0OXqE0rEv1XeRqvviP19J4DoEg7Y0Dy5dEcxvinnvcMPRjW20F1bGtkmyEWjb1YsOV1ZRApZswovdiKCVUIeo8M6vYUD+4wy//RrPhySslOH5e9UA/MXHVKDlKMeaoznk/jqe88WIYiMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPx+Tpb43dZnRJno+bO3Ak1qIrJHv8a+e6L6DnzGy4Q=;
 b=etT5fOH7fiPFgiCaaG1j3R/4X4E89hJPHPpB1XD5oqN14ZT4MzF5QEfFZzGnuJqb5bR3zYnq6S7yJ70yyxtB+T6Hswuu1//MwMoPrYZrt/6RJ+EIcMfFvg+LX5uHQt2DcYsUWKVFSBWbtpHivbVu5TvMYXXMwXkjwiSIL5BjlgA=
Received: from BL1PR13CA0305.namprd13.prod.outlook.com (2603:10b6:208:2c1::10)
 by DM4PR12MB6063.namprd12.prod.outlook.com (2603:10b6:8:b1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 06:19:32 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:208:2c1:cafe::2b) by BL1PR13CA0305.outlook.office365.com
 (2603:10b6:208:2c1::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Tue, 3
 Nov 2026 06:19:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Tue, 3 Nov 2026 06:19:31 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 3 Nov
 2026 00:19:29 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 3 Nov
 2026 00:19:29 -0600
Received: from [10.136.40.220] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 3 Nov 2026 00:19:25 -0600
Message-ID: <52dae356-facd-440b-9b37-86365fcbd88d@amd.com>
Date: Tue, 3 Nov 2026 11:49:19 +0530
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
Subject: Re: [PATCH v5 2/5] selftests/resctrl: Detect vendor to select memory
 controller sysfs name
To: Reinette Chatre <reinette.chatre@intel.com>, <tony.luck@intel.com>,
	<babu.moger@amd.com>, <shuah@kernel.org>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <peternewman@google.com>,
	<eranian@google.com>, <tan.shaopeng@fujitsu.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<x86@kernel.org>
References: <20261022132517.46805-1-swapnil.sapkal@amd.com>
 <20261022132517.46805-3-swapnil.sapkal@amd.com>
 <a0dd7ad2-06da-404f-9d4b-dc50e4b9a9df@intel.com>
Content-Language: en-GB
From: Swapnil Sapkal <swapnil.sapkal@amd.com>
In-Reply-To: <a0dd7ad2-06da-404f-9d4b-dc50e4b9a9df@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|DM4PR12MB6063:EE_
X-MS-Office365-Filtering-Correlation-Id: 03fbb3ed-58ec-4c90-a9c5-08df39726c67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|1800799024|376014|23010399003|36860700016|6133799003|22082099003|18002099003|56012099006|261102123227099003|10067099003|261009223027099003|261021121427099003|261022075727099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	lYoLy0XjZ/qkq2drzao2s4b1aioNDJCkCE6HvyoL1xCNl28TIjV0mPzDqs/Ewl5vXVzLAQ/wOHE6BsFOWzuiGFmT6iaIdp49P+ouWvjdAXya31v/swJbuFxZeloWEFSfo4l/LDHr2rO/CPo/gFzn4nxAhG8sRbA58Ivt0Tzp8f5/xaddpqV0eq4Hn0oJroFHNVqeXmDf6IeH8FuNmoQSdgm58Rv3Zk7Y+LM7JEYpuGj7PPmvJd0A0sNz84pv+Gll4b9pdLn41PiVC/wS0r5b012JQhGOzaw6VLWUQwifuAiuRJO/NeuNzepjPL5JVM8p1aowwmxKy6q6q8mF5lU5gTQuByOVCsBW5T3N4roIbbNVGW7HGF3V8hppzUtLNstqEoLA/238q7uuyGMxMRYiNxHFO7NRCvJIBv3AZnk6cUUPqUDq+HoqzuCMFWva5hRJAa1O5UDJLvpujPoIuxR2Tnmw6zDUPsvsHMKgIhfERD2ThVnQpD79zP6sZxuHZw/z0SioIRuWpi+Q16lWRonFv58K10rtOFGV5EzWj+kVWWnM/Vn4I66qoSxx43Sy8jt67ZSsc8OTtZnqZTw+T0Dus1Lp8uEs7lWBZfaAzrRJO+Em1AmYTBVAUjMFXZs2FUCZPEay9exdq2ekJl9OQhzEZwuqBRxsbKaN7kNe4Wi7MZmSYMjMCyAaSF2+RibpigdQL/4MLE7+nUfzAbqQ++vcog==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(6133799003)(22082099003)(18002099003)(56012099006)(261102123227099003)(10067099003)(261009223027099003)(261021121427099003)(261022075727099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dk3ryQyMdKNaE9I0DvN0bex0A7Fw3Vzkmm1rmNqwpJY+IQ7EHyqDxwjCTT5KRYqiOcCKXvtM+q0W7RLhfISA4CZy/UU+oBVQeE52ntl0E+lBy8fKw1rP+I8E2gl5uj4OoWKrvbGrIIW/o9ec0OsGyzaz3Bvov+N+NsGraCWHZ2xAaK+3kIgELvS2v55KYTxnxVQtE27+58pjH3qo8bwJuHlrQx3xvnjscwMcprSI3QoqqPkOSXUejfyn+4P3Dzpf4QWhnbJHq9L+KKDdWC2TaxIe9nzsiVZshqRmwBAxeWpDZQyi1ksq7JR6svSyzFPNiN1uACeKgyqRldTntYlo+zfGJ6YTkbdsCa5BDNrKZ1BP3pPcWAsvbqBirubJ5jhn7Tcn1p4VwInV36PkEgw/vmRyQ8/Sxh6+tcHsN3M1d+1yxqPxaaKmFdZL/TwCcdAE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 06:19:31.7249
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03fbb3ed-58ec-4c90-a9c5-08df39726c67
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6063

Hi Reinette

On 29-10-2026 00:09, Reinette Chatre wrote:
> Hi Swapnil,
> 
> On 10/22/26 6:25 AM, Swapnil Sapkal wrote:
> 
>> diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
>> index c9cac957726b..fdbbe2155cea 100644
>> --- a/tools/testing/selftests/resctrl/resctrl_val.c
>> +++ b/tools/testing/selftests/resctrl/resctrl_val.c
>> @@ -10,7 +10,7 @@
>>    */
>>   #include "resctrl.h"
>>   
>> -#define UNCORE_IMC		"uncore_imc"
>> +#define UNCORE_IMC		"uncore_imc_"
> 
> When considering the next patch introduces "AMD_UMC", could
> "UNCORE_IMC" be renamed to "INTEL_IMC" to better support how
> this series ends up managing the architectural differences?
> 

Sure, I will rename "UNCORE_IMC" to "INTEL_IMC".

>>   #define READ_FILE_NAME		"cas_count_read"
>>   #define DYN_PMU_PATH		"/sys/bus/event_source/devices"
>>   #define SCALE			0.00006103515625
> Reinette
--
Thanks and regards,
Swapnil
