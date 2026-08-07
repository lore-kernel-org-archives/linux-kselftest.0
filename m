Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010069.outbound.protection.outlook.com [52.101.201.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F4842882B;
	Fri,  7 Aug 2026 16:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786119809; cv=fail; b=bcd21a4ISTNb6bFH7yIsgK4R1pWGeaMeCr4SQxt81R5FwNxxXyYoQTp2Z6EarGNo/zThMNEpqKk7nSRKMYwq/gnogw3Dx4REPofymUzFsBhnbtAbEdyEnAhfNupuXLeIQUMN/y949cUZlWR2kNy8Oy40BlsL6LyHqlTZIv9gVaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786119809; c=relaxed/simple;
	bh=mVdkpAt+YvuHQ9wLPOfNYGfs00I7xa1BeB6+6q2v2vk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=avxvk9+x0B1DoE1dU0FbZLDODvpsIbYuQKIROeBYH7rc3JXH0r2Sl3l5AXKMBI4QUHb9f7HcJMSwmJAhbowhNi3dYmlGenUKeCQ8ITK9oS0TMKyeKrdZ078YnRVFJCiApK53LwxfGEHV0eckVflzoVdEY4X0Vd7jACSxOhxABgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=s1JWDQVN; arc=fail smtp.client-ip=52.101.201.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="s1JWDQVN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wAdNUUDTi/i79bMNkPgvzgJvlV+v+yevkoH9aXQ1X0VJ0xxA/yNIMbWeo5DHlUDU2pKYfTPoI0oQin1SWL98tEzIaZ+8VjPsDkqK7j69OpK+gy1GdXihmhikMeIGBlMqb2sb+crfHLQUJkLux9NNCo8DB5Fns1SeLzYNVKSeiw6oKcxDttv2oVQZmgHErM31agfSju0CTJjhwLMC2ajLJ0VSXXmOTpiJ+kzSf8kdl0Qf3DHUXDyH6r3eMaKgVublr1ZILDvRBz8lMDklByZ/ZdzKox7yD4LLBKYC+tonXUa0Dqs7+qVAbQcPeKg6OZqukwLiflN9slpGXAk2s/qtfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GL51bGRl6Wy125oVa3ER5oQnO/nNQzHovNyCLaZYWf0=;
 b=KTgR+0UOJIkW6hF9pYOd1GRFxqFkZ2uv7WEziNbNij7tI20j09FSLUK7u747PfcyqGjxQ7bsFDZ8k3WnKXa4s61ToBlDL6VFFXmVr2Q4Ky0D8IPgJQ5TfYG47Kh8/cFJw3Wgl6fYniQaG9LXoZ+VO0VhCoNG2pvqDUHa+OymSe/NlKx7lhbhqmyRwCPiU5MVW+eVCOd57M/qxYoMowcH93QICX4PUR+yrdczHErVCYNEioFB1F+PSRmbWw8JD5jMOYNsb7ao2O0AEOWYXfkX1yOjufP3J0mBvLy/iUJjKmDTqfxYE3tVpCxj5xrDC8QZoYGDxPQXqhRzd+8OS4Fg2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GL51bGRl6Wy125oVa3ER5oQnO/nNQzHovNyCLaZYWf0=;
 b=s1JWDQVNozOpbnYuj9qH6Qy8COb8GI+HcvJYk5UnIUVsQhVhHqUfr2PQQhwCNfnlawcOHn3eft/Ad7RrDZF8anF5NReH68VoqwQoyCEVzuP/vyRamT1G5Obr6GEVUK5DSfW8DpObQtDUkcKFEllaI97dPE4n68fHmz7UmwzepYEnRCKOjdHlTrZrKMePh7VvkOfEwaer5RP5BCjvec4TJQeFYx4r/yBGQwBGBNA6LUKa46gT9se/N9rcpOpEHZywv2t+Rid+xHlmUkbxPfQ0nI7KnRHOuekFBmO8x0YvshLG2HsjvIPK1RyZl8YVPhmWdxzTm9+dpXCjRbowdAuZfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA3PR12MB7901.namprd12.prod.outlook.com (2603:10b6:806:306::12)
 by DS7PR12MB5936.namprd12.prod.outlook.com (2603:10b6:8:7f::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.23; Fri, 7 Aug 2026 16:23:22 +0000
Received: from SA3PR12MB7901.namprd12.prod.outlook.com
 ([fe80::6f7f:5844:f0f7:acc2]) by SA3PR12MB7901.namprd12.prod.outlook.com
 ([fe80::6f7f:5844:f0f7:acc2%5]) with mapi id 15.21.0292.019; Fri, 7 Aug 2026
 16:23:22 +0000
Date: Fri, 7 Aug 2026 19:23:13 +0300
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
Subject: Re: [PATCH net-next v5 05/10] ipv6: expose the route deletion reason
 in RTM_DELROUTE
Message-ID: <20260807162313.GF2186508@shredder>
References: <20260804014714.4362-1-sigefriedhyy@gmail.com>
 <20260804014714.4362-6-sigefriedhyy@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804014714.4362-6-sigefriedhyy@gmail.com>
X-ClientProxiedBy: TL0P290CA0010.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::14) To SA3PR12MB7901.namprd12.prod.outlook.com
 (2603:10b6:806:306::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR12MB7901:EE_|DS7PR12MB5936:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eb5982a-c4a2-4cbe-1413-08def4a03349
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|6133799003|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	XZzcCWpTKtNrsoqatfGyc8/IiAnTvy3s9YgWwuyB0IIy2p7vSyDp0CD7ZgXwraLaktvyfELQQIWyljxoKouYV32hqEagRukgXnWe6hGt/b7EgwRnHsM14sNoFFmpd8vHaKPTJ3xH8umqrF9/ws5DWOp/wd8VOOnYxwYMQ9asrP1P+nVsmYs194/nb7EF0zScqaw80KnbAlR2lkhrnsou3C9Fu+oZnSdhrTq5pQKJAPThjVX2ecUuiUmAYq/zUL0PLvcEM95/Dsd4bLXfK8JYEn/ifgOIejFze/W4cF94TPaUodtUXvO53hHa1L20xfdSy2d2IMOZJ+sSgTr+uf+0uOhifl45PY8Y5u+nWP3qy2+/w8NqZcYTjSbxKw0gsRrhXsg9NxdAKy2GBtTbpxgAlaonmbjRK3MPQSq9BhFAHJw3sprm78NiTfFWYLrj10cAtbtELlOZK2+hxY9bA0HRXd97rZdTxOFWNJVJ0cyg951d7aDEfkYcAQb4ASnOwvYCUAQBC1y/+n905bu+dSE1lEBG3uo48T49AeVzUISP5h6jH+0pl2mQy+xKJbhrq/rA3iRUVyTnCQEDbt1RixYkBfw8xEF3ZgHmdO4GeO0y8EnoPoqvs9JuWqYwL9tiTQwhkJlE1NeayBrTc5//S1kzM5tb5g7uXHBn18uaOKApMVY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR12MB7901.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(6133799003)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2nkTbXTI2SphIw+W/jfkmZQzcPOkeKdl7Odz9pumv7c30NY6L8Q0UUlpDhM/?=
 =?us-ascii?Q?1q+fG1Wof8xaooE4x4Dv3vXb6iJ+/h4MyrmYQ0anMcyGWjBU/BYhUjzf2R/A?=
 =?us-ascii?Q?3GfC5R9dyXWvcGkZq8c5kvsRAVEusybF/YWOG+cyY5J/Ovq4i9vd5msqVCoA?=
 =?us-ascii?Q?zJPkQEh/i69BQtQ8Ois5KGFy9h6y+i5m2hEmXKKCqyBVfPD1Mks+naeIMiDt?=
 =?us-ascii?Q?3BfdYnLQcJDceeRWxrGzh5RexWnCitF+evmbssALu19/kEI9uPLUgSC3qYSj?=
 =?us-ascii?Q?bwlRC40gIihhKmfn/IO34mCld3JHSZ6SYODSbb3N+95vOM6USCCEgb3jKU4V?=
 =?us-ascii?Q?HHwMrqDXOYcQvQYhvleFhfFLBc0f/RuK/oHpkoFJmKstD1jgivpL718/Ip9r?=
 =?us-ascii?Q?HIIpmKIrVgn7uL6XBmW4LssrSfTumtRNPknvUmBx8t3O6ZmiBtFOUHmqcaE5?=
 =?us-ascii?Q?vGd8HYnEtY8aNmEWvaui53jowXjQfVrxsqerosyqnxHQXs8SdPuYxWbYk6FA?=
 =?us-ascii?Q?eXzVndbmrOxoR5MpHdob3laCWedC+chh/XDLXf3xs389vFdo0He1lwwqLXKh?=
 =?us-ascii?Q?lpxq/fSeMKTJsVBlZ9MXLCAHbVQ7hstlAFM0BClzWGe9YH6bfyGLM3942Ano?=
 =?us-ascii?Q?JI1MGGdcd0ioz+N+4mYNS8JuJ7eWeqxBMAHtMh5cp+BEo/vtChO0FkiWJeAn?=
 =?us-ascii?Q?6KxCTr4G3GNmT4XB64lVjV55NQblkQS9pG05Ue1qEfm8sXIskdF+49kIMMj4?=
 =?us-ascii?Q?dvYADcfk/8wChwI2IDqmNWzDBqIZ6hqv53AVj1bh142fEUvwoaQE8sI2KgjB?=
 =?us-ascii?Q?6ccj6y4ACMoX6V5AhRuv08DhaBeJ4Pwx9BLoS5ojjXffqESDHTFWVZtImO6F?=
 =?us-ascii?Q?3Pu6z6JxGukpOtnerjpYDkx2nyc8AUsie/uFBt2iLWAwmE0YU+dlVmb8UDyN?=
 =?us-ascii?Q?veT+mZEwTDdjTOQFfc3g7/V+zE47g1D1NjjqSyVXsaLRvz3sDQNJ53hd6Zbd?=
 =?us-ascii?Q?qsL2oauBSXkYTpJLweMSmCwkktplBVmHqygmaicoG3iFv7qN2RHDoDAP3Eta?=
 =?us-ascii?Q?/O1a4t4aho8w7hQ3DxacOmZLwCBJ+EKaeCMuKOnMcKXgJ3tISHYU6tWiqHM9?=
 =?us-ascii?Q?GHSSj1MUTY4S/SstsWiphEiAghpGFPkKlbzkeyzpYBWt5RkXzh8nFtBkbgMx?=
 =?us-ascii?Q?6+ctU9+4DqI4CJ80K63/i45GBaRBhReFgytsE5rYMiXPBcujAzdhh4u5OGrI?=
 =?us-ascii?Q?MN+HWNWq6e+3tySn43RO+fZMWgd1p4E9KrqxLthdvOvLx1Vj75mLm10BLvLK?=
 =?us-ascii?Q?vhfaCOJXERhpid0rhk35v0K1Km66z8oAguP3HFDpYKpTGkcEU4j7DttmR00V?=
 =?us-ascii?Q?FXZK75NwCv0jh2JYtrkn+QWeNlg5plLIF9u11Ca8FBfO/uXCeju/y6fpIixW?=
 =?us-ascii?Q?diTf/OA+daG9nkY2edJDfGjq5OXS8X4gdnRL63C3VBcI/2Yl8Mrbvr7ODHaY?=
 =?us-ascii?Q?WHx2DCs64zaKxkrGqQkLHfVnC6Qj7E07s9O8KELGNTUzbGqdLygXE62FMTM0?=
 =?us-ascii?Q?7qI05x7b354Sd7JN8P5jDh7S7GgDGDu0iGPvMy4ipd3OikjrB6xlo32f2gZM?=
 =?us-ascii?Q?/hWMklcyemiZHmUm9V6pIQMcbPa+zqqA+RuZ/apQKtzs7ZjKqNUhyvLNfxQ+?=
 =?us-ascii?Q?Ja4DtaX5hyHyES9fJhkpSpbhbsRQDk5TaIIfIFoXMnOh8EsrR6LTaSNzA0xq?=
 =?us-ascii?Q?UD4iiqwHPA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb5982a-c4a2-4cbe-1413-08def4a03349
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB7901.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 16:23:22.6681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0V6eJSkpi5mJZOFgRQqz4gtm2egwsD2HIeE6O2CLIFVnxXRgAnL93Q8/h2ZcFTIYePpywoHan9QNXq4tFWVufw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5936

On Tue, Aug 04, 2026 at 10:47:09AM +0900, Yuyang Huang wrote:
> Emit RTA_DEL_REASON from rt6_fill_node() when the deletion reason is
> not RT_DEL_REASON_UNSPEC, and reserve room for it in
> rt6_nlmsg_size().
> 
> Every caller still passes RT_DEL_REASON_UNSPEC.
> 
> Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>

Reviewed-by: Ido Schimmel <idosch@nvidia.com>
