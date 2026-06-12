Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013028.outbound.protection.outlook.com [52.101.83.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C96C352017;
	Fri, 12 Jun 2026 12:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781268521; cv=fail; b=twdMCgsO+x9pVu4NXyBQflH7QR76P6wal0V9g5gFLFsL6veGp1tfisKyYG7eItDRo+zxOiqWopdIyWt583NemdV8aTDLdN9bGuIPE54dcp6KNCnmq/xoNW/ee0MpS9rlKmHWMAnCUFm7Uw7F/IEWIwjNmcTV/x5TE2tfeBp8WiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781268521; c=relaxed/simple;
	bh=S1Fku9idmyLAG/VB1pz5tBKaIx8vqsgiEcYlURbzuDU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=B43G2pOzXt7HefxX0uFNmmmnG6rVGYbJHEAOafHAM/QkTFRYanyuTgfeSzBt+d4d2LhFC6G6VQj+Lxh34cGbTmRBQUtLsrl3/JMnCUhCfRJhZyBzTkgMHcBS/xwIu1nzmnHPtPwIU3paQq5+szCc3Zj54xjZ0cQxYtCs42nRVYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=BEp94w6D; arc=fail smtp.client-ip=52.101.83.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b="BEp94w6D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P0qYQbrUAoW7OtYk7wIB0zlfTD1Sj0DToMSlcZ0S6bSIk1AbP7xhHCMaCj9iXgtG8MJwNVugT6PIotQ6gPmWgiJIPuxczEncyzSFjenev3LkYRxbSk0TJmd4ICVTo4/yLGJ8QtLtV0WjiIuxRHUxzk6pdiWZouypQJQ+6KKmLwZUOpPqmqdEf1edLloN3HU/2BH4g0T8/bHNSJoNG6VuIzBAkjCEpFXMnJI5dv+y/9T7sAhnpzMKToSaWXCnMCmaf19kna3wbyHz8n2y7K958XLfS2sWZmbWi12q8naQbYg4k1+8jG/YDoEeEXFvC0N7wseSt0IO4uriB0UCtqBwbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qhJ6F5gwZZs++mJjZy575m3oFfnZD+99/urjkl47p44=;
 b=Gnyefl9Qz5Fxlxw2NtoCu8r4/oypMqF+FZbNdRnNPkLNpR9YO3DkOczlLsZVVHhBgh5IOWpMR8VJ0VYfPQ80NhdovNqZjG+d6ikr2zmaJkKvkUdL7kLsEBLuRERquBHG/gf1qzLAvUg+msH5h6solYf8EksU+2AxfGNb+wwSWza4YhrdYUF59G+uoiHFdDYQDVRKoi+rgaXYq6KcY3kl3C0+f3nAkGcjx3THmIiV7xCYHoia0BVlwImIN2kkq1FWJn7TlQsvdFAVuUxKSVC5eq8bIhyZ56JWpykKDNpW39nSxVi0AnkZ4FnfvX1J1j8XEvUoG64fOUAOLVAYeMog6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhJ6F5gwZZs++mJjZy575m3oFfnZD+99/urjkl47p44=;
 b=BEp94w6DbpnkrGdSvBbcVSKNdB/GRTbBG1hVrsGqKWX/0rIJ972XqCa9NK6ZPjUikjFZ44HQnEbozKD2m8nldi3RsHOLL0+h0WBQYNkof3dnQzW25B3tlAETm0EuHLP2wlru/zQ69hB+IpO4vU+1ZCft+HxhIAUMV08pSle8NKPOiraOfEmkoNWw6H/+9jv+6/z1dn/oqsZgLdwk7C0pyGKQwZHiUwVpfNtZLlt2YF3P4NXkQrZfD+I+D4h4Eni7S6dQKzuo47xG1HrpArtj1c1YDr0gGeVLhLWS41ck/1Mk9bIqLZQi/iSSDp8TEex7LV4t+9iCkgUfMY2yhpFdDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:39b::19)
 by GV1P189MB2012.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:63::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 12:48:33 +0000
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4]) by AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4%7]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 12:48:33 +0000
Message-ID: <c6c9a442-7dc4-445f-be76-30398f965ab1@est.tech>
Date: Fri, 12 Jun 2026 14:48:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 01/14] kcov: add per-task dataflow tracking for
 function arguments/return values
To: Julian Braha <julianbraha@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Kees Cook <kees@kernel.org>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 llvm@lists.linux.dev, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 Yeoreum Yun <yeoreum.yun@arm.com>, Yunseong Kim <ysk@kzalloc.com>,
 Yunseong Kim <yunseong.kim@ericsson.com>
References: <20260611-b4-kcov-dataflow-v2-v2-0-0a261da3987c@est.tech>
 <20260611-b4-kcov-dataflow-v2-v2-1-0a261da3987c@est.tech>
 <2e528372-aba4-4621-a9a3-7ce23571ef37@gmail.com>
From: Yunseong Kim <yunseong.kim@est.tech>
Content-Language: en-US
In-Reply-To: <2e528372-aba4-4621-a9a3-7ce23571ef37@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU7P250CA0016.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:54f::24) To AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:39b::19)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1752:EE_|GV1P189MB2012:EE_
X-MS-Office365-Filtering-Correlation-Id: f2f6645b-8991-4292-53e9-08dec880e9ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|7416014|11063799006|56012099006|4143699003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	5U6T1BnB5CDRL04llyyeBLFqtaO1QJtCCk7FgbvuZym2XkXhPV+O+90NfZzwfYdVJPZQF1G4hiP8khE7JD8Ki89QLVY2n0ik0xqxPKVb9Wo4Rd9iHy1+AOxX2jbOOZufq/MdkCeHBOjQjEaKuPkg34+QTwApTx4GnXlFdBsadutW72ht6GdSRg/mxgB02m+ecO49nIvcSfEozOiaf5BekhlwebBLetqBm8jfZ3YTVSg9XrjpXTRRJ+lQpfc+pvT3KgbOFxeZK67VqSJscBdcXNXsGVs69E6MOq1U2jzn/Yxw0fZVsxHe/e/j7O9irKtY6VAk2Fimu6lA4FJXxoZRjCBwbQCFMR6tC5Qfy+FJOM52SIYbKGgA1MuDlqLCOh2DFKnpIG1dI760HAqTg0yfDiOX/x2CHiVMhJTDcDHYQeZbstVZXzeDKpoO/Bz2a+btRZzgMVXQ7PWl2PRUsyRzpP1gtIpDn1U/qACYuWjfqzKqNHCwAmNuj88dkR5u4feAowX3Z34G9Ucr6xlT1YURpAMRi3W3kJTkg7OFmKxd7q8L7z7G+51I3asSvhHhwo6vxCycKhTLOuuj7zpNc4UPMy1vCTZy9UJAMdNyf0vuRbYtQ2IRxWLSYppyp+Ck/MR4nQLOuzRk9lMUTMt0Ay2l8oDNSyj2ZkRjAXk6tUt+uHnTC+BGl8wGbX+j9i8muvcjh3Rab85h+PFcHxmFEDzn6nR00OeaXSFJiu7+rnwgbgs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1752.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(7416014)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEdlcGtRS3NOV3N2L0J5enBjK1cySWhaNmw3NENNcDlHOHFEUzBESUJSaFlW?=
 =?utf-8?B?OWxJN1puT3BmdVI1OHU2UWpaS0tOZkFyVEJUSXNaQmMycnlHSGkxNWZjNjd2?=
 =?utf-8?B?NUlwK2g2SDBPNmZlVGVyY3poblNGL0REMHJuMzF3ODN2ZENodlZFUXFxZ3Fk?=
 =?utf-8?B?Wjd2KzhSNWpacXlRVmtXbStjbmFtZHAvd2Y2dEJCeVgyK2FjczF2ZkRncFNs?=
 =?utf-8?B?TkcyWEZTd1RtdkZDR1gxdXh3V0FONmpTM0dCVSs2SmY2YkwveW9xb0lGMlU0?=
 =?utf-8?B?a21YazBLakR6WjRFcTVDb1FtZ21GYWdTV0tVWVFiWWQ4dXhkc0d6d01UMUhJ?=
 =?utf-8?B?Zk5YUVowM2xrNkJsVC9vVDJSZCtDd2pFQzBRdFdPR2F1VEc2UTdSbTVoaEpi?=
 =?utf-8?B?QkxsU3ozQW1KM0FQTHhjdTRYVCtncmVqS1g3Tm9jTVpiQ0hHU2tpK05ZaFk2?=
 =?utf-8?B?SUtzQWZvY0VNc2tWdzdjK2x3TzJOWmVNV0pSejEzZXVaa2VvQ1lqMEVCZVRW?=
 =?utf-8?B?VjFHSmZSS2pjcGxVY1RLNkgxSW1BWHEzR0NSaFlkbjh1eVZYdFNyVitVd2FB?=
 =?utf-8?B?bFBYY1pDTnVKR3NmY3FxOTdpWXlmTjJyOS9jVVJ5OTdNcUNFY3VYTnIzU0M0?=
 =?utf-8?B?NDJiMVN6WXdsRzBaVzFzelBzL0VFK05GeHptQjg2aDREcU0zbVZrY3cyUE94?=
 =?utf-8?B?c1RYeURYa3d3QWtxS0YyU09GRjhtOUNZbjZHQjY2Z3RoVHdKVkVyYWZoNEVu?=
 =?utf-8?B?MUlKU0lPVitFTFBWQWJjejJtbmliQTkyY2luMzBZbGZXNWdJSjBmc1ZnVlZj?=
 =?utf-8?B?ODA0WEttbkNGY3h5a0cvZGROUXlVejRMVlZCcHFsMzZuMDFZR2lzeDZBdlBv?=
 =?utf-8?B?Y1BYTEZ6WkVIL2V4dTZURnQyK1VLeEp0L3Qwb3RkV29wekg5T1NBbXAzVmpk?=
 =?utf-8?B?bVV1cE1sTEtuUzIzSmdWaHlrdTBOazVzYVNYcjNsSEx5R0w2Nm15OWxsQVhR?=
 =?utf-8?B?cFdLc3RoNU5YclhSdUlxd0VUMFByRHVoR0VQRVJudFR6eWx1MXRiR0k0akwr?=
 =?utf-8?B?dkRHWVMxNGJIdFo0YmtqS3dOSWt5aVZyOExJVVV4TnpTUTJQaEVlUk5HY1l5?=
 =?utf-8?B?QUNXSUdHYlFTNFI5YVQwRkE0aHgwbUtDMHdONmwwdFZ3NzN2VXVMNXZZdlI1?=
 =?utf-8?B?dlRjQzNNSStTTDQrK1Vwa2JzWEhmaHgyNkJ4Vi8ydmprc2l1YWovSll6MGxH?=
 =?utf-8?B?bEJDNEFVdHordnIxdnN5bFMyV3hZTXlqd1A1YnEwekZWQWNiaHJqd2lQZHUx?=
 =?utf-8?B?a2F2U0c2dUdHVDR6QnBacEUrVklYa1JGaEtRSksrY28vSW9ILzIxdFJxdVda?=
 =?utf-8?B?eWJGanIrZitLVHJtclBaTDQvOUlLSVphUFd5d3NxL0ZMelFwbmxPclovbktZ?=
 =?utf-8?B?WmY5Yy9uQWtlRWIzbWNVOHJDNzJhdjlUd2tLMmV3TzBnNW03ZGYyUnpDb0hQ?=
 =?utf-8?B?ZFU5QnBhSjFaOUM3MmtReUNNNTBKZzFVM2JsaTBrSHlOK1ZuVm5DNCs2dXIz?=
 =?utf-8?B?Q3dWYVhwNnhaWjNlRElnUzFIdXVTWFJnek5vQUVCKzUyQlBLTmFhb1pNOGlh?=
 =?utf-8?B?TGdWMlVTcjdyb0M0VVBHblc4S093bHRFVFFiU1FoTVFtMDU3UVVyUk1GV01h?=
 =?utf-8?B?M3A0VVpXWEFvUkdFMVI2TzZ2Zk1wc0Nobnh1WjgzR1g1S2VEdlg5elVIZndG?=
 =?utf-8?B?WTA1MS9pa2FGM3NRZlNLMXVrTnhmMk1HM3JjZ2htNXhkSUdUTzZGSjFMMWJm?=
 =?utf-8?B?NHlFMno0SDdaeGdITThpbTNidi9pWmoxZ0p4OG5GaHFlWTd4bytZU2V0M2xD?=
 =?utf-8?B?b3ZURGN2SHF0elRFdlgrVHdVaU5IcjRVdi91aVB4Wkp5dE1NZFZTVmx6Z2FH?=
 =?utf-8?B?dWtIakFPbnAwTGEySUNyMVdTTDdLbnlNbG91bmJEY1RJbHVVdGFrQ3ZMbFp1?=
 =?utf-8?B?ekNpVmVIMWhqSStwU296YVNHN0YyTjE5dHQ2a1ZoT0ZDdE5hTUJiVnlrWUNY?=
 =?utf-8?B?TEFqRklwTVgvWVFLVjJFenNOdUpZeXhnSUNoY1ZtaW14S0wyQ3lPTkJPblZB?=
 =?utf-8?B?TThBeGlpeXZBRFJGb0xHM1VBT1FoazNyQndkc2l6YmRNUG11azBQOXpBUTFh?=
 =?utf-8?B?L05lK2pjSjRTV3cwRklMSUlxaFpKNmlIMS9GYlZjcjYwckhvdDJLTXl0NnNr?=
 =?utf-8?B?M2h0RW5KV1hObThvZXQrVHlpTnRsaTN4aXpqMk8yZWZJYkNpLzR2MVdUWm9D?=
 =?utf-8?B?amFrektHT1VhT0lSTXhaNjc2Y014L1VDb0RycDZkanlreWZzMlZ1dz09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f2f6645b-8991-4292-53e9-08dec880e9ba
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 12:48:33.6966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7M+qmh8y8Ax210ZF0acDEzF9PvODQbaUd+y7Df9sr+tzeZaPuplg1BQoIkAS7UM0D+q87QQK6Vct4DEjgvbQGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2012

Hi Julian,

> On 6/11/26 17:21, Yunseong Kim wrote:
>> +config KCOV_DATAFLOW_RET
>> +	bool "Enable KCOV dataflow: return value capture"
>> +	depends on KCOV
>> +	depends on DEBUG_INFO
>> +	depends on $(cc-option,-fsanitize-coverage=trace-ret)
>> +	help
>> +	  Captures function return values via /sys/kernel/debug/kcov_dataflow.
>> +	  Struct pointer returns are auto-expanded using compiler DebugInfo
>> +	  metadata, recording individual field values at runtime.
>> +	  Enable per-module with: KCOV_DATAFLOW_file.o := y in the Makefile.
>> +	  Requires clang with -fsanitize-coverage=trace-ret support.
>> +
>> +config KCOV_DATAFLOW_NO_INLINE
>> +	bool "Disable inlining for dataflow-instrumented files"
>> +	default n
> In Kconfig, when you don't specify any default explicitly, it's
> implicitly 'default n'.
> 
> I think either style (implicit or explicit) is fine and both are used
> throughout the kernel, but is there any reason to make it explicit only
> for KCOV_DATAFLOW_NO_INLINE, and implicit for the others?

Thank you for pointing out.

You're right, there's no reason to make it explicit only for this one.
I'll drop the "default n" line to be consistent with the other options
in the same block.

> - Julian Braha

Best regards,
Yunseong
