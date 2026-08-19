Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013025.outbound.protection.outlook.com [40.107.201.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F438CA6F;
	Wed, 19 Aug 2026 00:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787098256; cv=fail; b=gq1Y4s+R8lyKeCwUVgkpj4ihpK/rnZmwNDU6rpMEGWAueEfBXDjKNX3ud5hh2Exa/ktb/NlmOpuLgxod7ocmRR+CxsDAzNLF1js1REEkYCW6PXi5FCGVj75QV07ArbXKmsPJOhWSIY4Nr+CgCPoe3R68xfz5Ue2xF48nJoNzTS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787098256; c=relaxed/simple;
	bh=+dx4x3atwBTofbgUEoTTsM5DHZX6a2V5TrrXh5/RWsQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=J5vvCa3RN8tKAHgALDPF3NatpJv5twKhMSaH/fkauIXt2pWPZETx1y0Cvfwv3ugdmy8qnj+9dGcwN+AltsYUkdnex6welR3WOyzsS9p+/RWpmCk3jFmnRmY0yN0Eggi9E4zQm0VEWiQdqzsrJygKIc58QGu0ES6W7WuxgoD7798=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IDQoOVfp; arc=fail smtp.client-ip=40.107.201.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IDQoOVfp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SEqiJMdsfmuHmHPlbgKJ/S7XqxZ6I5lY4yhEmsTfaEj7ki649fCztsxOcstfaRDfHqSwtJOwP0Ehf5DPQSdt0L0t3BSq+PWnGzwL52oDK7Wz7e0qdDY2vKgK/PeGE7QrmeV486bUpd4b3Dem0KsNVjebB8NdPUriJl40umGeIVDBn0SU87+YQOLejqY1xZwUIBJtUbcREZAs7wyEVzLWHpB826jWflkfKVolV5UVt7nvQ/YmIbq5dPKs66OReL52rMdAV0nSXUNSsyOIGy44P8+M4qxP2RkD9Z17mBoFnbJorzCg84d4ajXCQmjMCYZdjFzFcMNpM4LdXzMJlFc/fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y302X+MMK7dkcki8Y4jizTDPqjGz8bb5TsaowlhdPZs=;
 b=iJ4XhTB+AfoAHFtan0zT0kZbxI+1wRHxZ9rg7LqHZEq7e3OkyqwrFTAR37qhVZzFuObNRCDuxsJi4ese1erWlXvCZQqOCoQ5PPTYXIqez9eaJBvyHUyxg6xOysivuQMDqVL+RJ66oK6/G0McTjbO4WQqIGtFlU1Jj0SyjZSYR4MXo/j0O9t0p8V6IrWwMJ83uQPo2cYBtPZMiS6RjG6FEzaVz5bIXvut4HW7jFx6G3TEoEauwnYbbFUNhT7y6kcTHXFnKw01iAxfjTtPmDv07rAwhpaYsDuciABlukTOJ/NzzM5xOuEyvFQjW00LXFKl9fRJ23GmVUIhZ2Zg8YCzVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y302X+MMK7dkcki8Y4jizTDPqjGz8bb5TsaowlhdPZs=;
 b=IDQoOVfp+MW4CeCAXKVbiQHYWvAfrryit++SODK0mx+uzGtpjnPQoVZRYTS3QBCQiGe5w4JA+MmhXWOdsDuAsUzEzxZU4VeVMeJ/gz1MnyvyAhMZ0SrNo2WdxUl/WTwlC9QW2nf+fvi2MQBqwik7neC4G1DOH6S/f2O3rb7Xe5h7KJfOhmAes3TUgOO52ZYOBzFSAgq2U0sV2HZTJyl4z+gXeBLGSV26wI8A+f5TS0X29kc78Y5CyWMtf5psIFZlJwKAzTjGfWJuCQH2QrxXb4aZFWoEk6iyunXF5b08HbD4APv1K177O+grAqrumOyEdkTi4/fMv4SWVkAAopq1jA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV8PR12MB9668.namprd12.prod.outlook.com (2603:10b6:408:295::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Wed, 19 Aug
 2026 00:10:50 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 00:10:50 +0000
Message-ID: <6d789da4-728f-4be0-8d8f-5644e9ceeff7@nvidia.com>
Date: Tue, 18 Aug 2026 17:10:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] rust: kunit: enforce test configurability
To: Gary Guo <gary@garyguo.net>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Yury Norov <ynorov@nvidia.com>, David Gow <david@davidgow.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, rust-for-linux@vger.kernel.org,
 nova-gpu@lists.linux.dev, Alice Ryhl <aliceryhl@google.com>,
 Burak Emir <burak.emir@gmail.com>,
 Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>,
 Yury Norov <yury.norov@gmail.com>, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260818152324.587932-1-ynorov@nvidia.com>
 <CANiq72m2M5Csh_9qQYa8MRmJZtciU3d4S3ht5FG-K+YwR4iAwQ@mail.gmail.com>
 <DKSDWO1NQKF3.25QCXPPUM27J4@garyguo.net>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DKSDWO1NQKF3.25QCXPPUM27J4@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::21) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV8PR12MB9668:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a25c299-b93e-4daf-2bd1-08defd86536d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|23010399003|376014|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	9SMHJTosCYZiyUV0lbStJaNgMocP7fpNvWqou7m6J2xeAfmrGS5lNR78GymsN49kX4ydLx/p01elKYYEpQe09UY360P/zRSQzqRCwFcT+H1sVdM1kTMjZXTP8XiLoJQxAtolI+DfGtmuXREAnzGV19oH9pGhyZy6YqjFe97Dc8I0lmAIbWkTVSwab2g0a7SUVls0/wSCv+cfCJq0r6Irl8QWQRQ/V1VFpTHHi0NG/3Vrgj8FVEzlQXB0LgyDFTmCa0cnFaE4R66ABZU+CX7QVq7fwDkYq3Lgaq3M0OFyP8w5MYmUeWImkVeuYTozSHtzcg3lo9RTMMhzrejy7qW8/51AhZuzALhtn+GwHftXWZGiKWnBjMeh44KyepSvt2vjvBFri56xFhH8zuO+u1U+aubWPxuPwRiFkkt38y2z1Sfh6rnf4E+QyHn18QlRlfBpX0OelkiCBNCPnMaNzVsSc+oETJAb+B1eFFKJHNWA3hkRbRicKyvJhk+9sSiYSXYJgKAsczp2hLPXzUvAFFanyUtM1nyab8LvQsONW4Xye+HaZc5RmQQJH87VRdq4wIS4eJAkSR4/Kj7DRxZxNGe/HpU6nUc7jlm8bA9q99eGR2g+g9ETwTC3XW4fUoCz3Ih4GLBxvjcdyIJ0RKpOwAQ/qSgHFCUK630YOanaX2WNk8E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(23010399003)(376014)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHJ0UnRpVE9qVk9HUDVpK2VZZExmTlY2STJhN3o2YWhiWHQraXh1QTBET093?=
 =?utf-8?B?ek9UNFU4UnFLWGpZZTFWUVRVQVdGRWlnN05sZFBSVE1QUU94Y2IrbGkrYkw5?=
 =?utf-8?B?bmtudUVKbnRwSmhtM0F6NXh6eXY3dGdveUVHRFkrbHlPbGhoTytGV2RCaWFD?=
 =?utf-8?B?UWMxMlAvWXRiQmFsbTdRUGFzRXY3bFBQeEJYZVJMQzB3b1RGVjJWTTRNUzZ1?=
 =?utf-8?B?VzIwbnJUdXNyalI2TTgxLzV6U0I1YTQ5ZTUxMTIxNmMxVjkyWFhrMFVUZHRD?=
 =?utf-8?B?b2JBa2pRcTFvemJDUGtqZDNQZjNwbW1QSjBzY3lDWXpPMHEwdDBOQjJpVDZG?=
 =?utf-8?B?UitOdFZYb0trUVkxbDNzRHR6TjBzMDNZVEpyaEtUNS92dE4yaEJvUHZERThm?=
 =?utf-8?B?WWVDRmFrY0p4QUZTQkxPWVowVlJ0WXpnR2JYOEpBdUhrcHlvRytiQ0hwdFpO?=
 =?utf-8?B?ZktRZmhjRTBmVC9hU2JRTUtUb2hISnV4UlVOZ21YOFhmc0FrcGlyZjRiUjNV?=
 =?utf-8?B?d3k3WnFZYnE2NkVMcWZhRVNrMEE5WUZiZmJMYndsTUh5RzZyN2ZKbU1kUXJm?=
 =?utf-8?B?WmxjSm1DYkNXRy9tNDFBcGo0NmJjcDFMZHpNWGMzM3cxTkpqUnVKQ3I2YmNG?=
 =?utf-8?B?cXU5d1pTWU04amxKSXFaTXFuZWs4OHIzdVBjd2FMNUdScTlNYldVdVd5NG9v?=
 =?utf-8?B?RFhNUGtZUnJVMFJPYTBJOXV3Q21qeGZJNysydzJTWlNGcDVqUGdrTGtHbGdn?=
 =?utf-8?B?aDV3VzE4RnBrYTJRRDdIakVYdld0WGdTZmo3S1FWUFRvaHhhSm54eThUQW5J?=
 =?utf-8?B?NzB2MTNLMVNQU3Nod1Jkem1wTlQreTU5WFd5UUxxaU1EcVJyZFFQNThFSkJX?=
 =?utf-8?B?SllnTGllWnI2Mm1MV1VIRHRibi9Nb3ZjT2FweFRpMjhmMlRvUXhmUWFId1ly?=
 =?utf-8?B?c3VtYzFyY0hKVGdHK3hDNkxzUS9ZQUVsQitCVCtmdk9HeG13Zm1WTVZCTnpZ?=
 =?utf-8?B?SmRxQzRhZUJjTTQ5ak9RZWxxb2ZPYzM4K2I5QWxwMFpCaDM2RVR0TStIZ3FV?=
 =?utf-8?B?c3RkcVJSRHhnWU1zSU5IMGdPQ2pKNit5Yi9paXlIRkNaVHV6dlhzWmdXUENk?=
 =?utf-8?B?YXBDUXZ1R2RSUWdITjJJUVVFQ1NBeDVYMVZKQ2xRMGlNMVFXalgyaFJMdlhB?=
 =?utf-8?B?YmZMSlNYeHJlTVd5ci8yK1dkZ2VXWlJUU0JZQTVwZ0k0VVhUc3NodGxSYzlj?=
 =?utf-8?B?NkhrRmlWbjRqWWRUeWZXS0JBTlYwSXdqSFJKWktZV2JCOGhtaTA5VUt5OUNC?=
 =?utf-8?B?dE5ZNXFLU3MrUTlBVVpoeDFUK1pyc3BRczU5UEROcEVpSE4yV1VRUmtkM3Zx?=
 =?utf-8?B?b3VFaFZ6VVk5TGZZSi9MN2pYVlgySHhsS2FweTg1RTBnN1lJUVJmYW9JZkF2?=
 =?utf-8?B?SWMxa2VnRmJUMVp4TXZ1MTFIeFFjRlZmZ2xrcHJlby83OGJQR0RBWEllejky?=
 =?utf-8?B?NldzRXE1SEJqaHVKU0JFUURLT2xHZzBlZnh4Q2U0TmhvbklTdE5HT3RZNVln?=
 =?utf-8?B?V2NKWHdOZm5IQXRHNWthTC8yQWZGcmRCTExPd1VjZWxoZ1FaNEZHc1BOcXR5?=
 =?utf-8?B?MW5Bb3BxVzErV2hhNTlNVitHa3NZdy9WeGMxV1lncHRPQm1qR3FBMVMvZ25o?=
 =?utf-8?B?UEVncytSd1l5dktxbEcwLzU4ZXpoSit1djdFM3Fpanlia01iUmJJM1k5WG1O?=
 =?utf-8?B?ZDZVcmlnM2RtWDRTaXhrb05RczFNL3E4aFRMTmJ0NE9XekZMQjV4VWtxV2Uv?=
 =?utf-8?B?L2o5ejIwaGphWXhMb3IyV1diL05EWVFvTTYwbzg4eHRneEZyRFF2aWN2ZVNX?=
 =?utf-8?B?akE3OTA3dUdBekw5UHlkSXpadHIybytOYko5UklWK1E5eDVGa2tVK0tCSU5p?=
 =?utf-8?B?RGJoUUVNcDZGWlUvTU1uYWw4MEZFM3MzbHY4TjdzWmpGeVh0eFF2SGt1cDZ1?=
 =?utf-8?B?TThZdTI0WkpZUFhqaWNSSm9CSEF0M0VrcHFZQ2ZCS2NoeGVlQjhoRGMrTi9y?=
 =?utf-8?B?UllROHRyWlQxcDRYQW1OUTBUcDFaMFI1TEhlV1FqYUFDWFZjZkxmaTZZQkJu?=
 =?utf-8?B?Z0NjUHlKbmc1aUtrL1MwMFdDM0VmS2psRkdPcXQ1ZlQ1SWwyRzAxbWtTVGNv?=
 =?utf-8?B?ZUdGZ2xjT2pET1lYMTh5TXhtOFEwY1NWa1RVczJVRUM5SVp1MCtzZWFBc09l?=
 =?utf-8?B?aUU2WFBWM01hTS9BWTZ6T3dVMW82cGM0RFhKbHRLK0o2am5JRFJHZWt5WWdw?=
 =?utf-8?B?SXZtU040MWFLdkFsQnVPbjlQZFVyNWp4QVVxaUN5MUlsc2R4d2FxUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a25c299-b93e-4daf-2bd1-08defd86536d
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 00:10:50.2451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: spynzvM5sCXU+V7qSTgMnbGKOrXRucOfKgzuLAFqrCiy9uG84QpwcJOXFYw6Oot8AsQio/Gb/Lr9uEmC1rTAgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9668

On 8/18/26 2:23 PM, Gary Guo wrote:
> On Tue Aug 18, 2026 at 9:44 PM BST, Miguel Ojeda wrote:
>> On Tue, Aug 18, 2026 at 5:23 PM Yury Norov <ynorov@nvidia.com> wrote:
>>>
>>> Make every Rust KUnit test suite require the Kconfig option that controls
>>> it, and let the `kunit_tests` macro apply the corresponding `#[cfg]`
>>> attribute.
>>
>> If we are sure we always want at least one `cfg` guarding them, then
>> yeah, this makes sense (we could ask to write the `cfg` bit inside,
>> for "greppability", and for clarity / less ambiguity later on).
>>
>> David: are there cases on KUnit where you would recommend/prefer
>> something different?
>>
>> For instance, I could imagine a Rust `mod` for testing purposes
>> already gated by a `cfg` that is meant to contain many tests, and then
>> different suites inside that for control (possibly with extra `cfg`s,
>> but maybe none too for some).
> 
> There might also be cases where we want some other conditional (like combination
> of cfgs) to gate.
> 
> I am okay with gating existing ones under new cfgs, but requiring one in macro
> invocation itself sounds bit excessive, and also doesn't look nice :)
> 
> If we decide on actually requiring one, a better option might me for me to
> implement a lint in klint to produce a warning that is suppressable if people
> actually don't want to use cfgs.
> 
In addition to KUnit, there is also a hardware-dependent IRQ test [1], that
is normally configured to be skipped. Unless we decide, during review, that
this kind of test is a Bad Idea.

This is likely independent of the KUnit selections, but I want us to just
be aware of it in case it influences things here.

[1] https://lore.kernel.org/20260808031120.363869-10-jhubbard@nvidia.com

thanks,
-- 
John Hubbard

