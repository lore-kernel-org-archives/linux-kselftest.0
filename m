Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795101669;
	b=TnXuJFd5a3lACxsvomIVkapdv1hZcZRm9UzVqExLMbUYomY9js3qTdoyRkRiILo7l/jS
	 e9S6Jlxt0ongw1inhf1hFjFUB2tmWBon1BvBYTPu5YLKQwbfHE59Ys0oc6CbWY4PUN7Aj
	 xqF2dwyC2N9xVKSdjKmbdBR+LG/pVgvLty7STlE3At4Cfv/dMno7eL3DclqDq0GXVDQmM
	 Te4NghGVf0kqiyx9+a9liuFqKSDjRZuqUpAxatTArMkZht0XXwQq7yV/LneVFJHXea7BN
	 riiJkcZD5I09QXmPeibLZlgRRG4N7wy73FEEZvgf6knS8050uIiRcwLH5/VQgXZToIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101669;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
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
	bh=N8tB/GhwDwM6d0k1uE9b4z/VL8h45xsGeWq5vZWRQUc=;
	b=UC/Zc90FCvGpzvNZ2Nd6Iry9+mZ4w6qlLWwHs8QlM0GY8fdZgzZZ7zcV68BrR4EglC+r
	 wEYl5LIZExclGImK8wmZY7FL1YD8+uCFM50QFJZRIgH+hzUbJypBiKeGhdfum5xoxuO0R
	 RMvrSQh4LRxWesxdyeoyL9rhrIDP0hlbH9RVJWYwyciH46hFlToMngEPA2WPrzTaJjF2b
	 1iOy+6pEQ+3rPkhCZfUoIsFTVTBphLtMpXQ0+PSFlql98zlIcigCbecQWFrq9NHL+sgln
	 ilrGWQ5AC3h9jR0kkQh5vsdvYhCfyjBCcbgwK2rHbwbHCp7RLX0QP4cbCcUqhsvNPlg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="JvzSOD5/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.43
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010043.outbound.protection.outlook.com [52.101.46.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063E3606A325;
	Thu, 19 Nov 2026 15:21:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 063E3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=JvzSOD5/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iMlMfUANyKx73emqMYKldPhDYTcQhvB8QUUACnJbBJgZUt4dRYnxggaA/+p2brdFQiuctnud00dkzRNjXy14L85Ajfe4BQluqOdmScZEsyE10IV7PnK+2HtQ1VaopdTN4zrFOXFkXz5F1UnVfX7DhuAqFcYoiXF10n/HPbbojQoodCELPNQ2J6H6oTKnQPgmFBWwB7nsiboHOND063mDVap9KlqZ99amGjfvZ6Cm1FhdVs52bWx54vCthbHXQ9fTEwnic4IhH2HtIBwoq5ByI7dAbGoWoEPZVc2ktnYmL/hQYQPx8nOVzCJT38oJC/dachDb0hwPzODu43079ozW7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N8tB/GhwDwM6d0k1uE9b4z/VL8h45xsGeWq5vZWRQUc=;
 b=HLviVy6XbeAmGGvxQgY0pEQ6JEduWdvc1Ay6X0jMr+DeF2rsM3aSlyZmEFeyJgXfrjkzE2YLNmT7ce+WKBcjc0DJdxs82rEjJnzHDyH8pVHXhA/3J5n/7FTuwVXoXjP7G/q71LlNq2TVrNrY89OC5cKKWAyDCZk1neG2Gq7h8gACaqSHxFFVAQkeZNk382V/Hi2gYSRN5fth25ekdtDmdQaHQdGxpZwMfeqJ0+Xki/Qw8Ebs/i+NRRyVS86UcU89mUKjpgxvk8/KjlzhdsnPwbRyH13361Kaxktg3I5ov6mSb2OV4m+TXi6KJW2x4L7gJLp8uYkaXfMIfA07wW7RfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N8tB/GhwDwM6d0k1uE9b4z/VL8h45xsGeWq5vZWRQUc=;
 b=JvzSOD5/86O4pMI9UKSktfe2mlr45L7HucK/m0YNwj/DEmQzfOHQohCNkvgfSynUedzZ2gWjqetmjgwED63IpIktCLTMC/kET+fANFXBPhe97tWB6cHviQELFN8+ivKWXWAL9yQ0RH8dfy7P0cLNyKI9euEPcSaNJXNjlDgzY9JiUx4ciGnAKoLWgmVwjTI5FzlI1H05fQqDyErZhQG0GjPp/QP+UGe93F38BHo1g2zlm6FysRTptYPOLk3JBKri0JiJL46grgfFVh5FyBr+jyLXLtH6V5hoj1Xj4XgNTdksSeLNoNweKRxdM0NGIDYTaozY1cHi6gtY7EZCDVZ+WA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by SA3PR12MB7924.namprd12.prod.outlook.com (2603:10b6:806:313::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 15:21:05 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 15:21:05 +0000
Date: Thu, 19 Nov 2026 17:20:57 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: netdev-bot+sashiko@kernel.org
Cc: liamsmith827@grapheneos.org, netdev@vger.kernel.org, dsahern@kernel.org,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	liamsmith827@proton.me
Subject: Re: [PATCH net-next v5 4/4] ipv4: replace obsolete routing comment
Message-ID: <20261119152057.GB1980872@shredder>
References: <20261116202741.13106-5-liamsmith827@grapheneos.org>
 <179504451061.3136.1731007912948900423@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179504451061.3136.1731007912948900423@kernel.org>
X-ClientProxiedBy: TLZP290CA0003.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::17) To LV8PR12MB9407.namprd12.prod.outlook.com
 (2603:10b6:408:1f9::13)
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|SA3PR12MB7924:EE_
X-MS-Office365-Filtering-Correlation-Id: a26a8d7c-d406-4438-54b5-08df4650bab2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|261026140227099003|4143699003|11063799006|56012099006|5023799004|261021121427099003|261021135927099003|261102123227099003|261009223027099003|261028144727099003|261022105027099003|261026121527099003|261022075727099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	jiH1Om8C1wmRnSMQFqbkPx7QYzc49WLL2wYQ2S7VJDKj/RfYvnxqDjZ+zCsqzRX8Y7F48hTAgfhcDXsQ6dFnIazYEE/58IAUTsAEa9VSBD429e2m7b2m1BQZOgQPdBU2ZR/i17yzSgK3KS2NihBuf8ypAImr9xM0eM737TKhpe7kcjZOLGQmpfDptagbovC/+OuvYV3iBZ9EbVR/XwjCfe7PNHngKn187lSjdDTn/zosVR1c5VcTYTKwsTnVD/upzUTHKCLs5uMxzrZtxUMDD08W0T+QOgcwXPm0QM4/riKl44I7Fhyd7wbVJucHJncJpLPiHM6MM+poR1zI/R2/Dfv2g0Tsrke15nRtX/DRDldkQXOOrHQE1ixr+xrascBQXhHdAVw+9BKMDy0CWljC0uzVANgDXHdhE37rhmiy6v5QoF+D+XHu8axQhIE3lubbjiH/oj4r985nscE3271bvmQXhq0KtDCe+5AH79cASNTEUl0S+qaTOTbSFogXVYrmY/9ax5wHUC7dNWN0DbY/P3EoLfLMo1YbT+5MpfO0JPXuaWeod0TXJa8eIGS+htdkwOCXdZy9RAUFmjnHWPRVAfHCHq109V7AWWMVd4cOjNmwnetMnYYvqOKY+Zh5VWw4t73JYrp+N5smqB6oy9zEFcnhCmiMF+a+ED5t1AOcXAY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(261026140227099003)(4143699003)(11063799006)(56012099006)(5023799004)(261021121427099003)(261021135927099003)(261102123227099003)(261009223027099003)(261028144727099003)(261022105027099003)(261026121527099003)(261022075727099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wlp0elN5SVI0dFVhQlhMTkJXazZwS3JPMFRXRUFYUWlvdWxvajlMclRURkhq?=
 =?utf-8?B?b3JFbXJEZ2hCVzd1WlZ1QXorZXRqWDI2Y012UDFzNTZXR0htUHFQRGd5dGY5?=
 =?utf-8?B?VUQ3NlBNQWxIK0ZDSVluK0pDOGh5Yk9PSFlsQjI2M3djYWorc1kxQUt6UWsw?=
 =?utf-8?B?SXlCUFArMnpLclBUU082SmtUS01jWWIxOFJHV09jMVdFR2R4TlVGcmpVeERP?=
 =?utf-8?B?TXhZZlpzeVBlTXVZYUg0V3RGMGhoeDgwRXBSUUt6KzN3UVQ5eDJrOUFySFhx?=
 =?utf-8?B?Q056Zm5xU2JZVTFaTHhnbU5pWXBzK0QybWlSNFhlcHVBOHRWNGpORE1uOUJt?=
 =?utf-8?B?L1BjS3gvT2JSTXVSdmR3czFEdkRiaVFhb2RjYkNsQWZBZFRkdTgvVVhjSGlr?=
 =?utf-8?B?ZWZ6dDExZHlqTTJvcEVjTllmUnNiS3pROU1zTUJWSjhVdGd2K2tJbFRWWnd1?=
 =?utf-8?B?LzJUOG9QL1JsWHdmVGIydExuOEJJQ3RBemxzN0FtNFJQN3d2TDFSMGNZSVFz?=
 =?utf-8?B?YitOY0thV2FQMStuQzBVYW94SmlJWnpLcFIzY2VxVk5lR0lHdXpoTnNMck5o?=
 =?utf-8?B?bWJzSmw0cnQ1Rkxuc2diNmw2MmwvblkwSmF4VXB4UlZxaTZSNkFGUC9OSXFK?=
 =?utf-8?B?ZlpnVjhzM3VSdHdwN2RQbk1YdWJHRk03SXJPSnB1UFU4U1htdjZPK25sNStl?=
 =?utf-8?B?NTNpOU13b240aGplajlnRHN2R0dad3J3M1dUMWJGYkM1SkMvRTU4OVlSUzNE?=
 =?utf-8?B?VVdSSm1MQVlDQ1B5VnZFTUtKRXNSYXBjcVZSZFFaWlB5b01XOERXd1c4SlZm?=
 =?utf-8?B?MnNHMXhES1lJMmxSQ3NsVmRiMWZhY2xmelRGdk9zUTFDMzVVdElnc1pDV2Z1?=
 =?utf-8?B?ZnpKVnA5ZktjL1lQeTNYSWxzcGJQUUZnU3BaMXp1dlVDU3p4T214TTZoQWxx?=
 =?utf-8?B?R3F5MUppMjdXYzc2aDIyR1VtaGdmUytTeFBtdnJYMFZTZkFZSDA4Y2NhbldU?=
 =?utf-8?B?NjRtZG9NQS9QT2NaaWpYQjhmaXNFMXV6c3FBU0hQMmRwMlozVFU1SlRrUGhW?=
 =?utf-8?B?QVRSMjc5VktRUVFHdTZLME9ST2hLZXR4UHNVUllmM092ZVdna3FMRjZJZ0hL?=
 =?utf-8?B?VkR4VGN6UkgwbXoyVHhMYmtvZm45cXVXeHVrVGVMZHV2b3h1TENwdUVCNStz?=
 =?utf-8?B?UjBOcVVTdEVxS0gxb0FPWjlaRGJ1Vmt2S2puNmtKRzlPbTcrTlVYN3VadXVp?=
 =?utf-8?B?dGpkY0VDRFB4ZnBJTHJvQzdiQ21vNVB5MU9YNE5TR2x5Ui9Tb1VuSmNDS1JC?=
 =?utf-8?B?aHNCeU1jaUdSRk5XbEpQZmlVU1F3a2RsL3hRWEJ4L0FUaVZHd0g0TEFqWDlX?=
 =?utf-8?B?KzUxUWtjUG1qNXZMZzkxcVd6em9DdytFNlp4NHVDS2lzQkY3em5adWIwRDZ0?=
 =?utf-8?B?cG5Vb0h1NU9VTUwzTGhSU3RPdWhKNEdkczFWSHhaTzA1S1Qyc1gyVUZlSmhR?=
 =?utf-8?B?U3dNbXRnamZtNk5PbzRKYm9uV1h6R1Z2aHYzMHh5SWRqWFNEUThYNk42TTNH?=
 =?utf-8?B?azVvQmdrQWxDRTExUGxOd21RUkJrL3ZpYUxCbjZtRmFLbVdFYUsvdmtmZ3ZZ?=
 =?utf-8?B?eVJIakZTSU1TRHJvTGtQdlNxZUFnalZQTXB5bi9hc0Y5VVBISnAwTlVESEZK?=
 =?utf-8?B?OHlSd21JSGlMckNVY2NqcmhRSDU4d3hucmxwK0xPVS9zTjRSUkFCZXZRblRF?=
 =?utf-8?B?UHVqdmhhVkYyYjAvclNrQVRIblBaR3d1RFQ3a0lCb210djExYUVwUUhlVmNY?=
 =?utf-8?B?aEFMY0R6dDVPYlNVMmh6cmk4UGN5WW5KOG9QNjFGaFJ6WFhOQ2IrZFFMRzh6?=
 =?utf-8?B?SW5yMGNuSjNpQ3FqTzFkcVNYVjlRL1V6U2ozckJvZVF3NnF0WXNQU2sxZU9U?=
 =?utf-8?B?c1g1UWdNSGd6N3dpT2UxU0xlVEt1anFqY29nbUlRMjFDbTFJeXBoanJ5RGRl?=
 =?utf-8?B?aFlvVGNRQWJlVmtZazVOc09sUnEyTC9EYk0vS25oTU1mb21BUWlBUHRlcU1V?=
 =?utf-8?B?QW5EUG9UQXA1bG5GME1GQ1hON05SeDhCOTc2UlBPb3RXQUpoQ3VLeWFKbjRy?=
 =?utf-8?B?NkdQMEhlckkya2J2bzc5Znc5TSttN2s4VkM0V21ZTnMwQnIxOWl1YjZsMkdw?=
 =?utf-8?B?NmVqY3BwcDZwTFlNYmIxa3VzeHVDaDRycmlRYUlSSW8xQXZaQ2p4UXpici9N?=
 =?utf-8?B?VVo5V3BXY3ZtU2hkMnVocGhZTEFucEMzTm1IVmdlR29LSmQzMmlpYmgvb0lE?=
 =?utf-8?Q?7OIGMYt2VC5ABquSwL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a26a8d7c-d406-4438-54b5-08df4650bab2
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 15:21:05.4640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cE3K4eEtEEtGEy7qbWRtT+X6YTvfDhDw6xAVdD+KdwYRlvUDrX9U8WCwIQRnSjwWo/WU16aivQ6rJ9d42dzdqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7924

tl;dr - I believe the patch is fine as-is.

On Wed, Nov 18, 2026 at 11:28:30PM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] The comment this patch adds in ip_route_output_key_hash_rcu()
>   (net/ipv4/route.c) says "Non-vrf unicast honors restrictions"…
> 
> --
> 
> ipv4: replace obsolete routing comment
> 
> This commit replaces the comment above the on-link fallback in
> ip_route_output_key_hash_rcu(). The commit message says the old comment
> described obsolete fib_lookup(), MSG_DONTROUTE and IPv6 behavior. The new
> comment explains how restriction routes and lookup misses are handled
> when an oif is specified.
> 
> > diff --git a/net/ipv4/route.c b/net/ipv4/route.c
> > index b71443e4b522c..d0930ae4c5ae6 100644
> > --- a/net/ipv4/route.c
> > +++ b/net/ipv4/route.c
> > @@ -2866,24 +2866,18 @@ struct rtable *ip_route_output_key_hash_rcu(struct net *net, struct flowi4 *fl4,
> >  		if (fl4->flowi4_oif &&
> >  		    (ipv4_is_multicast(fl4->daddr) ||
> >  		     (!fl4->flowi4_l3mdev && err == -ESRCH))) {
> > -			/* Apparently, routing tables are wrong. Assume,
> > -			 * that the destination is on link.
> > +			/* When oif is specified, fib_lookup() is called
> > +			 * primarily to determine if the destination is
> > +			 * accessible directly or through a gateway. It also
> > +			 * checks whether there are any traffic restrictions
> > +			 * (blackhole, prohibit, unreachable), or if there's a
> > +			 * routing lookup miss.
> >  			 *
> > -			 * WHY? DW.
> > -			 * Because we are allowed to send to iface
> > -			 * even if it has NO routes and NO assigned
> > -			 * addresses. When oif is specified, routing
> > -			 * tables are looked up with only one purpose:
> > -			 * to catch if destination is gatewayed, rather than
> > -			 * direct. Moreover, if MSG_DONTROUTE is set,
> > -			 * we send packet, ignoring both routing tables
> > -			 * and ifaddr state. --ANK
> > -			 *
> > -			 *
> > -			 * We could make it even if oif is unknown,
> > -			 * likely IPv6, but we do not.
> > +			 * Multicast is sent regardless of restriction or miss.
> > +			 * Non-vrf unicast honors restrictions but allows
> > +			 * oif-bound sends even when oif has no routes. In both
> > +			 * cases the destination is assumed on-link.
> 
> [Severity: Medium]
> Does "Non-vrf unicast honors restrictions" hold for senders that do the
> lookup at link scope? The commit message also calls the old MSG_DONTROUTE
> remark obsolete, but it looks like that remark still describes the
> current behavior.
> 
> MSG_DONTROUTE, SO_DONTROUTE and strict source routing all make
> ip_sendmsg_scope() return RT_SCOPE_LINK, and that value ends up in
> fl4->flowi4_scope:
> 
> include/net/ip.h:ip_sendmsg_scope() {
> 	if (sock_flag(&inet->sk, SOCK_LOCALROUTE) ||
> 	    msg->msg_flags & MSG_DONTROUTE ||
> 	    (ipc->opt && ipc->opt->opt.is_strictroute))
> 		return RT_SCOPE_LINK;
>     ...
> }
> 
> fib_table_lookup() applies the scope filter before it checks the route
> type's error:
> 
> net/ipv4/fib_trie.c:fib_table_lookup() {
>     ...
> 		if (fa->fa_info->fib_scope < flp->flowi4_scope)
> 			continue;
> 		fib_alias_accessed(fa);
> 		err = fib_props[fa->fa_type].error;
>     ...
> }
> 
> By default, fib_props[] gives blackhole, prohibit and unreachable routes
> RT_SCOPE_UNIVERSE, so a link-scope lookup skips them. If no link-scope
> route covers the destination, the lookup returns -EAGAIN. fib_lookup()
> with FIB_LOOKUP_REPORT_MISS then reports that as -ESRCH.
> 
> If an oif is set through SO_BINDTODEVICE, IP_PKTINFO or IP_UNICAST_IF,
> the condition above is true. The code then builds an on-link RTN_UNICAST
> route even though a prohibit, blackhole or unreachable route matches the
> destination:
> 
> udp_sendmsg() / raw_sendmsg() / ping_v4_sendmsg()
>   ip_sendmsg_scope() -> RT_SCOPE_LINK
>   ip_route_output_key_hash_rcu()
>     fib_lookup(..., FIB_LOOKUP_REPORT_MISS)
>       fib_table_lookup() skips the universe-scope prohibit route
>       -> -EAGAIN -> -ESRCH
>     on-link fallback
> 
> None of these steps need privileges. On this path, only FIB rule actions
> such as FR_ACT_PROHIBIT still apply, because they are not filtered by
> scope.
> 
> Could the comment and the commit message say that link-scope (DONTROUTE)
> lookups bypass restriction routes here? The series aims to make
> restriction routes apply comprehensively ("ipv4: restrict on-link
> fallback to lookup misses"), but nothing in the series documents this
> case.

This is the same comment from patch 2 and the same reply applies:

https://lore.kernel.org/netdev/2503cfd2-5629-448f-bb9b-111ea239efb6@grapheneos.org/
