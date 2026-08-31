Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012012.outbound.protection.outlook.com [40.107.200.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138D932E728;
	Mon, 31 Aug 2026 10:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788173301; cv=fail; b=C2+Rh+Uj6ONDcJ18N4A6DCn0PysALVv5YdiF6Qkat6u7nlSPGP6SbKy8Ib/N0R52eDroS9HpKwCWMHIWX0pic5XsmKNrVgpQu8PKsJskpVALfq1529G/4VPs5IqAad+WGNKkDpeA4LC6UVQWiq4A20NtGUBOkzz4egHZ78Wqf+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788173301; c=relaxed/simple;
	bh=LTCSKKa0aZBPpiCglvEwekslij6BCx/XFcDRvAYvk7Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dpMeU9ZNpLHZwVZYfTiaci/BgNdGBv5p71YYbyIrkA3dVjgNbPEPAbrV7kID8iIWuhSFQsJ53QVtVsH+DWMzLKydPM+onMvvSoxSiXQ2sz7lcCwrnn6gBcU68rtQSv8eosSoSzA/z7TvkJ4xrzUmqw9RE/ZyudKD/Pc/8t/PyS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=s27T9UTm; arc=fail smtp.client-ip=40.107.200.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="s27T9UTm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UnvyClYHDREWj1ypRE+un+E2+YtvtI+ubXSNLU0aykIFxNs3969yvZWlllYzIR+RlhLGb4xNch7fiBlAYjw1H/nOOPMZEDDXYv8gN9KlZ2lizRjad+hFiWsHEqqCfMIWqun09wUufNFxMvENVX28lTMhU8HvmshUV/WLimNL+Ko9wz91j7OVASdMbUwkNh7ZeDEz5oHdopd8/4nnGWZbD/2izJUgY5tEaAuWzMQLB0V+Bdm+eSqb1JLC8xjGoIBTMGgT3D2w4C/I0zMRpuEoNJ/QOhCDBi7K+UztlrvyYRbbplVq7ke7ifkxRw2R9OeP8w2/vxRzbXPCLpZf/beEwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lV+/Ouazb6ZTTpvI72+YyukIvLGqpIkN/46cBnQ4OZw=;
 b=HMbw6LHt7uNA0Kdu1FlKLgnGVHDBDY5We1cM6TYE8rOlP2F9eWRQM7fpKDcR/VJ8jrw7ow8sddlHS1DlJ68oM4QB+oNdVpVaPZYcQ1h9iUullZduN9btvC9Mq3c9OFG5GW1hSRN30ED37J6/bI1BcOSZbEpe+06ixfxX8ofOK6YO1fPfUHO/oeG1v9+dR7v6iuXrhbPdGCHVTJ4PwTxdfguNdKeHB/dH31NSuDIV2LmJAZZa2dHcU6c5/w1SC4fzZJve8/mm2OeJuechLcZdFsgMy4GLI3j9XxTdS49ElhdXV45FXPHVJNMaBaJVq3Ws11hzOuEoLUPx2xD8ehpY+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lV+/Ouazb6ZTTpvI72+YyukIvLGqpIkN/46cBnQ4OZw=;
 b=s27T9UTmAY6wPD1q/x2UvD7ENSqtDfVg/agF/B1jrLanVr6J0NidmLT+NI9T12jNu2EPspleq+FIuymD+WnloozqR6phqsYqy6gBqdzgI+cSkjNNC8x8NvJoAPuN3O5JNC8m1xZSibvwjoXaMWaQ7axblDFT8nWb16vM8kN4p8w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by BY5PR12MB4260.namprd12.prod.outlook.com (2603:10b6:a03:206::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 10:48:17 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 10:48:16 +0000
Message-ID: <5cd8df03-ad51-460c-9b20-3bf288831b5a@amd.com>
Date: Mon, 31 Aug 2026 12:48:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] kunit: qemu_configs: Add microblaze configuration
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>,
 Rae Moar <raemoar63@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
References: <20260804-kunit-microblaze-v1-0-6dcdfe12eb40@weissschuh.net>
 <20260804-kunit-microblaze-v1-4-6dcdfe12eb40@weissschuh.net>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260804-kunit-microblaze-v1-4-6dcdfe12eb40@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VE1PR03CA0040.eurprd03.prod.outlook.com
 (2603:10a6:803:118::29) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|BY5PR12MB4260:EE_
X-MS-Office365-Filtering-Correlation-Id: 9762761c-9a5c-45fd-1e7a-08df074d5d41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|10067099003|56012099006|11063799006|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	i1pwCN+Yajo3CMGHvWTeTWskJCCFg7Hbr5GYrghR59S2vebaiCWfcfURGTukCsLtNibU8wV62kXDUp5DObXccBg4jBV8hUnYW1Nknsk12OgspGxh2S9gtKbronEpiTkgBjx3ieCCm1HYuxto3LaALzEcFnN52il9qm73GQxbRaQn94Ix3ccsf7x+CCg4P548iGTSCUSWiaIhP8o1LxZDjGS7jlrgdUz0QfYlKIxM/FqwYo28Z9U4KlN/cqDBmIrHZcIRnOrsznFLtIFcnc6uyn9H5XtyZh4qCGzYCUX+OwUnHtLEfIn28pk8uLy4XhQcdq3dhs8Rbr9ldNY853PUCATFQX+yz9HpDhXzVBKk1Mk1xw6TCmw6VRsO6RLQmr7/PpyScSTv9Ky62TefQ+trZXvx7CBc9z1ABridzpiI6D6lr1LALC4qISx4A0n4pwnJnIWNgm5bjI3oOaOoa9GC+Y/PoSuAlZ1buUQeYoW6j8JsezmJ+qNCrPNn7nBtcziEmuNPcD96Op2/xOhCH/UxO4oZ4ogwLZgebJtNoUh5Nqjoqi8uEA46yLS3lqtKa/1ZPmSMVuWoHMfnoQvDjMPESQ57F4aFUkz+PXUBIIlwOq1lrWv9NGyYpSB518JOTX3trnAllgwrrM/JLzkB6absbO4ih05Njl+EHmWS9fSMb0U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkJnM3Z0SnBKM1FmbkNHeURvNENzUnB6dWZSeGd4NWU4c0JxelJYSi8vUWNC?=
 =?utf-8?B?L05MQjZqTE14U1lxc2tEZEdCbVkzbno2SFFlcGRZTUs4Z1Q1ZkFQS01oMWgx?=
 =?utf-8?B?bE94c3RSQzhMMnMzRnc1VG50VkpCYkRmMGVqVWhEeTYyQVFLZ2MvQ3dteUts?=
 =?utf-8?B?OFdwNGRjMWxzYWdxaUhFenQ1WFhkaDRXOW1SRmxsa3FvWGlTWTc4V25TYTl4?=
 =?utf-8?B?NklFVTgxTCtWcE9QUHM2SlBNVlAvVVluNEJLclVpTHN1Wm8xa2RYNTB0SU9L?=
 =?utf-8?B?NW9heDFVY0NhNnVYT3BtV0pOSFI2THBENFdqekJsdWtFUGZkNGRKZitraXVx?=
 =?utf-8?B?aTQ0ajJqSVRGbk50NW9QOWlUaE1BSDVRYmQ3OVFkZVlzb250M3dXMDU2b1ZL?=
 =?utf-8?B?S0lpVUNYdW8wUXdHOGZQempXdHZzU3FRNU45eVVkM3FDOHRtZnJmL2VicGxz?=
 =?utf-8?B?MlpwN3pqL2ovNTY5ejkzVUJoOTNwWTJwZlY1ajZLc3Rha0U2bzltcWg1TmtR?=
 =?utf-8?B?NTV3RHY5cyt1bnA0c2QvUHgxM3ZYVmpIRWRPcmk0MzlTaW1WdlhtRkFRdzBx?=
 =?utf-8?B?TXBkOE9CUHlRbUloTFZtUzJTY3dVdmRIeHY1ZnZreU9JSkRvNVovRjc1djJr?=
 =?utf-8?B?dUY3S2hkeUNvY2hrYVZjMFBEOGZHSGYyU0sxdkd6WGxsU0lBaE8vY3p0QWtH?=
 =?utf-8?B?ZHZLWXh4Uk4yeDhIUlFJbWNtb1prSzhnUWFwZkhoNXRZbFdaS21NVCtIZ3d0?=
 =?utf-8?B?UHdJdUZEdUVjNUlXWXZ0Z0FCdGp5Z3RXZlB3NTMvQ001WUVPT3dpZjl1d2or?=
 =?utf-8?B?YmFaT01kM3hSMkdNOFZxQ0wrM0FuNy9OVnNHYjB6UU9RTm5IRnZRbGxUQlN2?=
 =?utf-8?B?NzU5SGJFQnZFYVFxemhoK3Q4UFNnSFZOTXNhUFZENEx4cU9hU3YyZERocnp2?=
 =?utf-8?B?UWJ6Yk41M29xMjc4TEpYcUcrd1JYWEFmcXlnbSs4TzVCYzg5RFg5WDRsRW83?=
 =?utf-8?B?SGNsdTVGTXZJaFltTVZqaGlHT2YyU1MzeU9NUiszRkN1WlNsaWFJTHN3aDda?=
 =?utf-8?B?bkw1QUhjQW1NZlc1YjZ5d0d1Q2EzSm1GdDArM01aWlh6MjhadEp2SEtOYnEr?=
 =?utf-8?B?cHo0L3YxTlp0a29lU1BCU01pODZHZCtDSHhiYUhKNytMUThpWFlTazJiWHli?=
 =?utf-8?B?NEZ5dmZaZ3VrNHhudU5Ba04wUUhFWjVLazladXRncVdmN09GK3pZS2VycU5y?=
 =?utf-8?B?c0p2dUwyUXVETG5DMDFweUZNdlA4aDRMc2YyWjYydUo1QW1YRVBKRWVhN0ZW?=
 =?utf-8?B?K29tbHh2dlpsenMydnhvMk0vSkJKL2RzMGd0SUtYcG5pcWZVSUVIVHhwV3la?=
 =?utf-8?B?YzM2NjVGUHphZHFWNDM3b2hDZkJIaHJnRTNYMHBsZDZGT1pYK1VvOEREbWtV?=
 =?utf-8?B?MmN2eWkxbXpMU2o3aUpTR01rd1VQQmswSmZEUzR3aUFJNVFWVXA5RkpXVHd1?=
 =?utf-8?B?MHRtaEgzVlJ6TG5HT1lWbjZRblhpME00NVRjWmdtM3pFN3RsNXNEdTdXNGlI?=
 =?utf-8?B?MVMwRDgxZFNHenVmK3djTCtQdUlDM29PWVFuOTJKdm1wLzNvV1dwaDhsS1dK?=
 =?utf-8?B?RnNVd2Npdm51eXBxR0RIQlYwcnNMYlZ6VkEvbVorY2RBaU1FVm1Qb3ZjRHRw?=
 =?utf-8?B?L3A1a1RINTFiY0trK25VZDE1Sm9rZmpVVGd4RklEY1dPMWdYVENoUTArZGVE?=
 =?utf-8?B?TlpKaGFueFJzY2kxS2RLZUpHNG5NSEk5Mm1JUTk0YVIyS2xDNHhEZ1FiRHYw?=
 =?utf-8?B?UHpDZ1kwREhTSEdwdFNUOHcrdndLazR1TWMyd2NMTmRaQlFCRWpsQUdaRlA3?=
 =?utf-8?B?SmlWNUx1Zm92NUtwcmxtaXNlc0JCZDY4UGM2RTkzb0FyU01PY1ExY093ODBo?=
 =?utf-8?B?M014bEZ0QlQ1VUw5MFV2dXhET1ltRUh5VzVsMUdyMnBVVFVoOFpyTmZHcktM?=
 =?utf-8?B?aW9pKzlBa0JreDRNeTFyNUh0V1UzTUlQOGFDdWlrSEZVVE1kMHRZMERhandV?=
 =?utf-8?B?QnY0clc3ajZCVVFoUHpxSmtNZlpNMldYS0x1WTVGTWdpZGdCRTVhR2FvQ1M5?=
 =?utf-8?B?M2lnSGFwYkkwUzZ1T3NHL1c5d2hRTWxkZ3J1cGM0MUw1RDU4dUVDZElpM0o2?=
 =?utf-8?B?YnZ4RERocTdOWVJCdDFKYnNlNFJJUUlwVXordGc1SFM5VGhmelJkT2M4MFM4?=
 =?utf-8?B?OWNjL2UzSDRmdGRrTGVadHN4dE12a2hwSWVtSUkrYmFBcHVXNXBFVzlQUFRI?=
 =?utf-8?B?cHFVSFBEbkJ3cUNWQ3hsTVdKWUZNaXFldklJemZ4MW1VRjJjYUV4dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9762761c-9a5c-45fd-1e7a-08df074d5d41
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 10:48:16.9094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V98W7Cfcm+wtb4ENwgLe98Iv2xBbPOfIt7ePFo47T6fbD7SLOA9MYyyTmMQw7cLQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4260



On 8/4/26 07:32, Thomas Weißschuh wrote:
> Add a basic configuration to run kunit tests on microblaze.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
>   tools/testing/kunit/qemu_configs/microblaze.py | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/tools/testing/kunit/qemu_configs/microblaze.py b/tools/testing/kunit/qemu_configs/microblaze.py
> new file mode 100644
> index 000000000000..ff012095e77d
> --- /dev/null
> +++ b/tools/testing/kunit/qemu_configs/microblaze.py
> @@ -0,0 +1,17 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +from ..qemu_config import QemuArchParams
> +
> +QEMU_ARCH = QemuArchParams(linux_arch='microblaze',
> +						   kconfig='''
> +CONFIG_CPU_BIG_ENDIAN=y

Big endian is quite old and I am even surprised that it is working.


> +CONFIG_SERIAL_UARTLITE=y
> +CONFIG_SERIAL_UARTLITE_CONSOLE=y

I think it is just pure luck that this worked for you because you didn't rewrite 
the most important parts of config.

You should define at least these values

CONFIG_KERNEL_BASE_ADDR=0x90000000
CONFIG_XILINX_MICROBLAZE0_USE_MSR_INSTR=1
CONFIG_XILINX_MICROBLAZE0_USE_PCMP_INSTR=1
CONFIG_XILINX_MICROBLAZE0_USE_BARREL=1
CONFIG_XILINX_MICROBLAZE0_USE_DIV=0
CONFIG_XILINX_MICROBLAZE0_USE_HW_MUL=1
CONFIG_XILINX_MICROBLAZE0_USE_FPU=0

to be aligned with s3adsp1800

It will solve these two issues too.
ERROR: Microblaze BARREL, MSR, PCMP or DIV-different for kernel and DTS
ERROR: Microblaze HW_MUL-different for kernel and DTS

> +CONFIG_MB_POWER_OFF_THROUGH_UNALIGNED_PC=y
> +''',
> +						   qemu_arch='microblaze',
> +						   kernel_path='arch/microblaze/boot/linux.bin',
> +						   kernel_command_line='kunit_shutdown=poweroff',
> +						   extra_qemu_params=[
> +							'-M', 'petalogix-s3adsp1800',
> +						   ],
> +)
> 

That's bring us to different topic. When qemu runs I see these 2 issues

qemu-system-microblaze: -accel kvm: invalid accelerator kvm
qemu-system-microblaze: -accel hvf: invalid accelerator hvf


I don't have any issue if you want to wire big-endian version but would be more 
useful to wire little endian version.

If there is an issue with memmove implementation I can't see any issue to 
disable that options to let it pass from the beginning and solve it separately.

This should be fragment for Little endian.

[linux](next)$ cat tools/testing/kunit/qemu_configs/microblazeel.py
# SPDX-License-Identifier: GPL-2.0-only
from ..qemu_config import QemuArchParams

QEMU_ARCH = QemuArchParams(linux_arch='microblaze',
						   kconfig='''

CONFIG_KERNEL_BASE_ADDR=0x50000000
CONFIG_XILINX_MICROBLAZE0_FAMILY="virtex5"
CONFIG_XILINX_MICROBLAZE0_USE_MSR_INSTR=1
CONFIG_XILINX_MICROBLAZE0_USE_PCMP_INSTR=1
CONFIG_XILINX_MICROBLAZE0_USE_BARREL=1
CONFIG_XILINX_MICROBLAZE0_USE_DIV=1
CONFIG_XILINX_MICROBLAZE0_USE_HW_MUL=2
CONFIG_XILINX_MICROBLAZE0_USE_FPU=1
CONFIG_CPU_LITTLE_ENDIAN=y
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_16550A_VARIANTS=y
CONFIG_SERIAL_OF_PLATFORM=y
CONFIG_MB_POWER_OFF_THROUGH_UNALIGNED_PC=y
''',
						   qemu_arch='microblazeel',
						   kernel_path='arch/microblaze/boot/linux.bin',
						   kernel_command_line='kunit_shutdown=poweroff',
						   extra_qemu_params=[
							'-M', 'petalogix-ml605',
						   ],
)


Thanks,
Michal


