Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.40
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793799816;
	b=olfpJmyY4a5cv4vryRIRLMOWY0Q9257a0KxXh09hqre+gQb8dn4lHpUAconlQRrMzdi2
	 MXykCTSsYQ2qS3emdku/abnA7pGB29rBmq+UfQpFVgu2pTZdwUbSb4bE3Dv/K9vDo3x7E
	 g/aswR3wnfx1LHQlSUKamDkpUCgEK9I0kX04L/B8dmvb1G5cp5bcbxKeH4atFmNIHYwuG
	 plkLnpJjcs3HNNs4MmWoUCpYR4W7Hs7LJqPIgE0YTfU7PWyhyBsIQ3pY2h8UxaYUcgQow
	 PKFppJ/lhEdDV1dUrq59XkYEh4npPSXzC8YYV62NdILXFnXpEjhksOcBs5KKwpSKGOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799816;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ZnH/8tTPMCTmFpZVRpVUFJqjyOTpvNGZj3pxvozw7Ts=;
	b=NxfrRIdf7yBVDpUaHZZ5eVJGMRVKjuGAF43B9WbOnwDKaxwmMFDR/w9icVlXeHtCMx+X
	 aZb0ofABvtGSMDCqzSU81QOkO2g1yR2Be6/M/6m6XUUq47T3kfLe4KmYSHo4INH+qFQ9S
	 yZJ5A+GEOWwBu0tjI2FF7b8gFhhGOZjxYkfor1IiANB4y7upNofOySKO617ZYony60P6Z
	 Rm7zN1hbSNZ/4EFo3vt3BwOQzrJ4xnkslNwp09vWfBasilODesBFuMlelZMLC0Nc+cOaK
	 UtXzhfXcgQdlLrnGDOVvfowAYbODKyPsoU6WT80JxCkuC0ZxxHVc4JCo7wabiib0ENw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HMhMLz1Z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.40
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012040.outbound.protection.outlook.com [52.101.48.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9761606A326;
	Wed,  4 Nov 2026 13:43:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9761606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HMhMLz1Z
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l5OpurB8b+7oaqnQ6YUzVxbhMAJU2Z4feVcWyuorL0Jg+v+8PlwuAPFQchaAL6FnGASJD/RTk0NihhLQNt0ilOlQINcZqjb3JxesK6QpBGUG1ixk6Zy7PfnWI/nN9FC3ghNJ1TeyDIXzJerX3B8EekDiiGoEPFfoIkz0N9bnNjr8W0jkuEMQ9OQnXjetAp7rsufYdRTrhmV8oZfHXLYdGZf3OAQaZJBW7Rs9kTanlLcCtKF8MKClOwDUdSkXORLhb8eEgqvRyNny4G0pfV8OnWLucAcghQ7l0eXZBSAHGvqu8P4SmQPOR/ocD+Vial697GrY4N2anMFgIH/7Pwn7YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZnH/8tTPMCTmFpZVRpVUFJqjyOTpvNGZj3pxvozw7Ts=;
 b=ItKaWO2VC2vZwj0BRS//zGZFJMaT2Hf1jfLkCFWfNRg9LFh6MFB1RDfaUumrgnAx2sRT309lqR6RB3yoOWSKCNNyWTFAL6cJCDzpqCrXMU/2NVkzb6a2UEL/HSkwJODYtRfR4pnyC9su1ODWA26h0QVhafwUzNPjhcRl4fZ4MgTPGhXHCaOJle6hP0I0Oibcno56iP7EWlKLhkIq9Ncu9jmnpI3nifeetmZaRkmHb3+eXw/0HAwk3nDEwQt1Y9qTEZI7c3DTTxd568oy+uBgmSGPZ6vRmAoAjS8WTYbcdGxeRwmQckpxZe4UxkbFbGcDqRxR5afWs1+vG4eV4FqNuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZnH/8tTPMCTmFpZVRpVUFJqjyOTpvNGZj3pxvozw7Ts=;
 b=HMhMLz1ZO0TCTo0jk3i56aL7F4nwlX+ORgVYjGoRdb9dqRgZD6RLNekbO1EN4Oi54rHdROxAyWvsXJ6Gioe7surXnmVDnEgXeZsI8bUmAJWdQf7h4hRSufjcxXVbsonfCxUNQmktKFW7p9JfCtfscrgzppPpwHd86BjfYoW2+gibcIT6DyPkLyfRDKu9BUYN2qQgy5MZoI+ym2UgrMx10N4CeNoKX4uzUz+ikBSMzTHKiK9tgu0f9YEkk/ZWvuEMC2JgMGiXXULMFSTXimGnQxzQO6FKh846UKusamS1dtkKiJW6UIr2MV1kLntQ9O62LiX5Of9BU4MTAx/s5VOKCg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHAPR12MB999248.namprd12.prod.outlook.com
 (2603:10b6:610:2ff::22) by CY8PR12MB8067.namprd12.prod.outlook.com
 (2603:10b6:930:74::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 13:43:33 +0000
Received: from CHAPR12MB999248.namprd12.prod.outlook.com
 ([fe80::4972:8062:d74e:b205]) by CHAPR12MB999248.namprd12.prod.outlook.com
 ([fe80::4972:8062:d74e:b205%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 13:43:32 +0000
Message-ID: <a0181f95-8221-4c13-b251-109fe473e762@nvidia.com>
Date: Wed, 4 Nov 2026 14:43:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v1 2/4] net: devmem: rename binding dev and vdev
 to map_dev and bind_dev
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>,
 Nikolay Aleksandrov <razor@blackwall.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Bobby Eshleman <bobbyeshleman@meta.com>, David Wei <dw@davidwei.uk>
References: <20261103232659.1340283-1-almasrymina@google.com>
 <20261103232659.1340283-3-almasrymina@google.com>
Content-Language: en-US
From: Dragos Tatulea <dtatulea@nvidia.com>
In-Reply-To: <20261103232659.1340283-3-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0198.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::20) To CHAPR12MB999248.namprd12.prod.outlook.com
 (2603:10b6:610:2ff::22)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHAPR12MB999248:EE_|CY8PR12MB8067:EE_
X-MS-Office365-Filtering-Correlation-Id: 88d3fee0-e066-44d5-a7ce-08df3a799df3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|366016|1800799024|376014|4143699003|11063799006|56012099006|261009223027099003|261026121527099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dt9pSkPyYM/+bQ+TyazWvANGNz/HlWhY3h9T3dHOIAjp3OP1n+yhb4Sb8w6L/2IHdDJbo3lGVavqJug+5vqEMhcqMpSVHykhkohTQTv96Owziz7wYo2bjfRthfb3FO+5WRPCItFRYm27BkZ5i4GRomJpjrkJ1r2ymIV4BnspLeE4CF30aFmvtjONgX0Bg7GQFiSWiZOAMoOo2I4c3rm+Dm7Lw15o+bgp0UEQG/MjtsDaTdUDNRBG78z5Zf/lvA/qxO2YD2rAmUqD15Qc0WVd6oBkBdGggajadLOjPFpgiKyhvzzRiYavs+ial/uoh7fd3e3Y7P5Oiqce95IOm+MsN9U/xaptM8ad7vYD6TByiyVib/JmACrxWUofNlcx2TOx0Whx6ujNyJCIOHX+o+T/xhaV9cxLRPDhh3yglLlYDwjLod7zjgOObTSbJ/w/3tfwY5W7XquDoFfb32BgtMy/dDSKy5O9n3YNLLJxGKfA7Pab0BUax8QtHZFENECFyuwfRhOWPZyzmwrcoWEhS6szz3oSPMvAy5zxWT00Zag0lk+HosfcDGB1fx9FL7IS3N309P6tcHRIYtfzs5mBdHGPx6Yegdq1dcrMmmzXKtEKMDDLuJ9BLPPeRY6zbT+pA8PmfajcIMsQa97fHDu7271B8ZmmKln7Mp7e3sfJ5CFU+Ew=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHAPR12MB999248.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(366016)(1800799024)(376014)(4143699003)(11063799006)(56012099006)(261009223027099003)(261026121527099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nitkd2lQUVBEL2lKSDZpM1BGM3ZGU292Z3NOdkJrSExzL20rak9pZGltMWQ5?=
 =?utf-8?B?RldFOGVvL1hDUlh0RElJcFVKTGNjSW5qYXFmYktyZnBaVEJLSEdjNFdZWXlx?=
 =?utf-8?B?elArMEtqUTlCN3ZvY05ZOFRDNFNDSDVwMXVsSjhaRUxGVFRFZzlZZktOMFVD?=
 =?utf-8?B?dlVBbDBTZDBYOFVwaFpkNmxTTitVWC85Zm5vTVJXMWVQSEJNclpDbXdqZWNw?=
 =?utf-8?B?cGRPTHlWaGhVVktHSE93dmJaWDdtUVhnZlowbklkdnlFQ0dRRkxPVXN5QmFt?=
 =?utf-8?B?L25ac3lUYStuekFZUXNweUdDVTJ6OWJYcFVPVjdidHZkYzA0MEhkWmEvc0wx?=
 =?utf-8?B?aXowZmhoWUpzUlpPVFI0cWlCK0t3L2xYbERVMC9TQldRTnRIdXR1WGx5eWU5?=
 =?utf-8?B?Z2FiSGs2VWtqc1ltUFRQWDc1cDNHanJ6L0dtRmI0NEpIQmdmdUlPaHBWbGtv?=
 =?utf-8?B?R253U3NQZG5uMzdtbjhENVVaTkNhaEd5ZDB5THNQYUhudnVSWWphZno5TlUw?=
 =?utf-8?B?TUVQU2o3c0dTYS9VR2tOc0IvcXBTeE8rVDFhZ2svaEpBY1FNMGdFamVLU2Vu?=
 =?utf-8?B?eHkxY1dyOTEvck1LSkgwaXp6WVNvODVYajdyaHlnZWxsM0hPb2NYRVo4UDRZ?=
 =?utf-8?B?UjU0UDkvRjR0d1h2WDBNN05VODZ1UnVvUFF0T3Y2cGRqU1BEZGo5c0tNdVZF?=
 =?utf-8?B?Y3A5Ri9hZzgzQWkvNlNMU3M2aGNkc3ZhOEZXMVZKS3BlZDY0MnpBUlNwbDVX?=
 =?utf-8?B?MWNjWTBKVXJQdjBtV1JVWVhoaEdNOUl5U0FnNU9ZQlJSbHVDNTlUOVZBZEpX?=
 =?utf-8?B?WitsV3ZETGxmQjFYMDkyUGdBblB3eG9LL09mK0lqeGhaZ2lES1docSt3cGJ2?=
 =?utf-8?B?QTB1QkNiOWlaU0dubzA4cTdYNFdFdEwrWVY2OTlUWVplbkpyV2JYaVJPTGlE?=
 =?utf-8?B?d3VBcWhPRzRPdU5nbWRzRk51ZzN5QXRjSDhUQ2JvdjdiUjU1TUtWTjc1eWhN?=
 =?utf-8?B?MzRjK1VMY0hLOGtkalFVaEZqYVdySnA3dUVxVTIxaGZHeVRDQTdYdUFMdi9x?=
 =?utf-8?B?TFNuS2x5Z2N0cWgzMDJMNjJ6bWpKVkg0S1RmOG0wcFR6cDBhYVMwYlhseE1o?=
 =?utf-8?B?R2JYb0lFUUtBcmZvOWttUVBCSzlZOUtRNHFIQjdsQzRqeVh4V1ljbXFtU0hv?=
 =?utf-8?B?KzJneDUvZFU0WEpzcUt2Q01IU2VkN2g3RjdDVHFhdG00SnRzNFI4MGozWUQw?=
 =?utf-8?B?aXFta1MydThmK2JweXhXaUw5US9NbWd5MlVKY1BqdXkxeVV1OTJpZHFSeGJr?=
 =?utf-8?B?ZkRHVnhWTnZ4S0hSMzFqZHVpOC9SQ2lES2dKd1MzckRWTHI1VURHSWVqM3F3?=
 =?utf-8?B?VGVNdUh4amxlaTFkODRGWGtiWXoxR0Z1ZHJUWlczcmdHUTV1Ym1YM3NZY0Ir?=
 =?utf-8?B?M21SMmlPQUxoZW9BYk16Q1FwNHlwUnhhczJSMmhHQmZDUXFROVZaS3Y5Slll?=
 =?utf-8?B?bWFYWWROOFUyRkRQL3M4ZTd5dHJUVTBiOHlrSDI3T2FiWWU5bjFjSWk1S3Ns?=
 =?utf-8?B?ZnhpY2FqS01SRm84a3Z6ajVZd01SaDVwUTZEaTJVMTVzREVSWEovTW1MckYy?=
 =?utf-8?B?bld5MUZoVitHdU12Z1E5Vkt0QytCOEgxOTFkMVI1MDVzMDhJZzJRTHh2dXlw?=
 =?utf-8?B?USt1ZVNJY09qNW9BZHhlNlV4WlUyZU12SXhFNGFMYkhCQ05zS0wvM2l1UWdU?=
 =?utf-8?B?ZkRlSHVheDZXbGxNYU9VWE5IZURvUE5vcnR0Q2RkWnc1bFdnSmRwdFcycjUw?=
 =?utf-8?B?VGJCcGVpUnF3TDBMM2tSQjllQkhncC9hbStQczZaVk5TU2M4eDJOSUdZc3lZ?=
 =?utf-8?B?VmpzbTMvY1cwNVdJRXNSNmt4a1RscmRiSnBia0pPRlFXNFE1ckd0ZGdaSkJD?=
 =?utf-8?B?dE8rdXFiS0xVdGNsSkxxQ0Yza3MvemV0Y0FJNm9iNXN3VytmSS92NnNBb2pJ?=
 =?utf-8?B?aFBMNENPdDhraWcyelpXMmVpdm1hMk5vc3d2eU9HNzZoNkpsbHJzRk1oZkIw?=
 =?utf-8?B?RFkvN3hqN29hUWV2aWk4ZXFxOTFvelVYZFNRK1hGMk9YVnFxQVdjV0JYbGNO?=
 =?utf-8?B?TTlIcGF1U09sSVpncXJva0hacTJGbWFLZFA3WDVQTVcvbFVsVjVPQ1BRai9E?=
 =?utf-8?B?S2JIN21oV3NFOWFsZEdyRlc4cmE5SDZaMWg4bC9oQjEzZ3l1VUdpdDFhSzFx?=
 =?utf-8?B?dTZ0Y3pyYmdJWDQ1WjgzQXZ2Q0hMcHNGNDU5bFBmYis5aU5SZDhlQjVjYTkw?=
 =?utf-8?B?c2g0QUU1WU5BWUMxSFNFaURwVUpOVlNOV3BQQXNSSi9ZU1FoeU9yQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d3fee0-e066-44d5-a7ce-08df3a799df3
X-MS-Exchange-CrossTenant-AuthSource: CHAPR12MB999248.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 13:43:32.7085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dfcPih3ZsyI3E8u7fgUUyziVLWZyUSI2EVXL9W/9UTcYl46X0g+z6iIT5cPdyboy0FjrbOMECyvoveXjmrTnJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8067

On 04.11.26 00:26, Mina Almasry wrote:
> struct net_devmem_dmabuf_binding currently tracks two device pointers
> under the names 'dev' and 'vdev':
> 
> - 'dev' is the physical net_device whose dma_dev holds the DMA mapping.
> - 'vdev' is the virtual net_device the user bound to when using leased
>   queues.
> 
> Rename 'dev' to 'map_dev' and 'vdev' to 'bind_dev' (typed as struct
> net_device *), and rename the matching local variable in
> netdev_nl_bind_tx_doit() from 'bind_dev' to 'map_dev' to match. No
> functional change.
> 
> Signed-off-by: Mina Almasry <almasrymina@google.com>

Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>

Thanks,
Dragos
