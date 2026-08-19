Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021108.outbound.protection.outlook.com [52.101.95.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3CE1A38F9;
	Wed, 19 Aug 2026 00:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787100123; cv=fail; b=djwSyZs1LdNOzAOGI1T5n1BIGhz8XhRCzKDsltSyqbLZ7JxR5/Znz8gb1FJhYCcrIBNqGIZYND3rcgEUR/DT/tVomzK8v/nABLRr0jNVOPSq8AkmOhvRSXAfZ7/EXYwvyis87DX4d+Djeslw9f53Fvj/9/javry2x3bwuAuFRyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787100123; c=relaxed/simple;
	bh=Xnkk8MPgFKm/99Q7ThfxdeCL/s/GWqkQBZ82lnE9Cug=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=gtZHkBYkQT3k/qBhv9ARmkt0hG66CVU2YrSKsw1DfK7ccWCiv100HXuT1eCCjzpMBaB3alEGojlS1G2CXW/r2H06uCc+wAfFFot7lBfTAkM3PRkKd0P678vSIglHIxfU55Waf8V3+8TBwtIUpzYH0y0Lkr+Ef7n6f6sWu1bBZPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=GOW433kP; arc=fail smtp.client-ip=52.101.95.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="GOW433kP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UPq+BrZ1lZd7r3pddYZVhvahk0DS2kIJSrg/viLrAI3Mxshxqvj/K5tzT2OVQBRN4rllOOMX0mTF62s1hxuiJt8t5MuO+93EYDeAHsIxPtoKsNRrLoUat9iTG5jDhwSdXBjjtF4WY7bxf4L/WsFgDtffZFk+6eXjF5Vi3tt2qeV5IDU+4BWZOdgiUv6r4l4bcllMEHITgT2GrfwAQJL3VqK2UIynRzCxz2w0NohZrpB56aW6VL8Sj8x9NmW07U9LokCOGp6LDiWjZ7dwKIvqm1s6suT9Kprojg/67z/zezzHgmQPx6tcMfKDU18jPxt385ZFhpyLmHXyg8l4/asBLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lxelTAwXkbGkCiJ+ciITLMhA6IJvkXi21Ntd9X8Eku4=;
 b=G3F4315tZT6l7hA9injNZfPIhdLVX5ESHyRNSQXX4tI2K6kmudt+wQehKXFODj4xyHdyEjqbxnBu8UCLxGRHlTRRXrNrKMdORlJhDBzjD9ncL3QFTLqBch3Bn/0E9kvTk/YNcN39xzxudflg2SfkYByFVSqtW5q1O9/pHTeWr/s0dBd2SOxdUinvmITaRUIni8TMI5/hJJn9MMyw5b/dbkXUjNShkYtLXPG6jnw26+N8wHnjR4tgVz1FYz2EDMZaSPHiG/HNCw0KAuq/ouRtwnBGensH4zKa2ezhB03kPeZ4TeBHUGFB+3c0AZgs4dgX3wv3DibC5oJ+zSQs4/CupA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lxelTAwXkbGkCiJ+ciITLMhA6IJvkXi21Ntd9X8Eku4=;
 b=GOW433kPWyqvwakcxAPeARXkHhHmUbj8gagQawPDnKNKNqqCnSii/gGrhyVf/HQQqrwIghgFRcNJ/7n8KHMZSn8nqy8d6D/CiqlcUbix3PMF7K0gLILQBh5bRJsWKVTsea9DyQtTRBnRZTrBz5FR7tbGvJq5JhVk0CilbTAAsaM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO6P265MB6857.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:327::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 00:41:53 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 00:41:52 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Aug 2026 01:41:52 +0100
Message-Id: <DKSI49OUJ0LX.TJAK5Q8L2FIS@garyguo.net>
Cc: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "David Gow"
 <david@davidgow.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <nova-gpu@lists.linux.dev>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alice Ryhl" <aliceryhl@google.com>, "Burak
 Emir" <burak.emir@gmail.com>, "Brendan Higgins"
 <brendan.higgins@linux.dev>, "Rae Moar" <raemoar63@gmail.com>, "Yury Norov"
 <yury.norov@gmail.com>, <linux-kselftest@vger.kernel.org>,
 <kunit-dev@googlegroups.com>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] rust: kunit: enforce test configurability
From: "Gary Guo" <gary@garyguo.net>
To: "Yury Norov" <ynorov@nvidia.com>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.22.0
References: <20260818152324.587932-1-ynorov@nvidia.com>
 <CANiq72m2M5Csh_9qQYa8MRmJZtciU3d4S3ht5FG-K+YwR4iAwQ@mail.gmail.com>
 <DKSDWO1NQKF3.25QCXPPUM27J4@garyguo.net> <aoTjHtiSHJAuDQ7B@yury>
In-Reply-To: <aoTjHtiSHJAuDQ7B@yury>
X-ClientProxiedBy: LO4P123CA0652.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::13) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO6P265MB6857:EE_
X-MS-Office365-Filtering-Correlation-Id: e8917f08-efb9-4e6f-7368-08defd8aa9ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|10070799003|7416014|376014|56012099006|10067099003|6133799003|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	3wdpo6V+kZyLMo0fCJnVIIczJJwUqxwfK5iMOsZNfsucRjC4Mh7aHwqEXWQ440R3pR5SuoQVzVMSMhQU5eqV1H47yJjZRD+TYWu7DBXp4bYeoL+8wO2/Fgzlut9YcFVMoOUAvi53DhG75UoGE/NTeiQp45ZOf5q7wBzq2QSqUudgeATC+/qbLaK3IRRoNyzHbyDO/jGn7lVUtQI5x98fXKpu72WhbUsO7/HWc/sHXzq6tX4C7ehlfdI/KgB3+KO6l3iGdtiKmIhMQnT9uZnJYXx8fis0h1Y+3HjFLdsc7xc1X/FAtLklYs9IRbduXBUyx+Tbaek4MqlTTCDhJYzSqmcsxkgvRzQZTYyG2Cd2btqxPdI+5j/SuZAV5HaATK7MfmrEuxRX+T6TU90SMaSNag+3xrDpo8AzW3PL4Oq7S7oq1eQPS4vw7APsFJ174acKaX6O5FqebMOkrzNzZcx/djC7qILp1soc3ga3KNw0rOw46Z69tnWWHC7qaEcbFllJCoXaz8DwoZ2Byf0rGKgb7j3yw8RQURl2byL9WPa5Z7fwsaX/v5bhrpdr2sAs7rA6oMe0Mqfe9pV1UkOALZ8WwGxdkccm+8+nW6ytthyHzTzndyNPUf5p+0nPQeR6+2RqCiaH1JEnfWc43PSSp2TEQi6IuOGxnDFT3aC3lCEYqCA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(10070799003)(7416014)(376014)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2dydkpkNWhKb0x5eGVldytpZytYbUVuck9JTHRWVnJiaTlaQ01za1pjYkZa?=
 =?utf-8?B?c0hyTEhQWUkzamt4aXR2M01SWWc0SlJpa0pBRVlhYVQvaXZVejlDSjdsalJM?=
 =?utf-8?B?NzBTbjNpa3NLUjA0U2lRV3FJWnBMLytlMHVvYitWYkFjYXprQlJqb25ZU1BO?=
 =?utf-8?B?L0NOb1plQ3FlTUZYL1JqUE9iZzh2eUh5MnBxamYzQlp0TjlNeTlEdm9iWDUr?=
 =?utf-8?B?T2VTcjhUdlRvdW4xM2VKczBBQkhCZjh2ODhZNzRsL3NzVGxSSXVGa1B1VFlI?=
 =?utf-8?B?cU10Qzc0SmNuZXoxOVc3VXpJWnRxS0UyRzFjTFZGS1Erd3ZrNGdVUTErTkIz?=
 =?utf-8?B?eGdpbHExMG1ka2V1TjR1bk10Mkp1Y0NkKzlnU0txN3VId1JXOVZaTytqdTJj?=
 =?utf-8?B?NW4yYWhpY09EcmwrRi9VYzdONGoxd0xUaXZGTGpLZ3ppRWxCZXg3MVd5dlJ0?=
 =?utf-8?B?MjNTaUJKL0g1UGhxUERtTW5WSmF3RkNpck4za3YvYkp0b3RUWTR0VmpyY3E5?=
 =?utf-8?B?VlZFakdRTG9zSFhKUWJtRlpTaTh3bmxMVU1yby9xaUxHRDVpQ0N4ZnQwSDEy?=
 =?utf-8?B?ZzMwb29RVm40WlN3M1REUXFuYVRvY0J3M0g4d3ltdVNkZWhqWWJnL0RCZ1VE?=
 =?utf-8?B?S2xNWmFTMjJxWGdYZjlKZFNXZ3kybXR0Q3gvWjh0VzM0bFRDUHVpczl6eFZS?=
 =?utf-8?B?WC9YdU1hSm8xbmcxVnRybE5VbEM4eFkwZ0pGMjBoNHNncWRhZXBaRk9BQU9Y?=
 =?utf-8?B?UlNxbllZM3VHUHpsZ0NjeVJvbGVTVDVrYVhuK29uTWFiNnNBOWExVGlDbGFj?=
 =?utf-8?B?cVFNNkJkR1FsUjdvTjhoSmx3Q0pKaytlbEc1YThkZ2FxRnNwaXp5TVgxMUdz?=
 =?utf-8?B?OStvbU9CVXZBSXpIcVVvSlA3clZ0RThxSEdMMXpCUU9vV3YwNjV0L2M1R2lF?=
 =?utf-8?B?VGRjRGJUNENyVnl4OFpzTXRvd2hIZW9BTEg0NHphVC9EM2pnb1llWmE3c0Nv?=
 =?utf-8?B?UkZzaGNXNktZbk8zaXArM2hmVjYyRFNwR2RmMnE0eTk2Z3FaZjZndnlrc0Zv?=
 =?utf-8?B?UmwzVGVPemY4cGt2TDdxOXRITXJEc0h0Qk1VbTh3c0cyeXpEK1Y2RGtIQklW?=
 =?utf-8?B?WnhrM1oyRkQyU3l1VWw1ZUtlTjg4Q1ZjWTlYN25MOVZYbHFVWkxYQ0MwL3JD?=
 =?utf-8?B?Z1JHWkl5OUZ6bVdEMUd1RGhzeE1FWDJwYm4wejZMbXE5N1hBNldwbjBJU1U3?=
 =?utf-8?B?NGVLaHo4S0prSFZ3MncwcUFBRUFZbTZUKytxaUdaQ3VZUXg0b2ZTcmE4eHJm?=
 =?utf-8?B?eDE2WmlyVWpEak5NS3MwNmVQYVZ0YW9BSXJ6c09WU0NMY2NvS1JRS2UzeS9V?=
 =?utf-8?B?Z1BpZWtydXp5Tzg1dWZXcHRDQnNzeFQ2KzlSdndoRjNvSUs5dE1UeG9RdGox?=
 =?utf-8?B?QWhiKzNCQ09qZmNORGRtUy9yU3hyVlQ1WmRaeGdQUG1BdEhNRmJjajhac01t?=
 =?utf-8?B?SFFZbWM3aFlJajdubjNHNExna2xVM0I5RU9tVklTL2h2Tnd0TitIT1gwRFJN?=
 =?utf-8?B?d0JUUHl4VW9NdGcrSURCbnJmTUY3SmZQUG9kazE0SXBHaGxvMkFkYlJnQm9W?=
 =?utf-8?B?YVRyYnZoYWpOQ1ozSzhuSTUzbWRVUTAwUWxRSk5QbjZWWWJFMjhzSGhoczNS?=
 =?utf-8?B?UXpOc0pNTFg0WWF3MW5mMkFDWjRuZHRvTjVaQlovVWN2N0JHNFdEdTRkS09V?=
 =?utf-8?B?WmZyRHBvbThqbmZPOFJkRXhOYk1yd2RDUGRVK1JGNmVFbWxuS0xEUUpEQXl1?=
 =?utf-8?B?QTU4QXlJTkozNStpdkNnSVJJU1pUS0tlOUlxc3pCR3ZRSjZaUVVzanVkaFFW?=
 =?utf-8?B?VFI0U1VlRkQ2amdoWUhKZGNaOHJmdDZLV1JkdWNFdURxUjdzaDhIOTh0ZkRw?=
 =?utf-8?B?cEo1NVZ0WUo5TTVSYUtOVkRWVTRaeXF0T1NlMExTSlF6aHVyNWZmMHJySktV?=
 =?utf-8?B?akhBSzIvNHQvOE5iSXhZblF1MCt2Y2kzb2hDdGxYTFdFK0NVSnVWYkRsdEZU?=
 =?utf-8?B?KzRMNnN3b0xOSHZnaUxJV0tQR0U2ZjdHUnQ3RUFPVTVHaFdRd0NQVElHYTQ1?=
 =?utf-8?B?Vkdkc29LeWhLNjBmckMvQXRSM096V1pCbzlvRzFjeXhRTFNnUXNGUG41dUwr?=
 =?utf-8?B?SERYZVgvRndLdnQwRTdBcUpNUTcrNm5zRThWNmFyY3RWbmJvbFpRR2FEYXRH?=
 =?utf-8?B?ZHFhcUxLQXlYVlU0NHhVZEZqUXBSOUJFdkJXNEJlQ2U5cWxKWWtRVURQUVlz?=
 =?utf-8?B?bVhLUmpKbHNOWW8zZE9ETEFCclNEUVQ2YlRnajFvUjBmcEx2MU1EQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e8917f08-efb9-4e6f-7368-08defd8aa9ac
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 00:41:52.8547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hXlO+Kx4zlxtWm7xnPPbfof0Db+zSvUy94h/V8eG8iCalRDRPkAKsapwAvwtd8030sgZd0haco7XcHeJc2338Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6857

On Tue Aug 18, 2026 at 11:56 PM BST, Yury Norov wrote:
> On Tue, Aug 18, 2026 at 10:23:51PM +0100, Gary Guo wrote:
>> On Tue Aug 18, 2026 at 9:44 PM BST, Miguel Ojeda wrote:
>> > On Tue, Aug 18, 2026 at 5:23=E2=80=AFPM Yury Norov <ynorov@nvidia.com>=
 wrote:
>> >>
>> >> Make every Rust KUnit test suite require the Kconfig option that cont=
rols
>> >> it, and let the `kunit_tests` macro apply the corresponding `#[cfg]`
>> >> attribute.
>> >
>> > If we are sure we always want at least one `cfg` guarding them, then
>> > yeah, this makes sense (we could ask to write the `cfg` bit inside,
>> > for "greppability", and for clarity / less ambiguity later on).
>> >
>> > David: are there cases on KUnit where you would recommend/prefer
>> > something different?
>> >
>> > For instance, I could imagine a Rust `mod` for testing purposes
>> > already gated by a `cfg` that is meant to contain many tests, and then
>> > different suites inside that for control (possibly with extra `cfg`s,
>> > but maybe none too for some).
>>=20
>> There might also be cases where we want some other conditional (like com=
bination
>> of cfgs) to gate.
> =20
> But not a single current case. All the current tests are flat and
> simple: every test has it's unique gate config. Do we need a more
> complicated scheme? I doubt that.

A common case in Rust crates is when some shared code exists when either of=
 two
features are enabled, do

    #[cfg(any(feature_a, feature_b))]

sure, with Kconfig you can add new config and select based on that.

I see this as an issue with composition. `#[cfg]` and `#[kunit_tests]` are =
two
orthogonal attributes so one shouldn't (and shouldn't need to) be absorbed =
into
another.

For a crate, one might want to have multiple kunit test suites in a shared
module. For that, you currently can do

    #[cfg(CONFIG_THIS)]
    mod tests;

and have `#[kunit_tests]` insides the tests module freely. Your design woul=
d not
allow this (or would require a always-enabled feature to be passed in to ap=
pease
the macro). Also, for a leaf driver crate, all `#[kunit_tests]` would likel=
y
share a single config, so there's repetition as well.

There's also an issue with doc tests. Unlike explicit kunit tests, the test
suite is generated and you don't have to stick your attributes. Currently w=
e
have all abstractions in a single kernel crate, but when the new build syst=
em
for Rust lands, we would have each subsystem being their own crate, and
obviously we would need a mechanism to control when doc tests are executed.

A more reasonable approach IMO would be to specify provide a global gate to=
 all
kunit tests within a crate. So, e.g. for Nova core, just add
pass the Kconfig CONFIG_NOVA_CORE_KUNIT_TEST name to makefile and it'll gat=
e all
kunit tests within the crate.

Best,
Gary
