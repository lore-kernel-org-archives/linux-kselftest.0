Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.100.132
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794233435;
	b=cuHZPHdftRIN7KhDUMBfvC4RcVnwOr/aVRUKxTx3e1d6jLOWbdrLyG5/+cDukfwAxGzz
	 zIC9C9cD359XALq1lyxiYPdsWUAF6rB4RbMyKVXupjQ7xaUpONHVJJiX4z1Kufupd+gKT
	 GrxACR4DS6fs0zBmq4Md70liyVWTaSm1P/zuUNNEaNt/s3OIjzKRWo8jYIKLsYkI1B90A
	 LsgeW4UZwg+cDt6rwi5cOFLHjZEJORB9voLi4WcGvC34Yp8bduwdBiDLmBX1ycHcjx3+g
	 7+/KBeocbJQH6BrsErpiM/TRe/SqueGr/NeSl9aqjW9Rq3GH4U2CYzLrbwpvI3iE/1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233435;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=VaQv37q8ZitDUAB2W/RaW0tezbqXrVqD8mz8Gad3tho=;
	b=ZJDoJIrItqHIetNd0mu9PmhqwJMfH3yqU2i2WsCpDZYYjU9XE6vVMBTHm1A+9q8GYW1e
	 jA9pzzONcuHDfx2zMyBn/CvMOUNzruLWay9Tc+fJWsyKM40NIKB8AY3bv98HNmh4Ce/Lg
	 CU0mdeok/53TVWz8/CRONBeBTEg0RoKLQ/GLpZNWoaO3mvBIQAxsikk3+/nBetbLI/8Bg
	 891blIGlCF6pZ+LnjQG9VO/QXavoqVdjW9y0tuyAv/xb0BHvDrW1UmuwuQzH621SqhavP
	 oMJvG5xCznxLgGgDlLE5G2yVz7/muq4b02AnrGQ+mIVFhdmkn7BOJ6qCQWKNfWXPCEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=garyguo.net;
	spf=pass smtp.mailfrom=garyguo.net;
	dkim=pass header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=b5YwDDal;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.100.132
Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021132.outbound.protection.outlook.com [52.101.100.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA63606EEB7;
	Mon,  9 Nov 2026 14:10:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AA63606EEB7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=b5YwDDal
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bs9B3tTDlt8lB6DutUhbUP55BoH+w25gVXk6e4vG3w/xm1zj9ml6nKJrHitpwgPJRke1bO/x5EDX8v2U+DhnII6FFBRU6fmQ8W+sZ1oN1dUOSJCmmQi6YcL8r1WYTMKn+S3Oi3O7ccc/7cQY9OxplBcwCfIEXZCCsoDYiMokBLWY6vZGXQ6ZlCIFpbLRtxPYSELxoc9mVwbzq92DfuDjxXWbiuAjQcy0LVuhHN2z5nRZ/VpiMzJlGc5thT4VxlGAptoq2jF5PDGuJUxGI//acGd0Q3NHDXoTBmA2+VEshfcWvlsFuo66XHEwEcf2L/meQQEHf+1D1rMHmUAsoIBx+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VaQv37q8ZitDUAB2W/RaW0tezbqXrVqD8mz8Gad3tho=;
 b=IoHRYWrnIVI0CiPxBSx7XL9xX9XVA468IlYogIXI0tWomBCjIPKdRwzlNO59X+qseNqhDxM3gifWJqeKCFHUINDcPURDEYpSrUcG/f86SVLi54EnFDep1WvtIZGqtKo+dTbtleAZIDUzxO1pIT25OZfCT7sQDCykppBsDeG5lRAS2fFObyMOQGaDCZK/Z2pwTM7XkLKwQ/erzenQiYITqLnfdL3hXHHnnCOB0uami/jNZ8wIie7SqzLDFj0Ug+8ti4K+CzwGzcs1NCVUTtSY526A8jaAe+rGTvrDyT6lNZdRAAxz2DXfoNwwcaS/CUukz4kInxw0NINnPWFbT9TeYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VaQv37q8ZitDUAB2W/RaW0tezbqXrVqD8mz8Gad3tho=;
 b=b5YwDDalDppvqI/n0eU3emGiHs43EXjO7cUFRD8SPKNbzV1GMvWWVI1NzgE4fkfi8uwCrNwgyckhlWt7z1/PzdRoTG7R8tcU1+HvYuKrBEmV4eM55Y7rI29CzPiUJhZVdOfzIvWiT+RUM1wydyTosvS9v2sUh3dY++QYR+6q520=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1cb::9)
 by LODP265MB340279.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4dc::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 14:10:32 +0000
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3]) by CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3%2]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 14:10:32 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 14:10:31 +0000
Message-Id: <DMQQO3EAIUDO.MAU4UO7UCLTU@garyguo.net>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Burak Emir" <burak.emir@gmail.com>, "Rae Moar"
 <raemoar63@gmail.com>, "Tamir Duberstein" <tamird@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Yury Norov" <yury.norov@gmail.com>,
 <kunit-dev@googlegroups.com>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] rust: kunit: allow same test name with different
 #[cfg(...)]
From: "Gary Guo" <gary@garyguo.net>
To: <nico.antinori.7@gmail.com>, "Alice Ryhl" <aliceryhl@google.com>, "Benno
 Lossin" <lossin@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Brendan
 Higgins" <brendan.higgins@linux.dev>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Gow" <david@davidgow.net>, "Gary Guo" <gary@garyguo.net>, "Miguel
 Ojeda" <ojeda@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: aerc 0.22.0
References: <20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com>
 <20261029-rust_kunit_v6_send-v2-2-5ce551efc48e@gmail.com>
In-Reply-To: <20261029-rust_kunit_v6_send-v2-2-5ce551efc48e@gmail.com>
X-ClientProxiedBy: LO4P265CA0116.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::16) To CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1cb::9)
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
X-MS-TrafficTypeDiagnostic: CWLP265MB6051:EE_|LODP265MB340279:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d797b23-f379-4583-a653-08df3e6b376d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|10070799003|23010399003|921020|4143699003|56012099006|261021123027099003|261021135927099003|261021121427099003|261022075727099003|261022105027099003|261009223027099003|261026140227099003|261028144727099003|261102123227099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Cv9hyuh8EZtNU8z5qbkTVmheFXyqgDp1Jt5Tz4s1CpKJpiP/uNb+Akw/TFKsdqD7lhhZVUBNACP4BKiij0ijuainwl2oblqgsNrwGZe7heNVCay53BPlhkIUyJxqSOxuli3G8b+DJDdwCjT3K05X5j1y7026W0nRUELPi1uWF1/TdDux009Ut+uzQfLDr4kEOijs9xIF6LVtCfS12PtCNCmjUu+jP7E6q8lO6+NWX5HhrdX75HD0iR9CxK/puVXz88HkVR+65mgRHCJ6G19cm+yp3t3/WiJsVR9K/YKpuwug2F7fsquRxZ43OltuNlaeMSaPuWBtdJKeHJoDy06/soMCoxE0QWLA9f4HPVbd43jAVYVosYmoKfMu3Q+lLYNg0nKowaNcgT300zhzTsTaLPgEElLzVaUd6rAuvzlh6i2YhYcaEC4AuVS/8Nh+a2pvmPVPDdymvLFVITBM99JTgvqLAqJftjIUqIFanR2dAAP0rw420lfigJWAWtdi06nkKzduUw1ApLnuGw57g4qN6RFyBQ+Qbi2Ex1A9nLTvCkiDv9yLga0T/fpcIrc9A4Mifi5kljxR6VBDtKmsmzQ3yMg2N+XBqK0yTHti/HUz1YYscsL1mpM2TMlx5FEqdmeyjsBy4QtwwCEub5VeSfUXV2+vc96PNXJeZGwmxYCKPgorDknv2hqEbYO4bhx487zZLRnRX0KpSQFECB3y7Jm9/A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(10070799003)(23010399003)(921020)(4143699003)(56012099006)(261021123027099003)(261021135927099003)(261021121427099003)(261022075727099003)(261022105027099003)(261009223027099003)(261026140227099003)(261028144727099003)(261102123227099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVh4amgxWUxHRFVaZVZIYmxVMFBrdldNL09kR01zeGJYbFpsNmFkejFtV3lY?=
 =?utf-8?B?SFBrVnNyQ0Z4L1NpWDJkei9haGpRL1JIMTVSR0poOHY2T1V1ODRocmRhWVAw?=
 =?utf-8?B?Zkh5ZExlMkNnR2IvMUhoVU9rbW0wNlRTQ3FoQXl4SkRBd2JXOUx2OUNNWnRU?=
 =?utf-8?B?dEpRODcwaDFEOXRtNzBDbHZtN2tabHZLWG9CV29tQldJeTl6b0hmQ1Q5cVJM?=
 =?utf-8?B?WXBlRS9MU05iYjlMbzlTV2ovS1MreU1SaHJFeUFGQkh5ZDhWaVh6aUIraUtJ?=
 =?utf-8?B?V21KNldrUjBlcDk4VlN4d2tCWG5teXNrTytTOFh2elBmVW5xZ1lOaG9uYlNr?=
 =?utf-8?B?WEZTeW1rZXd6QllUdHo5TERmUGNZc0NaOTFaUWRuZmpQUHFnN3ZqMXBZd1Ny?=
 =?utf-8?B?M2NPUGJ4Q2FzUS8yV1JaQU9NQjY3RkR3REE3RGpPRGxyMURPU0pMVWRRaTVs?=
 =?utf-8?B?cmNzTUo4aTVNOWV2a25mVnh3NUwwdXNxcnhxQjFudHg4YUdvVWQ1UDJwMURM?=
 =?utf-8?B?bGJlYlk1Y0c4MmJGSkhGQmhPOUJtak93U2dpRlNCd1lDZEpVR09BVHVNdXd6?=
 =?utf-8?B?KzJyNEROY1NTOGFaSDNweXZMMTdOYnovSVo5aWxBMHErSlpxb213UnkrZmUv?=
 =?utf-8?B?dGtKZnRuUUR4MlB4dzJrSkM3N1RKbWY0ZXF6ZnVFcVFQT0ZtOVVYaE1EQTNH?=
 =?utf-8?B?OWdrNUY0TEdSSU0xQ3VZS1FCMEU2K3B4REpDTVJINnN5VWNqMGlEa2NMbzl2?=
 =?utf-8?B?SC9aMDBLbjFKdTZ6ZGlzYVZVWXA2eUFNejk2RTZxOGd3WFpTUHlOT2lJeFhh?=
 =?utf-8?B?MHFHOUQyTDkyWmg5TkFVK0QrWHRGTUZwanZvQ2xFclNuZzZWalJjNjUwNnU1?=
 =?utf-8?B?M2FiUUV0VW9iaWZmMXFoZjhwVk9iYkExQ1Vja2FyYWR5V1FuY1Ivbjl3MDRi?=
 =?utf-8?B?WjI3ZzhVSGtNY3dGZFNYY0dpb0ZSU0hmSE1Id2wxMzNGYXlKYWZjcHFya2JV?=
 =?utf-8?B?S0ZxZkxTeHl6b2V3Ykw1WXN6bHdXR1NyR0kySUxJMzdaRnpCeWVOZ2tzRkF2?=
 =?utf-8?B?ZnpncWhteTRrR0VqdmlrOVFhZGlpbHA3MzlVZWxwdlNuWE16d2pxenZFYUxy?=
 =?utf-8?B?TkV3UkNFbm5zeVVERmcvQ1FkZjIxbXlkTFZVeTI2QkN6UEVwYWNqY2dmY0JL?=
 =?utf-8?B?VERIRUFVRWd5SXFsTnZSM0wvemp5RlNiczVTRFlIUUhKVERGTFkzNzFRelMx?=
 =?utf-8?B?MWt0QmUxTEF2TTMxSGZLNHdlQVdUaGtRdFVsQmQwbk1SU2RoVVc5R2M2K3dx?=
 =?utf-8?B?MXZqT0JKMTVtTWtBUllCa1hza2lBejZ6Yno1SUdoS2Q1Nko4VnZRRkhpTk9W?=
 =?utf-8?B?WXNaMnNtbGJtbm4yMnh5UVdIeitTSjdGSVVJQjhRZHFlRkN6M3JoRnY5bWVk?=
 =?utf-8?B?MlJ3UHRVSEp4bTFpWHJhQ0V6YVpmMGFpK3dhVkFiM1VQRGxFRzNyNGgvTktB?=
 =?utf-8?B?WWxuTm95K0J3eUhJZjdPeVZielRlYldlNUF1UUdDSnlOdHNXM3JFb01CbFd4?=
 =?utf-8?B?MmU1WitnSGZiN1lTY0xwS2x2SEhlditlSjhxQ3ZaaVhCN3VoS0lucUllWXNP?=
 =?utf-8?B?dE9lL1hVRENnbGRWMGo3VVN4am9vTjJUR2huNWNkbUhTVzlYNzBXOXMwV1J1?=
 =?utf-8?B?WldrQldOeURxZTFsUnF4Ym41dzVqRFRISlVVdlJJN3VOTFdrQ3Q2WGdmNE9V?=
 =?utf-8?B?WTUrR0xUUlVFTzhJMEYwRVFaOU1KdjZMUk0yOG51TkQ4QjVONjBLY2hlVi95?=
 =?utf-8?B?UFlNUDdPUDgxa3ZBNUlPM2h6S21uN0hiN0pJc1oxZjY0ME5uMHJmM1I5U2hk?=
 =?utf-8?B?VFVoUHVlc2NpRnl4aFVtV09UNTNtK2JQRTBXdTNkOHNVbTlXaHBzbmc0cUdQ?=
 =?utf-8?B?YkJxaFprWHFKZkpOSDR0SmhiYjJGQmdLQ3ExbEVVZHlPS2FGdW4vVTQvejZV?=
 =?utf-8?B?anJiNVVaVDd4RTUxUXpXV2dWK29jVzdIWFdrUXFXTkxVdG4yWkxETFpKSzlH?=
 =?utf-8?B?cHlRck5XRHovOGwzSUlCNGMyYk5TRi85UmVMNDdXZXk1QjN0WElFTkZoeEln?=
 =?utf-8?B?QmJac1RKTUhGL2NxL1ZJazQ3U0lPRHRDb1dFbjZrVHl6T0VmVWp5UUhKVjVz?=
 =?utf-8?B?UThsTy9XTmpMQ3pReXlhdFdVWFNCU3NUOHIzTEVMQ0JENm1LVEhDSkpBakhT?=
 =?utf-8?B?T1BtaW1xRGpsckljeXdLTERndlVvRDZ2TzBRSG5KZW0xYWR1ZTlqTHhDMkRa?=
 =?utf-8?B?VGp0bmxkR1JYOHNiMm5sZzIzckpyMStLZEMrQnFSTVlma1RJVUpTUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d797b23-f379-4583-a653-08df3e6b376d
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 14:10:32.3948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 14xOqt0RFTG5a/Y/wDiumdcvnVRI1aIN3ztDz7FEdvQTyx+Tf27BIGORb7NGs2cEBG9EXA2a05Udg0QYn2lCFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LODP265MB340279

On Thu Oct 29, 2026 at 4:59 PM GMT, Nicol=C3=A1s Antinori via B4 Relay wrot=
e:
> From: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>
>=20
> Sometimes it is necessary to test the same code paths under different
> configurations. The `#[cfg(...)]` macro can be used to check if specific
> configurations are enabled and run tests accordingly.
>=20
> Currently, defining multiple tests with the same name under different
> `#[cfg(...)]` attributes results in a compilation error. This patch
> removes that restriction, allowing identical test names across different
> configurations.
>=20
> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/kunit.rs | 22 ++++++++++++++++++++++
>  rust/macros/kunit.rs | 36 ++++++++++++++++++++----------------
>  2 files changed, 42 insertions(+), 16 deletions(-)

