Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011013.outbound.protection.outlook.com [52.101.62.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0F134750F;
	Tue, 25 Aug 2026 11:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787659041; cv=fail; b=i3eslHzywpqGO1SLX15mpqepJtThCGPLDGzx8Jvfp4hgJ6o6eKQZweesh51z2SsI0516AM3cKEpBnMVGE2A3+vrDxp5ml/5peS23oM5MoeU4r/Ffwk5nk77yAA4wcfxe1vl7zEq4V2kEqOrA91KCjrVtzxEAaIoqdemUbx93vl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787659041; c=relaxed/simple;
	bh=MOizHhGM2XyqmK3SBg0nf5jVVL5owwjWAa358ctyzbU=;
	h=Content-Type:Date:Message-Id:Cc:To:From:Subject:References:
	 In-Reply-To:MIME-Version; b=fCZnzVxak2K9zySYd0nKi0wmBLevysiBQ6NjwFjhEwyAknRdkpW64rCiRmnGkoUK5gO0seRKjPBS1muDl/WhRwSu9hDj/hZze9S9KynCwn/sOM2sbSe25Ie4LTlHaUYRoMKDZflQfhufIUhY8pO7qgXtbnh2Bs0OR09SMBABZpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IbaCRX6x; arc=fail smtp.client-ip=52.101.62.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IbaCRX6x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S+LMVjlCG+nynpvIDtvjDKbIBlhk6ak8JsYjryq+icjUdIdlh0LH/j/l9qtqjIHk+MHo5EwVppua4+yZgp//aNRKba4o8ZwWUcvTm0OYhb0ARQzT6hiX4TWjbvGShaRwCmyDg0dN6H3h/nt+ZElrEHsw4enp5/cY3o4i1CC6hGj+TUvsuDE+up6IWALnTgTqnhjexqJO+TAp6YESLzw1tQ0XMZ57mmACXK04uKPZAPJzluSD/7gDCrErtyYM32jTS3bSQ6Kk7FmZN39v4aGp5ZiPIVO1JaZQYmnLvAdb5pOEy4qSFoM7MztCzRDhw0lHtgA0wIGVpGDMWhhd/r7Iww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nhDo+2mvgK+Gj0VCP5j0d/3b9XT3BeQz3XaxUJbvTaM=;
 b=QTz/X8qkNb7fqPrPBmkqHP2hk+WqfNBtqqs3Y67gTZxIo4G5qQr/0BpfFiFHIOUYrmU+xBySDhXbmg+qSI30l+6xxwLeFfmsaysjvWCW5dUNIfUVq6vFEEADeX2ij4TjVY/0gVjEsnQdO1YGVWTbouU9/Ey9Kvx6NgpJ5l0G7opGYE+91CUTx6qhJJ6R6c/9TSzV47fnJUdIRrMESGFk/EL2EoIX6uF7NPfY/VKYLMvP2uyZdQYF7L7+LuBcLhF11vr7IqA64qt9Bid/21C//mnYi6CQHyC0BMKuaZdM6jYY+IFmWqgpSpeZwdsmhQBUAxahqPG67/7qzJIzTtrpbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nhDo+2mvgK+Gj0VCP5j0d/3b9XT3BeQz3XaxUJbvTaM=;
 b=IbaCRX6xh+39UJ26eWYFF1W8q6ZxdOzrvEz8it6E6knY74NVtJJsID6cMPLJI8csAYYJO1DcTrZ/k/a8d1Yf8vp2mKxmzQys1fXkA91efI9S9EQZ74V9bMrqIHTdugaNpoHaYAb/dfhDMz6qBAU4WRTJSbrS6kod0wsQs+tAFr7oQCtGLAT9vq01k44HkatK7+QxOLEoIjBZtHL8sc3HmjKqRmLH4YIYc+TeKVnyvyucrUHmKsfZuCyghuXEi/XHqCKKgGB5d4g9vRnID546LEDAnj8805TknnI6ks50/XWnLQW/gwD1nYHFLdd78XQSrPEGBptOjq09XUVbjcP94g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB8371.namprd12.prod.outlook.com (2603:10b6:8:e9::18) by
 CYYPR12MB8656.namprd12.prod.outlook.com (2603:10b6:930:c3::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.6; Tue, 25 Aug 2026 11:57:15 +0000
Received: from DS7PR12MB8371.namprd12.prod.outlook.com
 ([fe80::23d7:9e07:1de8:d80a]) by DS7PR12MB8371.namprd12.prod.outlook.com
 ([fe80::23d7:9e07:1de8:d80a%3]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 11:57:14 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Aug 2026 07:57:12 -0400
Message-Id: <DKY08M715PGF.2383RIK7V6ONF@nvidia.com>
Cc: <linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Lorenzo Stoakes" <ljs@kernel.org>, "Baolin
 Wang" <baolin.wang@linux.alibaba.com>, "Liam R. Howlett"
 <liam@infradead.org>, "Nico Pache" <nico.pache@linux.dev>, "Ryan Roberts"
 <ryan.roberts@arm.com>, "Dev Jain" <dev.jain@arm.com>, "Barry Song"
 <baohua@kernel.org>, "Lance Yang" <lance.yang@linux.dev>, "Usama Arif"
 <usama.arif@linux.dev>, "Vlastimil Babka" <vbabka@kernel.org>, "Mike
 Rapoport" <rppt@kernel.org>, "Suren Baghdasaryan" <surenb@google.com>,
 "Michal Hocko" <mhocko@suse.com>, "Shuah Khan" <shuah@kernel.org>
From: "Zi Yan" <ziy@nvidia.com>
Subject: Re: [PATCH] selftests/mm: khugepaged: remove str_dup() usage
X-Mailer: aerc 0.22.0
References: <20260825-remove_str_dup-v1-1-0ba2121a820c@kernel.org>
In-Reply-To: <20260825-remove_str_dup-v1-1-0ba2121a820c@kernel.org>
X-ClientProxiedBy: YQBPR0101CA0324.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::28) To DS7PR12MB8371.namprd12.prod.outlook.com
 (2603:10b6:8:e9::18)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB8371:EE_|CYYPR12MB8656:EE_
X-MS-Office365-Filtering-Correlation-Id: d01f436f-0f8a-4a92-173d-08df02a00113
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|23010399003|921020|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	i4kql2m982kxOYjvE5fcsNQralCbZZiPOFS/6zlFevtRHIKnf2lr1pMjNCmHkVGeThaFyUvn/Lx8jvVLGW2p2j44YtNcmWMxGVqEEGG7nmW7K+nytujzRh+CM7kNmWQ6rSNx8eT499ZaIPr6vfkHduIcpNp/GjVE9QClO9Bw/uY8q0Am1DieIchGtH0Juz7oK0VeUp64ut6wtqjcmi9Zl9uQH0slaum+13ZokRa6OnwOjzuPbCA50DTL0LjmkPvT07F5YSTADipVFVuHZkHyvcIe8NLpwroiHZML2fdW10NHRPfn2l5XoXjXljb1Frj2p2oUxDh5qmio/8MUln1jM8JCEHVqj9AKw9dCq/EJR5q2+lP055qqSbmVaSBPEQhLibQggE69n6ECyLRAKsDcju9xPfoBsHMqy/o0q5+jz6y84+n/vEdWUp48rBTR3VFMPzLSBkHFuDUII4cJ0KuOkhdTCpX57s5g26Ry7azh5wRwBIaK21au4Gb8y8G0n+UZJqJQVftFipqO5frN9RSW9yJHBXzcwpFkJgApJTNKHoGuhKbxmHUge4TPDX9K9+bDTtGquwBQr1+7+47Uyfs4h+YpBx5wXASG/whrwTYYKLQ+id6bcwIhcpY2H39JhjxVWP5s3rjdWaHU3NG1SSB/VLawcHiAFbMoDWq7PYoh7xyhYGwNXRZKbyt/uZS4EmiLat42S/s7Q+Tr4I36QO3/JQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB8371.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(23010399003)(921020)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzhTelYxSWhGcnJuMUhrZlFZR1hER0dYQ2EvVmZKMXY2Z0hJVW1VeG5iZkg2?=
 =?utf-8?B?RHkvcVhTNk02Qlp4MXBzZnhaSy9idU5YdlZNcm5iekJxOGFnd1kvSUVDZSt5?=
 =?utf-8?B?d1BCVy9xWHF6UUFmQk5pdElBNmdNR3ZRUlBzd3ZBc3Y2b2orU1grZkRHSWpu?=
 =?utf-8?B?SlFnZ0Y4dVFYd0srUzNMWmtKZmlVbTg0elFNeDF5R25BWDdpdVVEK2x3MEVl?=
 =?utf-8?B?QnFCZlhMVzkwZlorTlVETTJkZy8vd3ExT09aOUp3cHZFNWxlZ3VvVkVXWGtL?=
 =?utf-8?B?dkgyTU05Qm01U1dQR0FmdXBZMzBUQ1dHUnJ0Q1o0VHVGMXJKZ2JFM3lLbnpS?=
 =?utf-8?B?ZmptaUh5Zk5kWmdUYnR1TzBxL21FOStXbnJLMWxNNTBoWDQyVjNZblkwaFJD?=
 =?utf-8?B?R2FSaTIzV3V3NDdKSUZIeDFzM2pSbnFmZGcrdHBxZzJnZWRyMisxMjFOYUdP?=
 =?utf-8?B?RzBqMjV0SUVsckdLMXRDWEZLcFJiK0dqdVlVSS9TaGt2Mjcvd1RobHJHbU9u?=
 =?utf-8?B?UERyOVNTOGl6UFkvcHVLTll4K0JKMnVIWXZzVGpZb0QwNXA5SGM2UVBNV05l?=
 =?utf-8?B?dE1HOWo2SHlSNmNTeFNhVk5FQkRmbU9lM1kwQlZyYjd4MmdPaTMySE96aWxX?=
 =?utf-8?B?TzB2bXl3QzkvbWxCWTF0QlRhYmc3VjdCRkpYYVBwY0NVbGhsUHZHbzVUZ2Vj?=
 =?utf-8?B?R3NjS2d3YzNUNmk2ZVdHZUhlNFVGNHdNWTBvZ3dsZkw0d2tUaFpLY3JyZkdp?=
 =?utf-8?B?ajdrdU9ZWlM1a1AyeVNPOS9NMElSaUFZVzZJc3NuV0MzTmo5MlY1MlU2eUFY?=
 =?utf-8?B?SklLWmpzcUg5M3RRaHhwYnI1UWpBTnZueTFSMzBhcVBKNjlLWGpvN3VGTytJ?=
 =?utf-8?B?Rmc1bEcwcVFQbHdyWnQzb2UvMGdudXNscWNkL29LUmZ1QXhaUnN3aStOV1FZ?=
 =?utf-8?B?Q001TGxPdzkvU1JENFZEcm5PdmdGYUhKQjdlSVZwc3g5eU9ON3kvS21tZmFp?=
 =?utf-8?B?RzdUSGRIUHVYei93cjhLS29ZbDkzUyt3My9aRUlRNHZsVXU0SW5vcVZFb2d5?=
 =?utf-8?B?Si9UbDV2eDd5MzRFTEZZWnNjeVY1VjliRWF4R2tDQkp0YzNvZS9aSm1CVG1T?=
 =?utf-8?B?cEVHdFV3Sng0NkFkR1lwNXc3R1dScjJVSktQMmZGNGY5K1IyRTdDd3g4RVoz?=
 =?utf-8?B?blI5eU94bjRYd0dkeEFuOENhU0hBek10TjJ5Q1JuRk9VMjhDcFpRVkFWczN2?=
 =?utf-8?B?am9EeGNmbTh4Q2pCMVpkSmRURmt2dmZodVpIOXZQYmdaOHZkenZoRTg0ckxW?=
 =?utf-8?B?eFdmRGcrcUtUTTdhQlhhNVdNeEJmNVFtODZHS2RWdU5TZVM2ejZwVUluL0I2?=
 =?utf-8?B?c0hFRndwMjhSY3NDRkVzUEhpaGdYVk8rRU9JZTl2NVBWY1BXd0c2ZDJKbTU4?=
 =?utf-8?B?czlsZHRaV1YrZ1hXbW81ZWwxNWh2RTUyODVXcEQzUGFZMFhLMzlVREZ3QXJD?=
 =?utf-8?B?Q005MEYva05UTzA2NmdIRGtwL3oyYTk3V0h1TXh3UUxzNHlxUzE1cWp1dGdh?=
 =?utf-8?B?dUZOVGxXUHQ1TkF1cHFpUFlJTXE3emxnbnpOelJrZlJCRS81bG5kOUtLNGt6?=
 =?utf-8?B?VVdHaFdXOFdEbDVCRTUzZElDbUdmYXpCRlhnTUd1MVFtOU5YZWVVQ0Q1K0pL?=
 =?utf-8?B?Q1h3Tjh1aWFwL3FPZ09abEIvZmlIYzlMV0tONmt4dktFcDd1UlNXYi9DVGZX?=
 =?utf-8?B?K0VxcWhBVmdlZ3k2eDdzY3lOVnd4aTBkLzRjZEdMcjNFSFNsNU9XWmo5TW5B?=
 =?utf-8?B?bXU2VTgxZlp4VlVjelczVG9wMElhcFJZVHByNFQ1V09KTXdGcWxIOEZZcFNY?=
 =?utf-8?B?RmVITXo2eWRZcVZiS1hhNGlWRFY2OFozMzR3ZXVPaWxuZER5YUdKOS9abnZ2?=
 =?utf-8?B?Uk1kOW5aQXdVUlZ1WU9Ca2MvSCtzV0NmZ0tlKzlCL0tvc1RkeEUraGgxQnNT?=
 =?utf-8?B?anYwMjNTSUZtaHZyVjVhby9KM1c4U24rMzZ2MWthZkIrQVVYbFdYaytCR1kx?=
 =?utf-8?B?SzN1dWFOc2phc1lOR1VxcEJ4a3dvOWhsWmdKangrK3FBeVRJZFFyWStQdk02?=
 =?utf-8?B?bEJpUGZQblJsTmdYSEc3MzlGY255VjFNUG9jQ1M1V2Q0YUF3UmxBWDhORDhQ?=
 =?utf-8?B?bWhubWxXTjF5OHh0QTJpSXVpTGNoNFBhbXhneVNPczM2bCtiYXBzQlpGaXZV?=
 =?utf-8?B?V3pXTnE0R3hkUmY5a1N2NUdMMTlIT1dxS3JhdndxNWdqNFA0MEw1aG5selo0?=
 =?utf-8?Q?8oIun6tpGRksMuUJTl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d01f436f-0f8a-4a92-173d-08df02a00113
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB8371.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 11:57:14.7847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uyfyz5zA3hrhmJ8R8cuN0+M6n5aGPIZ4FR2zW3+HX6Y1DZcNStuPwXsJLz9zQxTF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8656

On Tue Aug 25, 2026 at 7:20 AM EDT, David Hildenbrand (Arm) wrote:
> We don't check str_dup() return value and never free it. While both
> things are irrelevant in practice, let's just clean it up by working on
> argv[0] directly and avoiding the str_dup().
>
> Nobody after us needs these parts of the argv[0] string anyway.
>
> This patch is inspired by previous work from Anshuman Tewari [1].
>
> Link: https://lore.kernel.org/r/20260821114416.12255-1-anshumantewari123@=
gmail.com [1]
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
>  tools/testing/selftests/mm/khugepaged.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

LGTM.

Reviewed-by: Zi Yan <ziy@nvidia.com>



--=20
Best Regards,
Yan, Zi

