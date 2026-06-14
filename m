Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022089.outbound.protection.outlook.com [52.101.101.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1638F23A562;
	Sun, 14 Jun 2026 13:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781442124; cv=fail; b=qPN51W0d3+2QZZpBhvbpQ48YIg4f0nODAR+TGLA8T27kyQPHDeUx/3tUGue1mKw4qcYMOS2X758SRLsXXi0bClaOQ0iePoPhTKNCU55klx2Eh8Cp+lb8FIxEiD4TLbdaGttBoD6wcCBthyIZjftjN7WpIi0RYQ1r5zMpd5fsiF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781442124; c=relaxed/simple;
	bh=iuuc5XVvOUQF9xfcH1MCUJtHLeSXeg4TS8+OQajrqBA=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=tSWXfPvMIvRY+Ka/dsM1KNcxWuurpmV9ODW+Hiy3fBVg0gLvDwbynzQJV7CXBQoNasT36V1g1jzU9THfjwhmF6Ep8NPQ4O1+h5x1PsPrsYQ1QqEVSOILHVGXbR65kgSZGImHCwdXFSXfPfYokAnKNLSh4XmCXXEePvHOPos/2Sw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=oimdvjlN; arc=fail smtp.client-ip=52.101.101.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="oimdvjlN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lfDZ87HOZH9FHEMP0BsMlwQ/AW3xYmQgZd4VkRa05FpMskLyE6daagZsp032H5uOCIBmFfIQG7KHoKnsWdv1ZHQtQLrADZO4Swhi58zAoOykOVMZxjdez2vQ4EKmJ9+W858fxxuog/l+J42W0pYMmuCYFSC82vxQk9XoEmMGuBsYB3O4FYaQGI8/Xany/X0+ZMMUI+GXouOyoW9KSz9bjgcaKNyjK1M5jYY2eFEvt46nzcP8yS4WgovoOqnA2E1Ji467h2ntAOGBGMky/EdajgtxYuknKJX50fznyOx84cHstMU/z/JMXQJoTMS/IcmTNjYzKKmkQBf5vNTLtkz17w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bL+lWhcyHO620OulB+XnhsIaO1prnYC8A5ulTfo9UBI=;
 b=WHK2gpdXASqDJrWl5ZdgIU6y4f6bozMCKI8UFO/EK3X68q1vnZAL5EAc2Vok8nSoCKoteh5NhCx9APYqMyOX7IuhSCwVXTEZ/yKAnbFUQO5orm1VrY8cU3m9USO6c1zUPUIJn0lwJdN1Sdg+MkWLiKpxj6RmJPsBDAX8EptPxoNL0tek2nm8X6fqq9scW1DYw2pRXYv+CTJiiE+ABPNgYbcTot2QJZm6xUovtAOTD5AAgKXGOPzmhjRUkgKvnNO6z0prP3EgApW0SZmuNBZESs3wpGP5fzZw2g5Ir9+Mup6Q83DAitHGx7+bR69uCGYk8GbOKZUWOMghYbbq/QGPRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bL+lWhcyHO620OulB+XnhsIaO1prnYC8A5ulTfo9UBI=;
 b=oimdvjlNL8Y8DUvQIOtM0zOZXpNs7FFj78aRCaJTdZoieGrHvaixtHDmmwNCkulI9zyoIlo1f5gEF1WjzcsDpFxk6oALU2JVA0beC9qHjjQSj0GfdCmGfNLecOagRa733aGB0ZTQS23y9btBWkIaY0vPgVIM/8H79Os4LTe0aLA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWYP265MB9335.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:295::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.17; Sun, 14 Jun
 2026 13:01:57 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0113.015; Sun, 14 Jun 2026
 13:01:56 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 14 Jun 2026 14:01:56 +0100
Message-Id: <DJ8SIY9SCW97.ZOTSZPBIKMWV@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "David Gow" <david@davidgow.net>, "Gary Guo" <gary@garyguo.net>,
 "Brendan Higgins" <brendan.higgins@linux.dev>, "Rae Moar"
 <raemoar63@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Igor Korotin"
 <igor.korotin@linux.dev>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <kunit-dev@googlegroups.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] rust: doctest: trim function name for
 reproducbility
X-Mailer: aerc 0.21.0
References: <20260613140431.232471-1-gary@kernel.org>
 <20260613140431.232471-2-gary@kernel.org>
 <5f5c5555-466d-41ac-8187-8b9ddc14965f@davidgow.net>
In-Reply-To: <5f5c5555-466d-41ac-8187-8b9ddc14965f@davidgow.net>
X-ClientProxiedBy: LO6P265CA0001.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::9) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWYP265MB9335:EE_
X-MS-Office365-Filtering-Correlation-Id: d521a7fa-5347-4a8a-312b-08deca151d3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|23010399003|376014|7416014|6133799003|18002099003|22082099003|921020|56012099006|4143699003|3023799007;
X-Microsoft-Antispam-Message-Info:
	5GaMkJMrx0Tv2SGycgbZDqpBnjugt7UTnhVJehsg2GpzzN5wT20gyKjVedEp1vRhgStw1dYBywkvxY7kyfetjDHu8kMeer1OXKjHjoixlV0Fy241aLImv09PEKswKnrraVCZIgE+KbgH3xfB2WJ8xWYG1N0ss+R6PBM9OS9imYJ4KP6rrVDjdF6ze+4/aU5uVE+rByk/7woKbCgYkXiSkQY5ETZu9TX1PufB76/acLsg627fGfGkWFktyJbZTfVO3c0/PUlVct/mTtyBb2KqoJs6LOpM4/2lRW4GrFHg/b9KJi0dpxd0sllcZTZGobG/B+ktbzGow2idTaZURCzFpqvErmSVVkr9dAaUlNlya3pxQsSF59GyxE88Xt/JOvQhTqg82L6TeyXuhZyWmrAnbnONcyePgfQ2qdwDn9SS+BgQ0N/roYbWOzFrkkq0jQHyzBRtojJdSM9LyoUxvIOOUD+gNm09s/xVwKnfX2Nmx7MA0L03jPdhkA8LkKezhimMm3g9VWCb6KVxcv9Sfw2RQcfyR0PRBYib4Bv/3TJ0yXfrrHs6+zQyY7ThPvD+DHT2sEKA4obOyIvJ1hFQRMwH+VB3OssW38NVii9OvdLwPS0rtJV5kU406fzQr4B4+E6pXarbC8byHQMCmC0Da27lqxukTT5egVEvmxGm882r3Oxtt1mghqyS2n9oUHNsofN8R83PrnERHK4dQzHJw0qLMfIdWOjHU7n2Y/68AXNtLwQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(23010399003)(376014)(7416014)(6133799003)(18002099003)(22082099003)(921020)(56012099006)(4143699003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azYwT29pUkVIWi92NlBSK3FDUFhPb3BvRUkyQlJBWm5LdXAxOERFTW5zdVB6?=
 =?utf-8?B?SGFXUW9wenZjOW9BdEZEN0dpWmdqdkMyM25qY3U0YlJCeEdWSENHTUVTS3lx?=
 =?utf-8?B?MjZqR3hJT3c1Q1Rob2FYbDdmWDVrSEEyUExhVnpTUDFBdmh1NW15Ky9sazk5?=
 =?utf-8?B?NzJlZjM5QzlGVUxwNFY2NkFhTUpGd1M2S2xnMFdYZDgrNE1NTmw3WTZZSGFC?=
 =?utf-8?B?RUw3TndrbGFLbE5ZWWVQcUsxazRUcjdEOFRxZVlUcDZ4RTJ3RTZCRHpVQWpB?=
 =?utf-8?B?ZElwamNXRXBSWnMrK2I1bWVMbE1UMHBIK2VLVHlxMGVRa096UUJnV3JHWUQv?=
 =?utf-8?B?S0ZzVGFQZ20vYW5hbWtmMlZnSXA3R053dERMOUlYTW5TY3BIeE5WZVdsM0l1?=
 =?utf-8?B?U0puaDh3TGpXZ0RjT2lzOXAxZ0N2SDFkcHdGZEtTckFpZ0dzVVV5cE5BWFpt?=
 =?utf-8?B?WHk4L1Z2N2hUYy9CQjAwa05oaGJQRGl3RW83dmpwUCtIRnM5dnV2VWNEcm5X?=
 =?utf-8?B?WXJ2K0hINVgranR6WUxGMXpBZlFGaGxoRnl1aGxSNFBxSTRqcGQ3T0kwTUg0?=
 =?utf-8?B?dkcwU3YxQzNWeXJLaXJTWnl4b0hOQ0FQOEQ4QlhiQWhYd1A2Y1FseVU0TE00?=
 =?utf-8?B?eUdDdVlzbnUwK1E3QWxDZ0hEZkxuRVVxM0Y4NnpiWHhpbmlXMDYxWFpoVGUy?=
 =?utf-8?B?SFlFaGV3enpMUncvek0zbE92UGJvZzdKZS8raVBFQ0VNSXB5eU9iSkVwWDYv?=
 =?utf-8?B?Y25MalhUMDVIM1VOVjFaSXNGWmU4RGNUSlk1SmVLbVIwemJWdU5sSkZtOG5B?=
 =?utf-8?B?a3JTZGRzTFV0Ky8zOEJNNW5lekRnQ2JZY243RDRFdTdzbWc5MGQ5STREODJZ?=
 =?utf-8?B?UGJ6VXhDUTMrNSszc2R5bnBHaXQ4djgrZEpJc0RLeUp4QThnZnVkRTVmS2k5?=
 =?utf-8?B?UkJvcWFlMGN6d3hNVVBNVGhHU01yZUgzUjQwaG5vRjFnaHdsTkhDSmtvUm1F?=
 =?utf-8?B?K0Yxb2R0OFBXTUlIQkYrS2p4UDZTaGJFd2l0NklxN2NzK0JJaW5NSkd2L2Zw?=
 =?utf-8?B?MjVyQmY4ZE9tMDBqNDFnWGdWci9yM1Vrei85eFUzSWEzVDdDcUpwUmNPTHpn?=
 =?utf-8?B?TVlPYWhoWlRsc3lVdlBiclJFcTFkend2TmQ4OXZzdVp4cUR6N2tjMDdLM0xk?=
 =?utf-8?B?N3o5bWNEWllMMEJRYzhZZkx5ZW1OeEk2aHpvMDZLcDBLU25vVWdlb1VKR1pw?=
 =?utf-8?B?clA4NGU2QVB2all6WCtyNGllbWVSTmcwV0JCNkNaTk5zdTRHaThGc1dxZU00?=
 =?utf-8?B?aW9BTWk3bkVDQ2g1d3doTDVSWmVlMGgyeXowTnVBcTJSaXlPaGQvRVNSZnJi?=
 =?utf-8?B?MEpadWxxaHhMTVpjaTFuaHY4U0VtblN6MGZKdllZUVh5VUhRdUNyVlU3MzR6?=
 =?utf-8?B?dDJ0SFh3Q0JBT3Y1ektVZ0J1QzJCWFRTcWtQd2luWk5YcDYyQ05UanBCcGVC?=
 =?utf-8?B?RVBRdmtIblNhaU5SUmFkaFBZeDd5eWRraEk4ZC9iZHArTjQ0K1ZSV2Yybm9k?=
 =?utf-8?B?NW0xOEJyblBiZG9XSWRzNEQ2MkNKZkRJSm5yUXAwRFFrcWV5NXFlZW11YTVv?=
 =?utf-8?B?UVZnYTFkbE9POUJGcWtEYk8yQ09Bc3prSzZFVmYzRWdSWVVJQWNLYzZmb3Ar?=
 =?utf-8?B?QWlpU1RNRkFvKzJ2czB6empNdjNHZkFaU3luNzJjN1RnSWhYZnZCdzVKL3Fp?=
 =?utf-8?B?Z2ZjUENkNXVXZ1Rib1Jxdy96OFNnSllJL1FyalFoY2xscVBOME1PU0VKTVBn?=
 =?utf-8?B?elpsTlYycGZVT2htOVhmSFFnWjlUQVE4UXYrQXVja0tqSmg2a0VSTi96UkI3?=
 =?utf-8?B?ZGJybGNQSFEyMUVXaWx5TldUQjR1UUI2Q1JzNmhNcWtlaEM4TUI5WTY5dUtB?=
 =?utf-8?B?RUx4RzJsZ0IwQ0hiZmE0bmlxUm1JcFdGWUgrT2tyVmlBWWFzd0RtenovZ2kx?=
 =?utf-8?B?WlhsREZMM1VNZlYwZlVzcVB3bU02Z01ZaUhLU1pMUS95d0lqVkVMVFhTUUF3?=
 =?utf-8?B?bk5CTklLQ05MTThOdkJ6Q1cvdmRDaEZwTkMxSmZHVk44RnhiWjVRRStzRnBB?=
 =?utf-8?B?UTlndm8rYWlTQVdZak9QWDFqVFBweStidVFuWDY1ankzL0t2UHVRWlFicXRz?=
 =?utf-8?B?SzQ1NndRd1hOYmluOE5neWozZkdkUFJzMTU0UnZoWGU1RFlZTUFMWHhvZGRk?=
 =?utf-8?B?YnRIQW5UajZxUUJtdlhBK0JsSVFHalR6VHdGSG1sTU1YeGYwdFRHajZab1FF?=
 =?utf-8?B?SDFMSnlaZmVkS0hkcUJVRlpFaC9RVHYyZWhoeVNWMk0rOFFKbEtVdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d521a7fa-5347-4a8a-312b-08deca151d3f
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2026 13:01:56.8090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vxVV5OZzVOwfWxeY+nuS7v4FreQd90jUHC16RyZGzY9PtjTnkGlHRYNZor5abBduw6GW1v/gGSVPE7ul4qcpYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWYP265MB9335

On Sun Jun 14, 2026 at 8:07 AM BST, David Gow wrote:
> Le 13/06/2026 =C3=A0 10:04 PM, Gary Guo a =C3=A9crit=C2=A0:
>> From: Gary Guo <gary@garyguo.net>
>>=20
>> Currently rustdoc will generate function names like
>> "_doctest_main__home_gary_Projects_linux_rust_kernel_io_rs_824_0" for a
>> doctest located at rust/kernel/io.rs:824, when building with separate
>> outdir using `O=3D`. This creates overlong symbol names and is also not
>> reproducible.
>>=20
>> Fix it by doing a custom remapping to trim it to something like
>> `_doctest_main_rust_kernel_io_rs_824_0`.
>>=20
>> Signed-off-by: Gary Guo <gary@garyguo.net>
>> ---
>
> Hi Gary,
>
> This seems to break older versions of rustc. For example, with
> rust 1.93.1, the build now fails with errors like:
>
> ERROR:root:error[E0425]: cannot find function `_doctest_main_rust_kernel_=
alloc_allocator_rs_176_0` in this scope
>   --> rust/doctests_kernel_generated.rs:74:27
>    |
> 74 | } let test_return_value =3D _doctest_main_rust_kernel_alloc_allocato=
r_rs_176_0(); assert!(test_return_value.is_ok()); }
>    |                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^ not found in this scope
>
>
> Am I missing something? I'm using kunit.py to build:
> ./tools/testing/kunit/kunit.py run --kconfig_add CONFIG_RUST=3Dy rust_doc=
tests_kernel
>
> Seems to be working okay with 1.96, though.

It looks like upstream rustdoc is using fully qualified path from 1.87+, so=
 the
replacement doesn't find it anymore. Not sure why it works in 1.96, though.

Sashiko suggested doing a full text replacement which I think makes more se=
nse
anyway and would work for all versions (and also for unit-returning functio=
ns).
Will do it for the next version.

Best,
Gary

>
> Cheers,
> -- David
>
>>  scripts/rustdoc_test_builder.rs | 14 +++++++++-----
>>  1 file changed, 9 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/scripts/rustdoc_test_builder.rs b/scripts/rustdoc_test_buil=
der.rs
>> index 2b1f9ba01839..fda7284355f8 100644
>> --- a/scripts/rustdoc_test_builder.rs
>> +++ b/scripts/rustdoc_test_builder.rs
>> @@ -47,11 +47,18 @@ fn main() {
>>          })
>>          .expect("No test function found in `rustdoc`'s output.");
>> =20
>> +    // Figure out a smaller test name based on the generated function n=
ame.
>> +    let name =3D rustdoc_function_name.split_once("_rust_kernel_").unwr=
ap().1;
>> +
>> +    // The rustdoc function name can include the absolute path when bui=
lding with `O=3D` which is
>> +    // undesireable and create overlong symbol names. Remap it to relat=
ive path.
>> +    let trimmed_function_name =3D format!("_doctest_main_rust_kernel_{n=
ame}");
>> +
>>      // Qualify `Result` to avoid the collision with our own `Result` co=
ming from the prelude.
>>      let body =3D body.replace(
>>          &format!("{rustdoc_function_name}() -> Result<(), impl core::fm=
t::Debug> {{"),
>>          &format!(
>> -            "{rustdoc_function_name}() -> ::core::result::Result<(), im=
pl ::core::fmt::Debug> {{"
>> +            "{trimmed_function_name}() -> ::core::result::Result<(), im=
pl ::core::fmt::Debug> {{"
>>          ),
>>      );
>> =20
>> @@ -62,12 +69,9 @@ fn main() {
>>      // We save the result in a variable so that the failed assertion me=
ssage looks nicer.
>>      let body =3D body.replace(
>>          &format!("}} {rustdoc_function_name}().unwrap() }}"),
>> -        &format!("}} let test_return_value =3D {rustdoc_function_name}(=
); assert!(test_return_value.is_ok()); }}"),
>> +        &format!("}} let test_return_value =3D {trimmed_function_name}(=
); assert!(test_return_value.is_ok()); }}"),
>>      );
>> =20
>> -    // Figure out a smaller test name based on the generated function n=
ame.
>> -    let name =3D rustdoc_function_name.split_once("_rust_kernel_").unwr=
ap().1;
>> -
>>      let path =3D format!("rust/test/doctests/kernel/{name}");
>> =20
>>      std::fs::write(path, body.as_bytes()).unwrap();


