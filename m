Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020125.outbound.protection.outlook.com [52.101.196.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0588233A70E;
	Tue, 18 Aug 2026 21:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787088238; cv=fail; b=Zm+01dG0+dFocc/JhhG88hI93z7NNP/zMMw9AKWkCxNjWCT7ZsbnYuV7XX35VDtl/XFOalJKVBxbefvhgMl9ssbx910BNV6v3jVVabZucTPCHe1v1ERuVmvCussaJlsDRzDbT2Tvr4DavPMg7QDwxNJzxtzTVCiC1vT1T7ggtyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787088238; c=relaxed/simple;
	bh=mSdIwN2iycaV6yrjsnwC6JkugG43W9nQ8BNBt5mJLvg=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=UOMldXgmbLtQ70s9itZ7avyISjLxUj7NUzzo4gua0wKo8YnUG9+MgmRoyKdS/brdsbcFEYp3ll+oLG8ZXybAwLrdPTKJfCbM5WJFFA3eNk5apjE40r97WiCl+Ax8iMHFzxLzwo596HBgvm3WaZtmyAg2xANKmHOchdc3zb39POI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Vd79tbXq; arc=fail smtp.client-ip=52.101.196.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Vd79tbXq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gAXziBKlVFywHzSVPNsjNNnVYF2BfjV5voEeHoK44aShHa5zCzeO5FcC0bII5kLWUcs0HLsfFfNJNcFpl+23XU3n9MQBmhiDnsE5rtVQFwteYYvnBKfYNKfnCN+tn4BJLfTOBfyn0AhNVY6pO9Hi8xc9HYdW8SMdXIC73Hq7J/aQDD7i5t+Kj4p5uDIKuKfMTZC/0DnUqjXKbROwm9Fvh/fw4onHYkDcbegojdGCIK7I7+6jSo9A2uSuhbTBwlkD/t9RAXnFXuwIQX2AKd0F1ZBrqM0KG1/YS2UkxAvJ7X3pBxl0CLU60O6AElq8uKCoHyC8vKVgeB6JwJyNjZ5CEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSdIwN2iycaV6yrjsnwC6JkugG43W9nQ8BNBt5mJLvg=;
 b=ysQrfCFH7Kp3fG1LmRVaqOkHgIWFWYQ+3dFnnMIACKVKVmWHDzDUgXjC3F679WUm5Y3U6MGxE01paWafiPMV20D6fdKbBMK1G1QFnPOGHJlCLQw0Fgz8VYbw5pbhHuCwstKvrFuyskeEKgdO9BFAB9vL5IVbRJLUfHiIHNTbwVUSTiDqn/R6HZqF/rDxLXMVYmcSz8WQGtCgCVbV5lKUPOpF268aqBUBTGwDb0Yj0gzrM/AwDJ/ycMBfj9oE1INpdjxVkaWxYcBzyzOkRRpb/svjQT8xIF02arqFpX28Ky1W7ySJb5GJ1GwgA90RGhKxHPGixPBc9eHBAzlLfUkuww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSdIwN2iycaV6yrjsnwC6JkugG43W9nQ8BNBt5mJLvg=;
 b=Vd79tbXqRc9pYOL+7fdLRiRDAbkiIynSwwNsHX7PwQ/FSq6wzX5ya1I8rUzQAfJxpaWL+vtEgU14fzRHspnd0bA0ua3DojGiiekoawppXzEZGXWotswuqbBUtCmHDKPAWMrEIuY8V1Te1EycAHTZaTcVHAXwmEyUr3aUSrkXgAQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO0P265MB6006.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:28d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 21:23:52 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 21:23:52 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Aug 2026 22:23:51 +0100
Message-Id: <DKSDWO1NQKF3.25QCXPPUM27J4@garyguo.net>
Subject: Re: [PATCH 0/2] rust: kunit: enforce test configurability
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Yury Norov"
 <ynorov@nvidia.com>, "David Gow" <david@davidgow.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <nova-gpu@lists.linux.dev>, "Gary Guo"
 <gary@garyguo.net>, "John Hubbard" <jhubbard@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Burak Emir" <burak.emir@gmail.com>, "Brendan
 Higgins" <brendan.higgins@linux.dev>, "Rae Moar" <raemoar63@gmail.com>,
 "Yury Norov" <yury.norov@gmail.com>, <linux-kselftest@vger.kernel.org>,
 <kunit-dev@googlegroups.com>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <20260818152324.587932-1-ynorov@nvidia.com>
 <CANiq72m2M5Csh_9qQYa8MRmJZtciU3d4S3ht5FG-K+YwR4iAwQ@mail.gmail.com>
In-Reply-To: <CANiq72m2M5Csh_9qQYa8MRmJZtciU3d4S3ht5FG-K+YwR4iAwQ@mail.gmail.com>
X-ClientProxiedBy: LO4P265CA0008.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::16) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO0P265MB6006:EE_
X-MS-Office365-Filtering-Correlation-Id: 74f87081-37e0-4935-ac30-08defd6f0092
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|376014|7416014|366016|23010399003|22082099003|18002099003|10067099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	1d8fxx/p8xQQtqep5JIfksoGqZJncOzyGK0eboj4pmkeiW8OpDKD1nLyo77+j4CcXCGKpplN0ii1XFfNIzzbDgevVUwyx1/W/UNcnCgF9rmkNTyHnZzvythOAGKD59h98bVe1mbTKlZ0WEZxB+uOwIxsFC4hKjvTAzmtLdb1a/VJJ+BGaC3H6AV+Txn76BEATIUXWtigv/1pwpKYWgft4g6h7ZbnwPDbw7xVASE5mDlDwSCMn3ov1fE8ks8Tm+jaJ0dlGCMc03Q5cbwrjw/qUD3UTnw9Z9PBamp6pT475c9Y/wZqP6N0uiksEts08lPWcsVqLOPDxJeLPhXAQWTdttSBvZoMK4Dv68mXxqnd4Ld4ch2x8yrz2IA3Pmf6JSyUY2aqbSI5Eyyy9K6gHVI6BVZSR4Z63KbRQUWCyJElylMOTnHSsdNb4xJyn3gjWLTRA83+3ykmpng8XNEkQraLX/7cfNYXrtGWDD5ks/mLY70rnWiIsrkQiCPS3Yal+dTDmvfwuum02ky3j2tuNr3K/B5rN19+bu2pFqtQZ152gTmEMHoaFE7E9zh3Iuz4s4WA3uOv9vA6N3/yHcDpPbXIYFaxJOInmn+P+Y1J+uSRkqJUnt8ZTSM0CtbChczW61VowUWjKdDLXPYOtLbQ6ONlFVGE+mKLk8XZvIz5pIRnnio=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(7416014)(366016)(23010399003)(22082099003)(18002099003)(10067099003)(56012099006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWhsT2tMd1pZV1Y3SjNjWVVTV0hTNkZ0OU1xemNQVVRFMERlVlZrUURQUWs3?=
 =?utf-8?B?dGtHTnVQd3RKT3V4M3VtMDNWNmJXT0Zka25odUpSc1NRaERKc0JndHNCQlly?=
 =?utf-8?B?dEVzbC9FNW1WUVh5RWJ3NEkrMlBJdlRXaDVoU0llditIREdheStRcWdCQmZV?=
 =?utf-8?B?Z29icjNiNkh2eWVieDFxSHB5cnRSS0VCU3owN09OVnh4MEMyOUxNaWl0WDll?=
 =?utf-8?B?ZFlKS2VyQWlVdHdHcGdpbGJteWZPM3ZmUHZNZDd1d1lONSt2VWJrd0FQUS9C?=
 =?utf-8?B?WVJLV1dLTWkwNW1HdjFSWnpmMlg5M2I1NjRUZzFteWhDN3JoZCtnVGNtaU9r?=
 =?utf-8?B?NVRTbDlXSTFvMEx1WlV2bjZtNHNwdEZVSWJ0RmFrMmZ6cVlzQmhQT1RJVS9Y?=
 =?utf-8?B?WmRWZmR4TVFrRzZmQmRDblduZUlhYzlCZmpaM1JCNWlrSW1mVjMwSC9tRzVW?=
 =?utf-8?B?Z0JiVzIrWHpOOVpOaVZkbmhvTG0yNXdqc3lDM2sxckQxT2twcXRRb281Q0xF?=
 =?utf-8?B?Y0ZpSVA2dDJNVEo4bENEQWthczhmakFZa1EzSDYyUkRlL2IyT2hVNmpNYm00?=
 =?utf-8?B?Z25sWGZGZVduMlBkUlEybDF3TVZoTUFqZEwwTG1sMmNXbWpMVHk2d1BGd0dX?=
 =?utf-8?B?UzM5a0JibWE2QStoT096ZnM0aEJhRW9aTm90VVVhSU9vdGhnVWVqNi9mejdF?=
 =?utf-8?B?bFJwbUhiZm1SRHZPeGY1RExzR0lNQmlrWGxCWEI5eWJkc0FyeGs5c2JWeHVU?=
 =?utf-8?B?UVlXZVI2M3Jta2NEVEgyV01aOTVuNU5aTWJhK1FtM2FEaFQ1bUxCeGpqTDZY?=
 =?utf-8?B?enpDcmpnUnhtdmhKa05RSXJ6THBmMEdmdDRPOUZPODIzN0pvSHM2NXBhbFJj?=
 =?utf-8?B?c0ZBaXpySlRrRFE3MFNPRXMxOS9CQWl6NHE1c1JmQWFzc3NtT2h3eGEwbzBS?=
 =?utf-8?B?V1R5VVUzMGtNNGNvZ2N3Uzl5RXB6WHp6bW8zekZXRkUxSGdkNHJ0dUpTRG1E?=
 =?utf-8?B?LzFHc0doZWk3Ni9wTUJTZVFLSVp0azhRMzdmdm5STkZ3c2NjUzdGZUJqWGZU?=
 =?utf-8?B?RnRKUjhnRlBzbThTK1g0bm1PQXhmOFEyUDJ0MVkvZUQzekdxdlZOT3AycHVx?=
 =?utf-8?B?bEoyVGZLaE82TlFjQStRcTZlUjBxakdqUEJkTXFkVUNXYXliOTNSZ0t0SDV2?=
 =?utf-8?B?YVl1YStXYWdDdDExV3lWRkhMVTRGL0oyeENYWnRrdUNNVER5TStRWGlLOElV?=
 =?utf-8?B?OUowVyt5M2FJMFc5SUE0R1ZMOUx0WjRxZ205Ni80TFdqSFhOYkdaaFFrOHpD?=
 =?utf-8?B?dWV5RThRNjFXa3RaN0xPbE5IUlJlU0I4UGxUTzRIU3ltWEQzZisvalI0TW5K?=
 =?utf-8?B?emloemNUR3pJV2Ztam9TUm1wcFVFMCtuVkVUZzZXdTFPVkpqYnB5Nk5zZFdO?=
 =?utf-8?B?azdiUTM5V1BWVEpOVUZNTDZVVlJtdWoxeUtJa3VtZXNkUUJJQnVFNkFLOEVJ?=
 =?utf-8?B?dkx5SmhXVUxyN3lJR2E2OG56TUd6alZTR1BQYnRGMW1qRXRzaDRWRFg3bGpV?=
 =?utf-8?B?UzBhVmE0NGEyVWtvbnVac3BMTjh3ZW9GcVl6MzF5ZjNJK0Fkc29lZW5sQzY3?=
 =?utf-8?B?YU1sWU8wNDk2QkU0azlNNmF3S0VvYS9jRTJDeFdXZDdTQ29Qd0RiOURqdjhm?=
 =?utf-8?B?dDZEOTBHUHhIQ3BmMTVDNUtlOFoyK1dQdTJXMFg5NnVnTjB3cm5JV2FIem9p?=
 =?utf-8?B?QVdMRlQ0ZXNaQ2dReVIrWTR1WHdQMGsvMTJpc0hsZVRYbHB0ZFBveWFPTVlQ?=
 =?utf-8?B?NUM0T1JCdzFmV3NhZUhtQXpUeVBTUjN2aEo1a3lPTEdPeVNWQjZKVzdnL01H?=
 =?utf-8?B?WW9DS0JoTlJrMGlBN0dKM1ZZWXEwWENKbXk5TDhuRGdyQXRKcWRDWGxqaUxJ?=
 =?utf-8?B?bUdIYTUzbi9UcDQybDdpOGRGMlk2bUlDMG9XTmVHMkk3MjMxVWl5MEIvUzlT?=
 =?utf-8?B?SHZCemlZeXFJcUpTZjhLVFJ1ZGZiQzVhS1EvazJQMzc1dEFsVG5MdFh1WlVV?=
 =?utf-8?B?dWNEZlNlWlU1TTBodk1vOVM3SlZZT3VYNzZ5dHZZenRTd1ZwZ2hudU5GUE1E?=
 =?utf-8?B?dVEvcnBialgrWmQ4K2tWaTFNMDMyb290d0paUHVsWjgrRFpwNXBuQ21zUGtz?=
 =?utf-8?B?Zi9aamJBdHF0bm9CK2R0NzZGa0VOT0VHV2ViZ1hyVG5CTlFTM3dXdkNRd1hj?=
 =?utf-8?B?RldITlJyM1k1MHI3SHRMSXRBa1IzTjR0QWM3dFF0SXQ5QkhvWVhNam43UGhL?=
 =?utf-8?B?cDFRQUlYSHVoK3hraFpGR01JMG9qVFZpbExwZklPQVlLTm85RVkrUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 74f87081-37e0-4935-ac30-08defd6f0092
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 21:23:52.6773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OTOwZ5IU93dSBusIz7N6/K8Pedr95wXc7kq6CjXEoAWxKNv5ay0tI3hywK1+xzcw18tKyzh49ejNap43eEAc8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6006

On Tue Aug 18, 2026 at 9:44 PM BST, Miguel Ojeda wrote:
> On Tue, Aug 18, 2026 at 5:23=E2=80=AFPM Yury Norov <ynorov@nvidia.com> wr=
ote:
>>
>> Make every Rust KUnit test suite require the Kconfig option that control=
s
>> it, and let the `kunit_tests` macro apply the corresponding `#[cfg]`
>> attribute.
>
> If we are sure we always want at least one `cfg` guarding them, then
> yeah, this makes sense (we could ask to write the `cfg` bit inside,
> for "greppability", and for clarity / less ambiguity later on).
>
> David: are there cases on KUnit where you would recommend/prefer
> something different?
>
> For instance, I could imagine a Rust `mod` for testing purposes
> already gated by a `cfg` that is meant to contain many tests, and then
> different suites inside that for control (possibly with extra `cfg`s,
> but maybe none too for some).

There might also be cases where we want some other conditional (like combin=
ation
of cfgs) to gate.

I am okay with gating existing ones under new cfgs, but requiring one in ma=
cro
invocation itself sounds bit excessive, and also doesn't look nice :)

If we decide on actually requiring one, a better option might me for me to
implement a lint in klint to produce a warning that is suppressable if peop=
le
actually don't want to use cfgs.

Best,
Gary
