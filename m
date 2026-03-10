Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020131.outbound.protection.outlook.com [52.101.195.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA623B6349;
	Tue, 10 Mar 2026 17:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773165439; cv=fail; b=gFaPewnMmNE3Crea+S1rXFbH2YVP5PDCFiCzGtaOj3fBHfaOYMOtcSDSddGMQBdzYXI/1Nsi7z5NXHHo4vPBlT/ET4p4aQTBHThAsszy1cm273xVG7lAzyKsDkdRIzW29vaNbbu0WhrPinkire83MqxCCkZD4Bp4eC5AxMnBSEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773165439; c=relaxed/simple;
	bh=lfOl6aXSJM8O9zj0UisktvDdO7nMWquuPhnR9C39TL8=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=u4u+zg0/oSFxZ/tFQtc5IbNdPv7+x5NhDZvfeq+5Q584Gorxx3jgjN+ElZmHqKcMS6vIuXrunoepByOWkXzcTSkSbHMjxIxubnDMeKjcrXz2fe40WtJ5MruXmUTKFIyUDJKJ4Xi5fLux2zNmxh9V7v2h9N/ty3Ej7Kc9vsPBtuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=eFFHdCJB; arc=fail smtp.client-ip=52.101.195.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="eFFHdCJB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IvKRdsXPb+ZyssWy4DnHOceThM+vAmgex7ot5TJnzjJdPvGUngicVMC53sYwnb+0BojzN4JkT5xCtlDvSSz4cqC/KYZfQWNb0G/Dvloou0q53WSyvMslLdtkE18YUMGA6q33usu5bDjUre3htVaviOwcKR8tIUyllKdz4v53BrOxmFBJX0+I539v/tU1yFNYZTFRQFSZOJG48exlEliOR1pFpExJPJKmg5BHIxjoWa7Qji60wElqd7F2ClRcII2ioG2JzPyK+lpjspsgng++gQl+oxWfy9nuToSdUHP4SXd6nalf0ytFYJpR5wzbEyhu+jf7qXte3L/BtF8sbnI2OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lfOl6aXSJM8O9zj0UisktvDdO7nMWquuPhnR9C39TL8=;
 b=ci7ZN730xYWHRvVawTH83xwmqOxJpjooBlUwGMHftStdz0jNW/uUqhFdBSftBqrPKpLry6Y3he/cV+dDpGNXNRDt88Olg8I9ipBcRmTQqBQ4lkHobW4D9KG4WMz2vAuj1Yn7fVwk02CtE14/d2vlmc8c0zFsZjahRiwr1G9fpnOrSlcmScp0gXI/iSX9X3narIPk4usX8IDAu3+WIo30BBd6lTRtDmSWk3pkA5ZZKpL39Hpkyb+X1a5WXxc+EWy65z9QPOqhx0thEqEfuCAkCARFv98RoM3tgd7ReaTB2OcEERws4mfAdXcmJ5fMDTIA+GsbYBNAujzUgUuB2qf0rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lfOl6aXSJM8O9zj0UisktvDdO7nMWquuPhnR9C39TL8=;
 b=eFFHdCJB22FD507/ufJPZnERt6V0EeHT2nFPact1bNkO7/K4lx7HsahcuLuEEzfl2YkHlc3h3sHoboQwrGAGQKSdrNNyTOVqzn+O586GkXeGW7lBcAxMvnbglQlSbL+2peTfzcrWDMhBYoKzRIAQ59cULOSZpZliWUMtEHic0Ms=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOBP265MB8477.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:46e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 17:57:14 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9678.024; Tue, 10 Mar 2026
 17:57:14 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 17:57:13 +0000
Message-Id: <DGZAOQT96RNJ.1QUVUW1UAMT3C@garyguo.net>
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
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kselftest@vger.kernel.org>,
 <kunit-dev@googlegroups.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0
References: <20260309-cstr-rename-macro-v2-1-25f7de75944e@kernel.org>
In-Reply-To: <20260309-cstr-rename-macro-v2-1-25f7de75944e@kernel.org>
X-ClientProxiedBy: LO4P265CA0065.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::19) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOBP265MB8477:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ab86073-fde6-4fad-b670-08de7ece7617
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|7416014|921020|7053199007|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	MsqzFuDTDYJCrZsryNTB2IRm7E7jbVS0D/cAq96BZs4NjgE1W7mZohh3ggxsS1ld6zb65cm3mqbe+/nu03TrsgQbjGvv8RzfvYXVAViQdOE1M226zN8hymn7aoY0tOMQaVJvYR/yFrlqVsbl5XrJVUja0XutDgdSGSHkoTuhiuB923GSLGXXVQumop3uw0dX4pOM5ogO2qzNDR0UwNyB6EIyXKCD58CrPyRh7W09vKk1mH63AVYoQwoR8m9Zc1ZoN2BdFSbFGCRh42wq9HdllGfuGjW4JjxVvHFs2Wjn95gthYSmGzcXwPzofgmjhWmv+YeCF6pYdN9T0m50r4ceBCTak1tpTp1JsjO3QAZ2xQXtj6rFbq6wnDpW2t9/PQmzK5iDTl5pWA0TkI4nAcime8s+WZum4drYFilqpuuJtZ9XlwpPe7TwteCFa9O7/sHbYP/xRm6NAr8hhgWPfyqYN6KGSzgRhlylzAmocxoS65fnP5LZyjzYLt+vQq5aS1O3lbgYccZxnIoXh9GoXCiQXm2vzXBrKASM62uKxu6VWo7avk1ResIBsyghDbBWWf2uTEpGml61jFqV/WRlhJUJ3BA6+Zv5KmBZx02O6VtCe3DBliUnhBJyIpMa+WzzuPzIAnUtHDYQwNl9klHqxsfPuustyu+mheM9/yqmXvc8B5b+mQR9J2qomGmliugWdiM7iys9Hwd/3L1hr5vJ5NSjAmUDR12xbhDxsYArmGGtsnw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(921020)(7053199007)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3RrbW9oZ05laUhGbXdJSCtramJXTitnWjBoRCtOU21CZlJORm5TakhLWmxQ?=
 =?utf-8?B?YzJ3TVcra1l2UVQ2ekVieTk2YjYxbkVKY2ptdkx2RXFxcmFscmlMckdkRm5C?=
 =?utf-8?B?N1ViS0FBeEg3RDlGYzNLTHhyRmk5U05kTHVuYkxwOG04WGRPWnVKZmhnNzVz?=
 =?utf-8?B?R1NwdTZmejJxZ3pIcXQ3YjE0TzJNK3FHQW9BWHA4ZGU2RndTUU52SHl6TzZX?=
 =?utf-8?B?MVprcmVaVGwybHpYbXZyekkrUktYWE5jRGJocWFhdTN4SnVISm9CRlVhdXB6?=
 =?utf-8?B?Z21zMDlJOUM5d3o5MzhEMmVIaDhvd3dmNUVEUGswNjQrclU1ZDRtUkt6d01v?=
 =?utf-8?B?ZEhQN01GVit6Qk1PdVVNVEsyb01YRHdOb1dZZ3JpNjUzYnI4RU5yTXBPRTFZ?=
 =?utf-8?B?QUROazJDNHZkdnFZTjFPdFJKZ1BCcXRrR2tWSU5OVmU4VnV3ZERRR1Q5QlFE?=
 =?utf-8?B?RE41Y3NlUVFsT045WFIrcXB3eE0rdDdCZFNLMGx6R2QvaTRyaVZFTjdFRCtT?=
 =?utf-8?B?L2QreVJ6S0hQS1hBTkh0eVNuYWZLMENlQ05zU1FtcFN2ZCt1M1hma0l4MWlZ?=
 =?utf-8?B?MGVpUnpLRHI3UXY1MUZTSUxFaDJpSm1XRTI1L3BSaDJ5cmlqcjJEQlh3ekNE?=
 =?utf-8?B?TDcrOFVnTkprTFc0dHFEWFZsd3dDSExCWjdwUWFyeDZYZFlRL24zanVuR0pI?=
 =?utf-8?B?T090QnRBYkF4VEdueTRYdUZTdUhsbDV4cVFTdEVuYXpVTloxamVRVHBmT3ds?=
 =?utf-8?B?L3JVb1dhckN6Q1Q5djdYZDNUU2lxUTdqRWlIa08rbnJPWkZBS3dxZW1oZXpW?=
 =?utf-8?B?UkZjSVRHV2JHUnovMVFqbldWc1EyWjNvZjVRSU1NR2VpaVQyRFF1WnBzQU9F?=
 =?utf-8?B?ODNYcENUNWI2dW5nNEszQ0R5SFdaYkhUVWtVMlFmVExZTXpWY21PVVJuM2xi?=
 =?utf-8?B?bW9Yb2o4cDZwS1JvenE2RUxjdzhJcy9NK043N1cvajFKZ0VnNFhQRjFTdXpn?=
 =?utf-8?B?Sm16dnRIYWRwNWU0b1VLSEVXL0V2N0VlNUVJZHg3bSt1VW1oejdsQ1dwNFFz?=
 =?utf-8?B?Uk81OTFlMCtBbTFSWmRTNlNSRUl1cEJpNDZYOS9UU2VMZVRJK1RvVXl2ektJ?=
 =?utf-8?B?MTRWaXprdDdBKzFmdUFwUzNEZ01ZREp5QnFaVExFS1kwNGZmeWtORHVuTm1i?=
 =?utf-8?B?ZEh2Y3ErRVlOVVU3MjNUdGRNYmJHRVErcDJiWEx1d1I0Ly9DMDNaTWxpaW1O?=
 =?utf-8?B?TkVJbkNjcVphVlpZQUlxcWVWWElDNGY4Znk0ZHpGV3MvcWNITjZhbDM4UEpM?=
 =?utf-8?B?aDE2azNGQ0piNllwdFFNTnRPUTFYc3JhaVdSZ2VvL1hwd0pENEREbjUwWmFW?=
 =?utf-8?B?MWVkTW5xME1yMG01OVZWcFByUy8rQnR2T1ZXQnc0Y1AvODdwcVlQUHdodS9u?=
 =?utf-8?B?R2k4RHRta2t4YTRoU2x2UjI0TGl5ZzhXdUV2bG1UOGFkRGoremE3UTU0ZWR6?=
 =?utf-8?B?alZxdGdVWlp3YjBnZS9wWldTWExDZm9NcFZHaUtTM3lZSyszV0F3aUJydmJO?=
 =?utf-8?B?N3NlK3A0MVVSMXBrb1VnT3paRCt0bGtVN01zazg3VlBnZHJzL0p0cFZPdnE2?=
 =?utf-8?B?MUR0R1pXYVgxS2FIQmp6SE5JSGEwakQ1eXBDbnhESWVRVjg3NFRiWlZDeFcy?=
 =?utf-8?B?Yi9PY3VWVkhGUGpyQU5uQnBWRXJnajE1dDhUU1NuMlg0Szh4NEU2N3VyY0hX?=
 =?utf-8?B?dzlDT2pwTnlpQ0pDcjEwQXRaTzlDOER1cGY5RmVQUzVWYkRPaGZzcUJES3k2?=
 =?utf-8?B?Z1dVbkZLZFJHTW1zajJFcHQ3dkJXVDVOY0JnOTFrYmFxYkErcFBucWVFdGl0?=
 =?utf-8?B?Qm5hT3UzekFXUE9VeU9IUEdhbCtVN3g4ZmRHNE9QN3l2Y2Q4bTJjQmNMejFF?=
 =?utf-8?B?U1BzNWV0WjBnMUExc04yQTBNeVF1RDhPVEZUbnhIYjdUYXFkMlNmUWU1M016?=
 =?utf-8?B?akprZmdVNGFqemxlWDhxMjFJcjhHMHFNOUs3U2RuWm9yQjJ5S3pWRXJ5VEdM?=
 =?utf-8?B?Z1lkRjlHREw3ZHJaNnJQUHNVdmlvM2tIMU5oWTR6SWJFQ2VuSlNTZXpmNjZz?=
 =?utf-8?B?b3dZMk9tUEtjWURNemd6NWwxcDJ6ZzFkRmdWSEJBckxxVjZGMEprUGRxMTZo?=
 =?utf-8?B?aHQ3R1E0VWZPVXBVam9qMUNiRjlmVmtHd0xma0RiN3NFa1RieVJVT2hkNEp3?=
 =?utf-8?B?cGxHbG01NENxc1dqTlI0RWhDTGkzOUd4ZWlvS1g3eFlmNk1qV2xMWkxtcDly?=
 =?utf-8?B?ckZZdVpQQUljd1RZUE9NeC82RFlkL05NQXp0T1V4THB2Zk1xWkFzZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ab86073-fde6-4fad-b670-08de7ece7617
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 17:57:14.3815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h0+fTspyhNDuTnTcRlnWXL9PoS+bxAVuVIABC+RU7qf/dcQbBB4iM+BSXGt4KghIEyg1v94Cc8fOZDBF5FHWFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOBP265MB8477

On Mon Mar 9, 2026 at 5:01 PM GMT, Tamir Duberstein wrote:
> Now that all literals are C-Strings, update the documentation to explain
> that use of this macro should be limited to non-literal strings.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1075
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> ---
> This patch completes the work of replacing our custom `CStr` with
> upstream's.
> ---
> Changes in v2:
> - Drop rename, keep only documentation update. (Gary Guo)
> - Add example of misuse to documentation. (Gary Guo)
> - Link to v1: https://patch.msgid.link/20260302-cstr-rename-macro-v1-1-a2=
69fe4dc3f0@kernel.org

The lint for `c_str!("literal")` now lands in klint:

https://github.com/Rust-for-Linux/klint/commit/69fa3560e28031faa8c5a93e1ac9=
5cc2b3689306

Best,
Gary
