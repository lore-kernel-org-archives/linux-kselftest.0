Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010036.outbound.protection.outlook.com [52.101.56.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F301A3178;
	Thu, 29 Jan 2026 01:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769649808; cv=fail; b=EKSW05THeisFmK2dsm1coIG/+MfMU08dEZGzMHyVGTuWev6DpSqVKaWpKqFeTsCq4gkdLQ6HxV2tjKVVw7pXVMw2m8fRTshhsIrtoLKCtVN36YpGidSzDVYKS3qwA3PQSSMsl2eBQs54lfS0pqdh2jWbLPyUbCkRuoJkEXej+rc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769649808; c=relaxed/simple;
	bh=ZJyVmBDIB4HTmJIl71mAnexZDkb3OmRym5D/zu4nsCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ke0BW84WsxzyXmz8WxHTMgqUF2ewqRHPFGHNbv1wLxwbWBR8FvEtWM1ouR5IWLjIe1vHIftfgw3kR7Nku269Bu+nGy2n1UFj4Dj1I9KjAym/JCxz6jQR6wiNl5PW/x/Vt5OJPQ73uzDb8AXo2b/AnAtcToGAO3uOa6v9SbI96eo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Qy1cr2b0; arc=fail smtp.client-ip=52.101.56.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Qy1cr2b0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g272nhZdqAPPxXrNqAv6tHXv1321kuKw4jk9am8LuiC1v446rGrLkbw5L4G8K/y2IWR599VFoEYPTo2TT737ltulPYs72XVW1sh/7SjHT7+uo7c4CaTUaouU/mDxX1+UIrBe8GwQxOKyEgIIrH1mAp12/qb1mmTrbEBuTWxKUb6Kw9mo6c7o+GgVnfByxYLdsaTnfEsZt0h0+4kA800xnttFeYYKNU5zvS4XUD+Mc1y8FgGeqn5IzknGeqneKQGBtOg3ZV+2MIpSBmoO6ERzV9A1k8UBqg6U8NV86d1wNE1J5qlqgSfDZ30euMvtWYvYxn2GxzPiUfieGDKsmZVmuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h7eI0vQwkd5iBxbcdkpIxtwxLnHdpXvFvuGe5IRMQvs=;
 b=Moul0FVaa3RJ+Jt+1QO1H/dT0D3ZO/M4Tdz40bhgsl27ng15ZulIognzPxMMNvZWL2M2ye5o+QosHTEprwFQVrHsQjCfWv9KUIwMlwiM9x1A1r6FKoik8uoU2McB+VslCtvyOtCqD4Bua0vqWd8X/jyvPY53Bpcze+72sYbyOJgS+pZKLJh140NZ9Q30ExgQX/5pz0oMvI5hByjtizMoIxt2TMcg6BvPvsImfP/lSE7gwSIYqqH1YgLMaAGKIgOI9fHSc0xFMgkbPh2WM3Ui5E6V8WEFxXkwKpqmng+VwamrAPp/MTAKvS/rR6m18ZyFprY8XNGo6JOXsB+hU975RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h7eI0vQwkd5iBxbcdkpIxtwxLnHdpXvFvuGe5IRMQvs=;
 b=Qy1cr2b0nkZIOtFz6xrgWHD+V6VGOHijhrrQdjcLyQ0+v37/5OubJujn688aPVNnjdGEag1GJhWSjSjlKNnCxeEyUKuBAorKucjKRcwU0b9KnKgIGRPzd8X6RI2hqJFSULFqNRfIx13cQB4avsPjpGOaxE3gpDI8bTSUcvW9jfprBSZeymqhy2qoPKEj6//kxHbWcO2y2GD56WTVUo1t5m+6eWLJVx6O6YHiwP1arx8MPVNgDaLTeEir+ma/KQpiw2PV0Hw8d2r9g1yLxw5XqzswBj7ilLmxFMqX/Px75URXn56Yv9OPYAkDPEjTtov0UBGp5xyAZlRFFnY2ZeKa/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by IA0PR12MB8280.namprd12.prod.outlook.com (2603:10b6:208:3df::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 01:23:23 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%3]) with mapi id 15.20.9542.015; Thu, 29 Jan 2026
 01:23:23 +0000
Date: Wed, 28 Jan 2026 21:23:22 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
Message-ID: <20260129012322.GC2223369@nvidia.com>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
 <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
 <CAESzEGiA2DSp79pkjxBA5X-DWmSAAgyAF7usKn253jkGpYJMew@mail.gmail.com>
 <20260127235232.GS1134360@nvidia.com>
 <20260129010822.GA3310904@killaraus>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129010822.GA3310904@killaraus>
X-ClientProxiedBy: BLAPR03CA0062.namprd03.prod.outlook.com
 (2603:10b6:208:329::7) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|IA0PR12MB8280:EE_
X-MS-Office365-Filtering-Correlation-Id: 711a131e-56db-4d4c-f715-08de5ed4fe79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LqRTxFRcqr7PtzxCk8QHrpWkAhw/HneeGs9IjRaVD3+uPmhx2fT7Es8mKSKf?=
 =?us-ascii?Q?XI2cOCNIT1m6n3xSdFe8G4Rt7JRwGfXRYiiPQMXf9QkBXHjKEeC7Z0TuZxWB?=
 =?us-ascii?Q?OHEYdg+J8HueLb3vOTjX1d5W3tS0DSufvC91pdPb3Jy/4enoftXvnAmyVNYT?=
 =?us-ascii?Q?mXP/pxvWYMnCitvNxO9+c54SOjvAIYTiDp7BZJLLVFT9bqA9uKi/Onm7dlxb?=
 =?us-ascii?Q?stxWzJSd0/vh5xuXgsU/TZa+y4J+LYZELqB0uHCV1NHtqVrijK1Unl+1Jdqu?=
 =?us-ascii?Q?6NSIhYIVDeTw1IONeyT6XU7S2ntqzhSvinNjojykup7XLh67qPNK3sez5tJI?=
 =?us-ascii?Q?LMnTA08D8RzpBtZT05SNCmS7iYfUdTh/OMPZFAX+QmJjlsvhV+xfmDQAC53z?=
 =?us-ascii?Q?SUqC0RE3Z718f/hZaFtT5v7h1tsFrIyeFwqGOmS4DYA9ZqL0CkiNf4HmTajv?=
 =?us-ascii?Q?vYCSYu+qmhJhR/FyBECnomiPeC7UUFmiBxH2BDal4gcDIQLuwrplsgGF943G?=
 =?us-ascii?Q?U79ccj+X0Jk4h8fkee54wW7YzwIgyzhRdKA42LSS0EE9XS2VgtxX6FHuhlIw?=
 =?us-ascii?Q?PFG462Zo5vJjn7duwnAB364Xqdr1lP982kQkswatEyOWyBNNU6UnrVWJEzss?=
 =?us-ascii?Q?IX221eWh9imOU4eZBe2fmETcZPdDHhl3f/XQFnNR5JI2bP+HTgOaaokT1zCy?=
 =?us-ascii?Q?Ch1yP4h9ytUM7g5sF97uQxmm94PzfkmeJGIBiRho6ppXH+8i6fVc0+9udafg?=
 =?us-ascii?Q?7WlF4ma+h0DO5Wo+d9r/0pSR5eMFYupESmAeDXVhzMABXh1n1KN/paTOuZwX?=
 =?us-ascii?Q?a3gfh6D3ODJeum2K2fnk3As+7yRwl/T7oy8A58UEyNLIcknxRJ76/ZQDqW/E?=
 =?us-ascii?Q?9gm4fE1ZCjrtP92XWI1pdfX4tI/uVeT3YHh7VMJ1RMbFXH2ef/5B+BXiXpM9?=
 =?us-ascii?Q?Obib9BmyYzj/lNIMeqMbxSjoXz/hsi/z/ubmid44Mh4eRww46y+Caz3AAq4C?=
 =?us-ascii?Q?eds53ChrJ3jkm/L2fAlz/qA4QePXFL2UBnpCAFCVyvf0F0iIgp06t4UKP5im?=
 =?us-ascii?Q?DgcvJbSEwfMbbcvAA1whAf2FQCP1pj0Kp0bknXIsgOUz09bwYYVW7RSTBNkm?=
 =?us-ascii?Q?O6D2dV7z5eHAyiB66aP6u+OjtKF4l6z9DZJh/ZQ918y/aFoBppSvFkKxo2Qn?=
 =?us-ascii?Q?Ur62K6pj7ENeyVi/sM1XkvDn9omiihrDWxkG1bNn+9nojx3bCkVfLEsCPqDi?=
 =?us-ascii?Q?8gW8lQJ0WZBHVNC4pf0kBtjRz7S5ruOCPdKywYFcFBpEJb2ZBJ6/IwS+V/W4?=
 =?us-ascii?Q?yjnLi+3SW8bxl7WkNHPeGXKQP49H9RP+56Z+seRv4yzWzyOzvDIFQx8Im+iU?=
 =?us-ascii?Q?+RXg2l3RlyzP99TuXyZeBZTlD0P0JM/vJTW9JSHaePpQgifHb2E0zDtbiFCd?=
 =?us-ascii?Q?/fD08rhFxobGOLLMHETRDihfDI3723+Y5LXofU8NSqebM/uVERq2OohgjZI8?=
 =?us-ascii?Q?FNkM5phP0DFdvcOOVVkDf0S7pBpM53wRIWOAk5oPEV3y3Mqy3aQ1Gr5EUFdR?=
 =?us-ascii?Q?+ohkDQPdSTLg7sytm+w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PVcmoYldEvUjbcz488D5EMGRPiMkGAfNUCjP0Y93cyWor8xBf2ljTGDAWXmU?=
 =?us-ascii?Q?JzpE6CRqiUJH0OTfn1Ge7YRTAiG/wpT1HfAFcpI4XkYeXLwwR4FA/9WIoPmq?=
 =?us-ascii?Q?KaggDofCMusH5BlQon8ngMDauJ4ONdSZrnGmX0iftNQZ+/WWfeEIRsJBAw3u?=
 =?us-ascii?Q?LMKeoWj20c/w6JWX1dCnbgc18HcZTRjbduoe5dZNSMXPELCH+fcOLqvLz94h?=
 =?us-ascii?Q?NJBtjV3HtRfHFd76L6R1NpdpE/4ygqNM/oUPv2zLYb7Vx15GBm3Bjntt8XFZ?=
 =?us-ascii?Q?nfTzHtIho5DvexU4kMeIYMgDLOqWMR8bUaWiIwuGGDigN8W2oU4bnqt9waiz?=
 =?us-ascii?Q?4SJNz71EJtnmnE6f9WlD6XYX2H2MJ0wHHQ4u+8dOwCzNx0qbOxBrvVLlR6ui?=
 =?us-ascii?Q?htXWEtPzRIpC/H248RJ2VPZimf28J4qQvn2vUTYkAW1qlQT4FWtsLvXQCg62?=
 =?us-ascii?Q?XJ/SsVu6px4ROCMqchLZp9XYsM05eezE9NSJCUCuZMP7bTQ5AkkK6/IVU7FB?=
 =?us-ascii?Q?S2d9ExvKa9iZ06XM2ciYoTOcpiMcFxtsOjVjVetecaoSlf80sPIrvAg+RDxR?=
 =?us-ascii?Q?EydNbfGmYLXHwEPDS3hB3GZfbs7T29sZ8glChz0J8JGvWaVrBK9vMGqdBjet?=
 =?us-ascii?Q?NRUZg4z1xgapHtIy408sqEA0uEHTaAE1aAau3txSJUa7szNFMjt+HlzNNQCt?=
 =?us-ascii?Q?5bVh2uMJCHOYDl8M+jYuBT1AW0ITdnALP4ymEyMTbxmxVwt4UX4aTbUobxM/?=
 =?us-ascii?Q?CNPAs1DzEXq8g8BAmXNmjSTo8uYPMHJg7+crCpMmp5GrEnh1aJvrUFWoASOB?=
 =?us-ascii?Q?Ex4am/+9MOTMqoOounyBNNXILJ6LL0ZlH8h8/RfJOlKNxlt0+AJu2bQLUSmZ?=
 =?us-ascii?Q?07go4hLzncF1h9Kd/pYlRNHiGBqUl2s2VNXMZJqNNcoU7mrU8J8AVAIi70sK?=
 =?us-ascii?Q?cE/ivifiaawtxMuNaGOXQgIwQ/NwNZaG99BbyY35sUcRAg7hHwCvd7v8pSe9?=
 =?us-ascii?Q?FaN4N7wTXFoGJYGImlw/7jbSFXpTal2EwHHqibKhOeZd8/MvuxRRs6fT8mKn?=
 =?us-ascii?Q?JZfdPj6BppJAjTYZJWHZjTfc4VBpPMwzHosI1k8TqpBqwRyI0duc9NLB7VzM?=
 =?us-ascii?Q?VK3zacP4H4CTVX9ef+SAFbRrtrSEdn+vQSqrKVp1YbnBWCfPvxBwP7sL60Dq?=
 =?us-ascii?Q?DyOHgGq0gGh7M/VMPK4pzYkmEjMJOgZaBHR7PbTF4yr6APK2qVgDn4RHGwY7?=
 =?us-ascii?Q?5beg1PHz0iiql4IQc9nAuANLfpTwTL+NS63eO+q1qph/YQbvNnUA+d1zrxKR?=
 =?us-ascii?Q?97IU4MdAVXZ46K0w5Momsdc9BBJMwqEgeCvwJQ8bMISyE4kBKAQ3k/SeOXpg?=
 =?us-ascii?Q?uI5KeGfAYaq93yST0N7M9GEYV/vEXAKoGeWAlXI9YP8O129Lj63S741iDLhP?=
 =?us-ascii?Q?IAc6VhrRyZkvfPlyGrNtyBhv62VEtFDe9StcTFR1v7s7SqyqIN1gyPrv/k4i?=
 =?us-ascii?Q?z7wSkkOWk1yN23K4DBUZ498JPdnjlc3dae/O/PoW9M4rhyWW2DOwIEbBo/v3?=
 =?us-ascii?Q?65v+st0P4VvptzMWonqSSwUvqMCbbheHa3O9sHAZl+KWIThffgZ9QYlk/h1K?=
 =?us-ascii?Q?NHRrw3/4h61BF+mdTIMhGsTj6za06Ra9fjVSVp82mqNuabz0zb/LKqHXF5Bt?=
 =?us-ascii?Q?i5Y3YLCkubjHbI8GtUULZHk6/PmRkZ3nbCWGJXkZ1mKaEUL/YMZyyPu27M1D?=
 =?us-ascii?Q?D7LGKowW0A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 711a131e-56db-4d4c-f715-08de5ed4fe79
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 01:23:23.0559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 24nuxdJ0LKNOksfa849XOBS2suxjbOk2+PUobdd8unGKaQb9J5lzX7DtTE+616L6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8280

On Thu, Jan 29, 2026 at 03:08:22AM +0200, Laurent Pinchart wrote:
> > The latter already have robust schemes to help the driver shutdown and
> > end the concurrent operations. ie cancel_work_sync(),
> > del_timer_sync(), free_irq(), and *notifier_unregister().
> 
> One a side note, devm_request_irq() is another of the devm_* helpers
> that cause race conditions, as interrupt handlers can run right after
> .remove() returns, which drivers will most likely not handle correctly.

Yes! You *cannot* intermix devm and non-devm approaches without
creating very subtle bugs exactly like this. If your subsystem does
not provide a "devm register" helper its drivers shouldn't use devm.

> 1. At the beginning of .remove(), flag that the device is being removed.
> 
> 2. At the entry point of all fops, check the flag and return with an
>    error if set. This prevents *new* fops from being entered once
>    .remove() has started.
> 
> 3. At the entry point of all fops, flag that a fop is in progress (with
>    a counter).
> 
> 4. In .remove(), wake up all threads sleeping in fops.
> 
> 5. At the exit point of all fops, decrease the fop-in-progress counter.
> 
> 6. In .remove(), wait until the fop-in-progress counter reaches 0. At
>    that point, it is guaranteed that all fops will have completed and
>    that no new fop can run.
> 
> 7. Complete .remove(), freeing resources.

This is is basically just open coding a rwsem.. :)

SRCU should be faster than this, IIRC it has less cache line bouncing.

But sure, it is all easy once you figure out how to give the fops shim
some place to store all this state since people would not agree to
make this a universal cost to all fops.

> > Yes there are other cases, and certainly I've commonly seen cases of
> > drivers reaching into other drivers, and subsystem non-file ops, but
> > these cases usualy have other more fundamental issues with remove
> > races :(
> 
> Drivers using resources provided by other drivers is a more complex
> problem. I'm thinking about a driver acquiring a GPIO in .probe(), and
> the GPIO provider disappearing at a random point of time. Or a clock, or
> a regulator. These issues are more rare if we ignore unbinding drivers
> forcefully through sysfs, but they can still occur, so we should try to
> find a solution here too (and the sysfs unbind issue is also worth
> fixing). There, unlike in the cdev case, some sort of revocable API
> could make sense.

IMHO the sanest answer is to force the depending driver to unplug
before allowing the dependend driver to remove. Isn't that what the
dev link stuff does? IDK it has been forever now since I've done
embedded stuff..

Jason
