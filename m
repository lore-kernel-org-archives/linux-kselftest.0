Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010022.outbound.protection.outlook.com [52.101.56.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFAE1A3164;
	Thu, 29 Jan 2026 13:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769693688; cv=fail; b=eUB5/w4eSBjHjslHx9TP3AdLsSCeBBuyOFPQjZQ2miBl5Ku4zoSEwAbXNdcA20yb5/F2MUf076eG9XdUP7+3ctZlDNrp9Aw6DtVL9vR1bNREsE6MJruxs6vBGU1MWziJV5QT3BDa2HYtDysbd3403MeKFShRBowitOQpvZXl0II=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769693688; c=relaxed/simple;
	bh=/9YkWZR2nhcOHuCEb4ynx8dmytcIT54MxMOKYZQKaZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HzJa7rw2JM/EGPuWN2FBUSBbr4TC1zRtu0GtrSaPVHSeQjXiWd4mzbvL4UC7s+fyHIKqQAzR0dMa+I85qMUD+jvyv56JDCKF/gIOv/euH5ommnaOldNAlFW7VbF3kybMfN7yeT6DMNdF6nG2hodfhZRQJ5zXNfmWuq99GQeFM3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cPpt6zu+; arc=fail smtp.client-ip=52.101.56.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cPpt6zu+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ucUTaWs2N8rD0u5iqFJBTKwjNILKZFQKAA77YwBVj4ZmqtXGbo7rfrjo0vpeABsS3qRAYbKwE/4Iel4IY+RAN/uAIqS7Y6PWAAYrimjd7OfJOEyGsQXZvbhqIdreAzhMbMOe+MNjMLjv7mLvw7BdINEPTT17rgWCKIqfBWA1jTQO739mjOgnyjM9QW1p0ALd7PC+fSjlUWzdruc3x42QOpz7eDkIzm3bsBQ4um9ttz2cW9JpwbJO+A7lWumIsnUD68Gf6wM69Owu/gPyeIJ6JzjSyrKNWfPlAj85wJj4vaK3eUf9o2rnehRAwi8lNLuu9SwOCYPijvJAmW/6yHT8Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lKuputwSiMs7XRGfeOoPQE6FVyHa8f97/TfqGth78M0=;
 b=jtQ6Nlc2/8LzFDMrOtZXm8lhdZBwZP2SWkTPmn+12EHLknowWxF9RgWwAmPJUJMOkyJ3lJclrSFMPxhay2UmDXiJi6uWydK57QC2QA4cXvCMnZb/w1mCCzxCU1kOtv5PMfwlydFzYZwBnwJ1SdbHXEBUbsgfD/bjNyBWN+BVxRTVAp++4s4LHP0SgmV+VPzSo4w5ulFGoqNnM/NzvfUZxjb/4xnB50nA+V2F5KZVLxNYd+TPh75RoJgtfamJw4bP9y2kMkr70Kf9NpD3OqPSEtJVqCmB2uPX1+Zt1tjZVs1f+ChSXIT5542w2+YsHWcciiw0gKFkSo+KmgQZvRnZjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lKuputwSiMs7XRGfeOoPQE6FVyHa8f97/TfqGth78M0=;
 b=cPpt6zu+m/hEyEGqSjy/YsG19zlqPN0b3c/eTPMV4GXWzp1ZjySo2+amToFPtP7JsikFgbE0u23b0cAhzZtQFatTYznHuYkXjzQukJmuFfA8mlJliMn0c1JH0z6+Q/7HGk1laFnAh3INQZoaZk2OENToylCEByRaGmk/wHcR+ywfKitCi7SjjKIIG3FaiAPpvy/D8Ef5UwejLFVZDJzgRgwtsgoOkzpRKGDCfWM/5gcAeQIRHL8rJUU+LGbOegm/3R/xF0foQ8mj5JFexK00s/P0D5J0h2G5DY0vsvvk8+Dl7CQBTAMAmx+lYSUXmfjhFQL4uiMNWf5AzjUzxpNTNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SJ0PR12MB8115.namprd12.prod.outlook.com (2603:10b6:a03:4e3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 13:34:41 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9564.010; Thu, 29 Jan 2026
 13:34:41 +0000
Date: Thu, 29 Jan 2026 09:34:40 -0400
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
Message-ID: <20260129133440.GD2223369@nvidia.com>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
 <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
 <CAESzEGiA2DSp79pkjxBA5X-DWmSAAgyAF7usKn253jkGpYJMew@mail.gmail.com>
 <20260127235232.GS1134360@nvidia.com>
 <20260129010822.GA3310904@killaraus>
 <20260129012322.GC2223369@nvidia.com>
 <20260129103850.GA3317328@killaraus>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129103850.GA3317328@killaraus>
X-ClientProxiedBy: MN2PR15CA0041.namprd15.prod.outlook.com
 (2603:10b6:208:237::10) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SJ0PR12MB8115:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e234c8b-d928-488a-bcb6-08de5f3b2800
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vkNXblbATGUrPiwAGy0Ae2f2UyE/wl7fW7gbMlR2eK5JpceHmxRYB/1hKyT4?=
 =?us-ascii?Q?mJw+d3dJVwfuC5QihdZTd0dF7IB1FazkmPzQGIKO/1mPBkE3oaNzVvpJ5EYz?=
 =?us-ascii?Q?5feF1qLvKnkoUZfzWOup+NE9dPefqVoq7ew+FsU50y2geO7TNqNmjZOrilYP?=
 =?us-ascii?Q?PsmRZlFuMPt5FwEM1Dj1VpjtbDkvhtqghMz34J2Nms5XHDMe/UuBTWWYaIrK?=
 =?us-ascii?Q?8CKN5QEhZQobXllCqUEdOWcM2eFwrQMeI9xqG7Dxf2JLmYrD9IZ6uIY6O3VO?=
 =?us-ascii?Q?uFoUVmT8PwShoAz7JcpeynxrZq3lMuZ0szpZ5UYQJgUe4RSKJ31+AVylMQKN?=
 =?us-ascii?Q?XPOdB7Cjdv0ndx20n5x7VQXfSEAIHzp/ht8cPn2d/eAIY9+obdsp4MPLpcBl?=
 =?us-ascii?Q?1dv6OoQupJBBgF3RnwE+GHvLlaShuxImwTNx1I4NoHos/0leaCzEpmZRYmk2?=
 =?us-ascii?Q?OaoUIY17pw0yTxdWulnIBvQP6TGlalwIKithie0pcO6kczDKoXPCDpVdPBHj?=
 =?us-ascii?Q?Lc3vHuY13rcS7EbId9oddn4GKUvSw1bJ+xpvWhyoccKzMRSbTzW0b4YU+D6x?=
 =?us-ascii?Q?cUtjO6feZl9rGF6dY3ONHS5axMxEFAI329+Yzh2DMV8F001X2jA8M9zZBFvu?=
 =?us-ascii?Q?nSR0n+q2OK5G0WDvhYdlPgJpdtyRssENJmGBNE6qRAe+4mo4jWK3LZZtQuIq?=
 =?us-ascii?Q?xSyBFt5Y8aqh5CHKzvJHvKDjQ4vI3n2W6vaipkCCYi4gphSv/7WNVIe/yFgK?=
 =?us-ascii?Q?XaoacY1U/r4uAD4dqHaIF9nYuhIDDaeeaxJd6SoDpvas6dSGXXrVxY/5Yk8u?=
 =?us-ascii?Q?T5a2wxBo+vWIrw8p73BSYIxdigBRbkoVhRaG+5EyWZNd4kp+iEPZQ/ZwPx10?=
 =?us-ascii?Q?Uv34XMkQbJSF44iKvVxAcy6Al+Pj+947IjoI7qGaWSABPEmX1X67j0YvX20Y?=
 =?us-ascii?Q?Hv3i8L+Bz7uGxVNS0mQX+tWPaGLvNI3SNYmKxZz3vBiO/LDUVimtbDC1Rdr0?=
 =?us-ascii?Q?K9pZqC9dcMSO9jZrwwkbSwZ03/6rCpuJE6SHc/7uMmL4XwIM4DxRieRnIAJc?=
 =?us-ascii?Q?AtY0eQKpv4tP/V4seKIR7prmSfE2ysQ220b1KST6Ii6XppFENMx1+5XF4J3S?=
 =?us-ascii?Q?HounhuSCDYoTEieuaftOimPWfma9mlBgxaL+tVFKRvC1J2y4j8mxmqPZ16MZ?=
 =?us-ascii?Q?+13ByR5k9+JaLmmO1stM32CNaTSTXD8Y+MY7mcDkf1UJ9SjY20i3N4q8gtxm?=
 =?us-ascii?Q?83MTRhA0+tnbxDdAKpSErc0CHEQD0gLflBpU5a6T4x2N9/n6wsIZRcPyd+wR?=
 =?us-ascii?Q?Hh61IMgoG2GhKI9OJir1/gbRYGTkDtA2vK9mClK2tMqmkBV45RL/Rl0135HQ?=
 =?us-ascii?Q?Sqy0VVcAAygYfWcjNdJcnP86RxPQe4zBrcV6B9eDAVMN1jg/qRLIX+L5d6qM?=
 =?us-ascii?Q?aDRZSD33qguMGGkueosBxT2YZKQj2rh/f8q6xyHeZMW0jaS2scvsGV+owbhN?=
 =?us-ascii?Q?2rOCk+igThRiMpUgj7olgjvNuUwBdSqfZyAlLW+kuCSux7nXukqkk0smJ1KL?=
 =?us-ascii?Q?xASazEmQIe0LrPBL9iY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DOdsIKQdSe0ETrSmdGsPPQfV6cPjuIlFJuFmgX1maP5E0DoY/2mFCyG6NR5O?=
 =?us-ascii?Q?V58iossOK6mlcwr0X7hR55WJA1vtCs7/Yzht8Dp2hoSJXQpJ8FnLDJDre/mK?=
 =?us-ascii?Q?Icx8my6rJ4syP4nkJlfiu2efERcXp479m1peIO7NB/6Tf72MK2LZMn0XRPET?=
 =?us-ascii?Q?3xJJNjVO5Zf+e8JWKUQjWkHyMzCvT7YhujMho0O4WjAMdwKK9PIjtqdsgY42?=
 =?us-ascii?Q?odqxpFxn3MhVIzGANbqC4yfKPSOjxQcnBkrmfY295yqwjnBPEGg7v73dNQFp?=
 =?us-ascii?Q?EGbmwPxstq/x9/nZ0a5t/0gn1+KesW9nreg+swRXh2WHcWfwX4G2/ENXnV8i?=
 =?us-ascii?Q?o4rn8xI1ztX6YpKRBE7GZsqVgMrem3p4Case/y7TmyPqF/cfEyJqNFngN92i?=
 =?us-ascii?Q?R/yfbfv4OiHebCv1n1/IHbdU40BaXxeuEP+s0eYMr3Coz3tMEJRlOSeIu1j8?=
 =?us-ascii?Q?MUkMrg01jgmle+8pz01WscefEpFj7ilihwTHe2Nv89cerUBfRqXMgg3W96/N?=
 =?us-ascii?Q?3FO84Y3+OERyetnHEMdCou31rgrwIY0dHKgj8z9fpgzgjFu4p05FoWjbN4RA?=
 =?us-ascii?Q?vxV+Yjp2UFP+kGCHzNziMKd7fnMSyfUdxjPTc/h1bHSXr3ZdVYX5+Ki7LO0O?=
 =?us-ascii?Q?4Ut7cYKrDZfLSxsCmh2yFG48Qi0ngccfy3aedTgEVFDo83OycDFwzGhnDf6y?=
 =?us-ascii?Q?+PLE1lEWlV8PAkUWgvCu96BIlMrbGbFT/c1yj3LHHVvfnQzqBWA3SDLj541F?=
 =?us-ascii?Q?hWXofI0nPeGXRCW0PxE/WnShJV06FjWwIQpjh/CFQN32X4DaSs0GK1+puoFj?=
 =?us-ascii?Q?1osajJKmorngh7Efy5/+w8WLjp0VzY7LN/y+uBNRtshc0xl0D/cOqxdv2To1?=
 =?us-ascii?Q?XxJKt+K1/EwBYmUeighy0ZKDEjVvwgCpK+XPr0Qa05MpmLvHcabSw7A7gsAz?=
 =?us-ascii?Q?MRWOazLkNvGXcnbl9hfHwK8aISZEImLCoX136CIW/pTv9iim/oJEXXQDIE1X?=
 =?us-ascii?Q?YjEq8yp7N7rE7NK9+82HA16SANPqcNOS+NscKKo2MIodPVvMqsb8LElYt5bp?=
 =?us-ascii?Q?uefBSFlvhRxnS0Z2xuHgTtcTxhg1OCW7Fv5z7LEYsDqRbtVLMqdf5AhrIq6d?=
 =?us-ascii?Q?eJHJukPJqoD8+0nK6emgRdHxoSSaYrcywW4Yhab7SXioJ9V73/NyvPQRHbhy?=
 =?us-ascii?Q?L/QXTdlrNkvhigyeRuN9E09vLiYHGmeG5fz+uMOMJICtS7ASgUlopVqT6jkK?=
 =?us-ascii?Q?Q3eKKxAh1npSDhFV9Jn30lOkMpBnE4FazTrc86DPm+3Lc507QG7xEMyAr45f?=
 =?us-ascii?Q?KBP8bcs+3HooJcLHiJwH8gNc6QFOUfmeGcL/C9VudUrZBlqGu5y/Oi+RqakD?=
 =?us-ascii?Q?mNVulfLIqWd9XQX8SKiM3zGwNlObzIbQ0/HPpURmzZztHbmogKL7A/sL6lZd?=
 =?us-ascii?Q?45Z8wHj5slOTi2l3ZYIIF6ct2pf1BA92yQmS5quCx3QWBqNo/PmCaUI1e1f8?=
 =?us-ascii?Q?HVwH+tBC8CA3aQGFFx4e5bizlokv5eUv2a9sAH9Ac23EaMicm2KMPF2qC6+d?=
 =?us-ascii?Q?Ic1ngZhC3gLhi3R2Yio/JYGtNlUTpIn0yRQHJ6j3p6aW69K8t2p+/oeEyw/l?=
 =?us-ascii?Q?HhPFI1AHlnSiGtzIslYyYA+a4lC2apj41IEre4xV6+88T6h/EIUI7eeuxDy1?=
 =?us-ascii?Q?eUutAi2q3CG4Q6O/tPYFbrcAgm/GA4RiGC2bvO9Ls83VEsAz/J1IW9dy0Hgz?=
 =?us-ascii?Q?TuYmWEu3tw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e234c8b-d928-488a-bcb6-08de5f3b2800
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 13:34:41.3636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4WohsIf/rDPZDnVNu1RSPtEwAQUm/mzEI7U+pfIhuhL+uFgT30grrZC0GGkNZMSe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8115

On Thu, Jan 29, 2026 at 12:38:50PM +0200, Laurent Pinchart wrote:
> On Wed, Jan 28, 2026 at 09:23:22PM -0400, Jason Gunthorpe wrote:
> > On Thu, Jan 29, 2026 at 03:08:22AM +0200, Laurent Pinchart wrote:
> > > > The latter already have robust schemes to help the driver shutdown and
> > > > end the concurrent operations. ie cancel_work_sync(),
> > > > del_timer_sync(), free_irq(), and *notifier_unregister().
> > > 
> > > One a side note, devm_request_irq() is another of the devm_* helpers
> > > that cause race conditions, as interrupt handlers can run right after
> > > .remove() returns, which drivers will most likely not handle correctly.
> > 
> > Yes! You *cannot* intermix devm and non-devm approaches without
> > creating very subtle bugs exactly like this. If your subsystem does
> > not provide a "devm register" helper its drivers shouldn't use devm.
> 
> I'd relax that rule a bit. There are resources that drivers must never,
> ever access after .remove(), such as MMIO. Using devm_ioremap* should
> therefore be safe in all cases.

Yeah, probably, but I've seen driver using devm before & after
non-devm and it is just too hard to tell if things are going to
even work right.

To be fair the IRQ issue is always more involved. The subsystem should
provide a state after unregistration where the memory is still around
and the IRQ path into the subsystem becomes a NOP. The driver then
frees the IRQ, fences work and releases the driver memory.

It is hard to do this sequence with devm..

I think a lot of places manage without this because seeing interrupts
after unregister is probably a rare race condition in their HW.

> > But sure, it is all easy once you figure out how to give the fops shim
> > some place to store all this state since people would not agree to
> > make this a universal cost to all fops.
> 
> I didn't see any push back against Dan's proposal to store that
> information in struct cdev, did I miss something ? 

I also don't see an issue with that, especially if we can stack misc
on top of cdev to share the same logic.

I think if you take that idea and the other proposal to shim the fops
with ones that use the cdev data then we can see some
cdev_unregister_sync() primitive.

Jason
