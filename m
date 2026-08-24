Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010015.outbound.protection.outlook.com [40.93.198.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0399C1FCFFC;
	Mon, 24 Aug 2026 09:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787565257; cv=fail; b=Qs3q8ipOeXRcE2xE7SPh7MvZ6IhWaaYuYNeGuVy6SM0vsAce+CupywqyB3JUr4/WgA+ysbHe/SgE7n8yG7SPDkcqNed3R6c2uQ5G5sM2A/D0QnxqXuha9DrUijth05xeW2sWGDQzWtanTNCUl7uNqNUHAlvNjlYDyIoG/1/T9aA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787565257; c=relaxed/simple;
	bh=QSWgLLiI4c4GEKJz7DajxGufOSFaxd0sk4Bc4zSwe9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qB2UPqkxS9U3rVpTe/4P4mG0nfUrlrLiG/mWDrXEQedrqor/iWDJQSPZTCQaOX35ZOK5IpHl1YfaZ/mmLkU6hJJ/EQgCJvSF9eRnu49uTKmYaOOStBnt3CdqTIcswHoXqem85TkLIbScvBMDlXEWgTyvbfKpEtzrcfrLcpoBaTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RxdI0iJD; arc=fail smtp.client-ip=40.93.198.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RxdI0iJD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lxn/25BZOxKaXyzciflpp9X2/PaAOnxNt2Yj/czaVu4wSGvF5CBd6drFqWqWJvmzw6HZnfpuMRQLL9FqxExjMJWrBNYvwPyiJaubBhqLjxOvK1OFW2+ERwb1cMctL1TmdHDFAS6f5ps1nHaFv90NK+YHBiyBnb7P8GzvBhpjZqdWDbk3SC09p9nkg7tG+0KrGf/uftE7ZntzAgkSxhqxeG/Om/qqH0ep0Mp4KIbMddluK6WnKu2iVNF56CDkkkUItyopxIhXv5v7v2oJ/ruzF+jLpgLz+qP3D9eDM8GkqfgMD5R26Lfd6Y3nXcQoB6TPjn2PeV5zBX+cLifVxdz4DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSWgLLiI4c4GEKJz7DajxGufOSFaxd0sk4Bc4zSwe9I=;
 b=Om8vVsa38s4j+6mD83RoXBisxFVRPlZZ8j2UEQuFaMrYfUubh6OjW5sFfmuH3Dq4EmWEqG0c6w0oUvp0ETGuXFtmTeFTM79u96pbB+R3k/R7tnhxC6GO0VMTzw6s8HMrKsqJ9bxfIQRPRpnZyr5Hw6rydsoqRf/8qQt4DEr/S9O64uWcpwcJD0rtRFscS9kZgfXFcas5ZWDmgTVTV/+fgRRb3+YkhoXr0Q39lXGeWX2Q2HuMOp8IC9mHURt8/AkYTNrxc3SZGXYo97Z6BXtoZ9TuuYFRBL7107p+s7nMz+efXaHFX9otyVbNRn8r7cHCSvgcPu+H6BDZJyuFYa0doQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSWgLLiI4c4GEKJz7DajxGufOSFaxd0sk4Bc4zSwe9I=;
 b=RxdI0iJDG+MK2kLZlxRyDSvOZFHOfzCOZMo66qdvHASukmrwce4zn8/TJLXwq4wRu0jXwEfyTdTtSrjSfdREv40AOJ1onsOuY/PBidihrlJPR88MuLjqzM/BHXcI2d0fGnGmmLH5IDUprTCR/UF9t7AgaPnMBLZRctG6y6p40LCDonFx4HUbhtmJVjX+Twxc8bYG8wHenTpFRXBCVwVsUDDcCCdJ+r7OOO8VYGgioNi6r/e2+j+uZLo2Zzb/YA/aXJMfHXHdvrw+d7K8bpAYGuFRyopd6PfriErAV4InK2ZFVCzl58FKgDxBTVju/sN8lKWQme7ZIU7fQO5iC8Y+JQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHXPR12MB999244.namprd12.prod.outlook.com
 (2603:10b6:610:2fc::17) by DS7PR12MB8275.namprd12.prod.outlook.com
 (2603:10b6:8:ec::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 09:54:11 +0000
Received: from CHXPR12MB999244.namprd12.prod.outlook.com
 ([fe80::168f:599c:f74d:7688]) by CHXPR12MB999244.namprd12.prod.outlook.com
 ([fe80::168f:599c:f74d:7688%4]) with mapi id 15.21.0339.010; Mon, 24 Aug 2026
 09:54:11 +0000
From: KobaK <kobak@nvidia.com>
To: Rob Herring <robh@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Fenghua Yu <fenghuay@nvidia.com>,
	Tushar Dave <tdave@nvidia.com>,
	Kai-Heng Feng <kaihengf@nvidia.com>,
	Rupak Roy <rupakr@nvidia.com>,
	Mohammed Karamathulla <mohammedk@nvidia.com>
Subject: Re: [RFC PATCH 1/3] arm64: add CPU prefetch and cache modulation sysfs interface
Date: Mon, 24 Aug 2026 17:54:03 +0800
Message-ID: <20260824095405.3-1-kobak@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817220750.GB2274565-robh@kernel.org>
References: <20260817022335.3-1-kobak@nvidia.com> <20260817022335.3-2-kobak@nvidia.com> <20260817220750.GB2274565-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0018.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::7) To CHXPR12MB999244.namprd12.prod.outlook.com
 (2603:10b6:610:2fc::17)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHXPR12MB999244:EE_|DS7PR12MB8275:EE_
X-MS-Office365-Filtering-Correlation-Id: b0e46c26-f2b2-4422-4b53-08df01c5a5e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10067099003|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	3XS92DTNOa8MYSb+VcW30gp22U0yDzUgTUhM61XCWRusw+x0/9HB8no1/GaDmdeCsURkt42PqFZi88q/Bpw3ZDKk6MwXbFi2R7kENAM34ovhHbD/ZCVT/NjkLzC+bAlVRXJqxGir6nC4TOxJ838Sr9UrvlpxMM3sWP8HbVf9wKWS6yGYHWY1P3Qzp1N5dwqzA27vh2J/L9FX3Tznm6KD0kMiusj9WsbuhQgHp1qGAtUm7FMEgAB5sOuu3Xnb+s0+ORL4/1sHn2dWxllh8iinXyJDqqy2Cz3B79MatxoaeyuVsCA44uI63S81v5frMiGQviknwSxla4BN2+I/kImrMhPorZeAt/74AkYOQA7OBVKlQjRv036GIkYNBtK9etkBsPlpGt0OVyL+zQwanerTxq+NwEgN/mhRDisvlAepL9zf6XUpSYLOd3qYz+OVnsFZAzBJyfxj0E/WMKj5rYvZ5TRegNbnKe3M5PM05GO2Rs4Gbe8OmErUNmxggqZZvNVFdDrOsTRvqVh5UDyQDc4FiUfKsfvalJSQEvN/2pfkuwXwTAnz6Ylo6bIHjHzQzjQP16QOYbd8KP4Z39P4rlcPNH1v+9Ys9kqT4eJvlpGcb0aYOWf4t/UA1Ks/jyMg0fr1QvAOVjEHSgr/MGvc7aG50JIk2VXFx7mkBYjU9hWKesk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHXPR12MB999244.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1UwemliSnhuN0RqZm1FemdhV1RsTUJVcDl6NXBZOG8xb0w3VWkzTC9LcHdi?=
 =?utf-8?B?dGNYVlNleVllNjZzR2VXSGFISGRhY09uWmFnUTZ5WGJaUWV4aDNUY2ErVUxi?=
 =?utf-8?B?Ry9nckwzOFpaenZiYUsxRHdTVVE4VGFNUFlNazhPOUpmc2V0Y3V6dHdMSmxs?=
 =?utf-8?B?bXh3Wmg1UlpPcE12azBUSXVMU2dGVXdGdDlrZDBmZ093L2Q3endWcjlqNE5s?=
 =?utf-8?B?T2ZTa0Q5S0lNaStHNlhWUk93SHZ2cHRZT1ZTOVJKYzJWVTNkNHZnWTcxSEFw?=
 =?utf-8?B?QUdaM3FXUXdvVHpiemtUajQwQ0RUZytLRHVwK0Z2K0xBVTR5N3EyZW53RHl6?=
 =?utf-8?B?U25PcHZuVStWMEpleXByWFlLaFhQdXBtejlBWkI4T253bzB0eUJJVnU0Tkdr?=
 =?utf-8?B?bXp0SzVYdVJ5WHY2bUpmTWI1OFF0d21UZHZxd3JrTWNneDBXVUxrSVQ2YXk1?=
 =?utf-8?B?K1EvbjF1dnA0K3lZbDE4MXE1MThNY25jUDhTSU1LejcvL1hBVm1vRzBtNlJz?=
 =?utf-8?B?TDhSUHBvcDdNTlhSUXVBS0tOYVl5Z1BjU1lnTklMa1dRNlRYaXBzUDBtZG1R?=
 =?utf-8?B?bndBTXYxbGM1cmFBdnF0TVJiMFR6bzVFamg1a0lRMDFNSW1CZ0wxYVBJc0I3?=
 =?utf-8?B?bzNQcWRRVER1UDRndFEwR2xmL2FLTjFFYUZYTFdFK3AxOUlORmdPY2hiOWFB?=
 =?utf-8?B?aGVSdy9EeWJPeE9FUEVvbW1ZUUpzdG9RYktZaHNyYjNGQks4eTNqa1VsV0pp?=
 =?utf-8?B?L3d4cWdZTEcwRlZRKytUUWh6SktCbm9NMHdRbUc5K3hjZnlKSjA2dDNEQVF6?=
 =?utf-8?B?VUs3dnZDOUV1QkVMVTZLSnRGdTRkMkpVL25wTHlFSWRCaXhXOFgzbXNqM0Na?=
 =?utf-8?B?TFFJNEZzNmNCWDljUFFGbVRLRWFQNzNCcTlNWXZNcnBmK0pCeFMvRUtSOHFE?=
 =?utf-8?B?aWlyVFVTNkRxdGcwVHNVQkppZjkrMEpsdVpWVVI5TER0NWRPZ2RQNlJRK1hh?=
 =?utf-8?B?dEx5c2haN3lFdnRULzRET0JCKzRPUS9qR3dHQmJTazBwdzVtZlBRayt5bXpv?=
 =?utf-8?B?QUxkMG8zbnNwUTlZWnJJM3hSYTJ0MFZEOENLZk5uSlB1Mi92dVovQlBYMVYw?=
 =?utf-8?B?Tm1QUXRDdERXYkZTTDR1Wm5BenBpbWg1ZXVtS2prSGdPb2dmK0phVTBaV0VP?=
 =?utf-8?B?SDhicjV3Vk9DQ1gxOTA0a3I2V3NQb1M0dWIzUDFoNlQyaHJxdXFpMTdUcER5?=
 =?utf-8?B?WVpnSHo4ZW5RMW8xZGNuWlZkM1I3YktaMzFzUE9YWGp4T1UxblE0NkZBYW5O?=
 =?utf-8?B?WGdvaWs4NHFycFNGZjBtMFVPOVFpYS9PSHUrbEZua0thODhUeHprMzBNZGVa?=
 =?utf-8?B?UFZWSHpqMHV4NjE5RlZJdlRpbHg3RGdMOVNLRDAwaHZsRnFTNVdBVHFnaU55?=
 =?utf-8?B?dFc1UE84ejB5NGRabjFiSXdycTJGN0RUWDJrYW9McnVYcGowaGdCM3NNeVZF?=
 =?utf-8?B?MnBSVEhyMVZKMnF3VXNldjZmN2EvU1R4MXhaRnAzSG11WFhreGtEZFc5bFMz?=
 =?utf-8?B?SVkyYzlXRHIvMHdzK2NlbUVaRmtjS3cxYnhjaE9OUmNnOG1lNUV1M25QMGR4?=
 =?utf-8?B?TzhIMEVnWVZXQno2WVNmWFVraXd1alh5amxNSk9kWlNvSm5KUUNnanVBMkxG?=
 =?utf-8?B?MVM5VTFpeXo5R2NhR1M2aTB4VEN6WDVucUprR3MvWTZibmRQZUJmNHZ0WlU1?=
 =?utf-8?B?Q3FnYUtieVVpRmlwOFQycGVwTnBOdlpBaUxaUDlVdEE5eFVXc09ZcnIrb1BQ?=
 =?utf-8?B?a0F6a0cvY2dodVJTOGVleTIzQktETDRGYzdNM1diMG9QOFFCWktwTUZBQVlK?=
 =?utf-8?B?cFROU1NHMXlEQmpmaXFISmgyTXVGdVlCR2syVWQzWEVTcEh1R1M4Um5HbURL?=
 =?utf-8?B?dkxOYk5GOTNHT3R3cG1UdFdwazZoL21Qc3IyTjVjbjNaaGNFeGQxenNSdi85?=
 =?utf-8?B?L3NTLzRyYU1QMkpaOGJGcmovQkxNNk9kTWVNWEUvVlYxRVIvZmU3K2lSVHAw?=
 =?utf-8?B?WXJ2Q3ZzK1JJMGt0dUdUT3ErcmUvV2Y2ME9HZFdWUmhTTnkwSXJxb3hWTWRy?=
 =?utf-8?B?czR1TEQ1TlBEclRzTFM1UnYvODU3SnVWbi8rNWI4TURTYXhId3RqUGNhQTVE?=
 =?utf-8?B?dDVoSEdEcFlaWGhqaU54ektLUU1NNEhCd0g3ZHRXVGR3SnFsTXNuVHNHaHNW?=
 =?utf-8?B?RVR4bk5EQUc2Zjl1NE4vbEk4a2ozU1I1aENJVGlPbXp3Szk0Q0V5UzRYNWhG?=
 =?utf-8?Q?Vowj9nIj7iSTsA2GRn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e46c26-f2b2-4422-4b53-08df01c5a5e7
X-MS-Exchange-CrossTenant-AuthSource: CHXPR12MB999244.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 09:54:11.4758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9syy3SXgLtTF1at/DALxNncxdJxmDctBJBmcD5dn0eQ0CPJuXMTeDzWglwezD/wrH52mHyFo/moBEfPY3hpVYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8275

Hi Rob,

Thanks for the review.

I will remove the obsolete GPL boilerplate and retain only the SPDX
identifier and copyright notice.

I also understand the broader concern about exposing
implementation-defined controls through a userspace ABI. I will hold v2
until the arm64 maintainers provide direction rather than continuing to
refine an interface they may not accept. If the preferred direction is a
different abstraction—or no userspace interface—I will rework or withdraw
the RFC accordingly.

Thanks,
Koba
