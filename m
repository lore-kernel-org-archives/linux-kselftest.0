Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazolkn19010072.outbound.protection.outlook.com [52.103.66.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515A137A856;
	Sat,  1 Aug 2026 14:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.66.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785594634; cv=fail; b=kXbvNKbeGP9TVkVH1gcW6Wj/FCRSP0xDe5gZ3VdTc0DHoC+0zQggm3kgqrLQO8/MLMn+0HbdMztIZSEFgS+vXRMGxAqwUCfTlSTvo+3Eavix4XvwJEPPu3kADZLynww6OWpF26f3vZS/OmQmZpbKEHrOd6V0+lZLRI1ktCb088c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785594634; c=relaxed/simple;
	bh=ogG5asKocRmGHYM/0/P9Jh/nAPtAZmjl+Lpn5v5qSjk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MIrCJc0Q80/GiGfOniTZh2Px/oam6i4obbhN0KF3AoWIoPeaIpI+2++9DzZn4aTfv3BEYXMVZ98XSeWsam9FbtTNllUINIV/sVnmPYOAt6HcyJEHMMGAXLCVCOtwmRf35FiJlp24BlrQTP6raOWbuymEYek+L7Nts80fnJMhoDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=ILf+YF2L; arc=fail smtp.client-ip=52.103.66.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="ILf+YF2L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RLw+tq29RQsZfeczKyMPlq+3Hj03CcufWv1MHhoFCq6G3bDbDuYGr6oJlyymSnFn9FDQqSL5QvmTmByvs4UVQfi7fP1wn+L3bruQBcJ0+9qZqLceXEpE9MaxcWUR9Fb9z5uACr13j25Ry00t5evM1ZgoUgreeSQPhm11QyxPgPrcwDOKmwx21lo2v9RTqJb6Ezw5Kl+vqwaqX5LZy+jVrXxZaP99uZS7k52EDYNkrLayZeD0uD0SYiWfCKxJcEE3/pHYjnTsWEHx1oH4QagFv818qku0XEUG08cfnRYzF57ThhDSGrPovJAL8oIemT1zdelK88EH8q+wXbLphnBmDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ogG5asKocRmGHYM/0/P9Jh/nAPtAZmjl+Lpn5v5qSjk=;
 b=Aap/uCb6UuO3eapTcdP5fq45N2pJCMEqUWB7Wk+rBullUP8dZr+0meWo8OgX5IEGIIcGahr3P0w8oIt7ASGiC4cjTUjN2aUeCN10uq+p/YqZtQGpEYHjrkuDbInh1hMLddtAwfc7T7blu3MBIptYD7tZVGuKFKQGPO0RKXvehXKpC4NgorBi33J9FWD1x6MmK9CwRrDMyEOsJVBL9wYZXxkOehBAB4f/fRxU7+Eet0q074nbZuEnb9SnWO1hLk63EOrnBS/HgvX1FNVX4w79+S5X7cmjXgB2sEh7P2IFG0K95e/vvuBPki+G1+lQmPqOjZbh3VAepcTX9MdfIpQOCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ogG5asKocRmGHYM/0/P9Jh/nAPtAZmjl+Lpn5v5qSjk=;
 b=ILf+YF2L5LBw4/Mtb9te53BamWTwdr5YFD9bfj/lvRdDvR8aW5vKAl5yJZ4QD8/tNabMPb+x69CiVWXgU7/TImpvS+gk00uf5Jsq9u2/HnUJgmVzDw8UAYF0ABe+ED/3QlNWR3S/JPAKnvhu7SM/uOYFl671lEXMuxc7bobD4oVYfOXdf6laxTwlHL4JJVIKT+hK7+M/lUsHWZLIPGfKxbtdr6GiksZqbMkg2gDJOLRV2OFOD9HQlyViTuO1tfEiGBOhckwI9PftCp/ABwRmBbfXsYngLeMs16RwEHvVCGPlxhElbGlRRTIQ8S4TEmcrj9KMHjxYIYoEX89sP6tHXQ==
Received: from TYCPR01MB8566.jpnprd01.prod.outlook.com (2603:1096:400:153::14)
 by TYCPR01MB8820.jpnprd01.prod.outlook.com (2603:1096:400:18b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Sat, 1 Aug
 2026 14:30:29 +0000
Received: from TYCPR01MB8566.jpnprd01.prod.outlook.com
 ([fe80::48f2:133c:842a:2755]) by TYCPR01MB8566.jpnprd01.prod.outlook.com
 ([fe80::48f2:133c:842a:2755%6]) with mapi id 15.21.0245.012; Sat, 1 Aug 2026
 14:30:28 +0000
Message-ID:
 <TYCPR01MB85661B68A8B721311D15A8B9BBD72@TYCPR01MB8566.jpnprd01.prod.outlook.com>
Date: Sat, 1 Aug 2026 22:30:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 1/2] net/sched: reject overly deep qdisc
 hierarchies
To: Jamal Hadi Salim <jhs@mojatatu.com>, Ren Wei <enjou1224z@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, jiri@resnulli.us,
 vega@nebusec.ai
References: <cover.1785434373.git.milkory@outlook.com>
 <1e9ab39597423fd5d13cfaaf52279b8ee3d9fc3c.1785434373.git.milkory@outlook.com>
 <CAM0EoMkEA2shJB9dBt_ZfDrZTzCZdvbggFNFdnAUz=gKkDcBQw@mail.gmail.com>
From: Zijie Huang <milkory@outlook.com>
In-Reply-To: <CAM0EoMkEA2shJB9dBt_ZfDrZTzCZdvbggFNFdnAUz=gKkDcBQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SEWP216CA0097.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bf::6) To TYCPR01MB8566.jpnprd01.prod.outlook.com
 (2603:1096:400:153::14)
X-Microsoft-Original-Message-ID:
 <1b570d88-944b-4d71-9298-6b3201e407f0@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8566:EE_|TYCPR01MB8820:EE_
X-MS-Office365-Filtering-Correlation-Id: a322ffab-423c-458c-a30c-08deefd96f33
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|12121999013|8060799015|19110799012|41001999006|5072599009|6090799003|25031999004|15080799012|23021999003|51005399006|25010399006|4140399003|10035399007|40105399003|1602099012|2607281247196008|4302099013|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZFdyM3V4bnBGYnFwbW5nbi9EZnVtcjRGV0I3UHZFaWVBbXROaUxKNVpkaUJt?=
 =?utf-8?B?OHRmclNLdFN6bnhLNVdYUDNHWlNod2l1MGZIVy9BVVlFbWxxWTkzYytsVVZI?=
 =?utf-8?B?b3A2WG8ySkZZa2F0ajFSdDdPdThxOWo0dGt1UjM5U0pnRFlrQVJ0ejdta0E4?=
 =?utf-8?B?a1VvUkFUUEw3QWVNYUpCSFNtTURNU00zZjBUWExaYVZZL2dvWUdUeUNzM24x?=
 =?utf-8?B?ZUNjV3oxWHpBcnhSd1VGRHZJY21QRWFTSFhKV2tlK2t1WTFXcDdVSlRoN1NI?=
 =?utf-8?B?UEozaFRPT2M2R0tLaVBwdDZjcHFCMkwyQWc4Mjk0MmJreThWZ0hsZzZQaHlO?=
 =?utf-8?B?YUZVa1diWm5aYlZuU1ZtbjhMNDhST2kzQ3QzME9Bd0ozcmV6T0FNR0t3aWtu?=
 =?utf-8?B?alpzYzdUK1c3QThFYzA0QjlLN3V1WWk5TlJnKzJBVHJjaW9PaGxSa2oySmZ1?=
 =?utf-8?B?T0F5VUpqaWFRZ2Z1RTFTSS83eHU3ZFJMK3dQL1RTd2lNc0ZOK3hEdFYzL0FY?=
 =?utf-8?B?M0NKVXplOXJsdVJWODl3YXk0Ukl4MEIrSGVIMFZ0STNCam0zSHVYQllxVnl6?=
 =?utf-8?B?RGNkcVpBNkFDbE1uU0hXbXhpLzVCYW1KeUxXS3ZZdGNVUjNPT1ZkZmJvdVFI?=
 =?utf-8?B?TFZHYXh0bEpMbGZaRFBpUUdjK1A4eEtZNWhxN0pheGVPRUYxVnQvckR2U29j?=
 =?utf-8?B?SHN6TEY0TFBKQUNjbEdBRS9scG90b0lVdDF3ZjRPdUZoRHdQNWE3dVBEV2pv?=
 =?utf-8?B?SG5QcHZQeHI1d2Zvak93ZWR0MWtrRVg1WHVwTXVscnRjUjFHOHZvNVY4bkl3?=
 =?utf-8?B?cDRtU20rZldZbVZVWHczeURpWGVrZXRyMXpKNHJWenNNNUg5VEpSSnFUdWNO?=
 =?utf-8?B?YitUR3MwbzB2dWpoTTI1emxnbVBaaENaUWlXeEtPWFJDZlVsYmtpWkErZjcy?=
 =?utf-8?B?S2RZakY1ZXFnZXNDOGRKLys4NUMzZTFING1JL3Q4dG1yT0Q3dXpDTVBkcGo5?=
 =?utf-8?B?Q2tMbzJHWkJDRnN4S1RxK1JCZi8zb1ZpR1VaRTRXOStDbnZFMUlteTNoalE4?=
 =?utf-8?B?VXh2b05tVk1CbkVDM2F5R1VBaEZRN0g4eXgwTkpSUGRwSmFjL2R0dTVhUXho?=
 =?utf-8?B?S1dFZGFlWitVOW1rR0NjeGR2Y1Z5b1lEQnV4N1lYR3pSeVgzWG1pTUpiNTdz?=
 =?utf-8?B?Tzg4TFZLc3pEWUNKeGxYOGhPRHhhaDU1VUxuREoxUXFyMGJJQ2pJdTNpVUVI?=
 =?utf-8?B?KysvS0E4ekZUaHRPYWIya3o2L0lzRjFzR2M5R01Ed0lCbW53VForN0lYelhx?=
 =?utf-8?B?WFBHd1RjUFFWK0UxTXA4SnRsYjhoQnJhdG9UZU83Mk1DL3E1MEJvVjh5Uk1E?=
 =?utf-8?B?VERjUzJibEFxR0FmNHZ0YVdHeS9yN04yNnpuTnFhdGVBN2xWZ2oyb0c2RzVz?=
 =?utf-8?B?NFU2QmczcXhrc3A2dVdobnlWNWdMQmQ4bnJTS1hzc1ZnK1krNGZTK3oreUo0?=
 =?utf-8?Q?aR/K30=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjB3Zjlmb29FSEZTZHBWQkcwS01FL0dWRlFmU3UxZTY4NEVGUkVUWnhMQlkz?=
 =?utf-8?B?MjN3TVN4Z01tQ1JZcGM0ZmhUb0g1YytxWHNDTjFvRGVsSGx5YjFkZXFGUmJm?=
 =?utf-8?B?TDdUQ2JZZGlzenhMOXFNQlF6aTFiUHZjbXhJSjZOWC9Id0JCemQxbzZvK2VU?=
 =?utf-8?B?MXhSSXk4dXZtd0V4L0hQN1BVTEEzUEdWdjlvZG83bGIzM0E5bWVtV2ZGeXpn?=
 =?utf-8?B?c0lIa0hiREt4d2hUaDF0bklCYVRnYzZxSndLNEZLUEYxSWUxa3NXalE2K09B?=
 =?utf-8?B?bHh4VENlUUMrdXVjeXg5cjR2ckNuL3ZKakczR0luNEx3aU8xMmwwUkNCb00r?=
 =?utf-8?B?SXpzYU9rcnFlcklaaXN6Z0pHSjNWT0RyMVM0T09vWGtodjRRYk15dkQxWk1o?=
 =?utf-8?B?NWcrbm9XcFRGU3g3a2tXKzVzbHRHNkxOSVp6VnZyc29oalVaVHUrcEViLzRR?=
 =?utf-8?B?dVZrM3dveDNGMk16UkNrdER2ZzBVZm12QU9KVGpqN0pWY1g1U1BnWDZ3VUc2?=
 =?utf-8?B?blZ5ZW9DMzQzVnpxNVQ2bjYvSEFYVVpSVDRSaUZkcDNMVzl0WWNrbHlBU2dp?=
 =?utf-8?B?MFNuYXVqb3dIdUdFTHFIQzQ3N3R0L2JmaWx3UkE2Y3NSVlhwM3RSSkh5VlJE?=
 =?utf-8?B?dzJoWS9tSUgxWE83blFRYlV4eE96L0JxbnpsaTBDZ0NubW1GRktGWEVqYTZS?=
 =?utf-8?B?WkNzRlhuUnczY2dzdUdtTGc1aGRsZUwwSFRrejVyaHNhVjAxaE1NWlM5cHJv?=
 =?utf-8?B?L1hZQTRiZFRxVEJuKzdFTklVUWVwNFhkVHRPVWQyaW5DcHU0UmN4emErbVcz?=
 =?utf-8?B?b3MwbXJPWngrU2FUVWJMUGk3WVQ4Qmg4NGk0QnRsdytnVHJHSCtHNm1CL3JQ?=
 =?utf-8?B?MzNoOWZySFFXTFdZc1lKeW43TDVTZ0dGdHhQQlVHcTViR2lsWDdpUnBiMmlY?=
 =?utf-8?B?VlFobm4ycHBDTTc2ZWJWd0N4LzdybEY5aTI5eUtCUjh6TTMxT2hpL1VxYlVU?=
 =?utf-8?B?Nm9SSUJleVFtbURIbWJ4dnllZVpoc0hEMGFKWkNkRTN1Z0pUYWd2UG1KRUxo?=
 =?utf-8?B?TUJVRTNwMGk1WVh0QllhdXE5TjhKdWVhQjhxSkV2cDZCbnFUZDczTWlJcVhj?=
 =?utf-8?B?b3ZLWENQazVtUjdNSk5GZllWV2RjakhFbVYzOTNxeEVscFNVZlM5WTVoUENa?=
 =?utf-8?B?QjVqMmlYai9Id0VqVmhkVEd1R210U1UwNk9jbmJDSlB4L29BRW1CZ3B2cVUx?=
 =?utf-8?B?ajU1U1orYVAxcHIxOWVVVFljWTViRGU2TnBsTkFPSndYS3FFRzFoRDdlVnVi?=
 =?utf-8?B?WXhneFRBOTBhaitaRFJCNDBYM0dWdzdNSTJMVW9HcytIck12NFFxRGMwNWFL?=
 =?utf-8?B?TDlPc2d6ZzlkR0NuZzRRR3ZFK1ZFSGRtMWRsQlhDL0ZIeW0vWHc0RWpsQ0Ev?=
 =?utf-8?B?ZWZKaWhESGg3QndYQWN2U1FqRHdOcVI5Ykk4bkRqTkxrOHYzeU1wYnRGcDRU?=
 =?utf-8?B?dzRzTi9CRVRyRi85NmpjNndwVUJtVU1LQTNmRG5FZ3RxQWhQQi9QNkpON2xm?=
 =?utf-8?B?L2dvNTI2MUU5WUY5UE4yRmxLY01YVlQvRCtLOWpIY01ZVWxJaHVvUWt4NFVx?=
 =?utf-8?B?c2RQcGpqYzhUUzVKUGhudDBwTGcwQ0M1M0ppWEVaYjlzRVRnTWRLQlk0WXBI?=
 =?utf-8?B?UDZhNm9BUGcwMkswNXFJeFhyakd6T2M4SkNza090QkZIMTRMZ0RpaE01K1ds?=
 =?utf-8?B?Yjg4MUYvbVpwNUowNnMxREFOZUZuWVdHWHZjaGdIYmhvcE5uaC9JcXJwSE55?=
 =?utf-8?B?dDJmWW90WXdQdy93dFN3MEJhVTNyV1dLUjJBM3EwZFlSMm43SmZndGZ1L2Q3?=
 =?utf-8?B?S3YyeUNjOWVmSWFuc2V5anhJMWFrYzJCZlpkOGttSjhUS0h0d0NJUnRROCtl?=
 =?utf-8?Q?CHsty0a3BVqPkmCLvywZwjy5yEPv5HEx?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a322ffab-423c-458c-a30c-08deefd96f33
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8566.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2026 14:30:28.8206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8820


On 8/1/2026 10:11 PM, Jamal Hadi Salim wrote:
> On Sat, Aug 1, 2026 at 9:42 AM Ren Wei <enjou1224z@gmail.com> wrote:
>>
>> From: Zijie Huang <milkory@outlook.com>
>>
>> Deep qdisc hierarchies can lead to excessive recursion in qdisc tree
>> walkers and exhaust the kernel stack. The existing loop check does not
>> cover the create-and-graft path, so a hierarchy can still be extended by
>> creating a new child qdisc below an already deep parent.
>>
>> Store the hierarchy depth in struct Qdisc and update it when qdiscs are
>> grafted. Reject new child qdiscs once the parent is already at the maximum
>> allowed depth.
>>
>> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
>> Cc: stable@vger.kernel.org
>> Reported-by: Vega <vega@nebusec.ai>
>> Assisted-by: Codex:gpt-5.4
>> Signed-off-by: Zijie Huang <milkory@outlook.com>
>> Signed-off-by: Ren Wei <enjou1224z@gmail.com>
>
>
> This is the same patch i sent you except you changed the failure path
> to send EBIG instead of ELOOP. Is there a reason?
> And your feedback message is not as informative like what i had.
> NL_SET_ERR_MSG(extack, "Qdisc hierarchy too deep (max 7)");
> This way the user doesnt have to dig to find what the limit is.
>
> Note: Your AI did not assist in this patch rather, I spent about 30
> minutes looking closely using human knowledge.
> I am not looking for credit but for your education going forward: if
> someone invests their time reviewing your AI generated patches and
> suggests a different path that you adopt, please add a suggested-by
> tag crediting them.
> Or don't bother sending any patches, just report the problem and
> provide the Poc, I could have come up with that patch in about the
> same time investment.
>
> I am going to ack the series unless someone complains about EBIG vs
> ELOOP in which case please fix the msg..
>
> cheers,
> jamal

I apologize for the inconvenience. This is my first time try contributing
to  some big open source community like linux. I believe I should have
learned about etiquette like "suggested-by" beforehand.

In reality, I checked similar code paths about exceeding depth in the
repository and found that E2BIG is more common so I replaced ELOOP with
that. And after reviewing the issue, I think the patch you provided is
enough to cover the problem, so I didn't change a lot.

Again, I apologize for the inconvenience and appreciate your patience.

>> changes in v2:
>>   - Store the qdisc hierarchy depth in struct Qdisc and update it from
>>     qdisc_graft(), instead of walking the parent chain.
>>   - Move the depth check to qdisc_graft() so it is applied at the actual
>>     attach point.
>>   - Add tdc tests for the maximum allowed depth and rejection above it.
>>   - v1 Link: https://lore.kernel.org/all/cover.1785304107.git.milkory@outlook.com/
>>
>>
>>  include/net/sch_generic.h | 1 +
>>  net/sched/sch_api.c       | 9 +++++++++
>>  2 files changed, 10 insertions(+)
>>
>> diff --git a/include/net/sch_generic.h b/include/net/sch_generic.h
>> index 45a1e8c78222..cbc248776511 100644
>> --- a/include/net/sch_generic.h
>> +++ b/include/net/sch_generic.h
>> @@ -99,6 +99,7 @@ struct Qdisc {
>>         struct hlist_node       hash;
>>         u32                     handle;
>>         u32                     parent;
>> +       int                     depth;
>>
>>         struct netdev_queue     *dev_queue;
>>
>> diff --git a/net/sched/sch_api.c b/net/sched/sch_api.c
>> index 668bcd60d183..65b35528d125 100644
>> --- a/net/sched/sch_api.c
>> +++ b/net/sched/sch_api.c
>> @@ -1114,6 +1114,9 @@ static int qdisc_graft(struct net_device *dev, struct Qdisc *parent,
>>                 unsigned int i, num_q, ingress;
>>                 struct netdev_queue *dev_queue;
>>
>> +               if (new)
>> +                       new->depth = 0;
>> +
>>                 ingress = 0;
>>                 num_q = dev->num_tx_queues;
>>                 if ((q && q->flags & TCQ_F_INGRESS) ||
>> @@ -1211,9 +1214,15 @@ static int qdisc_graft(struct net_device *dev, struct Qdisc *parent,
>>                         NL_SET_ERR_MSG(extack, "STAB not supported on a non root");
>>                         return -EINVAL;
>>                 }
>> +               if (new && parent->depth >= 7) {
>> +                       NL_SET_ERR_MSG(extack, "Qdisc hierarchy is too deep");
>> +                       return -E2BIG;
>> +               }
>>                 err = cops->graft(parent, cl, new, &old, extack);
>>                 if (err)
>>                         return err;
>> +               if (new)
>> +                       new->depth = parent->depth + 1;
>>                 notify_and_destroy(net, skb, n, classid, old, new, extack);
>>         }
>>         return 0;
>> --
>> 2.47.2
>>

