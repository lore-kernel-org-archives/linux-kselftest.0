Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012064.outbound.protection.outlook.com [40.93.195.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5159617D2;
	Mon, 26 Jan 2026 00:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769386056; cv=fail; b=jWCqKjLPUrwh31YpTPO9nHKTGKLhuoO5rGSUNZcd2HEjEZNtVImTSoJoupktsrvMxz+dfw/lpFG5cWBwKBvrCQde/oK670c1MQKBXZIuRmGu/KHNKqKZzG13fg8YhaA7UQsqUyOJ3Bhv8XIrDyMsy4aBRB/y/Cg9xCUEZZ2VD6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769386056; c=relaxed/simple;
	bh=xtO9L5VIEuO6AU18QjSBZJ26bzQWeg82qtBmHLjYH2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pgfMjvLj3y3+W0rLsuuT0XrkeTDtMnGHQtZOM+MPk/W87BApIiY1jfOSq0BD11lxDaiQEC2TIZcWR9zHe6KxroOe3eteI28vEpFBHYZ3nNqiLAQ9jLNTbADhS7vdRtxKogoT3P58wfGLOIj0yNrKyc8yjfMswqArLJU7rEZFIP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=So9jic3C; arc=fail smtp.client-ip=40.93.195.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="So9jic3C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GJDlRnLis2jO0RMFTltx4SrCnmOm9X5vGTl+drJyiFnh5H12SaUCo7qMFyLXYBL561OfbskRTJyRFesmcu81ILnp2+ld9mbwahVnZuPMjQLVWWlzByuG1tt+JsIGbjINntEEXhanarHjk6ZCwXGO74qKV58fv1/IUBaFa81886PwL/gBweIQe7yF5irX5HmjkYyfOAo4zqjjXnHgaljmyZktpsn9oKGE/xIx24ICIeB9AGpuOefPu8bz4Myb5gtGGj009BLX+8Ln8TvyDN8BAF2RI0G3qbQ7XIKBZkB21prJY1XEzz7gPSpfmD0zFkiJ8GSIYzm0GnOZJj/Jgl+ocw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sb2xJZpNds7JHWbCqbeWV5+fOQWn3Kub6b87bj8SX+0=;
 b=W4c8i3xlaPWzk72Q7QU5u0kCTiohG9XpFUDqkBsLna7h8ruHbiiztoLir/jNqD/lOQg7eCD9uqKDdomuxe7r/C7HivJPPDNvhvQNBLw69Fo54O9JGsWzAKVhu4mO2f94l3qXLUFyxwEQDKNhZyheN5r5Ikg85RxOCUzd2nPvD5zgzb0BPa1uztKxBFrWwd4mV50ULaC5t1llnStc+whZOMage88Edw5051q4c7HCvSDLqQOKgbrnc4ytfyAygTrtS1Rjuji6T7RMlX3ahcCyDXoZgsCTWdzZDh2oqlqNPaBavaLC6l1aTggbAIln+XYA/mlKLfZZWCUvkZ/moN6i0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sb2xJZpNds7JHWbCqbeWV5+fOQWn3Kub6b87bj8SX+0=;
 b=So9jic3COZ2qiG6fKGEYzmRCcg5vgQ81gBzdWdB7ZOEbEFNJPVPHGTtr4o8gqdi2ebNOjIsKOFViTdstov3Yt3X1uPvMpSfvRcGTQsSBSSjRtLydtczzS4b57V7DDICP/SYnlc6T3WxOnQuWF8TeI0A8cnoB0mRe0SXNXByEKMViU3ZiGw2IYXKeS/dQuaRekWpYNx0j0K2vDEI0g9du6nHi8hQvW9fwdVgy2SdCb68VfvS/y4SDn6EfOut5UlKgaOxDNOQy+HBltF6gb9SnTcIOnpDAMNNwUZGa3qBiLYwQ7di3M6ABrC7ReGcXja5GEDLCuwDMRjJDIOGlJzjTMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by PH0PR12MB7470.namprd12.prod.outlook.com (2603:10b6:510:1e9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.12; Mon, 26 Jan
 2026 00:07:32 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%3]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 00:07:31 +0000
Date: Sun, 25 Jan 2026 20:07:30 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
Message-ID: <20260126000730.GI1134360@nvidia.com>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
 <DFXV1QMQMTRK.2W8SWGVHS2K69@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DFXV1QMQMTRK.2W8SWGVHS2K69@kernel.org>
X-ClientProxiedBy: BL1P222CA0010.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::15) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|PH0PR12MB7470:EE_
X-MS-Office365-Filtering-Correlation-Id: fcb167c6-986d-480d-c808-08de5c6ee668
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cTnon9nIlzUgBte8J85BiRgXmPRyqncQBSVexkYc4k8Q6nr3DabExPofWqEY?=
 =?us-ascii?Q?3+luqUmBGYS+KKo1mBvBDhgSmxfhtsHAfsWapLZmFm25KNJMQgyoIlBJzsHp?=
 =?us-ascii?Q?zqmk/CHRV05VYW5Z3j2VRrwMpIkdOdyRy4dewoH2bVHvtAe3q+HrU+u6kd/6?=
 =?us-ascii?Q?UXKNtH3XsYBID1rRmtoT/HPuvUcvmnqZRZlhFru/MaU/ZCs6sZTFKUVJdqhs?=
 =?us-ascii?Q?g4YT8HtnEj3/j0tDudSapWII8MfWrU248nmeCn7zhpU5jVVErUYmhWC/zx47?=
 =?us-ascii?Q?s85iPkxWjhE58B3/RXbhGtv8fyzKjavD7dYf99pQWm0fkqV6Oqjl72zZWTgk?=
 =?us-ascii?Q?DSx7ZvuMnYXWuu0pZWqCLroFX6RqpbJUK2CngLkWUHGH9C3vIrm5NJ4qTYfm?=
 =?us-ascii?Q?+pzyy4bBu3Dr5B9ayIPmVMIRWQ6AcFac0aERwwwFq+rA3W+9L183EU9Pjys+?=
 =?us-ascii?Q?u+bMF3d8nfZGXPdUyHSYd6Cp74AG7TFSSYIT5PS4tI2zUhIpDEZ2pOlobjuB?=
 =?us-ascii?Q?wJkNLbQn3d+7p8I8lHnzuTpDZxT8HQuLtayAHmzJKZpnCbdeiG4vutBZ7DsJ?=
 =?us-ascii?Q?xCS2tLQnqffE0i7G+0Z483wWMcmGLf4uiFHDSo8zosQzLhBVALqlHNGVhVCV?=
 =?us-ascii?Q?5iGk0uNU3oXV4Yu5mprrrRI3j7cj+VoxaVs6ONjKTW7Tn7ghlBQpTt+ycj+a?=
 =?us-ascii?Q?ikznstGxS4kVd8PUD9QuBES/Or7xFp897bcJZFS1K6C3MbR1SdURy784OE1d?=
 =?us-ascii?Q?CkNbsDHEgXbkiR28SfFMKuEAlmBAtvtPT/XPR9qsaYg972yXo+cMQYqT4Xnz?=
 =?us-ascii?Q?94hiUX7g3N+Rq2HOvC6oPOJ5caD8XGDELFhiwkdpYld0PhbTBIaXOzHuTkHE?=
 =?us-ascii?Q?ykiqXc2ok7mwcifsm6NsIQRlgI4CQM6pqsYt/HDqda4dmLuuFoqM8ZXxkFtU?=
 =?us-ascii?Q?iTHR0IgHGHM7xuKDgNK42G6fbLde8gyob7aRxNDi+vaBynVYesIJ6rxXCu2Q?=
 =?us-ascii?Q?tPvRYWLKRTcPDagIsV6mjK4qs86deFTU7LxYqyTmEHcXNq8Z24WiA4JxsSAP?=
 =?us-ascii?Q?tUEWsJfegt3tX1guoHTFttptvZZDK/pxA7FNKMcs93h4OjDBGdrHGVj03mp+?=
 =?us-ascii?Q?fi7GVW+KrMepE/IlXtkMEi547dYdBjPilVJdLeq57c2wriClCck6TI4GsT+s?=
 =?us-ascii?Q?Da4py36zhFivtMNU5UTNirTz4rEkwpIkkq8pNmtwD6HpvQgLcyS5Q+4OfBCV?=
 =?us-ascii?Q?TdJxr3pMynPZ3CABi1DNXXS/KKZnDPH52fMHkCdNMeQZXF7wMMe0SyYT090m?=
 =?us-ascii?Q?vLwwnjVX6sQViToFbhbJo/ef07Mc3M00pbGNV6RpUyIYZssEJIv7JjhhsSqC?=
 =?us-ascii?Q?vQmUHpUx4DgrTvLWF/wBN+6R+Wj+0cJJVdfOQNlOULnNOtCQ6Eg6SdNGDN+7?=
 =?us-ascii?Q?tbu4t4JFGAElz4+EwGQM179cWmOr5hYxhZ5z+2M1QRaF9U1OxIOj3/lLpZrd?=
 =?us-ascii?Q?NoKEhW9ZDL76S1TnEWqIwI9j7zhmj5jtHn7kIUCnqtrIqVq4Url9Bu8tpCuI?=
 =?us-ascii?Q?AG9bruof3AgcKHg+igM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aEIhUKT9pkffAHisMw4WrRK6dGUfzG6F2/Wdfo5Jk5588SEilfD6mHTwinps?=
 =?us-ascii?Q?ubtN/TW0q8sNWl4P5ZDd8TRWef738V/veS1gVxVh8bngvs+rUZLVitywd7/X?=
 =?us-ascii?Q?VdDvss9W7vgkOSpvGZ2RESlcXgS8xG7xMye4wyAL/MbWDfrUhMe63RSHhUkf?=
 =?us-ascii?Q?YDyJS4/nH0ZmNWiolNQ304hPXrtjwBxRzr73LAvVn9DVYc4BmVPj9AqKtUTr?=
 =?us-ascii?Q?ZXWnkw/NwcKBd5erPO1qO7pE9rz4WX3686uMQ3w38xl59BocAZdXtYhyn4Zr?=
 =?us-ascii?Q?0qa1D39AqTZDOKObRyaQuSSP81jbxJeXHy/qZD20QrJG7P4SWeWaogwIh1Uo?=
 =?us-ascii?Q?I/ldn92DXAJT/LQWYXX3oRARZcaOFpfJC52XTv5aGVvtYAyTA2ObYcPn6z2t?=
 =?us-ascii?Q?iyZEE5it2YE30KDVOzzt1scqf3AOzDnAvh2/f0kmLhMg47WRN09HHXITlG5I?=
 =?us-ascii?Q?IY9cDWPkS8OSOGJo8T8nA11o+V0+iQiQxtZrKYTFdbXCOnOFUgInL6XPM5LG?=
 =?us-ascii?Q?VPj3/Y9E6LHDFZ1svFYr8eQ5ZB/TWKNri1PCN/i9urhFUKbaBzhJDqM1yunq?=
 =?us-ascii?Q?3lLh6d1sRHKTMjlJFVw9W4KxS5gSUKT3h5KYyQ2Im19dHV+gMj8vp3ZXiYAC?=
 =?us-ascii?Q?8vigiVd7UreIQaPuPLVAXBWL0OSibGh08Nt9ZesgVE8ESeUsEiuTjw8KXund?=
 =?us-ascii?Q?/h6HGwCH+rtAuUS5s63iS0cNM0SdEALYRD3e1FsHbUKE3AAmcng0o0OWUPsy?=
 =?us-ascii?Q?z8bGTA93q3HMvPkq5qoGiCNaz0hjSlIw7i96i7xw38slMjFAP/jOqY0a0smW?=
 =?us-ascii?Q?4hA8z1V7hON2j+w9PkHloAum8ttt/oJTbMQIR0wT+TMx8M+lXbxotTf0baEs?=
 =?us-ascii?Q?Nra0g3ENuO5ni1HN1uggi06iBQrHQCL9b1oyIiuc3nnzbvLyOAlUDZ6ukIIL?=
 =?us-ascii?Q?/jaEf97lsJvoknNP1zZRqX6JU18DbaM6TXJ5ZRj2qrSJ05tL0E55h0jNVkXS?=
 =?us-ascii?Q?tgVbX5IZGX4i7WPZPjAL4EOHj1SbdjWLnDWmBFdEegsEivhUcVLlIKKd0jWG?=
 =?us-ascii?Q?mRLVMX8dUEy8Kr3xyeqGkDgsCsw/6XZ8OWC7/dMr3KeG2ejDhd/P7wcBXSGf?=
 =?us-ascii?Q?O16MzCrpogVBzaocB7rOu7xigwm6ahvj2Wn0jJYLXT6WrYBqBQ8jNS7sHfGH?=
 =?us-ascii?Q?K3lgGRX/yHqCJTzdbPFLBdL58KYsX2rkwb1rI9xa8PBI5osLJUV0zRjKyvc4?=
 =?us-ascii?Q?1S3hl4zU7OTpxdhVS0/KaQiVa2z97MZynBuHOZnNhFFnnTwtx0YKA84gExpv?=
 =?us-ascii?Q?4uM3jFpHyt4U9DgoB/ByrtZz4oH8K+pBjuLeouj4eZL0KNxxG1oWzqGZCALa?=
 =?us-ascii?Q?W+u7ZNwJdOciTGwriWhv2UO6zxkiNdE3gCLUogMEpw0MJiNL2Ef+qRaBm0iO?=
 =?us-ascii?Q?N3EroknhY77kohKZwaw9l/Lmw0GPW3LXtexLIvBgml72Sjtg3cyX48m9ShwA?=
 =?us-ascii?Q?TtO7PPjMrUbtRE3/fapo2A1OeWdqi6JDGOrGjwRjPZIz8YCENZX0HGoROLVE?=
 =?us-ascii?Q?Ylvdj96NTMtwllpxTyfvsTh0illY1JEh7kaaBK0r3tZSsJGaMU1HZyI4wKhA?=
 =?us-ascii?Q?wtaD8W52Ap8/DfSMKzfTPrqwGiEkbJTZQGuljCSEuMUGcK0wLJoTXR8x2j6r?=
 =?us-ascii?Q?SYTpgh4yIgvPB1WfpvgD9X1K7zp1eJfSK+FbF5JRhB8nDfQc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcb167c6-986d-480d-c808-08de5c6ee668
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 00:07:31.7263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sjqeQNNDrBSu17QVG5CCiiLrOjB96lj5BxN+EGMw0oMSrhEpFepQNWJnw6EZmp+n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7470

On Sun, Jan 25, 2026 at 06:53:15PM +0100, Danilo Krummrich wrote:
> 
> Let's take some DRM IOCTL for instance:
> 
> 	struct MyDriver {
> 	    bar: Devres<pci::Bar>,
> 	}
> 
> 	fn ioctl_vm_create(
> 	    drm: &drm::Device<MyDriver>,
> 	    req: &mut uapi::drm_mydriver_vm_create,
> 	    file: &drm::File<MyDriverFile>,
> 	) -> Result<u32> {
> 	    // Runs the closure in an (S)RCU read side critical section if the
> 	    // resource is available, returns ENXIO otherwise.
> 	    drm.bar.try_access_with(|bar| {
> 	        // (S)RCU read side critical section starts here.
> 
> 	        bar.write32(...);
> 
> 	        // (S)RCU read side critical section ends here.
> 	    }).ok_or(ENXIO)?;
> 
> 	    Ok(0)
> 	}

That's the whole issue with DRM right there - allowing driver code to
run after the driver has unregistered from the subsystem is
*dangerous* and creates all these bugs.

From a rust perspective I would argue you should be looking at every
one of those try_access_with() sites in drivers as a code smell that
says something is questionable in the driver or subsystem.

In many other subsystems a driver should *never* use
"try_access_with".  Unfortunately the rust solution forces
synchronize_srcu()'s anyway (which Bartoz rightly pointed out as an
unacceptable performance issue). IMHO since rust has the Device<Bound>
stuff the revocable should have used rwsem, because the expectation
should be that the majority uses access, not try_access.

> I think those examples make it obvious why a revocable implementation on the C
> side can't provide the same value and ergonomics due to language limitations,
> yet I think it makes sense to start experimenting how subsystems can adopt this
> design-pattern in C.

The most important part of this pattern, IMHO, is documenting when you
are in a safe Device<Bound> scope or not.

What the C version of revocable does is just enforce it *everwhere*
without any thought as to if it is papering over a bigger problem. 

In C protecting some limited "device resources" is not nearly good
enough for alot of drivers since the root issue here is often the
author doesn't understand the undocumented contexts when it is
"try_access_with" vs "access" and then makes a lot more errors than
just "device resources". :(

Frankly I don't think "iterating" is going to salvage this idea. The
real value from rust was not in creating a thin wrapper around
SRCU. It is in all the other stuff Danilo has explained.

Jason
