Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012012.outbound.protection.outlook.com [40.107.200.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4D91F63D9;
	Tue, 18 Aug 2026 22:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787093799; cv=fail; b=Ei0aDDj0BLHEhzwwjNl/LruRgtYenzf30B7gIgG8YFiIoGvKE+N8HKkUNzf8l8oqeNNK9X6iJvguxkTpEDLT1XZoEwBUwme7ebs5E3Y7Gnqe4j+I70EOCWegQq0aCwvErIV+vrT4w/8wOPHyu5EgoTm7bebhsfcBDCjEmFfvSe8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787093799; c=relaxed/simple;
	bh=8ylO6PbygEnWd3ZvllJJLD442TwmoeI/KhVMrfFwapI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ESh+cP2xGQIyOt4+jCHe8pPPtvwvMbHt7TjZw6uqXgrlsMDIMHGVj/hpXIhHTIW+KxRyW0EdBGcG89S+IfGfrUYfTvMNPVh8t2rGLJFKVg3ND16bt4nmAMkU29p2l4F9VrlkiIAaLTiRJ/AIFHS5t95KbF/Oi4SlX3F32iXeHkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tCkzfMbu; arc=fail smtp.client-ip=40.107.200.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tCkzfMbu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IYjpKrNj/KcSauL/h9NTz+U1k9JLirDTy5S373C5sKbsv0mPyHrNVowE0DzFfinHvyfTUPAuKUfpAnTQ9H8j03Ae7YmX7+kvOW3UYXCoBEKf4aJPlCA4q/kRjZl8r2Yexw2GFjzKTy83vHUFuauTFiu2BgSKEsHcTsWZK0Xco1/AjRVJBbaNaBU4OsRSk+/fV57Z9c8UK4mYKkVHYKlwaw4fxKqxAwLwGmVrhAu9rlX2Biw7qZU9ZeE5P94nmcfdjjPraFjxYIpyPdRk3l+hEQclkTrD5DCJ0VnPIiN4cxsvHZDoUzvxxy5EmMvphCyJh14h7cBq1v0gD5YLy7VM+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Krw5ZOrf7qasK5c/9szd3FczGf7BCDssAFIiAZ1bn4A=;
 b=mE8rjPviV7I9BSFtFM8zwIsdm970PW3pOC3F8MDjBL8kQ5HGzSMphbJpPz+rNKe1GDIKkfL+H5p3Hl4iZWkyO+f8GRfkjM9TeuDY9M2cEQvUenzqPKMc2WfobguQadwidAcMgnwxCmwUs2vu+FELhp2TTsuLboNCH4GuBoBEK6CTZWndWV4q4yN11lToOvTe2yE+IMPZIszQmL17JCwW0z3vq0tnZGjeRc7xwaqLvjM3+oDiVA1aePAVZg6JuRTUTmvU5thDw4gm9Usyps0F9f+BYH9UPyxAEakGgvVObz3zp+cwx+VVsCtiYviJhnvjEAjLwk1nBgv7qzOiTlDzMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Krw5ZOrf7qasK5c/9szd3FczGf7BCDssAFIiAZ1bn4A=;
 b=tCkzfMbuC3Yu+whpgptXacktHExZvJFs/4oIslwwhORZr16gAhedeA4ZxiS6MXW3sii0feXT4TQuwr3hUeVEVHhvrd0qvyR+6Zzp4DaXQVJz/0zwjIVI1CMnfQX2mQFtxi95sjJXtjdP1eCWA5GJ4tzQoEo/XFLxNGU2/UWo+y1zTLhxj3qjPYHyFfrM6gQ6plUTXIWO8jQJuh5tObhLSE1TMkNo6DNq6nnqzjgEqKF/xSG4Sz07+9tuOlNkFcddi50VRXUJMUnYZjW/6Q9BldfE/Oj4tRiIrjj49n/WJArSC5vZvH+U3Utj93ddvn/iLWtUqFkj7M3rbxowfKaNuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by CY8PR12MB7099.namprd12.prod.outlook.com (2603:10b6:930:61::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 22:56:33 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 22:56:33 +0000
Date: Tue, 18 Aug 2026 18:56:30 -0400
From: Yury Norov <ynorov@nvidia.com>
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	David Gow <david@davidgow.net>, Miguel Ojeda <ojeda@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev,
	John Hubbard <jhubbard@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Burak Emir <burak.emir@gmail.com>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Rae Moar <raemoar63@gmail.com>, Yury Norov <yury.norov@gmail.com>,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] rust: kunit: enforce test configurability
Message-ID: <aoTjHtiSHJAuDQ7B@yury>
References: <20260818152324.587932-1-ynorov@nvidia.com>
 <CANiq72m2M5Csh_9qQYa8MRmJZtciU3d4S3ht5FG-K+YwR4iAwQ@mail.gmail.com>
 <DKSDWO1NQKF3.25QCXPPUM27J4@garyguo.net>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DKSDWO1NQKF3.25QCXPPUM27J4@garyguo.net>
X-ClientProxiedBy: SJ0PR13CA0227.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::22) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|CY8PR12MB7099:EE_
X-MS-Office365-Filtering-Correlation-Id: 78b6dcb0-d7f7-49ca-4080-08defd7bf306
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wk9hAdEDjRIgmQcE0WAuJSWma4muCLxt2EwBnCpLDgSvzBEKgFuf5msP2wENe7toEB7IcyVTFwXX+VaTNpx7GfTap3gRmGmokqnDT2Q+M+W8PeoYQ8NJbwW5AwpIbdvkKYrQxg0ZLVevn6CvRqxYbO4JEHviYDNEZI7o8lOdD/zNwm4K5EiKMpgjU8Mwehd4PwanU/k4XadwH2a55ksbWi+7+abb3awQLVBCMBiu4LVzEnK5DATpqdheTHukGXlPRpGf2a5tWn9YHkbAHupUM392d7WXotTNFXYlCnGdt4x/Uo9iafdeR2MwlYfgUdX+d2cTtUi3DpuwmLz7t1LjIWHx2TQgb6rxfJr30uZkeXLI39bOmQZrfsgc2Ea5YM2ySQuyM+JNQ0jClIgJIgWFC+mTkshT756mwP/0B5yGfEVPE2KmtaIR9etdZrmLwdznqQNJA727ipQhGfl3+kXv8zmQYrS9iZ6tS39FL6F9C601oMnVfnA3a75eX8f0WNYYlPrX9/nZ1nKzlRwt7Jutm9M8GI2vBYOESp6UlrRC1iWdsLTFjyS5M+DZ2/DCZwW9Zaq9imQb4lCz4JRNbcMOu17MZ0qbilbhF9hSgmJSbG7HBV6o45MNtgiyskMjrllxLZwPrVnEhQYejfo7GU0SDLpaHF1rlePGg4l5OJZN+0A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUxEK1A4NlN1TmlURDhsVmlwT2l1TFkyR0ZnOS96VE8ranhlTldYcGZZdnFQ?=
 =?utf-8?B?Y1FodGxTQTgyNlBnTFJ2RVB4YjMvbHowdTIwU3kvNjIrUzZuS1VocTNSUVF2?=
 =?utf-8?B?MTArTyttV05jN2tpbWZjQ3JxZlNVTlJaeUV4eVo5alRWY0EwcDI0VjlMM1NC?=
 =?utf-8?B?OUJmbmlZb0lreUc3Zk9MOEtnYSs5VjJHeVNxaHM5anNTS3h0czZ1ZitlYWlN?=
 =?utf-8?B?M3ZVUG5ENW5KRnpTblY4TkNOY2xWVFVXNmdQd0t1N1p4WGIyaWFUWkRkSnhh?=
 =?utf-8?B?ekJ0bDRkdCt3Njh1ek5weTZ1M0dESVVRWGpQckJ4VGl1TWkyRHoySHR6N1M5?=
 =?utf-8?B?cmhJd0NvRGVEMXpwcGE4ek5meDNnZWJ0TmVsNkZ5dWpUNjNrYWwweWtTZFBQ?=
 =?utf-8?B?aVMrR0J5ZktKNjNNd1VXQXg2YTRLc0hYemZVanI5L2t1SkJZQzVsV2xneEY2?=
 =?utf-8?B?OWJLek8vOEdEWGF3TzdkcDdwS0hlQ0Q5Zk9BbFFCVjdrQnpENEFxa2h1UVBG?=
 =?utf-8?B?ZXJtMWRTTFRMMzdCT3JVdTh6QWRNeG9FbXJpZW5oQzUwR2F0Y01jNldORlZ6?=
 =?utf-8?B?KzZXQlRhSGM1TkJYWUhxd0RocEpxM1lzYldXODFJcTVCbDZRUlc4ZGtpWkw5?=
 =?utf-8?B?ODBKbGZia0dvMGlRcWJIQ3Jjb2s0QWZmbWdSbVd0NzhCRWVaaE45VzlpZFZD?=
 =?utf-8?B?SVF4WmpqRTloVjhzY0hWVGtHTzJITVI3c1JxN1dFcVNTUXR0REh4eHRVM2NZ?=
 =?utf-8?B?SFJrc0RBZUZFTjM3MGdjbGlGcDhkWTVlb3lheTE4SFNWU3ZhM1kzaXV3b2R4?=
 =?utf-8?B?WE0vVG9sUVJzU2orUlRXM0RYVE1YeDlFdVR6YlhVKzFmM0lhRHVlclQ4R1Fa?=
 =?utf-8?B?eEZkQlp1ck5sSjhyVnNSTVNEcjNMcitIMWtabTQzYmUyeGhBU09xN2ZqTHNX?=
 =?utf-8?B?NXpqRWJLSTZBUjdTdDFaMG5PaUU4RXpBQW1wRVdTcG9JU3lYT1d6ZndLNDlH?=
 =?utf-8?B?K05VYWpSOXlIOFlqRmdmZjF1OFhlTDFyVWxvVGhhS2hZKy9hOEw3V1I3RWVX?=
 =?utf-8?B?Zy9ZOWdsVGZPdzE4TTVIekR6VGl5QTVDSmdHeGZSdW5rUzNTY3JRODhPVlZi?=
 =?utf-8?B?TkNkbUwyZjMya1hMMkJ0dHZtS0p5Qk5vZ0ZtSFBleXZ1UUVIM1Y2aDBtN0pz?=
 =?utf-8?B?eVl6Sm0rUGdadjRmSHduOG5ITS9Hb0lPRklyb1lwSEVadm0rWGRNTlJzcnc1?=
 =?utf-8?B?ZDUyd0ZIKytzTW9USVNXQ2o5ZU5RcTRKTysvK3hUQTZPd0xFeW0xa1haam1N?=
 =?utf-8?B?K001ZFpNNGYzVnZSWml6OG9vNVVWdmMrdTVuQno2clNKdHFZa29zVXpmaFgw?=
 =?utf-8?B?QUg4dFUvTk5UbWJNTHFlMW1NRUwxVUxJOHVSZk9EUTl4TzZTTXppR0s5UG95?=
 =?utf-8?B?bFhFSUY4N1F1L01kZTBRWEJpVU5wd1gybWpKcDdqckVrdDNkZG9uV29sejhx?=
 =?utf-8?B?WVcxMHoyc1ZrWnNINER0Ymp3VklPZWd5c3JhSlptZlhicWl2aVZ5amFqWVFS?=
 =?utf-8?B?cXZ1aDM2OFU5cm1udFVvRkNWeDhMdTl0NFozTGsxeEk2ZU1iT25MNXh4SFRU?=
 =?utf-8?B?TVJPN2NsQUMrZXp2T2hjMDloSm9BeUJWbTl4akExQkRCUzFEd0RsWXBuTEFr?=
 =?utf-8?B?YWhVcmFkQUlMT1RiWmlmZlUvZG5wajE2T0JQTm1HU3NrK0NNTk5ybm8yajdS?=
 =?utf-8?B?TGhCMCtnc0VZNmpVY3M3OUYybGljUDVoVisrYWpxUTJ4QzVtOXJnZDdpWUwv?=
 =?utf-8?B?RXgrMktLUmJoSXBQQzVJdVhseW1EaFNaY2ZqeVlKS3Jma0lQTEc0SHoxMDhk?=
 =?utf-8?B?OTVQZVFTSlBPaFZaNGpzbi84ZFlhNnlVeVZHRWN2OWpNdUtiVWptWGViSmx4?=
 =?utf-8?B?TVRxLzl3akJFbURMUTZaektBR3RtdVFZUEhaanRTajdZOElQU1pIMDRhVnFR?=
 =?utf-8?B?Uys1Qk9QUVZoRzVwU1V4bU5oQUVtRlUveDlzK21yc2FiOFhoTDd5WW0zTjdF?=
 =?utf-8?B?KzdSSGV4MVhuUFNEbXdKU3ZkWGMwbzVNdy9iQ01mbHhZTjRvdXlzay85UVBN?=
 =?utf-8?B?WUN0VXJWK2JsSmxmVmpvS3RuZjNRaVBhMFYyNnZsdkNqOGFhakZiYlRHQXpT?=
 =?utf-8?B?c3MvbGUwV1ZsaVBQb1FVSzdPdk5sb3E4TnJHOHg1b3hFMVhhZ1pwRkdKaFZN?=
 =?utf-8?B?VDJRRm0wdzdlMHRIWC9RekNKOUVvekY4eUtTak5nMU1WTnBaOFY2ZUxTMEc5?=
 =?utf-8?B?WEtoemZEVHVLekFmYlI1OGlrdS8vbnBJQUVSbzBvWEZVZHhJejNUQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78b6dcb0-d7f7-49ca-4080-08defd7bf306
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 22:56:33.5185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hZreN9qHuEw3KZ+YhN/mG1zuBi/a0CFNIi/aSisdKGklced+VbEtcOSAqFKFhYKvFluMqhXnNGm2+Fg6EHrh/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7099

On Tue, Aug 18, 2026 at 10:23:51PM +0100, Gary Guo wrote:
> On Tue Aug 18, 2026 at 9:44 PM BST, Miguel Ojeda wrote:
> > On Tue, Aug 18, 2026 at 5:23 PM Yury Norov <ynorov@nvidia.com> wrote:
> >>
> >> Make every Rust KUnit test suite require the Kconfig option that controls
> >> it, and let the `kunit_tests` macro apply the corresponding `#[cfg]`
> >> attribute.
> >
> > If we are sure we always want at least one `cfg` guarding them, then
> > yeah, this makes sense (we could ask to write the `cfg` bit inside,
> > for "greppability", and for clarity / less ambiguity later on).
> >
> > David: are there cases on KUnit where you would recommend/prefer
> > something different?
> >
> > For instance, I could imagine a Rust `mod` for testing purposes
> > already gated by a `cfg` that is meant to contain many tests, and then
> > different suites inside that for control (possibly with extra `cfg`s,
> > but maybe none too for some).
> 
> There might also be cases where we want some other conditional (like combination
> of cfgs) to gate.
 
But not a single current case. All the current tests are flat and
simple: every test has it's unique gate config. Do we need a more
complicated scheme? I doubt that.

If there's a simple case of CONFIG_A && CONFIG_B, one can stack them up:

        #[cfg(CONFIG_THIS)]
        #[kunit_tests(rust_kernel_bitmap, CONFIG_THAT)]

If there's something more complicated... Let's wait for at least one
real test like that, and not speculate on non-existing cases.

> I am okay with gating existing ones under new cfgs, but requiring one in macro
> invocation itself sounds bit excessive, and also doesn't look nice :)

This series begins with "enforce", so it's not about being nice. The
generic kernel tries to save every single bit of memory and nanosecond
of runtime. That's a secret of Linux success IMO.

In the mother kernel every single test, performance benchmark or even
extra functionality is configurable, so that non-developer users don't
pay for the functionality they don't need. In Rust, before e74b7a3f5a
there was no way to throw the tests out. And even after that, we still
have such tests.

Let's stop being nice and make this bad habit explicitly impossible.

> If we decide on actually requiring one, a better option might me for me to
> implement a lint in klint to produce a warning that is suppressable if people
> actually don't want to use cfgs.

This is not a coding style, it's a factual error. So it should be
caught at compile time as an explicit error.

Thanks,
Yury
