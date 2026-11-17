Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.193.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794921523;
	b=nQKJjmD7F+foul6DKsgTbHdY1b2H5cyP/kyQMSBoe1Tg3boU5siqa00Em3B6INCuNMfx
	 xwOIPJRcgUmMRSAe7EOe8UPJhxhSv68NxVB3OjTXCHl3jjPq0Ia2yVhAxNL4K0qOVdRYb
	 orfGbn7zd68NxzmbY1C1UZ7M5bwfSgNlaOy8j2DMY2pxgfsZSUcdD6JA+8slXKJBfm87b
	 ZFSxMkoOyPkqxxTDhrOnb6vAWr0Utg1c/62RM51mdxZ3lgNsIhUA4/4aaI1XXWjbu4FVw
	 LWi08R94o3+O9YTdstOWAIyg73zZ3EqS4oK7+jpOZ+Pn9cyL1v7wijVTKCpEgWhvXHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921523;
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
	bh=8w65EyUdfO2jMO5IDXm0nvACVaB6FKqy6tuZl6xcNWM=;
	b=Uyt0kMtNGFvhoBuWZ8BHv5OBnW5hYz3KCUiKbgm+bo5wTvTohrti8YXNxCYr6V/6fUt9
	 VVMOWwS9TA0Vbsi4NyUiEetjj+YLC+yIAeHjSJUzPiYgpgFvogtPKyKtWORTR84p83k1i
	 bh/68QzizGRaSw8Z83ubOigB5uVakAlN37iFn++mFfq86pRGM4Xf3laT6FNSeZRVUHSsl
	 BFMO9FaJSfR/LUrA0oyUrrzLNbE78prXfUbMz2+XiJVPZlVWaKdjYH2kUGFnfKVG2YubA
	 gdOh0w3sepYJ06TQftBxXYfvYv/+ysFXdw+Bek8JtKBY39JQazRq4XR8n+fbBWomKyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=WQ+DUiOo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.193.112
Received: from YT6PR01CU002.outbound.protection.outlook.com (mail-canadacentralazon11022112.outbound.protection.outlook.com [40.107.193.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4F5606A334;
	Tue, 17 Nov 2026 13:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D4F5606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=WQ+DUiOo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u76TA82Z/8FbfzrSLtsj93sazSbVcQulWs/BU5h8sGrsBHIZiFV9WeYFi0k8OQdgrsl/h0+0Xpc+Inq89SukQmjZigolOwaOcfEoMr/ED7QxIz/ssKPJjoixsPCy4Bxp5lYFk9JBvuD6cmyCreASLFKCtMd4/Kk1BL8us19uX3l8v7cQgh/W7xQ7QxIMybBi7anZsstfCdFhpi+bD5ICY7ifCXueyoYQ8FDLUlR9LzivgugIe/IEVk7t4wYwrFwbuwXNBvlUqSxQ4R/lfVonmpqfgJC3Y22Kvi2CG2g+7ez/lTw43HBuk2ZPdfx15amucXhNPSR1yVa5iSIfA6Dsvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8w65EyUdfO2jMO5IDXm0nvACVaB6FKqy6tuZl6xcNWM=;
 b=JtTcga0DAAC3J2d78B3MLv2pLwGaZfbu0HTQNR5oTA/Pj9xvk+x99gvzhQrR1bVPDOqXIHLtosW1V7WKTnLYXMzMn45f1loBaflb1hI6GOucfnE7MYW+ypFZ49mmaHT+qr/hTQmp6rhq8ZxHELX/P/IDRANKmZDSw2VvtqKBZ0KQYZETT7RfoqSFKPOq0P55lvYYMyxGR7aeAbxNEmNcxtKzNhqU0/Q4QN9D7WhmqxCJBVfIbuYzBk0/o47KPvUUzxeHIAyP9zIhFHKA3EGjNUZL7Dun/qsfK0dnJOR0iPMUOwjXMmZdvPGLCo8tfK0KUAVwtOa3YhaTZp/mRvuIaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8w65EyUdfO2jMO5IDXm0nvACVaB6FKqy6tuZl6xcNWM=;
 b=WQ+DUiOoteQ60Ac9V+2GzJuSaCoAql4uX80nylJUE9XnLPx2oK4N1K0PZW4UKqIT85vJFjepdVrEr38nRoDMTkCntphP/GEKVlpUPAo1vC9l01YsTHIcv/Hguh8oCvkgp/cOpW36W6KGNvukKHSKBJ5fCTpe1k/GGkwPCT5H5ngcd/mVar+pKhkhaUl3jZf+nzxS0ypEAKm5wvgb1um2UK2F7fEwG46lKPRfSAZrA+crMm2uD8JvuWrh6h2o+E1CevhrIptaJZvddbLX5lUdAblC/+5Ghd9HuTCB5cnel2qJqTqsSIB1/6h2PK2XiSdVz+omVnAKHbJAE5A3S9m7XQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:1d0::10) by TO1PPFB99324EBE.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b08::686) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 13:18:39 +0000
Received: from YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6b9e:a901:67c5:7ddc]) by YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6b9e:a901:67c5:7ddc%6]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 13:18:39 +0000
Message-ID: <c04e2868-1f78-43ce-9425-54c8ca42a98a@efficios.com>
Date: Tue, 17 Nov 2026 08:18:38 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 1/8] sched/proxy: Reschedule when a blocked task is
 woken under a proxy
To: John Stultz <jstultz@google.com>
Cc: peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, linux-kernel@vger.kernel.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
 arighi@nvidia.com, akpm@linux-foundation.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org
References: <20261116192638.233125-1-mathieu.desnoyers@efficios.com>
 <20261116192638.233125-2-mathieu.desnoyers@efficios.com>
 <CANDhNCqmsDUC1hx6GnB_2ROQ2rYm3wKYfnbkVAuAjecducsSsQ@mail.gmail.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <CANDhNCqmsDUC1hx6GnB_2ROQ2rYm3wKYfnbkVAuAjecducsSsQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0090.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:84::27) To YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
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
X-MS-Office365-Filtering-Correlation-Id: 339d9913-b977-465d-8860-08df44ad4b52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|366016|376014|1800799024|18002099003|22082099003|6133799003|4143699003|56012099006|261022075727099003|261026121527099003|261028144727099003|261021121427099003|10067099003|261021123027099003|261026140227099003|261102123227099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	eGwCOxfH1tlhvBF8qD3O/Q29lmnUH8bhB8BOAXp3o/zrOMieG3Z1BA62AqewgRt5KY4onhHxrpTNhTi4m0S81p/o37dEUAMjgc1TOKVbMdSvqM070YOxCnTtpHDHl0bKSDXZQNz0kAjfxsnmjfoCaUIxqtgKszppVAtcaIUYfGkiq3Pu2AU331wduJ2awxJS9xBBjXReCHcIIi3RKC+q83g+Thru9RJMvS7T+RwhjTXgLeFv9uKr+fL4dcyLXkH3mexXPrZhyNkCy8a5e9ele5aGn3rZtLzhVjK7lG+3fU3m4u3LSDtceRAcbUqUbsliOVZJ+pDNP2QtP+lnhWWGWGTIN45ZQQRgR9NXOtfJpJTOXPxSn6R/i6T4Myh3zP9qT9H1cZCBbtj9pVK7UJv4btm/Eti8eVJ+Ua+zVKbDNr3RBaoovzAu2dhh+loydmwfgUH4UiB6/RXlyS8rgnxjTxMBoBZOgUr38QQ6LQ70+o5O/oj8QVyaLTzWUZkNS/nnp9U378CVuB3w21Ge2ydt00j0leSruoTJYUIH5Cbil6J3u8FMSdFC3jEdQxG8n8/K22zAXqBTkX2W+NRMI07sYX1RQbRVqTGICi5cS6toITY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(366016)(376014)(1800799024)(18002099003)(22082099003)(6133799003)(4143699003)(56012099006)(261022075727099003)(261026121527099003)(261028144727099003)(261021121427099003)(10067099003)(261021123027099003)(261026140227099003)(261102123227099003)(261022105027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGIwWGJrckxzQVIrKzFIWUlqaUJudUdFVWhvZURyRVBHbUdnN2kxNTBacjI3?=
 =?utf-8?B?dzlva29SUUVnai9zQnhaM0ttejZHOXlRa0ZtN2RXR3h6MTUxSjNqNXJKQ1p1?=
 =?utf-8?B?NDAzRVZ2dkFUSFdhWlFNV0hDQTlaOGx0YVlzS0k3Q2w5cGpLb3ZpT0xMT0Yw?=
 =?utf-8?B?dHphWjYvTGJWellOZWxRYzhtWUtxQWkrQXFleUwva2RjcVBnUDd6RnlXdkZa?=
 =?utf-8?B?QVhGMDBDSWtUZ2VOMndBTjNnaDRFSzZaWXMwclVOdTRBbHk1OG55SHNoT0JJ?=
 =?utf-8?B?RnA2MVM2aDJlMUFVUkg4czkzRGwwZXpGZ2Y3MG1LM1VBbHVFaktxeUFpYTJq?=
 =?utf-8?B?VjgyMUZPRDgxNGg2UXhBWXJ4SDlQNktFcitJTGo3L0dqS3BKNGhLY2wramVX?=
 =?utf-8?B?cS9DcE9PVTI3aDE4ZTRsZCtNM2Q0L3VaV0VxRVhVbHdzZHZQZlRWK1ZQSVJp?=
 =?utf-8?B?U244TkQ4S2FQWFBpYVpCdk03eHZJNVpaMEw0a2VkQVc4ZWNGSmJDRlVLOTQr?=
 =?utf-8?B?cE5jYzhTbUNsd2h1NWU0ME44RDc0SzUwL3lQMUNiR0NIb2k1TEVud3JzRXQ2?=
 =?utf-8?B?TjgxU0lNY2NNQ1J2emoyTE1LY3VMb29MZ3lVaW1PQU9QQWV5bUpCRUs5dFdi?=
 =?utf-8?B?Wk5HUnVQbVZyYVp6a3pNVXlJR0VXL1k5Qk0xbmUrVVg4UTltVWsrZ0p0d3h4?=
 =?utf-8?B?a3pwcEc0YjdockxKSXJLQ1JMSE5JRHJPYnRtZnhKTlJkQ3dVdlJ5V1pWZjNS?=
 =?utf-8?B?L0wwRWlzYU1CL25pd1IwcU1XL2FPRWJNYzYzY1p6UW5GbWhVNHN2VCtIMVpY?=
 =?utf-8?B?S1RMOWhOSEp0K1hKMmxSUW9lYmtXVVRVd2RrcHBjMWNic016VTlvWDNacTdh?=
 =?utf-8?B?TGhidVFCR3BpcythUzdGNnVteVV4SkJCRGFBWm5TL1N2STdYd09PcGUxVnBz?=
 =?utf-8?B?STc1ejd3TS9Nb29paG1QcUh6c3V5MkZUaktqTE9lRUl1Snc3SVRGLzg2Vmhx?=
 =?utf-8?B?RFgzbTZQcDBPK3NlMDNuOHFBQkFrR245RTEvc09pSTI3SWdwaTNnTjlGaXR6?=
 =?utf-8?B?VERnaVVMMnVodUNNU1pCYURySVNKazRKei9JVXIrQ3dWWjVuVloyU3NoRDAz?=
 =?utf-8?B?c2p5Q2tQV1d4MjI3N3ZyRmxPR3lramptcTMydTcyZnJHeHdKQWRaTEdNN2lR?=
 =?utf-8?B?NW9FNzFpUyt6bG05eHVZN0VJT1NJMnBabUwzY1FMaGI3dlNJWVk4akFFSDhr?=
 =?utf-8?B?RitpTEtTT2pQQ0tNelJKbGVFbW1rM3E1cHRHZHhUTXd3ajBZZ3o0NE9LYmQy?=
 =?utf-8?B?ckJoTWp6dEZNeHJ4VU14ZDZuQzNGQmMyVkZ1MnlDdDVFb1k1TlNPbXlvS0tN?=
 =?utf-8?B?aXJTTEVjanErak1ISDNYV3ErM0s4MXNDWWdEUnMyeGQ2Q08wMWprZDAwNDFF?=
 =?utf-8?B?Z3o4TDV1RTVCL25aaWlrUjV5Vk9LaGFjb1RaRHR1WTNPeklpeUtFeGswMjEv?=
 =?utf-8?B?UHJrVnZHZkxwNXhxTzNteXpySGlBSk92dzV0dDlZalVwUEk2UXRqYUhlTk52?=
 =?utf-8?B?TlNnd1gwSjh5NGhJbS94djdLZUNyY3NOdGlLYnNHMkE3cVJnQWZUZDFWNmE3?=
 =?utf-8?B?bFhlQVRLNkhZSks0cllZdUZRdzJzMUxMWG0weUdtTXFVY0U4SnBuVVh0NVph?=
 =?utf-8?B?K0ZkOUlTd1NiMmU1dTY1eTZjcUZ4eTVMQk5rVTQ5SjBxWk9waUxpaTRXR0NV?=
 =?utf-8?B?YXVtQVNhUCtHRjN0WGxXb2NVZFliK2VUMjN6alp1RndrVlZyMFlMSW5vdW9R?=
 =?utf-8?B?VmY0M2s3eXpLUkQ1d3NWZ0Z1K0xrN1UwK01RNXhUVWxNR0VwTGhYbWQ2Smpz?=
 =?utf-8?B?LzcxanpMbGgwNlRqdWM1dnVaZDRQR3M3dHc2RHlhQ1AxZEhWUmdNZXBuemZu?=
 =?utf-8?B?TTBSQ09yajBuSzlKMVZ2VU1CYkxpYmRCK0ZjcDhtRFJ6UGVLUCtYK1FNWnAx?=
 =?utf-8?B?TGVLSXo4OFcwOVBCVXBvVmlidXV6Y3VZZVVnMkhSbElHS1lEVk1zbG5CN0xZ?=
 =?utf-8?B?RG9iSXdWMWRwS1E2YWpES1FJSnczbkRrOVhUT1VQQWJrRUJBT2k5R054TlQv?=
 =?utf-8?B?V2U1a3NwaUFoeUpjd3NlZUJ3QUNzbkdoQS84MzgwVXRoeEl0WklyRTE5R3RN?=
 =?utf-8?B?NDNzcEdZRjZNWGNoalBEelE5NDZWdHZPZ3lJMVdXSldFcmFROVZlcmxtUDNU?=
 =?utf-8?B?c25yU1g3dUh6L1U5UFVwRXNXd2dWQlhHNGk2Yk9NQ3hTT1BlZzRlYTVFTGVL?=
 =?utf-8?B?dytLZURDYWFuZlovQ1F5RkFocWNhQmwwQjNLMytQVzg5bmx5SUFqWnNHRngx?=
 =?utf-8?Q?wAxF9a/oVAd0zfdc=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 339d9913-b977-465d-8860-08df44ad4b52
X-MS-Exchange-CrossTenant-AuthSource: YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 13:18:39.4379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SzdwtVCiQIKprpZaIhhXhaOvTf96jb80PGWtC8Pyw7DDLfr80cwIr1NiGZHZZ+79qZuIuThYQ2uyrpOeFulZdC/zdg/l1cgxmkhUHIswO/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TO1PPFB99324EBE

On 2026-11-16 16:12, John Stultz wrote:
> Both the comment and the commit message are also confusing, as if at
> the start of ttwu_runnable() if p is the donor, proxy_needs_return()
> will have called proxy_reset_donor(), setting rq->donor = rq->curr
> (and already calling resched_curr()).

Only when the donor was proxy-migrated. When the donor is still on its
own CPU, task_cpu(p) == p->wake_cpu. proxy_needs_return() then returns
false at its first check, before proxy_reset_donor(). That is the case
the commit message describes: the owner was on the donor's CPU, so no
proxy migration happened. handoff_fifo hits it on one CPU.

Once the shortcut is gone, as you propose for patch 2, the donor goes
through proxy_reset_donor(). Then this patch only matters for a task
in the middle of the chain.

> So it seems this patch is mainly trying to handle the case of a
> mid-chain wakeup, where p isn't the current donor, but is in the
> current chain? I agree that looks to be a problem, but the donor !=
> curr check just is testing that we are proxying, not that p is in the
> active chain.

Yes. All the tasks of the running chain are on this runqueue:
find_proxy_task() migrates the donor when an owner is on another CPU.
So a woken chain member is always seen here. A blocked task outside the
chain also triggers the reschedule. I found no cheap test for chain
membership.

> Though it feels like maybe the check should be pushed into
> proxy_needs_return() instead so it can be more clearly aligned with
> the similar proxy_reset_donor() call?

Agreed. Without the shortcut, this would be an else of the
task_current_donor() check:

        if (task_current_donor(rq, p))
                proxy_reset_donor(rq);
        else if (rq->donor != rq->curr)
                resched_curr(rq);

I tried this on your proxy-exec-v33-7.4-pre-rc1 branch: no shortcut,
and this else branch. Cases 1 to 4 then pass, in 3 runs of 3. No case
wakes a task in the middle of the chain, so the else branch itself is
not tested.

Your suggestion on the cover letter also fits. On tip, a task woken
from a delayed dequeue is never in the running chain: find_proxy_task()
stops at a delayed owner. So the reschedule can be skipped for it.

Thanks,

Mathieu


-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
