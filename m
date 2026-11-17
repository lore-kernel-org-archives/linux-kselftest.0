Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.193.100
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794921571;
	b=zE6EFUCr2FwIzV9sIKHN3ozkflGowIi+kkLxqKTT66JiZ04LfF79GapfSIv0QRa+0Bto
	 BufaHnGAYI+pQcOaPIugOwjT8txaAJSdDvU+NZPP6kihHC3+qA2eNlVAVBctrBddcinu8
	 3wksj3ffAMGz6YROqDu0nFeEuEgC1tTKlBAaAgp61n8RRb+nH5UQJOtYFqHp+59msdMOq
	 5wxJuG5KexihSQYZ3t5YNOwuQm/HsNxzr0ckL2pBp7rzZexID/NmX3am4RUrVzdiop39N
	 u6nsbQ9xaE68AimHBCXG3CcTJzFloVkzWrdqdRD11s1mrHTuWHWfEJLhoB+zptJAUlw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921571;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
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
	bh=m8rXEwdx7pb8ZchL7bg34gvBvvdtgFYlAchjaNwKN18=;
	b=sn3xTZ+dBJu/9EGVLjpWXnolJEkXpe/zZMCVGhanMdadSYG3wzilQVS8TQU4lpsgG1FR
	 mty1EUhMTAIg7IhsRgXFyFmpbj45nkk3nEdLZRtymwneZUi0Rd7AVRCPApX3vbD+wHjJl
	 Ntfu0dKaXzonw4shj1r8vl9B/DPGXGoZkIiKc978X5cwM9EWYsmD+aERN76v3bLGgxPVI
	 XA8zFprjCWSQf0PCXMyRZzGL+3OGlQydFEDCC+N100ChLdjezxYelt8u2yO+Vl13vGpUU
	 7N00++hhh38U49z+on2cXMV/60dJDJXKZBltYB01jOFtxpW9/vKW6LCim33Ntg02+wA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=iGObthix;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.193.100
Received: from YT6PR01CU002.outbound.protection.outlook.com (mail-canadacentralazon11022100.outbound.protection.outlook.com [40.107.193.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23104606A31C;
	Tue, 17 Nov 2026 13:19:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23104606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=iGObthix
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NiRtcXYuIuj7DqOmGQwFXJFZrt2HgvEfls8f67ulibKTUO5GGWdFAPWfL9pjOLAcUlWnrzjzaV2yq1+C5cS1qSC2Lkk8OP5/qAy+RxpQV3gr0VHes5F5zAkOg1tAP4VsC4w8zV31w0EvJFpS0GQhfbeAHe86Wbl+g7AQFbXz3igAlISAE+wgEBjUA7U8yLk/iXE46TPFRVPQWX2O0O5SgcDRKKo4jS55BcNPor23/ftGS9b12D4fUZjHmOpbBDZwjp54VAVztnaZ+gCqZxZ6JEM9Fx1/erT8/UwdEg86icmCLTG8F1pBVXURo7FbgT01k32gN2J9aI9JSiQLc2VhEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m8rXEwdx7pb8ZchL7bg34gvBvvdtgFYlAchjaNwKN18=;
 b=Kpw26TtuwlyTaEBZ1zQ3qNh/mqZe84jZzePL4fZ1J9ir1RK+ZcjCsYXlBsF/vfgjgabQ8JZiyroxX084ANaLwaGdlBsGuSeRxveow+mjnzFe5EsF66Oo6voNYst9U/YSVhVlaxFGK71WfSkKwJOwURFQyy36aveH2MdkLbvFW7SsV+lDX2CZVsLlaTesAfPFIndMZ3gQFjdHXDoE1HY/Fi52iXLEbgLPgH0An2H1nxUsSNXe+yl73eMA2V9QZ0LxIWFL0vvBOyyPelA1JtnBDxTkfSQO373Um/vC6fUsw5KNCimifI28C17hZ0w4ydZc4ygigMoqmjfiGVrrw8NgDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8rXEwdx7pb8ZchL7bg34gvBvvdtgFYlAchjaNwKN18=;
 b=iGObthixS6dwwRHX3AIlSMCH5oazpNjhyX6dfDQLpJ4Cu4IB0lfDh3AcB7tlDsxEeCvVy8TCiTA6xS9RJRhOznT/UBb56mb4KxlxJrRJfywXY8t2OA+XzPgZk0PrSDKtKfp+zYd49b9501A0t0a7VKAjgjjZIEheXk/9AG/Ug+3XfAYa/y0l9wUGnCmU1Pn7qSYLR7xxdp5eWqVCT87VHVzec4iFA5o3W9CVh817k/IYodbw+zO3SURQPbgMQY5Q3rrGFyydNTE2Ouo6z84cxVNFQnWk3nxgrtYlDMIv7t25Cn1LJIQmEBov+vS1z409QF3VR6GlogWmajvl4zIqew==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:1d0::10) by TO1PPFB99324EBE.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b08::686) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 13:19:27 +0000
Received: from YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6b9e:a901:67c5:7ddc]) by YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6b9e:a901:67c5:7ddc%6]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 13:19:27 +0000
Message-ID: <82799f74-40f6-4790-8243-5eb6d29292f1@efficios.com>
Date: Tue, 17 Nov 2026 08:19:26 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 2/8] sched/proxy: Wake blocked RT and deadline
 tasks through the full path
To: John Stultz <jstultz@google.com>
Cc: peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, linux-kernel@vger.kernel.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
 connoro@google.com, arighi@nvidia.com, akpm@linux-foundation.org,
 shuah@kernel.org, linux-kselftest@vger.kernel.org
References: <20261116192638.233125-1-mathieu.desnoyers@efficios.com>
 <20261116192638.233125-3-mathieu.desnoyers@efficios.com>
 <CANDhNCoWGAPr+TBPAiZB1bd3o-CGpkYG_w2ssgx0WQryBXe_bQ@mail.gmail.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <CANDhNCoWGAPr+TBPAiZB1bd3o-CGpkYG_w2ssgx0WQryBXe_bQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0271.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::32) To YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:1d0::10)
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
X-MS-TrafficTypeDiagnostic: YT6PR01MB491026:EE_|TO1PPFB99324EBE:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f9d6d33-6110-41a2-adec-08df44ad67f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|366016|376014|1800799024|18002099003|22082099003|4143699003|56012099006|261022075727099003|261028144727099003|10067099003|261026140227099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	Y6//vIRLW4IbnsGAj3D+3JoeWUpPkAOKZauYPYV4eApktd9qxKlHF1muI2qoigak0dbACHQcIKaqFumYl+eWf6p1xvpBgQeVnq8UKFrFO+sYw9dbi2270uwkbEgHSn8cyccEe6s1SQf2cJUTu34YIF9ztqCUul6rmOjpZfTQh5wRxzwyOko5E7QvR8WhNupnlZbF502RMZd5xuU4/ed8cf4R8tnY0YA3y1HGojH0B/knV4epZOrq2MZB5lNPbdD/+F9cGuPv+MHtHvo/vvD9/dVFwyXM4RM5myf1RjfHDAP8IMNk53CD5Yekji/KAV+izZaRlPzU7d4n3FHk6WCneuSgE/55rAqs2gQDyP14f//yxkCce2ET8PEBNEyRHVDWz3z9CLjg2/XUZg+S+/sXNLud9T6dAnAzxhtyrIKFDGwQpLzoaAdvgb/OcqMDsbFpJ8F4EDOftc+ieWpJfvgyvYTqlHyzNiDW6YVmf9sDE8Og3dAwFKeRW6u5g1I2pbrE0flRBOSJ/v59SKQlW3OwMlP9l2BI1O1RJQ/HNck+mB4oXjI4Sp5akW9bdr+qvvcLPUMcYz3cuxjnzvpYmC1/K//foCcZyquCsDQyRMfSw14=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(366016)(376014)(1800799024)(18002099003)(22082099003)(4143699003)(56012099006)(261022075727099003)(261028144727099003)(10067099003)(261026140227099003)(261022105027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emNva0xLWUVHdkFDV0xoaSsxb3RmbFJab1RtcHFrb3NqK1ZCWUE5ZTAzMnFn?=
 =?utf-8?B?OXdjVHo2a1dZZFBpeU96Q2o3bFd5Vy9kUGR2aHlWYTFQaS90Q3V4L1NYMkJu?=
 =?utf-8?B?UFU5b3RmU2xiVERMZEg5M2RHcUpkZ3hLVnJuRENJdVFOVk5Vbml4ckxRTEpy?=
 =?utf-8?B?SHlUbFJHWHZQeWdTZG02QkNLMHhLVWlWNWUxNWRyK2h6MGNodzY0UWRCOXJs?=
 =?utf-8?B?eHZZdFQzeTRCbWs2K2JsWkl0alRCbXdIcW96QWo4UWljditsS21mVWtTamkv?=
 =?utf-8?B?aW1RMzFaV1BFR2l5SUZQKzZFeGtyZ2YyZGU1RE1SVTVoeGVEaVJSVWVJaHla?=
 =?utf-8?B?ZWl3VElCT0dCUGtPclRLcHJzV1ZkRkpORGVXZU9UZ1pzTTMxMUp5elJ4NGp4?=
 =?utf-8?B?TytVUGdXSW1BcXlGb2NFSHcxN0NobWd5dk1BcGhCRFJ5dGcvZmpxQUxMc1ZS?=
 =?utf-8?B?K1dodjUzRmlxWmZSNWsrSDNmaUFSSnhnaHVkQ1Fxd0xhMGZsT0VMc09kclZx?=
 =?utf-8?B?SENFeWVYb0xna05LWnIyWitrN1JQeTJuMlY2VmcxMEc5QlNFZUVnOTF5QWwr?=
 =?utf-8?B?K0ljVExEYmlDUUtFNTNJT20vb1JJSGsybFpaNk05VkE2Q01JZEdjNlRXU1RX?=
 =?utf-8?B?R1ZyQjUxYm5ES215K2pwOTZzOThuUWltWW1zUjhpaWpZSFlaa3JxUksxb0t0?=
 =?utf-8?B?cnV5UjA2TURxb256VllLdmR1cjdrTG9nWml3QUlxeFMza3F0eFNuV1hIVW4x?=
 =?utf-8?B?V29ZTnBQT05CaHQvN014dDVHZ3JnZC8vbWRjMmp1NitsWXdNZUxJeDJ1L0lL?=
 =?utf-8?B?U3JZY2d6N3dzZFFXQWFNWW1CNS9od0E1ODc0cWo1aXdOaDU2WXNCOGsxTVhk?=
 =?utf-8?B?R0Z4T0h5MS9qZVdHeHRrUEtKczZKK3VJbkVWd04xYVh6Q1E5QVNjZTZEM2Vy?=
 =?utf-8?B?eGFFT3UyM1JucEpwYnYwUzJnWWJKNVBmQ1FIb205RlZSSzV0b0JFN1Rka2xH?=
 =?utf-8?B?S2NrU2ZKWEZLQlFPc0VZd0hYQVJZTVRNL0llUFlmZExnajBYRysrMkJaSjhG?=
 =?utf-8?B?enhUTENVTWJEUWRaK3BFOFp0SzUvdnU0aU15TXB6S241VHFiK3pHUmhCRXNr?=
 =?utf-8?B?cHZSNVJqVmRrYzBSTzhVbmkxRlNxVU0wZGlSSStpOUkrT09ySjZxTS9mQnor?=
 =?utf-8?B?YkFpN3U4MjJ4bFcrRHdNUk41MzM0aVJES3BreGRqTWk4WEdXQnhKa3MwOStX?=
 =?utf-8?B?azlBVTBzM0pFN1Avd0s3Umo3Z3ZFMVBKM1lDMlRhZ1dzNExiWmg5VUN3TTY0?=
 =?utf-8?B?VGJzU1FxOHFKam1qYnhOdVNySkw2N3JoMXFRSUE4VWY5NkhBQnFMUmt5ZGJu?=
 =?utf-8?B?b1dVZVhoYk14dk5kL3ZLSXAxQU5OMW9LWWtFd01wMUJ3RmlDWFVZK2lYeGYx?=
 =?utf-8?B?N2xEU2lVZ1NMZjg2UUY1WThSZ3dObmxXVkczZWEwdWQzc1g2TWczNVE2RytD?=
 =?utf-8?B?eEVscUxHM0VYMlFKcEFXcDd2Mlhqb2J5Wm9BMEx2ZDFhRENLYUw5YXBTZE5i?=
 =?utf-8?B?S1RlNDBhZ1BVa1I3a1FtNUczVEJRLzBTbCtoeDlvZ1UwaGdtaHd2UUIwVHgx?=
 =?utf-8?B?REkycGZvOEZSQ0FvRytwTnVXaW9tQ2xkTXc2QXdtaW9weElOakYzQXdXSWtk?=
 =?utf-8?B?eFV6RXFwYWRFa3RicG9HWnhOUzNIeDN5N29CU1B6Y0NQbXIxVTdEajRBMlg0?=
 =?utf-8?B?RHpGam43QkkxRS9DeTFFMktMbmtGM2RoYjN4cmlPNXFsZFREUlJ4bU1XUGxp?=
 =?utf-8?B?NnpPMVcydkoxNmk5aHF5QU4xVFA0VXNwbXhHbkozSCtzRzNuQk9DZ1JLZkFS?=
 =?utf-8?B?cWN3a2QzUWZBWlZwZGFiOFo2ZlNCM25BWE5yaCtIUVBNWTZLMjdsVHFnQ1po?=
 =?utf-8?B?SUNBNmxLYmhrWlR5RmtWNUFmVTV4SjlqS1lVYS84OS9pSnpoejVFaTl0enkr?=
 =?utf-8?B?dEdSaCtxb3hZOFV4aStRaU1renZtTVN3RzBoNFEvRDYvdk1oKzB4d0NWWGZk?=
 =?utf-8?B?Q2xRM3NwYURrMXZncGN1UUp1Sms3R29PRmVESWg2TEhOT3hINE5OOXJUQ1VS?=
 =?utf-8?B?bGlwdzJLN0xEK09sZ1BsV2xjQlF2Q2JFQ0pJL2RHdjZPM09JVVVvZnhsNDk5?=
 =?utf-8?B?NXlCczFQK1dFZVVKd2xpTUZpelN3anpvNVZsdUNPNnFkVkxMbVRGcFdqLzEv?=
 =?utf-8?B?WDYydSsxdGtqVVd2aENweU9tQ2JtM0dzNVFzcFNWOThDSDZqMStucTJCZnRl?=
 =?utf-8?B?SVc3RkRxQTJMWm53cW9TSS9HS2tkUjJMYmthTmlvYklDMUdTcWFFUDdPVDJp?=
 =?utf-8?Q?D8Zt8oRODikT8P3U=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f9d6d33-6110-41a2-adec-08df44ad67f9
X-MS-Exchange-CrossTenant-AuthSource: YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 13:19:27.5027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +5QF7F4OM/1pfs+hYhekWrCEoZKcINLGjOTRoIiIleiY4SGvR2WzKa5BEOkGl6pJPsSEmt//GaQo3mf+Nv/3Z7qwy0eeWWdzA07rfTHMLnc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TO1PPFB99324EBE

On 2026-11-16 16:35, John Stultz wrote:
> Also in another thread (which I can't find right now), a good point
> was raised that some of the early return "shortcuts" that I've used
> elsewhere aren't good for core-scheduling either since they can break
> the cookie checks, so I wonder if a better fix here would be just
> removing that (task_cpu(p) == p->wake_cpu) conditional all together?

Yes, that is simpler. I kept the shortcut for the other classes only to
keep the optimization of commit 7918cf369361. If the cookie checks need
the full path too, I see no reason to keep it.

The reply to patch 1 has what this changes there.

Thanks,

Mathieu


-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
