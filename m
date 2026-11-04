Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793800498;
	b=f7JSUwMZ1PMl9RuzDA11zQJVSuL0qBldNp6xhPKL3SYETAFXymJdxrAFvvQifLpRkIGO
	 WJC+XGnRI3spe5teNFlDxgQMNGuBhqWtE7xVnohyuV7woDfTH4i49ULu/V8eu+vH6Xq41
	 sRrtrL8QvRfUI8EV7D0y+UU7ZzANk9lYM4QDBG24N+i8/FoxCskG32tTqGn3w996e7oBg
	 Bh5Q7FgdIc0/Zkij1xs/uiOsfLfOvGV7d/3qNQEfm/G1CqpSkoCBJxxvniLSAY+pUvOK8
	 73iiyp1uq6RzwfbdTHuAEGHQW63umIpYwmTEpAXJh0Hat4ZZf93WboW5ImTNUOQjDfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800498;
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
	bh=+qVxW14CkEDxIo6SXHzuqGodofcLUUto9uWFSe5aBFQ=;
	b=if9Du4P+vbDVv4eM0Y4Qf1iHFkBvRlouoAxp9sULxqptjcRrukRYKISjPwicR6dpha9M
	 36tVsjS9Hps2lRuvSD01YaPQjDhR9Oo+CT3wVqxsPbZF3w3KecEydtUapv/rPerVhkZ39
	 23owno/YYnf1GWeF/69VIxT/K21Xo1dt/nXoTAJg29o3Iwzo5sCiX7GU2N+YB/oMyPOPp
	 iBI/yFx/owKBsNPQl6jodIzOQRwjOqOFRcVewaNUVIuWJXFRdoJAixH0bG8Nlu5bfUM43
	 JCNiKdGm3Cew/uTefKN3BiK+kd8RtEObt19bHLAJ1F38lY53IaHrwXKxZmcbAnnCUZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="loVSK/Dr";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.47
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012047.outbound.protection.outlook.com [52.101.48.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44CE606A31B;
	Wed,  4 Nov 2026 13:54:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E44CE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=loVSK/Dr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s7VtBT1azElKozDlveZQkXFzG3KhUBPX17eYBA83iGwbxHIOLvraodF5dCePMKypo2Elz/ifWP7C9ayKwWt/S1i6vakeC7845NPOv6XXL78IqZkfp8yLaw6YyIXJDJ42EmzX0MBxMx8eH2QftpYxNJqGBBVBBH91qhRWB+SV0GTjpSETwI1/4+IoFj2QF1+WRYhDqpsMqQF1OwzaVVUSXbY88qSy62vAJm5LR8DM4CGdSRX5wLZA85HJ92+KnUZSok2YzTIoYlI30WHvzyfIvYKMKG1ejauaMxAS8fsLpPpP6eqTezMZmOWqmyY+Lue4hdRyJV2Cxc0ra0GOrhwOOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qVxW14CkEDxIo6SXHzuqGodofcLUUto9uWFSe5aBFQ=;
 b=Hp8+g+bU6TMYDt2v0xdEZsHgg9LOrZbN+yBGbynNm8Twd6ZZ3KOLRc5fSyT+6bb1lszZjcAwtPdquxVvj6TSa488w6ZTY/iO6AQs54r3w/8kiC43g2vJ5d1ZE5pN0e6ETPOr27WZ4X49o6GrWDw9DCRh9cLum2oxPtxfonaCAQc7nwcXFcDW8fNGiL/77EBHQ+kkqdVthzh471ZHyBQYnwXDtgAP5A37Bv/zQpCeQPFy+f6xXkPi/XxMspcPfXa3E8Pnt6qHr2i/B+jf3FKK7ZFO+PgIhvdzuQ/XaaWRo9toPjaBuel0/DMS2Zpm7XkW5ZgxJGDG7LS4dAhSq8tYBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qVxW14CkEDxIo6SXHzuqGodofcLUUto9uWFSe5aBFQ=;
 b=loVSK/Dr9kAdmGPF0/BiZxOTAaIq+zWxhCBdftJjCRLwMBzjzjQ/4bMFGfruvwVQAOY8Jxk/IKC0UbMKfI03Y0OROpa8n0KyZ43tgppCNMIce4L1XxYTI+xWCCgNtQ7tFm6hgYFza81/313FmbkaOaogKuoo9c7qYVFhVkWLxqIvcxvDEtx6UH2PZvAWFCIh/iCS6QTuiGZD4mECLEOAuK0WONWiv910+pvk/aBUBue2QEatU+zkypVJJq+/XPYmyc/ZR2/0VW9zFZ5uWkRZhtQojMPuSgE/4ysos2Id3xxqcF8Iy1v8HgvOX2sGxpf13jr4mft+zYGtvaaIfmDkrA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHAPR12MB999248.namprd12.prod.outlook.com
 (2603:10b6:610:2ff::22) by LV0PR12MB999069.namprd12.prod.outlook.com
 (2603:10b6:408:32a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 13:54:54 +0000
Received: from CHAPR12MB999248.namprd12.prod.outlook.com
 ([fe80::4972:8062:d74e:b205]) by CHAPR12MB999248.namprd12.prod.outlook.com
 ([fe80::4972:8062:d74e:b205%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 13:54:54 +0000
Message-ID: <830ad483-2da4-4e73-8a20-7b05f0959078@nvidia.com>
Date: Wed, 4 Nov 2026 14:54:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v1 4/4] selftests: net: add leased devmem RX and
 TX netdev unregister tests
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
 <20261103232659.1340283-5-almasrymina@google.com>
Content-Language: en-US
From: Dragos Tatulea <dtatulea@nvidia.com>
In-Reply-To: <20261103232659.1340283-5-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::15) To CHAPR12MB999248.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CHAPR12MB999248:EE_|LV0PR12MB999069:EE_
X-MS-Office365-Filtering-Correlation-Id: ab43d99a-fd53-4e74-43f2-08df3a7b3492
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|4143699003|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261102123227099003|261022105027099003|261028144727099003|261026140227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	5wlN9sd8nNLTYdsIbBwN1DZ8xCcEPTK9C77ofP3CMuG/gjRmY09/+oMddpBGOToitZD29ONsxN/A5LN5MNVVjfVqjwbIjAsZKbeCosUMUsKhu2ACiGMvxMS0Fgw6aRLbfo3XCk85NXJ6PeP9oPz6X+DD49BKUHdwyjpiBq7ZNNOg8981ZLaKbnjcYNSsQzl+7yRIx0lpH6VSBGHixxJ3f+NrKS+Wvj3QpyezR4UK+bXWsGPlzZLXE1Wd6piuYnOrna5/avUW1uO9Qhm9oDxx1rV+ZAh2P8XjG1FryTVdO8oRVAZpURNO6DCW8VJokJ82RSKMfJarJCNtFqg3N9/1CNxha55T4fD4KSYtjkqyWFx8juUPH8W/uX7VLI5htBsMcZBrRIlabABfNmIgfZbkDaIRQjuvtalI/JkOuA/nziOu23vLeHbBJh48BkTtWbziWh+QohdMweIvxM4VKrdtDj+QQ2l8ZBTFtklBbbLsDjx8OEn67xfTP5fTK/RQzGyl/0YCQNGAdGtsiQvXOuqkyY7nVMnark+INsLKv4NEEmpIi+cTTwRIacrbFw7hDwf05cOKFyoTEqJr+4estjHTSksMiitnTGLGajA9OOrpLVr/kZ64as3b9JWVgAGifGhnRwI/6Szxb26KApaAFBbz8XofRFuoHhG27V7BbyqxG0o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHAPR12MB999248.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(4143699003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(261022105027099003)(261028144727099003)(261026140227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2Fra0w1RnpZemJoZmE4UmdJUUNmMENSRGEzQy9RRC9rRFFpc2cycTFmWnp6?=
 =?utf-8?B?VWEyWmN3Qy81R2ZRZWYwMmVrQ2FiZnVPRVpjeFp4SWl6TTd2OWEwVTRycCta?=
 =?utf-8?B?R0hwaDQvbTRXWWtOQXMwNkYyQ0xiRVZ3NjdiYVlnRmRRNEYzM0Q4N2cyMG03?=
 =?utf-8?B?eHVzRHBSNzlZUGRTUHBKMTZKeG93Z1ltNitzY08zeWx2ODQ2RDd3V0d0cHcr?=
 =?utf-8?B?Q0lEd04wdWdpVjlBaVU1NGNRa0ZNMEJmVzRZbmNqVjhSYS9BdzhSYzF4bnlw?=
 =?utf-8?B?QzVrOEV4bG9tWUVBWFgvazVpZG81dUwyeSs1SjhsT3Rra1ZKZEJjekRrUjhS?=
 =?utf-8?B?ckU3cEhMZnNwTE5xNUJESWVRcGtPNHhoUkU1ODFuL1UwdkRvWFRWRnZWaHhE?=
 =?utf-8?B?OFR1eVZDM2NGWDd5TDNEMnJIUW50Y2pqdXZjRXpHaEROdHZFWUhoNzFEMUVP?=
 =?utf-8?B?Qkg0N1YwQ0psU3RIU0xqK1FNdE9sZG80SE8zL0g4ZmpnLzJuRlFjakpVdUtD?=
 =?utf-8?B?VFREOXZvWldKZUErSlVnb1dlWDBzVytKWEo4K01VNGh6SjN1QTc3bnBvSWx0?=
 =?utf-8?B?cjd3UlR3TnhiSW94emtSekpmd01zV1VZTmtId1NxMmswTVRkUXRBYkk2aysr?=
 =?utf-8?B?d29hN1ZpNDdJUktkbzg0TU5RcWNraEZ0cFUxMzRZNW50dzFER25OWWZUVVdj?=
 =?utf-8?B?NkVrdjlYVkxvcm1lWnd5d3FCZE1yVXVYREM5elZEcGlKYnRuY2RTNGpmSVVT?=
 =?utf-8?B?TkJNUmpaSCtiWDZzTWlGSHlWekVqZHVxK29qYWpzU1JyNzM2YkdHVjR4YmNF?=
 =?utf-8?B?SzJ6aHN0OUQ2WmhBSGJNdVI2MGtwbjVIUm1LTTdYbmlYL1VwTVFrQkFJdXpQ?=
 =?utf-8?B?QlhDYkRRaEQ5Umt5cnMwM21oWjd5OFlCTW44VjRkLzdHVkVBQUMvTDl6dTNo?=
 =?utf-8?B?L3JNOVRvQnR1cm4rZUFmQWNYRGN4MTk4enFBVko4NDVINVJPcXdhdU9aWTZJ?=
 =?utf-8?B?SXUvZ2JzWnJoYVVURkFBeGhXdjQ5bkkvRjBKWFpMRFdLbmwxQkNhLzJxT1Nj?=
 =?utf-8?B?SVFHbTVkbFhMMTA0TUx1dS9yanVtWjRGZHdwWGZMenRieXNDUlIrTGMvcHVi?=
 =?utf-8?B?bnYzWmFURGxrWDNNQ3VVOTV3cDNteDg0VlVRRE1FOEk1NmJIbGh6QnpNTjU5?=
 =?utf-8?B?Zm1RYWdGbFl0am9xcHY0NmdCQTA3UmFSeHJ0cGNTMjhvbm8zV2YybzA1NS9k?=
 =?utf-8?B?V0FJTENTTEk0YjN5WUNCWFJJbFlUWkUrMnZOd2JnVzB2bGxzY0F4WndPYnRz?=
 =?utf-8?B?YkphaGFjOWJ6c3ljNHhTdS9MNWdqdmtrWDdlYjhiQXVNOFJPR0FFRzFvZVFH?=
 =?utf-8?B?emQ5MjRLcEZtYmNGdWxMY2h0YUh4emhOamxaZDd6a1F4V2htakVkWm5mUFNm?=
 =?utf-8?B?dTJlTnh5VGd2VXhLV29iZDIvZEJLZ0Y0RHZpN09WVFEvTldzblA5TUppc3pB?=
 =?utf-8?B?ZjdFYjdBNTVPajZaR3JqellqZGwyOWpSMGhlam9CVVYvRHY0Q0xFYkhHTHo2?=
 =?utf-8?B?ZjRHbUxwYWdQTTNuNVRGZFZadVJpQzhCOE1YUG9jcE9yZ2FwUlUxbndSVTVW?=
 =?utf-8?B?cE81VncwMURLWS85dFk0YWdndVB3MHM1Y2tBSWZ6ZW44VlFqY2V1NVRiVWp3?=
 =?utf-8?B?OEJEa3ZldFduRGxNcDB4aU9lYklTWkpYbU8vZFVwd2tUcWdvTU5UeGxiRWh1?=
 =?utf-8?B?OG9PZmw0cmJkNXRKZVhhenQxdTBkZTBZNyt1OURwSFdoN1h5QnlJYm5HZzRh?=
 =?utf-8?B?RThHV3RSWlVLVDZ6ckh1UDByWHVRWW5BMWwwKzMzb3UxcWRsWDNXTEl6UGZm?=
 =?utf-8?B?bG8ySFNUQ211cXNNTWYvbE9mQWtaNFhwMHJZUGZoTmo1akJZYzdPeDllT0Y5?=
 =?utf-8?B?cUVCbElMdTFPUUovZXZhLzFRUExSeldkWnVVQkprN0NTRloxRHVDKzV1MUR0?=
 =?utf-8?B?c3RBVURybDduRGV0TEw2THBURzhTelRhMlBxZm5QSFZibDZxVlcxZzBvNFhP?=
 =?utf-8?B?RVZaWmdLRWZldGFXU3RuL0lJU1lVU0ViWlpPdi9YaHBuVFRkVjlyODBDUE1B?=
 =?utf-8?B?NFp4VFdlZXVnTVZjVGpiTmErTjNjMElMcFN5MG1YTmptMXZkMUdiYTliUWFS?=
 =?utf-8?B?c2RnT0lRWTY1Q25lUmljZmFLL0xLTnIzeEdqc0pTYm5JRUR0dHJ2NlVNa3ZF?=
 =?utf-8?B?ZG5tenM2QjlMMDhaTXVqT0JZbENlQkNzWHBheFBFZDNQb0tZV2h2ZEx1ejhK?=
 =?utf-8?B?ZmxMNGgzbU4rMThndUFnUW5RRHZleWFKajl6Z3ZPbjQxVkVaSks5QT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab43d99a-fd53-4e74-43f2-08df3a7b3492
X-MS-Exchange-CrossTenant-AuthSource: CHAPR12MB999248.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 13:54:54.8205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M8rtkLwGmTcx9brIrbOKdS9nWcrsC6Prlu4nh8gCsAOgpFtYS9HtyFD9d7TFc9gYQvfI1a8YNN5BGvmgP6E1WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB999069

On 04.11.26 00:26, Mina Almasry wrote:
> Add devmem_lease_bind_rx_unregister_check and
> devmem_lease_bind_tx_unregister_check to nl_netdev.py to verify that
> leased RX and TX devmem bindings on a netkit interface backed by a
> netdevsim queue detach their dma-buf cleanly while the netlink socket
> remains open, both when the virtual device (bind_dev) is unregistered
> before the physical device (map_dev) and when the physical device is
> unregistered directly (which uninstalls the physical queue memory
> provider and cascades unregistration to the leasing netkit).
> 
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> ---
>  tools/testing/selftests/net/nl_netdev.py | 132 ++++++++++++++++++++++-
>  1 file changed, 129 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/net/nl_netdev.py b/tools/testing/selftests/net/nl_netdev.py
> index dd0321c0b463a..fa4b5be093257 100755
> --- a/tools/testing/selftests/net/nl_netdev.py
> +++ b/tools/testing/selftests/net/nl_netdev.py
> @@ -12,8 +12,9 @@ import os
>  import struct
>  from os import system
>  from lib.py import ksft_run, ksft_exit, KsftFailEx, KsftSkipEx
> -from lib.py import ksft_eq, ksft_ge, ksft_ne, ksft_raises, ksft_busy_wait
> -from lib.py import EthtoolFamily, NetdevFamily, NetdevSimDev, NlError, defer, ip
> +from lib.py import ksft_eq, ksft_ge, ksft_ne, ksft_not_in, ksft_raises, ksft_busy_wait
> +from lib.py import EthtoolFamily, NetdevFamily, NetdevSimDev, Netlink
> +from lib.py import NlError, RtnlFamily, cmd, defer, ip
>  
>  
>  def empty_check(nf) -> None:
> @@ -483,6 +484,129 @@ def devmem_bind_tx_unregister_check(_nf) -> None:
>      nf_priv.close()
>  
>  
> +def _create_netkit_single(rxqueues=2):
> +    """Create a single-device netkit interface for queue lease tests."""
> +    ifname = f"nk{os.getpid()}"
> +    try:
> +        with RtnlFamily() as rtnl:
> +            rtnl.newlink(
> +                {
> +                    "ifname": ifname,
> +                    "linkinfo": {
> +                        "kind": "netkit",
> +                        "data": {
> +                            "mode": "l2",
> +                            "pairing": "single",
> +                        },
> +                    },
> +                    "num-rx-queues": rxqueues,
> +                },
> +                flags=[Netlink.NLM_F_CREATE, Netlink.NLM_F_EXCL],
> +            )
> +    except NlError as e:
> +        if e.error in (errno.EOPNOTSUPP, errno.ENOENT):
> +            raise KsftSkipEx(f"netkit single mode not supported: {e}") from e
> +        raise
> +    defer(cmd, f"ip link del dev {ifname}", fail=False)
> +
> +    link = ip(f"-d link show dev {ifname}", json=True)[0]
> +    return ifname, link["ifindex"]
> +
> +
> +def devmem_lease_bind_rx_unregister_check(nf) -> None:
> +    """Verify leased RX devmem bindings detach cleanly on virt/phys unregister."""
> +    for remove_virt_first in (False, True):
> +        dmabuf_fd = _create_udmabuf()
> +        defer(os.close, dmabuf_fd)
> +        nf_priv = NetdevFamily()
> +        defer(nf_priv.close)
> +        nsimdev = NetdevSimDev(queue_count=2)
> +        defer(nsimdev.remove)
> +        nsim = nsimdev.nsims[0]
> +
> +        ip(f"link set dev {nsim.ifname} up")
> +        with EthtoolFamily() as ef:
> +            ef.rings_set({"header": {"dev-index": nsim.ifindex},
> +                          "tcp-data-split": "enabled"})
> +
> +        nk_ifname, nk_ifindex = _create_netkit_single(rxqueues=2)
> +        ip(f"link set dev {nk_ifname} up")
> +
> +        res = nf.queue_create({
> +            "ifindex": nk_ifindex,
> +            "type": "rx",
> +            "lease": {
> +                "ifindex": nsim.ifindex,
> +                "queue": {"id": 1, "type": "rx"},
> +            },
> +        })
> +
> +        _devmem_bind(nf_priv.bind_rx, {
> +            "ifindex": nk_ifindex,
> +            "fd": dmabuf_fd,
> +            "queues": [{"id": res["id"], "type": "rx"}],
> +        })
> +        ksft_ge(_dmabuf_attach_count(dmabuf_fd), 1)
> +
> +        if remove_virt_first:
> +            ip(f"link del dev {nk_ifname}")
> +            phys_q = nf.queue_get({"ifindex": nsim.ifindex, "id": 1,
> +                                   "type": "rx"})
> +            ksft_not_in("dmabuf", phys_q)
> +            ksft_not_in("lease", phys_q)
> +            ksft_ge(_dmabuf_attach_count(dmabuf_fd), 1)
> +            nsimdev.remove()
> +        else:
> +            nsimdev.remove()
> +            ksft_ne(cmd(f"ip link show dev {nk_ifname}", fail=False).ret, 0)
> +        ksft_eq(_dmabuf_attach_count(dmabuf_fd), 0)
> +
> +        nf_priv.close()
Any value in leaving this here? defer() should handle it.

Other than that:
Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>

Thanks,
Dragos
