Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011068.outbound.protection.outlook.com [52.101.52.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1008C509F19;
	Thu, 15 Oct 2026 12:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792067495; cv=fail; b=E7wHfVruhYjtpza7hpeJqVij3DutsVuZBd1KaDIkRajKpVe4D04fekPz8HU2YbPJscqEK+IyGyr+jg7vkfJlV5LanWJJVXbWmQ+3Fu6Tc2yXlM+7PCyqeDHVeiT49C9Om/6wNtzbwQ701wtjFVPItHYEc0pVrunSEcDki/GSFlo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792067495; c=relaxed/simple;
	bh=DHd6PHDsv1AeQFaKwprPIZpX5XnXZ35YX1glDKQmwcg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZerE6KGCEAI0/7rp3dcWNZEW8B0bEEgbS184Qh5Fe2T7BpCOYC4aCwBshtk44LpIlAjDdHPpx0kYh8EdqOBRaaE6wyO8OXk3FFS9Fx+UopTO8LD/Wqj+HDv1GTCsrTJMf0rAM4DBsXMvqBd11LTZ1oGaCssJMhrsN39Gncrj0Q0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Sv/Z+2QW; arc=fail smtp.client-ip=52.101.52.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Sv/Z+2QW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V5TzQecYkhNFIsNQpXQrX6QDrYZlvIqogJqdr7m5R4cJZoy0YWpnVmFmxB0ul8u1+Kd9rT9QzU3GyKSvqML73NpaAAzYI6g6r1DUtthfah5MLMP2rSD2wqi2/+VwEgY2Y0tokiwmTWBnN/M9nYNf2QmRA9JVoa+qohnQvQzINfzLab735yzo3UkpCe+JdJnRSMEpzBiK/Bb7dQp9kps9xijxlAzkxumEEZxc1pokK6PgkyfYMQfzWAjhAroTcPvLMEpd+u7gm9RObylcaFcMR8x84axVurGXwt1Ozl8IqY/+tlS0CW341nui7h/m2ddqJlEC/BykORrVmcuNk+v7LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHd6PHDsv1AeQFaKwprPIZpX5XnXZ35YX1glDKQmwcg=;
 b=JI/56GLNLyJIs4EQwF5zNVba2W6kRBDkzAfPeZrav23fTsUyt0DuJxUjI8iD4imdZnkKkQ/8MJUcSnHBbTyKP4/u4FDsVxpsA/r/KpvzBan0/EeFRL1gkvJq3CDI4/WlwqxkEAXrWDgqYgC3GZlE3soG4kxAvUOE4nafl8Dp8GNrLsZc4mFI3STIytOzob+xSr+8y+Ut6gfvadAXcN2eQlZw4t39qsPBzEmzAek1xxygb8x+NaDNtsnwaYVDG9MIiCCIMuVdm9MJwKWXHthwsJ1ii4Vh5mB6ZFFAUPy2PeUr+X4en12M5tPdcM7NEQWMremoyre9eVqJVdkuovY2MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHd6PHDsv1AeQFaKwprPIZpX5XnXZ35YX1glDKQmwcg=;
 b=Sv/Z+2QW4ow1/5j6rBGWUrLl1B5P4DdCPkjpHGP9/GScbateTtS0hxBdoTzlBNAeQGpnDqGuSlezvXCfBidoZmrENcEIfOBaMSZFhEnAHe1puoaIOMKkKCSeG5h6HFeugwi7Q5H7z1OjdlVj7MjFOplgVyiWY6yNVFDWaPhKNUyixtlVOpBWa0TK5H2i3Gq/wJ+8FQKcIkozkcPcS017lXAuYNCu2Ju/ZpJAy8juHBsyn1UYjxFraRrHOp2s9nE+u9IWyoFQHmxk4a7otxB0LRmyJuaOXY8BoJOpzHnpNAwJji+5nb5DmySRurRU1lOyCLuoE8EqO+ob63XA2yLOgg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHXPR12MB999244.namprd12.prod.outlook.com
 (2603:10b6:610:2fc::17) by DS0PR12MB8197.namprd12.prod.outlook.com
 (2603:10b6:8:f1::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 12:31:30 +0000
Received: from CHXPR12MB999244.namprd12.prod.outlook.com
 ([fe80::168f:599c:f74d:7688]) by CHXPR12MB999244.namprd12.prod.outlook.com
 ([fe80::168f:599c:f74d:7688%4]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 12:31:30 +0000
From: Koba Ko <kobak@nvidia.com>
To: Breno Leitao <leitao@debian.org>
Cc: Will Deacon <will@kernel.org>, catalin.marinas@arm.com, robh@kernel.org,
 corbet@lwn.net, skhan@linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 fenghuay@nvidia.com, tdave@nvidia.com, kaihengf@nvidia.com, rupakr@nvidia.com,
 mohammedk@nvidia.com
Subject: Re: [RFC PATCH v2 1/3] arm64: add CPU prefetch and cache modulation
 sysfs interface
Date: Thu, 15 Oct 2026 20:29:06 +0800
Message-ID: <179206734688.387067.11244555739178101423@nvidia.com>
In-Reply-To: <as9HWuAhOGMfH1Ty@gmail.com>
References: <20260825181701.3-1-kobak@nvidia.com>
 <20260825181701.3-2-kobak@nvidia.com> <aru9Rf7BzW3-vcm0@willie-the-truck>
 <20261014061745.40032-1-kobak@nvidia.com> <as9HWuAhOGMfH1Ty@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0026.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::20) To CHXPR12MB999244.namprd12.prod.outlook.com
 (2603:10b6:610:2fc::17)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHXPR12MB999244:EE_|DS0PR12MB8197:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f0bd750-2b31-459f-a87d-08df2ab83d22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|18002099003|22082099003|10067099003|3023799007|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	ACKwo8zFygVV3dfWvmctVZccoQiliWTg1wCS9NcXEvRWzyMDTHdnvGn3OFwvEF6va1nTytm97cQEeooFvTg4b55zXUcXvNsFsXVD162LD7NKusrZUsjAURRAZ3ZyAtk8mF6TVaEzfMEL7JJLTUzqLonfpKqrCzRBpfjdE8LEC/mgC50RuuOZopOa8r4I+2VoMDa1l6PjmZIYAxMD/8EuwYXoTKWexWMCgICxVExsqSzDN7TNUNTXeXTZ7nhgeZbSDNt3WCijsF7pzg9PTMJoeoQMOj1KnCib2m96SMsx+0ikWfdmkWLwttzSpMYFf90Pg9sHCd3FQ2MHrJFklne42PMAxtDjhAaZOg/qMAaCXOwXHN4Gn873hCfUivyYUaqT+pLvD8kY4A5DclA0h/JgCBPwAsxCaGU6LtDaLmTpOjZmzTEo8wQMv59tECh4iMQ22B/GDw0vHO+UGSn4PhFWzGj+AQmb7HhRJrM6UoTXvE+czeBhE+Hj9BvaIRu3Bhqj4vsVet8uIVvsFgYV7dkQX6hPPyiVixBGNee38oqHs22Y134j4O5i+8c20pHiFogMmtynf4fK4orvJOX/uzsJT3eruug6cfi5Bcvzr0LNR3uIxJoqzrvDI/930BZQXROSbaTJLyR50gtBDo23YzBETmZxWqz64xeGPTHyLYSAj1c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHXPR12MB999244.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(18002099003)(22082099003)(10067099003)(3023799007)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IvfxILdWZOcob7DGZMVETLLEkK7Z0lDx5rOuWartxDq6mTFhStB4TWFq2oaC?=
 =?us-ascii?Q?iJKBFo2m2j6RhWRMtUytRS0Yt8R07sDEPMIaPh/mkPz1QZNUJ1pZLIiUgZ8S?=
 =?us-ascii?Q?Njs6cqCRp858WmvSKX1burvyjeh8NX0eFL1MMiY9/dCrwfxEQF4r9cNj7wHv?=
 =?us-ascii?Q?xk3yKVLBFbtLLU8w8jtS/J8tK8S9Q4U49Z6VR9mES7Jq7/IsEZeY8ZgOgxbC?=
 =?us-ascii?Q?lrugOQMi7f9cOF30xdpYJFPFjgVcnceHwcqTzFqFYWl58E0CTesoLUdT44AF?=
 =?us-ascii?Q?3qJN3gsA5DYlYoA9wf5z84wZwpff3QCiGIL4gVru916ucjn3ZNKKRxvy0Jt7?=
 =?us-ascii?Q?lWe5YxRP2b2WLdePpdYhQgEPTq30vN+qT6lbgObLAvPsV95KC3i3vT8z8Qdc?=
 =?us-ascii?Q?Qug1BhT8YIv0UzfcKiUOFksprr9Pky5CF72YDQQxErPc1xK89WWLW4F9ox0t?=
 =?us-ascii?Q?3tKBh0TEGv8YEt9mKPdrCEzLrTLmgxyLov8djLDS8SGYXOJlmZAwFV2dnRmu?=
 =?us-ascii?Q?bXxOhtukIMNogJUviYJoSx/blIf/cZKkc1SWzBeLlobnBn62q5oVpj0Cu16J?=
 =?us-ascii?Q?Kl+cENdUyZX3F/Otbhkvasodc9ksR5pnkbQp1c4ZruokklC6VA/W47QcgJsL?=
 =?us-ascii?Q?hEu66crMQqqxedHVpUxBb4BkY4gsasYhpITP6yR8tiTPCQiTc7FJddmAdp5P?=
 =?us-ascii?Q?Fg61wXw56wLeDDKylrJvgN7MKqWot+3V1+ZiMQMA1sy6TUx8PX+VK4G4Jm2K?=
 =?us-ascii?Q?wrm7tG0k1xCyT+et0Nr9lUhruOaTAb0yhvCHuW3VWINK9YiOTYqQ1PNsUfn9?=
 =?us-ascii?Q?DJ+Z5oUWfYmeIxin4118o3vXhOJIuFsjEzx+6ZapaQ9pobnb0CBeayYHSTOO?=
 =?us-ascii?Q?//YLFvvBGk2FnQEg/YGntBSR9sXp1UQUUKC+4hGyo5veaXfaL1eM5+MutUX1?=
 =?us-ascii?Q?bPLdlhWYPbBfoJPhGNZAtqdfAD56bDKeYT2sUYHg4BIZ2Cn8Sx+5uZtOQ/CQ?=
 =?us-ascii?Q?3VVBzEDCTkUSG5xLOc3F4LVuW0kO91b/jCLB+zK1NYxJTmdgvogBfQICADJf?=
 =?us-ascii?Q?nsbcQ4+Aa7w0anoCGZmBzpUzM2M6OSaCFssHSQHSMnNSSXX1tVj5R3/xpW2r?=
 =?us-ascii?Q?u4LtzjI/D+kzVlFZroaotSloWuFmULH1Xp9Oap2ari1IUUncTNck13w5/6Q6?=
 =?us-ascii?Q?tOazZAu8WgcZ84fclv+jrtvoAFH0ypjfN02H6FtgBJFXy7ixmQlThGbYqv+Y?=
 =?us-ascii?Q?9eEFOr7mJ91QuL2WEiJmn8kwx9SCvxwSCcIMV86okETv/a31tpLpi9wLPSAw?=
 =?us-ascii?Q?JiTcmL4/Zoi0jnJm9/DMIZED0/CAO3/tfbcjzW3om+1lnUMi3KRNXIoUD+Uu?=
 =?us-ascii?Q?aDX+gU+5+uD2sNPkTTNG8S8Bel3qECEH2eafHYd7MCgUmvfXKy6kXfcchNrt?=
 =?us-ascii?Q?Q+ZIKkIfcILkWeW+8h7dNJEAZoUsiqpesywfHEvg6EN3uLm16SkATuXLJU6v?=
 =?us-ascii?Q?d0T2hDrtf6mHBk0WJFHzOnNyiH1xG0p8/lLTTPhUUhgv7sRN1UhvhsDCK7R1?=
 =?us-ascii?Q?4bhcyCsQRslsW08e1JLihq4ap0Un0g4Ab01swN6kM/FZGj4z5nxKmMUxPQYZ?=
 =?us-ascii?Q?+VeUTCS975zGpsTCDhVjGfWMGkh3DUonromXy97jzKE/2jSTSmSGtsE01PwH?=
 =?us-ascii?Q?4Oze04XOizZFBqsyjOuNQdNNM+8M7cvAGEmE8WTnuzpzIO2h?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f0bd750-2b31-459f-a87d-08df2ab83d22
X-MS-Exchange-CrossTenant-AuthSource: CHXPR12MB999244.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 12:31:29.9220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HUSfbwyC98f1x0ONZbiDqGCC4e+vAaTNK8ALC3qQrJjg5EAVj18JZMYsv1UkSIMMQUEgWTuNFSs2MiR74bMluw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8197

Hi Breno,

Thanks for explaining the rebase, rollout and debugging costs of carrying
this out of tree. That's useful context from someone using the patchset.

CONFIG_EXPERT plus tainting on use could make experimental use more
explicit. Those safeguards alone would not establish that firmware
access, virtualization and runtime register updates are handled safely;
the local restrictions still need validation against the hardware and
firmware requirements.

I'd like to hear Will's view on whether this opt-in approach could be
acceptable in principle, and what requirements it would need to meet.
I'm not planning to submit v3.

Thanks,
Koba
