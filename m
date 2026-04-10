Received: from YT5PR01CU002.outbound.protection.outlook.com (mail-canadacentralazon11021083.outbound.protection.outlook.com [40.107.192.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3AE201278;
	Fri, 10 Apr 2026 12:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.192.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775825325; cv=fail; b=lNKZEF1OAgkcNB+I+PVKzjP7akRvQveuT09tcYVVKrLTMDhfPcej4bVJ4UINjv4OYWboTF0PQKXdGuhEUeATgzpOpUAFJdDyAL4ewanrgkRV0b+Lbn21oYkaxILcmwcOPI/l5TzZApFfnZhgKTsThSr9ULfkjavaVJ+dahQb2Fs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775825325; c=relaxed/simple;
	bh=hyczELkHkG0qoQOn1c3XZ3wEqa0nS+8b5x5lqwPmCmk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BwPLd/7xUFM7KNxYCEFaLy7aEur4yOLSDiupL0KZlq83cnG6u3b4ZkC2G03a0yAzljCwCSMtH6jyANSLJF5qteLD1ivFzy3yVoEWemJR0WlLzOjcobcuKcokSSFrbxpns8r4kpDjBCpCwHWN9ZQrSORaJO4TIKun01B26q0IRB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=I+3Y+6pY; arc=fail smtp.client-ip=40.107.192.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="I+3Y+6pY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YIMvubH7vTwovebPuPkTxzL4W3h4MV4D5a1WatP53Lu+I3f3RsTmhUBB+/zzlcZIObt9huJ2t96LrR4Idq5KmgsMEKiHiOD+vAzaD+iPiWE3ALR88fm/7MoqCBxoXv4SGwLf4MXXOJPf5lI/KXz13F8dstMvZPq76+ao39hnhkJoDLpGERmyRn4Kju2GRBYz14uG6QXcOysdWjg3MYVeImN8oDeCRWrsThFB+ZpyxOSk6FnveFz+2n11H3XFj+9rBkvi2U2LrfwUzqCTFhxQmQtnwqjxPHlej/IYUfrS9x37LGObb2YYV64ZOwrVcn5f+SBhwOiqvNcU44yIFsuymw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l05lheSnn4Jms/PyuDkq3jZ+ycXVhaeesM4LaUQAkhA=;
 b=R6EOXDU/VKAQ6VLTE4rbNTObi3VqpGnZ4cknJDVCyLzODiW5kkQnOR7DP0gJoPNld8UDbFMwUXYzRNtanzjJfyfda4wa9JfscBvnVJtdq08WeuxvAt98LePj0UMYDZ0kNL1kSzmuqXWRHzeyQ73u+FJ3YplUNa/FSghP+ooJxkEbIPGuF5ZXPBIDo7HgsLIIE8a3pvmluVOgQE4yZ9VGS2S9DBDSCEQWY/gYTGda5DFNv9dcgNHjM5bSiUxHMqHDxJVWqVxyry9FZ1dN9HiGzY/cjClj0ioN99EGMPBTMlvoL7nl9qzsUXrgyE6rkk8gjoktwMTQDS9VJh/+UeDY9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l05lheSnn4Jms/PyuDkq3jZ+ycXVhaeesM4LaUQAkhA=;
 b=I+3Y+6pYE1qO4SjIccUwL19uyr6fEj3iDStAt3Iji3ih94aFb5onNu7Ak4tTq0J5WRQEStlPY8IpS4HqHRByVC62ZmJ3M2QmUFKrs02eVNpLPiVZ1zrAUWcA8SiC1ZDxCmpeSF79a3Y+ZnPQXcNT+pcHwjnf8eHr3p26TzvkFIiF9eFiTxUQK2Q9dqBYEVqJDHeB50Jrm2xzIe+1NIlZoJ6xSRWkI+IQwZDSLaYUHyF+gmeCU6v9lz8TZ/b49oW7Ve02R1DbzxDzbb2OxX4G2VPgv7/LCe4DsX1RkTuJFgsfMjtTQebnvfHvclt141sP6hQsutZ0DdzFVApYA7iDbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YT4PR01MB9896.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:e2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 12:48:37 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6004:a862:d45d:90c1]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6004:a862:d45d:90c1%3]) with mapi id 15.20.9769.017; Fri, 10 Apr 2026
 12:48:36 +0000
Message-ID: <addfe6a5-f773-46e8-b0f8-1699034720eb@efficios.com>
Date: Fri, 10 Apr 2026 08:48:35 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] sched/membarrier: Use per-CPU mutexes for targeted
 commands
To: Aniket Gattani <aniketgattani@google.com>,
 "Paul E . McKenney" <paulmck@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Ben Segall <bsegall@google.com>, Josh Don <joshdon@google.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260409212223.2072418-1-aniketgattani@google.com>
 <20260409212223.2072418-2-aniketgattani@google.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <20260409212223.2072418-2-aniketgattani@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0160.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::33) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:be::5)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YT4PR01MB9896:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a306bcd-e6b4-47e0-635e-08de96ff7b6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5Tli/tESWn0nu3jfmQi/vhD09kV9Q+Xzt2DykO304ILnyUMXe462MrugT2YCkFMai/sp1dGA7Wc7ZY+Z+NPDKKygOj6esvHmY651hclW3yRD5GIa67muLPzi1yVKw8EkctM63274S5uNbvvz/hUgZJS1rGzU+UmApnWkmee53vTIocycjjxcFz3K6903jmGPJoXcfbZ44b8XaO8EnktgB3TM+DIAUqYejcSCkBz3IKA2VIrutYHz5/bHfuDsqjx2E6WqS8cnrXnyTCq39SXwuhlGm9dfhIpTeewhZukTQOWr2FZ2hDncCjyzildZ1wrk5exEKLZ2Cn5PV6Uhg+umqmg5SUuDD/K3BdUVYCedgJ+BsqYYuf2MYoYDO4bEFe/uL9QqAsePSmjYtjwBeEBrBsfuIWAdjhoMxKr78/CQ6GtzpaFJMXN8IYxow9t6X7VMA7FIiASXWsZJlZ2G8N5S8HKCtDXZ088Lr5e7rdSAZGabhGfIoIZ0fk2utraRaJFegeEcISiwWtGzttYY+8QZg2ej9BAdikxYPla44v1BNn3AMl8FDHoRRUICdfVzcpQS1rBOQ2DEt0R0poYltuZfwqmhtPfCQxZ8XkSK67vGRPA+6PtFPO4HZaZQZFkmv6IODPuZ0KfSt/LhX/iCnbuOVUXaLjF/nzj70vRsqMzm5mG5xTfqCHkvjzjESnqegTDx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REhxb1VBMEhlWjFKdHltTzZ0T1VXZld4NHlWV3pobFhPZDdzTWpYb2xqbFRv?=
 =?utf-8?B?dlhkNzBSamFVbnFmV3oyOVIrNHQ0SWdyZUo3aFdGanlQYVNJVnFJNWI5MzdG?=
 =?utf-8?B?ZUM5VGNLZmRnZlhmNkFwN3l1Wjg3RjlDeFROcXpqeE92bUEybHNnbEJnN1pC?=
 =?utf-8?B?ckpGTWVzb1Uwem0wblQxWUcvVXJ6OXpRamx4ejR1TEpwM1JleDlEamljRVJq?=
 =?utf-8?B?VTV1cjQxOENheE0wMGVrOEU3N2NrbzRocnBGUG44SnVEclNZL0IvcHJHZlFa?=
 =?utf-8?B?OGVCbzBwRi9zTUNlbktJZTBwbDJDUzBUbXdwRWlvMXJZbjFOYlJHL1VrcWxY?=
 =?utf-8?B?ZU1IMzhhQ3VvNGp2MXVFUkp5WGY0YWUzNmdVaVlyeGJlTUoycXE5QVE0L255?=
 =?utf-8?B?SjViR1p4eENHdmYrYWpBUGdZU2VCMmw1SnFUN0R2Z3BYb29udjZXL2xCRU9x?=
 =?utf-8?B?RXo2QkdxUjBTWkJ5VHVSZnEzcTYweThhN01BWmd4bmFaL2lKalpzMFgvdGlx?=
 =?utf-8?B?bDVjNFNvaWxzRGk5SVFWZzlaRlNGOWNEWTFyVlpLS2luYU1RaWxPM2JLUlNs?=
 =?utf-8?B?RXJyUEg4SmpPam1ZTlhETjVQUW5OYXZ0OExMdHExQlgwa1RzOUxvOHl0dzVo?=
 =?utf-8?B?VlZURUFjRS9EL1pZYWxhNEovUTY4aEJXWExiV1NoUS95MGQyYStveUl1cjZw?=
 =?utf-8?B?blFDZHNsRTZOQk5HWnovRkhGVVJTY3V3WjZqbk16a1lSb01TeGRvQ1lCL3FG?=
 =?utf-8?B?VEhYVWFnbEN0SVU0b1dpc3RUdDJ1ZnN5elptQlNZUlB5YnY4N28wYXpaZkFh?=
 =?utf-8?B?T1N6MG1WWHZFTEJDaEQzSmpVUHdGa3pNS3h3U1lTRFArckczM0J0LzAvcmVa?=
 =?utf-8?B?ZmZJZ0FSQ1FLc21ZUFZvWlQzcjV3Y000R2UyQTI4Z1ZuZTdhMGlGTEtXd1R5?=
 =?utf-8?B?WnFyRGoyVGtkRm5ibG5Gd0F0NEp5Q0pEa0hEQ0NSdmxIN1k1c2VtZ3ZFcGNP?=
 =?utf-8?B?b0tvV2pqY2h2WngvWEdUdCsvRGx3dUFiVUMwcWNLRVlVMmFxRGFFRGFTZHdR?=
 =?utf-8?B?d3VkZWlUeU9RbFkvVmFRbWovZ1g2UEdtVFdyaXNIekxvK2Eyb2x4RC9uejcx?=
 =?utf-8?B?b3Q0UklXQjYyb3hvVXRBMmhpeExHVjF2V1ExQ2pnL1RkS1lLSndCNTkxNFho?=
 =?utf-8?B?cVBWdXRrUnFrVFdqMVBGUlIra3ZvUkR0citGcVJSNDM2OTZnMXREQTZkTi9S?=
 =?utf-8?B?YlhtbUxETGszc3A2bS9IN3J2K0R1b081RVZXMXg1ZjVWM2hTZWJXbTF6SjAy?=
 =?utf-8?B?SXpuZE9ZSGErOWJseFBSQWZXWGFYLy8weWVQNHZZZVVLVzk1aGFuc1dXc3ZW?=
 =?utf-8?B?L25salZwa1ExRWRma1dzVlNvSTArcVk5ODJ4RDR3QUFobXJPbS91aG02NlpV?=
 =?utf-8?B?MlBXb0NKYzAyYXNESlIvMjhqcFAvRnFUb2VUT1czUjg1dFJ1OENSb1ZSRGll?=
 =?utf-8?B?V0lDcHV0S3crQjNSd200VjhudW1wVng1R3RBWFZKNFNCSUlpNDVvUUtFWlFq?=
 =?utf-8?B?THFtMy9LZUZVU09MbEFicFNkMWtkUEdva2FGMDY3ejFZZlkxdWlTN3BhZEpZ?=
 =?utf-8?B?QmkwOVZiVk05SFh2Q3EwS1pIaUtlTU0zRFFjeXNWbUxoM1F6Uk1iSDljTjZq?=
 =?utf-8?B?V2tkZUVpbUR0bUwzSmpZSmM0UmFteGtQNjBZMTVFU2daUWNubjZwdkk2Q1dN?=
 =?utf-8?B?bCtma05haTFDejdnekxVQ01lYkFQWFlRRDkvSTRjZ3ozK1RObGQyWDkyMXd4?=
 =?utf-8?B?cTE1R0RCQjZ4bDkzTHpFQ3BnMTYycGJ6bWFiaGcvUUlMV2NmczFpeU9qaE1t?=
 =?utf-8?B?UmdGemdYUlVLUFVoQ0VrQStlQXZaRks1RG9OZ2hta29LNDFLUStQdnRYWTZB?=
 =?utf-8?B?Ti9Zd1lqQTJQOWxPbHJhTnhlV0xBdU9iOVg1bzkwNWJvUGFBNmc2MUd2aEpD?=
 =?utf-8?B?bndMbGcyTUMxSXd1WUVHTTdqdUg1RDNCK3o4SXNHMGZTNUxOdzBud2NRVFN4?=
 =?utf-8?B?NVlBVktHTWt5SDl1eHV1LzhTanpETE42c25SeG9FNGpPYTNrYWxVZjB2akVO?=
 =?utf-8?B?QnUvSXZSdVl5ZzAxdkNXSG1Ucjh5WDlLb2ZQK2IvYTYwZHpCMEp3a3BEcmtC?=
 =?utf-8?B?d0VxVVBSeFBkV3RtQlI2alFGZFJWaGVVRGdqQWIwVW5UYWxQU3hSMEVUSjZN?=
 =?utf-8?B?eXRjRnM5c2pCcWUrTnRONExtWEFzV01qK2w1Z2R3SkxWWW16MmVzZ0lnbUIw?=
 =?utf-8?B?NklUU2hTNTdiaEJWUUhSL1BPZytidXExS1BieC9aK3pqNEN1c1UwbmZrdHVj?=
 =?utf-8?Q?hziycknnsn8nn2uo=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a306bcd-e6b4-47e0-635e-08de96ff7b6a
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 12:48:36.7224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gzAemkk+kf4fQwKnyyRMjn8jLOCUEyxE1EP8mZQpcNpPjvB3WA5sr1KSZYac/hJsmt9qYP5S1xvE7JtSNltB+PSMr3a/MBNYGmmOu9GTKGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT4PR01MB9896

On 2026-04-09 17:22, Aniket Gattani wrote:
[...]
>   static DEFINE_MUTEX(membarrier_ipi_mutex);
> -#define SERIALIZE_IPI() guard(mutex)(&membarrier_ipi_mutex)
> +static DEFINE_PER_CPU(struct mutex, membarrier_cpu_mutexes);
> +
I'd prefer:

SERIALIZE_IPI() -> global

SERIALIZE_IPI_CPU(cpu) -> per-cpu mutex

Rather than the -1 trick.

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
