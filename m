Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021138.outbound.protection.outlook.com [52.101.95.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1911414A20;
	Wed,  2 Sep 2026 22:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788386427; cv=fail; b=esFRwP9udVGwmujWBlbtKgBDtx8KUCetr0hL6vELaIt2ajtYuDoX62+L+8QnfjZ9Q8ixPENS22k9jOhbiVMH1bm2n0Xw10dLhoJfGB0YY4+DnJl8jqdeZ1BWgKed/39GfdWDhXW65BUohZu0KUCTmUco0h5gzeXbgxUP0+qJ6D4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788386427; c=relaxed/simple;
	bh=2+/ggteeas075zl32/nEnzcgByAYX78M9TkqQBm9Qfw=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=VEwaN/M+42Lu892cmX144f3VOrUIDH3dCmnexOe/SY3La7+UXXBcAAyP8M7JmdZ+vwW4l8Dh1oqFiS6xBbaMm841ecOkZdeQjjtcN4yIy4woGEA2YYGfF72zdrRBYCu2jhHItgh+lVCdALJPt+uiCWsHpK2xyHlDc5IcrmIc/C4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Kt/yBZct; arc=fail smtp.client-ip=52.101.95.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Kt/yBZct"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x/b6YG+ILTVRfavds/aLB6cnqYOwqT0/UKtvoFiEqN10dI1uqrTOZ/5t92pE9nKIKsbIpUDsmK3lvtZb7o2fkAkOTO3kLGk7w66wQiY0Q+cKsD5xyYSIl3Md9Nwy6ZizVYWhoBWvx28vadaEdK9bhDf21sHunhMbhDwRIZ2QIG3ajHXdgcuOqEflqSWjA8Fc7yFOTjrJRvIg8o95BcTz5jB/wYz5phf+Uv2wL9hYnWd6BRHPhyeWGb9wSsT8/USErpOvAS2OVNTy0ReOuK40HgUpdfGimFrCWBpQWojAfNaPkAmhiRpNN22ZmllsBzj+xtlD5VRNGeLudFP/MDCktA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=leN8RWTHN6C4FdBoAMGadDCBNHxAwgUOT1A3AFe7cGA=;
 b=IlupRm1NW/++vL23Pns6VxR0NTInRQppYjqXjZEk5Tdwvja2qY2A8OJe8o/VXJoK7Z4nX5MY1j/Ov+vXT1pxKX9nkoBKDKPu3cn8gUTleqNKjhLhI5jlbfVh0Fy2l1nxhDuDw73LViaWKeaoOgLdhkpGH5mhEFvHWbyQ4D3E5fsOH3ipGHvAziWflnE1fbF6qMHhUnWAlMJoTZvLz6Ra0AfBVbwyYfECU/sIbinNU2Ci90176FGafu+vSaaUV5WQvH6tKewbD7dH8cnhkVPt6RCrknz99bkLbdxd2ghRcB7XaAjoeirP12J5rekDeT4NxHNITaYJy2j3chH8sx9pkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=leN8RWTHN6C4FdBoAMGadDCBNHxAwgUOT1A3AFe7cGA=;
 b=Kt/yBZct6kGR5c8EhMoJ+uOPenp7ck8HDFiQxGiLT5cKYEeGPFGaxQwWSrb9BAQrS2RFCek9F68OK847WVRuhNnJ4Nx8E3Z2ww7zcmgrchI43JLzmTmY7P98R1ANB+10Mozn32RrONHYSiw61TvXWiP1g+x5/nFkfESHEj/VHuI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWXP265MB2773.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:aa::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 22:00:09 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 22:00:09 +0000
From: Gary Guo <gary@garyguo.net>
Subject: [PATCH v2 0/3] rust: doctest: unify with other kunit tests
Date: Wed, 02 Sep 2026 22:59:58 +0100
Message-Id: <20260902-kunit-v2-0-eda3ed6c00c5@garyguo.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF6cmGoC/12Oyw6CMBBFf4V0bbWtpAFX/odh0ZYRxsdg+iAQw
 r9LcefyTM7cexcWwCMEdikW5mHEgANtoA4Fc72hDji2GzMllBZaav5MhJGfy+qunFC1lcA29+P
 hjtOec2t+HJJ9gIv5ORvWBODWG3J9Pr2Q0sQJpnh6mxDBZ6fHEAc/72NGmbP+e0fJBbeyllqUp
 mq1vXbGz10ajgSRNeu6fgFkiIjQ0gAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788386408; l=1744;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=2+/ggteeas075zl32/nEnzcgByAYX78M9TkqQBm9Qfw=;
 b=rrAQqr5umbW7YljezXik6TvsrF3X2pMbUuiEcQNdYZLBg3An+ZeqaUxJVAxMabNiStkoH7u6I
 tnGIUY+0ZTsBSVyOCfPAwP7sQBsyZyxjQZVsXVTlMqo+nd5XYTiG0PW
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: CWLP265CA0322.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:401:57::22) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CWXP265MB2773:EE_
X-MS-Office365-Filtering-Correlation-Id: 982ae240-ec78-4853-59c3-08df093d8e02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|7416014|10070799003|366016|56012099006|921020|5023799004|6133799003|10067099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	2M9DV4dk2D7EgRtjGFfNm4q7Vn9mP7gSkp/eTeD4BoFqU12asTZny/XOGkes4kVdWz0QYlDjipx5BTfTKO/o1W8iZxzvOVUWhYNXCFCsiwxT+eRMODrfgeZsUzJ7cWikv2T974dZVeL9Js4NdwHJcAvzYX3D8VwR3lGr5u+HeUQY5xLG8EMzR8ZU3sVX2orAJXqIUI9FvCo9wkz3Jw+AZsX9ENCKA/aemvLxdGew65R2hlgK35/WGG0qTHoerJWzhFRKnYVmZsxNdDm3ghRH5qr7tEGia6KYnqFkoSoe7F5PILk4FuTX7EjHYKCMf4k18euNZQ6xYX4RtN3lMbi5ra/QRjouLyxtYKVZXUHBXQ0ecWMpsqQHLn5ZQWcOlDcTeG9QkUZjW3lQs9QEYLBYNG1Y/nQD3rvXQj9Y+Jrr5/x2HZZRkLKfNV+/jFSdExnq7E81LxZkcIy2w0LUgCII+Y9xchZuUMsEWXIH/w0VJZiJW3pVCPZVr9+uheslKuh4Ig2WVBtfUZ5wMwoiECe4BSWTxsRPJIxGQM4kBK541v6lZNx9JyspmN8Jr9WT0vzq44NkrKnQsG4YdGDPCBiPp4guQCPA7lq7504yD2NNqEXKF1rbpdbUAgU2qEnCPwIzYcx/kRkPFjZp5iQiUe2Z0g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(7416014)(10070799003)(366016)(56012099006)(921020)(5023799004)(6133799003)(10067099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ti9TbUZUTURLVk0rRkkwaVpRNXJURXR1T01RR08wREcrem9HMFM0WmsvMzAr?=
 =?utf-8?B?aFVnQnJNNzBkTzhiUTdhSXJxSW5yb2Q2RWZ6RE9VMVhLWUNTLzN0R0FOUEh0?=
 =?utf-8?B?YUlEelJid29oc2Uza1ZhNEthOEE3eGZpZW0ydmtreDJTdXNYR3BxRU5ZMHpo?=
 =?utf-8?B?LzR5MGo3RGRaY0VaUjZDWmFaZWdLNUlIS2Q5VjVldGRhajFoWUNNKzlTTDdt?=
 =?utf-8?B?ZUxrSk9leEw1eVRwRkYzODRLMEtXUUU4ZEtwWlF4ZkNSYWpLZjI5STJFK3No?=
 =?utf-8?B?WXRBWmJjSEJ2TmtNWmt6OFBHUUxNTVczVkpFQk9KcjczemlROUZZc3Z3cXBQ?=
 =?utf-8?B?S0NQZUlBdUxjOUx0eVBEWG5qSnA5VnVIVDVSREV3bTZ3cFNjMExobjRJalRD?=
 =?utf-8?B?d05NaC96em5xNmZWMitHV2l5ZmFLOTdDYVZ3T1VGUmY5d0MzcXN3dmVieEgv?=
 =?utf-8?B?N3hpY1hJeTV3d0VNZ25neDVmMll6dXNSZ0gvMnZTOHVJTVAreCtKcTMxdzhu?=
 =?utf-8?B?YnVENndEUDJLK2VpbEdvOXJKbTZPNFN4bkMwUGk5N2JTQUtrNXlVV1lHRE9j?=
 =?utf-8?B?K05GN1hwUEoyekp5OXFSS00xOWxDTVR0RUpwSXBxZ0tDU290bmFaSlc4NUdr?=
 =?utf-8?B?bUZjSTA3aWlFd3AwWGNTakZSL2x6ZVM3TWhyNnRFbDA5VUFaZWVzdkdCY3Na?=
 =?utf-8?B?WS9yMmdKOWRNc0Rvb0tLV3VzWFl0YjZYMjVxOGZZdU1YVEYzQ0gyTmozYy96?=
 =?utf-8?B?US96aWFURVBkY1pUNVRjbUMxWG5mUUY0cTEvcjJycEVzbnJQQkhBRURLcGJC?=
 =?utf-8?B?Mk8yczBSZ2xzN29rNkhLcmgrblRUQkRpdnJ0eG1Rb3VjNmpQUEpLUGNuV0RZ?=
 =?utf-8?B?Wkw1TjRtTU5NR0c0SHlsS0RuS2tQUnVuM3cwc3V0YVFOcmU0a3JzYmZ0ekwv?=
 =?utf-8?B?RnVnQ2tab3NQOE5hSEI2a0xIaGNvaDFEVFBIYkJUUGptMlNjR1lEYWdXVlNm?=
 =?utf-8?B?T0thelBralcwMTNvWGkvZzhUUVVCNUJTQ1VMelVmVXBNN2UzblltTVFsUnhU?=
 =?utf-8?B?cHJFZ1UvQVE4KzQwOHhBWFVNbWZaekx0L0FXYjQxSTdzVERLMmVJSWdnZWhK?=
 =?utf-8?B?ZFN2STIreXBEQ2VydENtVy81UExPSzF6Vm44Mi9tMU14SzM1TzA4NU1FbWJN?=
 =?utf-8?B?b0hTNVNhSmtBSVZHS2FWUEo0SkNKSmhUbWtLTTFkN041eld6aW8renE0bnkr?=
 =?utf-8?B?MExpK1BKQVIwTmM4VlVUakVZQWxxVjUrZWRkNXo1TjJyK1F6RkwwNGJxZ25k?=
 =?utf-8?B?L2N6VVZ4WEVYMkZoMTM2bGZWRkNuU2IxSGZXa3BnQ1ZtUWtTU3hKakJrRnJs?=
 =?utf-8?B?RnNIRnhNN1ozSGtxc01zL20vS2hIb1haYnB0N1dTZHVlWW0xeHlZRjJjeTJI?=
 =?utf-8?B?akkyVEhrZ283UjUrQWJlRnRqZUNaRkVRV3M0NDV6cEMrZ2ZSbXB3ZStIWUlS?=
 =?utf-8?B?UVZwWVZKTXVjMzhYYnhlTUoyT2R4L1lOTVh1S1lZaGRKUkVsSGh1NlVPWFU5?=
 =?utf-8?B?bjVaRUZxTWd0QjA4cFFjK1QvVkZydTR0VXFvTU1DK05zblphaEtkT0hqS0I0?=
 =?utf-8?B?VC9FbExiMGM5OGcrY2tJc0FCWnN0dlhoaGFkTW9HdWNwZURScklPQ1NDUkVR?=
 =?utf-8?B?NVB1SU1VOE14TCtabEtMcXcwdWVXdDdPTmF6aWdSZStYMG5VSzVXeVhUU1FK?=
 =?utf-8?B?R3h5V2wzeW91aWtoWFdhbGVIOGhITUtVV1pub0xFRWZVZ3p0d0dBQjFycXVk?=
 =?utf-8?B?bDdTN0hoSzBwTVZJZFJ5My82Z240aGdkNXVMYlNQNlZRR3JJWlQrSjRLSUVO?=
 =?utf-8?B?bmlhY0MzWGVSaEh0TnhRSWkrMEhibk5GL2R5Z3lHY0NreGdzZWMrYW52NlhO?=
 =?utf-8?B?cGRSUllJNUFMZlE0dHBCcnBBOEZWZVBjUVhFK0pHMFNGdk53V1J2SERWWkUy?=
 =?utf-8?B?S3J3akpmMEdtcC9ZNHJ1eXp3V2FJaHNwUHlLUzRjYjNVWkJqTE82VURMd2lY?=
 =?utf-8?B?dG1mRGJhUjByS0h5Tmg5dTk1UG5ncm1SdlkzUy9CK1RQL1ppZy8rMVZTZ3d6?=
 =?utf-8?B?d2ZIeDhtZkZoUkQwS1ZsczJ6amg2WERtZFQzYzkyZ2c0b2JweXVkNmRkM1B4?=
 =?utf-8?B?MHowZFdxT29DSGJ0RG5yODduVkNLUU10aG9hNTVyVGN5eUhLanU2OHA5bUhC?=
 =?utf-8?B?U3BEbzU5MzRYL2VuVHpkUzdNZVdYQU4zWW81OThRZ2xBVGJQZVF6Q1FmRElS?=
 =?utf-8?B?MXRFQ2IxNGRmRjZ5YU9ONjZNWE9pZUlVVFl2NXVKZ2daOGExYzFzQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 982ae240-ec78-4853-59c3-08df093d8e02
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 22:00:09.1216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1muBmp2m2m5rrqYaNysKJVqoLC5u8J0t8MTb67cbYB5fKJoVcEAhOgIiaeRQZnUzYtR/s3Jip/P30VnSH8jaUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2773

Currently in Rust, kunit tests are handled with `kunit_tests`, while the
doctests generate a lot `extern "C"` functions and invoke them through a
generated C wrapper.

This is currently needed because of the special treatment of file name and
line numbers from doctests. Convert them to override `file!()` and
`line!()` macro instead, and use them inside `kunit_assert!`.

With this it is possible to just generate `#[kunit_tests]` and `#[test]`
for doctests.

David mentioned in [1] that this should route via the Rust tree.

Link: https://lore.kernel.org/rust-for-linux/e30d16ec-f5a3-4cd8-9b25-96e0dfa8b9d2@davidgow.net/ [1]

Signed-off-by: Gary Guo <gary@garyguo.net>
---
Changes in v2:
- Rebased on v7.3-rc1
- Picked up tags
- Link to v1: https://patch.msgid.link/20260616-kunit-v1-0-b191604a8d6b@garyguo.net

---
Gary Guo (3):
      rust: kunit: use `file!()` inside `kunit_assert!`
      rust: kunit: use `line!()` inside `kunit_assert!`
      rust: doctest: generate Rust kunit test suites

 Documentation/rust/general-information.rst |  4 +-
 init/Kconfig                               |  3 --
 rust/Makefile                              |  4 +-
 rust/kernel/kunit.rs                       | 11 +++--
 rust/kernel/str.rs                         |  2 +-
 rust/macros/helpers.rs                     | 16 -------
 rust/macros/kunit.rs                       |  5 +-
 rust/macros/lib.rs                         |  5 --
 scripts/rustdoc_test_gen.rs                | 73 ++++++++----------------------
 9 files changed, 30 insertions(+), 93 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260616-kunit-348f2c029b1e

Best regards,
--  
Gary Guo <gary@garyguo.net>

