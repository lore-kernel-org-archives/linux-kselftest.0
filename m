Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010063.outbound.protection.outlook.com [52.101.56.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D80C3D4130;
	Tue, 28 Jul 2026 07:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785225190; cv=fail; b=diFAxzdAPg6F5UZBvmTygPsY4md7PKNHy+n6yszX3YrCMzf5FxoNztFOAUtt4eR0A2MdCGGHG0rfZx32RYEfHpZ+WfVzxQoiVjwxhLz+8cx1KTnOdW4wmw97oFe6aLVjAYGvW9CoxB0fXkTgkCwaZnfjI5aB38Q2NJDCdcdqt8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785225190; c=relaxed/simple;
	bh=NK9jKPEiD9VQgvElsrwWbV8w4eQwZHlaibY+eGm/QPk=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oYwidrejsme70KoLpW0UBvjV/J5bEpi7qubkS321S4Vl0u+Cpjo3LaqTlF0H6cHvkPMh+H4DBtOXf5vYI7BMHiGPQdRfzOVHnHxKoGNwOZZiPlmE3fO2GNdQWs0IRL4ea6T3JUQNWn1FtXzudsEKe/xaa21O3S5m9bBQU6gdl5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YDIGxlcb; arc=fail smtp.client-ip=52.101.56.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YDIGxlcb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RPEz8QYlsX9N/3ebSBeWVtvFQqKyaMKSm8XCuS9lbOfMVRo+PMftg4yxzkn3fLQW0n8Lv+oEDPnamSP14sJQ8QQDI1DyBlxpJj/KXhl0Xb5DfiR53MUfPImiJ2rGAYN1l9oBLr9oRjwNs9bEpyEu7DkvdSkW5sIyawKHqODe/cftDANYYoKTPD4eBBOn3EypUtK4LIN1Y83460nrNPPm4AfSCS2hqFZgLeyp9nMHFoWCOFQ+2gA3NRP5/IQXunS9HaWB6tmvirSCn02Xr/TQdMdPqy/MY5cgFdyOZQK+2c53loQarbc3qxztEEgNcAOy1CWkFI3px2k5s9AWcJxgrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gsAfaCBA8ESyhxZqDn5gu49BFQoj0tqCz006kO2tzeY=;
 b=Ebt0NFqTN8/30E2znW6l67jhvwGUU2uM/sEnOFzMIbjSreRyrNX56Yh+t0fWKYfopUd2bAhrQyoFwLvu+IzyyMdHmpP5XP7aQ8LFp8ad9EdbBAZ2VpRilHB8CeNVy4ZFsiXQn87k8TI4RX/3HLnpEC8FjBgPMT4HvuRmz5P29L5mguSmIHEyH1cRJLRwtHO+0+3ab64qoMZVD2pVz+SGiIx4jz6XM6YxLM2/afeJ1wygrOYK58nJW+nhq1PHaRldk/zV32fT1kjB5FOXDdHUOGQumsrK1CiPq6+fetVz+db7bVHX80kH7SDTuNU5NhSDavhHAX/H1d1HFT4mbfOhSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gsAfaCBA8ESyhxZqDn5gu49BFQoj0tqCz006kO2tzeY=;
 b=YDIGxlcbka5sKupXb4Bc9GIFyqADe35e93mCMhFIXTgp0RCSCQtdaHqdwN2L8cTkP6e5c6zDnVIY2Tjw3cq2rxvAap69/eo9ahHx27zk6iY/L8OrzqctEGT8f4wxiFb+plrfoM+mPDKcp8Hh1DayDZonSTkMhYlrpr/GVHTAgI1cDxHPN9/tOzvbYTDilCtFJjFB3Y8lrwwE+VUNshupiF/89JutVo37yJbVnm2oU0U57a9WdqWwzmlv/HDOq5Tqirlw9IHhGu6YAxtSoynYRwremTzfJtBeE8UodQ8dK6NoF8AEQPsAaiq9P+d4/X6AJdpo1TGdHoJrWWP2V9Cl9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9734.namprd12.prod.outlook.com (2603:10b6:8:225::23)
 by MW3PR12MB4348.namprd12.prod.outlook.com (2603:10b6:303:5f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 28 Jul
 2026 07:53:02 +0000
Received: from DM4PR12MB9734.namprd12.prod.outlook.com
 ([fe80::ba44:51c5:b641:2917]) by DM4PR12MB9734.namprd12.prod.outlook.com
 ([fe80::ba44:51c5:b641:2917%6]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 07:53:01 +0000
Message-ID: <58700765-8c3c-45a2-ae12-1f8ff46f4725@nvidia.com>
Date: Tue, 28 Jul 2026 10:52:52 +0300
User-Agent: Mozilla Thunderbird Beta
From: Carolina Jubran <cjubran@nvidia.com>
Subject: Re: [PATCH v4 net-next 1/7] ptp: Add ioctls for PHC timestamps with
 quality attributes
To: Arthur Kiyanovski <akiyano@amazon.com>, netdev@vger.kernel.org
Cc: Richard Cochran <richardcochran@gmail.com>,
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
 vadim.fedorenko@linux.dev, Jakub Kicinski <kuba@kernel.org>,
 David Miller <davem@davemloft.net>
References: <20260714020340.25014-1-akiyano@amazon.com>
 <20260714020340.25014-2-akiyano@amazon.com>
Content-Language: en-US
In-Reply-To: <20260714020340.25014-2-akiyano@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TL0P290CA0009.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:5::6)
 To DM4PR12MB9734.namprd12.prod.outlook.com (2603:10b6:8:225::23)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9734:EE_|MW3PR12MB4348:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bfb20ad-c5ed-482c-a032-08deec7d3f7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|4143699003|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	vanbVCtIz/fkvMnXiyHRxfASPIRi4gKPrtEKhn9NwZCqEih4EVcTx+l0E5CHIHXepic8upb5EFX0ZIfo9oBbY4XCW7j5AdyT8Gghj5b0iWTZXgXm2DYgntFmBTcBEuRnTWBqxZxesmQu5Lp5/WpJ+ubEvrMTi9EQqy9KWq6bmwbbYUC+YgxdWVXsDFFXrpdaPjVzWBEEwg/EhIAFGpI1Ej2ZqTAeMKmhsfNF0i5YQGXXDgHaL2hrK6B4qQ9t7o7at1C6fr/d5tw53uwOc667YVXjir1kYS1N81K6M5NCaREWQ8HuaCT49wOlvd6SSgsSmv720+bdrJQ6GKxOj/+M2ctzfDGhYeDrAgApL+fQznSKHXHcheablfgD2fyM5ttdAI5td7Y4SlvNGDp7NrYSvhBheekfxwUh+TpBjqranMYL6Z+1NAD3iGOYJiHionX9Pm7XyyisL8Kccjs/VQxQrcnBz2YlvlpzJnUpocqUW87lC5ejY3gXaWgIn0g5/Y8piE1r6+7EidvPq+/G6VcouZCgM67aW6w5WzoLWRsbbQdra5SmxtltIXw4KThz7SqDsCX8eNKasLR4pO51a6i9WTf0Uaa85apveiydJjbSCLCg4c1wX7w5wKg61mTRpDsVrcuDSQcaPl6tQwkjVB7NmDiCC/qEsqCmAhJScrOsrWU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9734.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(4143699003)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmRVZGZqUmR0V1h3anVSVG5SQnlnOTE0NmdyRmZKSlQrTVhVVHJTM0lHUm4x?=
 =?utf-8?B?MXZ2ZkFyZk9DUTBhZFE0SmtIWlloOGxCZ2xrYlJvYnJjeFZZdkg5dFgyMGtF?=
 =?utf-8?B?cjF3UnVoZ2xRM0NkcHVoZG9DN2FJOSswamlIUU8zTHNzTklTSXRZMzU1ZUtB?=
 =?utf-8?B?K2NpckhOb2J6V21lU1FHSVZmL2RwNXIzdzhkMmpOVk5ta3JnTElGV3lQQUtt?=
 =?utf-8?B?b0JpNWVXY1VEWXZHeksrdDlmQkwzelI4NlFTZFNYaHRweW5IYnkwTVF2eTZU?=
 =?utf-8?B?dDFORy9kdGFFU3k4NzhvbVBVQ3M2dTJSNGxuYnp5aUNIT1hXWFp1N2FDeFFR?=
 =?utf-8?B?Ynk0ZVp5YTI5Rng0WjNQN2FvNExGWnQzWXRrNHl2d1g4ZHN2cmhZMXoySEVm?=
 =?utf-8?B?SjVYNXJoU0cxMWRTZU82ZVJyRldwNG1rbXdHVU9ONjFzWE45aDR3ZjQ5OWE3?=
 =?utf-8?B?b3J1SXFLS2pQSkpBWTZMZ01oNVNsTzBQZDhvRDJwZk1sZ2xHODR6WHdSQ0JE?=
 =?utf-8?B?bk1UTnBIb0hmcVZMQW5EZGJPcElQMU9LcFRGSEV4RWpwZHdPK1BCSVFmb1Ay?=
 =?utf-8?B?SHNPd2ZtbHpmRmprelhnZTNRU1grNTd3bDA2d3NxRXlIWFdaWFdLUEZybjZ4?=
 =?utf-8?B?a2Z1MmxPOCtRc3JWNmpkRXo4Y1JDWUpHUVh0N0JlNGpsaXQ5SjlqVndmY0hZ?=
 =?utf-8?B?N3ArbDVCYUlMYUt2QisrYjJFSkZ6eTByWVgwamt0M0lWQklpOTFva0l2KzNB?=
 =?utf-8?B?QS9ReENvczR2cjMrZmMxSTdwYjVqNUlqVC92TVpQNUlvSi80RXhXcFo5Q0Vl?=
 =?utf-8?B?eFFaeW9KamRIczg2aEdsdWVEREpLTVhCRzlQVkYyMVpTWWczY3FCM2p2dU16?=
 =?utf-8?B?OHJOSUVhZjRZVVRwLzY4TE5HMy9qUWhrOUN6U2RJUE5qU0hLaW13Z0xvZ29I?=
 =?utf-8?B?enlIc1d2ejJxZVBqSDF2dGM5bUN3OGMyRmVmV1RuSS9WRnFVZndaS1JMYXpF?=
 =?utf-8?B?MFdJWS9WbWFYdzhEbXh1MEc5OFh5UENKL1VMS3FOa2NrVmExSmpvMUQwb2RK?=
 =?utf-8?B?Rk1MQnpEOTVRUkF4aUFVc3R1L3dsWEpHc1doTUxnYS9MTithUkU0R0VDeTll?=
 =?utf-8?B?Rk1ndFpHaXNDUFVoVmlGelU1VXpMR2lySGZLTVc5RnRNMGV5QUxWNmhmUDAw?=
 =?utf-8?B?UE50bTNzdm1iTXY3RGRYdFZrNGhxd1pUZHJnK1YySmpUaE42SlJFWVE2dHp0?=
 =?utf-8?B?ME9xandnMzVWNEE2K3RpK1RzQXdnUEEzcGRlQW9QVnVHdDUyUnlVTEF6Um1B?=
 =?utf-8?B?SnNia0xmdVpLOEFsNitQdDMwemc1ciszeFhFRmFsOHJsZ004ek91TzJ0Uk9i?=
 =?utf-8?B?OHljWXdlL2FuMjROY0pIU2VRZEdzWXNocG5WSXRkMCtBd2tSWTg2MjZUT3F4?=
 =?utf-8?B?K25RM1BLUGFySktPdDR1QmhtdnE1K2h3SFJ0ejVWVS9BT0taaSt2MmdnRmxE?=
 =?utf-8?B?Q3dRbDVWSXZDWkdXVVMvejJQTkh6OFF3dmZMQUsxblUwRzdzYVhJTTlEUHYw?=
 =?utf-8?B?ZURjTFhMcHcrY0MySU1hYjk5eTg2eklLTGJTaHFvZVVtc0h2b3JjNlpJeGxY?=
 =?utf-8?B?MGU3a09WRlF5NSs5VGRUTkpRWWovTUZVTlFVSWtJUHZIRjBXdnBKRG1VS0RJ?=
 =?utf-8?B?akNBWlhjZjIzNlNlRE9YZnpIT1gwUDNFNnFqcXBqOWpZc0xNMlBkU05OdFJa?=
 =?utf-8?B?dnpoNXc3MlZDSWZPMkF4MlQzaytwTkRWZ0prdWY1elBQUjhuTzdUK1kvcVFt?=
 =?utf-8?B?Qm5NbE4rQkZldHEyY2d0MFBWek1UMHZvWkFuMXRubmdNcWlxUGdYWTkwQVM4?=
 =?utf-8?B?UkIvL2ZwL29XUHV4TzB5aEQ1eGlRTVJQK013NU5DMjJuZFlVYk9UVktKVWxG?=
 =?utf-8?B?NDdtYjhoYlR3UElXZjhWZ2d0MHl4U0J1WnpNSVg1VGx4Z3F4YUc2WUIvTDlv?=
 =?utf-8?B?bk9tVE9ubzE1VmlNQWYwSjdtNE51SnJzd00zMUdOVmVQcXFIVG5rWFdxQ1BJ?=
 =?utf-8?B?Y2tHa2ZTNUJxaWhzbUNsSk9Eek9UdzNDV0ozdjR2S1VMLzZOSDlIU2RPZGo5?=
 =?utf-8?B?NXpkK1AyUHJCLzJtVmp3T05scysrYjR0K0xqUEgzTGpPaDFiL2w4Z2RyNWNK?=
 =?utf-8?B?SCtaQWNSbXlzd3gzVHIydC8xY1hGNG4wSEdVNHlJeWFicE91VlNSMWFmOEk3?=
 =?utf-8?B?SDQvMUwwaUNBTFZpYVh6ZjdPV3YwTXlXK1Q5azFUWk9nSFRzRG9XVU16cENE?=
 =?utf-8?B?K3d6QkdMSUdnY2RESDFnOFBFcmZkdzBZc205WW40d1RWckFSN3hxQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bfb20ad-c5ed-482c-a032-08deec7d3f7d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9734.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 07:53:01.4443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IfGJlhUnM2rqlpHkJGRD2yIK+Soreu1H6DDcazpCH43oD1O9fE3IuBF1H+BBlHEqn7vkmH3XW115AihDUPppMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4348


On 14/07/2026 5:03, Arthur Kiyanovski wrote:
>   
> +/*
> + * Clock status values for struct ptp_clock_attrs.status
> + */
> +enum ptp_clock_status {
> +	/* Clock synchronization status cannot be reliably determined */
> +	PTP_CLOCK_STATUS_UNKNOWN      = 0,
> +
> +	/* Clock is acquiring synchronization */
> +	PTP_CLOCK_STATUS_INITIALIZING = 1,
> +
> +	/* Clock is synchronized and maintained accurately by the device */
> +	PTP_CLOCK_STATUS_SYNCED       = 2,
> +
> +	/* Clock is drifting but remains within acceptable error bounds */
> +	PTP_CLOCK_STATUS_HOLDOVER     = 3,
> +
> +	/* Clock is drifting without adjustments or synchronization */
> +	PTP_CLOCK_STATUS_FREE_RUNNING = 4,
> +
> +	/* Clock is unreliable, the error_bound value cannot be trusted */
> +	PTP_CLOCK_STATUS_UNRELIABLE   = 5
> +};

Could you clarify the intended distinction between FREE_RUNNING and
UNRELIABLE? What does UNRELIABLE represent beyond FREE_RUNNING?


Also, how is userspace expected to relate clock_status to error_bound?
Are there defined thresholds for transitions between the states or are
these entirely device-specific?

> +
> +/*
> + * Clock timescale values for struct ptp_clock_attrs.timescale.
> + *
> + * These definitions describe the mathematical properties and reference
> + * epochs of the timescale provided by the PHC.
> + *
> + * Discipline: Describes the frequency/phase steering behavior.
> + * Continuity: Describes whether the timeline is uninterrupted.
> + */
> +enum ptp_clock_timescale {
> +	/* Unknown or unspecified timescale */
> +	PTP_TIMESCALE_UNKNOWN = 0,
> +
> +	/********************* Absolute Atomic Timescales *********************
> +	 * These timescales are continuous, monotonic standards based on atomic
> +	 * physics. They do not experience phase jumps.
> +	 **********************************************************************/
> +
> +	/**
> +	 * International Atomic Time (TAI)
> +	 * Epoch: 1958-01-01 00:00:00.
> +	 * Continuity: Strictly monotonic and continuous; no leap seconds.
> +	 * Discipline: Primary atomic reference; no phase jumps.
> +	 */
> +	PTP_TIMESCALE_TAI = 1,
> +
> +	/**
> +	 * Terrestrial Time (TT)
> +	 * Epoch: 1958-01-01 00:00:00.
> +	 * Continuity: Strictly monotonic and continuous; no leap seconds.
> +	 * Discipline: Defined as TAI + 32.184s constant offset.
> +	 */
> +	PTP_TIMESCALE_TT = 2,
> +
> +	/**
> +	 * Global Positioning System (GPS) Time
> +	 * Epoch: 1980-01-06 00:00:00.
> +	 * Continuity: Strictly monotonic and continuous; no leap seconds.
> +	 * Discipline: Defined by the GPS constellation; fixed offset from TAI.
> +	 */
> +	PTP_TIMESCALE_GPS = 3,
> +
> +	/****************** UTC-Based Timescales (Civil Time) *****************
> +	 * These timescales are derived from TAI but adjusted to align with
> +	 * the Earth's rotation, primarily through leap seconds.
> +	 **********************************************************************/
> +
> +	/**
> +	 * Coordinated Universal Time (UTC) - Wall-clock (CLOCK_REALTIME)
> +	 * Epoch: 1970-01-01 00:00:00 (Unix epoch).
> +	 * Continuity: Discontinuous; subject to 1-second leap second
> +	 *             phase jumps.
> +	 * Discipline: Frequency steered; incorporates leap second corrections.
> +	 *
> +	 * Note: Leap-smeared UTC MUST NOT be advertised as PTP_TIMESCALE_UTC.
> +	 * Smear algorithms are not standardized and the resulting timescale
> +	 * is ambiguous. Implementations using smeared UTC MUST advertise
> +	 * PTP_TIMESCALE_UNKNOWN or PTP_TIMESCALE_PROPRIETARY instead.
> +	 */
> +	PTP_TIMESCALE_UTC = 4,
> +
> +	/**
> +	 * POSIX Time (Unix Time)
> +	 * Epoch: 1970-01-01 00:00:00.
> +	 * Continuity: Discontinuous; leap seconds handled by
> +	 *             repeating/skipping values.
> +	 * Discipline: Follows UTC frequency steering and phase jumps.
> +	 */
> +	PTP_TIMESCALE_POSIX = 5,
> +
> +	/****************** System-Relative Monotonic Clocks ******************
> +	 * These timescales are relative to a system event (like boot)
> +	 * and are not synchronized to an external atomic standard.
> +	 **********************************************************************/
> +
> +	/**
> +	 * Monotonic System Clock (CLOCK_MONOTONIC)
> +	 * Epoch: Arbitrary (System boot time).
> +	 * Continuity: Strictly monotonic; no leap seconds.
> +	 * Discipline: Frequency steered to match system reference;
> +	 *             does not advance during suspend.
> +	 */
> +	PTP_TIMESCALE_MONOTONIC = 6,
> +
> +	/**
> +	 * Raw Monotonic System Clock (CLOCK_MONOTONIC_RAW)
> +	 * Epoch: Arbitrary (System boot time).
> +	 * Continuity: Strictly monotonic; no leap seconds.
> +	 * Discipline: Raw hardware oscillator; no frequency steering
> +	 *             or discipline.
> +	 */
> +	PTP_TIMESCALE_MONOTONIC_RAW = 7,
> +
> +	/**
> +	 * Boot Time System Clock (CLOCK_BOOTTIME)
> +	 * Epoch: Arbitrary (System boot time).
> +	 * Continuity: Strictly monotonic and continuous; no leap seconds.
> +	 * Discipline: Frequency steered to match system reference;
> +	 *             advances during suspend.
> +	 */
> +	PTP_TIMESCALE_BOOTTIME = 8,
> +
> +	/********************** Vendor-Specific Timescale *********************/
> +
> +	/* A proprietary or vendor-specific timescale with custom rules. */
> +	PTP_TIMESCALE_PROPRIETARY = 9,
> +};
> +
>   /*
>    * struct ptp_clock_time - represents a time value
>    *
> @@ -94,6 +225,119 @@ struct ptp_clock_time {
>   	__u32 reserved;
>   };
>   
> +/*
> + * Hardware counter identifiers for struct ptp_sys_time.sys_counter_id
> + */
> +enum ptp_counter_id {
> +	/* Counter value not available or type not specified */
> +	PTP_COUNTER_UNKNOWN = 0,
> +
> +	/* x86 Time Stamp Counter (TSC) */
> +	PTP_COUNTER_X86_TSC = 1,
> +
> +	/* ARM Generic Timer virtual counter */
> +	PTP_COUNTER_ARM_ARCH = 2,
> +};
> +
> +/* Valid flags for struct ptp_clock_attrs.valid */
> +#define PTP_ATTRS_VALID_ERROR_BOUND	(1 << 0)
> +#define PTP_ATTRS_VALID_TIMESCALE	(1 << 1)
> +#define PTP_ATTRS_VALID_STATUS		(1 << 2)
> +
> +/**
> + * struct ptp_clock_attrs - quality attributes for a PHC timestamp
> + *
> + * @valid:       Bitmask of PTP_ATTRS_VALID_* indicating which fields
> + *               are populated. Zero means no attributes available.
> + * @error_bound: Maximum error in nanoseconds. Valid only when
> + *               PTP_ATTRS_VALID_ERROR_BOUND is set.
> + * @timescale:   Clock timescale (enum ptp_clock_timescale). Valid only
> + *               when PTP_ATTRS_VALID_TIMESCALE is set.
> + * @status:      Synchronization status (enum ptp_clock_status). Valid
> + *               only when PTP_ATTRS_VALID_STATUS is set.
> + * @rsv:         Reserved for future use, must be zero.
> + */
> +struct ptp_clock_attrs {
> +	__u32 valid;
> +	__u32 error_bound;

Error relative to what? The advertised timescale's true time, or the
device's sync source? And is this a hard bound or an estimate?

> +	__u32 timescale;
> +	__u32 status;
> +	__u32 rsv[4];
> +};
> +
>
