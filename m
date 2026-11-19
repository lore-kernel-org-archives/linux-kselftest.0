Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795082491;
	b=RhWoTMf86E6Pi8TIR0ypuyj1TcrNmXeasW4D2aei8HTj8wC5IsJNzAcgqx3r2w5uvEVR
	 u95YUCX3KhqrxYXra0TFLK/nAu8nox+oMZ5z65IpjCBCbzv4NjX6/2TdMBIIfWjeMPa3b
	 nKXOtRfR+V0YvUd8nCxSIRWTF8gptlSh389HwzqA21x4u0C36I6pmOFYrK9mAUyf0v5sK
	 e2wczyP1fE3hrylA301ryFvF8imjOlImqFvcixef7fE6yvmHjgxj+mX9uFL5lQcdgtlFp
	 tv+uzrpGQD1S9FPY9fzOoFG3P5t3oX0+AOU8u2iXgKHhpcXwjxoMYtPHcnM1mreZ9Gw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082491;
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
	bh=AJTntfO5Z8BfVge+uf5/hfrjfuqZKiAnUDQTdM49CK4=;
	b=z7uq02MiBtIt2pewF/GqL7BIvLHl5/v3wywrlFy6W8JbU8hUv8fX8iF/g7QrVnRg0rIp
	 gXRfUgCcYMT7RXRIx28h1QynKkNfmLlhGlxZ3JtdYeAG0hHVF3JlPmH7UKodS+o7Yir15
	 HIyWyYUXGVWh8HHOygLkfUpV1Kd0y6nhSv4B3Vx/50CsDl2ykseZPv0wPiIjK9RYtNS9R
	 xcrtz5F4sjezWxV96WHABYlaK7d/kjXNp72edzPAOSq1XdUxK+b8WIY+TTZzfNb6UhhQ6
	 1D8iL+ELPQubWI/W/3e6czigKXBzaD0JzxaQP70XcIfRpCRH2AG+ezHNsCNUSNZ/REg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=tONzvO7Z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.29
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010029.outbound.protection.outlook.com [40.93.198.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A89606A32F;
	Thu, 19 Nov 2026 10:01:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7A89606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=tONzvO7Z
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LOi9egSKp10zE71RSBdvJPRWyKD/pmA5pdcZZlOxEWzmAwq/NJDntI8FFoXZ1cjjVos3/tzR0DY9M5n3pmujDLhRj1uNRiE+WJpbn0OBLQrkfabPTX9sw9nbiTy3Lo3Rxdai/Vwv60wIRMCTNM+rJjRaLm7NamrJ7s7+tR+XA9mm0f+5y7oA1cEdh8PFghddPt59yxZ5n0OF3v5gh67gP51DCSkp2iHxg2qV4zdLTDwWS9LbHPtTUOZbm8wfcj8pFp/PfautkFMUlI3C4cz+68+SPxiJAKa1VJvh5LoLTENPV8gozsu03hLg/BLIT3RAUI3jRGDHbzJ4kh27VfQnAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJTntfO5Z8BfVge+uf5/hfrjfuqZKiAnUDQTdM49CK4=;
 b=PRzMP9eBqHYpL2Dzi47t0K8Wbj2Skjkcr6TamJb1tTieIkyLZTvOZevZeYF30eToULy8GXQeM9TiKX1J17EfUs/+FUNbC+8hUhPxM3P4C6GZGhYPEkPWG32g7PEokHoBk3nmHEx2rTlHcd5Yuw02Y7VbvVmUTjZ48Egw/epQsPrTLAHW/viLq717mgcWh6qrbF2uVdBaL0ZSj2/TFciybwvErLAUwFQoYbAUbwQkgPX1q5cMBAKhwlqcCUxSJYVeFjIRWc08+Wuo+ePWLDqqA9buAXsUDpl/Lyi8x0bdbSe4vu1Z+sIKA4lnp2QHGsqX7IzOPckeRS8umQT8pnnzYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJTntfO5Z8BfVge+uf5/hfrjfuqZKiAnUDQTdM49CK4=;
 b=tONzvO7ZK+aBav2/GB0ql9nReVbtVv2Zu7HzN6YLOOwcN30CZOMfY3X1Oc8Fx5uoYrmWiwst7am3MPGtdd/TI/GDBq7QYi2aJ4wDmt56PWZjF7SzdoWZiQvDXZKH9sXucnmaeQ6wZ8zjp8ykYmwb0BPns2pW+P4LFvgIms3PSgRwtd1LsvnnEwnRsCPVly3xVWHJOFl3Rr/epqcHcvhjoUWNvUqDF9gyQxAuWz3CAzLOEEMah5Bae0stUzJaCs6LOouF9XdspvxCtTe99CexQb+ZH5WppsBVQTQg7aVGxzYpsn9btcCuUkreyTryuVWJKISHDnNEOJ/xUYT6+Nk90Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 by MW3PR12MB4476.namprd12.prod.outlook.com (2603:10b6:303:2d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 10:01:27 +0000
Received: from LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96]) by LV8PR12MB9407.namprd12.prod.outlook.com
 ([fe80::208b:424e:47e9:8a96%4]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 10:01:26 +0000
Date: Thu, 19 Nov 2026 12:01:18 +0200
From: Ido Schimmel <idosch@nvidia.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
	pabeni@redhat.com, edumazet@kernel.org, jv@jvosburgh.net,
	andrew+netdev@lunn.ch, petrm@nvidia.com,
	sridhar.samudrala@intel.com, jiri@resnulli.us, horms@kernel.org,
	shuah@kernel.org, linux-kselftest@vger.kernel.org,
	razor@blackwall.org
Subject: Re: [PATCH net-next 6/6] selftests: bonding: Test that Collecting is
 advertised after notification
Message-ID: <20261119100118.GA1770093@shredder>
References: <20261118083442.1061289-7-idosch@nvidia.com>
 <179507998375.3136.1157162879264282901@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179507998375.3136.1157162879264282901@kernel.org>
X-ClientProxiedBy: TL2P290CA0017.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:3::7)
 To LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9407:EE_|MW3PR12MB4476:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ec1d5d8-7be2-49e0-7d00-08df46241338
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|261021123027099003|261022113327099003|56012099006|261022075727099003|11063799006|5023799004|4143699003|261021121427099003|261022105027099003|261028144727099003|261026121527099003|261026140227099003|10067099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	0XyqD5ZxdAze1Is806fJhUx/rz+vKqFcH1w/XDjclcauJEkMvdIWq2LzjnCO6/OvWYgFWTbaaK4cTohJtXpDcvlHSBzwwqgwNs12krXjdGOaxqg4b08cDh4oUBeZ2HTUSUni88PAUk3NZ1oybClEDnyuULw8opVpExSFZVR3Uw+qzQuwHJTKlmm1kcAPHuay9Lgwg2qTqHb1vjxv8CuJ4nj6LZtwgbo6HFqx6G7rLS39tF0KsWcjYaTBA7JjN86Ab3LzGfAaAZ6l2I1qJl1K6ULmnIp/IZKU1YQWOKkBW+th/tGZlXou5ocN9nqXs3hMFsUepSw98QP5ID0+RuEFS/u6OlUoHGS93IEzTLZrUrEmL9ATRW1Rt1wn+hxzBTgmSKwZ+MyQeYaMZFGvBQw6m+3PLbQJ6XfsC4lMc2gd50h8cdEtHp3RC8jX6Ezxf7Fx9sQwflLpgxb155WZzEtudBFvBiGMeuz5SDJ0ItCvnje1BgkJIsjkx1bdQIx4KSnahnyxqJ2ZeZ4JI9g/EWSGOtkVuj3ANsncyA2c9i8XXFrevjLb2xgDi8Yywp/V2kzUnvKfUMD+Rqz9NDsxQg4VSq0nKSsXjE/ezYAzNLjXyncpNd1hcPNgqm6McRamEHLzw44q5ze7liZv4tH+SfysrTbpBzUWhgNkLqxuD2UaX3I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9407.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(261021123027099003)(261022113327099003)(56012099006)(261022075727099003)(11063799006)(5023799004)(4143699003)(261021121427099003)(261022105027099003)(261028144727099003)(261026121527099003)(261026140227099003)(10067099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjdIZjcyOGM2d0lUaTlCaEpIVERTOEZDTGs1YnNPVkYvWmsrcDU0NUc1K1N3?=
 =?utf-8?B?cGd4R09BY2EwYS9jOStsWWxid3NiUXhrZXlxUVV3SFRxQVFLekdRUG1tOHFB?=
 =?utf-8?B?Q3VGZitiN0o1YzhYUDVZb2RseE1OWE5SNStiVTY0UVVjYmVBNFkraDhsVG9j?=
 =?utf-8?B?YS8xTkRLSXpEVG1OV0dBaW5XT1pxUmRCbnZneG5iYzhSK1VZNy96QVhmNlUy?=
 =?utf-8?B?QTVYalk5OXZaWWd1eHNhTktHRWRPb3l0d2NmQnpzTVVMRW9mYWwzOUlqUkxP?=
 =?utf-8?B?Y3huem40Y0JxR0ZHWUtWeGh3UkNrdXkwcW9JMXVHcmNMaGVycElPZTVReEFj?=
 =?utf-8?B?aEdkeCtrcTZyM3RrZEgza0ZoOEpxZE16ck9VQllkSlQ0Nno5VFh1WWN0NHAw?=
 =?utf-8?B?UDNXUEpuMnJFN3N1NER0ZnY0amQ0SzAreW5IWjBLYjhicWZwMktKN1VxOFBL?=
 =?utf-8?B?TTMwRzJYeWZFM25LU3BObGNsUVFiUU5OZCtpK3c3aytVVnlQMDRwTGJTTloz?=
 =?utf-8?B?enk0L05OMHdlWVJ5OVZVdVlweWZUbCszQnBQNFhHOTVoT2JDbDU4T2tzOFZ4?=
 =?utf-8?B?aHB1em9ZTE1jMDR0dXFWRW9jNFM3OWxxK1VsWW1TUC82N0plZyt3eFRvUi9k?=
 =?utf-8?B?RGluRlFIM0kxaXk0blJOTmZDTjR2bjljVVg5TFIyeC9LSVg5NHBuSkFCVGdP?=
 =?utf-8?B?SWp3NzB3NnVQUUc1L2VHR3JGczVvZ0F5MlArVWFNQjMxZkdmMWxmaExtaFk4?=
 =?utf-8?B?NG14QWxqWEJkYTdqNk9xclRuTlNxWUJtYlBvNFhwaEVrRTJMS3I1ZGpRWW9y?=
 =?utf-8?B?ZW9GNjEzTFRMWmlOUTBhYXg5Y3ltK0hvY3N4WHdrdnVHWjlabHBtNHhTdE45?=
 =?utf-8?B?a3pIK0ljWUFlcmJYdmUxOXBVNDJQU1I4NThuWENxMyt1YnIrMjYvKzFlVW91?=
 =?utf-8?B?NXFJNmJHS2ovU0puZ0xqVWUyOUpiMnExMHNSMk9Ia2EwRUp3TkNjeS8yZ2xx?=
 =?utf-8?B?alRTVXA1WFY4WUJjZHkyNllGUDdhSzI1TVpWODdmVDl4dmZlS3NZSENpb1NE?=
 =?utf-8?B?U08wa3hrT21OdDZLK3VENHIwR3p5cHhDM2RNdlJ1d00wZVByb3M4TmxVeHkx?=
 =?utf-8?B?NEo5TVJmMHMzNkM0dmxicWJnNno3aWFEK29YWlBRemxoaEVYc3g3dlFmNGVZ?=
 =?utf-8?B?cmVtc1lvbGFTSFBQdUExb0J6dTBMOXovMVBKK0JXRU1XRFBESHlzUFY4Sm1R?=
 =?utf-8?B?TUJNdzRJVk5lYUZEaWd2b1dWRUhZMlNQaWxKejBacjE0R1NZZzV3bXZQVUdr?=
 =?utf-8?B?ZlpkK2toTE1pb284R3dkelB6U3FMNG8vTXVubGZYVHFMalVmN1BEMmlSSUFo?=
 =?utf-8?B?VyswMWRzdXhTNlBaNGhLVUV4M0dxUmRCNUZPdWRHQUhESGl0L0YvWXBocGMv?=
 =?utf-8?B?MSs3clVzd1RpRUgzelFoN3p6L0hrUmQ5MWVXZjZyRDc2TFU1RUNsNVpLTkFa?=
 =?utf-8?B?Q3BTbTBEYmhZY1dOeHBQTFRjVDlsVy9XOS9MR3VzemlaTFAxbWlUSUF3V2lS?=
 =?utf-8?B?ZnJmOWlhbHpIWlIrMGZkcnZ3MG9TUHlQZXRCYXpjTVgrQ3E1NEZHV2M1N0lm?=
 =?utf-8?B?MUI5a3pleUV0QW5mbEx4eHJWZUV0Tk9IeVhCMkczT2ZjWTZEcTV5elFSSEIv?=
 =?utf-8?B?UkFDaUpBNjV1MEpTejZhVWRSSVk4YUZ4THAyRUFTUnJxRTJnbHdvVzZJSHR4?=
 =?utf-8?B?b2lrc1BEQ3NZaHZXRXM2M001UmNKTm5CVXNEamhtS29PVDE4OUxRRmV5M2VZ?=
 =?utf-8?B?NnVhZzUrTmlGZFlNdmhDQS9iZWJzcVUvZy8zSFMxbDJUMGh0UnFaUitqVSt4?=
 =?utf-8?B?a0l1R2V4T0N5UU02QzVmdndMOE1XTFdBUkhoQ3J2elpUTytZMzVmSVlmSk96?=
 =?utf-8?B?Tm5xUU9yczBFMy9FQW9MN001TkFtVmgxZFBqbGJWcFVIajg0eUlhNExHWXU0?=
 =?utf-8?B?bGNxdkRLQ1lxZGlYVDNwUnlvZzFzbE8rQ1hzQ1ZzTDBOdHNSQUtYNGpJRzV0?=
 =?utf-8?B?a2RVNzRSQ3l5Lzg0WTdRaW5JK1ZKUkpsRXVDYnVWWm84TzFRRzI2eDJmdlZP?=
 =?utf-8?B?MjJhTWtyK1JYVTVRbUQ3L1VWZFppRVd3VlIzVUNGY1BGYThUZWU0bnVlbXJj?=
 =?utf-8?B?ZzVKTG45UUI2RFFMMU9RcmdUVzlMOEZrWjBEd2VnOGpGVXQvRHltN1pUS3FB?=
 =?utf-8?B?bnNsOTducmhLak9GbERUdmdScFhodEZvanNWMUN3YU5ibzFQUkJ0ZW9ML1Y5?=
 =?utf-8?Q?7H6faEHXNb2fDIH+mv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ec1d5d8-7be2-49e0-7d00-08df46241338
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9407.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 10:01:26.6435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TBE+tsRVQ8LkFInsj0gT+uxv2NugzKdLi6lUDpeDWNvWCymT1Cr5mjl/G26qZrGEjz/1f7krWCEs/hEbB25mTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4476

tl;dr - I believe the patch is fine as-is.

On Thu, Nov 19, 2026 at 09:19:43AM +0000, netdev-bot+sashiko@kernel.org wrote:
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
> - [Medium] collecting_advertise() in tools/testing/selftests/drivers/net/
>   bonding/bond_lacp_independent_control.sh can take the wrong…
> 
> --
> 
> selftests: bonding: Test that Collecting is advertised after notification
> 
> This patch adds a collecting_advertise test to
> bond_lacp_independent_control.sh. With coupled control disabled, the test
> checks that the Collecting bit is only advertised in a transmitted LACPDU
> after the Rx state change notification was emitted. It also switches the
> partner to a slow LACP rate so that the port is not rate limited when it
> enters COLLECTING state.
> 
> > diff --git a/tools/testing/selftests/drivers/net/bonding/bond_lacp_independent_control.sh b/tools/testing/selftests/drivers/net/bonding/bond_lacp_independent_control.sh
> > index a2b83b581e403..b86f39f31d0c3 100755
> > --- a/tools/testing/selftests/drivers/net/bonding/bond_lacp_independent_control.sh
> > +++ b/tools/testing/selftests/drivers/net/bonding/bond_lacp_independent_control.sh
> 
> [ ... ]
> 
> > @@ -162,6 +167,50 @@ collecting_notify()
> >  	log_test "Notifications in COLLECTING state"
> >  }
> >  
> > +collecting_advertise()
> > +{
> > +	local lacpdu_ts notify_ts tmp_dir
> > +
> > +	RET=0
> > +
> > +	partner_state_clear 0x18
> > +	defer tc filter del dev "$h1" ingress pref 1 handle 101 flower
> > +	lacp_state_wait "$h1" 0x0f
> > +	check_err $? "Port did not reach ATTACHED state"
> > +
> > +	tmp_dir=$(mktemp -d)
> > +	defer rm -rf "$tmp_dir"
> > +	ip -ts -o -d monitor link dev "$h1" > "$tmp_dir"/notify &
> > +	defer kill_process $!
> 
> [ ... ]
> 
> > +	notify_ts=$(grep -m1 -w "ad_actor_oper_port_state $((0x1f))" \
> > +		    "$tmp_dir"/notify | sed 's/^\[\([^]]*\)\].*/\1/')
> > +	notify_ts=$(date -d "$notify_ts" +%s%6N)
> > +	lacpdu_ts=$(head -n1 "$tmp_dir"/lacpdu | cut -d' ' -f1 | tr -d .)
> > +	((lacpdu_ts > notify_ts))
> > +	check_err $? "Collecting bit advertised before notification"
> 
> [Severity: Medium]
> 
> Can notify_ts in collecting_advertise() pick up the timestamp of an
> unrelated link notification instead of the $h1 one?
> 
> The monitor runs as "ip -ts -o -d monitor link dev $h1". In iproute2,
> accept_msg() in ipmonitor calls print_headers() for every RTM_NEWLINK.
> With -ts, that prints "[<time>] " with no newline.
> 
> print_linkinfo() then returns early and prints nothing when
> filter.ifindex is set and ifi->ifi_index != filter.ifindex, which is the
> case for any device other than $h1. The timestamp of the filtered message
> is therefore left at the start of the next printed line.
> 
> With -o, the matching line can then look like this:
> 
>     [ts_other] [ts_h1] N: $h1: ... ad_actor_oper_port_state 31 ...

This was fixed over two years ago by iproute2 commit 554ea3649dd1 ("ip:
do not print stray prefixes in monitor mode") in v6.11.
