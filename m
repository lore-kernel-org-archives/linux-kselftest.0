Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020098.outbound.protection.outlook.com [52.101.195.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F36D3B14A5;
	Mon, 22 Jun 2026 13:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782133258; cv=fail; b=nrtnKZF+vGbqbBE3Op2O/K1Epl/LFSylrjmwNFmswx7azztpplP1uiBy+5qH2yAenM0EO0P2PoaEB/dCNzay+h8yfu4jMIK5VP+2TXTfLDb8/iaKeoCYFEDiJneP2UK6A6e4kP4Py3+l6roE5WbD4Lpum4kA1+7HkGk5gmbET20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782133258; c=relaxed/simple;
	bh=2IaRxS0MeWVvylXStK7mKbuU8C9GOP22f00gP5GOZk0=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=evtMalsR8WHjTEa2gEV8X3jG/Cz/enSLb40zskaGzSBIVpDDFznWHym/V4ypiQ9WfbQm+VrHFDjTLPfSMaAX2EGmMODNLO4DSzUASjdngzTZe6SWeDpHfwvXgjktxFk8TL1yA2Qr5y+3RofycHb5tWaK1u6NB/RHzCHbjnh0QGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=FXbTRj+9; arc=fail smtp.client-ip=52.101.195.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="FXbTRj+9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LM3bMhvVX8T37tzqckQefymVQgrnNqZWctWDhi4dLBxMRRAmA4g4tJAey5h14/TbjYfmq/Yadt/mNVUKgw7V7d5ZLEmqiXD81aL66LZuzRb6y4iYmwjBSSHL2Te7FGG5v1hvr6SgZp5bATtEH/1lSuNS/ycI9OjASOwhgm5MHLGTpl2H39axcSF4o+00dn1RVz249RSPllTrpvaAFFcE6IcDRLYY9EddHZAYm1+E5jA3GgaoH6jjif0rcIM3ueswgrtOTl6jIouMu2PP4BXZxbShGMGEcu0OR32VjS1cpU5TrcFjYz76gQ5ksyyFsEET6HG7XxOtN+3bgJcAv+F+Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQOjS1oNYossMqnBgluOm37/LDC5jOtgYo5fvpzEOso=;
 b=Tf7Oy0VnsKBxJOIUPdfgY/YlD9as6fPWcZX/BILpi+ZPVRa4+BEhENVb4pyoM+2twOic5IeAfDsPnSl11FrCQPyRh/Ms3GXOU+ihVb7ewvFqZoo82pPKzLkokt5Ymv5NTwsC5UgckDkrBAmuqq+3qsIfQavp0BThDx0bamHxWF6EorTEQodSkVQ7wxoRISVtCVpHTTjlppZUDnKN1H1PkCTcuOKWcCLVLrjdR4xxZ7JuIn9qxoHnev0RdANh1T1VpB/jE1RsfeZ6irETLOe/y3zcI1q2xzcucJaNPvcF6uIvdlII6vPgIqLfpwx4vA+NR96G5cUOzXkqC3iyPBV9jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQOjS1oNYossMqnBgluOm37/LDC5jOtgYo5fvpzEOso=;
 b=FXbTRj+9IHOFq2xEnYxdf+YdsXqoJyCGe23/52jZFjk92hTSTFnKzNyu5IsyVTdogcUS3OKGN1W9VYI7Hh+yi8DEf6TGILxpV3AMATUEKv0oM7dEJhow/DiC9GLJ/BWvl0zaSFkhyhl00g0NDpiqWxPo96OkD5P0mJU2P6UNk8g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOAP265MB9304.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:495::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Mon, 22 Jun
 2026 13:00:49 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 13:00:49 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 14:00:48 +0100
Message-Id: <DJFLIG4XLV5P.3SESCCH2A4UPB@garyguo.net>
Subject: Re: [PATCH 2/3] rust: kunit: use `line!()` inside `kunit_assert!`
From: "Gary Guo" <gary@garyguo.net>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Brendan Higgins"
 <brendan.higgins@linux.dev>, "David Gow" <david@davidgow.net>, "Rae Moar"
 <raemoar63@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <kunit-dev@googlegroups.com>
X-Mailer: aerc 0.21.0
References: <20260616-kunit-v1-0-b191604a8d6b@garyguo.net>
 <20260616-kunit-v1-2-b191604a8d6b@garyguo.net>
In-Reply-To: <20260616-kunit-v1-2-b191604a8d6b@garyguo.net>
X-ClientProxiedBy: LO4P265CA0131.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::12) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOAP265MB9304:EE_
X-MS-Office365-Filtering-Correlation-Id: b4891f2e-7911-4aab-aae5-08ded05e4847
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|10070799003|921020|3023799007|22082099003|18002099003|5023799004|56012099006|6133799003|4143699003;
X-Microsoft-Antispam-Message-Info:
	im0djnWxjmBhSWwyBEehCcNAo1deOaqsc/b7PCjQvyJGyXCKN7E4YQRslIVZzNAyRGuRip9wZRl30TJKa3G4thefoKWvqC+boSl1/nvyPTGTe44vmHxFK/YH+g3DTmpEnGL1r/3xV3M97kLpW5sKREY5qW/rB3kTbszJh1lbRm40bE5DymWRupMR55wDGLZNzNxA43sPRTgBdBek/HHkaEPQnlMGEcHNl4iurZ8aeJF5arcmWRL+/s3o3EQet5Xk3+FIBMtrmhM+dDVGu7VIHLBsaRqsf6tOzXreCY5WdzHE7bpVVXHq92e5EVPgNjUm7hefbP1mOHZ89BGmQXKmVnvFkiJVMWd6X0ROBOC4yqH7zUlUgcRcC5zEcsrz+8TrbM133Wpd3Qt2iX0X4O8+JBggm6vFI23zp4ukBfKrmZ4PR/DRUDo+W1pnwpMCVtb6Hs+2FC+Nu/XgsXEw6WeNuWFHRBbp5ZROTMh9QPtLqqNum6agDhh7/CymqLVEWSdsFUrMaTC+ahb50skcdYbDUjNaJ08pT+YICLT57//G0rdN+3fvrMwpmokjTbZCw+PYtuhLHQGUQRpkn7c7smkxWOww9f6/TijPLpF0jRdpu7Z7omg/q5BmN/mYXYlYynZ8sr3CQuYMYr8EtMlhpbstQNv0MlDPJNmUCmwalNPNq7xd1ZOKloKMHfnzyDuO+T3xcpKSsE/7KLOZiyPs6cC/FA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(10070799003)(921020)(3023799007)(22082099003)(18002099003)(5023799004)(56012099006)(6133799003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkZaV0hxK2Ztd0cxV3l2NGROV256VFZGaHR5RFhhb1UrT3ZycGMrTS8xb0hR?=
 =?utf-8?B?ZmU1TXFCSG5oNEYrbVpLMVNLdzdFWXpNOFRVeGxTeWFMblhxSW5CSzBML3dv?=
 =?utf-8?B?UFVlWWY3TnRkdDVaZXRCVlFtcnNMajMyS3pKS1ljUnorNjgxYUJHNHVlM3VH?=
 =?utf-8?B?WnpTWExRZGkxdkJYOVFhbkdmWWl6YnVTVHVUbDJWUmgvRFk0RnVRM09XTU9h?=
 =?utf-8?B?bnBGY2FReTdXNHRNRHdjT1JzNTlKNGNwc2JOeWFzQVE5elBBQ2c3OTZJK0I2?=
 =?utf-8?B?OW9NeThJOFUxUHlxYnVMaGdtRGE5L3dLZDRTTUNPVWVEa21iNGRzRzRDN2gr?=
 =?utf-8?B?ekNhUVRSdnF1bUg5UFVVbGJ3dWZZc1NjSUlhTm9qMTNXTGRvVXBTeEhiallB?=
 =?utf-8?B?QTdYaXFKQmVUNkZPcGF0K3ZLYmtjcjlGeFZOdVVxOGxiTllhL21ma3RtV3pu?=
 =?utf-8?B?d0xoS3ZjVVllV2ZGcVhvK0JPUWg1QjI5bjZFbnhtT25FZnEzNGpIYmVBRUMx?=
 =?utf-8?B?ckgzRWxLZnlMRnEzaEpoNGUzeW5oaU1sOGlpQjJLSnNDano0K1F4dXY0VFpp?=
 =?utf-8?B?V3BIaGNiUUJRRDY0Qk9QSzB0bDI3UGdFYi84cUtDd2ZzakRtWlhTeC9sa2Nz?=
 =?utf-8?B?THVFT1RFQVVIcVgrUTRRUDMrSUxSZmF3TmQzK2l4RXdvQkt4MTdQaFE5NXlu?=
 =?utf-8?B?d3NNMUpqMzE2aEhhWCt1azZ4T3dTRTI4NUNpNlpUU0dtVTNkVjdjc1FHS2Q3?=
 =?utf-8?B?aDUzSUJzV0l2K3hTdE1lbERUa1FpQjM4UmpPbktTcXVFTThxV3ZRR1k4NFhD?=
 =?utf-8?B?c25ROGF3di9zd2E2T3hEc2svSUlJNVQ5ZERRUmtsR01FME5DeWJCY2xtSnY3?=
 =?utf-8?B?RU54ZGNIOGNUT2h6SFlKSEZGc3VwcXlVZHIzcDR1NkRDV2xUWTY4MTJkK2F5?=
 =?utf-8?B?ajJIWS9tUk9pMm1scW5wNXF1eWhFeDA4NjllV2pJeiszTFR2WjlTdm50eTRG?=
 =?utf-8?B?ODZuSldmL3pML2gzOGUxQmhxT1Y0RGNYWWJlV0w5V1JLTnR1SVNEbG1CbzM2?=
 =?utf-8?B?dUZMSnRmbUpBRTF6MXZDa2tvM2xYRy9RUnYxbEdDOXdQdnMvdHA4MERNY285?=
 =?utf-8?B?Y2hkNUM0OHVjeWJ2Z2xiQ0d0ald0RklOVGx2M0gvaEh2OWEwQ2Y3aVZDNktm?=
 =?utf-8?B?Rk5Qd0M1T2Noa1pDQnJhUEE2V1VIZFRFbGVFTTNEQ0Nhc0hiVWxqWTdLMi80?=
 =?utf-8?B?OGFaOGdsTHNQSDFxT3E5WnpKd1EwTkh4UDNuQU5oR1JCdDZJVjhTV1Q3VFNB?=
 =?utf-8?B?YmFUdWVRc2pGdWZqNlhnbHFuZXhqQ2FTUml3c2pXWWF0amZxeGZ0ZnRCeUdI?=
 =?utf-8?B?WDhxbTNyTjBlRStVTE10eDNjc3pBakJFRnI3QWRUZnd2cFNQSmFwMzZXV0gw?=
 =?utf-8?B?NlFiSHEvTWhpc0MzU0RLZU94aVF1YmtqZnJVdmZmM3dKaUtTVlJqdmtWTHBB?=
 =?utf-8?B?S3hvdnFiRDZRUUIvK0VvL0lvUU5Ed0RaVk5mdWxBVkZreDNsM0JnemwxRTRS?=
 =?utf-8?B?aS9KSzRZRDlxYXQ0SWgyOXgwYXJVNHVBVzJFaUh5R2pyTTNaRVJtL1MwTDAw?=
 =?utf-8?B?SFhxVnIzSlIzbndXMlhIK3UyL0w3SDhZV0NMb3NjM2w3UVVPdHVlTlduaXVQ?=
 =?utf-8?B?MHJHM3dqWkE4OURKcGRxWGpEYmdGN3RyNFlzcFRkRFlkejlJTy9pS1U5YnVv?=
 =?utf-8?B?N2QzWUNGL0Q0Ky91OCtFZE50RC9YUldpaWtaMkVJZklBbmxjTFMydSt6K01W?=
 =?utf-8?B?S2MxeER6RHhMRm9LM08xKy9WcW9QckY2QlRrS1FsTy9HOWk5VktydjB1Y0Vl?=
 =?utf-8?B?cjF6eXFVTGhYM1BQTUE1eHVXN2ZCeEYxQldXQ2xHZ3ZNVUQ0ZU9OZmJwMkdn?=
 =?utf-8?B?aTduM2V6MUkycDYwNmJVeHBsd3JMMG9EWjg3SFYxLzlvcHRYYytXTGk3VUd4?=
 =?utf-8?B?YS85UllYS3IwV3dBaXBUVjJ3alVXZDR4VVg2c3NkWmFwempHdHlHUW9CdDF4?=
 =?utf-8?B?RW5PL2Y5N2I5ODJEMU82aktwZDA4VkdDcWlNS2FXNVNoOTlvaGF2VDZMRnUr?=
 =?utf-8?B?OWFsT1JubDYxNk9DNjBHNUYrdDREbWFSSFBKYnBqZFErVGpyeTZFQnVtY21x?=
 =?utf-8?B?eURiS2tpdHRJUlgvK1UxSy9YUHY3eDZ4Y3lBU0xLa3BlbERJZVhMb0xoYzZ0?=
 =?utf-8?B?TEZLMFpnUHhYNll3Sy9iNjVMODRCL3RJbjhlMTFkZG50Y3ZvQmozclVXU29p?=
 =?utf-8?B?akpqTVBHUlpJUmwxSDVrekhnaXF6Y1hNTnJPMDZxVlgwVlZ0VklHdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b4891f2e-7911-4aab-aae5-08ded05e4847
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 13:00:49.3706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2uW4qTRrfO79LGnfL+w0cBCbkCedwOkqBEu/+mOXhren5hxlP7HR9Tlgv/qvH1uLdgeDz5+PLNk3ksT6VixtFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOAP265MB9304

On Tue Jun 16, 2026 at 4:24 PM BST, Gary Guo wrote:
> The `diff` parameter is needed currently because doctests want to overrid=
e
> the line number. Simplify it by changing it to use `line!()`. Have doctes=
ts
> override `line!()` macro to achieve the current behavior.
>
> A few current doctests (or their invoked macros) require `line!()` to
> expand to literal; they're updated to use `::core::line!()` instead.

I've found a way to make `concat!()` still work by having a proc macro that=
s
does the compute at expansion time (which would eliminate the device_id/str=
.rs
changes). However, doing so would require the full `proc_macro_span` featur=
e, as
it needs to use `.source()` to replicate the
behaviour of `line!()` (which returns the line number of the out-most
macro invocation, not just the caller one-level up).

Alternatively, this can be implemented by using `expand_expr` to invoke
`::core::line!()` itself, however that is also unstable.

Best,
Gary

>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>  rust/kernel/device_id.rs    |  2 +-
>  rust/kernel/kunit.rs        |  8 ++++----
>  rust/kernel/str.rs          |  2 +-
>  rust/macros/kunit.rs        |  4 ++--
>  scripts/rustdoc_test_gen.rs | 16 ++++++++++++----
>  5 files changed, 20 insertions(+), 12 deletions(-)
