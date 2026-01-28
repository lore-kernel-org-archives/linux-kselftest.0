Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012006.outbound.protection.outlook.com [52.101.43.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8581335A933;
	Wed, 28 Jan 2026 15:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769612748; cv=fail; b=d/mVXo3rVpOPcN846te5ujv6ceUDB4ru2arQ/m327+0v86EGkHG/Zm7w+0BjxP/K+jidggJu8JYZig4ivPob4/mNyemGpjXNpUO2EucLSw+bH8FwzlVZXZwEg4qz2CZJE0i4AtoSto2HbA6aUDuR6aYy+46XNHm/siyFhD8zp40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769612748; c=relaxed/simple;
	bh=xXxR52F8A3dBEA+7FIt2bineXVzPDGr1J1GLbk2x40g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QAHJ8yb7BduipSgGxf1pogdjXaimCcF+nEeLEv68BGYQLcAoujYfBOLsh6t8v82GhFLi95M65ZQ5sdQ+xw/5TLtlHEcRTvLwJfGRFxSKpZKpz8dbGJaapv/oH/wioK+cI7xcS93SWFux5K2IiD7PkEBEpINnH+wQQPmVgWIl5Bs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ejNF4Ss2; arc=fail smtp.client-ip=52.101.43.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ejNF4Ss2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QbRsoQqAJ+vcdZr0muLcTq0TFSNTElPj4egUiiUXCJ5j6etjz347HYy/JSOVag6zFd2Y9FcO0w97Bhd19fHVchDszZeoRYzZ4OvZmdLHFpcA6lUDhA5dqDBjtjwdVmhHBSY5VabiE7NjN+rlnhrO7sAdjqSf+i2lpP/6VK4yQen4eFtEFnCa5AGktCAEuyTxvwAd7q90vzaD73hfw0a9Nulj9XyVz5c5z1iJYyO67qL0qKav7mSGkwe+d3j+DrQV1FAxyM0TUm8gXtM0sMKTa5gRc07acfkMbxZ8a8Bbo8vuoBI4qkGWCxiNCOdWQXPmHSY2JbSbRpeMuWyXrB68Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=26hylySgMlsiEHRqyWvQyON44Iyx9QtUyOo2LGQvxko=;
 b=ZfbyRibbgSmHiYR03iOi4reeCfmdMreGKWzEpFQhdwu8auXvPjK3jtvo3RSOQLEOlbglDzyclAZ8i/O6XF74HMU7Szz10wmiG94j8jMADz3Cp4kioND+P7h0NLrEsmrRAdlSEJtAHRce/yK+Pn7QLO/e/c1/rs1Acw8wKS+hHXjAs9EwWa46V5I6oKoHX30kdj+ZRNWZDDtV18n2J+SEJWKZkP2QJrgyoSJEkGxm4Wa3JhZH3wV+JLknOoM4UDyMxhVB7xv72U4HgldwnVRoaC+1fZOILWC3PL3uHfne+VuJVdnlhn1erwxTY0UbnsdC6UzdPFl8SNfuxfXxQOBmZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26hylySgMlsiEHRqyWvQyON44Iyx9QtUyOo2LGQvxko=;
 b=ejNF4Ss2zgS9JD8H6PsZrND7aq/EWxqI2ZE0ZACElQRleJ3tWYZGV4GMZMOahD5y08aDBuUDjKLBpD8Cvu/Teb770V4a5pIimZttPvBcng3y6+sm7luIUFVGCTmjvvYS4xCywC1/DTZ45wOSiZxNAzp25Pc0/Ip/wJWLjAcPrfe3iJ7+ZQ57R98N8Qf1cfO9+uuZjsyZTKh26TJrRMBzAJKc6UApZxMzUxVOisgyh9rBtTxobdZonWtYHPzIQN8AyAOXN16Q89fd0XIN963bqCVNXvdshr+kKwNG5S3h0yFyoEQ2zXVcrkXurr6sQrUCnCRjMRThX2m4Spgm+we2jQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by BN3PR12MB9569.namprd12.prod.outlook.com (2603:10b6:408:2ca::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 15:05:39 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%3]) with mapi id 15.20.9542.015; Wed, 28 Jan 2026
 15:05:38 +0000
Date: Wed, 28 Jan 2026 11:05:38 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
Message-ID: <20260128150538.GA1134360@nvidia.com>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
 <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
 <CAESzEGiA2DSp79pkjxBA5X-DWmSAAgyAF7usKn253jkGpYJMew@mail.gmail.com>
 <20260127235232.GS1134360@nvidia.com>
 <CAMRc=MfP1_fH91AVjerbnwVfhA0oqBKV+CTX0_1n32g1t-Pvuw@mail.gmail.com>
 <aXneX-aZofvuk8gl@ninjato>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXneX-aZofvuk8gl@ninjato>
X-ClientProxiedBy: BL1P222CA0024.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::29) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|BN3PR12MB9569:EE_
X-MS-Office365-Filtering-Correlation-Id: 77a576f4-2ef1-43a8-69c0-08de5e7eb283
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?10IUf2k4Es9FIO3PVBoMekMveFg4ykQdOR16T3lwb0KIk+5sySU56cHoX3+t?=
 =?us-ascii?Q?sYajfFHuaAA6HxySJ+8pNPUyexGK7ipNa3KXLuI4naKPrar5ya5UHCw8KYRV?=
 =?us-ascii?Q?VKkPt4Y0om0e2yQUzZLvunZvaIX9TfF13q9GER7tNuT/njnkwJMEs0jqpjOS?=
 =?us-ascii?Q?Tc3tv2K0zA39lH9sOPxwgAxJfYkuaZPRgeOvxe931JZc3XigfZ5nODaUHJNU?=
 =?us-ascii?Q?Yx+lwz/jR7v7fSVqu4ow4mPDzH0waZkn79iFZ2GuKgkPt9WEKdRMt8or9cVL?=
 =?us-ascii?Q?+lDxubNZdD9ssVfvAoGFBtyxI9xxShxVtt87mQ20JrUizyPpFp25I8uokWaJ?=
 =?us-ascii?Q?9kOAgwnvkcHv+wInnRT88+QkRXZusY9pPLlAtCRQ99uS/ARWQGLXND55JMpy?=
 =?us-ascii?Q?gQ+KWqyY8j7cEOjIoiDQvCDyHXRprb5uG6H2LCC/zeqIgltCK/FFfLLQhLOp?=
 =?us-ascii?Q?f8oKDkSNXLuvOHaMlFDPHAGUvC2mby6cWwGj70vLPC/eUHb3GMXP+RqxeyeP?=
 =?us-ascii?Q?3wifJahh6/NNqRMSipaWU2Ez+auHLwfdeZptcXAUwpXEmp8rfIKKxIbjHMQX?=
 =?us-ascii?Q?2SnAWBughDS1praNQWmoj3c25B3bho7cOF3LtyrRY2XAX2sQxFsizQokOaAY?=
 =?us-ascii?Q?N0RJsseBc8C5RXNG/+nOvuA9w1ES5YX5YVDWCZoaOcO9h/+E8ZKH4udG3UUo?=
 =?us-ascii?Q?O71vLT56RF447faIToeCinGpTlCSo39P3xkM/qm2olH95AE5mqtZ630rLAyo?=
 =?us-ascii?Q?Z7Qzo0Rl566318sG89+uDHb2Nt/zSBsgJdSd3NVgBChIDNPxq7a+6YB8ow5W?=
 =?us-ascii?Q?LMgSdBxig4I022/i4FCNEMEiDJrjtlla+LdqEQ1bbjVG2PVnuuvkT6Nw3JHz?=
 =?us-ascii?Q?Wr8/DEgUDEOCuz6kMxf9GvNP2pwO/J9L23spBSGVe3JiCIRdnKozoK33Yilz?=
 =?us-ascii?Q?OqHs+aikfFhnNdX70BqT/yjCPPO3ec/BlUJUzp4ABU/KC7Kobi2FzyeFMLSg?=
 =?us-ascii?Q?SV6Cf86Clr6V7kB1gJWEz2sBJQeuP8sL5PPwqFaibtqfIzKOwbtCyZd05T/R?=
 =?us-ascii?Q?ECJQdUziJDmBX0+ZKV/Azagry7Eo2zdRs+N41Iyh60vYrv5Unk73HJwSeMbw?=
 =?us-ascii?Q?YaMKBDNGYo5/8AbQxgHPgjC/q83o8R3JELWImpyaKPv1/Qlr8E4eV9DtJLpC?=
 =?us-ascii?Q?xvs3non7eNkwP4cWzhT02DN4JhGh1p7MJM3P+Wx2IYkdD11bWIR8NwamdXsx?=
 =?us-ascii?Q?D15ZaEFLlpKWRbqfAuwWnU0jW6EUsHa/oQY2dPrUOwqmrVllLCgz6/fmflHV?=
 =?us-ascii?Q?gkBdlS2hoUHWixLO78EgoDVW9m+GGJ+vm3Jdfx/1yIMRUGEaEH9rj91787CL?=
 =?us-ascii?Q?pblrTmaifbJfrSSKgrnpHKBytv+3+iN2v6a3LEEhQ+UPEkoRbAKVxJ4ubyAr?=
 =?us-ascii?Q?6UFuDQMjEVP9gp2viH33N0K3nAdS5HwMkHkJj6IVs3eCUY1B55hf2LJ1RGb1?=
 =?us-ascii?Q?wWZbtJyRh5QS6Z+X9RwhrzD9ZVoW2BqYwT1oh2Bjx6VB9lBUbe1+6c13whHP?=
 =?us-ascii?Q?/SJal/QcJBYkWZ12ZzY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pgTWqg1mtwTLIvRY5jF6rRzsYreqrTlEFhclXrDlmhhyqmjJN9sHKk21KEeu?=
 =?us-ascii?Q?8aha7yREY6nGJv0xkSjzkANCFNYz34DKhjGokCM/bMt6DYtt3siUrRHb4Ax2?=
 =?us-ascii?Q?lngI3oc4N3K2iw3Lc2dAZHmZYcDEYs7LoUZaJf4Sjq0hNkTsjIiS+9DXF1dU?=
 =?us-ascii?Q?X7gf+e1gFeKYzkmjAl12ABWEDrrGpIgj+F6YvMpyWSiKRJQBZqCldL4kggQD?=
 =?us-ascii?Q?VW8AZD3ZjYMPNzdzpvxaH15jCaEkCVEOTfiSTf8F/uoUctrdglZIMhDrmzvV?=
 =?us-ascii?Q?/7N/KrVpiVFF36lggkX2G4ydQowWFLDqXeaLAV9zvfqQmMmy8b5hiiHQXw7j?=
 =?us-ascii?Q?ZV/T9X36DBsv1ytxxdgKSa6llD0sx75BrbFPpOZM2XPzShQJfU2uZUai/3u/?=
 =?us-ascii?Q?XUSKzEToiO+sodei+6DLNzsNvpY5emcFAouhsgEoAAGP0Rpp+y/QyZ4mfsEy?=
 =?us-ascii?Q?AO4k0EXz9b6D6RHE4O7D04lbLUleJZ0zyDOLgnwdPhmzh+QKMDT+LB909Glz?=
 =?us-ascii?Q?A8CayNGP+LCYYKzuw+IQFD+E3AY7zI6+tHgaBRdw8aUts//vyyYS3pm0oTeZ?=
 =?us-ascii?Q?AfD6BRqnQgk4hFfRH+NsnzVjG1AksLOCEigjPOxfiY4mq2IkGTFf2TPnzX++?=
 =?us-ascii?Q?mJPko2N4CFGBTMb/AMz8ctxiKdK1ITGgnzFEelFMMl1Emao1R2DVJbMDmXis?=
 =?us-ascii?Q?PIKKsn3UeADx2vRZ5d7uiALnPIQXn0cjOYdl2vmZeqp+8EC+bIIyr0zonASW?=
 =?us-ascii?Q?MKqK1Keg2z795aqtBMteUwDn1LRUjbx1EG8uxIm/TdSePJ6faNVMCYmJ0vfW?=
 =?us-ascii?Q?XlqCmFrGBwxYQVZhv2PETyyAq1HNfw+er3DtaRfy6ypB+gvNyBve72sV7OAg?=
 =?us-ascii?Q?V/CXTKHkXVXcR5o3+wIF/WHYYxG0/O/rqINLVZFYxNWrJHLRvtV2cHTYZQQx?=
 =?us-ascii?Q?/sgrF9T91+nVUxgDW2nuckPjnAvA/E3id5GGRTtX2OogoKDJs8bM7vmH4j76?=
 =?us-ascii?Q?eMsKMNEML/O8FGW9eFVO87Va1zswQZVGRJsFNBSBvm+LzQR7oZccKa62zSDi?=
 =?us-ascii?Q?10MWAMBqwcKDy3BSO+oWWfDnXSe1Iskjl30Au4XRvxurEhiCQtzDlUw10aQL?=
 =?us-ascii?Q?Bpw0ds1xOHULgFG81C7gFmwl+erznoc2d5QWBzPhw6ifrITrYxW1ynLz9p+q?=
 =?us-ascii?Q?yS1cdFCjecBKi9ECoG9IkuHf8Ii7TV80OyFjT5NNYs99QtFOkthDw+WpqiMP?=
 =?us-ascii?Q?KclnA9U3YQ0y28ReCXqPUkarRPRWes8HoZlx9hhumC/qRlFQt26j66NxFVyQ?=
 =?us-ascii?Q?mgJts1PBj2qYO/btVt3xqmwI1dYpR8bbXD9aCqXe+Z+PCi+FziHMTjVWfFik?=
 =?us-ascii?Q?fO/8+VsRQ0ZayIAdFrVcG3c4EnHdPqEyMWEvJ5QMtGi6OZXvjcZiW8Rx/P4u?=
 =?us-ascii?Q?f9AOvOQdkyxD8GB97eo4NOMXIcGLxagr71/6BlpY6TSgwCO9I1DZ0pL7H1qp?=
 =?us-ascii?Q?HNOP9TRbCE68bYT2dIGOAewJA178Gk0vQavtRvjsaMeMMvIcM+cKAt5Fpg2o?=
 =?us-ascii?Q?b46A6gHYpua+HH+rDzd0IcsUj5TxI2D3S5cDiZnZRTb03Nj/s0Pb30C8PVko?=
 =?us-ascii?Q?ol7Og/99I4D6+EjXGCJkwuuWHeFnPSXJtJEkf6aSfHLFV08zx1BuVSOQ9dBd?=
 =?us-ascii?Q?JysUcfjmYwFnx7mvARvR6DAOxSpHYzXvfgZnXaI2u5bHYUf5jphUGPD6j2Z9?=
 =?us-ascii?Q?8gYnwUJWIg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77a576f4-2ef1-43a8-69c0-08de5e7eb283
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 15:05:38.8715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AwiyUBjbbf4bBQELxt1litUyPgzGA7R3Ax2/XgrnFkmL2qdo+Cn4GsYxUvF86EHl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9569

On Wed, Jan 28, 2026 at 11:01:03AM +0100, Wolfram Sang wrote:
> 
> > One exception is I2C where the logic is so broken we need to first
> > rework a lot of drivers.
> 
> Let's say "bitrotten" instead of broken. People used what was available
> at that time and they prevented the kernel from crashing, at least. And
> up to now, nobody had the bandwidth to improve that part in I2C.
> 
> > Wolfram is on board with that though.
> 
> Ack. I want to emphasize here that for I2C the SRCU part goes into the
> subsystem, not into the drivers.

I would just gently advise again that SRCU is not a pancea and should
only be used if the read side sections are super performance
critical. I'm not sure that describes I2C. rwsem is often a simpler
and better choice.

> > > The reason cdev keeps coming up is because there are few common ways a
> > > typical driver can actually generate concurrent operations during and
> > > after remove that would be problematic.
> 
> Let me point out again that Dan Williams already had a PoC-patch for
> handling the cdev issue generically [1]. Dunno if this fact is present
> in the current discussion.
> 
> [1] https://lkml.org/lkml/2021/1/20/999

Yeah, this was brought up a couple drafts of possible options were
exchanged already but nothing was really focused on and polished.

It is a tricky problem to find a storage location for the lock and
revoke so that the fops shim can access it while not disturbing the
actual driver.

Jason
