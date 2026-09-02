Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013055.outbound.protection.outlook.com [40.107.162.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCE74AC16E;
	Wed,  2 Sep 2026 16:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366611; cv=fail; b=g61YvutiZ2Qqm+L5fsmicPFyBW4qtQNPhkpc4bADkqSiPAr4fSWSduP0moHTEDVClmejGK/NEhPs7+vQ5dVXQ1eOOXc+avxCwqyrChro+6roUZX+2IOz/IREt7wqMc1fynExOaczm66BKkaS9onp1qCJAs0pGx2/kiPgduymFNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366611; c=relaxed/simple;
	bh=gWEdYKuDu/4dB5gKbqGTTB1T7GcuTQ/U5E7sBGLtDrI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Ha2tsNx6Gz7G4fx2/NIuOd8ugc1Z7TnbF1QIHglF9DWrXKkFfPiuGsgu5agOHpzu2GdkneaOHQNUTJVLXpolTb88/J/kjyAO+zX8A5TLq/NJDSiKWI+i/VZp28WY4yZOS/wJTBEptV66z2SsAeG8N1rmi8NLcSvP783gvtLPQrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=uMD4VgWG; arc=fail smtp.client-ip=40.107.162.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b="uMD4VgWG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qj381ojkWDrya4Y2sjToKalIgErtbRX9KNMYxfcZUf94yHM8HmXZA7q6Wr3tXitOigIiQ+BZk8P0Ne+iIFEFLTFmkWdoFpWZ2WaFqSlZDpdb4pEO7xyZ2FyjEr5xebVKQAxB5aej5bm8jCbxOf8GktQTwhPPO2G45vOg3Ro8soh+kjGSAQxgAPOR+jA7dTvoTBiQUn7BwDILNezbC8Xuq0yIYPmij3QcHw7E8IOtslMQB4Eb3s74Ni/9yLMmYw+Y5zy1SiXGmYRfpltCFVCREvVcEAosojO9yyQxLLA6YiEZvE9Be+FA1Y0csk206koFw52CZpdC+TvUfQW4jSb7Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=me+5A3W+Tg1nI7KSEgoJe7yJnGff9VD3KJSunCtzQNA=;
 b=L1Ng/G5LTygQueX/nnVIUNIpWLYFMJxHdxjLmAdpz8j4WugZW6dwpjv27igX3NXYfnbu6Rj7lSrIOCsXFWoWIKvgdElomIqzOozB2DdtjFAxEhAbfV5vqKj+YxUg+CQI1+uxedRiTX9mrl5krLHWpW4OEF01yeF4hfaMfVJyqb9q1aq2Jz2jbLEpAe7IXEOgfd1vNEIC7dm8zBGSIY5pOyenVFS8d5rwvi926OuitxkDL2AIwbjPJZYbvsEUcbTfUuREQKXWf1WZuK8/MVEX1fxuNtEylonBuv09eMEIPAWTI4FYeDh8vKBUg9CnbE9H0RyOeS6xXsXIFtfNYw7WDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=me+5A3W+Tg1nI7KSEgoJe7yJnGff9VD3KJSunCtzQNA=;
 b=uMD4VgWG/8rmqYtK7/b13Pfj/fNnFMxLDUedxA+HI9XRLhH0de8QefxoLoxsmVV/5q0U2WVFtuiJKA0EXl1GWmy6kXSlexvKmRHPIKoDElvWJJ7hL/zjmwcoNRKYpv/03VHHVPSRWpWFavLu+cKfd0yLxFFqlLX5QietgqS3oAKrYKtKvATtAgauRoBDs1+r3N6pLfe3m8MiCSy8iROFnK4Td4d8IgluvLuZFOq7zRUGHB2pGGM0ENSP8cAFXGMSTIBjzW0tkW3KizADEYeQlX3aXM40ji1PHIw6j/qq3ct3qQKbvkzT+qNpPcCoQVs2O36RnZHi2da4drdG4D3cFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:39b::19)
 by BESP189MB3209.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:f4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.12; Wed, 2 Sep
 2026 16:29:57 +0000
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4]) by AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4%6]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 16:29:57 +0000
From: Yunseong Kim <yunseong.kim@est.tech>
Date: Wed, 02 Sep 2026 18:29:35 +0200
Subject: [PATCH RFC v3 2/8] Documentation: add kcov-dataflow.rst
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-b4-kcov-dataflow-rfc-v3-v3-2-824609f279f5@est.tech>
References: <20260902-b4-kcov-dataflow-rfc-v3-v3-0-824609f279f5@est.tech>
In-Reply-To: <20260902-b4-kcov-dataflow-rfc-v3-v3-0-824609f279f5@est.tech>
To: linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
 linux-mm@kvack.org, linux-kbuild@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
 workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 K Prateek Nayak <kprateek.nayak@amd.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Josh Poimboeuf <jpoimboe@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Marco Elver <elver@google.com>, 
 Nikita Popov <nikic@php.net>, Matt Arsenault <arsenm2@gmail.com>, 
 Justin Stitt <justinstitt@google.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Yunseong Kim <yunseong.kim@est.tech>, 
 Yunseong Kim <ysk@kzalloc.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788366590; l=19782;
 i=yunseong.kim@est.tech; s=20260824; h=from:subject:message-id;
 bh=gWEdYKuDu/4dB5gKbqGTTB1T7GcuTQ/U5E7sBGLtDrI=;
 b=5lqO0E6JeVxK169O27aFYn3uB0PusonOp5/QjviuYdpVVicfgvBlvXapjpVjlucxcPFC9nvPq
 Q6LEbzC/xJMCwFIjcn9ZcD2Tlsg1PDrxaJ4NzNbyynUHM3tbKT/X0G2
X-Developer-Key: i=yunseong.kim@est.tech; a=ed25519;
 pk=nfdmjNawkxBHo9UNdzLNBEht8sYmXp0MYUsa/hwC7vw=
X-ClientProxiedBy: DU2PR04CA0039.eurprd04.prod.outlook.com
 (2603:10a6:10:234::14) To AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:39b::19)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1752:EE_|BESP189MB3209:EE_
X-MS-Office365-Filtering-Correlation-Id: c40d55ba-a7dd-46dd-a5d7-08df090f6d22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|1800799024|366016|376014|22082099003|18002099003|3023799007|11063799006|5023799004|6133799003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	Kyou2pbb1gT8ehFGcyp2aVAHIrfJGXnEu9wYoNtj8C5x9/WDs6djeuKm7Hvp/e0e9hRojyThzcXjtBQGmK5M45LFnUhaE6+MV8nfX4R6I3knnHeflTn3J1NCRPuRGgrsVsPWOnV535MIU4Rf6QHxGKtg6k1164/IOXsDjbMKfOmRYisLr3N+OHnf/4kkHy5iowKiVuMKMDGrgQcGFUFeB++93Y6t3XMhKkxtXGyL9G3W1gqOycEQs6i/1vUEW+x3pWQ17Ktrxcm6xm4wzOgXhynpkoWvymz4dItJV6mAHjgQCbHrHIOtD5sWartZFYX4RA4vH3mNdOjboaRWlsqj/Y9eJxbaak8oLPXiVSuo+Zf3L1I7uET7cLi1fOJDyWS2qccPr0GxvsmBNSkj14DiPijyV1TmDGJ6A4/DTCXYA0sDmRp8J7Zkfd+CuAG17Caahm3yNDG8QxiPN7cUXsAyS9qS7uJUSy1dqFBo87nDnUVteI8r34Y7TZVF5EKlKhNevkQ7/vFmYTWS4ZLV8ghGe4nUqF5yF5MV2zEzjjG8UfsGG/BKjrQbyLmLVB9hWfTB0AXDQ0VRWFcgEz2CbvdNR+fZGs9DOxKQG7zxnRYHbAcfODOcYqxnKecuVmptNVH9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1752.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(1800799024)(366016)(376014)(22082099003)(18002099003)(3023799007)(11063799006)(5023799004)(6133799003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXRlTDVDSG4zaGVlOXRjZll3VWhIcHhaT1daL3NQbzh6N1lTNTFxYVpETUZ0?=
 =?utf-8?B?K282K0h3dEZvNWp4QzhwL0IvejczUjh0SDN1UzZBSWI1OWFnMVFsdlFWU0FF?=
 =?utf-8?B?aVhBSEdsQWxURnU3bUJtUHA1cEdiblRhQzFKR0RMckdQMVIxUXhKT09jakZ4?=
 =?utf-8?B?UCtIV2N5WWMyTjRSSmU4SFFYL1JIdnNhdnAzWnVuVWIzbmJnNGhaV2grZVF2?=
 =?utf-8?B?UCtDUWRsWlNlQ1VKM3l6T2xOakFIWE5Sb09aRmIydDFEcWRGenhrNEY1eGNH?=
 =?utf-8?B?LzR4dDNYMDFGR3Y4OFQzRjk5Z3hYc0ZocS9EMnNrSmpIRSs4Uyt2ZUoyT3Fh?=
 =?utf-8?B?Q1FnVUxYZURVN2N5RkJwUHI1bXNPUXN6d3QrU0VzVWJvVzkxSXRldVlzQ1JF?=
 =?utf-8?B?aUN5bnIwZDg4cVRuQ0p4TkxXUmdmb1lMNUUwVEI5MWV5S3RsMEVtYXNCZk5q?=
 =?utf-8?B?RWZIV1BhYytNL1BGNUxzVklNY3FEdG1HNUZPVGk1WUZ5ck1WampQc3poL2Mr?=
 =?utf-8?B?aUZlVm1IMm1FekJFVEJEQ3JiWDRtYW9CalNqRmYzSHd4Nk1RWkN4Y0FZUWlJ?=
 =?utf-8?B?aWR2REJCR0hUWUh6NHpYbXk3SmxuM1dtY0J0dTVvZWd1UWd3TWxFaXczcEJN?=
 =?utf-8?B?YXNzT3FPcHM0RjNOOVh1RmNwUjQrZ0hQcXJselh5c1RyZ1ZlQnFUTm80VkVa?=
 =?utf-8?B?bDZHZ25DeWhxM0tpR2tUSkw1aFVnN1JOSkJ5SjYxVUdtZEhHcThpYWRuMUhx?=
 =?utf-8?B?K0RaTWhjSitsRUwrdVplSDJFZmFBNVFuWmptYVo0Q0FqU2dsNjNReUc5UDMz?=
 =?utf-8?B?eFk2Q3JxNitVWDY5VVliTFZHNlo3Ukk2dWVDTm9Cd0pwcDZKa1ZhcDdNdHlx?=
 =?utf-8?B?dGpzLysvY2srSmd5d1FVUnZSNTFlT2lnMldhcnR3WVpSYzhoMkJuRVRtb3Js?=
 =?utf-8?B?RUt4a3NJZDlQdFlYcEM2Mi9rWnZVL1kvVEk2U1hCM2NzMnNYL0M4UWlJSzAv?=
 =?utf-8?B?eG5WVm5jaWJVK2kxNmxaN1BQejRkYUdtT2ZVS25aZ0R3ZEFOR0E4NEFETUlB?=
 =?utf-8?B?QjBSN2VUNW5lNTlCSFg3dHV6RjQzL01mb2x1cVdnLzFtUVJHVUlqUWNzbnp5?=
 =?utf-8?B?WWlJWnVIN2NPUzVZOG1XbXgvaDZLQm01V1BrajhiL1AzSHRhS1ZBTUVUZDFj?=
 =?utf-8?B?MHYxSW1uVXlsNXE2czB3UE9KSXJuS1MxQnZGam9QVDhkZWVLM2Q0bFBQK0Zk?=
 =?utf-8?B?aHpPR1V6S0VqQWRKekZidFVJSUZUaVJyNTZWK3k1MHhYSkwrdUhGOWg4SnNU?=
 =?utf-8?B?RWVTWjg5TGdoNWxGd0g4WUkyMmhjRHljNExPVEVBSkxVTkgyL09qZ0ZQMzY3?=
 =?utf-8?B?akRTdmUyNGdMaVVZNE5IMmJac0xsNXk5ekN1UXVEb2xGVzR0SEdTQUpRMnhl?=
 =?utf-8?B?b0RyRURKVkROR2xIWXEzdTlYc1AvbmJPTlI5dnM5QTU2VDA3ZWkxZFdCZUhL?=
 =?utf-8?B?SW00ZVZzZTk4WGNJcW1CY1RIUHE0Y09aUjc0VWh2YjF4S0V6OUVZUjFTNjNG?=
 =?utf-8?B?UFRWWXZSQ0luc2dKN2c1cDI4VE5qOWZaeURWNDFqd0NvWEEwYkxTQjkwaWlt?=
 =?utf-8?B?VUhlakFEWU43V2UxRFkyb05MM1RXM2VjbSsvRmtvdUpVV1NwZW9Jekw3RW95?=
 =?utf-8?B?SytLMWlndlNRd2I0YTBFZDNjMmMvK0NaRUVWR25USVpZeTc3dkNjNWgvSUdt?=
 =?utf-8?B?cVBoNDVtWUhJMW81ekQwZEpCTER5d3kvRXNWcEpmQlJwOTNOa0d1Q3hCMXly?=
 =?utf-8?B?S2JIUy9RTHl5aUQrTVN0K1dMNkJnY0FJY054M0t5R2t0aXJyc1BBRkgwVWtw?=
 =?utf-8?B?K2ZtSFFVbDhNeXpHY2lJUzVOQUFmMHN3ZmhEZnliUC9ZVGtGZXJmdnErRVRP?=
 =?utf-8?B?OS9IekRrUTdFVHAzT2tHVUtPV3dRMURwWDhpWTFFODhxRURnakRreG42d0xw?=
 =?utf-8?B?dDhpcnc1SW5GT3NUc0RqbDBRNzF1eDNUQ2R2QTNoNkhzRS9kT1A2VDduN1FS?=
 =?utf-8?B?M2pxdnlCcUNKa0kzeExIZ2NpUFBHUGdWZ2RSNVZCWHl1OXF5anFkVkVVVnZw?=
 =?utf-8?B?d2E0Z3ptVEoxeFl5SWdGTVRaalBtVE1nVllWeFIydU0vK0JYSk5sSzF6VTg5?=
 =?utf-8?B?b1VJQTRwZTdHS2VHMEZJYmFJVUhuL1R5RHZxSjRPVm0xb1FXZzVqcVdvTUFC?=
 =?utf-8?B?NHJPV2htV2VtMEEzUFlNdVFHU2NhRjNDTi9CWjVVVE80YXFLTFRIUFJSMjlS?=
 =?utf-8?B?S1dFbDJTWFpUc0dUazJzWW43dzE1UlpWckFPb3JCanJhMXBVQ0hPdz09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c40d55ba-a7dd-46dd-a5d7-08df090f6d22
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 16:29:57.1312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lnieym96B7r19RFvmBpEpSpaqRbdWshDgkoQHwUSqnOKPA0qH4zc4BMjUriD5yjfR2JsMhhRepEHXXcP7x4F5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESP189MB3209

Document the kcov_dataflow subsystem under Documentation/dev-tools/:

 - Prerequisites and the Kconfig options (KCOV_DATAFLOW_ARGS / _RET,
   NO_INLINE, INSTRUMENT_ALL) and the compiler they require.
 - Per-file (KCOV_DATAFLOW_<obj>.o := y) and whole-kernel instrumentation.
 - A worked collection example: open /sys/kernel/debug/kcov_dataflow,
   KCOV_DF_INIT_TRACK, mmap, KCOV_DF_ENABLE, run the workload, and walk the
   buffer.
 - The record layout: area[0] as the record-word count, the header word
   fields (sequence, type, value count, size, argument index), the PC with
   the KASLR offset removed, the traced pointer or comparison type, and the
   value words.
 - Safety properties and the ioctl interface reference.
 - Coexistence with KCOV, Rust module support, and the fork/child
   tracing pattern.

Add the ioctl 'd' numbers (KCOV_DF_INIT_TRACK and 100-103) to
Documentation/userspace-api/ioctl/ioctl-number.rst, link the new
file from the dev-tools index, and add the MAINTAINERS entries for
kernel/kcov_dataflow.c and include/uapi/linux/kcov_dataflow.h.

Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
---
 Documentation/dev-tools/index.rst                  |   1 +
 Documentation/dev-tools/kcov-dataflow.rst          | 449 +++++++++++++++++++++
 Documentation/userspace-api/ioctl/ioctl-number.rst |   2 +
 MAINTAINERS                                        |   2 +
 4 files changed, 454 insertions(+)

diff --git a/Documentation/dev-tools/index.rst b/Documentation/dev-tools/index.rst
index 59cbb77b33ff4..541c58cc65ea5 100644
--- a/Documentation/dev-tools/index.rst
+++ b/Documentation/dev-tools/index.rst
@@ -24,6 +24,7 @@ Documentation/process/debugging/index.rst
    context-analysis
    sparse
    kcov
+   kcov-dataflow
    gcov
    kasan
    kmsan
diff --git a/Documentation/dev-tools/kcov-dataflow.rst b/Documentation/dev-tools/kcov-dataflow.rst
new file mode 100644
index 0000000000000..4c023032fea00
--- /dev/null
+++ b/Documentation/dev-tools/kcov-dataflow.rst
@@ -0,0 +1,449 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+KCOV-Dataflow: function argument and return value extraction
+=============================================================
+
+KCOV-Dataflow captures function arguments and return values, including
+automatic struct field decomposition, at instrumented kernel function
+boundaries. It provides per-task, lock-free ring buffers accessible via
+``mmap()``, enabling data-flow-aware fuzzing and post-mortem contract
+verification.
+
+Unlike KCOV's ``trace-pc`` which reports *which* code executed,
+KCOV-Dataflow reports *what values* were passed and returned. This is
+a completely separate device from ``/sys/kernel/debug/kcov``.
+
+Prerequisites
+-------------
+
+KCOV-Dataflow requires Clang/LLVM with the ``trace-args`` and
+``trace-ret`` SanitizerCoverage extensions. Standard (unpatched)
+compilers will not expose these Kconfig options.
+
+To enable KCOV-Dataflow, configure the kernel with::
+
+        CONFIG_KCOV=y
+        CONFIG_KCOV_DATAFLOW_ARGS=y
+        CONFIG_KCOV_DATAFLOW_RET=y
+
+Optional: instrument the entire kernel (significant overhead)::
+
+        CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL=y
+
+Coverage data becomes accessible once debugfs is mounted::
+
+        mount -t debugfs none /sys/kernel/debug
+
+Per-module instrumentation
+--------------------------
+
+To instrument a specific module, add to its Makefile::
+
+        KCOV_DATAFLOW_my_module.o := y
+
+For example, to instrument the Android binder driver::
+
+        # drivers/android/Makefile
+        KCOV_DATAFLOW_binder.o := y
+        KCOV_DATAFLOW_binder_alloc.o := y
+
+To instrument an entire directory, set the variable without a filename::
+
+        # fs/Makefile
+        KCOV_DATAFLOW := y
+
+The build system automatically adds the required compiler flags
+(``-fsanitize-coverage=trace-args,trace-ret``). Debug info is provided
+by ``CONFIG_DEBUG_INFO`` which is a Kconfig dependency.
+
+Data collection
+---------------
+
+The following program demonstrates how to collect function argument and
+return value data for a single syscall:
+
+.. code-block:: c
+
+    #include <stdio.h>
+    #include <stdint.h>
+    #include <stdlib.h>
+    #include <sys/types.h>
+    #include <sys/ioctl.h>
+    #include <sys/mman.h>
+    #include <unistd.h>
+    #include <fcntl.h>
+
+    #include <linux/kcov_dataflow.h>   /* ioctls, record layout, helpers */
+    #define BUF_SIZE            (1 << 20)  /* 1M words = 8MB */
+
+    int main(void)
+    {
+        int fd;
+        uint64_t *buf, n, i;
+
+        fd = open("/sys/kernel/debug/kcov_dataflow", O_RDWR);
+        if (fd == -1)
+            perror("open"), exit(1);
+
+        /* Allocate buffer (size in u64 words). */
+        if (ioctl(fd, KCOV_DF_INIT_TRACK, BUF_SIZE))
+            perror("ioctl(INIT)"), exit(1);
+
+        /* Map the buffer into user space. */
+        buf = (uint64_t *)mmap(NULL, BUF_SIZE * sizeof(uint64_t),
+                               PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+        if (buf == MAP_FAILED)
+            perror("mmap"), exit(1);
+
+        /* Enable data-flow collection for this task. */
+        if (ioctl(fd, KCOV_DF_ENABLE, 0))
+            perror("ioctl(ENABLE)"), exit(1);
+
+        /* Reset counter. */
+        __atomic_store_n(&buf[0], 0, __ATOMIC_RELAXED);
+
+        /* === Trigger syscall(s) here === */
+        read(-1, NULL, 0);
+
+        /* Read how many words were written. */
+        n = __atomic_load_n(&buf[0], __ATOMIC_RELAXED);
+
+        /* Parse TLV records. */
+        i = 1;
+        while (i + KCOV_DF_RECORD_HDR_WORDS <= 1 + n) {
+            uint64_t hdr      = buf[i];
+            uint64_t pc       = buf[i + 1];   /* KASLR offset removed */
+            uint64_t ptr      = buf[i + 2];   /* traced pointer (ENTRY/RET) */
+            uint32_t type     = KCOV_DF_HDR_TYPE(hdr);
+            uint32_t num_vals = KCOV_DF_HDR_NVALS(hdr);
+            uint32_t seq      = KCOV_DF_HDR_SEQ(hdr);
+            uint32_t arg_idx  = KCOV_DF_HDR_ARGIDX(hdr);
+            uint32_t size     = KCOV_DF_HDR_SIZE(hdr);
+
+            if (!num_vals || (type != KCOV_DF_TYPE_ENTRY &&
+                              type != KCOV_DF_TYPE_RET &&
+                              type != KCOV_DF_TYPE_CMP)) {
+                i++;    /* garbage (e.g. reset mid-run): resync */
+                continue;
+            }
+            if (type != KCOV_DF_TYPE_CMP)
+                printf("[%s] seq=%u pc=0x%lx ptr=0x%lx arg_idx=%u size=%u val=0x%lx\n",
+                       type == KCOV_DF_TYPE_ENTRY ? "ENTRY" : "RET",
+                       seq, pc, ptr, arg_idx, size, buf[i + 3]);
+            i += KCOV_DF_RECORD_WORDS(num_vals);
+        }
+
+        if (ioctl(fd, KCOV_DF_DISABLE, 0))
+            perror("ioctl(DISABLE)"), exit(1);
+
+        munmap(buf, BUF_SIZE * sizeof(uint64_t));
+        close(fd);
+        return 0;
+    }
+
+Ring buffer format
+------------------
+
+The buffer is an array of ``u64`` words::
+
+        buf[0]: atomic counter -- total words written
+
+Each record occupies 3 + N words:
+
+.. list-table::
+   :header-rows: 1
+
+   * - Offset
+     - Field
+     - Description
+   * - 0
+     - header
+     - bits[63:56] = arg_idx (0 for return), bits[55:48] = size in bytes
+       (clamped to 255), bits[47:32] = num_vals (>= 1),
+       bits[31:28] = type: ``KCOV_DF_TYPE_ENTRY`` (0xE),
+       ``KCOV_DF_TYPE_RET`` (0xF) or ``KCOV_DF_TYPE_CMP`` (0xC),
+       bits[23:0] = sequence number
+   * - 1
+     - pc
+     - Instrumented function address with the KASLR offset removed (same
+       as the PCs mainline kcov records), so it can be symbolized against
+       vmlinux; add the runtime offset back for ``/proc/kallsyms``
+   * - 2
+     - ptr / cmp_type
+     - ENTRY/RET: the full 64-bit traced pointer (may be NULL/ERR_PTR, in
+       which case the values are ``0xBADADD85``). CMP: the comparison
+       type, ``KCOV_CMP_SIZE()``/``KCOV_CMP_CONST`` bits from linux/kcov.h
+   * - 3..3+num_vals
+     - values
+     - Struct field values, a single scalar, or the two CMP operands
+
+``area[0]`` never exceeds the buffer size minus one and every counted word
+has been written, so a consumer that walks ``area[0]`` words never leaves
+its mapping. All of the above is defined in ``include/uapi/linux/kcov_dataflow.h``
+(``KCOV_DF_HDR_*()``, ``KCOV_DF_RECORD_WORDS()``).
+
+Magic values:
+
+- ``0xBADADD85``: field read failed (pointer was invalid/freed/poisoned)
+
+Safety
+------
+
+- Callbacks are ``notrace``, ``__no_sanitize_coverage``, ``noinline``
+  to prevent recursion.
+- All pointer reads use ``copy_from_kernel_nofault()`` -- survives
+  freed, poisoned, or unmapped memory.
+- An ``in_task()`` guard rejects calls from hardirq/softirq/NMI context,
+  preventing reentrant buffer corruption.
+- No ``printk`` or allocation in the data path.
+- When not enabled for a task, overhead is a single boolean check.
+
+Ioctl interface
+---------------
+
+.. list-table::
+   :header-rows: 1
+
+   * - Command
+     - Value
+     - Description
+   * - KCOV_DF_INIT_TRACK
+     - ``_IOR('d', 1, unsigned long)``
+     - Allocate buffer (size in u64 words)
+   * - KCOV_DF_ENABLE
+     - ``_IO('d', 100)``
+     - Start collection for current task
+   * - KCOV_DF_DISABLE
+     - ``_IO('d', 101)``
+     - Stop collection
+   * - KCOV_DF_REMOTE_ENABLE
+     - ``_IOW('d', 102, __u64)`` -- argument is a pointer to the handle
+     - Publish buffer for kworker/kthread remote capture
+   * - KCOV_DF_REMOTE_DISABLE
+     - ``_IO('d', 103)``
+     - Unpublish buffer from remote capture
+
+Compatibility
+-------------
+
+KCOV-Dataflow is completely independent from legacy KCOV:
+
+- Separate device: ``/sys/kernel/debug/kcov_dataflow``
+- Separate ioctl namespace (``'d'`` vs ``'c'``)
+- Separate per-task buffer
+- Both can be used simultaneously without interference
+- syzkaller and other KCOV users are unaffected
+
+Rust module support
+-------------------
+
+Rust kernel modules are instrumented natively through the build system.
+The ``KCOV_DATAFLOW_<module>.o := y`` mechanism works identically for
+Rust and C modules. The build system passes
+``-Cllvm-args=-sanitizer-coverage-trace-args`` and
+``-Cllvm-args=-sanitizer-coverage-trace-ret`` to rustc via
+``RUSTFLAGS_KCOV_DATAFLOW``.
+
+Example Makefile for a Rust module::
+
+        obj-m := my_rust_module.o
+        KCOV_DATAFLOW_my_rust_module.o := y
+
+Requires a rustc built against LLVM with trace-args/trace-ret support
+and ``CONFIG_RUST=y`` in the kernel config.
+
+Selftests
+---------
+
+Automated tests and visualization tools are in
+``tools/testing/selftests/kcov_dataflow/``::
+
+        # Automated ioctl interface test (TAP output):
+        make -C tools/testing/selftests/kcov_dataflow
+        vng --user root --exec \
+          tools/testing/selftests/kcov_dataflow/user_ioctl/user_ioctl
+
+        # Load a test module and view captured records:
+        make LLVM=1 CC=clang M=tools/testing/selftests/kcov_dataflow/eight_struct_args_c modules
+        vng --user root --exec \
+          "python3 tools/testing/selftests/kcov_dataflow/trigger-view.py \
+            eight_struct_args_c --ko \
+            tools/testing/selftests/kcov_dataflow/eight_struct_args_c/eight_struct_args_c.ko"
+
+        # Binderfs ioctl capture test (requires CONFIG_ANDROID_BINDER_IPC):
+        make -C tools/testing/selftests/kcov_dataflow/binderfs
+        vng --user root --exec \
+          tools/testing/selftests/kcov_dataflow/binderfs/binderfs_test
+
+See ``tools/testing/selftests/kcov_dataflow/README.rst`` for details.
+
+Tracing child processes
+-----------------------
+
+KCOV-Dataflow is per-task: after ``fork()``, the child does not inherit
+the enabled state. To trace child processes, re-enable on the inherited
+file descriptor in the child before ``exec()``. The ``mmap``'d buffer is
+shared (``MAP_SHARED``), so both parent and child write to the same ring
+buffer atomically.
+
+.. code-block:: c
+
+    #include <stdio.h>
+    #include <stdint.h>
+    #include <stdlib.h>
+    #include <sys/ioctl.h>
+    #include <sys/mman.h>
+    #include <sys/wait.h>
+    #include <unistd.h>
+    #include <fcntl.h>
+
+    #include <linux/kcov_dataflow.h>   /* ioctls, record layout, helpers */
+    #define BUF_SIZE            (1 << 20)
+
+    int main(int argc, char **argv)
+    {
+        int fd = open("/sys/kernel/debug/kcov_dataflow", O_RDWR);
+        ioctl(fd, KCOV_DF_INIT_TRACK, BUF_SIZE);
+        uint64_t *buf = mmap(NULL, BUF_SIZE * 8,
+                             PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+
+        /* Enable for parent task. */
+        ioctl(fd, KCOV_DF_ENABLE, 0);
+        __atomic_store_n(&buf[0], 0, __ATOMIC_RELAXED);
+
+        pid_t pid = fork();
+        if (pid == 0) {
+            /*
+             * Child: re-enable on inherited fd.
+             * The shared mmap buffer receives records from both tasks.
+             */
+            ioctl(fd, KCOV_DF_ENABLE, 0);
+            execvp(argv[1], &argv[1]);
+            _exit(1);
+        }
+
+        waitpid(pid, NULL, 0);
+        ioctl(fd, KCOV_DF_DISABLE, 0);
+
+        uint64_t n = __atomic_load_n(&buf[0], __ATOMIC_RELAXED);
+        printf("Captured %lu words from parent + child\n", n);
+
+        munmap(buf, BUF_SIZE * 8);
+        close(fd);
+        return 0;
+    }
+
+Note: the child's ``ioctl(fd, KCOV_DF_ENABLE)`` will fail if the parent
+has not yet called ``KCOV_DF_DISABLE``, because only one task can be
+associated with a descriptor at a time. For true multi-process tracing,
+open a separate ``kcov_dataflow`` fd per child, or disable in the parent
+before the child enables (as shown above -- the parent is blocked in
+``waitpid`` so it generates no records during that time anyway).
+
+Remote tracing (kworker/kthread)
+--------------------------------
+
+To capture data from kernel threads (kworkers, kthreads) that are not
+direct descendants of user space, use the remote API:
+
+1. User space allocates and publishes a buffer with ``KCOV_DF_REMOTE_ENABLE``
+2. The kernel module calls ``kcov_df_remote_start()`` at work entry
+3. The kernel module calls ``kcov_df_remote_stop()`` at work exit
+4. User space reads the buffer and unpublishes with ``KCOV_DF_REMOTE_DISABLE``
+
+User space setup:
+
+.. code-block:: c
+
+    #include <stdio.h>
+    #include <stdint.h>
+    #include <sys/ioctl.h>
+    #include <sys/mman.h>
+    #include <unistd.h>
+    #include <fcntl.h>
+
+    #include <linux/kcov.h>            /* kcov_remote_handle() */
+    #include <linux/kcov_dataflow.h>
+    #define BUF_SIZE                (1 << 20)
+
+    int main(void)
+    {
+        int fd = open("/sys/kernel/debug/kcov_dataflow", O_RDWR);
+        ioctl(fd, KCOV_DF_INIT_TRACK, BUF_SIZE);
+        uint64_t *buf = mmap(NULL, BUF_SIZE * 8,
+                             PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+        __atomic_store_n(&buf[0], 0, __ATOMIC_RELAXED);
+
+        /*
+         * Publish the buffer under a remote handle. The handle must be a
+         * valid kcov_remote_handle() encoding (KCOV_SUBSYSTEM_COMMON with a
+         * nonzero instance, or KCOV_SUBSYSTEM_USB) and is the value the
+         * kernel side passes to kcov_df_remote_start(); one handle per fd,
+         * and not while KCOV_DF_ENABLE is active on the same fd.
+         */
+        __u64 handle = kcov_remote_handle(KCOV_SUBSYSTEM_COMMON, 1);
+        if (ioctl(fd, KCOV_DF_REMOTE_ENABLE, &handle))
+            perror("ioctl(REMOTE_ENABLE)"), exit(1);
+
+        /* Trigger kworker activity (e.g., write to a file, ioctl). */
+        /* ... */
+        sleep(1);
+
+        /* Unpublish and read results. */
+        ioctl(fd, KCOV_DF_REMOTE_DISABLE, 0);
+
+        uint64_t n = __atomic_load_n(&buf[0], __ATOMIC_RELAXED);
+        printf("Captured %lu words from kworker\n", n);
+
+        munmap(buf, BUF_SIZE * 8);
+        close(fd);
+        return 0;
+    }
+
+Kernel module side (called from kworker context):
+
+.. code-block:: c
+
+    #include <linux/kcov.h>
+
+    void my_work_fn(struct work_struct *work)
+    {
+        kcov_df_remote_start();
+        /* ... instrumented code runs here ... */
+        kcov_df_remote_stop();
+    }
+
+Only one buffer can be published at a time. ``kcov_df_remote_start()``
+is a no-op if no buffer is published or if the current task already has
+dataflow enabled.
+
+Limitations
+-----------
+
+ABI argument mapping
+    The LLVM pass maps IR-level arguments to source-level parameters using
+    ``DILocalVariable`` debug records (``-g`` required). This correctly
+    handles hidden ``sret`` pointers, struct decomposition into multiple
+    registers, and C++ ``this`` pointers.
+
+    When debug info is absent or stripped, the pass falls back to positional
+    indexing which may misattribute arguments in functions with ABI-inserted
+    hidden parameters. The kernel is always built with ``-g``, so this
+    limitation does not apply to kernel use.
+
+Struct-by-value reassembly
+    When a small struct is passed by value and the ABI decomposes it into
+    multiple scalar registers (e.g., ``struct { int x; int y; }`` as two
+    ``i32`` values on x86_64), the pass reassembles the fragments into a
+    stack slot. The struct field offsets are preserved, but if a field was
+    entirely optimized away (no debug record), that slot contains zero.
+
+    In kernel code, structs are always passed by pointer, so this case
+    does not arise.
+
+Optimized builds
+    At ``-O2`` and above, LLVM may eliminate ``#dbg_value`` records for
+    arguments that are dead or fully inlined. Such arguments will emit a
+    trace with a null pointer (producing ``0xBADADD85`` in all field
+    positions), indicating the argument existed but its value was
+    unavailable at runtime.
diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 2fc53093752d1..7864b2e7fb476 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -240,6 +240,8 @@ Code  Seq#    Include File                                             Comments
 'd'   00-FF  linux/char/drm/drm.h                                      conflict!
 'd'   02-40  pcmcia/ds.h                                               conflict!
 'd'   F0-FF  linux/digi1.h
+'d'   01     uapi/linux/kcov_dataflow.h                                conflict!
+'d'   64-67  uapi/linux/kcov_dataflow.h                                conflict!
 'e'   all    linux/digi1.h                                             conflict!
 'f'   00-1F  linux/ext2_fs.h                                           conflict!
 'f'   00-1F  linux/ext3_fs.h                                           conflict!
diff --git a/MAINTAINERS b/MAINTAINERS
index b91655b34f0ef..d79e04b108c1c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14092,7 +14092,9 @@ B:	https://bugzilla.kernel.org/buglist.cgi?component=Sanitizers&product=Memory%2
 F:	Documentation/dev-tools/kcov.rst
 F:	include/linux/kcov.h
 F:	include/uapi/linux/kcov.h
+F:	include/uapi/linux/kcov_dataflow.h
 F:	kernel/kcov.c
+F:	kernel/kcov_dataflow.c
 F:	scripts/Makefile.kcov
 
 KCSAN

-- 
2.47.3

