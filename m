Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010061.outbound.protection.outlook.com [52.101.201.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC133F4125;
	Fri,  7 Aug 2026 16:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786119796; cv=fail; b=aP/Qlc99rYnkDIk7/Xyt2St6Bbh5njbHRvhFqZSe0hBiNfqDTXWQOudlb73gSTeUuIMoR5jbVY1K3uCdTYLBmCPSSxQPezL9K1nHOk8l7fT1vL8vZ6NYaFYPH7bp4ot5kocIgRp/Yizdf6M9/YwYFhEJa2TIIwin7XeJE2k+I0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786119796; c=relaxed/simple;
	bh=8DeMqYTutkrE6S6857G/uUGK/hunopTwjk5IGqlBhzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ktkgd7f50tq3fq9svqF2Caz8MFKGcFqZECwjsvp7xyWK2XyVj4JDS/16bmOXps9RJ+8rIPJptKRA8lMzmPEld9HILsaKzieE44adK4D9fkZbC9ZByNBRt4RDZ5EN7++vI0YkyWYL6QgTPDOcUJTqg+5EcC4jN11OfLSTuBAq7hA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=l5rBo9wR; arc=fail smtp.client-ip=52.101.201.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="l5rBo9wR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o/tIuviiA84EkFR9Uc/DZw5h5PfQExBAa+9Ccmo7dK1xj405u6kOlbHKFtSht0k0EoCq6HFK4I7M+TxKsIz0RZcZYUrBXF0hCnT/9WTIivc1r8sszWgvWcxUK60Xur6Smxq+2fUISOP4R6PZBHx4aIcZCkVfcOIFxyp33GZwMkjYfXz8WomLK3wxoHDyaHnr7GfA44hCM/JGaluR8N+Idcd1Zuth2RXZ58SLx7dYaIfJW6jUsFn9hOu8jqhSZmY1iwgQ7VcIKrXJI93ClyU2PNrQd1cVVkHZYNvJY+4tzUUkGc3+fKV1uFPanNAF/lMf68gr5VctJn4JjYBfl5UV6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5C7smof4lTejhvbo89hBVEzomJRwuG3VuOSl3zR0Y0=;
 b=WaQ+CDNrpxF0rD8zujK4H4lTNcpp8XS9Uk1Ut4/LVh2SAeHZME/+wAOlMXiJ94R9v0/oIuEx0b1QkWiIcp3BRPE+QKzxffCcFRzC2/MnovcCR7b/X0dKVMynmbTT1H6QRMoDCbqsu/Z5HJ+K9KG3fV5U+F9jbk9xKf3Tj+8fNlA3KkKSMaTVSPes6SO7M7eF9BjZ3gigzddRMXUupHzKy7woRqPRGJs8cgGJFIFQpcWVFYmjErs1AZBeoalfwdABML0S/pCSpSAV7pl6g61uhx9uSrUbO2IBJMjEzv2BYqINlInTRtKo2w5+s1mPtNFCtQcG0vznSr/LLI9DG2pXQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5C7smof4lTejhvbo89hBVEzomJRwuG3VuOSl3zR0Y0=;
 b=l5rBo9wRduVGufZ47pC/nmCLDUwrPUQ9Kh4fIO/4L2wlM4EhjG75cVp/EUSzoDEIaeUqXUqJbUAWUNzfEcvWhJi02GByIKVyZrdhWuWIWAjUyQAzhAV4wrUHW/VqBi/aeqddg68lXsCLJKeNIaoEQfVO+/LcFGOx4/xfJ8fmtPOKH0Aa/wuBpUvIuM2xLh+CE4ymjGuuhuxGKlh3nvlO+GGWL4Ir2o4crImDDA+omYsQDRAn12wqmBXAsTAsZ5ugnIUaQZefjOHKCMu3bAqRqPpLjaselvRQhRrxMGCbpE+OcTRn9hdVshbgIAcaS58hL8UzvFWPS/rScj36/DDvsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA3PR12MB7901.namprd12.prod.outlook.com (2603:10b6:806:306::12)
 by DS0PR12MB9399.namprd12.prod.outlook.com (2603:10b6:8:1b8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Fri, 7 Aug
 2026 16:23:08 +0000
Received: from SA3PR12MB7901.namprd12.prod.outlook.com
 ([fe80::6f7f:5844:f0f7:acc2]) by SA3PR12MB7901.namprd12.prod.outlook.com
 ([fe80::6f7f:5844:f0f7:acc2%5]) with mapi id 15.21.0292.019; Fri, 7 Aug 2026
 16:23:07 +0000
Date: Fri, 7 Aug 2026 19:22:58 +0300
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
Subject: Re: [PATCH net-next v5 04/10] ipv6: add a deletion reason argument
 to rt6_fill_node()
Message-ID: <20260807162258.GE2186508@shredder>
References: <20260804014714.4362-1-sigefriedhyy@gmail.com>
 <20260804014714.4362-5-sigefriedhyy@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804014714.4362-5-sigefriedhyy@gmail.com>
X-ClientProxiedBy: TL2P290CA0029.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::19) To SA3PR12MB7901.namprd12.prod.outlook.com
 (2603:10b6:806:306::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR12MB7901:EE_|DS0PR12MB9399:EE_
X-MS-Office365-Filtering-Correlation-Id: 890c4b24-33c7-44c8-5d10-08def4a02a48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	dxW0yDMtVzvpJ/TCLLt80lTeCos+qvO0es6pny7TkJ4xR2TAz/gGWYiiwVjrinIMT2w7aq8ASn5TvX6kk5R4BkDNHhgaAdbTNVEd5qU9vigLN7TOYDm+kwqOfWIM4t1sX/aM6+mQ5lT7ebI5ho+h8EwFse3TRBsdm9B/fZ6fnC0Neg8CQVPxpY+0nGr4LU3daG+p7XnZOhqsBOcPuXaKrMT4AJZgNt0xUDLPTDUl4UJO8lWmwdWpK8W0zrFb4rCju4zjzRVOsaCsKIOyIpu83jbhJfaa+dYvGQWBt08QcWTmigs8X+/x6WgYCq+ocOiVbngd1ZK/8x3eBSh37Po2stlOoP0eOzKM6+sqYSfyN51k1PLDeNmI+C7COxEnVkXy+f4cTKhFZaTJAPZqnmowECxgnlbZsTayykc+9SrnnrBse0QvhXsRskGfJQLkDdrmes4K6g4bH9bfhLaClsERDPsjc2rVv8140JAPiIlnUmXSRZX1QOyINhtaHbUorV3jXCk/4gi6cSeskcidrg23hQfPVjnQBDlrkIPpu2xumhVgY7jbzpsGVY8WjFe70OBL6dz70V23ESb5Tnezwue7TkFPhk0U8bv1fD6uPU5PEdFv6quHCA60Wn1qICJJPkbXopTT8XjljugvFVv2Gb1DWvSBz62uZqVs8AlHbraqhKY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR12MB7901.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?toDiXNJ+qd75zEI6uD3iau6YFikyxSPuyHpR2ikA0nN6w6OaJZ7F17Pw1q1U?=
 =?us-ascii?Q?hvDv/OmLnEe5yhjkhvnER2MhvCBZ0LlCdWCinNGD+ctK7sBV1Xl/a+kRY4LH?=
 =?us-ascii?Q?4BhwxJWzaoOJKm1RuBlvzN4EYdqlvgcoY0YnbxXEjmU8sE4UlDfnQdTKBc5o?=
 =?us-ascii?Q?L0TCUjM2d2oU/CPgrYKvEIT5pnJrPrbd7gr0koPc+sc3M0g89YBMZ2gbdMBg?=
 =?us-ascii?Q?I2V3Wh7s3KlWgpIL/MlE3/P+2wBfTfH1a5KRUuq8yj8rFWUFIpSFobwmQiI0?=
 =?us-ascii?Q?Am1tpf9irJ30Tnjh6LtczlOQUeJALu5AahhEY6QWdxSCsfVVuL0MRX6J8SE3?=
 =?us-ascii?Q?rHzfyjrmjepgaFG7ddJLSIL74nInmiHIjsmzwddUF8YcmwVmP0Yndn5INt3j?=
 =?us-ascii?Q?jNxjVADKLiviSO3bL69GcvIwnAuDc/roXJZswez/XXk737UI4N42uwOEu63F?=
 =?us-ascii?Q?ATXkbwFXYgudTS54asiMoiekE+6PT6MrdmPlGleC+e0QJBB53V1KFYKl77PC?=
 =?us-ascii?Q?FZMlmyhoO/roHvSV1oZt+JHxTtZtWDRHURT1ma1SfbP/RlEBVX2CLrno4GSd?=
 =?us-ascii?Q?C1onsGoOHHjNoMgtD57CM6CEsnlSNDOKiN5LpwmM/fnKug/Pb/Ok+fjbEnoi?=
 =?us-ascii?Q?xleRPqMg3jrJMdVDYafcmR1aN38TfWnw3NUwM1JZLxY5yAlecNc+NqOvDBm3?=
 =?us-ascii?Q?CwZacdBBv3XWlXACEgTXlDTcp7xxBQoK83sVchSZ1YdLNQjzkpyBuQLWBRRC?=
 =?us-ascii?Q?2AtJ1XXAvQNmDfUa3aoPP5Nmsp3JHcimFslMHH7xhCDNQjGvQkMVTpcBCFEr?=
 =?us-ascii?Q?An+Hw4SF5MOIV2OQE5XysxS8+09tLmxSVjFfEXvIL0pslfT3OaRGPpxQB7B0?=
 =?us-ascii?Q?PsABY6PlkGR2trsMdq/UQUpTs6bDeSQ+g87QmdRtZnqTm5MSkvOB4T8bV3Qo?=
 =?us-ascii?Q?lBhxqgg6XpiiEPSvusrNyfnpM5qXNoqt4L3oWBzATBs8hA+a5DLmgymBrEzx?=
 =?us-ascii?Q?x4xcWwycHK9g76z6fyv3Z2d16uazcoR9W7felVMvmYo4kwkHO0kx47b7Fc88?=
 =?us-ascii?Q?9SiYqckSdJ6Inu2T0dalG+OGtwZ97YxY1i6Sad635FYkL1TiYvbb6ZJeXczW?=
 =?us-ascii?Q?wWg31gG5JwyAOgAMAyLmeb4qcIFQKlWdX0otrYF5AtTb7YfaIVYL0dwmOd6x?=
 =?us-ascii?Q?AbIShHj0/t2dyVZ64GEVNaCHydc+BAVppN8Bw5hNjVRF4cpBJnNb+sHUU6/U?=
 =?us-ascii?Q?D4y7/HoPA+AqeCUrLq7IR2Zosv8I38/oUDXX8a5e1saXnIGj6hnUooE2rGkH?=
 =?us-ascii?Q?hIuC5k7I4XFe4F8YWAHJ1FNPbO9TFs9cuIDK0WFm4eM1YcVe3dpACCNc3y5R?=
 =?us-ascii?Q?0InLUNMznNSGH4cYrmDYA/P8Nbvzy2OfJRQNHpL9X4JfCWhnMdmqyTacNuax?=
 =?us-ascii?Q?RFIlYF8TaXb7DO2HEsnDknvBWUU6PZeOjruAFZrmjcxi04QyszRSKetGmzr5?=
 =?us-ascii?Q?Wik1TAWQ3eUbHKNagGmAtaT/YdKqDYRux3J7G5a/56Zp5wU8JTgtttU36ufz?=
 =?us-ascii?Q?8/G1J0CZDKjI3ly+Sk1Z66y3igZ4myOPt/O7LUlBeEc8oV5REeHYJUoYgFn6?=
 =?us-ascii?Q?f56Q7IVoIbKsWefSgy5judFTrSt8H1XZXfasCRQJl5OculCjHMIMsZmNW3GI?=
 =?us-ascii?Q?kTo8x1Ipc+DRkEg9o/kDrQF2Fm7n5yNe13qpY6VeL8IrJkJUwJmnXpvZPH+I?=
 =?us-ascii?Q?TfGC4OBBgw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 890c4b24-33c7-44c8-5d10-08def4a02a48
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB7901.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 16:23:07.5657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KmJUyHnVM7kbXB1MSgMYvEVREMKZdlns1OKd7dOtd1eD66n3oy6hBGYQQpXMqYaMu3/hv/t0kIzVgP+QYAiSsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9399

On Tue, Aug 04, 2026 at 10:47:08AM +0900, Yuyang Huang wrote:
> Add the deletion reason to rt6_fill_node() so that it can report it to
> user space. All callers pass RT_DEL_REASON_UNSPEC for now.
> 
> Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
