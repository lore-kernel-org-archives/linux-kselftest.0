Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013039.outbound.protection.outlook.com [40.93.201.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14413B637E;
	Fri, 20 Mar 2026 15:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774021634; cv=fail; b=KzkrF7O7QEbeG/AK0PIFHt4xptlljCIKKxbY3dPAPwFPWhJMUXFKCuBf++A+UncGD+nRgHG9xB1FyV2RGDF6bVWVXuSz93zL6ZAbkckRHZsn8vsVmtg5lr8CQGsSbdLrclX2zxoTvPHkYIJLvj8uVR7ayPo/LVfn5jUaYg/R0Tw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774021634; c=relaxed/simple;
	bh=ZTlliCPhcZ6GOiwVF8YIO0gxl+FGd+Jf3MQcU1pkhr4=;
	h=Message-ID:Date:To:Cc:References:Subject:From:In-Reply-To:
	 Content-Type:MIME-Version; b=olYjp/spdVzxrJo+JA5xKVj5MLJLkIRRVJNjTaKHoPNiBbuLS6CRoLqarXAO8YLHQX81xRZQrofiJDr95/Dhuyk2u7u6q4VzHYRzVuzzRS/TqIWh95HB1CxgHEqC19XVWnIQonfhEq4xM3W/fRRcMVJuDcD9J1k9xnhB76z9B9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=citrix.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=P3PovQQe; arc=fail smtp.client-ip=40.93.201.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=citrix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="P3PovQQe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ssKo989bDeUenwaPbU/uIf+jhOIAuNlNwiKCSOXqm7rnweU81lfain/fzo5hRs6MxqKYlttuFVCcpiYsa9k6HRTrXLGaIu/IWfx/9WLFZc8CXgW5URN+TsSinFtUqksFRaE85dzN51wuJ6mH+lF76NHVoEUBNk0PRhzwk5HBD0/SVnN2yCHfSqx9IxK8T+PnUGz/RCJGVlQ3kKi7SX1iFAevxUwWN0h1ES+3aB/T5UpXMRTJNgtAVU8z3QfXqVdfWVIpmlVnCKD0TfCqEqkCT5EqutDc33jKGDOnUjLoLczc6+25HxcuJnxbPpWzGTyoOa4oY9hwTGhELLrZXylkAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZTlliCPhcZ6GOiwVF8YIO0gxl+FGd+Jf3MQcU1pkhr4=;
 b=uWO93p3O73Et1W9zqYMcBlqV6QGW3VWTtg/BPw05pUQlGCGbDiYwstHpu4ZbV3aYdOtZ4tIAs1g2n6G+c/ot5H7DG2sBd3QjPsCt5kVP2+f3Fv3Nux9Slu812jCGKzayPg66R6ewao/016euY/MIqkbdpODWUkZ7/sE+fWggWhOl2wzW1YnqMhyXT01CtRe1F2ooHH64j+zj882H0w311S4A0ySKBVy14daGts/MPrXxnMY1NpO88eYewqZJWWDhPc8J4zuo+qL7IsbKXhbsXMOR8WwAsfqjZlUswE1ciSM9dm+Y3CeGW9UhW5dP8TQAgA70MEq3htz3IoHj4EFLIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZTlliCPhcZ6GOiwVF8YIO0gxl+FGd+Jf3MQcU1pkhr4=;
 b=P3PovQQeDHJ8J8pox2hJho57zsP2haMqGFa+bTFLqtbaZYRrtS5DdWBIsUkCMK5e/kId4mqVH+89H0lDKslnL/MQUV2YEXEbG3/NCB81N32sdD5WrQEoVGAp35n18EVpsCh83+ymV6cMJtVm/hzZ2v+qDP20CM3uXjF3VdDr37M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH7PR03MB7857.namprd03.prod.outlook.com (2603:10b6:610:24d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Fri, 20 Mar
 2026 15:47:08 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9723.019; Fri, 20 Mar 2026
 15:47:08 +0000
Message-ID: <43f2c5c2-6327-4546-b204-5c66b704042e@citrix.com>
Date: Fri, 20 Mar 2026 15:47:05 +0000
User-Agent: Mozilla Thunderbird
To: dave.hansen@intel.com, yi1.lai@intel.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, luto@kernel.org, mingo@redhat.com,
 shuah@kernel.org, tglx@kernel.org, x86@kernel.org
References: <c6c2ad7c-c307-4e8b-b2de-55e807f2c41f@intel.com>
Subject: Re: [PATCH] selftests/x86: Fix sysret_rip assertion failure on FRED
 systems
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <c6c2ad7c-c307-4e8b-b2de-55e807f2c41f@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0070.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::34) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH7PR03MB7857:EE_
X-MS-Office365-Filtering-Correlation-Id: acf8b48b-a419-436b-90ee-08de8697f13e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	N5N/q+YvJPSSoCQF0nhe9HJ2/GKaQyt5onY5Q4yKOPC8XxntwTHCiilF8PnRK6cfAD/+G6F+yqFCOspQFK0f+PlRkvMcxSR3gAMGN71NwfhH29rABl7MvjuvyZARTJdNMyIWZ3AMlDlWq4lJF4uOMZSqXZgiLeGL8wmDHYltDXufbFId0qJd2G5pieDa37YQux8hePXs9u19zZLINBnuNAux7JxDWfW+HydEQdkWN1hWyZ1WnJzSMaJVgrgdd+p8owM9vcNIJvcMe09D5RslSyOSkQLtnUnBf+Qg+BiUwU02YepLsDr+6Np5ewFKVfmFjCe9umGAvYoNQxrxCGD2DMjrd5AiH0IGazCCYuYR88PJDb/HCVF8pkzFidi1+hjKhQ+Z/SWjJ060SpvpkBLkut1EdJKD43a/I+0Qb5NHCnSL7509F5js/x8GahcDYyxzKXBVGbRzIs2bFvJ9ZUB1s8WEBmTQVCaenZXfKjpqkobIslFfgQsUkCCwPr0iZ8YF6Trbin0iQOnWq9WKq23c0l9Yj0w8F7m89BvZJfMau40g70B1W31485w5l1q5sgs4escXDQnwIvGGOsD/HA0wJlAKCbGK6QYejVtSenxk7MLXfe1dng7pXPteXD7NUqGLHfVuxqRgOQd8q4OGhgzlT7XEeYxaLny4HxMPlJTG2qi4cqTs/1j05oCKP4ElEqe/zymMpY4NIGokxmwRYXiA13mbeZCIce/rILlHgEGtxOU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zm92QjdIRmxxeHM5dlZEWjVhQkdUTXZ3N2htN1FwZmRKQm1hYXlSQy80RmN4?=
 =?utf-8?B?WGRnSmxLR0dKMzBWQ3pTQlVGY3BTYTRteUZNeGtpUlRaeXpzczhGdldOaGQ3?=
 =?utf-8?B?YXg1THdobGFaL1ExY0crQVk5SExkQnJNUkNJZ0grY2FFeStNZ2UxWStPYito?=
 =?utf-8?B?Ry9sS2ZWWit5SGkyMFlJNGFqa01TWVdmK3l3M1Vhc1NraDJsMHRSOW41MjJF?=
 =?utf-8?B?N284a2Vuc0pQQUpyREZSckJia29ReE4raXVtRjE0dFlqMEZkVlM4MDk4OEg0?=
 =?utf-8?B?Z3RmOEwrZFB5UWxsc1liZVVZNnUzY3dqcXo3WUNiUGI2M1U3cEJEVkZYeW54?=
 =?utf-8?B?WnFneGVVYmJXd1NqQ3g0VVcvbyt1RHlVOFVlMklQaWRNcmFOQ2J0WncwWnBq?=
 =?utf-8?B?c21jUFBPZyt2eC9PMUJjazRjZUFGTmdRSFVjRDVXaHdySGRVTjY5bEF3SG9V?=
 =?utf-8?B?TVZ4VGxVNFFIU0xDeUF5MVhPQ081elpYSHZYRUZPcEs5Z0V4VWVPMjJtN21p?=
 =?utf-8?B?anF6ajcwY2w0MzZOZzVFQVQ2aWNNTmIyWmEvZDF0Ui9pY1RnUTJsTHVac1JH?=
 =?utf-8?B?QkVYc3dUVGJnYjU4aHFSNGEzTXZ3cGFFNEk3Y2lDNjhhemRnazFkam5OV1JL?=
 =?utf-8?B?ajlTandZWXlGYkp1RTcrUVBlM0xqL1dvbGtyMXBRZXhGRXQ1Mk8zMy9JQlRJ?=
 =?utf-8?B?bTNGM2Y4S2REV1ljV0RDVUlRRWhmKzFIMTJhQWFFaG45Y2hPRGJ0dlMvT2Vz?=
 =?utf-8?B?cVFNMkYzMWh0eEtBMmUxa3o3d3hpemh1dm8xbEppUzI5YWxJQ3hKUlhwRFNw?=
 =?utf-8?B?ZHIyK2diSDZBb1dGdTRwRTZZb2IxZy9VNjJqSlZSWEpjMkNnSnJrdDdPeG1X?=
 =?utf-8?B?MklqYjdBQXNZVFUyY3hueXBXQUowSVNuT0lrbXdsWndhczluYTRwdkNxMHpy?=
 =?utf-8?B?T2RNaW9qd3BtYTBUUTltSWQwZzJaQ2VkeitYTXQ1NFArM25rUi80ZGJPeW10?=
 =?utf-8?B?ZjZxalVrS0dhYWlTTExvdzJ3Q2hhK3JtbnVJeDE5WlNhWGFvRjNYbjBkbG4w?=
 =?utf-8?B?TEpxQlM1ODROdEVYS2Z2eUtrcDg2NGFZVFIzTG5RU20yeUNFeXZpVnZCcjZM?=
 =?utf-8?B?ZEVLL3E2US9FZWhhbEdCam4vSE00RFdXMkRxN29rbnNzdC9wT0szeW84amF1?=
 =?utf-8?B?MUpZVEdtL1dWM0hLNkRvYTFMUHdxVDExQjR6N0VBNDJQK0xBQk5VL09IakRo?=
 =?utf-8?B?KzVFRWZpT2oxYjR5dWcrcHRReENHYnVKYmorMFp0K2lYYksrSXhVWHYvVVRm?=
 =?utf-8?B?NFNyRkw1Rm95TE9PRGJ5eGlGT3VnQmlYbGFERGVXRXlJQWliYWFiS1hmTGFh?=
 =?utf-8?B?ZXU5UU9QYnQxQm1UM1FmNmw2eGhYYjFZaWttQkFGbkdQdWlweHFiMW5mNm5F?=
 =?utf-8?B?QWhVd3VMb3JyazN2TnRjcFlzd2ZWRGxkb3lpOWV3ZW1MNFNSa1piZTZxaDBM?=
 =?utf-8?B?WmlNekRzM1hUV29aNjFYaHp1SUQyM0dJNDlxZkl1K1lDYkJGQ21zUlhvaFo4?=
 =?utf-8?B?SmowY3pCcnUzZVFoSWN1RnhNYUpwMGowR1JpRWJGTlBZSklMSmptK1lKVXZW?=
 =?utf-8?B?QTlIQTUzT3JmL2lCQ0xuVyt4VW1oTWM4ZWlEL0J2SWc1bmx2bE8xRkMySHdP?=
 =?utf-8?B?b3hyak9RQklnYW5PZ2tNSUw0NXVVL2lUN3FyYmNyVGc3RVVMM2VvQWFDN09S?=
 =?utf-8?B?elRlWG9hZDljMjVhZjNpcVBqdC9JU0NOeFUzMkMzSUFQUkZDdDhuNzFuWHRh?=
 =?utf-8?B?ZE9QaGxMT3lSK0RKZmhOKy9jQVlKVmdMTnJJMEpMNlRwa0Fra3FpTTJobmlv?=
 =?utf-8?B?V2JHZ09mZXFtaFMvamEyWmxvejArRzhRSUJ6UWhNYTcyTXVaUXlVK0lWSm56?=
 =?utf-8?B?dS9ha1pSWWFzNmFtSUxVUUpLWTNobm9vczcyOVYxNmNaTzVzY0JSSW44YnZu?=
 =?utf-8?B?aENGMnllQ0pJYVhDK3V4OVg4dXR3Q3pORmZRSmNrNE5ha25EMVRJR0E5YS8r?=
 =?utf-8?B?bnlvK0dPVFpLZVdZOUdhZUtrODNiMjlYaG9EbndSdE1UZExyVWZiQmZoT1dO?=
 =?utf-8?B?NndQTDR4dWkvYWtsZW4zN0k2WGRoMjRiZVJ0QUhsc3BGNWFiNlBwLy9MZzNV?=
 =?utf-8?B?VmNhOHJFQ1RtRG9PLytReG9kU3A0T3BvTCtLaEFyOGpjUGMyUDMxNy9adWZL?=
 =?utf-8?B?R0hGc1VCUXJYdUpkbFh2RGhINEoyb0w5V21hVDM0QzhkWHVFV09HZGNkS0lD?=
 =?utf-8?B?L3J5VXZIMnZJSGpEbzkxTGQzcGFPTUQwcnRZMWp0amFOY0JQVVB4UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acf8b48b-a419-436b-90ee-08de8697f13e
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 15:47:07.9623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: asp9aEySd62YNY64uof4NphGq4M2SZur1jQWWyMRLWemWWP1TXXANKnnbOCUrXZjs8yKmRdoZRfHuzfts/DZKNHGwJNkWJmCdaeF8U5GTKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH7PR03MB7857

> First, CPUID doesn't tell you if FRED is in use. Is it even on by
> default yet? There might not be a better way to do this than checking
> CPUID, but checking CPUID is imprecise at best.

A reliable way to distinguish IDT and FRED mode is to:

1) Load $3 into %fs (x86_64) or %gs (i386) (i.e. whichever isn't thread
local stoage)
2) execute a breakpoint, ignore the signal
3) Look to see whether %fs/%gs holds 3 or 0

IRET has a fun behaviour where it zeroes NULL selectors even if they had
a non-zero RPL.

ERETU doesn't do this; Andy Luto and I asked for this minor information
leak to be removed, and Intel agreed as it served no purpose anyone
could identify.

As a consequence, you can use it to determine whether the kernel used
IRET or ERET to return back to userspace.

~Andrew
