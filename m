Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010015.outbound.protection.outlook.com [52.101.46.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3903515CD;
	Mon, 24 Aug 2026 09:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787565268; cv=fail; b=N2Hb3VT1zULJH92iFPt7s405SIeWQOSA/Uwo9af3xJUysULjMdEiPA2O/vH5JqUlcdqvidR4Q5J0l40bIIzTnvw68XgAnXAoOCkrer8SbGVcxRZAijhrkt+CHK/dGTo33uZ74O7nFbppXJfjeYlGU/36baJE+eahj2eP6dP0O6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787565268; c=relaxed/simple;
	bh=wzb6tRJHrDVJQGqbEkCo5jb01Nj4kloA91RfnwZIyDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o80ojS7rTU6bE1N0rTIMlhiUE8dKX4+anpVVlohOzSwk6ogsCtICQ6dc3qluPajQvVPc3VGTuqaTBq+AODN0nM6PXEUsFPzR+w8H3xiaWNGDUkAbLF1uIbri1a/HENoOfl3ELP8btZf/WT2b1I7p9UR5eZNaBzTr5PwrrcGX9U4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IVdiyYjY; arc=fail smtp.client-ip=52.101.46.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IVdiyYjY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QUqZm6o5P8rS3uTMmNniau+wK1AHWnd9Rj0cIKqR/ghKC9N8WNGEZw8AICsBC4HPd3k0cJHyC+azpMTaZRqYzL7fZFBtVUrUCSQ4+IWCn9yrqQtr/MhAEwYngPaEUebeO++6HEyuN+bxhag5MrWnPEuBiiz9vBySz3lVosR8daXvuaXwLYRWD0Egplp89akNRixjKvhQQlfyPZdt/vkUHruM0PtMeJUK/Ez5fHDISzuWq9LR/w5mVONlCQdHAnBpKiTxEHNnMY68htDuSnfcGsFulgdQnn9m0adu9KJeGZ4cJ85bnuAi33LD1TBqsuWmxzKG0ynlShc55dz/WpRJ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzb6tRJHrDVJQGqbEkCo5jb01Nj4kloA91RfnwZIyDU=;
 b=RQADQwIOinmpw5FmgJPf4Tpxdk8P6Uo1GaUhXOgm1dmZHUqsdUkejZiipTBg6bGUwXTiQq9A6g17/3WuDkeIRPdW3QRsmjRcSt1lvMy+nGNcSFVzR1tcfowtYu6CTnn+EbTGF18NKblbLGEaBtQlyTdL//uf7b+1yipT2NSsBCAC6C1gxxTZ6yqblkjSOo5Bjg9ZHWmSC3IG5bZhtTQ1qSh2qCWB+9vO2W/kFLUkGDXlWnkVayKUhcE+7MvROVAO/ptnyqpnl4Tnwnuz+p6MDGBrW0ktv0eNDL4aaN4O1wLHHLkVHWuWyxz+o/CVS7WiWGbN0eGgc7oWAdrpe2PHjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzb6tRJHrDVJQGqbEkCo5jb01Nj4kloA91RfnwZIyDU=;
 b=IVdiyYjYhXda3lbzW81gBJvtlapT4hIRdxG/5g2HbwGVIMBpew52LANp5xJUQz5amb4fQfcolP0IqXKMCCY0x3sZNtyWQu57IdIZsw8AwPg+yqtGEHZDLPYKMZmcxnSoEK41x7lTbuNpwdBTMGDn6BULFCzxr3RcWBgOxyHjUJa2IfCxOj4hpdPyKqkIiM03PIzKhQHpmoOJfJXJja41FifLa49Dka2gZiRhMkrLlkkf7jopONVCzw+zUyM91d85USNpxnAr1a9fjv4QDyHV4t5Ec+K/wH5uDqYlxdt+JE2XXc76oK4iuSaoxESZOD2Gz/MTB8m/YIFrPQASDkMAlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHXPR12MB999244.namprd12.prod.outlook.com
 (2603:10b6:610:2fc::17) by DS7PR12MB8275.namprd12.prod.outlook.com
 (2603:10b6:8:ec::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 09:54:23 +0000
Received: from CHXPR12MB999244.namprd12.prod.outlook.com
 ([fe80::168f:599c:f74d:7688]) by CHXPR12MB999244.namprd12.prod.outlook.com
 ([fe80::168f:599c:f74d:7688%4]) with mapi id 15.21.0339.010; Mon, 24 Aug 2026
 09:54:23 +0000
From: KobaK <kobak@nvidia.com>
To: Breno Leitao <leitao@debian.org>
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
Date: Mon, 24 Aug 2026 17:54:05 +0800
Message-ID: <20260824095405.3-3-kobak@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aoXEBXXvTDBimnHi@gmail.com>
References: <20260817022335.3-1-kobak@nvidia.com> <20260817022335.3-2-kobak@nvidia.com> <aoXAdSY_EyPlOOnK@gmail.com> <aoXEBXXvTDBimnHi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0049.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::18)
 To CHXPR12MB999244.namprd12.prod.outlook.com (2603:10b6:610:2fc::17)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHXPR12MB999244:EE_|DS7PR12MB8275:EE_
X-MS-Office365-Filtering-Correlation-Id: b828092d-f06f-4e3a-f164-08df01c5acd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10067099003|6133799003|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	xaNPL85BCvYArdTfosugma9minjTzoB0iNWK+haPhiJ5KXWya3C0knRILsebmbs3lVZqsOkctb0eJAdK+XD7iWFkK6rKJSL7GBMnt3Yue4fLBRt79FsS//8XwHkauGlRGJXV0jLmcn1LGoUJqGA2hfwyQQGM87m63BN9EwySG7GZ6w938BrTX8y9GhY5taDeJZzxXxClCRlzUBrcCUVkwykz2iAoenZ/PbAL+Q8a4q4ruLPk8kuWr13Ib1D0W+1g+294Y/R+2XsX6hBmHRrS8y5CbCXp6m8S92l/hnrJxd1Ksz1JDGWKpoxxCRV8GLnqtYtiIODQkdJSQC0tEzi2GdtjNKhN/+3pcLj8rvpfjrt/JZrfNGNCxqsGyWMuserK9RviPWl5xuXHlYLJ3q8J8z2HOvaRcwIldInUR7FWFySJE0NrYFgmn5iSwd6GJvJ+QLLasuTgBfjwMH9PiZ6XR5cLAVPljHdVzHLS/PVXQRvlMmJfnkx/GXUpFz+ZkUUaDqU7KQENRbv7n5OnAy8Htx8SByDvAqelZ4m/QUR509sjruApEIecDXauqsnDvapLdTRUmYq3bUSC1gZOqN+XnaTZqK2iE61O8ZUIbcgHQQB1mypiq/oxg+5qBMzuDiYoTJXWCjl4RlULBmRodXXf7S/UF4nR79P4PugHvCTqUM0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHXPR12MB999244.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(6133799003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y09rK09mamJyKzMwRlo2cmhHRHpvdTE5MEp0NnFpSFBnSVdGMEJDOG1rUDBo?=
 =?utf-8?B?ckpCZXpPR2V6UkNRcndqMDdaUTgvSjBVQkFJMUo1Q05scW1nVFFFbVAyUEl1?=
 =?utf-8?B?VmFiWVBublk4MW9HL2xjcitXakpPdHJtc2YvWGMwNEE1VFMweEZRQmlTdHJ4?=
 =?utf-8?B?QzY2OFdlYWU2SkowTUZWVEp6OEczckFoYUQ0TGtkaEVjWEF6ejl4cDZacU5l?=
 =?utf-8?B?ZnVJQVhOd085ZlhBNDdpRzZvd282NHUyYUFaY0VVZW5WZXRIM0NOZEZVSngr?=
 =?utf-8?B?QzgzeDY3L1B0R2xvcXZORGQ2dWJvdkloMHNWSkNFTHBsQTBEdmhCeEhZVkw4?=
 =?utf-8?B?V09GSmZTZEU1SkNaNE1QSXdGTnBVOTlwNXNzNTY5WTJ0c0hIWUhwU3NLQkkw?=
 =?utf-8?B?YlNxZVliWjl5cFBmdGFCcDNEanBCQnpHTU1lVDNSZU9BV3lBdEJnSXFHbStR?=
 =?utf-8?B?M3FRVjkwbVBvRFpYVmlDd2g2MTFtcjJkZmJPMDU3UVNpYkZCQWdaME1zVC9N?=
 =?utf-8?B?WHV1K3BqbE9vRk9oRzVVcFZuT0w3bFBWU0k4amExQkhnK1dtNWNIKy9qN0xq?=
 =?utf-8?B?Wi9pVkhPVzhjS1Z3VFBKY3JaelRtNWdSdDZBY1ArR1Z2YmcxcTRMQnN6T2Rz?=
 =?utf-8?B?ZGxzTFgwMk5HQjZWMzY2c2x6YXM2SWpVNkQ3a0dwczZiZVMyQ0xXeE5USDcz?=
 =?utf-8?B?b3l0WFl4Rzd0dVY2aENkSUl6bmNXSzdvQ2Y3NlB1S29veTl5c2lIN2ZvU1cv?=
 =?utf-8?B?Vm5aVHlyOTF2dWlvK01sVzJnd0xGTTYxdEpjTmtScG1DbEV6L3BkRjlYZTVC?=
 =?utf-8?B?dzNHVGxST09rc1NFNDJ6UWxoaGc2U2NpYUVuVkt3YTRJQ3Z1WWdTY1pmQTRC?=
 =?utf-8?B?eDBrN3NoV2piaUpzUjZTcUlpbHZSRktDYlc2dzlJZkt5ZXVUMGc3eFlMbXNL?=
 =?utf-8?B?SXNMVGlDSEJnaWJVQzBJRHI3SzJ2M3R2RElFSW8vL2hPQytkcFlOa2NCM002?=
 =?utf-8?B?a0N4VWVlenJkeW9CVEZkY1BXMGQrb1dXREMwSC85ZWgzZlZaZHdQSENWWDE5?=
 =?utf-8?B?YkQzM3VWNFN5NWo3ckxPb2lDbVdtbVhZOHAxTHFxanlydjBKYWpjLzRFU0hp?=
 =?utf-8?B?RXBHb1RPdTdGOHZlc0RZNzlBZE5TMGFWVE1yTEswc3pBSEdnYm5tTW1RbEtO?=
 =?utf-8?B?MUs2U2VXVFR3MjFOU0JjT08wZyt2VVRITis2dEVCZnNLcTFTQlo1a2dyVFpa?=
 =?utf-8?B?cEZhbTBGR0g4cmhjc3hPTlhOYWt3RXRXc2hKMGk3ajg2c0hFM3h6SFdnR1hl?=
 =?utf-8?B?TVMvcC96OHJaYTBkM1FodlVnSGlTVzFHN2xEM1Jvd0JneUt1Tk5Nc3o0eEth?=
 =?utf-8?B?Vk42eU9ncU1mdGxyZkdoY2tzZnp2Y0xDTlF4RDEzTnFBdlpsQlhWaWtkT0M0?=
 =?utf-8?B?b1VGVEd0R3ptOTVaKzdXQVRXMHBOTmlzeXJxd2FBY1ZOOEtOZVZQSzNjMUxS?=
 =?utf-8?B?Q2FTL2N5eENUNWpUdGhIcllHYU4yN2Z4TUt2SHB3WHlZZ25ld2tEaS9ZU3N5?=
 =?utf-8?B?eFdHNStQUU92angxZkJMQnJkZGx6NHZuRzVYUnlPQ0hVcGtySDNyQ2JTei9u?=
 =?utf-8?B?MW0vcnhNYk13Y0wwcGcwSmxKMThScXlFRXNZa2tpZC84U1pya01vNi9OMDdH?=
 =?utf-8?B?c25uSWUyaTNFdjFqZTdYbzJHK0tCTGZHbVBNQ0xBbUo0YW9qNTFmNWpvZmFM?=
 =?utf-8?B?Y1hBcUFDUCtBL1IrOU9iUTUwR3JUTmViYkhjb1hldDRzdHNHckIwK0hGb2pL?=
 =?utf-8?B?VGdKYjc1TFVTZkdPWFhEVytFN1YvOXI0QVl5d2xEdFU1M1RMblV3UG54eVFm?=
 =?utf-8?B?Uld6NWhqMFN1OVI5QXJQSlRnNkVsWW1TczZEQkRDZmVVWEI0azhRa0VIU3d4?=
 =?utf-8?B?UnIxU2Q3b0NCbDcvcHprUklCWTN6ZnIxbi9CbHpQUXlFWFN4Y1BFUm9nR29O?=
 =?utf-8?B?ME9pdWRIU0FuVU1Nc3Nxc1RWVmNQM3V4em5JWTM4ZEp4Z1U5MzBocWxOVWNG?=
 =?utf-8?B?VlRVOXlJaVVOMnlJRDFZTDZQam1QL1hWeE1RaCtwQ2lxN0pQUmFIaHpraW92?=
 =?utf-8?B?S0U1SC9aUDFiRElRM3ljQ2ZRekl0L3U1Yk96VG5PNm5aSFpIMFRybXpIeCty?=
 =?utf-8?B?aUtKdXhSZVI2K1RVRXpkNkhXUloxQ2p2Q1ZZcnNVa2l5QldSZWU5YjhlSU9k?=
 =?utf-8?B?SnRQN01teitWY1YxS3NVWjl0TWtlYlYxa2NzQTVYZ2ZvcVIyZmhQczVScUpy?=
 =?utf-8?Q?44hYZNGKwcLQ8meGV0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b828092d-f06f-4e3a-f164-08df01c5acd6
X-MS-Exchange-CrossTenant-AuthSource: CHXPR12MB999244.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 09:54:23.0615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gG7+CZOFFrYqvNAmmxEWsrdGllUlRf1eQM3SZBkvm48CCZMUKpXSpiHyAeyQiLhCbRLljk+XhdPohIKSOjMJug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8275

Hi Breno,

Thanks for reviewing and testing this.

The current read result is consumed by cpumod_attr_show(), but you are right
that the persistent cached-value plumbing is unnecessary. For v2, I plan to
return the value through call.value, emit it directly, and remove the cached
fields and helpers that no longer have a consumer.

I also agree about the permissions issue. The register-backed reads perform a
synchronous IPI, so allowing unprivileged reads could generate a steady IPI
stream. I plan to change the six register-backed controls to 0600 and retain
affected_cpus as 0444 metadata.

I have recorded your Tested-by, but I will confirm that it still applies after
these changes before carrying it into v2. The resend is currently on hold
pending arm64 maintainer direction.

Thanks,
Koba
