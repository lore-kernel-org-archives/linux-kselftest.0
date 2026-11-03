Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793687693;
	b=5IJaeJnJbwvfzvY1MKP/G9KkLgiTKz9ghN0w6TWjE0b3lLOOdXjTVcNpY3r6yPNXzZGm
	 SZ5/ADUI1S6C8o0CGbk4OynMGXPUMXPmBfAAOSyc5Py9MbeFl0Kw30P6WTh2/wvaZOLzq
	 e3DC+f0OOQ8S3VpgUShozwFBZUukTLJ0eJ+Pr8c7E1eZvBQBGb2vJrHdeK7boiNLeki4U
	 rXD/8K81I7WGoBuX01YuWHd95hEpYyv0Xxl9JdcG5rjyKPgtjkWLLe4DnKqvG3aRZZYV9
	 1nd7GV9yeA6kwCqcAH8XA8btTIH8P/L/hXqyAhh1euJTeM1irBAc023LXznEWWwFh5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793687693;
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
	bh=zuy7iE4mqn2QMmnQJ0ptREtP6KQtxo9H0vF5QikUpuU=;
	b=d0d26dl1bJ+MY58usmxaDjx8qRoia2oJ9y8IrINQ/S3BvVhzHVUrlU9In8NbtIUX19Hx
	 De56N1Z8rzr/6z9XPWRcErXm/cK/ic5uVpeKUmD8OFAsvzFRQEfITLd5WscdI2l/cYuQh
	 8FKeSLzYDiRTjAwVTI4PDrfzbbyxV42UPH8F/W4hjTNentYgrrY5A1MfepiW/PWLL9mJD
	 ZPDevDA30xgVGMOPn59AkRQY9Tx3tRejqBrmUfoSX9/MgpVXT6bx7Nck3QkQDs56YlSt3
	 3OvtmTKVvNMSbxY3ebLjS2up82Nxqe/8ETbxP0Rkk8ERU3LDwkmymI3JRWDfNAXe7JA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=cXXAYNow;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.35
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011035.outbound.protection.outlook.com [40.93.194.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E93A606A324;
	Tue,  3 Nov 2026 06:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E93A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=cXXAYNow
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p0o4x8jFDKszzGn5SbMzgyuqNRTqeYroj0gXdgPDL1lP+1HqtNxP3Pt2GfRlRfNB4cJ4jO7UQns2T5I2FCiwtJ1yFBHN3CWlXSqN6RtUMMacofK3PREMYUB7nx1msHqzz0dhPX4L3z/SyKNTsJYhYCYo+cEkN6QF21BeeWzD3jTUUwWSgLYqDrXbwDVL8A885tN2fXHNPe0WVsZh2wofi9sQliG/bKkfvNBLrZr/JevTEIGAMpK7XIiuIVr8IB3p1t2UIu14louyknilfi3EiiWuMvlq9uIid+LDiZ67Zjo7EkmSoTgSxGjiBn4rqcLUD+gcpr+d7n+++l2xR7rv/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zuy7iE4mqn2QMmnQJ0ptREtP6KQtxo9H0vF5QikUpuU=;
 b=wNkTN4QWspPHclsQDw3oPa0UrW/h5bMEzyaOIDjfowMGJGZEcTYVTN0iYVj1N9mNuMLTbkpbXhGEmVjpICUJna10Y1yX7sdtv8I7/MTAWhbh/WdNNFqd+eJcCDnExUnNYQeSYPbKzh1bnUDeFTXmS96qYDotCGOIQVQFSV82x0ScrQOcUwFiCsh9wiFD4zju9fejEIk2Kq/Nbj0diRN7+4+EsQhF6JzHlC5VwVLmIuOet0cVXRp+1TNx0SYMed2gMIchjXCmJiJnzmz/bdtc0M+Ftgj8h9bGhcm5uNr93OFaWh47AD/QT6WLj6nN/ArX3Az2n2nitVE/sDt4J1Vo6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zuy7iE4mqn2QMmnQJ0ptREtP6KQtxo9H0vF5QikUpuU=;
 b=cXXAYNowsusSgeCper1uKYD5suJ2HiSt6AsusEnyRy9axb+8sHaDT1YgJed4nicvptj7M+DT6UqAYSG85YnzS6MSG19OEDZ73peVB9+hVIhTr3i+Ejr874KU3ClbiYA8fZy/0q8+7hStr6APAAfozD6GoZ1o5rHWfd8KeliBz0g=
Received: from BLAP220CA0019.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::24)
 by MN0PR12MB6032.namprd12.prod.outlook.com (2603:10b6:208:3cc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 06:34:47 +0000
Received: from BN3PEPF0000B36E.namprd21.prod.outlook.com
 (2603:10b6:208:32c:cafe::3) by BLAP220CA0019.outlook.office365.com
 (2603:10b6:208:32c::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.11 via Frontend Transport; Tue, 3
 Nov 2026 06:34:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B36E.mail.protection.outlook.com (10.167.243.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.0 via Frontend Transport; Tue, 3 Nov 2026 06:34:47 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 3 Nov
 2026 00:34:46 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 3 Nov
 2026 00:34:46 -0600
Received: from [10.136.40.220] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 3 Nov 2026 00:34:43 -0600
Message-ID: <01f62170-f626-4252-81ad-d225442f1969@amd.com>
Date: Tue, 3 Nov 2026 12:04:42 +0530
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
Subject: Re: [PATCH v5 3/5] selftests/resctrl: Add support for MBM and MBA
 tests on AMD
To: Reinette Chatre <reinette.chatre@intel.com>, <tony.luck@intel.com>,
	<babu.moger@amd.com>, <shuah@kernel.org>
CC: <Dave.Martin@arm.com>, <james.morse@arm.com>, <peternewman@google.com>,
	<eranian@google.com>, <tan.shaopeng@fujitsu.com>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<x86@kernel.org>
References: <20261022132517.46805-1-swapnil.sapkal@amd.com>
 <20261022132517.46805-4-swapnil.sapkal@amd.com>
 <c57f0d76-8fa7-443c-8ba4-2a18eb0ba7fc@intel.com>
Content-Language: en-GB
From: Swapnil Sapkal <swapnil.sapkal@amd.com>
In-Reply-To: <c57f0d76-8fa7-443c-8ba4-2a18eb0ba7fc@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36E:EE_|MN0PR12MB6032:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d6f2227-4a5c-4352-b9b6-08df39748e34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|376014|23010399003|1800799024|6133799003|10067099003|18002099003|261102123227099003|22082099003|3023799007|56012099006|4143699003|261026121527099003|11063799006|261022075727099003|261022105027099003|261021121427099003|261009223027099003|261028144727099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	ZfOlvml9QCPQWM6t4EhD3p8BsaXjOWcPC7rYP5x4ri/O2cp7Ry7TrhZPuGjYizxy5aqgLjdht9j6/slEQjqNyQ+3VvX1BbITExL869Sjt03iV/F/QoV9CGRN4nmYSD5aBBtm8lS/WAWlUSq4mG2D5GZC0uYTVgSqxRZU7OssPBUuxtLfPyJCZeAg1Z9RZEfWuQonYg8nA1aivGYqd8vy7nMz9UtT6Xcxhmi3K+hgQNx4FYsFLzRNigKSwDQfKouuwrOAOBsmuAY6QHAhywW8mXULBS1KclQBc3c9UKO0MgSHQnqq0m28vDnNx7XblehScjdIfKUtsSwWISuMU2eztxX9MD0/iY8YEiamUFzV250d3edzfZ7/MC2FmE6rACSNZUQ/n0/dJXVOunDv/f8oVWt4jvTIzdZ1lAtVKK4+4iMh+Rat/FJx63ku3HHV8JSA1eqVRH2vzurlOVnOEohAr3kPguTzzEq/gvazk0U7DgogqLPY5Dy126VkO0VS2caOhr1kn/2Png/Daig5VVTLmARmx29eeO/JJJHX0iCOdquQrme9FXXiznxaGXxDkSItbYuf7SwY7mCSmVQFAFFaTouUoxr/cWuHuXSYK3/deHqu37eHAJ0AGJO/v53ryY0UCngx8YJH7o35KnIbWcFm5E+g6Lbl2UmY0Tzh1cYu6ShfRB2FbW4e+qRMdle0dhe9/KhisBUkS5zi50wxoViAcA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(376014)(23010399003)(1800799024)(6133799003)(10067099003)(18002099003)(261102123227099003)(22082099003)(3023799007)(56012099006)(4143699003)(261026121527099003)(11063799006)(261022075727099003)(261022105027099003)(261021121427099003)(261009223027099003)(261028144727099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sfu7YG4JAvpdPR9iuakchx5vrp1xU4DQTQlEL7UWDIEAxzufkYx8oEALzwt8dJbZ+2ArI+7D+RZ1E8o/A+R1/E1+Alr1XRzXVoeNQDAZTevKaMP8sseGF+e1A2Jd42BziY5+qUozoR0N/iTnfJ+SvzgF4dW49HPtt8+zMYOWRu9K0z6ev6qIBTw/ZmIwT4HT1OU6+EXzLH8GIUfPdMDoLAmKAX+o1P/ZtsyjyaN2suMRls2gAPA6DVjJ9ItWmLK70kPvJ6bK1oztoOsD4wAIlO3+73LnQeoqPQxlpv/AXqLGxf9OVpt46Vzy27PCcY6DhEkW5S+KFZaJOq1mNBvyYFPnF+Xqdi+0xU6Y9VyXRgDB89yUCgzGz6+pfd7Gzgi9W3uDJTfpqtdJE12RfYOq8MZ43suCKqCHwVZnOudAAYa4GR7rUZcWHrbQK9kyJSIj
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 06:34:47.4268
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d6f2227-4a5c-4352-b9b6-08df39748e34
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6032

Hi Reinette,

On 29-10-2026 00:11, Reinette Chatre wrote:
> Hi Swapnil,
> 
> 
>> diff --git a/tools/testing/selftests/resctrl/resctrl_val.c b/tools/testing/selftests/resctrl/resctrl_val.c
>> index fdbbe2155cea..38cf58c41be1 100644
>> --- a/tools/testing/selftests/resctrl/resctrl_val.c
>> +++ b/tools/testing/selftests/resctrl/resctrl_val.c
> 
> 
>> @@ -233,6 +277,7 @@ static int read_from_mc_dir(char *mc_dir)
>>    */
>>   static int enumerate_mcs(void)
>>   {
>> +	int (*read_mc_dir)(char *mc_dir);
> 
> Could this be named read_from_mc_dir to avoid the unnecessary churn?
> 

Sure, will update.

>>   	char mc_dir[512], *temp;
>>   	struct dirent *ep;
>>   	char *sysfs_name;
>> @@ -241,6 +286,10 @@ static int enumerate_mcs(void)
>>   
>>   	if (get_vendor() == ARCH_INTEL) {
>>   		sysfs_name = UNCORE_IMC;
>> +		read_mc_dir = read_from_intel_mc_dir;
>> +	} else if (get_vendor() == ARCH_AMD) {
>> +		sysfs_name = AMD_UMC;
>> +		read_mc_dir = read_from_amd_mc_dir;
>>   	} else {
>>   		ksft_print_msg("Unsupported vendor\n");
>>   		return -1;
> 
> ...
> 
>    		}
>> @@ -335,15 +387,40 @@ static void perf_close_mc_read_mem_bw(void)
>>   static int perf_open_mc_read_mem_bw(int cpu_no)
>>   {
>>   	struct mc_counter_config *mc_counter;
>> -	int ret;
>> +	int ret, opened = 0;
>>   
>>   	list_for_each_entry(mc_counter, &mc_counters_list, entry)
>>   		mc_counter->fd = -1;
>>   
>>   	list_for_each_entry(mc_counter, &mc_counters_list, entry) {
>>   		ret = open_perf_read_event(cpu_no, mc_counter);
>> -		if (ret)
>> -			goto close_fds;
>> +		if (!ret) {
>> +			opened++;
>> +			continue;
>> +		}
>> +
>> +		/*
>> +		 * On AMD each memory controller (UMC) has its own PMU that is
>> +		 * tied to a specific NUMA node, unlike Intel where opening an
>> +		 * iMC event on the benchmark CPU always resolves to the local
>> +		 * memory controllers. A UMC PMU can only be opened from a CPU
>> +		 * that belongs to the same node and returns -ENODEV otherwise.
>> +		 * The benchmark runs on a single CPU, so skip the UMCs that
>> +		 * belong to remote nodes and measure only the memory
>> +		 * controllers local to the benchmark. This matches what
>> +		 * mbm_local_bytes accounts for on the resctrl side.
>> +		 */
>> +		if (ret == -ENODEV && get_vendor() == ARCH_AMD)
>> +			continue;
>> +
>> +		ksft_print_msg("Error opening memory bandwidth performance counter: %s\n",
>> +			       strerror(-ret));
>> +		goto close_fds;
>> +	}
>> +
>> +	if (!opened) {
>> +		ksft_print_msg("Could not open any memory controller counters\n");
>> +		goto close_fds;
>>   	}
> 
> As the comment above highlights, the test runs on a single CPU. It is thus not
> possible for the test to change which MC it needs to obtain data from.
> perf_open_mc_read_mem_bw() is called several times during the test run and
> repeated attempts at accessing MC that are known to fail is unnecessary.
> Considering that -ENODEV can be relied on to indicate that the MC is not
> valid for the test run, could it instead be used to drop that MC from
> mc_counters_list? This will avoid the subsequent unnecessary attempts at
> accessing these MC and also simplify the users that walk mc_counters_list
> during the test run since they can continue to rely on all MC being valid
> without needing to keep checking if the fd is valid.
> 

This is good approach which reduces the number of times we are iterating 
full mc_counters_list. Thanks for the suggestion.

> I suggest switching the list_for_each_entry() to list_for_each_entry_safe()
> and drop the MC's from the list on ENODEV. This also eliminates the need for the
> "opened" tracking that can be replaced with a list_empty(&mc_counters_list).
> 

I will update accordingly.

>>   
>>   	return 0;
>> @@ -363,14 +440,20 @@ static void do_mc_read_mem_bw_test(void)
>>   {
>>   	struct mc_counter_config *mc_counter;
>>   
>> -	list_for_each_entry(mc_counter, &mc_counters_list, entry)
>> +	list_for_each_entry(mc_counter, &mc_counters_list, entry) {
>> +		if (mc_counter->fd == -1)
>> +			continue;
>>   		read_mem_bw_ioctl_perf_event_ioc_reset_enable(mc_counter);
>> +	}
>>   
>>   	sleep(1);
>>   
>>   	/* Stop counters after a second to get results. */
>> -	list_for_each_entry(mc_counter, &mc_counters_list, entry)
>> +	list_for_each_entry(mc_counter, &mc_counters_list, entry) {
>> +		if (mc_counter->fd == -1)
>> +			continue;
>>   		read_mem_bw_ioctl_perf_event_ioc_disable(mc_counter);
>> +	}
>>   }
>>   
>>   /*
>> @@ -395,6 +478,10 @@ static int get_read_mem_bw_mc(float *bw_mc)
>>   	list_for_each_entry(r, &mc_counters_list, entry) {
>>   		struct membw_read_format measurement;
>>   
>> +		/* Skip memory controllers that were not opened (remote node). */
>> +		if (r->fd == -1)
>> +			continue;
>> +
>>   		if (read(r->fd, &measurement, sizeof(measurement)) == -1) {
>>   			ksft_perror("Couldn't get read bandwidth through MC");
>>   			return -1;
> 
> With unusable MC dropped from mc_counters_list all the above fd checks are
> unnecessary.
> 

Ack.

> Reinette
--
Thanks and Regards,
Swapnil
