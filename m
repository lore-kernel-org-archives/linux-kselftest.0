Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.40
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793871678;
	b=WJanut+WbSdjeb8+8KtMAkAa/54oqcmZvfuMO6cTZkRDLAMPesZXVnCTe2M5KKRVXCEk
	 2go2Q77PMF0jvZbq+cdsTdttuvzR5yN6JC5l2gt1LsCyOcscZgHn1McReSd5yqkA9uOYd
	 qSjBJZIvIIMDAXu8MO4k7zx6e2N30jRPiOYdOpYRN31KtAEU4YOjxBd5sHqr5i1NS7wyj
	 B5k150wtd3EjByTEvsbCSdgdDd+qRmJrL80pCbEwYIC5lsx1UPboXQSPjZF7lWTkPH+pB
	 TBZV/1h2HVPONZ/gRZI0mzKdIWNTfT5GImbhZTx3IHn885d9onvpc4lcYpXT2Y9aKKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871678;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=drzjpwyNy8mpc9F1LEBVbXwnFdvRIzAMFXgjmgLsbDM=;
	b=tdttRpeq/yv5A5kZxlHaZrZzTerFhTRZDgv5iCcE06EPcHGgbBO8vZwudQj+lCshlAgd
	 pKWQsmRP7pR8hizTQofsKyN+kANbUdS44l8DCL/TQO3r7T/CS83BIhcyMAZRJSDLxyTaV
	 lEq0JvZMY0qFenEgsD6Aca2L8XWCCw37yt0AdkpYWPnRGKUtY4AwNKjpj0UXPdi0uy2Ui
	 RHUPayTfwfFJwU98J4l3OL6QWSMKge4mmKaHU5d9xwCn8BzglnGYaMzQF51Y7bzGBnlEN
	 jzx1EojYUCB+Co+/dUjqRc6l0BO+zN6M/kjwrd6Lm6m0VW/kj6kaBKj3agmkQ06oXSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Fop4YkdB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.40
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012040.outbound.protection.outlook.com [40.107.209.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F1D606A326;
	Thu,  5 Nov 2026 09:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89F1D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Fop4YkdB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JPjjoYVVLb112ZpVc/Z0IIY6TC8VW5MUPqfPxHVNPY5/yMDbzavgZdJOgufNNKcn2EkU6Tqzc4rq12paxbxwSAbXg9Qo0XciZpl3B14esL3PM8xfYvpNb8isvuMQMncFnTZExCZ9b/XOE1ZkVNUU9uBOlhzfJXhmwNw5W8+2fV9vsTxa9rd+w7dsa8UGid8FIhNiOV3dcyzljoZsPRE2T42EQUYdexHkK4DGwscZdL5/ZGp6IS68BlUddnpE6WYuLMJW2ooXTZeyKpWfEhguWnsUakA/svoHEbhpT/VA4JLOw/KMo9C14QVYp/cOmpJWoVPFm0iPQsZb2WEpP6Hdyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=drzjpwyNy8mpc9F1LEBVbXwnFdvRIzAMFXgjmgLsbDM=;
 b=kx11V5BZ5XuK11hdup4ytFqACq1PDvV6K/LmMHo3w+xnNQJzyoSQrLVK8gMdZOC2tw/dkrJF9bX6BVlkV8aZcZKgJOxh2E0/SesOVjgOdyB4cdUo9vlPNkWGnSyMXD/1yNlqqVjUCxTuBaHRTaKkPWiAvBW6B5ZFaft93SSInZfIu0fPerOMxU2S8BvsORwAlXaJgmysFYNxMpk143S/69bRDCx0ZHmRTbjyzYaCMu6ZuqbgZWSpCtTF01pyOeVKU0vPIdwvYjuOW7YhlfCLs+REU/DZLUzp18RkLE/Q2lUsr8+Chr5xuEQG8dljgK7qo80z4lwQye6hpeY8kbkhgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=drzjpwyNy8mpc9F1LEBVbXwnFdvRIzAMFXgjmgLsbDM=;
 b=Fop4YkdBPwSZja3KMggmTNw61MOqh0uKa7QpTbcCNleFUwL9rwRqF5Ipyc/DuyhyvnYgZhvR20SIN/Ft2+OmoYBNfzKJMnECvlsnbdp3FUrG0Jrv+WkibncohfQ2K669zs8dhhNbS89ptfSf3ue82JztdnVFmVAzV86XHts/caBrkcbEOx+j1rOdVwXGbpWXhryOjptu+4I9VVzsTeP1B5ugK1/2jdIpRK5etmP8/QW3OTPTpfMBKaacdt6OyTHCq82uMLYrzlHdl721KohbHYjGwtYYZBedOF7npE4TpAbqWMV+4E/po15Ji25lC0k1pDCFRGBtEKPJNZXoqAAtDg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by PH0PR12MB8100.namprd12.prod.outlook.com (2603:10b6:510:29b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 09:41:13 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 09:41:13 +0000
Date: Thu, 5 Nov 2026 17:41:07 +0800
From: Richard Cheng <icheng@nvidia.com>
To: Ben Horgan <ben.horgan@arm.com>
Cc: tony.luck@intel.com, reinette.chatre@intel.com, x86@kernel.org, 
	shuah@kernel.org, fenghuay@nvidia.com, Dave.Martin@arm.com, james.morse@arm.com, 
	babu.moger@amd.com, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kaihengf@nvidia.com, kobak@nvidia.com, newtonl@nvidia.com, kristinc@nvidia.com
Subject: Re: [PATCH v5 1/2] selftests/resctrl: Implement cl_flush() and sb()
 for aarch64
Message-ID: <auxM9hVAgp61Qbgv@MWDK4CY14F>
References: <20261012074729.40042-1-icheng@nvidia.com>
 <20261012074729.40042-2-icheng@nvidia.com>
 <847af89d-7b79-44b4-8273-243dfb51ef5e@arm.com>
 <9cccea63-397c-4913-95bc-eed38f0ebd66@arm.com>
 <aurOz7iGKInyjddW@MWDK4CY14F>
 <b94aa5e5-a4ab-4b61-a864-d10ff1ff2b63@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b94aa5e5-a4ab-4b61-a864-d10ff1ff2b63@arm.com>
X-ClientProxiedBy: SI3PR03CA0001.apcprd03.prod.outlook.com
 (2603:1096:4:297::16) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
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
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|PH0PR12MB8100:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c92f034-c964-472f-57a3-08df3b20ede4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|5123799003|20046099003|10067099003|22082099003|18002099003|21026099003|6133799003|3023799007|56012099006|5023799004|261022075727099003|11063799006|4143699003|261009223027099003|261022105027099003|261028144727099003|261026140227099003|261026121527099003|261102123227099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	9d08/onOer5IQWNExLxJhXibrkqHAeoSwJx09MYncV8jBEh7xs3WmlgdrJJepq2fDIqvShEg52rAgwvgYb6Glf4sQwgOtw8s8zxj4/OuINizvnHamvbxgFDU8ZulJLI2FQWzhq2E02XdPzg8abEWX+ksMcLJ0Sd9p7/v27b85qGfZJO2KFdFqxKFNkUMae35QG9DeR82tJS7i+FF7cDKJjWK0ztdNYKFZRAoooqSFyJKS1qBI/tkTtNNtzdWtV+tsq+wMtised2tUfU+yENIHZv2DGv8jSNYzfw3/blY7mZDgep32lB5X2tn4tqP/YfChWihVTKSp0o5VdPzOa52dFz+85lsG1+sbbCepPAWAJNRyk1OXsTbmTgNiAZrHeg7EHdhtMZBhFfboLZWsfbs0cYRoFBNJiADOVRDlCA6V0HFYXnXfMp6ZAUpfk6RnfjvyZRjrjAdT9UwZPcaD6pNf5sJ4saBddFoePM6IdSPhXcHk9RTZ+5PQIgm48UarqnbMZdSveSbNAjmS6SyntcN3kuJiklH6d4lOrm6lfJ0//02IXbTVsb5oHxwTc68p44UciwwOU+hy28IhZhdnBXqZ2T0w1R1x/Jx2ZNgmBEzeULYrFzaNHlYG2Oei6a6Pn/rkfd0WWmOXiz7UV8meNLZRMviPQXYbolJcrw9wk3SjEE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(5123799003)(20046099003)(10067099003)(22082099003)(18002099003)(21026099003)(6133799003)(3023799007)(56012099006)(5023799004)(261022075727099003)(11063799006)(4143699003)(261009223027099003)(261022105027099003)(261028144727099003)(261026140227099003)(261026121527099003)(261102123227099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ga7j4O2MhLnc6qmHlsqO64AGDs81MyOzDd/EOaBYJafTt5TQo9oZEJT62qnF?=
 =?us-ascii?Q?Bk4ssgHV6glrRJlKOHO0KWH2BAHKzmqIjwSGfYqBVt5ZUo1QuqKVHgCnxd+K?=
 =?us-ascii?Q?w3/3SozaLXhc1BxqGlTZD+mWsMPrlGXDg4MHt/TNiQEJLFoccrKsGCs9xWc5?=
 =?us-ascii?Q?8KiA82q8l50yPTmEfiDIvsuh29t81+qeZ+Ge8EfvZkM/EUJSkBaPFWWBNRf0?=
 =?us-ascii?Q?v3CmbNEIMPOcwC2ZnHc5Jnu1yfDTYN21FG9vNTF4nYrw4V7nSsPA7ZxcnVnT?=
 =?us-ascii?Q?XRvvXWiSaqkwVJoxcnigKEDrhKY3OOQBL7o3Bad2DhFb8YDtPEN61iR1JJHO?=
 =?us-ascii?Q?a25kBW0i5dq5xVo/23FVM8PGo+Y4ER2LqIEH0UKXVpct22RxaFICLP/Mvu8n?=
 =?us-ascii?Q?08vpbNm2QZxzukIsCVAJMvhP7wNQqQNb2dlFTTn6Z3BJLRMWEor4FsWbbad5?=
 =?us-ascii?Q?t8/Jt53ZmSwaPTY44K8bS8ok8kCyyYtf5htNbqbMrIutQoW7LszsWM6VcQ7Y?=
 =?us-ascii?Q?RS2MS8Egp4a4/Tf+3Mkhj2MqO4ksxXa63qxfqkAPnE4hq6Gr+HfZNRd6rYD+?=
 =?us-ascii?Q?BHHGiDgi0QSDy2eEs6wNIC57E+jM/D2HA057ImFSj5NHREot+8Pr7FBA83tF?=
 =?us-ascii?Q?kt41wjoT99xJbvK2yXEQeTZI4a+n7n5YjpaGb3Y6cZJoDCFuQp/ovmXHLOdg?=
 =?us-ascii?Q?B5Pc80PC7qJ0F0VRyt8HpCNoGICUYZ7EF5iLwtq8iETjIUDDXtYzcJ84Coas?=
 =?us-ascii?Q?tDM6BROajdr+ynWaGLbx+EdyiQ/3ZByWYX9HWmjXOUFEkJ3sV8PEAYJeWLr2?=
 =?us-ascii?Q?JcVHcdsN6ZBlkyUDuOPT7Du7pBcS9Y6v7jtHg17HBhJfGnX9+g0LzXYaFzEI?=
 =?us-ascii?Q?CAKVug9Kv3lIM3kqVK/30fyu19Ym3N5bBz2tksQCosXqNRxgyyCTQyU+FEEF?=
 =?us-ascii?Q?Kue5EJqUyRAkriymJX1BD2lyG9WQMNWWjUD2d7poYrDRY6NPyLTLQ79Vq0Ms?=
 =?us-ascii?Q?/HpczzUZCPsidMmphmh1VUirLmaAcDFdvdk+fgk6MYtEmDd9S8Ko60E920WK?=
 =?us-ascii?Q?IdqzO4J3NSNRoQOuY1huahgLyW0cL/DzF1dD4AS6+wGXUD5jRpHfdWR36+b9?=
 =?us-ascii?Q?lzkzULbtXMYwUSzt26AdB5zN5xkzShxkc+YvvFhRmRW4/Uf1DFBX8kO7Es6g?=
 =?us-ascii?Q?hbgXsbD4dkwhvloSw412JUWlGbNN6FcNEJqNyTZfvS7NIEjM6oQzCbLbfPZl?=
 =?us-ascii?Q?b8D8eRqJPavYxcIZTihJ1riMI6ThtOVTNXQW3KyduUTumfvSlv2FeFUWfmd8?=
 =?us-ascii?Q?mEmITLmkMjmyMXjruEGysUDXjQfsv5ROOPFOFI1Ch6xauLMgTkmJCfhWTDWF?=
 =?us-ascii?Q?hle+HegrGJKUtwR/xhNNjxvJEaOvR3AsnUqXDEa4KySIKBPad6MF5uROyN5c?=
 =?us-ascii?Q?00uvpGylOtkfOGFtrw0m5OL6yYTs8UDRkI5Q938MQPNWwvq3G/c2H1VJZJyL?=
 =?us-ascii?Q?2I3TOm2/mT1RJbStXp0b4XBgQWO+x/suAxIHFZhWs+dOU8VvvXKao6YLaD7x?=
 =?us-ascii?Q?NReP0L/X91NI1C4oRdvRZhMN8lOYm9FrbNtYFr1AQEy+Wh5W3q6N9CP02Meh?=
 =?us-ascii?Q?sqmPHDr1uYxhVEyB06uWUOD+lhfjAWlOdjqNhOCJbb9TjkU0cgNzUNRtBLVT?=
 =?us-ascii?Q?4b+P4HjIYe4i7CioEEPByo2+saegSrotWJHCZJU4qabmTmKR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c92f034-c964-472f-57a3-08df3b20ede4
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 09:41:13.0867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DsM202G5YYTz8CDT+Pra++a2ffiNTumuGlzBMF420tzNxMectJ3Srr32zlSGUOB0Yx1+H4dWrFOHsYAitP5Yzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8100

On Wed, Nov 04, 2026 at 05:09:28PM +0800, Ben Horgan wrote:
> Hi Richard,
> 
> On 04/11/2026 06:43, Richard Cheng wrote:
> > On Wed, Oct 21, 2026 at 10:55:35AM +0800, Ben Horgan wrote:
> >> Hi Richard,
> >>
> >> On 20/10/2026 17:30, Ben Horgan wrote:
> >>> Hi Richard,
> >>>
> >>> Thanks for having a look at the arm64 side of the resctrl selftests. That hasn't had much love but
> >>> it would be good to have them working properly.
> >>>
> >>> On 12/10/2026 08:47, Richard Cheng wrote:
> >>>> cl_flush() and sb() compile to empty functions on aarch64, making
> >>>> mem_flush() a silent no-op and leaving CMT/CAT tests operating on
> >>>> unflushed state.
> >>>>
> >>>> Add "dsb sy" for sb(), ARM requires a DSB whose access type covers both
> >>>> loads and stores.
> >>>
> >>> I guess this is referring to the synchronization required for the cache maintenance instruction but
> >>> that's not what you are using in this patch.
> >>>
> >>>>
> >>>> For cl_flush(), "dc civac" only reaches the Point of Coherency, on
> >>>> ARM MPAM systems the SLC lies past the PoC and may be a NOP on coherent
> >>>> platforms. Instead, dirty each cacheline with a store so that
> >>>> mem_flush's full-buffer sweep evicts lines from the SLC via LRU
> >>>> pressure.
> >>>>
> >>>> Signed-off-by: Richard Cheng <icheng@nvidia.com>
> >>>> ---
> >>>>  tools/testing/selftests/resctrl/fill_buf.c | 11 +++++++++++
> >>>>  1 file changed, 11 insertions(+)
> >>>>
> >>>> diff --git a/tools/testing/selftests/resctrl/fill_buf.c b/tools/testing/selftests/resctrl/fill_buf.c
> >>>> index b9fa7968cd6e..eae0262fe265 100644
> >>>> --- a/tools/testing/selftests/resctrl/fill_buf.c
> >>>> +++ b/tools/testing/selftests/resctrl/fill_buf.c
> >>>> @@ -27,6 +27,9 @@ static void sb(void)
> >>>>  #if defined(__i386) || defined(__x86_64)
> >>>>  	asm volatile("sfence\n\t"
> >>>>  		     : : : "memory");
> >>>> +#elif defined(__aarch64__)
> >>>> +	asm volatile("dsb sy\n\t"
> >>>> +		     : : : "memory");
> >>>>  #endif
> >>>>  }
> >>>>  
> >>>> @@ -35,6 +38,14 @@ static void cl_flush(void *p)
> >>>>  #if defined(__i386) || defined(__x86_64)
> >>>>  	asm volatile("clflush (%0)\n\t"
> >>>>  		     : : "r"(p) : "memory");
> >>>> +#elif defined(__aarch64__)
> >>>> +	/*
> >>>> +	 * Dirty the cache line with a store. As mem_flush() sweeps
> >>>> +	 * the full test buffer (sized larger than the SLC), cache pressure
> >>>> +	 * evicts lines from the SLC via LRU replacement.
> >>>> +	 */
> >>>> +	asm volatile("strb wzr, [%0]\n\t"
> >>>> +		     : : "r"(p) : "memory");
> >>>>  #endif
> >>
> >> One more thing that occurred to me is that if this is intended to evict all existing data in the
> >> cache then it would require that the cache portions bitmap for the control group (PARTID) in use is
> >> set to all 1s. E.g. 'L3:0=0xffff'. Otherwise, you may not affect the whole cache. This likely means
> >> that the cl_flush() function isn't the right abstraction for MPAM and the test needs a bit of
> >> restructuring to get this to fit in elegantly. Similarly, to the limbo handler in resctrl you could
> >> then check the llc_occupancy() to check it's under a "low enough" threshold.
> >>
> >> Thanks,
> >>
> >> Ben
> >>
> > 
> > Hi Ben,
> > 
> > Thanks for the feedback. I checked the code and ran some tests.
> > You're right, my implementation writes into the benchmark's own buffer using
> > the same PARRID/PMG, and the buffer isn't always larger than the SLC.
> > 
> > I can't claim that it produces an eviction sweep 100%.
> > 
> > I think what are want to do is to check whether reducing a group's cache
> > allocation causes more cache misses, thus the data left in cache from the
> > previous allocation must not affect the next measurement. That is also
> > why I want to reuse the concept of Intel's test with CLFLUSH before
> > warming the buffer under the new allocation.
> > 
> > I'm thinking maybe the assumption can't be achieve on ARM, I ran tests to
> > measure occupancy before and after each preparation method.
> > 
> > I tried this patch's implement, and "DC CIVAC" since I think it can affectively
> > invalidate cacheline without throwing old data away, which should left
> > occupancy almost unchanged.
> > And one more method with a separate large buffer in another group.
> > 
> > The result turns out like the following
> > 
> > Preparation                     Before (MiB)   After (MiB)
> > DC CIVAC + DSB SY                     51.19         50.47
> > zero-byte stores + DSB SY          53.12         56.43
> > Separate-buffer pressure             53.25          7.14
> > 
> > 
> > The current method increased the benchmark group's occupancy instead of
> > reducing it. "DC CIVAC" left occupancy almost unchanged.
> > The separate buffer method reduced occupancy very much, but still left data
> > behind.
> > 
> > It makes me think we should reconsider the test method. I think the goal is
> > to check whether the MPAM allocation limit works, clearing the cache is only
> > how the Intel RDT test prepares for that check.
> > 
> > How about we set a group's mask before its worker initialize the buffer and
> 
> We'll still need to make sure that the PARTID used for the test hasn't got high occupancy in the
> cache before running the benchmark.
> 
> > then run sustained cache traffic and measure occupancy after it settles?
> 
> I assume the occupancy is measured via resctrl, llc_occupancy.
> 
> > Maybe compare full, half and quarter masks to see whether the allocation limits take effect.
> > 
> > Does that sound like a useful direction for MPAM test for you ?
> 
> Yes, I think so.
> 
> Would it end up like this?
> 
> 1. Choose a test control group and ensure that it doesn't have high cache occupancy using llc_occupancy
> (If it does have high cache occupancy then clean it. Probably by using separate buffer with a
> separate control group)
> 2. Configure the L3 cache bitmap for the test control group
> 3. Run a benchmark
> 4. Check that the llc_occupancy is as expected
> 5. Repeat 1-4 with different cache bitmaps.
> 
> However, it doesn't sound specific to MPAM but more like a general test for the cache portion
> bitmap. Possibly it can be a separate cross-architecture resctrl selftest that compliments the
> (somewhat) intel specific cat_test. (There isn't a platform independent way of measuring slc cache
> misses on arm64.) This depends of the resctrl selftest maintainers view.
> 
> Thanks,
> 
> Ben
>

Hi Ben,
I like the idea to make it a general test for cache on different arch,
but yeah let's leave it for resctrl's maintainers to decide, I do not know other
arch's cache topology and such so what I'm designing is very likely to overfit on ARM64.

Anyway, per your suggestion, I tried a few experiment and came up with the approach
like the following, and still have some points needs to discuss with you if you don't mind.

We'll reuse one test group and buffer across tests for different bitmaps,
and a separate group and buffer for sweeping.

1. Set up. Create the test and sweep group, assign workers, init buffer, give the sweep group the full cache mask.
2. Prepare before each mask. Keep the test worker stopped. Run the sweep worker and check "llc_occupancy" repeately,
until it stays below a starting threshold, I set it as 4KB on my testing machine, we can discuss about it
since the value should fit on different machine. And we'll put a timeout for cleanup time.
3. Stop the sweep and apply cache maskWarmup test workload for 3 sec
4. Run the workloadRead llc_occupancy and see if it meets the expected value ( that's what we need to discuss )

So on my machine it has a 164 MB share cache, no matter what cache masks I use, the cache occupancy won't be 100%,
even I use some mask like 0001, 8000. I'm not sure what kind of expectation should we apply on the test,
just not exceeding the rule's enforcement is enough ? or should it exceed certain amount of usage ?
And for the sweep method, even sweep like 100 times with another buffer, we can't gaurantee to evict all of the old data from the cache,
so I came up with another idea that everytime we make a new test, we use a new buffer and a new test group,
leaving old data in the old group.

However, sometimes non-zero reading still occurs, and it might happen more frequently on smaller machine,
so I think your proposed sweeping approach is better.

I hope this is getting closer to a desired design before I implement v6.

Best regards,
Richard Cheng.




 
> > 
> > Best regards,
> > Richard Cheng.
> > 
> > 
> >  
> >>>
> >>> Isn't this cl_flush() used without changing the resctrl control and monitor group (PARTID/PMG)?
> >>> Hence, I expect you are ending up making the cache full of data associated with the identifiers that
> >>> the benchmark runs with. Is that the case?
> >>>
> >>> I'm also unclear how this the cat_test will detect any performance differences on arm/MPAM as the
> >>> perf events would need to specific to the system level cache implementation.
> >>>
> >>> Thanks,
> >>>
> >>> Ben
> >>>
> >>>
> >>>
> >>>>  }
> >>>>  
> >>>
> >>
> 
