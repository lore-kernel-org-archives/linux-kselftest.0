Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.2
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793899274;
	b=AZdwDVDIKD34NdZ5g9P/w5YruymiCXsH04v4EUUajp091Vb6XIwfZEV7vBRwxMOMB8IB
	 f3GIkGOXAQaj2rtf/L6b4WQoufOJmEk1eW0pEhbAOLsNx9V+JXNHehRNeYhutKBufGcEj
	 VUEGM9wwg/v6aEjVtt9YM6UbX3uhATkI682kG0Q0ka2HtNzVRgYAxbL7Kec8zx892bmxH
	 SptwMsa4GkECdd7JHdE/1L2yCZsVG8qRi0BtCExauZYgDfG7+/9t0TOV6+ZhE9h37Ll9c
	 6Y/kpLmbTTHVY+eyzb76FswSQNVbWIdMSRhCm9aW6fpONYggReXeYpl5uLRrR555suA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793899274;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:X-Mailer:Message-ID:In-Reply-To:References:Content-Type:
	 X-MS-Reactions:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
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
	bh=dcqcYW3CqDcVHuMmYkigWSka/w4md+kOGUL0W7bhkjs=;
	b=nbVCozxAHMK21UTvb4pTomCC/5V+kbsLjGZgF6C7bVXc2Zv+Qru72u0kpHzV6of1LHeC
	 7Fd//kPywQ+7vi96BnpkD/5jc3M3u/frW9PONAaRSfOXfgV2iZ1/NG7tWAhnLjZf5ZqTS
	 bftIEr2mFf4xo5geGs6HVKZyimFGfQcMCbQeKPvYv9EkvxtosiYlmQWLsgG/kyBMd8odi
	 8piSMxTW2AJPHM/eRAEAt28zGbkqY7IC+vxRIOiZP2l027q8+OfZmlbc6HrIrcBxAqFp4
	 Tn+raaFR/GTS+nY8HUo3cxUA6Z7bF12QVJvggCQpD5KB2bW35rY6Lge1zhkHlUS3kyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=iMm4qeok;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.2
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013002.outbound.protection.outlook.com [40.107.201.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58901606A332;
	Thu,  5 Nov 2026 17:21:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58901606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=iMm4qeok
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lS/KM6TeI/tD7ndQKS6sWJSaMv5q24wzLkUqX1qf3qWGnW/kcXSMc00ljDUJHwX1eks9AND48yKoUWHFmOFrMVWhOtSjZGbtGGnc5QtnSIznWHG+SgtMZD9C8bV0RnS2MY4Nf81V2G09z6KGqnbyjoyee/mRshWO4t/y4Ps5KLP405furTx3Lp+Pjhco5yV01/sPgZ2Y6z1AK/onH4kfOGw51zIcyB640JJinvJYYH/oK+MF9737PFpSOCOnXJ4wkYh0WzH0VgJQ3uHW2e/GijZgYOxdD3MnWNPteYxUKpknGs919Y59VLdVVE3eNjkQotyhKTqlTaMVrEBeUA1JVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dcqcYW3CqDcVHuMmYkigWSka/w4md+kOGUL0W7bhkjs=;
 b=JghLCq561eulCU/V8eSehbrzkCg43fwvPzLxh1IxfgL06kZr5sGfIb0Z74HNTlniQFalkcJl3f9tFUuC9VWrXstqmea1Tn4Yb1RxLIJlOBUHATe33137jvFref7PRyMwcvX10tVjnqS0XxDB3khh/FqEP7q8G761+39twPYBbLmeVU+RYOMp7rB8ysT6hECyDAtDI2VUML4HicdhQz/zQtvu1stlZc6EZ5GmzsAjtJ+zTawJ0XQnXES5VL1dk1oH6n/0kewG+42tJcuJ1X2UQhTQD+yfjn9T/WqkwMKgPxsetIaR1jUFn4IUDJHvR2cFHycvzE5u/1isq+Q0/GAMZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dcqcYW3CqDcVHuMmYkigWSka/w4md+kOGUL0W7bhkjs=;
 b=iMm4qeokznQTe1ZV28cI+EoIx6wVcWXrTJ4eZLlLPK7csNLApeQc5k6amknkBmVr9YypPG6tR7CSTkgCoU87yk/AVNdzYJepThCXpfR/M1kW6/x6Rj96RWvZCbY1ggBLpJyXcMtfdE8HKy/3Ea5BzQ6F1d2e0+a39WxeITDI5J0OT+udA6ZvgDk/iK20YyuSWD5luSirB2BB9iiGj72qIoHLJtR2BWH9+8f3a7XGnESBwyPLXQgDjKkzobnURdv+OHnoxcl/KbrL1RGknaTsck8oWJL+tHFU0B1/NpAKSnlU/IeP30bbp85lTjnucRFoJ3yyJlUCIUwLigoMBXiTxQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by DS2PR12MB320397.namprd12.prod.outlook.com (2603:10b6:8:70d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 17:21:10 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 17:21:10 +0000
From: Zi Yan <ziy@nvidia.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: add CONFIG_DEBUG_FS to the config fragment
Date: Thu, 05 Nov 2026 12:21:08 -0500
X-Mailer: MailMate (3.0r7038)
Message-ID: <3BC61F94-0385-4603-B12E-BEA458BB307A@nvidia.com>
In-Reply-To: <20261105171801.2189772-1-sashal@kernel.org>
References: <20261105030242.1241448-1-sashal@kernel.org>
 <4B926B36-D797-4861-B6D6-27E8D7870287@nvidia.com>
 <20261105171801.2189772-1-sashal@kernel.org>
Content-Type: text/plain
X-MS-Reactions: disallow
X-ClientProxiedBy: BL1PR13CA0179.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::34) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
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
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|DS2PR12MB320397:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dbe5fb8-d6af-4462-fee6-08df3b612f37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|18002099003|10067099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	Y2Wy0zoChY35iiDxQPNGmL36chYAnPVsod+CGZDeqk+9z6mw/52Ik9n/ufwmH232llzXNFu83QRWrQk1iuTfOTIq14oClzk6ww4LCaxVnnyzB7Sqpi++w3XOlxnbAKfZ/NtHzZOvN8ir9BcsR3CMw9irfc9OSMaz4f5axEJdu04lKR2tWJHVjbbfoo7thYTvH9rjs8jORJOfIlfLurrWzUFc0fh6oN+u5CatL+7wPV4jd5RwR4oUrhRo+RB6EbxlOm7b/LW306+T6+4vU8hl2v6QYhjvFWfJCfekcZKLPulYpdBXx/6fXQMZfsX0JebptGtGgIm6ZNAUZbD+VA3T1mbonVvbAqWLXmo3hKV6lRSeKIQLE2Cg0XdwUKSiEyDoja8FQwDf6Hdw+kyQwe4SgC/bdngVveiICVaZc8nbxYfj53r1xNGAascu5uOjHAATx7O0n9jI0D92GjPmiz9JBn+k3GNvl+uc5eJX1SeBgaaXF79IlQ1P4OrDC//ufN41pesunccRqaWg74I/cvw6lO6VKcUQJppre6sz88DqsPOaJc8opzuShBwqbK1W8OiJc4ohItce9R9LrSGjytbgabBbcq2F7kCSuXcBV7SzZKN7v3a1NQeinFzA7dGV7Wri07iHYhH5EfT1alEb5yFoE9BKOFZza3NJ6LqYdtJNMqg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(18002099003)(10067099003)(22082099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4eGZplk78v6xwr22DbpLXAwr+OvOI1LERdpuKmh0JyxYvELutK6pE1Pz67A9?=
 =?us-ascii?Q?dGy8CfTZVc1Z82SaWd37Tj7SnwePrUyu6opbItLN/dtpYXUDDhHIsC4sVAIo?=
 =?us-ascii?Q?rWF4T2aNBnZ+jrqOEczjzzRVKgsHmJQ4rPy2KoyAnwMjvtsYQl4iHGShvFku?=
 =?us-ascii?Q?jrv4/6L2VSnFdpluuWuSFEV5YAolbXAJB1nbI7CbX2bG04jIVW8wgKFNdbIl?=
 =?us-ascii?Q?PowsmYPn83q1taIJaWeEySpCruo21q9ZIEYFHypllxkXs1KJS9QCjkqehxrr?=
 =?us-ascii?Q?GP5EMPlJE9llgnHQigHw8kpJdjBf7j90WbussL/h4flVzyebLgMS3xCYeEqS?=
 =?us-ascii?Q?382Q/mDpFxM2SEVgvMRUaYLMamkUGMf+L/F2QtFlhoefE3FWW+uY/+4DITC7?=
 =?us-ascii?Q?qHcBUZ/ICI+Aby+qHVEBYl/fcdSbB/f9p+t9ZR4t3gumMJZ4n3WWkGTJdXxm?=
 =?us-ascii?Q?F8Qk7+hoJjeiJppoHx79YKPH+XtGc6SP1x1m7+UA5Ik67fnJh0JLcX3uuSJ5?=
 =?us-ascii?Q?Y224dE2/zWSmoxKMB3q2NODhtCnrOOyMW152fpFnMQbVbUmq3Cm2Nnty4/hs?=
 =?us-ascii?Q?GhuyJ3Q5qzHpL5w2QqAT3yTTvtFohCU+ZTIZN+cwCW77YhsQsfTIYfdu7GK5?=
 =?us-ascii?Q?m3W5Xgy8s5YtYQF7OpUV6O329jglZoTUIELW6WUvKv1B1DyNouVfp9rjU39J?=
 =?us-ascii?Q?DuJLxSLG5z7SuYlRXpL5pcKoO8FhdUCn5Z3kRXk2frJ4QkKON9PSxhVyJNXm?=
 =?us-ascii?Q?9kMHxnm4d0O5kulw3NaRQz3RKkFi8vmBRPVdAVI24VNV8frba5wXwI4iQevS?=
 =?us-ascii?Q?daalEsnDLTyLftTgBdWETE35faIdwzchox7fMAs3RlpJLgaJfMc2eefiXTMF?=
 =?us-ascii?Q?fYJtWiQTlW90Zu5Kj81oYO1bA7z7ggIdctPOSZClNclW5VObl2FQ3OBak7C3?=
 =?us-ascii?Q?4itOtl6oTUChO+Tk9F+4QvoIvrnxH0NcZW3qo2dUA0TkA3TktWtv38DFadg4?=
 =?us-ascii?Q?C3qRUvfCxhz9d5IDE9oh4GueYAHVBdNHUzs24bJa29Hjxg5XpUGGcAB9w2MZ?=
 =?us-ascii?Q?UuModgjVvma4XtTL09LzPYrmYfHl3FKM7DUKCvuCzW4+Yo3Vk/EJsaQ7jrPo?=
 =?us-ascii?Q?B2IjjQqXy5AqfZ5kK6FXvB2vnR3LXE1E9VBSOWKHZl9SJbpI6gnbRLcD2wec?=
 =?us-ascii?Q?o1gsdNwdsT/OK/2Mhb91Szqrwzbvk1EPZLQ4git9U1wj/q4IKZ0NDDnKbcOk?=
 =?us-ascii?Q?11GamhQTDRk42NyMRfx7L7bPoOw5592VeFSbDFaF59BQC4BZYQmzeP8Bt4Md?=
 =?us-ascii?Q?LjYPwGUAEgX2ll6F0etnjVFVwcnJn7/ENEMXdQz9FdA/Fdid8ZROYCLzdExz?=
 =?us-ascii?Q?9vhhyTegdlG70ujugKurQ63oc+6HEf8thkCXpiBaj2TYCnL3dV3xtXpcfEiG?=
 =?us-ascii?Q?7hURkCrKdD66iyRG/ACreDtvFNUuMpQWDiIRq+L75sIUXOBPlguGLgeCYjPh?=
 =?us-ascii?Q?U61hMQP7PWElObFt62rxLKfOiM5/jteQbGH0cT4KSm+1ZrgizSrDwgj+RBmk?=
 =?us-ascii?Q?2J+vE09M89a9X2YbbWsVtm9UztNqGbux/v11rNlNMdn27dRtsW35d73VucVr?=
 =?us-ascii?Q?u2Fe9tAFjaKWC8qhSxS21tDLWkh5WY7MEXMcYJLU+0nsVWfpLR9+gnpj4iaV?=
 =?us-ascii?Q?h6KTk9oLRhjvB34CNBc7USYf5TENcFRIFeJMOltr4vjH+PP5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dbe5fb8-d6af-4462-fee6-08df3b612f37
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 17:21:10.1470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YXDyTG/McI/qKkUp5O/ariTbVfqDwNXHfrIdAmr/Ysq1gNj943Z8ydfjwh7OEPBQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB320397

On 5 Nov 2026, at 12:18, Sasha Levin wrote:

> The split_huge_page and gup tests need debugfs, and CONFIG_GUP_TEST
> depends on it. Add CONFIG_DEBUG_FS=y to the fragment.
>
> Suggested-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
> Merged into an x86_64 tinyconfig, the fragment leaves CONFIG_DEBUG_FS
> and CONFIG_GUP_TEST unset without this change and sets both with it.
> x86_64_defconfig already has CONFIG_DEBUG_FS=y and is unaffected.
>

Thanks.

Reviewed-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
