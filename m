Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012017.outbound.protection.outlook.com [52.101.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B34495531;
	Wed, 15 Jul 2026 17:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784136232; cv=fail; b=kC2CUo7ju/JEk6AWU+TAHvNQ3qifWFI9doKpCb+bsOjE6sUNE1kXcK7v3BjBnzqnb1cJsyiQ1wdFjocSdTdljF41R3Ak7V8/x+AfOVTeYVTsDuubHNVreY7X9DlP3QtHF+jgaBtTyf/D0LplDIZE38ZCqABhxaChs9DVxzytrcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784136232; c=relaxed/simple;
	bh=a6kDgoH09915WCUxaHhQKowPg+qRLQeFsMNUax7Y1Mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NsLwvvV4397nVM1pcjHIx3v2iMs+a4Y/B+Q1mkoCPT0fsg5llgK35eJhYek2o+UcOXmn4PHSBkSD66oHEii4qkXptLMAZFYEzD0TrTvb8FRhTQXufdhenZH21isX0x5Vb2y4pcKAS/oChcBDMFGS3vlt3ih2TzGXGyHIuq4SJ7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qspRtWCZ; arc=fail smtp.client-ip=52.101.43.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qspRtWCZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VC+MYlfs88k3JSK/A/uKXqK6UuiaLVYBlY20fDz7En8Gu4rN37xi0iAF76EngS/YZAv7VB5CYhMLTuoNBwtayLdMm9OdXhWfk0VUbVID41qWyACO/Xt30lKW4+G1HnFt1hsZMwVXBPDLuLyFhP5qBM6UUCdyDhgMV5xbXsZIWxL+UvWTcXZkBUAo1w5MXocdrXL/3JHqTjQBKr9Pe4afE3AsUo3pjtOKrvF9Vaajg8YMzLNmhepO/81XTuEEgFZurwQFL3YN36akivJSx9KiMq1LRQ7need5fUXup6NQkAu9OGRyyA28RdALOZB+ZW5BFyp/KnTdX6WIKMa3jBxtkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RUXQKEXKIng1z7WXTrxaV3YVWri1MWJMbmJkWV3/fDw=;
 b=oP25DO/xp/BDBx1+XpUomw++cQqpDAE8E3oRfrAeritTLDDTRMP4tlunwYKG779G9/VyNmpGK9YtM4tFvurN2EKpcvdd6QuXLkVNwglhB2wDz+1T8T3SvcmTnKjEx55ULdZn+nfKwHVIHJZKxmmTTjL5bwvsP7nGPRbGGvMcJRXTDxU6dnj4x17l/GZmZ9EH4E7VlfvxHGDdaJCtMrJAHIAtdoQJwtSrUt+wEKiBFpjWUI2UakcZk+2rwxeoYGB5ss92XPyE62i4XhWyru0akEQlk6oBK0ulNwyWqeiozNjvvqI9xz448Zxqz2t0bsRcU2UuNgOtF5Gv2bQN8c5krA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RUXQKEXKIng1z7WXTrxaV3YVWri1MWJMbmJkWV3/fDw=;
 b=qspRtWCZ/PGU0T9c9MW3rXaY1p3jL+ftWbt43zYgCNPAmQn3ls+j8sI8xrAQB3/eGDDSNyFoEWYAxazzGYGVrTlSbcVd86ktET0Ptk9pDGjLSxzaTinrhVmYk+POweEV8gqPZyTyMCpYJr5cM9BjoJMMSzc2UVYWRmV8mPpx8Ibk9OLerLh/EZ8ArRU184krAs/1K0TBnutoWfJog2COfk4LQuErIt7N6OmMm+MRWQhqJqyKWy1LTlVjm2D8o1BIDFRUxp74RxCheYUnpDxtwNoEuh+dhfiEnXazuDlatat1Z1ZtdeSzzKaxG3TBCLt6pyxptTOP8n4QHAgVIgIURg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CH3PR12MB8510.namprd12.prod.outlook.com (2603:10b6:610:15b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 17:23:38 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0202.014; Wed, 15 Jul 2026
 17:23:38 +0000
Date: Wed, 15 Jul 2026 14:23:36 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: David Matlack <dmatlack@google.com>, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <shuah@kernel.org>
Subject: Re: [RFC PATCH] liveupdate: Allow multiple openers for
 /dev/liveupdate
Message-ID: <20260715172336.GC3775915@nvidia.com>
References: <20260714190356.190328-1-dmatlack@google.com>
 <2vxzy0fcicpi.fsf@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2vxzy0fcicpi.fsf@kernel.org>
X-ClientProxiedBy: BN9PR03CA0802.namprd03.prod.outlook.com
 (2603:10b6:408:13f::27) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CH3PR12MB8510:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a52149f-10ce-4e29-81c4-08dee295cea0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|6133799003|4143699003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	z4icP+C409IpaOQ7dkkvjcOU2pxfjUdyBHNhWxsYjO07E0xdoO6NohpMRj7rxoGqQt7Zzkm5aQY8bXTLxCLIk9QTWk3vCQXe5b4t6wvjjaeFbgWP3TAjO2ZTcr5kYSPYKqXP6iGqLJBqyAWyLOXOgoxsQOkeJXhM6Y0EgFfwkU6fVida43UhN46XITnNeqJgQgyrqCTPk9fDWEXJJHA+csLQx36JVVwyvYytec7Yt07U6agtTGpM8PyFPQwGk50ocolhp7keCs43HyGEBsj51p6DQFkwskikgWzR2wR2jToa5T1e5QebcO6Fv8uE3MQvWZ/RBQsvzXvs+yfhqAS5Aucy0iKZpGv3h9UR9D7qKIl+clHjZac9PgOqA2aDOpkKduCU654v0H8fRXLLVcQ6v+hNFXuC1U2idbzqf0jinztCZEC4N2EzcZb6ONKU3PsxRelcRFys6YgD8iIbqFRV44WOC6rsG3a6F7t/EsDWabVdPa0S2Qt4fglw+7p7QAre2agbz6Vl2u3t4jVjGWRaGssQqOVIgMFalm8qlUuSSH78wZHoAKOFYREzDJH2c3PCVjLcFolke5bOuKM6fznUrOlg7w02yjSLtn3m7+CGJXm2LiLxOv2QkdMMXZTl+nGzz4OPfVB+I0wPgSwgZf1yufiM15U/zgRekBprvW53zeA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(6133799003)(4143699003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GQJYovi4tWpvd+ZY5W9ialsJaGkYnA/8K5zmen/nH64ojAdEGxeMV8vWt1aY?=
 =?us-ascii?Q?6uIlfbV0b/FSDPdzrwaccV16uz/XtedxQqyflVM+8eI/Kp3eBZaRSYvJ+ELW?=
 =?us-ascii?Q?sIRl0K2ZXCy3xdMbb2BMeBIsWJDQLg6v++E+TDSnGT7b1pHXBeMeFR7ivhYY?=
 =?us-ascii?Q?pMHd4cWAPLLwFcHEk82JNV2ToCFgOrsxh1e70YDLXKds57p4XvMMhXhOf7LM?=
 =?us-ascii?Q?yAA+XOIWJZRzXoYpUATPcXRr8GMEYNcrApq3kKYVCuuQzNlC+Os+BD6lxRV6?=
 =?us-ascii?Q?uP61JVmnG75opsp0RBkkWZPWIWV7DME6Zj+LbnGy3h40AflFIMb2ZtavTevX?=
 =?us-ascii?Q?5j1P3z74ls2INEfkVRBa7cOhK/fFwJFKJEe7P07O1rY1Aot+u5f65zKrySx0?=
 =?us-ascii?Q?dKkPXaDLbfOYsYMZzyj0i+DHoPNmYcFl3esmmW8jqEsBT3BGirMGbaLMkTEU?=
 =?us-ascii?Q?vsBNk4PQiZJbQyi1K9rHbnGsBJWHHzBebhaPx+dapV2nOgJF+TXDxIl82kV3?=
 =?us-ascii?Q?VKMnOpuS2BK1+MKJ4DK9Oh48PpRG/+v24l/drpBDoJCVQZ2oAv2wBjpsKU0H?=
 =?us-ascii?Q?ogx/hNFzA6Qoc3DTBUAUeClyo8c7ws4eMwO4+lX/Td5TY3EbGYPdHRoc4ROr?=
 =?us-ascii?Q?WtvDzi74d6Q7113sM9vRvUjG3snKthD7O01qcZnGp/fvOyOk6e54b6WzT9gS?=
 =?us-ascii?Q?EyPm2U+Pf1KfeYZ2swOhoXa9MDu5UCLJZftUgUQNV3MXBI7dy2ywyy7b5Lnz?=
 =?us-ascii?Q?M8qXiBaCk42wDSPV+pmWV9CFMfKZS0ufjaHVOlufL4CE1V3vJvGD2qt74YJk?=
 =?us-ascii?Q?3creDwDP7g1g0BCpnIwCdbnXvcTZd6eH8H0G0QXFIIEeV9dF0iLQdP1HN85T?=
 =?us-ascii?Q?3aqerwVaaYUvnHnPrIoJ1P2B5KLVQDIRaytLK5lNvNgEtAP3zlpek8A2ibSW?=
 =?us-ascii?Q?tGa7TYlslNgfp91LV6fGj3PMglicfVN8M3LXzPj1nmp0xNQU7uzTg7WDC9jy?=
 =?us-ascii?Q?VAdu1OODGwAZQc3wjXpqs03Yq8/iUviSgo6OhcM5s9HrPdKKXlHUEj1aO2za?=
 =?us-ascii?Q?LQ4WG+qBzGd1DyZodvLJq8R7ywwVx3sb69onb9w04m2nvb1k1s6afTlCmlBK?=
 =?us-ascii?Q?2H1AIK3c5/bb4gb4VAhbN0LRIiSzH36jYkmJNYKDSnBoMIk19+659KNHWuVk?=
 =?us-ascii?Q?WtCcKBczRZGhc720VNNZpXVv1eJdEZkabbLQz8PczGhoOVl+YXutZ6feS6cM?=
 =?us-ascii?Q?wkZbp90ePEPY+C94Yooc1HuifUmGl3qzEm21+7X5A57nB7wDpQnFvWdR+LkR?=
 =?us-ascii?Q?mwpS31zu92xTbyGwFyyzCQIUkBDUGD/wuKkCOkFE3VcJyb0NgBJ0Pn5G/ff1?=
 =?us-ascii?Q?Wsie88lzljhUGj97FGxE5DSXNlKZ6NPmTACLvTVKKGKz4Ii3AY4K6LkpWbQ7?=
 =?us-ascii?Q?pm3X8ahbaZiza+yJAmwI+AzyZKAdaNa0y2sS4/b9mHmMVH8/nGokub321V2W?=
 =?us-ascii?Q?J8ShNsj3Znb+ijVBNurDUhUkfjBrmAq8LbOGGHPhcQuX08G135VVQduBxRQY?=
 =?us-ascii?Q?Vwdc7y5FJN7W0LnCryZWnO++jvMuvpSeZghWsuliYD4xrdwQdsDJ087+3x/c?=
 =?us-ascii?Q?J0h80a9xO95vH84+bgefj1VrL9FNHXJTAnPeDYJn7CdPwMLNf4pb7CQX9O6U?=
 =?us-ascii?Q?3M+Z3L0xdS37FpL7cMMvp7QuIbfeLKffzyN7eKbn6mkzkt+4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a52149f-10ce-4e29-81c4-08dee295cea0
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 17:23:37.9641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kgrAZfkVIZNjAE6i1HbTIo+zTjla6KoOrKfysNacBujFyD+WDKb4HoSyK1t1kXtP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8510

On Wed, Jul 15, 2026 at 03:50:33PM +0200, Pratyush Yadav wrote:
> Hi David,
> 
> On Tue, Jul 14 2026, David Matlack wrote:
> 
> > Remove the single-opener restriction for /dev/liveupdate by removing the
> > atomic in_use tracking and the exclusive open check in luo_open() that
> > returned -EBUSY. Protect luo_session_deserialize() with a mutex guard so
> > that concurrent open attempts by multiple processes safely executes
> > deserialization only once. Update liveupdate selftest to verify that
> > multiple concurrent openers succeed.
> >
> > LUO does not inherently require a single opener. There is some
> > documentation about it simplifying state management, but the only thing
> > it actually protects is the session deserialization during first open,
> > which can be easily handled with a mutex.
> >
> > Relaxing the single-opener requirement avoids the kernel forcing a
> > design pattern on userspace that it itself does not require, e.g.
> > allowing multiple userspace processes to create and manage sessions.
> 
> Agreed. When the kernel had a global state machine in the early versions
> of LUO, this might have been more relevant. With sessions, even if we
> later add a state machine, it likely will be per-session instead of
> being global. So I think letting userspace open /dev/liveupdate multiple
> times makes a lot of sense.
> 
> Also, today's systemd only supports preserving individual files, and
> does not hand out sessions. To get sessions, userspace must open
> /dev/liveupdate and create a session. This opens up room for one bad
> process to block every other process from creating sessions. It also
> imposes a need for userspace to add a polling/retry logic for getting
> sessions and serializes their execution around this point.

Shouldn't systemd open and own /dev/liveupdate? That was at least what
I originally expected here, you'd talk to it and get a session FD
through dbus.

Moving to multi-opening /dev/liveupdate and removing visibility of
what sessions are open from systemd is a different model

Not saying this patch is wrong or anything, but that I don't really
understand what kind of model you are going for now.

Jason
