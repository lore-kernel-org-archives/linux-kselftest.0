Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012037.outbound.protection.outlook.com [52.101.43.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F083D994;
	Tue,  1 Sep 2026 13:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788269605; cv=fail; b=j0Tjme+dHFQfYAfpPdSteiPBd9PN0uumTJxE6bJerXf6yBZl4Z94awdwvQ07rf6XdThoLZnSJHncgbQx7H6CA5jEDX+rdAjO4HWHeZLUvxxmzWk42u5LdxGdYau3sIBT+PjKgd1QR5egs+EFQp26TSf2cQ/5N+4X40nDaKJCH2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788269605; c=relaxed/simple;
	bh=J52mwhkyFg0llwii9u64ShKsbjC+i8laPG3sNTdMIY4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cLTKKCOb0SQNdvzmOy7QUMXdLWucpR69NghfzrBFI30Qj6KlRlflBDsP81EDHhAocOlEQiqzfnVPhdWNPSGzbvVC7+yC5yDDNEUd6WuuKgUzQgO8BfC7GNvK39w7hmssQ97CredkolbWmknxu5Zc9Fan308JbDbGhX38BZGypzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZjWjO0G4; arc=fail smtp.client-ip=52.101.43.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZjWjO0G4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=czIGcq8BepH0NJlOOGgux4G6Tle4lj9wn5oh3/kIyjUTTVA2r7hTBYeD6K4W215ZSJQjK9Jv9TM0XvqL6uuM4Ue+Wo46E/WZCos3/eYKktpSIcPoH/BeR+xpeHwoUF8yHYAqR035DLOGyWuWijVFaTkRlT5y5l3eIToGh06/N+hLoD8t7SgRUAzhZF/nUL90oOrjb7nBYIBC3Ztp9DWxvbikJbOYLcvJpHOBmd6gFNhEtK8zPUAZI7SxqdKKTEQ9v6TDIgTN9u/5YPYbCP5NDD1qhq+wkdytn72vtPnfQzz9YeQ4tKP7/oM6VL3NrKUrjECs1r/+7TCjXgKJJKn44w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mcmsds9MnP/XJQz26KmZSU8apaKSKpKQ7ax6iYVmwGY=;
 b=DGC7O2DbQ3gvMKWjCmKC16p6qoskGMrCRiLpDkLrUKHUOU8NtMl3b/wMDAawhDPCGP0TMzFz+/TH5B1TghKDVbXrKcoDH1gICPfsWnOsQC2sYqJtJGfPfc8PXTofG0VqDJqZanclDw7DIPiYZotuVoGGdoq0mYpcT6tDXQpWBVv9E3Q+VepKWNNPVKDXoubXDtfUcL7C9nVrrQDkG1M7F05NResEgQQszdPEUZ/S/OI0MkF1uoGqGx6SHXe4QUb8PMhBhxNy0VmNlzn40bTnLmPHEO4+Jzwr9qZxpOA+co9ZZzzL/Vy0p6GkF++jDTot75KO81ixW99DcOVPap5JWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mcmsds9MnP/XJQz26KmZSU8apaKSKpKQ7ax6iYVmwGY=;
 b=ZjWjO0G44ZPGMFm9QXApzifS+aPuYyck3F1UvMryGZnip4g0HsEDWZ+AChKO78rTUyKS3ktuS3F319OaUJxb8QmXYFNZ+qbPS2BsT8uRuxLI8eur+UsYcg2FFpKGdTrmp+REmqp5RNwvyfPxkmcY4FaQdBmYCwWCr9BkI3WUZkM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by LV3PR12MB9188.namprd12.prod.outlook.com (2603:10b6:408:19b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Tue, 1 Sep
 2026 13:33:20 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 13:33:20 +0000
Message-ID: <40f679a2-fb5d-4d69-96dd-ab6c6718ac07@amd.com>
Date: Tue, 1 Sep 2026 15:33:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] kunit: qemu_configs: Add microblaze configuration
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
References: <20260804-kunit-microblaze-v1-0-6dcdfe12eb40@weissschuh.net>
 <20260804-kunit-microblaze-v1-4-6dcdfe12eb40@weissschuh.net>
 <5cd8df03-ad51-460c-9b20-3bf288831b5a@amd.com>
 <60d4618b-3620-4ecc-a2c6-2b382de68724@t-8ch.de>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <60d4618b-3620-4ecc-a2c6-2b382de68724@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0118.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::47) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|LV3PR12MB9188:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fcd3f07-38f2-4129-8c19-08df082d969e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|10067099003|4143699003|11063799006|56012099006|3023799007|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	jc8ej3j07oKSxQ2/CvRZ8rBs7t4e54BT8idsMnAy0bq01P4RYaMu3rSfGvXD8CE3ZfUwYEX/VmToUEc7QIQIGqj5jJ1o8XWNK307aNPFO237RBeb7wZHhT2oOhxnR07OWFw/9Hhlah2qPix/g4CrDqwUj6kthJeWzyLlxubLtMvpVmrg77oyNAeaO36TBnVjFOO/z1mAgyaL47pGHUDV0fpwPMTwaJ5E39wqkJA0eujaZeLdy6uf5/7wIvz3GF0D7+6N3+oOAJPyjfluShiqlQsf82Z0q18bJww/IxTqCNDNzQW/xDkeG250sDX9F/QXMUwkkKUQQt9q5zortMYMvVh4XlYqXMf/YtqLYj3BnvPv+6Y2cNLGR/7ruxoEnq18767PjNsU95aONkgwimtDuhdCKXRV2OAJLJNKyW4PqqSZWb5oeuFnOM2OpCK7jygbLdUeXhklYsOLR5Ujyj+FTife9mLksGjawedndG8pntmHipdUH6zpiWjNy8jVKjQU4PIbk8k1pgpuhRNX4yfDY6U2G0VvMc3esrxdwPSXtXfNvXrxqdylkDe4dzCeM74BQdr5ZCShnpVtHws0v6zCPest++CD+gN00Mn99JrooT23wZdBH2U9Hhr1HGOOvOJThWXphc4cZPabeY7imX8jp6Yt+IoFUCSqvZ0w9oMQduU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(4143699003)(11063799006)(56012099006)(3023799007)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDVkc2MwR2NqdlRhSkVrT2dZQ1VsV0FoTGI0WnJVOXkzbHVKRXhnVm1ETXEz?=
 =?utf-8?B?SnNxWnd5UXhOU2VjQ0FkR1daK3JTSXpCMERqVktITUt5akNTTDd6TXJYYUxV?=
 =?utf-8?B?VmhqZGg0UFg1d0w4TVJhWjYxaHZOalY1dnp2SGlhSFFMRmhucm50YkwvV2V2?=
 =?utf-8?B?R1pwMlZURXJqVHc3cEZDRTAwUEY3dVl0NUxwdXdCeGk1QWhpNTBWenhSa2Ew?=
 =?utf-8?B?YnNLS3VTaXMxTmd0Mm56NkJsOTlWdktRKzZncGhqT3BDcHlBWStoZXp4dDlK?=
 =?utf-8?B?WVJsRCtCbW44OHZhekRibTRINzlrN2ZTaEF0bGIrY3djcldRR2d0UUpBRXdI?=
 =?utf-8?B?Vy9rbjN2VUp3dTNPSGI2VWFwY05aS2V5dWZRcFVuK2FXdHZaMU00cUdHZkRo?=
 =?utf-8?B?aWJnZzYrSGwvNVhUYW9aSXJrTHlwelMycjNrQnhndHphcEthQ2NYSjJCUE5n?=
 =?utf-8?B?SERJZ3FoMG9kSUlRcFovVTNzUk9hdUxzTU8vcFJKT0pKL2NtakpjTnJkNW0x?=
 =?utf-8?B?VU10c1F5bXdTUDRmNUpmSnF0WjhwdUtvT2NKTHdudW84R1JPalJBMTRoSVB2?=
 =?utf-8?B?aEx3b1lVU1FDTGpOS1RiTUoyWEtuZi9KL2VVRnFxbmNsSlNSQVN2Zkt0cnpG?=
 =?utf-8?B?MG1WNklzc0FQZ1Z4UytMRG9hRTdLQXBXZ24vK0hZTmI2SWIxNE1VTkFXdWRR?=
 =?utf-8?B?ZG83NnZoeUI3VDZ5RDQvMFgyME9maDF6K2JzQXZKcWF0dS9vb2M4SkpSdTFY?=
 =?utf-8?B?alBDd0ZPWmwzdGdUZWR0ZWdGR1dEQ3IvV0ZkZkRuNC9ERzRwR2lSZVBQTWsx?=
 =?utf-8?B?MFlYM0xWMDBnTUV2NVdZS0JBT0o2SjlKVTNNSXpWNGtnZUs2TzlrK2VjOUNy?=
 =?utf-8?B?YTI2aWNJTmQ3bXJnRGh1b0RGeUhET2Y4VXBvZll2bWNVQTJ3WHhXOHIydUdT?=
 =?utf-8?B?NkVSbE5XbFFXODFBdVZrRzF2T0tmZkhKYmFJMytGc1YrMmRTeEFwUkZ6OElq?=
 =?utf-8?B?NjE5RS9OdFNqZ3grY0pHL1BSMlArQ0drM1dWY2RvQ1huYlVWQUQwek95anF6?=
 =?utf-8?B?cHN5c05LVU1yWW05VTBYQVMxTkxvZkhuMHR4K3pjL1B3bFZNUXBIbFY0bVpo?=
 =?utf-8?B?LzlBNUJid1lKUWdEZ3UzRUd6WDhRWEl5RWJDTHhUMWNMTy9Db1dMV2dhd0Q0?=
 =?utf-8?B?TGN0OHFCNkZweGhNTUZ3Wld1VG5KMWxKdWtuWXZpaVJtY3hET1NFOUE4VVpi?=
 =?utf-8?B?dHdqMXpwQ2dmcis0STZsTVhhNkh0RzNmd1JHTDNoS0U5SjZ2eXN5MXBzTUNv?=
 =?utf-8?B?bEdoa3lLUWNmaTVrT0dPWnFDVXluWXlyS24ycUJlSXR6aWZ3M3VyTFR2T1dn?=
 =?utf-8?B?VjNZVXZPL1RlNzRIaStRWjdlZkd4Rno3cUJMa0RxQzBLMEROMHl5MWxEWld6?=
 =?utf-8?B?emV6NzB5MUIvcWNkbHovcXFIUGxaZ2Z1cmlRS1dsTEsyMTYzRjRPZktUajds?=
 =?utf-8?B?SUh5YXFSL3FJMklXR3FZSU13SUdsRjEzcVMvbkVNOC94Z00yV2ZJMFpieHJl?=
 =?utf-8?B?bGhTRXY4dDhYZFJ4MnIzajM2Ymd5aTh4bnNVKytvMFpBT2VadWtMMXd1THE5?=
 =?utf-8?B?cUpnbDdPaVFIdkNIWVA5T05QTFIrcEVtL1Q4Z1p3cG52eFE2cnBYQVpPNzZT?=
 =?utf-8?B?czB1UmtJMGNRV2xmakFva2lnS290NUJzdFgzRDFQODIrVXB3TjU0aHZueHlx?=
 =?utf-8?B?b0IxUTE5U085Y1EyVnpTTGw5NVgxYXFOc1JlZ2RiVk55YXNKNEcvVlgzRGVh?=
 =?utf-8?B?WTJqN3hzcnVqUk9DcTl6YjNleWV5STdJNlJlQk1EUTV6NGdaOWhLMDJuUjdC?=
 =?utf-8?B?U1FPTVJRRG5pZzdocWIxaUhGaGNRQ09Uckx4VWFlMXF6QnJPbGFtY1FBb2Y1?=
 =?utf-8?B?Y3JYVjY5enhqNEZRQnVIaUdGanlDbmg5VDB5YmFOSDUrWTBLOGlSRllSMkpk?=
 =?utf-8?B?WHRYaWJ1b21UMlpaWXYzWG9ZZWEzQ2F4QXVoN01LdTNSMlg2ZU9KenA0a3Zi?=
 =?utf-8?B?Qld0UU9MQkpWUmVRSWxMT3p2T1I4Y05LTGhCMTV0WkJCZzA0elhsTnJLQ2I1?=
 =?utf-8?B?cE41MkVGRUU0OEU2MHRpRWs3V3duWlBGOVJ4eGc0eUIxcC9Oa3hJRFNERWI2?=
 =?utf-8?B?UUF5alRXU2pxbC9pWUtaSkxueFRsSnlrdFZiWU1odE8xZkNna2x3NEhRNkky?=
 =?utf-8?B?ME5sUnRERTRSUHdQM1Y0d2tmQ1BzL2xXRlM1ZFlZUll2YUtDa2REd29tU05h?=
 =?utf-8?B?UUw3andqSTNrUzRndjZwWGJ2OHh1MHQ0VlN1clplYWdSZExIWDM3QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fcd3f07-38f2-4129-8c19-08df082d969e
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 13:33:20.4174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ALKny+7NMBuCcrWcYQFQwkFpn6UAOr8Or1P1c1MQAMJox5gHMhzy28erXYjDaarP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9188



On 8/31/26 17:43, Thomas Weißschuh wrote:
> On 2026-08-31 12:48:08+0200, Michal Simek wrote:
>> On 8/4/26 07:32, Thomas Weißschuh wrote:
>>> Add a basic configuration to run kunit tests on microblaze.
>>>
>>> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
>>> ---
>>>    tools/testing/kunit/qemu_configs/microblaze.py | 17 +++++++++++++++++
>>>    1 file changed, 17 insertions(+)
>>>
>>> diff --git a/tools/testing/kunit/qemu_configs/microblaze.py b/tools/testing/kunit/qemu_configs/microblaze.py
>>> new file mode 100644
>>> index 000000000000..ff012095e77d
>>> --- /dev/null
>>> +++ b/tools/testing/kunit/qemu_configs/microblaze.py
>>> @@ -0,0 +1,17 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only
>>> +from ..qemu_config import QemuArchParams
>>> +
>>> +QEMU_ARCH = QemuArchParams(linux_arch='microblaze',
>>> +						   kconfig='''
>>> +CONFIG_CPU_BIG_ENDIAN=y
>>
>> Big endian is quite old and I am even surprised that it is working.
> 
> Oh ok. This was the only configuration that I got working.
> 
>>> +CONFIG_SERIAL_UARTLITE=y
>>> +CONFIG_SERIAL_UARTLITE_CONSOLE=y
>>
>> I think it is just pure luck that this worked for you because you didn't
>> rewrite the most important parts of config.
>>
>> You should define at least these values
>>
>> CONFIG_KERNEL_BASE_ADDR=0x90000000
>> CONFIG_XILINX_MICROBLAZE0_USE_MSR_INSTR=1
>> CONFIG_XILINX_MICROBLAZE0_USE_PCMP_INSTR=1
>> CONFIG_XILINX_MICROBLAZE0_USE_BARREL=1
>> CONFIG_XILINX_MICROBLAZE0_USE_DIV=0
>> CONFIG_XILINX_MICROBLAZE0_USE_HW_MUL=1
>> CONFIG_XILINX_MICROBLAZE0_USE_FPU=0
>>
>> to be aligned with s3adsp1800
> 
> Will do.
> 
>> It will solve these two issues too.
>> ERROR: Microblaze BARREL, MSR, PCMP or DIV-different for kernel and DTS
>> ERROR: Microblaze HW_MUL-different for kernel and DTS
>>
>>> +CONFIG_MB_POWER_OFF_THROUGH_UNALIGNED_PC=y
>>> +''',
>>> +						   qemu_arch='microblaze',
>>> +						   kernel_path='arch/microblaze/boot/linux.bin',
>>> +						   kernel_command_line='kunit_shutdown=poweroff',
>>> +						   extra_qemu_params=[
>>> +							'-M', 'petalogix-s3adsp1800',
>>> +						   ],
>>> +)
>>>
>>
>> That's bring us to different topic. When qemu runs I see these 2 issues
>>
>> qemu-system-microblaze: -accel kvm: invalid accelerator kvm
>> qemu-system-microblaze: -accel hvf: invalid accelerator hvf
> 
> That is an artifact on how KUnit starts qemu. It should not matter.
> 
>> I don't have any issue if you want to wire big-endian version but would be
>> more useful to wire little endian version.
> 
> Understood. Let's try to have both.
> 
>> If there is an issue with memmove implementation I can't see any issue to
>> disable that options to let it pass from the beginning and solve it
>> separately.
> 
> Ack. Could you take care of this? I have next to no idea about microblaze.

On little endian this is passing. I can add it to my todo list but big endian is 
very very old and likely none is using it anymore.


> 
>> This should be fragment for Little endian.
> 
> Thanks, unfortunately this hangs for me with my distros QEMU 11.1.0.
> No output, 100% CPU usage during boot. I am using qemu-system-microblaze
> instead of qemu-system-microblazel, as the latter is not available
> anymore, but the former is documented to also handle little endian
> automatically.
> 

I built the latest qemu like this

../qemu/configure 
--target-list=microblaze-softmmu,microblaze-linux-user,microblazeel-linux-user 
--enable-gcrypt --disable-docs

/mnt/projects/xilinx-new-git/qemu.org/build-microblaze/qemu-system-microblaze 
--version
QEMU emulator version 11.1.50 (v11.1.0-779-gd2e570cc0f97)

And can't see any issue.

Thanks,
Michal


/mnt/projects/xilinx-new-git/qemu.org/build-microblaze/qemu-system-microblaze 
-nodefaults -m 1024 -kernel .kunit/arch/microblaze/boot/linux.bin -append 
'kunit.enable=1 kunit_shutdown=poweroff' -no-reboot -nographic -accel kvm -accel 
hvf -accel tcg -serial stdio -M petalogix-ml605
qemu-system-microblaze: -accel kvm: invalid accelerator kvm
qemu-system-microblaze: -accel hvf: invalid accelerator hvf
qemu-system-microblaze: falling back to tcg
qemu-system-microblaze: warning: nic xlnx.axi-ethernet.0 has no peer
random: crng init done
Ramdisk addr 0x00000000,
FDT at 0x5058e528
Linux version 7.3.0-rc1-00023-g5a713478d535 (monstr@monstr-desktop3) 
(microblazeel-amd-linux-gcc.real (GCC) 13.4.0, GNU ld (GNU Binutils) 
2.42.0.20240723) #11 Tue Sep  1 15:18:11 CEST 2026
setup_memory: min_low_pfn: 0x50000
setup_memory: max_low_pfn: 0x60000
setup_memory: max_pfn: 0x60000
OF: reserved mem: Reserved memory: No reserved-memory node in the DT
setup_cpuinfo: initialising
setup_cpuinfo: No PVR support. Using static CPU info from FDT
wb_msr
WB won't work properly
Zone ranges:
   DMA      [mem 0x0000000050000000-0x000000005fffffff]
   Normal   empty
Movable zone start for each node
Early memory node ranges
   node   0: [mem 0x0000000050000000-0x000000005fffffff]
Initmem setup node 0 [mem 0x0000000050000000-0x000000005fffffff]
pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
pcpu-alloc: [0] 0
Kernel command line: kunit.enable=1 kunit_shutdown=poweroff
printk: log buffer data + meta data: 131072 + 409600 = 540672 bytes
Dentry cache hash table entries: 32768 (order: 5, 131072 bytes, linear)
Inode-cache hash table entries: 16384 (order: 4, 65536 bytes, linear)
Built 1 zonelists, mobility grouping on.  Total pages: 65536
mem auto-init: stack:all(zero), heap alloc:off, heap free:off
SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
irq-xilinx: /axi/interrupt-controller@81800000: num_irq=6, edge=0x4
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 
7645041785100000 ns
ERROR: CPU CCF input clock not found
/axi/system-timer@83c00000: irq=2
ERROR: timer CCF input clock not found
clocksource: xilinx_clocksource: mask: 0xffffffff max_cycles: 0xffffffff, 
max_idle_ns: 19112604467 ns
xilinx_timer_shutdown
xilinx_timer_set_periodic
sched_clock: 32 bits at 100MHz, resolution 10ns, wraps every 21474836475ns
Console: colour dummy device 80x25
printk: legacy console [tty0] enabled
Calibrating delay loop... 1945.60 BogoMIPS (lpj=3891200)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
VFS: Finished mounting rootfs on nullfs
Memory: 253204K/262144K available (4023K kernel code, 596K rwdata, 832K rodata, 
161K init, 192K bss, 8436K reserved, 0K cma-reserved)
posixtimers hash table entries: 512 (order: 0, 2048 bytes, linear)
futex hash table entries: 256 (3072 bytes on 1 NUMA nodes, total 3 KiB, linear).
DMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
clocksource: Switched to clocksource xilinx_clocksource
workingset: timestamp_bits=30 (anon: 25) max_order=16 bucket_order=0 (anon: 0)
io scheduler mq-deadline registered
io scheduler kyber registered
Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
83e00000.serial: ttyS0 MMIO:0x83e01000 (irq = 5, base_baud = 6250000) is a 16550A
printk: console [ttyS0] enabled
clk: Disabling unused clocks
KTAP version 1
1..118
     KTAP version 1
     # Subtest: example_init
     # module: kunit_example_test
     # is_init: true
     1..1
     ok 1 example_init_test
ok 1 example_init
     # miscdev_init: found misc device minor 15 available
     # miscdev_init: found misc device minor 128 available
     # miscdev_init: found misc device minor 0 available
     # miscdev_init: found misc device minor 254 available
     KTAP version 1
     # Subtest: miscdev_init
     # module: misc_minor_kunit
     # is_init: true
     1..7
         KTAP version 1
         # Subtest: miscdev_test_static_basic
         ok 1 lower static range, top


