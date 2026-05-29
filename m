Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010056.outbound.protection.outlook.com [52.101.61.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87EF342146;
	Fri, 29 May 2026 19:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780083259; cv=fail; b=m1nBoNQB8JQ8Ct1MuH0nzfj+JTPgyUWs8UEO+NZ/a4S12KU7ZQ6iADN3T2aqFFDXGXN8R52FISynD+bYRZLiMkseFMAmUJDgxb52epesMaouQnHGqTaPl52s5JBFuJRTiQUEQL7GsJCeNaOxdH8WeJTaDnsDcC91vNEF0pKHe7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780083259; c=relaxed/simple;
	bh=wdvrd26AZv6qzi2iSnnBd6/octdRgZ3OxYYOfAEeK48=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UemEN6nG89ng0mOJXHDM2GJXbcgEHlvd6r2be6RVplEa/6gx9A0dxfxPpmwX1Gt93FXdQDqinOSgveDxxy3HOpWVjU2Qgu3hglSz+9l0k2wREFEwXy54vA1lxhIoOvpPJ8IbEIwJ4o/ex1ZYrBtoN0u4RrksAztDvCFgiFI3GuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=R+WQ7B45; arc=fail smtp.client-ip=52.101.61.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="R+WQ7B45"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ltytWA4fSJRhWe813bp8V/ihdDWv/X3rp1pqoIlfTYuv9KtSeDgSt4wFZfOEup63CogfePWHaUuXXFpsE6hINe7biqxetTeF5Z75zIDLkKJtWjtH6jNRo/IQ779kpf0vyeDuAgwBeYOsNOYPUcYcgB8X4iF/IKhPCwTGzHWwbdhjV9xoVa+rqOD+wgA48+kA+oyPfgvDRX+dAVjUCn+wPuji6rMrqfZkCb2C2VnACNmQrM/JycgOAIq0cIfrTb89XIU/dMY9orI5QEE3oVmSWAE7xa7TIT+fbmg4sRQPgWZ7dL8eaydB+6NRh0ysSpQARQ/Y+sLKF6z1eUOoqm9eDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MmrEvBfxzWihPQM0kF0fMsjiiEfppEfX2hARGKJCTD4=;
 b=SNA7hvdR9tgRchxVjmKvGFkWAidOD9kHr83BxBx6073mmZ6sgIX23d5ibilhLYL7ZCXsjGXhBNdC0qW9zauO5r77TkL2ay4J6GhP6FtsGfosZ/VX3ObREzwak7gq3vRYSsekWYENjwp8LncPr5T7Pflorb0V+8M/r3QkYgFy676kKmRYCOELh0NAmi0ALq9jVU1jzWc+34NJC1+miGYM46pO6rb3uTfRjb+0Rj678WppSw7TowSuyxoUgUT2tAaxAZht596gl7BMG4XMlVZrWJEOavqaJ8D012bruqrQb0m2d1KAFAoLkp9uJX2L2eG8vzkOxpp6/fKkvm+mATeP5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MmrEvBfxzWihPQM0kF0fMsjiiEfppEfX2hARGKJCTD4=;
 b=R+WQ7B459EAjwn7O8FBEKoxj9rWNPfZeeWBLjDYm+X491WIIaQe5akx6qooJDP5Iwr7bX0TUA2hBhmpYDmTXTeYzbjQezjOEg17Wp8mpVDemjFRCTaZP0QKQorUNtvFJW9tepmsSYdkTezOvu1jU6FTsXQ2JcTPYJv7UE/86cCBI0L2nVifEWZHVBz1SUiSOnsoxPDOJxajp6FVRA1J42vZD52CGG/m7WpYJGzjjz+KiAUalSMfVRJSyF0PTaS31vKtoOQW1uOpf+GAto1te8H9rIZNVbFM4XISdNs4d5pHFsOOTG4FcCMAbFZKs7YJ9Y6GRpSsZLbK+ud0TDTJv2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CY3PR12MB9632.namprd12.prod.outlook.com (2603:10b6:930:100::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Fri, 29 May
 2026 19:34:11 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 19:34:11 +0000
Message-ID: <13b63b4f-6a4b-4433-93e8-78035ab62b83@nvidia.com>
Date: Fri, 29 May 2026 12:34:09 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] selftests/mm: separate GUP microbenchmarking from
 functional testing
To: Sarthak Sharma <sarthak.sharma@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <shuah@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Jason Gunthorpe <jgg@ziepe.ca>, Peter Xu <peterx@redhat.com>,
 Leon Romanovsky <leon@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Mark Brown <broonie@kernel.org>,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260527142432.230127-1-sarthak.sharma@arm.com>
 <20260527114752.cf4dd3e1bda93fb8ebab5a76@linux-foundation.org>
 <3b4176f4-e099-490c-a5e2-6a36d00b1207@arm.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <3b4176f4-e099-490c-a5e2-6a36d00b1207@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0P220CA0021.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::8) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CY3PR12MB9632:EE_
X-MS-Office365-Filtering-Correlation-Id: b3a0e083-c7f8-4d26-31ba-08debdb9423d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|18002099003|22082099003|11063799006|5023799004|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	niPXKidjtj/KNXCgJXa2sHZz6hUQjPCjvhO+qYQT2Kkw6NeCptoHUEdEjPDJ66/SIhLrNBCa3pyC7ShgnL7f3yjgp9jTeNyqHV+VUW0GpkvWsQCguKHOJj+MbVAAhB0m4OTSBCjwE38I/0Q/bXYi23j5oLo1hwfsMw0XHC7XGNlmWvwcaDpT60neZiXxMoUY3z86oF65MMUtjZsLk8Idwez8O1+fKVMWKv/z3UzhiaZhCfxTwCjcFCoRDXIGrvood2e2whXFBvmmRMaK7YBSjodBpph68XVKIo3MnMwoS4TtPFBRF2cEUHzR4YDqx7ptVdO33b9ps9aqk+TcmzdUhWS76lswUgPQjbQ3Uavxp6wpPE1PpexPyr0rA3K2geuXoxXv1X5SNBIKVvNmyNIDwCqpa8afETKTiQ1EXZlC5XGP6dN3rXiMnwyFnoWnJWJ1/taBUiiZ9KYa/r9D8OH24HaW51G1zSdoSpKMRRKTBcz3EAeCyb+RShvO0hTR9FIpLhWK8IqfukNBc0Tj9q8NncMrMr7UxYwL+Ul2dEFH4vHNNIdqmqUzxglX2aKv8VqGcLj82zZnp2FFa2bSSZ+hgwJ87Ilo0fTTvGCTtBfmNl7DvhkkvAHsdjsIdYdaJGYlkFT9wzOUJiQSTtcA9fSpdUyUaQD/kMO56dQxfCmlRpSswqB+jGtxMZEQCqMvyzli
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(18002099003)(22082099003)(11063799006)(5023799004)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MStPaGJqWSszK0Y0RUJUbSs1Yjg0djN4bWZEVDVBWi91VjgvNjZuc2pBS0ha?=
 =?utf-8?B?cDgxVTRkSmEyUTRRTzlPOHdoai82NzA1Qm56Nzg4WmwwZDd1b3l4c0E0Nmhm?=
 =?utf-8?B?WWVIcmg3aGRGRTRMaVJGVHdyYUY4M2JqR3RFOG1iRXViL2M4MTZTdW15RHAw?=
 =?utf-8?B?bVZoeDZEZXBUNWQ3c2t1bXJHOGE3b2tPY2xRc1FsWXFzWmlRR3R5VmhvUzhh?=
 =?utf-8?B?bGVaNnV4ODVweDFidXdiTHQ1WmIzQnZsQ2F3Wkdsb3M2UVplS2dzWXJWazZV?=
 =?utf-8?B?bFp5eHVvNXFpcGpnZXFZM3N1bE13ZWxLYXlMOVBQNno0TDVncVFKb1Q2K1My?=
 =?utf-8?B?bi9nM1Z6TWRhMU9tdDE1bkY0WG0wYnRUSFZ4R05lemNMQU1ORE9wNVhUemQr?=
 =?utf-8?B?MkF0STVDVk9RZmh4dVNFRk9tMkxOSEhoTHdEaldHNFNOaTc4ZENYdVhRaTZq?=
 =?utf-8?B?ZkVhaDhWM3dLQzFOVndIei8xVW9QNzRiSkxaRThreXhjUUpjZ0pac1hlb09a?=
 =?utf-8?B?RzBzNG1CKzBjTENnOWRUOTdSN3Z2WDRQWTdFV3R1M3pNaWtieUdoTnNwQmhP?=
 =?utf-8?B?Q0NXMDd3K2M3dDNOUHBDV2M1ODdYTkpFVnIrcGRvTHBpOEt3VzhWQzhlS2lD?=
 =?utf-8?B?VzFFZC9hMitnc2hQak9EUXFjUlZPSzFHQm5ZU3BDaFNBMkcrSDBVcDN2S2pD?=
 =?utf-8?B?Y3V4NXM1dHdUZE9Kb2gyTlpneWxYQXlCUGJibE5FR0ZxWXVqeG9EaDlpWWJU?=
 =?utf-8?B?QlZpMGVydURmVDZYNzFkNUg2TFpudGVpaVpqRkd4OExwalBMUjVHRzNBOGJL?=
 =?utf-8?B?WkxFbnBzaFYyY0V1cVowaVN2UXN1UzUxdkZvUmtiTXlKTFMrcVZyVXRxajVE?=
 =?utf-8?B?cDJOdUd6cWxvc0lHdzZsYWFKRUwzMjU3aFN4ZnRPbTZPOTl2UmxnU0QrT2w0?=
 =?utf-8?B?SjJlSExhbFR5c0JlYmdMTk1NOFdjM1BSL2t3LzYrODRreHFWVXRYd21oK1l2?=
 =?utf-8?B?WnM5OUN2MUJvNk95QXFMS1VLVkN6bjJ6dG4wSzRnbHdLUWFYNmtwT2hPRTY1?=
 =?utf-8?B?dUxJdk1VWHZFSkc4L2hyc3lLaXYzb05xUFZBbG1ZSXZqQ2FpdEdtcGl4dkRn?=
 =?utf-8?B?TEpIbDNveFBsN09FNnAxZkJBNmRpSGg0eFRWZHVodmNjc3dKTnNyMVg2a3JB?=
 =?utf-8?B?Q0Q3MDZMSWMwVFBuQXNMY2NKeURQUzRPeVhzYlVvV0l6akRZdThvU1NWNWo2?=
 =?utf-8?B?cnBNYkZ0SEwyU1BIbDAyNS80SFlRdWd1U3VlRXo1MWIxSWdoS052VkpJOXZz?=
 =?utf-8?B?MTZLZGJIS3I0UjhJcys4NTRGdTE0bTJMbzFHUDdRbGpWMlRCemVraDlFWXRx?=
 =?utf-8?B?SjdOd2ZLbjAwNkVhcDE0U0FXbTJldXFXblVlSDV2OWxSVU5ZOWEyOTU3YnN2?=
 =?utf-8?B?T1RYSkxXYmhKVUM4NFZxUkpIZUpRcnorTnlDZ0pYaEQ0eEFNSnNwcitxeUJF?=
 =?utf-8?B?WHZKVlQwWldrWmZMeE1MNlMwRHJmTzgrenFFMWxRdHJrd3JOUHd3dFNFMGZJ?=
 =?utf-8?B?WUF3LzIrNnF2QlUydnhYbE1RbjkvOWgrNnFmbUFleGZZdWd1ZmcweFpUdTNG?=
 =?utf-8?B?aHpHcjRyTWtBYWIxK0VIbkhIeTAzM0ZvSkZQZHpud3h1SFAwSW0yZ092bkg1?=
 =?utf-8?B?RndLWG9ZdGgyQks1VWlXcjVWdWxPSHNWNS9TNERJbVh6cDNRK1lxVkQvR0Z2?=
 =?utf-8?B?RWxYVXBZKzdlOU5oZGNlOXIxSlljWENJaXlyZU9WMDlueGlMeHVrNm02RGg3?=
 =?utf-8?B?MUY4WEV3MDA2Z3kzcXNocWtncFF3bHpFcmltV2RtOUk1SXl0YW45Q3V1WU5Y?=
 =?utf-8?B?WW4ya1ZlVS8zbUlxeU5Ob0dxckpZQWt2WWxmTTJrQUs5ZnAvN2hWQWx6RWVm?=
 =?utf-8?B?ajNRTitOUGdHRzNqanRxL3BCVVB1eWZwSDFJU2tZeGJJMGZNeDhJR1lLbG1n?=
 =?utf-8?B?Wm00ZVVLeit5dG1NQ2RUWHBJc2syaGVnRkl3QmE1YytKOCtKdXYwNnZicFZZ?=
 =?utf-8?B?ZlNnTGpGeFBUemRDZHQvUDFxTUo2a3hmRTFBL0lpdU5HUDg4M0N1d1UyTXJl?=
 =?utf-8?B?Ukh1elMxaFhiZDk1TnpkWWhnS3hxU1psc2JUT0YyRjN0eGJ5NGt1aVUwdmFT?=
 =?utf-8?B?OE92NGovNEgxVGd4YnQwT29zSUl4dlVVajZPMWJLdmdIWVpabXowL0piOFU2?=
 =?utf-8?B?dXV2RmlsaHBwRlpHREtjRjFxbWdKMEJVSFhLTUpMRjhYcmd0ZmxMakNaZnZW?=
 =?utf-8?B?bTA5V1VJK2NFSVBjMlkzajNCc2RZVnF2QXhNN2E3VHhndTFQY3dHdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3a0e083-c7f8-4d26-31ba-08debdb9423d
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 19:34:11.2701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: owIE0lACQzxWgt873hajYHyhs+hXABipC+wBfuedfCSfI3Oi9YT7o7hwKHIVSjI5GKgaSkI2wZ9g0giNG2DMeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9632

On 5/28/26 10:57 PM, Sarthak Sharma wrote:
> On 5/28/26 12:17 AM, Andrew Morton wrote:
>> On Wed, 27 May 2026 19:54:27 +0530 Sarthak Sharma <sarthak.sharma@arm.com> wrote:
...
> Thanks! I went through Sashiko's review.
> 
> Both the points are valid but look very minor to me: one is a temporary
> x86 build issue fixed by the next patch and the other is stricter

This is the sort of claim that an AI will make, in kernel code: "it's
just a temporary build issue". I've seen this happen during sessions
when I'm interrogating an AI about something.

Don't be misled by AI's evaluations, as unless it is guided very
firmly (sashiko for example has fairly firm guidance, although still
a work in progress) it will provide routinely terrible advice about
how to deal with the kernel.

I'm sure we have something in the "how to contribute" docs that
explain that patchsets must be bisectable and that there are no
"minor" build "issues"!

I'd request that you study those docs and the surrounding ones,
it won't take long and it will help immunize you against the
various AI suggestions that seem to be unavoidable problems in
2026.

thanks,
-- 
John Hubbard
