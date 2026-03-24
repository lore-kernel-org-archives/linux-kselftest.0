Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010068.outbound.protection.outlook.com [52.101.85.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D82C37DEB6;
	Tue, 24 Mar 2026 14:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774363595; cv=fail; b=BIxjdRykw1osCqd7BE1TliJb51dbG8ov1vGt7N6pwrLoZlwj0Jvqfdco3MLHcaFGk7hKy5kCY54pL67KnIqGbK8bVfIMtE2eKJE5Edk2KtK+MsL9mQdwnvU9gLXytWrElGSLZSCN8PCUbRp/c98O/Z/p0NmirrJRWPB1RSDxBQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774363595; c=relaxed/simple;
	bh=qjoN744UfWBrW71a/+kAUIzEJmTykY/khzvou/uLaLM=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=P1DU68M5V664pWVWxByS0MrWh14n24hQ8AXyc1hV3IpTjC9YPo9nlKa51Io8HMWJ7paPxO2EYLVfewxH3aA9JapjAwue2fEa1djHQhmQN8kdwq4ENTubKwYkyAeq2Q0hpZst9yNMWe9f47PLDzxBb9udxA77nOsfkXX5sqL5emU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=citrix.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=zyIIOYPN; arc=fail smtp.client-ip=52.101.85.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=citrix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="zyIIOYPN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XqVN8rrKmfxDdGbkAyDVf8i8IhdVO2hkllrtoEOOZcFmDU8V9G/d0TCqTBSmG973YqQpYhOYoQapPYiG84GxtnuYE2iqPiw41XpnO4OIYJH6BuGxqZA8ExlDqnOJWjnjj3yvwVuv8fFz1ZqFv/e8XC7lfzMf9lN3lAFPKfDM7WsH5TsxzpGmRQuIgXXK9H6to6JtlDkI6zCwhI3qwOne7o9rUKycIccrjjo5V3GT/ua1eYcr+NdW0VORY8+ffkw0GsOBqcj9EPo0Q19TMaH+wCRVpvMgLCwH35EEI7lyBcz431fA8YZWe3vv6YDKQMzDklo5EyqJj5T1XmuSFjxDdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qjoN744UfWBrW71a/+kAUIzEJmTykY/khzvou/uLaLM=;
 b=mt4KVKFjVXrMwMtKtuBy8c52wR/ru9z9vo36bLYv6vSnOvM/N134HR/LM796Vf7eif49qrfu4RJUDw+BY9Rp+8qFrDUfW3IzZxf08P7RoT5yelDsr19wmErtlU7vMP7wWZEdZoHqAq0LhMkv9MtgwGdCZqmfjmXW1K+9K0w3mtFNgmg9XENK1P7flCQTJkApxSbQ9u7JdSvuBKm8dnjssnlDUyKoYnO6ncdFn80RiWZR4UfzSMQcaLU+Fvu4dFny7yZZzZzaQhnECAZDj7t/FyrvKWkcTiWO1YJBVdj59bbQzbmrpAU+X9t1mbUnqUIke4bDEi+jMDzdrThVor2GGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qjoN744UfWBrW71a/+kAUIzEJmTykY/khzvou/uLaLM=;
 b=zyIIOYPNPB136HDU753ioXQUzrN4B7SBmLOS/unNZyCk4ahkMnBQnpc8BI0ZHDPR/SJYRWcR3mDnsbfBfNfDGQ61Jx1RHc0DKwVg3F8xdG0DXTRLxSXBDa/D5UcF2WimNGVLoznWYVruMOg5TNBL8qU5VgfxFrxoFNKEDLjEYo8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS1PR03MB7992.namprd03.prod.outlook.com (2603:10b6:8:21b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 14:46:13 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 14:46:21 +0000
Message-ID: <098e3877-5681-499a-b8ce-dbf5c78847fb@citrix.com>
Date: Tue, 24 Mar 2026 14:46:26 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Dave Hansen <dave.hansen@intel.com>, yi1.lai@intel.com, bp@alien8.de,
 dave.hansen@linux.intel.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, luto@kernel.org, mingo@redhat.com,
 shuah@kernel.org, tglx@kernel.org, x86@kernel.org
Subject: Re: [PATCH] selftests/x86: Fix sysret_rip assertion failure on FRED
 systems
To: "H. Peter Anvin" <hpa@zytor.com>, "Lai, Yi" <yi1.lai@linux.intel.com>,
 Xin Li <xin@zytor.com>
References: <c6c2ad7c-c307-4e8b-b2de-55e807f2c41f@intel.com>
 <43f2c5c2-6327-4546-b204-5c66b704042e@citrix.com>
 <568aa6c4-6802-4eb5-b412-e3aa93ed9b29@intel.com>
 <91590BC4-A54E-40F4-A223-A07FBA386A9A@zytor.com>
 <acDYXtVgSKbbAuGs@ly-workstation>
 <ce764071-6670-41a2-923a-88f1cd04b238@zytor.com>
 <c2979413-62f4-4a35-ad64-be2b8f55ea04@citrix.com>
 <0200a8d8-6871-4ff2-8c6a-968c2cb39a4f@zytor.com>
 <f55dd646-c728-4b0e-ab3e-18da8ac9e6e2@citrix.com>
 <760478B2-AED7-44F5-A22E-1730A9A0ED63@zytor.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <760478B2-AED7-44F5-A22E-1730A9A0ED63@zytor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0285.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS1PR03MB7992:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ce1c5bf-3e71-4d05-911b-08de89b41d2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	MBSbyyfaCX3+8P4+XyeF2L8BCYdczyG+MAA9Y5/C0XeKTjaveAxcW/BKNH0zKNXdT4V0NC6/ci+W9aCW85Y8UDI7dtilhU2e3yUp38aGvvzDH8b7cpvH488OnQdNqUFtgHWCQ5ezFmMiy0NEBM4bFyLBO9c1FQ+zEHPdR+jZd6XJEQxdSrbUDsr0gfVs/Aq97GavQIBy8ptxegrRvFvTCfubFKB5xr9Eh5fHDKrp3rbAtaPd6VowEuvHh+mkDuQ+9qLpK+jJGoEJn38QZUSvfjTbyQmel96hByGnjV4gUYk5MEAo4tcT80Z/oZnN3LTVD66qIDdnbGxGV4bFHINfG9ymw+LmR9F9xRRKcsVQMSMh/BMNS2FFxtkBL7xmzRor/kt3iDzuzn5fhHHJRnf4T94YyVAkzQJeTvQ97lGEPOQmLv7Mxl+0oGZcNqExkB+OZmEn3ibVgJx6OredfXUrtEU4NdVOxryGwiUKG9GM2z4aN/AibbO3MVKzhIAkGt8d/1y9SiEYbte3piP6F6Ia5poZrJJI4H7UJa7K3UXBubvjDAQGd7SQZCUwaMZbH4dUK51mjnpqi49k9R9SnwTvhNoD5nC6/whKNeMYKvTJPP2gPIS3Gq3Nvus+WGLHvAmNnPKcUPM0bR0QKZO1K7WcH1T2BcyJY36xrRBkLyBNC7iggo6binb/uwpXjfTHQ72rpCJgXwcxaNv4+JAKGxas1Ewpkgs5rVb0ufQtAI9aFtc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWRBTzZEMHpqU1pmcnV4enE5c3BjWFo3K0dWTGt0OHdJKzkvNXZRZVhGQUdj?=
 =?utf-8?B?aVl6R1pVQS9mR013RlhMazRCVithOE5hZFZia3lqeDBHRzVTa2R1czdxeDg2?=
 =?utf-8?B?MWU4bTgyZUwvL1llTEFLU3l0WlBOZlMzSXlUR09yM0NnVlV6MW5MSWlmMFlZ?=
 =?utf-8?B?UnN6UWpxdnhYNWJUelQ2djdYdkU2UmVWaUttcDZYd21ydm5uVW9YdjdHL0tJ?=
 =?utf-8?B?eG9yMFZ2a25SRjh3SCt0RjZaVSthZTFLVXE3RXlpNndpR0hYZzhUVjhHbUdh?=
 =?utf-8?B?U1VxcXp1d1ovMk1NK3dHVks2aXNSTVlUbjhYQ2p3OEdLcXM1UUlKekowNHhy?=
 =?utf-8?B?aExZVitzRW5LTi9DWUxuc1lKTEJmTmZ0WCtSOUZQbWVuVUpLTXlPR0hxZUVG?=
 =?utf-8?B?YU82bDlDSXhOMzdEeTA0QnF3ZithbGl1ZWhBeWF5b0tIbjJQNVZFdTdoUC83?=
 =?utf-8?B?RzlYbGppaVRKb2MzUUoza1h3czd3UGY4TDViekQxQ2xaVVF6bFNBcVh4SXdp?=
 =?utf-8?B?bFVVN2JxOWlJdXdTMmVhUjBCb2pkNFB2NlFIb2l4SHltTUJjS0VZbURYeStZ?=
 =?utf-8?B?Y3NKQzUwR1JFUFJCM3RVWFh2SGlkNmV5N3lTVkQxQkVIYmFiaEx0RnFhZzZx?=
 =?utf-8?B?RlJmaEtjRmhBNWozYkIxYnJNTjhSZHcyNkVFOXlUaXVpZXByOWdKcGRpTjJ6?=
 =?utf-8?B?T2lRUFY0dTRRRndCaEhrMnBQREVWb05hT3F1UGNsdml3ZjV5QnZmcUpJbjd3?=
 =?utf-8?B?enBaU0xYMXdSSW8vbEhXMURSbi9XbkRVNE5ieU9GVndhMkxJRFkwUnpsbmxD?=
 =?utf-8?B?TkhpYlI4d0s1azhUYjVrT1NPWlUxYXFyU2FCQ3krZGdXa1REblVIakhqWkgw?=
 =?utf-8?B?SDNBMUZXOWdtTWU2UVpTb0hOUzFJV1ZXMi9TaTE2MjBUOUxsdlc1WXBrQ3VF?=
 =?utf-8?B?S3RJRU81SGNLNVJ5UU4yOTJBK1dvS3RYNkZQWlFtdlJJaWJGR2huMDl0elBv?=
 =?utf-8?B?WUZoaXBCRXNEYmdDSVVnZ1JkbzRPYXlqcjJYbE5oMGpkSVZpYURvMms5SmhZ?=
 =?utf-8?B?YlhhMWlGbWRaQ0lCVG9qL0JlREpkMGVleEFCcDArRVRId091TDUwSTFycUh1?=
 =?utf-8?B?K0VjRjA5U3MvOWRDTTl6MFd3dXZqYWExU29CeC9kcENFZE9BK3dEUk44bEQ4?=
 =?utf-8?B?RzNBdWxCM21BcDRwQ3RsWG1xTUlVV3JkR3ptR2pxNmpad2NHWU1EUFg1Sk0y?=
 =?utf-8?B?eFl5dU1rYy9yYXp4cnhabWEwc2dOR0RFYk02Y2oxalFWaFpmSEgxMXdxdlFz?=
 =?utf-8?B?KzN1MFRwVzAzS1FhWFpvU2tUYlNTdUdwQ005SzJVRWlDRndyeFM5VDIzQ2Rs?=
 =?utf-8?B?cmNOZ2pGSFZ1S2Y0ZCs5TitVVThqS1NyRjZFOWg4eHU3SlRMSDJCM1Q0Rm9S?=
 =?utf-8?B?U3Y3ZDhBTTlQZ2QyektCWTdJenQxSUFsQjJZM2lWWkRCblBjdnlxSGhnQi9a?=
 =?utf-8?B?MVJyeEU0aXJVTGhRN29leGRva05BQ25xbzlmOUh4a28zdkRxZ1NHcnh2dEhy?=
 =?utf-8?B?SHZvVllDNEx2OVNRdHFJN1lKaEtXQmVKQUwrdDdZZFo5UVU3cy9qYk9TdHBz?=
 =?utf-8?B?RFVqeGZDcU4xQS8wMEpBZG11WXBpOXV4N2xGUDltODJrRzVTV3JXK0VFOTFh?=
 =?utf-8?B?MTlvOG43NWF6dFZGUWcvVjV3WW4vcDVVVEc2WCt4d0xpM0Jvb3NtZEViVFJR?=
 =?utf-8?B?Z3VKOHBJS0JWSzYwRU1sRzBNQlBsMUsvYUdPeGtiekZsZVhNbnlPV1Nyd0l5?=
 =?utf-8?B?NmhsV0FmUjhjSmVPSHE1SUIzYTR2ZWNsbFkzL0hJQXZOckZmdk80dDc5ekpa?=
 =?utf-8?B?QXUzbHF5L3BNNjNGcmp1ZW02ZlJUSU04Zm1GZHpEVVB2c0tNZlpiallEZVpv?=
 =?utf-8?B?aWdlMjVGdzRWMVJVL2VCRnhzZHc1b3RNK3haWXFIV3dNT3VOb2VDaU44TWxG?=
 =?utf-8?B?Zmk5WXBXQjFYZ3k5WVBvRE5BdmxFLzhPRHV0dWsyMm5TV294Zkx0WXRwZ0RQ?=
 =?utf-8?B?K2RSMjlKSXg1bnBpaUZyVGVialBqZUlNbTVOZExYUlF5dmVNTzZ1UW9iRnRx?=
 =?utf-8?B?bG5hajhPYmNQQzNjL0grUzZnY2FLUkFqMDJMRitvZ3NhQmRtOFVHWTJZZWpx?=
 =?utf-8?B?TjNBNVBtdzNQbyttV0EydWIvc2ptQWRlZXFGUkZZUzNPd1hJNlNtOCtoWC8x?=
 =?utf-8?B?RU92SVdDR2xsNXZ3ODdONGUzZWlScUozQkEwcU1wZ29IaWVPNmx4b3RIK2xr?=
 =?utf-8?B?RTBJMXhhbmFtTFhNenJqeFhWNTg3T3pVZjAvSGxmYzA2d09kMlZPais4SzBX?=
 =?utf-8?Q?40b3cOlr2nvEutCY=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce1c5bf-3e71-4d05-911b-08de89b41d2b
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 14:46:21.2117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L1xgkiWKzGCqLJfF+opDZF6qrA9E2+XbIoWkSEIJvs1AQlyU+6Gfx/TDszezlfnu/JJV68Qtm9wgltZsL28AVK+xxbL2ujbBzRip5pmwnSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR03MB7992

On 24/03/2026 2:33 pm, H. Peter Anvin wrote:
> On March 24, 2026 7:08:14 AM PDT, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> On 23/03/2026 8:27 pm, H. Peter Anvin wrote:
>>> On 2026-03-23 12:17, Andrew Cooper wrote:
>>>> This doesn't really test whether FRED is active.  It tests whether the
>>>> OS is not providing strict backwards compatibility, and I think will
>>>> malfunction when there's a hypervisor above Linux providing strict
>>>> backwards compatibility.
>>>>
>>> But that applies equally to IRET, no? If the hypervisor clobbers the segment
>>> selector like IRET would in the interest of compatibility then you have the
>>> same issue.
>> I suppose.  I for one don't care to provide that level of compatibility.
>>
>> But for SYSCALL, what are Linux's plans for CRIU or RR ?  I had to fix
>> SYSCALL legacy behaviour in Xen for the following case:
>>
>> * PV guest issues SYSCALL on FRED system.  %rcx/%r11 not clobbered
>> * Migrate to a non-FRED system
>> * Xen uses a real SYSRET instruction to resume execution
>>
>>
>> Here, the guest continues executing at whichever dead variable is in %rcx.
>>
>> CRIU/RR won't be exactly the same, but will suffer the same class of
>> problem when moving between FRED and non-FRED systems.
>>
>> ~Andrew
> "Doctor, it hurts when I PV?"

I'm asking straight up, what is Linux doing to fix this same issue for
CRIU/RR?

~Andrew

P.S.  It's rhetorical, seeing as it's taken between Linux 6.9 and now (2
whole years) for anyone to even run the x86 selftests on a FRED system.
