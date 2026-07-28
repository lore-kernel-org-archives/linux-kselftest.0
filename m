Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010054.outbound.protection.outlook.com [52.101.201.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91A53D9556;
	Tue, 28 Jul 2026 08:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785226248; cv=fail; b=QB9/ramAFA0Oto0ws9RpjQw89iQUX2mVUislleYcs1rp7QJlPTBlEy7BMIUl/XGEaG67Ty2pzFevtBW8oHt+fMEcDKyTlqjdk7PFKXeRHYeKWz+kDTRLh/FHvE/2YbHulN33l55I4Z3NoVWl8sTYIh16xTzBHxRr/JnnQJXaUCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785226248; c=relaxed/simple;
	bh=jUb5E5os1b71k8n8B3STUhgh6nV4lkaWJqy1knMSIfY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CIaeqMnLF/qZoatn+/hIGoSyYtdAfnp9CSSDmwEm+jJF+ZH+ppDXLCEAshApgUnH0td/7XtUpMARCWWWLghJ01pewGiemlY0YI8ZQizXsCMjN/uMa3T43TX7wQqlcxGFGV58qzD9+YhSiLIPkO1uPbOqFOeyFyroXlkOnQns8nE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=M8VcA3zE; arc=fail smtp.client-ip=52.101.201.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="M8VcA3zE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r9TwZoZJV3cHzs7UK2UPlaiUBxgMXi/XUmjY3TqW7Ynj+SHTuGVg7Psz3X3qfgoZiH+6g5D6aYeRf+fEw6WjybIdJaTR7MutP4eNyb7YKdqzBnJ3LInCpv9BbybgffweBbyCEj096TyIkdIwFBLOj571O37MpOuZ6iaS92pUCFw/affvOFBuYo6GK58XoX2YMQPXPiwMWUVK0MNOReEsyOHDcsA90deaXX0tvwvHTCawlAKTr/GUR+jLlV3AsI4AmAeQX/jrE7v1R8Y6ZyJ7wcassLhFaoQpyUDyxyA0aPOdrCh3NrU9Q07cYiKfL8h+hYjZffienOM8kpeCwPa9LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXpGWaFxNydxzHg4fvsEW0Am2UYlQr0sxtf3d0YAYMY=;
 b=r9+9OZJORV4aTC1K/lLQQ8sycIDBWe/g6N4IPt0lPAZzfIVRY132GvsTvlhJ+3bKmfTSTDY0LbzH60HSkIdegmzQryX5TprjksGu9bedfiSEwxS1fg3budCA/9tsYXh11+aV5Y7ZiLpFC4HJAbsZvR48k1ZNOKCK6B7TlAHKo9CmjLbcptHYLKTf81sf2CuG/wx0Wm5xSAsxv7bQayCrAyJavzXgShNPCUxyMHoifH2wfh6o0qZxg91Ma7Jg+l4GG4bvda2YDR8QL5KWPVYfFgaIjoSKtHtdYpjtd6lexxp36iOLsJGQ3UDVykHU94q0yIMHDO1FZ/HwOXBQDNofYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vXpGWaFxNydxzHg4fvsEW0Am2UYlQr0sxtf3d0YAYMY=;
 b=M8VcA3zEs3EvkAiRBGh46zewMjituxFowVmvMcXIe0zl4T/iyKvWUoqFX4HJ/xFn6xzavZL9N3DwsQmwnN91mycUJR/apdv3XJZBQFZihqZTu0Xv40LkYBegwLgQbzT0twIBZSx5kvNkwOfqCpZ7oX2g6Ppb76GvaFEiCSCnAIiMkxrFqkmxeSV1Igu1vgwCO7aeqxQju1uzB/kCe2s11X4NgUJX1dM5hy5ZXtgIxYLmEPozFqShwKCLZNP2dFbRAyPnAPoyqJRrmJNHA0iQbYVA4sGvdu0F298nQokRsLuE3/fM5ohXpZeVM1NKrRaygeE0u7KHyNzts9TTpIm/wA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9734.namprd12.prod.outlook.com (2603:10b6:8:225::23)
 by SA6PR12MB999202.namprd12.prod.outlook.com (2603:10b6:806:450::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 28 Jul
 2026 08:10:41 +0000
Received: from DM4PR12MB9734.namprd12.prod.outlook.com
 ([fe80::ba44:51c5:b641:2917]) by DM4PR12MB9734.namprd12.prod.outlook.com
 ([fe80::ba44:51c5:b641:2917%6]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 08:10:41 +0000
Message-ID: <0d9c8e9c-c418-4ba9-b24a-6070e402ffad@nvidia.com>
Date: Tue, 28 Jul 2026 11:10:31 +0300
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v4 net-next 1/7] ptp: Add ioctls for PHC timestamps with
 quality attributes
To: Jacob Keller <jacob.e.keller@intel.com>,
 Arthur Kiyanovski <akiyano@amazon.com>
Cc: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Miroslav Lichvar <mlichvar@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Wen Gu <guwen@linux.alibaba.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 David Woodhouse <dwmw@amazon.com>, Yonatan Sarna <ysarna@amazon.com>,
 Zorik Machulsky <zorik@amazon.com>, Alexander Matushevsky
 <matua@amazon.com>, Saeed Bshara <saeedb@amazon.com>,
 Matt Wilson <msw@amazon.com>, Anthony Liguori <aliguori@amazon.com>,
 Nafea Bshara <nafea@amazon.com>, Evgeny Schmeilin <evgenys@amazon.com>,
 Netanel Belgazal <netanel@amazon.com>, Ali Saidi <alisaidi@amazon.com>,
 Benjamin Herrenschmidt <benh@amazon.com>, Noam Dagan <ndagan@amazon.com>,
 David Arinzon <darinzon@amazon.com>, Evgeny Ostrovsky <evostrov@amazon.com>,
 Ofir Tabachnik <ofirt@amazon.com>, Amit Bernstein <amitbern@amazon.com>,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 shuah@kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Simon Horman <horms@kernel.org>,
 vadim.fedorenko@linux.dev
References: <20260714020340.25014-1-akiyano@amazon.com>
 <20260714020340.25014-2-akiyano@amazon.com>
 <e58af0ae-ad06-4f77-8ebd-f3678d6dde66@intel.com>
 <178418934680.25423.291292029139415698.b4-reply@b4>
 <79bbb277-e396-461e-8104-a9d62d47c299@intel.com>
Content-Language: en-US
From: Carolina Jubran <cjubran@nvidia.com>
In-Reply-To: <79bbb277-e396-461e-8104-a9d62d47c299@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::19) To DM4PR12MB9734.namprd12.prod.outlook.com
 (2603:10b6:8:225::23)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9734:EE_|SA6PR12MB999202:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f30c1e5-f052-4544-7118-08deec7fb789
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|6133799003|56012099006|11063799006|10067099003|4143699003|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hMZ3yJhO9MoJacExpkOHyH8zo8dMcBC8dbkMQzbTv2U08o/kDlG0EjKT2fzPCSKEwn6J5DIGQJc72h7AREzl/bfdxqlAOLnZaXZTLKhH7dMPoRGMdTj5mD0MELdRzwai8lvxka2hTHjoAXOlcJkfnO2QAbDJa7ENedDn2PgADspYheQn4TCJq5k+cbaurUj2UGfUzNw4dDOddU4AViVVQG4heJ8ZYnXeyM+KupU4s02sH3jT6RUkQaoPbfproX7KL1WJc18DmhWVheUB/npufci86MmOfT/8zxTqa8Iv2feua4oPiX9kTIUCgmrYDt1S9rHomMAHpiw1TLSoLlbrV+l09HyMNssRGM7VnoDcHkOgo7EcFXtpPyE2bq2go8dMTMs5zDqUjd3m3OWp2Xzt1FNi+7wvAx5ynoEQgCcDAdzV1akfhAAJbHTm/5Lg7vn5ImUJMDbyEVg0pzd2liJnviPt6D3pw4OHJvre04gLGhWzm+rSb+4GdmOOtv7SXKFsQCFJpuaySG2/9Gj9neRy6OTozyjtG6hIpM+YW83xpSRYsT0ThPFGrbeM1THByCeYM8ao09z2qJ0X/N8VcbyI4i22EUgjxReYJ23QdxS/u8TJ6/sVtOCt68MWaudX+mpUQ8BxxBL4gd+xXwowEOid+DD+Ew7VmCYAf+VazbvzNns=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9734.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(4143699003)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y244MGVBMTg0VFUxc0RMWThKc2JwS2RyWnUwekpQa2dJOWxmV1NnSUJKcWNV?=
 =?utf-8?B?ZldBTVBmay83bXByN3d6N3QzVHlLZGNvZ1hKdkMrYWg4MFROaC9wTnk2TEdT?=
 =?utf-8?B?MlBxUjNOaG1mZ21qZ3hpM2NjbUE1TkgySVpsR2NvbGRSWkJ1Z3ozSW9Gbmxn?=
 =?utf-8?B?ekN3bWlqZlZxejE5ZDJMZ0FVYlRsaVkwVmxEMC9pbWJ0MVNrSmMzVWU3bEdl?=
 =?utf-8?B?MjV4dlkyUy9GVTNoRFlHbm9pc0hjYmpZMjFNVnRMUG1NdmY0ZHV5ai9iWXpT?=
 =?utf-8?B?dFVGV3BPMW9Fd1dJeUVkMnJKTlZEQjloNHc0Z3NwbC9CWlNpakIwNUFRbU4x?=
 =?utf-8?B?T2FOSHdzaS9sYWJzWlNJbDZUTmRXYkl1d3NreUp1cG5mbDgxVVpJMnJJdmVj?=
 =?utf-8?B?ZFZpT0gwbTZUMGMxRkNZVHpBMGk2ZHBOSnZpTFBkUytWQVQ0Uk1UeU5iUU52?=
 =?utf-8?B?YmZFNWlZcHhSc0FTMHZEeU1QSU9MMlhvQTFhS1JOYTY2SGxaVTJVbFZvSkVo?=
 =?utf-8?B?RUNXK2RxdXlIcThMWXR0bHdjdnlIemx2UzRBcEk2N3N2M3hBM0VSVE5Jc2ZV?=
 =?utf-8?B?SEhDZnV2bEtSVXZQeE9BMHdWQ3hsY1YvS3R0RDVxaTJtMFZEZ3J1d2VoNG9B?=
 =?utf-8?B?NHlnSy81L1I4TmVsdVZjT1BJcWsxNjh4WlJmMUhKdE9rNUpYVjZ6dHhqc0pz?=
 =?utf-8?B?UnlYeTRIZXl5QUtZL2FhaUdsMEZ1UlJNZmQrQTJ0aUh0V0VKSVVGVWJ2N0Jp?=
 =?utf-8?B?RTVSZkhzZlZUd0dQT2l6REhFdlhta21Vb0wydXhhZnB2anNFNHdUdmRuYitt?=
 =?utf-8?B?WlBEdzhjWUlOVzdUTDlkSHRKdmNyeWl5T1BNN0EyaGd2ZlI3Y0hFYnJzMVZX?=
 =?utf-8?B?WlFrOXBhdWxoOFFiOU1nREliSW8zdDJ6TXZSb1FiZTFkQzFHUVFNODNOa2dG?=
 =?utf-8?B?ZGlyZzM5dVFueER6ZFJ1Ymxaanc2aU9vZlVsZ1MwbC9FOVlncGhSbnQyemh3?=
 =?utf-8?B?RFJuTm9JeUN6SWY4a2Y0Mm1ZbFl1RktEYkM5RmJ1VTY5K2kra0JhcTlVaERX?=
 =?utf-8?B?L24rZHFvS3hqcVpsMnBkbkVONDc4bWNPWThNWHJlODBEdXNyTEZUMStIWHJW?=
 =?utf-8?B?TFdTVC9ZVjhhS2NtZytHWlFJZnRhQ0dteit4dWlSR3AxVzIvSnJpODg3cEI2?=
 =?utf-8?B?NE1sMDNsVU1UNlZ2M0RaMHBwaWVBWDUwOUlwMFRRVnJqNkJjNFR6RUwrb3Ji?=
 =?utf-8?B?RWZOZ3V6NG9sM01vNkFFUUpYUUxHLzRXZEpLb2ZTMnd5SVFwZXFmaFczaVgr?=
 =?utf-8?B?bCtLWTJEVEwxczhCNzhnS0hsK3NNaTdIUUhOM1VicFpKc3BYaHJnZ2pZZDIz?=
 =?utf-8?B?SWtCTjNwSS9UcDJ0OHp1NS9Ebk9pTzNVdUQycVhkQlRqV2grSmxHMjZRR29R?=
 =?utf-8?B?OXc1NytRVG5UQkg0VlhGU0hCN0xzaUZxZVBESm9obXNoNU9uUG4yQ3FkdEV2?=
 =?utf-8?B?NXFpMDJlY3AwVzk3TlR2elROYnNHTnQ2aXRPejJscXBkSVg5N1VHYW1ZYTg2?=
 =?utf-8?B?VmxYdmNnS01oOURlRmV2SVJxdFlFQk13eHpKbW93Tm01ZlMxNHhUUWRUakhD?=
 =?utf-8?B?dDFRZXNWQ1p3TlV3aDBob1h3ZXBPNzJlYVVMcTR5bDVWMEZZUXc1LzhBNEQ2?=
 =?utf-8?B?T1dlenM5Z1MraWJLSlIxcXJMTEYxbTBCcHhGMCtzM3hhVWp3MzhYc0IyVkhp?=
 =?utf-8?B?RTdPVWgzTXRxQmlvMXRUazBSL1VFaGJsa2tyRzM4RVNHT2ZqNEFTM0MxcTdS?=
 =?utf-8?B?anM0WUVQWDBuREpuZ1JHUFNsRnFpZjRrQW5Gb1k5T2t0QjFiL1Axb0NWQnUz?=
 =?utf-8?B?VE9vNEx2bjZvV01qZUt5S3JEN0xFRlJ0eHFjUEhYWUdzN0hzZlhhYURNYUhQ?=
 =?utf-8?B?cFJKRjZNUVpCTG9kd3Y4UXdDdDNzRFJ6UVlkQjQ5cTkzQ3YzZTRtcGJjaGRK?=
 =?utf-8?B?dzYwTHY4czMxbTdNV3FGdUxJK1p2dEZkZWNJYTlJRmgvdDlmNUJwY2dLQzFK?=
 =?utf-8?B?YVJFd25GeFhrNUhWd3V6c0FQRzUxd1FOUnExdDJVTnB6dlljUmJGT2I2NWRV?=
 =?utf-8?B?NktsVlJYUVRwQ0JROU9zU1JtdVh1U0tabGlqZ2J2Z1BZUm1oZXllbDMxeTl3?=
 =?utf-8?B?a0dIV09lNDdGc0p5VmY2SVEvN3M4ek50c2NnZ3RLZVFpek9OaHhzN0ZuaVQy?=
 =?utf-8?B?SU1EZ2ZQU0FrQUhnT3MxeTQvQUNSd29IdWYxTGgwanRsVFlSTnN3Kzc3VFZV?=
 =?utf-8?B?S3N6NHVRdGthbkE4ajVDUmVZbUl4MUlFNFluYWZpVGcrNm1wdThRUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f30c1e5-f052-4544-7118-08deec7fb789
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9734.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 08:10:41.8913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xyKs8ANmAYBSpxO83HVqtdPUDGsp4QuPFyINUi0Lkr49ujOIPye4MyxEElNu1DI8oZ/FduYNHRW8rosa0KDVrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR12MB999202


On 16/07/2026 21:14, Jacob Keller wrote:
> On 7/16/2026 1:09 AM, Arthur Kiyanovski wrote:
>> On 2026-07-14 17:45:34-07:00, Jacob Keller wrote:
>>> On 7/13/2026 7:03 PM, Arthur Kiyanovski wrote:
>>> I'm also wondering if this can expose device-known error bounds on
>>> timestamps even for devices which are operated as synchronized by ptp4l..
>>>
>> The intent is for these attributes to represent device-
>> known clock quality information. The mechanism is
>> deliberately synchronization-agnostic: drivers may report
>> any attributes they can meaningfully vouch for, regardless
>> of how the clock is being disciplined. Thus a device that
>> genuinely knows a hardware error bound could report it even
>> if the PHC is being adjusted by ptp4l.
>>
>> In practice, however, when a PHC is disciplined entirely
>> from userspace the driver often has little or no visibility
>> into synchronization quality. The valid bitmask is designed
>> for exactly this case: a driver advertises only the
>> attributes it can populate, so anything it cannot determine
>> is simply reported as unavailable.
>>
> Right.
>
>>>> Timescale definitions use a Continuity/Discipline framework to describe
>>>> timeline properties and steering behavior consistently across all
>>>> entries.
>>>>
>>>> This implementation is based on the original RFC and the UAPI design
>>>> discussion linked below.
>>> Not a dig against this patch set, nor a request that you work to
>>> implement anything else, but I am beginning to wonder if/when it would
>>> make sense to transition from ioctl-based implementation to genetlink or
>>> something. We did something similar for ethtool ioctls a few years ago.
>>> I know the maintainer for PTP has some distaste for netlink and prefers
>>> the simplicity of the ioctls.. but I think we're moving past where the
>>> ioctls are "simple". Now that we have ynl tools, it has gotten easier to
>>> implement properly. It makes extending the API much easier for the
>>> future vs the array of ioctls we now carry for legacy implementations.
>>>
>> That's an interesting direction for future PTP UAPI
>> evolution, and ynl does make that path easier than it used
>> to be. For this series I've kept to the existing PTP
>> userspace API model and extended the current timestamping
>> interfaces in a backwards-compatible way; a move to a
>> netlink family would be a broader subsystem effort and feels
>> separate from this work.
> Absolutely. I don't think that should change this patch series. Its just
> a thought that we might want to tackle this at some point as the ioctl
> interface is clearly reaching its limits.
>
>>> Do you have any thought on how ptp4l synchronizing the clock should
>>> impact the clock status here? Is this intended purely for device/drivers
>>> which have their own synchronization and not for ones which expose a
>>> clock that is synchronized by userspace? Would it make sense to have a
>>> mode that is something like "this clock has been modified by userspace"
>>> after any call to the .adjtime or .adjfreq is made?
>>>
>> Regarding a "modified by userspace" mode, I wasn't
>> planning to add one. Whether adjtime() or adjfreq() was
>> invoked does not by itself describe the current
>> synchronization state or quality of the clock. A clock
>> disciplined from userspace may still be highly accurate. I'd
>> prefer to keep clock_status focused on clock quality
>> information that the driver can directly determine rather
>> than on how the clock is being controlled.
> Makes sense. Leave it up to userspace to coordinate and combine relevant
> data from the device/driver and the daemons together. Ok.


That assumes host userspace knows about the synchronizer. That is not
always true.
On a DPU/SmartNIC, linuxptp may run on the device side while the host
has no visibility into that process. There is then nothing for host
userspace to coordinate with, and no way to learn the clock quality.
What should happen in that case? Would it make sense to also allow
userspace to set these attributes?


>>>> @@ -106,7 +350,11 @@ struct ptp_clock_caps {
>>>>   	/* Whether the clock supports adjust phase */
>>>>   	int adjust_phase;
>>>>   	int max_phase_adj; /* Maximum phase adjustment in nanoseconds. */
>>>> -	int rsv[11];       /* Reserved for future use. */
>>>> +	/* Whether the clock supports extended timestamps with attributes */
>>>> +	int extended_attrs;
>>>> +	/* Whether the clock supports precise cross-timestamps with attributes */
>>>> +	int precise_attrs;
>>>> +	int rsv[9];       /* Reserved for future use. */
>>> I do kind of wish we had opted for bit flags here given the number of
>>> ints being used as booleans.. :( A lot of wasted reserved space.
>> Agreed — a flags field would likely have scaled better. I
>> followed the existing ptp_clock_caps convention (one int per
>> capability) to stay consistent with the current UAPI
>> structure rather than mix two styles within the same struct.
>>
>>
> Yep, I agree that it is best to stick to the same pattern.
