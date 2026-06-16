Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021110.outbound.protection.outlook.com [52.101.100.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C039C26B0A9;
	Tue, 16 Jun 2026 15:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781623497; cv=fail; b=gxMqf1MSmRGKrvuxdZJo+jR7Sp95+qUuauFQtVT4DdgtXKBdfW/v7pesbhglrUEYok+hjM2lLgH/CnzKgaxQm6q4wbtoyyVL1FFRMT2Out4Qori8uPqdDaFX0TjYVMOAMDCjfUj9z6da1Ed1Aq0966YzauruP8LElWAl35jKXmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781623497; c=relaxed/simple;
	bh=jd1u9yTGxGAUaeHHy26+drqQBFfuQ4teeyiCkUoUMlQ=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=EcMOMZJzNjCPeBDSDJli4CwrAOa97ovHzFNYUBWxgihcRyPawqKzXKOH1slUGonrEKJiXQOjh9IMwa2f75DeyWxPVLBY97YcgWfKyzZ3lD925Q3D8/EW0Y40+PSryEZKajst93IuSDnZEk3mxK2YIeXLfZBO4JGVj+j2/nUN3XI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=MTigKqdY; arc=fail smtp.client-ip=52.101.100.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="MTigKqdY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x7O+7zGHDInBdARlNzhiNM8LR6fkyzN/azQ+dCIIgrBDns67KPZlZTnKVV8i6KXNpHT0BE8tUQqVTptxJPwBanb8xXy4EVURkDicLNLPC5WwxpxlpOfT4CmJkUCPcfY9w+eHooFguGjZT/wBu4c5u3X7B9y8BBDsBhs1cRpIml8MiHiZfGOy3KH5CjyjXdIqBTYKq0ibnX1lZkWEWPFxAnp9Mhvo8qQXYFZKryObWKdQOZfXGaTbJApPniWt9GwFc62ZLVLpS3t4xeM2S0kth9OQXX27Za2HWs4lhrh+iOeNOQ/Frrjj7y6Oi1mixpwOJ6x7SNTiYcYhuEnYtqEWaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJMTgBSnAhuRIMG5e8ysCtHCh5OQ9LpPYbf3kkDA4zM=;
 b=QmgVTL2lT5OVB7Wskju9i6cKBg9PX+nKk8vZmytPurAV9n1PdYlTfAw5urnrZ07JLgvFsnFuyvArGZ5Bx8RixWpqpReFm9F62HbzV9umTtZxv94dtUntjHvh+t+1Pc/N19MYW2Q5rPYwAQ2q1vWgNreKdRIrEOKwnPSv7VYY4RGTxYyA+lDLtkcduKOyZ7X37z+NGKBiZ1s8lfgh04n/zTDVRn7DfOMYbQJd6i4qS/nDVwp66u7JdDaFXYajOZSdpPUrM506SoWI9QuRmfb0y9dQgTapy+7AmNa6shRRfsvzX5LaobiR4HxF7945z64o8pLOzhEhHkr5xJklYYbLbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJMTgBSnAhuRIMG5e8ysCtHCh5OQ9LpPYbf3kkDA4zM=;
 b=MTigKqdYBWtm6qEtKLflsrQDq2iaI5XV/dEz+/1i11DBIkbvuu6g81tVzeMRnEMEgZVHI5Rcbam0vsPdmnoSsF3yQ0BXebESdbhULoJKLr69vUPPPlRXR2UvS1qp+pi3QX6rbY68zYE1M8IlzSBf/9iZhGVOEaH7snAHuYijB/c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB2878.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:17c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 15:24:52 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 15:24:52 +0000
From: Gary Guo <gary@garyguo.net>
Subject: [PATCH 0/3] rust: doctest: unify with other kunit tests
Date: Tue, 16 Jun 2026 16:24:48 +0100
Message-Id: <20260616-kunit-v1-0-b191604a8d6b@garyguo.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMBqMWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDM0Mz3ezSvMwSXWMTizSjZAMjyyTDVCWg2oKi1LTMCrA50bEQfnFpUlZ
 qcglIs1JtLQBTfxOBaQAAAA==
X-Change-ID: 20260616-kunit-348f2c029b1e
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781623491; l=1478;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=jd1u9yTGxGAUaeHHy26+drqQBFfuQ4teeyiCkUoUMlQ=;
 b=ciSuq5eb8LQVa9lNmnagvswWxE9f5i/hFgt3YYD7WO52rfGQfAOcSSriunMp0HONR2fOQaItR
 FAFxT7hm/h6Cibtuwp3SRy8ePMjxQrG24rnUDadS10x/EUCrhxI2WED
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P265CA0280.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::17) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB2878:EE_
X-MS-Office365-Filtering-Correlation-Id: ca56d22b-1e9e-4b1e-8cb6-08decbbb697a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|10070799003|921020|56012099006|5023799004|3023799007|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Ijz/xuaddrmjyMtyi7SfFUdXtGAPuE9ZxrKso7UYKPZiHAIZTdFSrwu35AFnyI1rI+nBO07oKjjHpkFTBCbC+4IbqaRh2iB4Y9f+5iykybPYb2u2MQoanwLYG5mOQ5AKqG7sjBMMglI4s/SYYQb6Vr2UWxm5DTLN5zvG8xnnHkfKA+FvESbPrbfz56uf1EPfHm0ZpMr/oZ9WwbfWiQWtLe3wvT6IKbcliMwlqq7xZBCFtoQJycSg5GdvPs9KHqa5C5vpqViI2dAQahkEug41CsHbHvOM5/xgJRdRyBk9NNaape+yPOZjiDnnopnTDv/mYaTphEjfaXjN2sSsBaso9Y98OBZl0JyDx80qL7rKKDrtQnN4G24Cv779icU1NaL3jrWe74fh/0UbJCU+J8CiGhxEwXd5accOMnuviiBHOmXnDJgSQ2pqmnsYWfCZqexbTFtY5FECUhMkv/0z7VCihbBoLFunPUSoWMwut+ZsQMzPLPFfcilQ9FKUWk4QUF932TFmzBzbTO/hkXT7/McckanWgoSCiDcV2FuG2WMk9kSTo9UXORTiguhpjVVC61fYQ8Tl8HWqSRH7TGpaDlAQm1yu8Kd7nJ9vBnDXGvbl7gjqbW+sMmtSKlbsZbPW58dCS9ziQsVGb1eRrV35yibwowHshH/WXcMrrTerp5M1lmHwLmFGBuEByUAM2sFA5oevRroYQbTz37DyAlsVj0oAZo7yvrjJBOBCVUJSU9KyMCo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(10070799003)(921020)(56012099006)(5023799004)(3023799007)(6133799003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTQ4RExjUTA3T2VBZVZJNGVjeENleWhsek1iZGpPRW15MTB0NUJmeDFTQSsw?=
 =?utf-8?B?eUFsc2dnOHc5VFd0RkM2ZHRKaUVtMVc0cldmYkRURTZKWXUxWlRVNnJ3OStJ?=
 =?utf-8?B?SXFGQTNHK3FGYy9jYVU4YkFoNWIrTWJsdS9BT1JhTGpCaVBjWUx4YU8rWGxE?=
 =?utf-8?B?RjhxQU1mWVJaSFNuY3A0U3ExYVFVOG8xQjd3dUJCOHNhUVpuelZBMHNoamli?=
 =?utf-8?B?RDVUTkJwVS91MUxhd0NNZU96Z1d2Z1E3SFN3SXd6L3ZpU3liWmw5V3YxUnZh?=
 =?utf-8?B?UVpXWHIzdlFCRVgvRm4ycHhoNFpyZFhTbnd1R3QvSFBoeFptZ1Bsei9oTU43?=
 =?utf-8?B?MVdVOEFoYVBjUU8zeWtCVXdNaEkveWUrR3p0WmFWUVQ3emU0Sk1QTFUvRlVm?=
 =?utf-8?B?NmErUjlEQ3BJdU5WSmRSbDRpTzZqZzFQOXBVWVBzRExXWnBuSWtDclRSaHNp?=
 =?utf-8?B?VXVxREhTdFkrYVlXYU5FRlFoeVUrKzUxNkRRcG9wNUtyLzFhaStVU2hQQ0U0?=
 =?utf-8?B?THRtcGF5dmJtOWJTRVpPNEFpVlFpcGhZRG1OYnd1NFdUWnpPaXd0RFFERktk?=
 =?utf-8?B?b2V4MkNBSG44bm9rTk5mWjM4M0FZbGgyNWlCdnMrUjBkY3dSTUdxZjNLL1pq?=
 =?utf-8?B?bXlTeDBOelpSbklFMTRwVlBhdEd2N3d0a2JxQldtbDVvSms0OWVFMVZRS21v?=
 =?utf-8?B?L0ZOQm56WkpFVFl3S2txcjlLaWFpZlo2NGRxUFV0TUtUV1FxRkFycXF6VFhp?=
 =?utf-8?B?bWJxYjVlTTE1L3ZaV0FrdldqaWJEVjI2M1c1TUY0VTk1OWJQSDBwMTcyRGdU?=
 =?utf-8?B?Y3BhSGpOc0E5ekVqRDBOektqN095U0NBR3ZJM1ZUVkc0enlZMEFRakdwblVt?=
 =?utf-8?B?KzRob3RBYXE4UDkxd2xLSXlkNkN6M1VDMTUzbUUxU2pobUxFQVpDcXhRcUw0?=
 =?utf-8?B?d0pLOHhmOVN5ZVh3VnY0ZVBnZitpMDJ5anl3ZXRlZlFqSGhnSHlvYUkzbFFl?=
 =?utf-8?B?YnRzMUxUU1pKZzVMaTBrbllZY0xGMG5ZWU10VExoZnB2aGZDVDRabldYVDYz?=
 =?utf-8?B?MzJwcDZYV3o5UmFKSXRNb0h4TWtuTDJ6b2FGYVMzK3VwNjU4S0RKcjU0MXAx?=
 =?utf-8?B?aWFtRE1XYTczdzJuWXdUNURjYXdoNk1xN0xlc2diaWNIQTgwS2IzMUZTd244?=
 =?utf-8?B?VEZBTTZMR2pzUHZEajZhKzF3TlNUWVRIMys1c0U2KzNIMGFGT3h1MHR5czJp?=
 =?utf-8?B?MERHTFFEWitNNHBYMTRBaFRrT1pOWGdQQ0F1TlBhOGtEWW1oK1FLemVYc2Nx?=
 =?utf-8?B?MDd0eElOUklMSGhkV1RaWDhNMHJLejRqK29jSitGNFlQVG5Ra0ZETlhmTFo0?=
 =?utf-8?B?SXhYMm1jS3Yza2cySnFzQzJIZ2FUM2hSMDlTRFZBMjIrZ3dkWnN1WThsbmVK?=
 =?utf-8?B?RnpUK2p1eVdUTUlnQndOdVkyNlpQNElGMzRjeklrN2krejBDVHhORzUydmRz?=
 =?utf-8?B?dHRuSEF4dzlRWHJXelVGVitGMUc4Z2R5dVJNRWdnVUdFK0I4WTYybG4wSXNW?=
 =?utf-8?B?cllsOC81ZWF0VmYvVDQ3Wm9nSlhnVmVYbnd4V0pkbmtXR2VDZFhISmRKVHlo?=
 =?utf-8?B?NVJQdXh6MVprcGlaL0t1Tk5ZaG1TSnA5Q1JFRkFuWDBOWjM5WUtpWUZ6LytO?=
 =?utf-8?B?OFlrdnRhZWEzMkdQOEJuQWt6NFBzaDUrN2xkamg2aE02dDFTcmJvUmcrSlVm?=
 =?utf-8?B?NTM2Slg1SGJmMlhLMHo5ZDhNclBBV3VSa2hUTjZtdnpvbCtjOFZSSHdFTDFj?=
 =?utf-8?B?dWFIYXdRNkZaYVNjeDZXa0hVKyt6VlJQTlFuYTB1NXlsVno4VVF3d29kS04r?=
 =?utf-8?B?TFRXVGN0RHUxVXE3MXlQOFRJV1Rwd3hHNVh6TkZBMWFqKzRQQzNsRlU1d0tU?=
 =?utf-8?B?Tm1TT1hPTkcwazhKU3hiWlROQUErOElta1VKbldBOXE1VzVBSWFEYlZVeHlX?=
 =?utf-8?B?Rlo4d3VpR2JHajA4bXk4TG14ZkdDcklyWmJMZ3JxMlFJY0JrUmlaUjg0bFJN?=
 =?utf-8?B?c25MbXNDUFFuYWk2dHVqVVBpRlRHMHhJeHo2SUNvZURqbjhJZFlNRW9QZHI1?=
 =?utf-8?B?TW9ZQnJvVlZ4Yi9sS3cyNldGbTIxUEVOWHVKdUI4ams4Y1VYemU3YUl2a2ls?=
 =?utf-8?B?ZExBRFdTSnN5VWV3QlhVOTVFV2V3ZzJWczRZUnk4N1NMdG9PMjRqSlNqVmxp?=
 =?utf-8?B?WlFWUTREbFNUcHU2Y00yQWllNGs0Z3FLbU1UcWMwc2NJcDBhQmVQUXRuK0Ez?=
 =?utf-8?B?Z1lEbHVJOTNWNldrYnN1YkVnVSszZTVVakRZcFVCWEdxZisxcDBIdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ca56d22b-1e9e-4b1e-8cb6-08decbbb697a
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 15:24:52.3051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wvSsYVIWXmNqE+TQD+VNUCF2d573mBAvsii7FhpZNWLZfgkfqBELKk42IqYYJPK6VgVLNiY58U/DTRqZOdpv5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB2878

Currently in Rust, kunit tests are handled with `kunit_tests`, while the
doctests generate a lot `extern "C"` functions and invoke them through a
generated C wrapper.

This is currently needed because of the special treatment of file name and
line numbers from doctests. Convert them to override `file!()` and
`line!()` macro instead, and use them inside `kunit_assert!`.

With this it is possible to just generate `#[kunit_tests]` and `#[test]`
for doctests.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
Gary Guo (3):
      rust: kunit: use `file!()` inside `kunit_assert!`
      rust: kunit: use `line!()` inside `kunit_assert!`
      rust: doctest: generate Rust kunit test suites

 Documentation/rust/general-information.rst |  4 +-
 init/Kconfig                               |  3 --
 rust/Makefile                              |  4 +-
 rust/kernel/device_id.rs                   |  2 +-
 rust/kernel/kunit.rs                       | 11 +++--
 rust/kernel/str.rs                         |  2 +-
 rust/macros/helpers.rs                     | 16 -------
 rust/macros/kunit.rs                       |  5 +-
 rust/macros/lib.rs                         |  5 --
 scripts/rustdoc_test_gen.rs                | 73 ++++++++----------------------
 10 files changed, 31 insertions(+), 94 deletions(-)
---
base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
change-id: 20260616-kunit-348f2c029b1e

Best regards,
--  
Gary Guo <gary@garyguo.net>

