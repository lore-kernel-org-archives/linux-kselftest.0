Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013031.outbound.protection.outlook.com [40.107.201.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90683806A5;
	Tue, 24 Feb 2026 14:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771943020; cv=fail; b=rexPzqWdD+zuN7C9PZnNajyPHANGi8CHFGIQdu2V+/TKxin5Vz9xRChzNJsMPKaQLq9cOqkTvyHXFPvvSKwYaJbhn1wImorgTHzxe7F4yQLibjXbYsMJLmDk6FJ10gs/IpioJtTeDARSY+bZwq8+kqaWLDvjOpQJ+VRJJENKSIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771943020; c=relaxed/simple;
	bh=SUv+Jg7dropWIwvKt9uiYFouc1eD5FJtAdjQZSoaGaQ=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=rvLujH7n7PSvgFU18CHY22ZreE0ZMPyXsizuEQeZqGFPGEzLdfAOu+GJ8vgekuGPZA0sWh4Qp5e3D8hQd0IIZGYmkhE1aSoTdBi0nFfhzznITREU6oYzGg1ELKDpRS7FDRqx45aZ+njl8lOenwd94LOEaXE72+n2LLMxgWGtF1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Sk4Mgn7U; arc=fail smtp.client-ip=40.107.201.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Sk4Mgn7U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cqN2ofaDpzRhIQ4ox5wffMsOCtrFcXg48whBPu2MFN1kzVTnzjp6p5Tcf4DbSOFxKdlxXo+0Kq8bxxz1JRpj3vMi1qW1bqgGwplWZwF2AZkPe9Ok9UDqLiUQ+uOHxI47fbatwFHFNZQdb130Pknl7mTqpSujfO5Ha1NSMIEYGfwtFxB2+YE5etznlOgq2VIRBOu4Zif64BmsEmd2wLgQELGEAg43nSwxrgQDYxHFBICZam+fYsqY5fdMNTMl1XpCO3+izb9ftXSeMhPbWCdy6V/WBBGYAfGPzit/x5QkpEFhs/LhV1XWwEd0K8gi05pma3IpPmshCgq5vUxTXRjaRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n3IC48AxX7f0EFdJBKD1TJdZ9QZSfw0L5Q9pMKLkh9A=;
 b=i32m+a9zSjzeiOw6ayW2s79V+s6ObJT+ur8ze06kYDZVpos5BGg3mHpqZyxlRvfRVMD10eGGQq2GWLeHE/HWMFqpbiHFF7QIxMDUYcXPt13MVt+axKP9UQbDxfWEUf9C397IxGnZDkAorm5lvr51yVrLnOXb0ZFdOfOSvDA0fbDrcfb0GCBBZ2evFLCPxI8J+UakhhCd6bXBPANQW7tdN/OKqdCL8J3gzm/gZr10VsriF3MCeiBUMGfxTdwhNYAEsbzjSXHwU8v1H2SkedIscJud489LiHMEYwHQFaHrdtDug2xM47GG8gUhyDvN1gCyY0ggWn/tzVgsKXao2wrv9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n3IC48AxX7f0EFdJBKD1TJdZ9QZSfw0L5Q9pMKLkh9A=;
 b=Sk4Mgn7U+qkvj58KTgm4xlA1CkiQhyYtk863nn/lSZx8ETiLtfalyxGlNV9lUwoGb6BdDMB8xOu1sN0wQSbDswVDIiJ22XS1p+TOWJhMB5NEB3zI3qW8aQ3u9NeY3VBKD19AxasPmfkFOqCvwCWuenzUJJIf/vBip8QtLBgg35PpQgKeVwBTSbEN8TkCoAsT8z5H9/rNRvmnHIwwxeIejCtIrBCJq3/GmYry8klnTVIAfbf4Biw48RAf+ZXDYAGrSba02E5SZGessAWnvtRP5E9Y0ouqsoxH6KTh5dRHTZfLIc10PO+ORgrWveKkT5cxz21xwQALJT7nKjMugnCyTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB7811.namprd12.prod.outlook.com (2603:10b6:806:34f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 14:23:34 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 14:23:34 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Feb 2026 23:23:30 +0900
Message-Id: <DGN9DHFLUIJH.2RVH79CHOOGXX@nvidia.com>
To: "David Gow" <david@davidgow.net>
Cc: "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Brendan Higgins" <brendan.higgins@linux.dev>,
 "David Gow" <davidgow@google.com>, "Rae Moar" <raemoar63@gmail.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>, "Shuah
 Khan" <skhan@linuxfoundation.org>, <linux-kselftest@vger.kernel.org>,
 <kunit-dev@googlegroups.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] rust: kunit: fix warning when !CONFIG_PRINTK
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <Qrs5fItWst004EC_jGHvnTB2s8QuVM9cnRKIhUuImhaSV8qhL9DmqifhAqLFPSEf1JYNS9J-1hWqvptIARahvQ==@protonmail.internalid> <20260224-unused_var_err-v2-1-337f9359d98e@nvidia.com> <871pia2wcp.fsf@t14s.mail-host-address-is-not-set> <DGN7R1LIMMXA.PAEGCW35B6EY@nvidia.com> <d0c56a90-2583-4f4c-866a-378e7ef8c987@davidgow.net>
In-Reply-To: <d0c56a90-2583-4f4c-866a-378e7ef8c987@davidgow.net>
X-ClientProxiedBy: TYCPR01CA0029.jpnprd01.prod.outlook.com
 (2603:1096:405:1::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB7811:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b4bc6ae-9550-466e-c15c-08de73b04b15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cFh0RHgwUER5R0MxZFlBYkNIQU5wVktXRkwxMEw4Sm1EOUJSM2JsblIxYmRD?=
 =?utf-8?B?NThvdTF0c0p3cHVWaW01ZGZ1NklIek5HNXBqQnQxOXhleXl5Q0huSTBHclo1?=
 =?utf-8?B?TWpSZnBWbzk0TzA1SGN2Z1NPZ0ZTbWhSY1NGQkpGTUVML0VkMVVJWUwrdG5U?=
 =?utf-8?B?bGFDMTJRY1k3dWlrQjB6MTJGTklOa3FTVHk3RFA1UzdKeVhyK05wK2MxRVZV?=
 =?utf-8?B?WEdZK0hLeU5iWkE5dmY4ekk2elhnVTZ2eHlJSGF0ajRCYmhlSmFsaW1mYW95?=
 =?utf-8?B?azlKZ0xVT1hFU2dtZVNMMFhnc3hTc3RldWlpMlhGUk8vLzIxQk0ydXRrTVEz?=
 =?utf-8?B?QnFBSzJNYlhlRnpKNjhFZklPeUw0KzhYVFV4MWM3TjUyRWtwNmxBeTJXdXFT?=
 =?utf-8?B?aWpZU28wQzJCZ3l6OGxIYkFseXZ4R1lGSVBWWFpSRzAwdU5RV0ZENDcvWnBy?=
 =?utf-8?B?blEwS2FqY08rc2xqMU80OWdOSmFQVzB3QzBsNjlZVlh6UlhPWVBTeVBMSnhN?=
 =?utf-8?B?aGZQNTFML2FhdDhCZHRCbEpwT2dMV21wZjloaWZ2MVhiRk8yLzVrdG5EMEUx?=
 =?utf-8?B?b2RSNjI0YkVSUFRuMG5qOWNtRUV6aTZjb1BnWnd4MGh0VWhjQTl6dWdwOHhK?=
 =?utf-8?B?Sm1uM0ZoMERPbWxzK1pDamxjTy9LMjJqb2l3Z1VzM1A2RGdweTUvbHVISVoz?=
 =?utf-8?B?WFJUZnZOMkdxMXpTSlJNRWdVeHBrbFJDbDNQZmtFRkJkL2dGcnVnWWZjYlhR?=
 =?utf-8?B?ZnFibkx4Ti9kbmV6N0RQQXhCd3NiU01jZ01hdzYzeUcrSzIxc0hnYlBLLy9G?=
 =?utf-8?B?alUzdWFOaUJ5Uk9RVmlJb2llZXg0R2J1blFuUFlJR2xGS29ySGlUbXlhSWZj?=
 =?utf-8?B?eGdzZFlTTmoyZEpqTmh2bjJoUUp2eGptSU4wM2hCWXhnV0dvN2NmT01heHhM?=
 =?utf-8?B?N253djZDVzhBRjlSUTNDWkRxSEhmbFJvVVVSeGFSTnphVGpnS2hsdmRzUVMz?=
 =?utf-8?B?R0ltMDIrVHFOZm9qTUw3LzYrL2ZnZy9DSXBOa0M1RVhPZFFoZEdjT0k2RTZP?=
 =?utf-8?B?VzNIWFJlTnJFMGdTa1d3cG1EajBJTXBkSVgyZXRCckRjRDF1NjhVcGplcmd4?=
 =?utf-8?B?UmI1a05ZZmFDTHBBWXNWeG0rTnp0TktkbytJblFoTm9paWhpNkNNb0lyZGJs?=
 =?utf-8?B?NzdlRnZQL1FVTnRWQ1lFRXJWeUNRNHpqam93ZjJYNkFCV08wdDQvblhlMzgw?=
 =?utf-8?B?SXRMVW9HeTMzNTJpVEdVaXF6K0s3eU1sS3Q2dDhNVkF5MUtCekVqb2VBUlZL?=
 =?utf-8?B?R0ZoVWpyMFJRVVFXWkVMbFoxVVVVd0d4bkV6R0dHUFlyWDUrUlMwbG9xclpO?=
 =?utf-8?B?NHVxc1NCbEZOVVAvcW8rU2RVNkRGUnFRS0Z4eWRxZ252NmEyRkx5cTVNMzlx?=
 =?utf-8?B?VmQydWh4V3RSRlBKbll4TGdkNzZXd01JdEdLc0wzUlVIaEJWRmVZeE9Sak4r?=
 =?utf-8?B?ZkxZRGZRK2NqSDRVb3cwQWNQOVdzNFVFQjl5R2RiZGJFNFVwbWRXWkdWbGVV?=
 =?utf-8?B?V09YWXg5aEt3MVd6VlE0Nk43aUd3UFR0M3RCUFQwaDk1UzJMSGNRck5TdDc2?=
 =?utf-8?B?dzBZbkh3bDlsaFVlYllmRno0cmZqYkhlbzY5VC9EYXFudkp1Zjk1V0VLdVRj?=
 =?utf-8?B?SWplY2RXVXg5b3RiekxWelZ0aWZBbFIvakplS1BEZGZIZXcwbFVWQ0hIWG9V?=
 =?utf-8?B?ZjdVa1MyczJNRTNVQUkwNUhyVHhaYjlxTnMrNU1ySnZHb1JKa0FsM09uUmEv?=
 =?utf-8?B?NzRyNXVkRWZPT2NIeUxBL0N3WGRVYzZsczY3aVQ1RG5zS2ZFL1lkVzJsZUJP?=
 =?utf-8?B?QzVNeHdmR0YzVDlFdUNyRVVpeEpFcjIyVjZDNGxPYlhUWnJlOHhJODAycWcx?=
 =?utf-8?B?UkgvWlN6Q2lHaDVUMGo3dHpWSUJTL09wL2hkcU1sU0VIYURvM3VIWTBFSkVS?=
 =?utf-8?B?ZkNDTDE1d0ZOdHd0c1h5Rk1Qc0lzaSttUHFmbXJRWThaOWtpOVkwNmI0NVgz?=
 =?utf-8?B?dk1OaEF4U2ZQQ3ZsYnUxZWtPMVpYZ1hGMitlM1dZbW5UeVlSamtRVkNtVmpo?=
 =?utf-8?Q?G+rQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amhqd1MraGdscUMzTERwbGpJRk1YOEhGQjVjWGhBNndwWDZWc3Q4OW52Syt2?=
 =?utf-8?B?K01SUW1ldkdURDRidzRXekozdUQyYnZQN3hybUQ1Ulo5aHVNVWRUbWxKejFn?=
 =?utf-8?B?MEdlT2hKS1pHUmxDK2NtdDNvSkNkaTdXMlNyeW1GVzhPTnZ5VHRDV24ydnlz?=
 =?utf-8?B?S3JwN2NLbDRoZ0ZGUzFuMERXd1pwcUp6bEF2RitxWUxXNCtBUXhoTm80SURV?=
 =?utf-8?B?eW9FZWRvYS96ME5CTGdTME1sbmFuQUJCVWNZSW5hMG9WZXIwQmNSTW5DWkV6?=
 =?utf-8?B?QWc0VlJXbW83NHFaSjExM1FJQm9IcnRPS1REdThDYTJIS2xOL2k5ajk0Y0p2?=
 =?utf-8?B?TDllYWNNTnFpQWZLQ1RFMzNuQXpOdTZxMXhjSEFydTZoUm1pVUpsN2h2SHBm?=
 =?utf-8?B?R3lZY1dsN280bFg4QjNEWmMvWll2Y3dCemtSMTdiUjdiTzBTRkp1Nkk2QXRF?=
 =?utf-8?B?VmE1TDdTVy9Ea3RxN0lkYzdqVUZsMVZ1eENnR04yeHg3Y3dTb1U5QmxFOUhB?=
 =?utf-8?B?K2dsdit5eEF1Nk9mb2tRZm43SDcwZDdUbFVxS2ZjT2lKNzk4NFgrZ2pHQWpJ?=
 =?utf-8?B?d2FJS0MrWW9IcDNNcEVocG5YTmVWazdtbWNPV3VOdjVVVy9aWjl6dkpvZFNT?=
 =?utf-8?B?a0p0S09lbXA4cEZHTGtxNjZRK3pTcUYvUmZMa09VOXFqdTB4VnU3MmxoL1Jo?=
 =?utf-8?B?Z1NmdlJGMEE1amphekR3MEdWNTExWUJ3SEZISzV5d1g1OFZONGRucWo5Kzkr?=
 =?utf-8?B?cTJ5SDk4RXdvalRNRG03cGw4aU04azkzVFQ0Y25ZSFI0Zkk4M3NscEtGVnNx?=
 =?utf-8?B?R3p6Qy96dmg4R3lyQ2duUlBiSHR5MGs3OENrYTYzeCtnTHhuN0prWE1QWTF5?=
 =?utf-8?B?WXEvbndJNXhjRW53U2sxWGwxWEhXQ3c0T1JYcitkZ240djRHSlU1UDV0bDlt?=
 =?utf-8?B?aERxU2tSbG8vVWJLallCTFZXVWl4bUhseEV3NGRpQzl3S0NtM1pFVmNoaytw?=
 =?utf-8?B?ZGVYem44S1IvSEZGQm1jMmhLVjVzR1Q4ditTTFVKZFhrREpqd0Z2R3llZ1dl?=
 =?utf-8?B?akl0NmJLRXNCSjhmck5GdmNMdllrZC9qUFRYZWdRZjZhZCtpN2V6N3RGcHZq?=
 =?utf-8?B?RHJjd1FiZHpnamY4a0NOL0R4Wm9STVBJaEJGUW9mdEoybG5YbXFOZlltUE5i?=
 =?utf-8?B?dDNxcHN3OVJhZmJnZ3BpZndRY3NwKzJwOUJuRlRkeFJmcjRBTkF3MlNkYU80?=
 =?utf-8?B?WDhQMnJsRHlYdjJqdDh3WDdNbmFyemY5dWxJMGZsd09Ub0RWR0RUM2NxU2Zi?=
 =?utf-8?B?dkVDak9Qdy94cTBLa0NCMjF4aENOZzVMZS9xb1paQnFWWVRtczFwM1JPUHRB?=
 =?utf-8?B?bTZKZHB5OGJwK0lVSXdJZVp4MUs2YUZKT3NWak1vL3hiY28xNWJzRnRtbGhr?=
 =?utf-8?B?Q3AyLy9sQklsQkNwL043dDNkK1Q5MTQ4OFI5WHdXVjJoa3l0VzRuYm9aR1RN?=
 =?utf-8?B?WXI4Nlk3WXJNQ0NkWGRLR2dCYUl1dGpSOFkxUDlDQ0M4d21LUjk3MS9SOHBO?=
 =?utf-8?B?MnBPZ2xmOEtEVXhYM29FWVhSQ3c3U0h6MU5aRkpTKzRDd0Q4cDN6Qld6cXBh?=
 =?utf-8?B?U0ZhdXk4Z1QwemdlaFIzMEZYWURDZkFJQXZYWG9aYmVUREo0Nk1zTUNYS0ZB?=
 =?utf-8?B?em1tbXlqNWFvRndrcit1WUdiUkJteGZVZ1kzZWc0b0dVbnBacVZuRzN5cnd0?=
 =?utf-8?B?bWdJSFl5czBldDJ2L3lXYnZKL2sxdlJ5cWpPQk5iTW5idmdYaWNpbkpnR1hl?=
 =?utf-8?B?Q0JCb2plbVdmUFQ5bEQxb3dVSXYyYXZkS3ZYNDdtQlQ2MFVFc21hMTFsZTAw?=
 =?utf-8?B?TjN4K3lISFFqSXhvcDdoWmwrbUJLYzdzUmF4NWV5Sk45SDlpVjAwQk1rbXMw?=
 =?utf-8?B?Tmw2STJZbXVwUG1LVzNhdzYzcEYrVis0M2VWaHFJOWppT3JtaVg0V2piN0VY?=
 =?utf-8?B?cFM4Szc3aHNTTnJhNW8zM0lpSjR6cUhpcjFDRk13RXZpSlkvRGtzNFpsNExF?=
 =?utf-8?B?Z1lKc0NsZnZCa2dXNHNsOTJYVExJeGhFSDNnMnNIVldORzRIMmpCalRiUXJC?=
 =?utf-8?B?dnJmbmZPQnBGMWZwaWlQdzJvd3g3dmhLSjNpVGk5Y1VpeWhsRk13SUk2WlUy?=
 =?utf-8?B?WDRJQmlJTG1IbHhRVTcraVl4WDBkaVFnbC9kem54QUxyVmI4ak9YNnB3ZUR3?=
 =?utf-8?B?Y0c4NEdDaDVIcDV1UER2S2NkK3hSMVEvS1FHU3hpYjluUzlnZXpnOWlubGFz?=
 =?utf-8?B?cTNyV2ZvMU1ZUkk2bzJQLzVlQmxQdTl1SFRXWDVMcmEzaHNROFBSR0dKYzZ1?=
 =?utf-8?Q?IxzO5d0NV11/Gm14IPfq3YNG4j0bpdWSpWmm0aoLJgX4e?=
X-MS-Exchange-AntiSpam-MessageData-1: Vl03uF4nEoxwDg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b4bc6ae-9550-466e-c15c-08de73b04b15
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 14:23:34.5838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h/8iZMcafda0CmqSIO1IidFh1dgK8MKBxxKdXT50pubum4s2s4uIurMkRCCF6oSO5BQhOOOoY279XRjcdGI3Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7811

On Tue Feb 24, 2026 at 10:56 PM JST, David Gow wrote:
> Le 24/02/2026 =C3=A0 9:07 PM, 'Alexandre Courbot' via KUnit Development a=
 =C3=A9crit=C2=A0:
>> On Tue Feb 24, 2026 at 8:51 PM JST, Andreas Hindborg wrote:
>>> "Alexandre Courbot" <acourbot@nvidia.com> writes:
>>>
>>>> If `CONFIG_PRINTK` is not set, then the following warnings are issued
>>>> during build:
>>>>
>>>>    warning: unused variable: `args`
>>>>      --> ../rust/kernel/kunit.rs:16:12
>>>>      |
>>>>    16 | pub fn err(args: fmt::Arguments<'_>) {
>>>>      |            ^^^^ help: if this is intentional, prefix it with an=
 underscore: `_args`
>>>>      |
>>>>      =3D note: `#[warn(unused_variables)]` (part of `#[warn(unused)]`)=
 on by default
>>>>
>>>>    warning: unused variable: `args`
>>>>      --> ../rust/kernel/kunit.rs:32:13
>>>>      |
>>>>    32 | pub fn info(args: fmt::Arguments<'_>) {
>>>>      |             ^^^^ help: if this is intentional, prefix it with a=
n underscore: `_args`
>>>>
>>>> Fix this by adding a no-op assignment using `args` when `CONFIG_PRINTK=
`
>>>> is not set.
>>>>
>>>> Fixes: a66d733da801 ("rust: support running Rust documentation tests a=
s KUnit ones")
>>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>>> ---
>>>> Changes in v2:
>>>> - Use a no-op assignment instead of the wider `#[allow(unused_variable=
s)]`.
>>>> - Link to v1: https://patch.msgid.link/20260224-unused_var_err-v1-1-c5=
1d805eceb5@nvidia.com
>>>> ---
>>>>   rust/kernel/kunit.rs | 8 ++++++++
>>>>   1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
>>>> index f93f24a60bdd..a1edf7491579 100644
>>>> --- a/rust/kernel/kunit.rs
>>>> +++ b/rust/kernel/kunit.rs
>>>> @@ -14,6 +14,10 @@
>>>>   /// Public but hidden since it should only be used from KUnit genera=
ted code.
>>>>   #[doc(hidden)]
>>>>   pub fn err(args: fmt::Arguments<'_>) {
>>>> +    // `args` is unused if `CONFIG_PRINTK` is not set - this avoids a=
 build-time warning.
>>>> +    #[cfg(not(CONFIG_PRINTK))]
>>>> +    let _ =3D args;
>>>
>>> I think (didn't test) that you can use a conditional attribute [1] inst=
ead:
>>>
>>>   pub fn err(
>>>       #[cfg_attr(not(CONFIG_PRINTK), expect(unused))]
>>>       args: fmt::Arguments<'_>
>>>   ) {
>>=20
>> Yup, that works as well, and I think I like it better as it is more
>> localized. Alice, WDYT?
>>=20
>
> Personally, I have a slight preference for the current `let _ =3D args`=20
> option -- we'll still want to be able to format (at least some of) these=
=20
> messages to the KUnit test log, even if printk is disabled. So in the=20
> interest of avoiding churn in the function prototype, this version seems=
=20
> more future-proof.

Sounds good - let's keep the current version then.
