Received: from YQZPR01CU011.outbound.protection.outlook.com (mail-canadaeastazon11020109.outbound.protection.outlook.com [52.101.191.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A9A400971;
	Wed, 26 Aug 2026 15:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.191.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787759777; cv=fail; b=GFGuoHgfKzNgqUkaJGlT+35CIuZHWlFiOp46vOVfmry34WhHNKTj1VPerqQrpEprg+4ZQI/r0eoXz/w14YVr23C45n5qvh+uSIAXXmQGJbu0bhi+nwVTXLbdr+9TBln46IDIg5Sh6yk2hviQZRrSlyWIuNBKOKVNdbdqo418Y8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787759777; c=relaxed/simple;
	bh=RWN/Igsyyh2uSObgS9thMxwFC7IhgeB7GnETrO8OlKM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MjbJvMeYsgCJAgY8RjNbLiOEy3R7B258m7GW3N6EXHR+nkHuRs8OIzr8ORpa641N53bTBtspDbuspGgfgunrVZitK+G5zyB1so4P6Pi+PwHxXTwkM+ekvUsncPA9bPXri8LJhob2PSeZc4IYhaFoVnY9nRfzm3Sgnuli769UhHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=T9YLwwff; arc=fail smtp.client-ip=52.101.191.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="T9YLwwff"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pxu2cojw6SfbrhDFF9jX1caANcc3mlwrn1uxNC7U9VWxjpd21uVYug54XTA9mcrwnosw3KwfhFKFn9exJ8fdyF4CPnRlc+srSvRIsejghsVNKtdTnqm+vtgrkJ3v+VjwVL4OB2OsHdkaHe03Opo+Rg5wAbutc29aBP3avvhWHbXmZqV2YOMpdbPj83hKxYsGmhoW3a3QcmIYOMRBYcffcDKzEUstNqvGNO4imZllNJC5rJbRb4pZF9/+Xsq1KzAnIoJiK6dMThCt896jx9wGYXqcvb9WwojCtJQbFXCWaIHA6soNDODDTQBUAT7OsOALURJn1ZQWLhUwKrR5iVk6LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gFxBbk6b/Eyua/VAOU8GLvzg1kjqXw4cqgfuYXnWnGY=;
 b=YSeVqUR6Yk4LoT5hS+REdotpa87RtPTT4OpiegkmrJVTaSLu5Atm9VUmEnVhxUaF2qCDpDpP8cZa0BmcIKHLaIoaDBw8VyRqkjH4wb+tL3G7fcxGJ6eANxmLS8WEIXuYHUaHMzr8KS0Yvan60FZR0McHnuyf5p4IzN0gWRRHBqieWayeINYKYC5JIV0YO/ybzGTZWBTwPm2vXwUPQJcQxwOMRiLYb7nFMnLxfZoOyt6nq/75/eeG63m0FhsFOE5NGvCEP6aRiXqlye8jVkr6nzc4Ir28CyZgTNN2l8PIEj74IZ+neGLQH+pcUXmRcWGKc65UPWWsi8ferL7Nr+RStg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gFxBbk6b/Eyua/VAOU8GLvzg1kjqXw4cqgfuYXnWnGY=;
 b=T9YLwwffxa/fOo+jpZvF9lGbh5EDNAVOMu7FYXVWGbakTKDuyLl5N0StmReVQD3zSVtt1X7PmSzIFn0J9hbDqhbDcXto39S+pH/O7y7Yw7NhB6lu+2X7+ySTzJJx+yUv6dNa/r7fYjTO9yhOyw7HUoXOyAvboaSFGZNrgLQlVY+KaJgNI9rTs+U7eMtcwa9Yco+ptBTFB8Z9TCxJEOjiirTEoDlDTXB2NrlTOVCgHOyv12Odbrs/xUMFHx2rUQNwebLUBEGl2hhnVMlx8f8+wFEO1Ecm5/U8S/byTfAqkSQOZVvBCi+rUZbHEDiK5/7o31mlbRoiIx8iQUKqEWO8lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB6451.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6e::20)
 by YT4PR01MB10692.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:102::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Wed, 26 Aug
 2026 15:56:09 +0000
Received: from YT2PR01MB6451.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::1ee8:6055:75fe:7c18]) by YT2PR01MB6451.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::1ee8:6055:75fe:7c18%6]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 15:56:09 +0000
Message-ID: <132badbd-61e9-4e18-a953-dd19153b246b@efficios.com>
Date: Wed, 26 Aug 2026 11:56:08 -0400
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH 2/2] selftests/membarrier: Skip unpermitted membarrier
 command test if preregistered by libc
To: Andrew Morton <akpm@linux-foundation.org>,
 Chris Gellermann <christian.gellermann@codasip.com>
Cc: shuah@kernel.org, linux-kselftest@vger.kernel.org,
 richard.weiyang@gmail.com, reddybalavignesh9979@gmail.com,
 linux-kernel@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>
References: <20260803124900.3328789-1-christian.gellermann@codasip.com>
 <20260803124900.3328789-3-christian.gellermann@codasip.com>
 <20260803133704.8802e73e1a212364e64f67ee@linux-foundation.org>
From: Michael Jeanson <mjeanson@efficios.com>
Content-Language: fr
Autocrypt: addr=mjeanson@efficios.com; keydata=
 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 IZHa
In-Reply-To: <20260803133704.8802e73e1a212364e64f67ee@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0196.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::8) To YT2PR01MB6451.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:6e::20)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB6451:EE_|YT4PR01MB10692:EE_
X-MS-Office365-Filtering-Correlation-Id: 50c11c50-092d-4fb5-236f-08df038a8b9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|10067099003|56012099006|4143699003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	IXffYkEUhcYo9cwSa0TBbIwY98HLds2XO1dFP6eHKsNYcRnCl6YnXOfDhL+jUOz14xr2FTM9nCBG4KJ3b/O/q4gz7DaUxKQ4zKq17CYbU68l6UQgRc+GqfF2RmXeXoIHF0MINDcIvu7iWBdSDUNTBPHAxKWNe02adD2PHIiLL6l6sPHqDzeR8sBoF8eRsTOX1pImDlBDZDXhtDU0JpMM5AISM64861b3bkLDSpdoqPYBi0276CtbIg3JjMS8P+WbedOtzlZ4WlqMV1K3qsywc2On0bxIHdlJEPXzE33xBgMv+SOzU87NxeWF2zNQbVKo0zPvk92iQi5Z0kwjGwuMpkYIhPsG0byEjKhLPWnmQE1AV0AvnFXA7emXYB+Uhcaacut9NxY3rI+u7rken5QoZW2RgRcZy2GDdYEwFoYQ2Anqioz6EYIUMDoeTSxBX3rX72oJjfMSABKWU0F5WEu8/fQEPxmJpjfQjIXWiwkCoWGk6lYjnxNj1NSx6ea+7IZJ0rJd9wyGkExNwuCPr3C0iO5nWqnHXPqBWO1Dos3EqKLxtes4ssdZnhkRViQ90SMikXbxhzC0c0t8PZ5uhBchVNwVxUe6h3NikeJgDZE6m7I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB6451.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWxSWndUczJHYWlxOUFPLzY4TzZLSjdzdGIwckJMUVFVV2JPd2ZwSGtmbi9m?=
 =?utf-8?B?bnYyd2hRSklGdWFHdmVZNVRnNlV1OFAvRlZ0UWRZeWZySkdVZld1U1UzUkFI?=
 =?utf-8?B?R2cvcThWYVZ4dUh1L3IwQUdmYWlpbW9adE1oS25mNmo2dWFlMjVJWHdBRk4x?=
 =?utf-8?B?QjZBbHlQekFpeUpKTndIMFVZWG9lNXpCOFVacjFwck9SckZjMVhqaGZtNTFN?=
 =?utf-8?B?OXBoVis3OCtnYlkzY0swUDNwV0tGQVZNL0M1ZmZuTm45WnpqZDczRndFWjky?=
 =?utf-8?B?aEdwNUtpZVNRaE5QWnQ4Y0J3ejhVYlAyQ1ozRGZycGFETU5mQUo3TU9NU2s5?=
 =?utf-8?B?UGttWUhTWnlpU2V1NndSRkhrcGpjRmZiSXBkU084eVMxSmZ6YXdWRE1rMVJU?=
 =?utf-8?B?OU9VeGZyb1ZVRXNFR25Ga1RXNS9ZV3ozNHF4V0tMMGwzUlExU3lWUjRGYk9o?=
 =?utf-8?B?VTNqczU0MFBML0JSM0duZDB0MnhXa3EzMVlYdXp0ZlJ1dXhiUFN5cS9aTDNz?=
 =?utf-8?B?RjZEMmx1MHhlK3VxNG5VWVRLWkJtSmc3V2lWWDNVL1hwbUh5WjFFQVBYbjM2?=
 =?utf-8?B?dG53aHhOd1g0cmtFVjNWNXlqU0lybE9GdndEQXlqUFZqSDY2RXFIUXhIeEg2?=
 =?utf-8?B?dEhpY0l1VnJoenBnYVVReUI4QVFoak5YVjRPVlE1clJBK0ZnUFN4eFJVWGd3?=
 =?utf-8?B?YjVwQ2QwMFFobjBIODkyZ3lvM0VPYmxHSVErQncyRGh1NmtjSFl4TkQyZ1Uv?=
 =?utf-8?B?ZjVaYnBxcDlCSXJlRWF4cDVnRzJvZG5BZEF2bnM3ZFBpdDFCMjZOek9XVysr?=
 =?utf-8?B?SjdKNFhnaTVGaXZoUjB1WjZNbUN5SnpJRVZYTWorWlY5Q2VKY1QxYjRocGlD?=
 =?utf-8?B?OUlkOUdOaUpXRUpXNlVVc1dyNTEvTXFOekNMTW5hOWZLLzBGdk5peXBPbDJy?=
 =?utf-8?B?dks3bzNodUJJS1paU0ZudVV1OXpiK0JaWitQODlyV0g3Ulc4OGpKQXNuSTN1?=
 =?utf-8?B?Z0pVd2VFaHhNODYxYmI1T2k0aXVvVWNUcW4rT1lKNjR0TklWMkhvUHR5OXNB?=
 =?utf-8?B?eHE5cDBOcTI0OWk0bDcxek5DemlDc1R3TUVWenhJWjJLVjV6ZzMrc1ZlZXRq?=
 =?utf-8?B?OGczVzhSdS9KaTRNM2VaK0t1UTBHMExwTHA0WWZzMTZ0cU5MeVhSL1JGeTds?=
 =?utf-8?B?V0U3MlBGV2tXUDRpUTgxQk9HbXJzU3AvdzFtbGo3eGkyQnIwWXVQbkxEUjZj?=
 =?utf-8?B?TEVhUkczT3lxaFZKUTJzQzlyTXMyK1RBTTVaMmlORCsxcTZYZk52c21jWk94?=
 =?utf-8?B?RkhPRXhRRW83WHhvZzRWNzM2WEhWWk9BaFh3QU1UZGxGUVl5V3ZxRERNcjJi?=
 =?utf-8?B?b1d0cndyczFrajZYSlAyZmtMbWd4d0FnUjdNdzFIdTE1a3h6V3VsZWFlSUdP?=
 =?utf-8?B?STEwU3BpK3BHbFZZOW1GT012WXNyS3hxdGU4NDR3V2tETFkxdnFxdjI4MHpQ?=
 =?utf-8?B?VHZieHpQUnRVcTZFNHNQVXUxT1UwT3RUazBySGE1T24yam91SzAwZ0FHdWlw?=
 =?utf-8?B?UHBzQ3ZKZ3V2NzFOS1hYNy9idDVzb3FISTNxVGk0Q3cyZ3BZckxiWGFRVlVW?=
 =?utf-8?B?WW94aTdFWW1MQjNyWDFidkZ2U0hBUENiaEJVaHZRaGtYRmU5Sk8xV1QvVXBY?=
 =?utf-8?B?QWN4cUJ1MzRBeWZkUFliWFFGS0piY09QeUVYb2c1QWVhdGRBbEplMlFvL1Vp?=
 =?utf-8?B?QXNxRlVRemwrS21tU1FvYUhaQkZLZi9MVDZ2ZGNjYUVzUmlkWlZsNStYUVhW?=
 =?utf-8?B?KytBcFM3Yno0SFVlQXU2TGc5Ump6SVJEUzJBMGRHc0JUMTdwcEZtZVFQZjZD?=
 =?utf-8?B?c3FXa2ZlYi9zdzRxN05VUy83aTd2bzZxOFB5UFhjaDh5dEhBOS9rRk94R3FR?=
 =?utf-8?B?VVBCTGVtcmdSTERheGpZWGtjSEIzRDJpREF3a283SFN4Q2lHQkhFRjJPYzZU?=
 =?utf-8?B?b0prbmVVbTFVQjVIODgzZkMySUNxRk5IUUxsR3I3SFpKSXlmMWdFTjgzcXEx?=
 =?utf-8?B?b1J1d2J6UDh5UUNzd0VxcEpSTjRqTzBGSHZEZjQvWFpoRDV0Rk0zMmhVV2RL?=
 =?utf-8?B?MjFHS2JaNGhuY0lwUS8rWkhXY2x4a2F2MUlTSWRxNlF1RmdOL0xkQkdwSFhr?=
 =?utf-8?B?ODVXd0x3VWZNcWtzdnlueWpWYmZiM1pvQ25acGlpU3ZYclBWVm11UVQvQ0hV?=
 =?utf-8?B?NVVpTVpmVEVQem5veEJ2dVkxeit4MTlNSU1Pc0hHbGhTRmx5Q1FxSExXNGsw?=
 =?utf-8?B?UnV0eTFVU3JEK1UzaU1QNkhhcXJvNW5wOXRRYk9pV0VvRXlrTW5tQT09?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50c11c50-092d-4fb5-236f-08df038a8b9b
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB6451.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 15:56:09.4626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WgV6RqFgFcDot9qdEJWw2Zq0/3NFl0LVhYwb4fG6OPuTxqfyjZjr6skml5QC6YIPd/pCZVGU726XFZM+o5CGuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT4PR01MB10692

On 2026-08-03 16:37, Andrew Morton wrote:
> On Mon,  3 Aug 2026 14:49:00 +0200 Chris Gellermann <christian.gellermann@codasip.com> wrote:
> 
>> On thread creation, Musl registers the private expedited memory barrier,
>> see pthread_create [1]. Thus, invoking the barrier command will no
>> longer be rejected by the kernel with EPERM. The test checking this will
>> fail. Check if the memory barrier command has been registered and skip
>> the test in this case.

Tested-By: Michael Jeanson <mjeanson@efficios.com>

>>
> 
> Who the heck maintains sched/membarrier?
> 
> Short answer: everybody I've ever met.  All are cheerfully cc'ed.
> 
> Perhaps finer-tuned answer: Peter.
> 
>> --- a/tools/testing/selftests/membarrier/membarrier_test_impl.h
>> +++ b/tools/testing/selftests/membarrier/membarrier_test_impl.h
>> @@ -113,6 +113,16 @@ static int test_membarrier_private_expedited_fail(void)
>>   	int cmd = MEMBARRIER_CMD_PRIVATE_EXPEDITED, flags = 0;
>>   	const char *test_name = "sys membarrier MEMBARRIER_CMD_PRIVATE_EXPEDITED not registered failure";
>>   
>> +	/*
>> +	 * Some C libraries, like Musl, register the private expedited barrier
>> +	 * command when creating a thread. Expecting an EPERM on an unregistered
>> +	 * command will therefore no longer work. Skip the test in this case.
>> +	 */
>> +	if (MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED & membarrier_get_registrations()) {
>> +		ksft_test_result_skip("%s test: Command already registered\n", test_name);
>> +		return 0;
>> +	}
> 
> AI review
> (https://sashiko.dev/#/patchset/20260803124900.3328789-1-christian.gellermann@codasip.com)
> thinks that membarrier_get_registrations() can return -1 on old
> kernels, so we should check for that before testing for
> MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED.
> 
> Seems nonsensical to me - membarrier_get_registrations() doesn't do that.
> 
> And policy (my policy, at least) is that selftests test the kernel
> they're shipped with and anyone who tries to run them against any older
> or newer kernel is all out of luck.
> 
> 
> That being said, and stepping back a bit, is this test testing
> something which we would test?  If pass/fail depends upon deepest
> details of the chosen libc flavour then perhaps the whole test was
> ill-conceived.  wdyt?

I think it's still somewhat useful to test the behavior of the syscall 
when unregistered at least on libcs that don't have automatic registration.
