Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021073.outbound.protection.outlook.com [52.101.95.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9ED432B9AC;
	Tue, 10 Mar 2026 22:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773182393; cv=fail; b=qdXv1EKEP62vrIK75q7u59BQqQFXFxzB+Z2wlfupV90D2kYrYLe/L899hsOXg02EHl99zeKVF72+vqhKyMbCXy3CfltwQYF3kq1iA3Ini5I3+s06kaF+NNGk0tz1cDM3XRJyMqHQiDKLiB9EGvInnfy0NkCIGzzskUy8abNthgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773182393; c=relaxed/simple;
	bh=D+4M4WidCN7c07IG/jjJ/y2p6lhYMqmWun1+PHHc0UM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=p1kl/YcXmcQYvDWeDNOZUNVspyA5rGcB2JkLbhqiHwFhxtdEYMDpucu98nnCzCmHoOsjEqhu0YdI+VJmCqszYLvaXKERbIJibIC0fWem8sw8R/6yxGqIc/Y/ozS14EHdKNFVOgq2ZA1AxFfgckspduVJtTkn+ttXrKC/VOq88Mw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=c/BvC9O9; arc=fail smtp.client-ip=52.101.95.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="c/BvC9O9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iQ562TQuz5PvYcQVjJDMUgnQwfaWpLg2/tKSRgjV6YPvGNlPNrskOpGhZ7I1pnnwqWLROStEalK3X8qYcE/jty9Hy0bC1IFacxbCxm7kCBByiABwPtXhD2WTk7ZJrvhK3RPpesHxPxWsrmilQl06pLR1cg//qzcHS/4l4FGB/ftgqERHynxkb3KB4GcI8+MSAOdCDko+LbMZPZnxVpLGsUDMQxWVKllEUoURBUGBSW+ZHbHzwfB1CB7GYshf4ec3NYsNqMLhlND32Zck0y14STP5SemZ896xPgHLd0+VM7dOGRNi9BtVINCp6Rt6QSuxWgKyJX/EVuy7Z/367fFZCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wt29KfgCBj/Q7eCDe50VqWIoYKF9KAlJfVYRs0lL1Mg=;
 b=bb93oY7JmmDvujI5DjKSf5eGTv/02acZyA5+lmn3PKk8vcO+7xIKGdQlMxdEZ1YI5IKoWLp3xDMC+llMXgVpGbwahX1dyskE0+jRLSEk1+dd7hsfIiX/FU+iXhIvWheeGXdDmBLsmHpdTFcc5gAwpfXKibchG9Xf/6vXl1BB3rJGtqTSuc0nUaRsI1XLWI2mJ8vExKFknNylrJ9Knc8BJYCkEejU4yVUGQnC0pMeoh5IyLmtSTe8Zt9KVbdbNdEe7jF61YOei5unkVfb7cb8shA4wU7W7EUSHDnQimR3jJ+V0523OWwE1pTtR+ikM+zUOYwsGlsGPbL+jUoUdXv/uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wt29KfgCBj/Q7eCDe50VqWIoYKF9KAlJfVYRs0lL1Mg=;
 b=c/BvC9O9yZRvlode9SLGlrTx1LdKLGtJjRiOzzr6Khalfm6F13Uxojp/5hwTwg0UdGoQRYEz1oZ0Zl0bhuFaBmvdWM7S0Xx/aN35qe1VkeK1genLKfYaQC5Q9ZYDh1edTzn+smn0OLgktBheNlpVHcOXFGEnhFFHwgziNVSXzmY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB3525.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:ed::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Tue, 10 Mar
 2026 22:39:48 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9678.024; Tue, 10 Mar 2026
 22:39:48 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 22:39:47 +0000
Message-Id: <DGZGP3EABY5M.9MYEBBHUN3Z6@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kselftest@vger.kernel.org>,
 <kunit-dev@googlegroups.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] rust: update `kernel::c_str!` documentation
From: "Gary Guo" <gary@garyguo.net>
To: "Tamir Duberstein" <tamird@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Breno Leitao" <leitao@debian.org>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Brendan Higgins"
 <brendan.higgins@linux.dev>, "David Gow" <davidgow@google.com>, "Rae Moar"
 <raemoar63@gmail.com>, "Peter Zijlstra" <peterz@infradead.org>, "Ingo
 Molnar" <mingo@redhat.com>, "Will Deacon" <will@kernel.org>, "Waiman Long"
 <longman@redhat.com>
X-Mailer: aerc 0.21.0
References: <20260309-cstr-rename-macro-v2-1-25f7de75944e@kernel.org>
In-Reply-To: <20260309-cstr-rename-macro-v2-1-25f7de75944e@kernel.org>
X-ClientProxiedBy: LO4P123CA0468.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::23) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB3525:EE_
X-MS-Office365-Filtering-Correlation-Id: 857cd8d8-6f6a-4ae7-b8c3-08de7ef5ef7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|10070799003|366016|921020|7053199007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	rt0tMUn6vxsVohrMuODsFIfB1lPzVpGsbSyzte9nm2FbWZt8HaqYhzcb9CkSoXrmxjQK8tUyVcJncZvfqEGo0BDroC1yE1GKHeFqG3pDo1zmfUT0Ey/c0Cnwp2a7KeEBABjustfXH31ZyzxzkPtkVnVaNvxEHrJSeROin25r16KQ15qKmU2OvRYVqf2DIvOMcLxMrlUEH2DtJc6nINwSzvTAimYZt6/bJFZfBteR5E7cFrdeJp/XHpXNh3Wm8xzqNxmLvv+7snW9HFUMBuw4CiZkexBbHPMnrsHU/V9aAsiUu3r6SP2Ux+qtArWv6FA9EyiHnEoYlQJZR04n6xQTGF7EpqnSnYQZY9HCMfTlo8Jcuqp4VHmEZTWuGnKNQ/c6gecmJhRzaD4sMVO/mn65egdh3+YLBwsGlHEA1FZ/7wHxHgwiMbcH63hA0/4EkI+0WY9X33j1oJK2hyV8sAM7CZQFhRFJrv0YS4cWhryfc48a7bb9gyBl/m6V3i4Uv+Pii1rqI7v62n55CnLzJ6rg/lZDW2QA+3ZEA7RWMyeMzXH/JbR3xdAWigqbLEh2NeiPB6HI5QQ0Lsq+CnhtMGb6GHiIiFETL6TzD0Es+2/RTS7z5Li33A58sL3d2N5/aHJGvPAyPTOLSz4uAOsFuIptCyUNm3pLMSOolIR98QZxK83BFZI+NEl9kBvql0lVg2Q48eeQyFkKasddS1AviF+QYnHfU7rLDUAGLqv2PAnUqCg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016)(921020)(7053199007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlR2TkhxSXV5b0J2WjJTUFhzOHpEUS9pNTRvaHVlN3M4eHhCRWJqN0c3Ykh0?=
 =?utf-8?B?c3p1cmpvMS9zS21tNnlQS0hvRG9FcVpYWHNmaW1zK3JNVWdIU1FlcERoOGlM?=
 =?utf-8?B?VVI1UG1rMXkyWlZOWVlFeHNTTy9yYjJrTFBxR0NPV1VNTHVUVFJxRWhxWmRU?=
 =?utf-8?B?YW1adExxZC9hUGxtUEhzS3VSYmlyYWVkbE5tcjRsQm1URFIzRng5UlJzMG5q?=
 =?utf-8?B?VjlEMzI4Wm12VkgwdUtnZm5uTWNQcitlemFJcTBzcEIyQXM1Z3VSYnNoUFRv?=
 =?utf-8?B?MW4rb2t1eUxXa0pWS3FVUUZlRjYzR3RWMnl5aEZRV0JnMkNWNVhuME1wWlc2?=
 =?utf-8?B?aWNQZmZubVZWcTdqd0dtdklXL2FGeXBPQnNrNVRqRGpJWkI3VUlaeVRlNEh1?=
 =?utf-8?B?VWVpK0RQNWlNclBxLzB6Ni9WbHpKZ0lqcjBmSWk3YzFoQ1NVVFR0dXdVQ3lX?=
 =?utf-8?B?SzdaZXFhMnJSMXl5QzlkWHNiRm00eUNHS3pXam56d1pFalB3TWYyTUswbm01?=
 =?utf-8?B?bFNTb3RlOEdIYStBQ2dmcERQam53TVNLd09uVE9GNldMU1p5cUJmMis1eXY2?=
 =?utf-8?B?T3hpTTAvL3hBcWI0U2JMWEF4cDlUSTA3bk5tNXdBc1Z0UlcwSU1sT1Jnb2Nu?=
 =?utf-8?B?SnJqQk4ycTlmcEdNbUc5bVV3UjI4SUYxeUdqeGUrb0lab2UrOWVqVEdWUS9z?=
 =?utf-8?B?VldkalFYdjlJdHF0Q3pMR0dnN1R0d3lQN1hjNzFjSzlOUHB2SFJEeEJQUVJi?=
 =?utf-8?B?ZlNBVktvU0x4MVJSbTc5TUVWWFBQYzhkZlhOSlE0YmgyRkIybWNERENDaXB3?=
 =?utf-8?B?MlZSVTN1RWxMSVBsSDdmUTI0R0xWZmlWTmhVdzlubzFmN0NXYUQzMG9yYTda?=
 =?utf-8?B?ZHRZWmNwUE1hM2lLVUtBc1ZlbVFMTmpwSWxQcnE3Nm15Y0VHY3VjdzlkMmdM?=
 =?utf-8?B?RnRoZnZGUEIyQjNSdjA0dVJycmJhUmZaQkorRkNBK2hwWWtxbkFOd1dzVnRp?=
 =?utf-8?B?Uy9zSERoTVFGSzMvdnhqWjJNVVZBYnNwOFB6QVhhc3pRWW0yVk0zeUtiZFdq?=
 =?utf-8?B?MFR5bi9JZFduNFh1QlE0NmpnRnF2NWduOUtTUDNPcnZveW9MdDg5UHJYRXA4?=
 =?utf-8?B?VGFIMjNialVtUzFkZlM4VE5UU28rVHpJeFNXaVZjRUFFcE0ySG5RNkVuUEs4?=
 =?utf-8?B?a0ljUW5SclZiMzlqRjZuYktlb1RKbWpJMzQzMkErUC9kd2YwS2oyZzZRa0la?=
 =?utf-8?B?UHJzMTJoZTBjdkhyUzROazcxdUdSN1lpS3orNmpTaFk5Q2VBS1VlLzE3L2xo?=
 =?utf-8?B?clB2eXNjKzQzczdqM1AyQVVKbGJRUGVRVnRlSThFZzczeWYwN1N2ZWRKdW1G?=
 =?utf-8?B?MDM5RGRuYVY0V2VLOVAxNjRPYTJXQmlRUG1jTEUwVkNDMFZvMHV5WEdkZENU?=
 =?utf-8?B?V1o0aEM2RFRlNWVMNURiUHNLZnphSHJmTkdtYm1rbmpvTEloNWMyYzZDSVdU?=
 =?utf-8?B?Y0FnQzZzN0ZMWlhpcGZJYUFMNGxkNmxuUkpFQlZPRHdzbWprS3A0dmZoa2ZG?=
 =?utf-8?B?QjU2VDdGbHR0a3ZlQTNBMkM5UTRGTFlYYk95YWl1YkI2NDg4eWVpMGpUWDEw?=
 =?utf-8?B?TTFBUGUrUmxITmxHRzVnSVRkMXdEZ01wWGRZSy9jcXBIbjVpUzhoRXFtWkR0?=
 =?utf-8?B?cHpuVUUrd1dJTm0yalJRWlFoL04vckplUit0SVBNQTFSTy9tcDdnYmhYQVdu?=
 =?utf-8?B?V3ZUb0Rqei96d1BmL1h6L1ZLaDNtOFJ6WmdyZ2RhbCtTcnlhRVBZNytMQlo0?=
 =?utf-8?B?SU93dnVFdHpHeFRWQVo3WTFjSWpmY2IycXBQdmdvQ2EzSEJZYkNCWFdzU2xS?=
 =?utf-8?B?K2xLMUNjVTlKbHRiSUR6cVFadWtZNHV1SEV1ekVoQjFiR013UXI2VWxsa3RX?=
 =?utf-8?B?Qlg0U0YzUUNreXQ5c3NxWGFkWVdCQWljVGk3WTRtbW5FcGJSblVpWUx0TXlL?=
 =?utf-8?B?ejYySGN1WW52Nm9HcXlJVFFBUmsvV05WL3UzcG5uTTU2M0RLWlB2RGw3T1Bn?=
 =?utf-8?B?V2J1WUlDU1B1c3N2dXc1L2NyQ0E5Ynlxc0FlQW1keks5bHkrL3BOcFhHcFBh?=
 =?utf-8?B?ZU5MNFEyeU5KRktqL05UcFVEaTAxNkZVM2hRMXdSSjNTUmg3enhadU1hazRM?=
 =?utf-8?B?ZVFyR3VDYnZBTkVRU1BtQXB2Mk03TmJ2R21Jc0xWMWI4dEM3b2lnbzRhME9D?=
 =?utf-8?B?OXppbVZkSUFCNEgxenZyMkFCUmRTdDVWeDlUNjRNdVZra2NSMmI0K2V0emxG?=
 =?utf-8?B?YkN3TTc1bmpSRG9vSVdOMUM1UllHMEZwWi9STEdLbXpyS3BUamQ0UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 857cd8d8-6f6a-4ae7-b8c3-08de7ef5ef7c
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 22:39:48.3980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qid6wNG9qRM4dKjB/OSMDj9Ed/a7ynVR0I7dCb18E0GMBwsQlpxJAjtW+FgTm8ypsH1qgYo8+SC9dEOgciLkRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB3525

On Mon Mar 9, 2026 at 5:01 PM GMT, Tamir Duberstein wrote:
> Now that all literals are C-Strings, update the documentation to explain
> that use of this macro should be limited to non-literal strings.
>=20
> Link: https://github.com/Rust-for-Linux/linux/issues/1075
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
> This patch completes the work of replacing our custom `CStr` with
> upstream's.
> ---
> Changes in v2:
> - Drop rename, keep only documentation update. (Gary Guo)
> - Add example of misuse to documentation. (Gary Guo)
> - Link to v1: https://patch.msgid.link/20260302-cstr-rename-macro-v1-1-a2=
69fe4dc3f0@kernel.org
> ---
>  rust/kernel/str.rs | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)

