Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.40
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793799925;
	b=5DuclCA1AKrTFj4EnbWdFbldYAmBVRNmxteyZ01wgtrXBxXs0di9vCewsG7tzZu8XQEk
	 E8lKXa1+lL7MErglJJ3BUouEHu+DjulkYTtEjuWDu6TONSFhXZc1rgg7oLvpdkw8eryLA
	 72CT3EAgb6+UwVn57HOP42BXVloPY9df6rYfP3cJ/4BWIA22wO2tHTuLynWTsdGnttyMd
	 iW8x2OPBQOJqNrAOp+aCgWXuckDUzot12gvWOI5MzaSqxNMAkhLXpGPPfh7sZfbq680N4
	 9W31B9fZQ/PBavhWuChtujyfQrGzxPZR1F7K7rQvWXVFsqYzwwGXLW6LZQLv+TiR1aw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799925;
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
	bh=yNM/bWn7zhjSdVimkbMFHXf+BkqRRJBQ1oVygyaq3+M=;
	b=zRKq4LCCfPkkLnEiJQLLbw+cIOacmlMeXGgFxyArZ5AstGmy8cS/oUIqwPiMA+aqdjhF
	 jBIviOF050EJevqnErOm57vlZ7gcaT2WVRr2NdXGv/QCda3KwJEAf8aIqLIdwipGDvE4k
	 yiOF20c2j2AzjkrmbcBLZ7UqiZysCROlDAwVJGHT3hos54F9AlF6Qw0/ZCU68r1TGfqzt
	 2ZRip4aCC0JxPRbTs+zlAFS8x+7EbGA1xOJHrJQVGM90ZpR2dj7855aBPSQnFucc0qfqm
	 qLCXsJ5eOV9t6omEnD9M56mODWY5Y2T0ZiQ6UTHctD326js+EatYIAhKsl7QHHYZG+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=c+G4zsXh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.40
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011040.outbound.protection.outlook.com [52.101.62.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B221C606A31B;
	Wed,  4 Nov 2026 13:45:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B221C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=c+G4zsXh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=soFU5HEwT+GFeEU5WX+CCuHKVlTUVmqEUjL72Pjg2+BtrLowulA6W7NgEY0Vpp9rT03XJ+UYkTE/qJM7itiwnDqEeswz7wCUql+p98tHJE6Iz792q3pVXsUrVWDU31BFHAOIu+/2KpB9M+ImMB8Kxih+LbsMlH2OfvcA7zA2zo8662RDmGvbeQGUojcY0qdT7CL9zP6Mb8/z5bN0rPUlB8AJ06NdFKPxEqgP/ddE5istzXYLrmAAdmrj4PMWciIunhkwtqEyENE82dS7MmIFsqxbcTVrgttsizeOcMv/f4DjuI/897WTfeblKtUQ1aSRUMIIOmXYf7CSmtZ7egmFlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNM/bWn7zhjSdVimkbMFHXf+BkqRRJBQ1oVygyaq3+M=;
 b=iYKDhT2nnCQ8SjIyaNes1Btr2Te9f5tr7VrU2vroX+1PwlGfVIgpvcI3toOKvB5ZNkTI54kPC9ggISIR4WpdIzh6agPlZ+1sO/n4MutMN5UHayq8Ogxbf4tCmFiDUneJbuZ8593paEwIaafcLfduZCsJCEUVx0BeuRA6THjrbkRqcIUvXndEyQj3eXh4dKRvIHYgO1VPpJBTPCSQM+svt0vuukjwixketrd2sEFfxzlyzgnBPnzyxZMiGSQtQ1FO3THY3REbsdwmjL3Kp2pcOtl/9RU/dtC+gY97Pwpd/WlYHzePUWLd3RW0Z32a1p/2jE+FQl/xeKB4aiq1iAIwLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNM/bWn7zhjSdVimkbMFHXf+BkqRRJBQ1oVygyaq3+M=;
 b=c+G4zsXhN6814UoJVStthZOzT5Ak79iA7MljpMJ1w9O/gIpeStDWvnWwFUINyIrAkhaho9ntJH6R7P2ECAH+WwHF/0oJOEQWWAfrzwJI4Ktexk1lOx/X18kWQoZRdtVzVFoz6kkl2Qn2DmQVXv8/E2yU3aRc6jnDYl+r5izMhRfH03Kn9deiofQIXwYaWGUgEhhlXNp0NNjoZupuaoav003k0BealjotIIh3AN+k1yHrzQ+C95csqExakZ4x8bdFmFR7astcuMoIzExzuQ5/sP7BO2z0BRI8YYCqY2EAGdjpQkkZSC/MK5NvF+uQYS7xbQDnYlhUcxIMa2A2vGGNvw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHAPR12MB999248.namprd12.prod.outlook.com
 (2603:10b6:610:2ff::22) by SA1PR12MB5659.namprd12.prod.outlook.com
 (2603:10b6:806:236::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 13:44:19 +0000
Received: from CHAPR12MB999248.namprd12.prod.outlook.com
 ([fe80::4972:8062:d74e:b205]) by CHAPR12MB999248.namprd12.prod.outlook.com
 ([fe80::4972:8062:d74e:b205%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 13:44:19 +0000
Message-ID: <e936f9aa-73e9-484a-ae9d-6143ec8ce029@nvidia.com>
Date: Wed, 4 Nov 2026 14:44:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v1 1/4] net: devmem: pass net_device pointer to
 net_devmem_lock_dev()
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
 <20261103232659.1340283-2-almasrymina@google.com>
Content-Language: en-US
From: Dragos Tatulea <dtatulea@nvidia.com>
In-Reply-To: <20261103232659.1340283-2-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0199.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::16) To CHAPR12MB999248.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CHAPR12MB999248:EE_|SA1PR12MB5659:EE_
X-MS-Office365-Filtering-Correlation-Id: c5b63d90-8c51-4465-b326-08df3a79b98b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|10067099003|18002099003|22082099003|56012099006|11063799006|4143699003|261026121527099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	qnpshwTL7SkmZrJHafFYCUiogH5PC1hxf/7Uj7Yqppjl8bIHWySjvlS75f+eoa3Llm44sQ5QucGOrdhctKAwGhrACoe1Zja/FsNbBXaEXolvNHK64wHsTdo8HbS8JZfeP4DnSMC6NV0HrVv7UNc1acCs5GCBP9V3kU9zwDrj2mT/GtEs/MC+SiS+EY1R2AP8V7imLqk7quUlqohEMRbXtjF+G5xpbfa7Qgh2cy2k5rqLQs/xRpIwQ59fmGNQvgsr1MEnKp2yiAANWxluucsqLiHRgG9jc5qQpeHoDTA2yjMeT6PLZZ3R5QLPebBTUvmA2yfQZgcpGRZgNrKQXu6ZKg/OOzIeKjJCccCcj73iux5BPVpnll72v2falVh1fKfHssKcATnHka8ieY4KJSoUsyJoQ2YNXoq/m457Lb3Jw548VAgKNv7xJc0QgVPY6O6VDNx6RaZ70E4gD8ApJKqw98hzVWUyWhvzeroZQHYvlijo2izdfUtoxSHB6pjAyq0Uzb9gxS8oewM2RQsmPLGh/6YV1cYf8zkHwLn9QUaFnozeP0C6eFHD6w40+XdGDUQXXYQDUMpKHDXntO1hbcvKsBODzerxDiU8d/NUi20HQCcl/BVsL81g5mwd4stGVfQsg0crZQ0XtyHhAAbL8ZdHfavMagVSNu29oa2Us/CBEdY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHAPR12MB999248.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(261026121527099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDRCay9aSmMzQi81MFk3bGVCUFpiOUNXenM2ZHFhdm5xSE1tU3VQc2RVOFow?=
 =?utf-8?B?M3pMbXZmU2hXSnJhM3BlR29qeDkyQUpoVGpiTll2NmphSGFjeGdtTkl6dnhr?=
 =?utf-8?B?RHgrVWtxbVoycENENkszRWcxaFg4aXAyM2JZTUNuMTN1eXIwZjJaNEdxbVNO?=
 =?utf-8?B?cVJDUFJLYnpMdXR4NDhxUi9MS3liZ2RzbU9GUkxUY29wbnRmMGd3MUNFc3Bs?=
 =?utf-8?B?N2s4L29wR0lsWURXUGo1L3kxNkc3a0c1V0gyWFRBTWdMYTNlZ2h5MEZJVVAr?=
 =?utf-8?B?UlgzNEQ4QUVqUGpmY2lQRlc5NVpUd2czNWJRbXIvNCtSTUhYTVRkSmVxRU1V?=
 =?utf-8?B?RjFvSkJBeWlra0NRL2lrQnYwZ1B2MlRpcW5iNFZIK0w2LzlxSEdQcjNmbDlQ?=
 =?utf-8?B?TnBLM0dxRGhRTnRPL1VMQ0huRERCaDFpZS9LWFZRUzA2VlpDUFBDQThEdSs5?=
 =?utf-8?B?bVpWZVVVRW9JSEhGdEU0ejVqaVRSZ056UTREM1hsaWpQWUptUEJiRnlnT29M?=
 =?utf-8?B?VVUyUkJabnViM2dLSFJNa0RKUTBBdS9rVmNaMURIdEcrZGpuUmF4M2dsN3hk?=
 =?utf-8?B?VFpNOHd1cjV4QkMyWGdnY2F5Z1l5ampZMjI4QmY2bDAxV1ZDQXM3U1JPaU1B?=
 =?utf-8?B?L2RrTHBIVDRuNlRDbTV5alFpTUhVVUFJV3VBRjduQmN3eitEOVM3NWZ1ekdS?=
 =?utf-8?B?dUh0M2VuTEdNeHRMWFRhVDcxYkNvU2cvNWRWYVBSUVR0S0RabWtXallLUktY?=
 =?utf-8?B?dnVLUnhZY1kzYlpSa1cxSGJDSDd4c1RKNG5mTUVHKy81QVhrdTRDK1FUZU5p?=
 =?utf-8?B?LzZNWTlWRkVFTXJBWWliOGpoNHFFS3c1ZjV5YnVYSzFFang1bm1TczVDVnFk?=
 =?utf-8?B?VUhLeWlVYWpZYVV4TzhzcktHY0VKRWVJbEZBNmFaVEFVQW1rVm1NdEJJSjdM?=
 =?utf-8?B?bFFyc2JTU0djN3hrZG9idUNmZ0pEdXl2NHRRWmh5YzRoN3B6bExoTnFnUUtX?=
 =?utf-8?B?d0ZpQnVIbldINWQwTzc3UElrMmhxV3ZiSko0a3c5OGsraURaWFhPSTh5ODRm?=
 =?utf-8?B?WklHTnZ2MENTYmErQ2ErZGh5bXVxQ3J6R091M2FNN0ZUQ3c4QWRiU29GNXZC?=
 =?utf-8?B?bXZJWXVVQWpTTDdXWExqU25CQkYxdEFsakx1TWlFak9nSFlKaUd2V3hjaEo3?=
 =?utf-8?B?VmpJSStnaGRzUzJ6ek1CNWpCTWdDZ3EvNzB5Um5XNFpHVXE2SXYya0tzUzNa?=
 =?utf-8?B?RTZ6WDBBM2JXSHRmZnNUWUQ2cUFqNUFYcnhkaTNEQWxkNFpBbEtJWmtNNmxl?=
 =?utf-8?B?ZUkxRW0xbitiUUFUVWNYUTVoeWJIMkF3U1pLSkd5TzB4SnA1SlZjTVZteFdP?=
 =?utf-8?B?Vm1VWVFCZUIvR3Zad3hwMHZhVlVLSVVqem02Qkd0eHdlazZva0xxb1VSYWVo?=
 =?utf-8?B?ZGtSUktUaWhXZWxnbUMvdUZrWk50Sk5JZ0FUZGJUUktSS3JFZ2podWpqNyt1?=
 =?utf-8?B?RWMyK1FCSDEzUzZpVVE5ei9xY2dSWm5DSkFFdEQxbEJYNngvazZFK3FQUjBi?=
 =?utf-8?B?TFdsbTROaXZ0Q040ak95djRtVVpZQ0UzZ2lLU00zV2FyNnZoTzhSelVNUHlv?=
 =?utf-8?B?QWdYWGprem1FNmMrZ2pXV1ZTMFMrdDkwWEk4eGFRcm5TZWo3akNkamR0c3Y2?=
 =?utf-8?B?NTVwZFE5bTk4N0djNTFVUGtMWnNNZmFUYlhqMldJV3VEYjc4NFd5bjBzSFA4?=
 =?utf-8?B?ME1jQ202aDRVaUlDSXI0QzdkVlZYczN3U1c2SXZ3WURUZVRyNTVWdVRxRUc3?=
 =?utf-8?B?a0JKTTZnQzIvcXQ1VFB4UWRKZk10WmJJRDhINTNZVkFzcVVLYWY0c21aNFhH?=
 =?utf-8?B?WWpreVI1ZURDQ1lGeW8xcUNsNHQzZXBobGR5azlDZXJNR3JXZFZYOEVQWGRt?=
 =?utf-8?B?ZGZtdVBFZE9XbFRDZEtnT1o3cFNIMjg3S21ieFJteUdXeHFDa1lsTGk2dEQ2?=
 =?utf-8?B?bWNRcGZCZEJpL2VtMFg4WVViakU2ckVZVGxXTlNjNVhjSkZkQlN6bExyZVlW?=
 =?utf-8?B?L0haM0dabHNNeTVLQXVWSjJ1SGhseExZUWQwMFh5ODFsazlWVlhDYmhaSmtC?=
 =?utf-8?B?NHIrSjN5OStQaWN5dWNhdW93bzFrWE5YSGFqWWtWbXBDdWlrbjVKWEZkUklK?=
 =?utf-8?B?d0hzcDN3eW1pUmE4RXhoVUVyZHdiN004emNpc2QyLytJVGRsSEZRTE00aHdY?=
 =?utf-8?B?RTk2eDZObXA2L2Joa1c0LzNPTFkxZmpKc3g1aFJUZzBiWis4WFhFaHI0aVRX?=
 =?utf-8?B?cXZQUm1PTWRuOXJiNWdWOGZZRy9FaTFoUE40ODNGYTloZ2VxcnIwUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5b63d90-8c51-4465-b326-08df3a79b98b
X-MS-Exchange-CrossTenant-AuthSource: CHAPR12MB999248.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 13:44:19.0027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RnThbpHreKkWM/u8EnoIZqNIY4UEmOyrktp9dhQdRGAJ21CqAfeXND5lJhxrPwb27rSSJhjPXaTY7PpXZzbTFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5659

On 04.11.26 00:26, Mina Almasry wrote:
> Upcoming changes for leased queue support will track the physical DMA
> device and the bound device in separate net_device pointers on struct
> net_devmem_dmabuf_binding, with different teardown paths locking
> different pointers.
> 
> Generalize net_devmem_lock_dev() to take a struct net_device **dev_ptr
> instead of struct net_devmem_dmabuf_binding *. No functional change.
> 
> Signed-off-by: Mina Almasry <almasrymina@google.com>

Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>

Thanks,
Dragos
