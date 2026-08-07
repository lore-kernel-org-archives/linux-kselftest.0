Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013032.outbound.protection.outlook.com [40.93.201.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC722BE043;
	Fri,  7 Aug 2026 16:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786119778; cv=fail; b=MVAZDqq+2G37s4ni7+vRNt+W6KEif8q0m/dDteeRB6o/9w+sMvbM6GLJIQVZCSRcYT2jM1QSPiAWqmIOH6hNR5m29S65nY5skvFBy4+ahCqknFxPQW5OICiaBtisCD4kVPXXIwda+TI9pA7WsAU4mALaFNafr/UJ11rl4JPImZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786119778; c=relaxed/simple;
	bh=tWVf/LJjRQvPq/31Cvm2WwbNUetcv9MeSch9hz8Qj7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dgBaxSNVDq5XCLa/2/P3BmX78xj3UfJPJXPcxLsRXazvBFewuuiGpbGppTNgCY0inVebyu69aCyDMaJYg63Bqa5SofoFtmsE6ZIYVueUWSajaOC4RdXv+NOzvkXuTdpPHRNxXGSKpjT1GiyM5KqpedsEBH44ZM1M46haPV5bI08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Lxb87/Yu; arc=fail smtp.client-ip=40.93.201.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Lxb87/Yu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Stt0BBKaXJ+8Fr87zJHr7x6ESppMW7BcqaPJR54ro4KHYjfsGbkg+E9XQwVkTcnwWkflS3WFfqZIg98wbdPg/zX09ojvwzCJxF0e9wutfAgScv9R557br0gj/moPMkmrHRAgP1fTbRcUgpAv3ZDS93tNgfFVAZmLkS86Puvlk401riqUfDb6tscy7SIGTTYAVQCL6QvVXT+FSsS+C4lh4vmHew6sGofKNK8CHcu3f1Mni3Ulfv20pw7j+ajKbEMLznW6f19NxaB8cdNmesqgE8yk/ikk7j3M8c+uNMnwG9OeHDYkrzVOhHHBKOwTt9iXbZLLrsYIKkzyjZ53IuEpug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QwdgyTN7OQWDfkx233ODrYc8wCS6At4y+KD4pWA/9Nc=;
 b=IFKcNS24CDlc0AtgIISuI3Jyq9AcTGol1OGYFDs853t7Iq9mU8pFLVXlhNK2V97zEn5bWw/T/lyDkPhheK4wQJLj9zYNa2rnajctNeKOsgkBBi3RyZhcZSbup5LIB10afCbK+VkOXcd8ZKAFVQFhrGsy1d+xchbUX0zsFLzbbztdYeb2OFHZXDTFMi5pFrfWO+PPUb627XwKFUvKj60yjXyOTXF7cV/tXhnqciUJOnfhAfZ2s6CoCnfEJpJJlczr3KJxN4Bw3VjuqDzpZa1R/qbeAaOR+smMlqk/3IYba/9yBypFvxzd54P4h8hBvb5COhTmUZjZDo0dQAkYt+DvVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QwdgyTN7OQWDfkx233ODrYc8wCS6At4y+KD4pWA/9Nc=;
 b=Lxb87/YuEh/eKLIv7fgyh7vA3vS72ygXlD5uA6iAaghLi+uuTYhLXusmWPFBN+U4W45IWiJDUepKl/ca6swyb90vXHpk4POzSrvMP3fPWTuT5orKyDfcuSJZEIIAhwIgItWH7KnJq3XPNkDoOt9+zteblTMbTPD/nnefvNM+VrUaHXSkLOxayN3I/Y0bG2mBV1iheUr5Ngy65Kj5+4bPopoknLXIHSZS9HdN9g+JnA6TUC+gspGX27W1xpvkoEhdBmA0qyjTKf1iTMAOM6cLRXZ9gn+86NOQYrZjsI4sDYv8h+ShA07ZC22Le5ACVkeGlJcaaQEuJiltRxVvx2CL9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA3PR12MB7901.namprd12.prod.outlook.com (2603:10b6:806:306::12)
 by DS7PR12MB5936.namprd12.prod.outlook.com (2603:10b6:8:7f::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.23; Fri, 7 Aug 2026 16:22:52 +0000
Received: from SA3PR12MB7901.namprd12.prod.outlook.com
 ([fe80::6f7f:5844:f0f7:acc2]) by SA3PR12MB7901.namprd12.prod.outlook.com
 ([fe80::6f7f:5844:f0f7:acc2%5]) with mapi id 15.21.0292.019; Fri, 7 Aug 2026
 16:22:52 +0000
Date: Fri, 7 Aug 2026 19:22:43 +0300
From: Ido Schimmel <idosch@nvidia.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Chris J Arges <carges@cloudflare.com>,
	Daniel Zahka <daniel.zahka@gmail.com>,
	David Ahern <dsahern@kernel.org>, David Wei <dw@davidwei.uk>,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>, Gal Pressman <gal@nvidia.com>,
	Jakub Kicinski <kuba@kernel.org>, Nimrod Oren <noren@nvidia.com>,
	Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v5 03/10] ipv6: record the reason for
 kernel-initiated route deletions
Message-ID: <20260807162243.GD2186508@shredder>
References: <20260804014714.4362-1-sigefriedhyy@gmail.com>
 <20260804014714.4362-4-sigefriedhyy@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804014714.4362-4-sigefriedhyy@gmail.com>
X-ClientProxiedBy: TL2P290CA0020.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:3::9)
 To SA3PR12MB7901.namprd12.prod.outlook.com (2603:10b6:806:306::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR12MB7901:EE_|DS7PR12MB5936:EE_
X-MS-Office365-Filtering-Correlation-Id: 41960a7c-915e-4f3d-0bd5-08def4a02159
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	UokjKpOfLjj3cdbIsml+aQtVkthi0S61AGaqkKxjyqidOgjBIyQ7knaoYMTl6siHBfarZ+xelfZSj/Lx8NygYS7voOKdS1Unfj37REi/RruCvN3iPlmnQe0fqI1THYXLaMJUDMcTOFAnzoPxzgYzwbc/9FMuTKbq+0Ot+lruZVt9au8waYxJbOi/k0tJlhCBUrx+/is01dxvn/xqj5fwGlt0WWXJ4XL9vgNZ8sNeOe8Ao0NlzH2l9u5PwuM24Ll12UbO1JixPXE8Sw4X6/oEdZzi6rMt39ILO+uh2pg67qlAJdbOKmCyyGx7D4Np4g9M90ggw81vsexwVhusVCg2/16vpwZI3cC1N0FWgCC2G1mOrErnnHqB3DpSroDcVrOcT0LtzTCPdXpPiK4FWBQAfKnZqZUJHuwa5KqDIThJnndnDwOSmE43gpf0H5TQ40nH+7i+drNxyg/699/IZQOPmMMowUL+deehhaVY77iJGgMQmcAQxaQB+KbaOx2oSlf7bhrJtELV9lrtaBY6DNFIkxlOBHR75a2N3z7I/P8msikS4ohFSi94O7J7YV9911p/STE34DkXlKYdWk+EmsO11RN93sQZDVDZ9CMDPSeiiUb9ACCaRKLj1cQB4kq8Jq7zK1aUSpGGZp4lSQekAS+lpRSD7uL6W62dFMyFT67klw4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR12MB7901.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iytFafM0inHXyYBjzCa+i79lYMPq+fkDWkcAo8zYWrCsP+PqPEVzHdLMEbJu?=
 =?us-ascii?Q?i66ewMhlVu/1snryv4/KYwVQZDAwStzHOUQvjS4CbfFt+4CF/3aaoxVsl8rr?=
 =?us-ascii?Q?qJG+k67SUztPJf/wARrVdwOZgiXkje/NhJroHwiiyRcb5FlVWGD2y1mtyzwg?=
 =?us-ascii?Q?agTHDWOIKaIiH/gZiuYUpZBXS126Yp+8oXRGaQZBTuF1KUu4HEg9v07Hj6r8?=
 =?us-ascii?Q?fdfTtyt2DX2BxLDi4NSnykGs/8/QygWCkUsWmu36toEhtCR6voQnZ1HwRrNM?=
 =?us-ascii?Q?G2yCvYSKLGg5YlVN51a/V5xNhTkHTWwMlBBj9V8jvOMi1gel4crtFjYshKjp?=
 =?us-ascii?Q?Bk2ZlIAsp/Ple0s13hJxqJk21mhv+qvP63jlCJPCCoHAFAjqFgzEmiX8a4r7?=
 =?us-ascii?Q?x35/1ZB8qdxaZ6MPXp6M5Vlpj71hnhpAPYPXVVRWZ49n4xQdRKYuLXCkksqg?=
 =?us-ascii?Q?7xH4BuFw9kqRD7EWsyQh8cvTdmpul/HWKekpPm1Lx8h7x+6ozGy0nNyX5Nds?=
 =?us-ascii?Q?SOPoSYtGqwFzFv0oi/Xxc0pozALhZaKAXXlzA/xAHJYWCj0dBSFjlvsswO3A?=
 =?us-ascii?Q?D1+8b2d4zuOb/o9PfSaepv7lkxmxt3epvEtptl1evtDJRp92owYrp4X7MIrn?=
 =?us-ascii?Q?tQPr9sC3YhSBKBA1qoaYeaDh6DwuN72ZuBi7rRSS22R0UQ38nhXYmxYWPP2j?=
 =?us-ascii?Q?r3Ro7esfzuO83ueAwyHjC6KqMiXsJqiUZ4i289wJ1Pnrhh35uOS82Pcaa2Up?=
 =?us-ascii?Q?kvh8MSeQ/YR5dCnYa5lIZKisjV5Xx8MWd+SJTN372NvDigAtnLKvZRdrQ/iq?=
 =?us-ascii?Q?IiU/lg7LnGHsQA/ehWl5zkgPUISgALhky36Mzwxa3s7a00mPvq2jd0NRnbR6?=
 =?us-ascii?Q?oDkuJoEhXdtWxkWpehXw8yuzD/KWnwBYKWr3nRrdFc78ygrTI0RqlYwt1LtI?=
 =?us-ascii?Q?z+vCI/3xseQzGk3Soo8tzDiasoz3HAM56M5PIlTaJxaaFb9WRaJ3f2w4TFyX?=
 =?us-ascii?Q?x8nub4aqhB97450Vq7pONNw01y8wZkD7iG3V6Nvo6LOyj6EWkHuHaMMoL5pi?=
 =?us-ascii?Q?wdW2qjt0syKG23Tn9M5yg/i0fRew2F8c8vyEwJLNc6l5CtpojESwWQiyep6R?=
 =?us-ascii?Q?yE4Z0nlfyBsEF/GQr+S0JcnU+RVtZr+t4I8+/AjLVHHxRLRoOBWM0guXWLf5?=
 =?us-ascii?Q?YD0CpkZc5VUwPbPAT3DupSoQlUK1LlZLtFZObEczA2gJGJAKM4NLe5VxLkhE?=
 =?us-ascii?Q?iaWtXpj7o0u8tW7DvxNr4Mq7bHBo0NpBl5VNSoq7BLBRWYsKp0/CdkONaGd5?=
 =?us-ascii?Q?WERNwEu429fcV0vdNbFKGooIjs+McT3AFhHduUiombGTJLF5DG/lQCfMN/82?=
 =?us-ascii?Q?0U8mRsHs4RCqY/a83Gz1X5TzknzkSnC6UzWWANfYHxdra1woCZt5z1Un62wE?=
 =?us-ascii?Q?zoD97JlRq1e7JCZNpsHf5e/pMpPwQJTKPVHEii+kirJ1qMYvMQyvUGnWMym6?=
 =?us-ascii?Q?ycztwDLanC/FvKL996BB2reaA9sopvuCJxPXzYJdpUzgVR8N1rJg+a3KCoO4?=
 =?us-ascii?Q?S8gHmDCsLG/i/lZNIWof+IBAe8dPge9n9Un0LDAzBhlhoSobaXnXnF0jU2+9?=
 =?us-ascii?Q?OpTp/XjixiC0D4YxKgAfJp9Bqnn4DsGXi8c79VeHRt4D1Q+vQvY2biPApolZ?=
 =?us-ascii?Q?xW8iEIcQLWcNCF7nmunJDNydjcLpsjExhzmq5JoUrxGpw3jsAy2s1IZBNR21?=
 =?us-ascii?Q?SV1n25c6dA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41960a7c-915e-4f3d-0bd5-08def4a02159
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB7901.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 16:22:52.7417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 14guooI5RGgt9tZVZaAoIgflvozh7mIAE+a43ZhAIeG23o0mDRi0KPQs10ysesJ9mzA7esXYyw90MXnGP0UZfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5936

On Tue, Aug 04, 2026 at 10:47:07AM +0900, Yuyang Huang wrote:
> Record why the kernel deletes an IPv6 route on its own:
> 
> - RT_DEL_REASON_EXPIRED for routes reaped by the FIB6 garbage
>   collector after their RTF_EXPIRES lifetime ran out.
> - RT_DEL_REASON_RA_WITHDRAWN for default routes, prefix routes and
>   RFC 4191 route information routes withdrawn by a zero-lifetime
>   Router Advertisement.
> 
> Deleting a default route because its metric changed is not a
> withdrawal, so it keeps RT_DEL_REASON_UNSPEC.
> 
> Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
