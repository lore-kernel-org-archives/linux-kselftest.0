Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011042.outbound.protection.outlook.com [40.107.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BF12D9EC4;
	Mon, 26 Jan 2026 17:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769447245; cv=fail; b=NDWQwAfTK+6yjJb1vbqHbFoM53xvJBkK3QgjnVlNXLUpxgVCKeeJu3MbcEV05gGPbj+a2dbvS1feXgP6NWEaK5rBoBVR4kkGKGBak5gD9Pq7cOW5IeCOgaoDrfx0rNyC8zMprvlqos6jON+/gQelArTq8aE3oKHWt/rF8VtA7RU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769447245; c=relaxed/simple;
	bh=2d2ZRbu2uqjr7sIV9ezLMrr7lF2RsyWikUMH+2PiLoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Q4iERASbX7h5sCYFFETEM1Ye39bIWsW40RpI2AkF5u2lwSscUCqnhlz081w+NdPZwajIsbyLxEXOsKMFJbbEki90aID/CN6F0VPw5FKogY3jnmQ3h5Dghk7zOhjURh9isNgGGtM5KlL8Kr5IMznBehMqLPzuwwuLo9HzdqboZQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pIsrX+U3; arc=fail smtp.client-ip=40.107.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pIsrX+U3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QHLkQuyYbMy/4X5V6p+MBHEnDqL5O66sp+L7qIfdqF7TonsjRlF55Y3X9t913okBgWxvJ0oeA+nLWrVdw2tN5CW05dGiRmnKjTzKAWpojwOwqBYhSQa9UbyR3w1C/c6rPdO9raYyPCkjNNihsmI184CXd91z/96k8VKnmiTog1FlPbhBtx990lTjwhDW+HwWx0jObynGz9PmKSzIoY+O0MVepCLnYtwMB11ACHVIe1TaY2VoBpN4suLK6RKU/UMOnM9pCBb2wQY4Vu6q1USjU13As3GZRiiMKDk9/57xLb5FAVmRUg0+VdKrsoLMBHch2tcYJScQQolxqBMqYV5wjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQo0b/qFOLIqqusNwTN2VzFPCmdjzaDP1uZhMwP2xLk=;
 b=b3/GZovF+quhM7MzTOq9k3eOu3SqQIPwNQbemwrCUHaTj0e4OIce8ydCfyv/fe9pn0W3bXa01uOcpe+OeStEIurDBuPTtEI2lhFW4J8ZbBzuu406X0EBKQrcjIKajyH9dB2+64dM9Hnb+rbNnXwMJesKO52j4+tYr61YkgY5k1Kvl5lqNGd81Q8HWu44F4gyF8fOgR+KZ/bI2bupc7hIZaY7SxP8knEZ1+gGZwjLCh0mBhyF0qUWWyhVUN+JKj5jeQkttVOD9NzGDvRIkghigMR53q0QQ9VDU2kGB5lczc9cy8nwX+bG/R/FZNG7SIMQXoP+y20TAiXlh75H7Z9ngg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQo0b/qFOLIqqusNwTN2VzFPCmdjzaDP1uZhMwP2xLk=;
 b=pIsrX+U3IT/FxGyfOtwG1I7t/zltK2EmXlsSpB7GvlbruRs0E3LvOmXp5FjWVPr4mjPEbP1iF8DqsleV1tLlcZ1iGBhj6aNN2qrHBbl6/F4qnCWHzeFDU/cGszzgHwtFi0HF32NjgVrful9mPkfajLVHoqd/1ubIF7QKvNNM16a41eZevr128MGpr0aCAmTFuUW73dE0kbgUVbZNt18gKw6JeDyQjGIWEuPCBuJXffzuTj6va/jIETdEhAJh/s3ZI47KPY+APFqlrdQ7Xz5ZSCe9pZ32szQs5mYtXz6HVvOO0UQbarymKbshH5Slv8lWRj//36nH3Dttpb00I1IV3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SA1PR12MB8858.namprd12.prod.outlook.com (2603:10b6:806:385::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 17:07:21 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%3]) with mapi id 15.20.9542.015; Mon, 26 Jan 2026
 17:07:21 +0000
Date: Mon, 26 Jan 2026 13:07:20 -0400
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
Message-ID: <20260126170720.GN1134360@nvidia.com>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
 <DFXV1QMQMTRK.2W8SWGVHS2K69@kernel.org>
 <20260126000730.GI1134360@nvidia.com>
 <DFYNFXYTXBIW.314K249BPTA1Z@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DFYNFXYTXBIW.314K249BPTA1Z@kernel.org>
X-ClientProxiedBy: BLAPR03CA0180.namprd03.prod.outlook.com
 (2603:10b6:208:32f::10) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SA1PR12MB8858:EE_
X-MS-Office365-Filtering-Correlation-Id: ee0f2895-7f45-4b49-fc01-08de5cfd5e3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oSMqkcdCJe59rvrVEyTB9N1VXOd6d+Izqwokoh1IHcshowtR7M8YwFSn+ItD?=
 =?us-ascii?Q?OLfK3hNt0dQRbFNAqTaFHJmbUOHoyJusXuQWMCD+g2NTRixr9SWsmnVrdqvY?=
 =?us-ascii?Q?vnOJbsgEYCNDOdyPgP5YOCmG5Vdq9c6RhF1sbV0LVDrrKT0azXiXlr3iP8E7?=
 =?us-ascii?Q?gOLKQH+/EjPaIpj/eTCcP989Ojvfp+jtDQFNanIRB9dgeiw5MqzZcp3dq9rI?=
 =?us-ascii?Q?5pJm2QoZMyn2SJCmp/XX1yyrWxXgawvmj7v2rtqpJ2dYD9lfj37ePZ+SsZQ8?=
 =?us-ascii?Q?VHPf2Fn0DNhJGd7gaQQmKa4xtEHJYao/c2uZWZ2akf270dy5u9BO73pgB5gp?=
 =?us-ascii?Q?sp/vPF21zyfvVAZpKa2p9cGnApDs41mziyTm8lCKlWa1HbB5gSOM9Ka19Jql?=
 =?us-ascii?Q?rdaJK5k0kr480hTLgR+NTYFjAsfcLXgdGQ/Tesjazjr1/VW2koXRCbXpxF32?=
 =?us-ascii?Q?ZNfIozvQRFbTfUTxnnrvX5OxtPjz+v2RWWJnI+hSF/DidjHA1+cSvAGSlaxO?=
 =?us-ascii?Q?Uvn7BORFpYZY2d61PIqrH7YovCtmEGa/WaiiOefKi3GSfiYoK0r/7n0Dbo4J?=
 =?us-ascii?Q?+GS60uonTcTJmoRDH9sH3bUTUP3kD70HmIRuKBxHwcjPIfpMMehfwmQCl7Xp?=
 =?us-ascii?Q?CMFEDzzheLTZrxTuKVzbZ/b7jKB5JpIYD7R2tur7QboRx/5HlVWKU0l+HHq3?=
 =?us-ascii?Q?+YmYGhjU2Y7cTpVT3oeA0xWy02WmGBXxG0VtDpyTfMDLPlcsvHh/YZ0F7wTv?=
 =?us-ascii?Q?kEeWGUQ71ETobJutoZGDlpxWzjlKI0w4pBSpxFB1wTmfHM5YiSqi4MmRR2gJ?=
 =?us-ascii?Q?G7WuFo76qsPqT4pH4Lbe+AMSsNf2CdeD0hEQwSdV9GqhS1acUlC1kzH9uEkG?=
 =?us-ascii?Q?xfQLAkg/AMGCJCSLwi4M5WmWdMyx16xj3OZ3nQC79nqEDqAQ/81TVlyd/dOg?=
 =?us-ascii?Q?y5BiAZWqhStUlO9LSCXzjlt3S4Wpnu9Khti7Xr3fu/JavjUsJBrfA1GFMKPA?=
 =?us-ascii?Q?AlGbm0xz1PlSwyrqIlhPH9Z4l4EmZK8uOBvHd8pUaLeODLdEuNfaDpqo/jKF?=
 =?us-ascii?Q?dsBK9XHtK5nY10kjP/Sg5ZnlNDvlJo8zKHHh06xWV0zGXafp/qGlEKHJc9m/?=
 =?us-ascii?Q?jJoplOHQMQsrek9h8IJ40V4TXBgeq08BWgV1goIe/ddfhPoyN9sKK4Qpp2KP?=
 =?us-ascii?Q?y3WCo60Kt51qYcGVudLZCBjuVaLDN+iGTmINh28SktmCz0ySyAvE+XBHxe5Z?=
 =?us-ascii?Q?sii3Gk6/eD5oCbvX9ubQKb4oPyXHyxbO939ruPKoDIX0KLfPjVZMvG/eHwM/?=
 =?us-ascii?Q?TAPwlsFxb30F6kzcb6AqRvA0c/fNvM0p1d+wKrPKFkH+VKAJEIeU9yIwBUeP?=
 =?us-ascii?Q?KjkB02LgQwMALjDrhDu6DffPfMSQE+LjW1mqpoCFxrUInx6QsCymbC90d/3R?=
 =?us-ascii?Q?ZuODlXNlQf9cMocqVi+4RMvzhh53li+JrYLpQh02aIoQjI+B+2oBNTW15/pn?=
 =?us-ascii?Q?cRT457cYE7fxGU1TnhFkTqB6IB4sgLdljChGLGqrKoln7YIkZtz+0xRwfirI?=
 =?us-ascii?Q?BRzE91oQD4YNTgTOlNI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?500vRTOUeK0EelEZsbI4DttS99IdekCQGffRYcOa4FuGH9uK47NiDECWwG/5?=
 =?us-ascii?Q?p9VQBO+1QPh8sRwXI/k5/pXLOye4rBK8F/jzwgNMdeCKbe/OJQY+wFwsm+SO?=
 =?us-ascii?Q?LctpXMyc4wQ/8TR4S3hAoCKpdvH1X6Y4CXzSVhA9I53BmsGlA2a4wA/NR1P5?=
 =?us-ascii?Q?qiBme57W4ok4qmCqn5Zlyo0TYAxWSCz2vl8janB9UQSRWvbWBINDH4OLntzL?=
 =?us-ascii?Q?DJKe7bB+a/L/4oooIeUTRy6DXM/+p7vDBttQYjF8cG8Bp898NuJ66e9OBhFe?=
 =?us-ascii?Q?04r3RPcxWiyi2qg1Ws1l0IBnIHljplFVggfePC4vTDmEOAo1pv/73Dm5yP9+?=
 =?us-ascii?Q?Ts8+Htm96rLUUTlJQwXbkpElBjd98ItO2jt6rz3S8XceJT+orglOgJkNrejI?=
 =?us-ascii?Q?ch3Juf3ygCqWqjr4L8EOFoUZYKcoND0cmw+AsR7NvRI4vOsk63dlWTjpIWtg?=
 =?us-ascii?Q?lkLU8tkKZefvS1MFxBZYWkXyqcwzVq4rySA05h+ICqEXmT2wLywZfhQxM2iU?=
 =?us-ascii?Q?KF/WJdDdCGojE4sYg7c64+A0rg+kWrhyif7kWDHDAi3Sh7qegfb6V/LBvv5M?=
 =?us-ascii?Q?Vql7JClQqhaNgXqqe35dQs0pcXvU0tPet1lzV6rVI3vuiJDi9+CG5WLGNVp/?=
 =?us-ascii?Q?VBzM2PSHWmU7lpl+KBdSP2gdP1zsLwduAK9/3vc8c6S6nXoK0/MQB6uotXOC?=
 =?us-ascii?Q?CJl0PU76FJK9l9t1IPEnhQRWyEjSImgrsWwsSdWJDsIK/m3FQCsN4hxGpYtz?=
 =?us-ascii?Q?Q5JJm8dmMhD9E+QsyErBHqWWjy5Ek7MYYjaGDQWhSlHxpmP7PcP/eeoBTvrJ?=
 =?us-ascii?Q?QwBF/xR9s2rfNphleiyyq8tLG45+IFNaX051Q6v9ABWQP66CwuQjD5AKZa1i?=
 =?us-ascii?Q?nsi4fT7JWZ1eh3PlzzOLqYEM8q/B+OwPAWlGZ8INo1KKgFnWc8NmYJQuJQIj?=
 =?us-ascii?Q?EqKKpHkJRq3fvVsMJSOjAghx/mEVSiipIQpYvBp2nEeq8dpayb8CMaIpeNxQ?=
 =?us-ascii?Q?XuyY8kFKKRLDNh5XH8vrPvl0VO+z9ClYNpethjEiJqFYtVKQfn8q/ueKLGtx?=
 =?us-ascii?Q?OB3OBlq6VHJsJ+G4Z/oyieGntldNHkie08SOE8MkNL0pKVl63PY6HXxjQjer?=
 =?us-ascii?Q?d06kHRNTXrKG72kLMDZkxs7Ll9d6CCIP9LCsmKXz3U8LP9l3yRcHQgEroFK7?=
 =?us-ascii?Q?yxYD45YkpVRWMJ4eeET5wiMtmGb/LwNRDWIU/AL7g90ohuaU3VbOOuiMYLbf?=
 =?us-ascii?Q?s+2x34yj/wNbBXUbiPMGFxH4jhutK9jo6B2a/txr4SnLtQwepIn8nj+9V6XQ?=
 =?us-ascii?Q?8qlPb7ir4SIKslDYYEq95dXZ2VwmojSNIfk/NylR0mf7kBRp6OEUaaKycjVt?=
 =?us-ascii?Q?dHxItmEkSza1Z8RZiNrOQKfFok6g2PDdJBB2mYpXKhnhvr/cUAjeyQJMyyNq?=
 =?us-ascii?Q?qkJEpQ5y3HYI9hoX26EyxbWK5NLF/mExXcIs0HIKTzVeUVGy4gNxcMQX7A7r?=
 =?us-ascii?Q?eOL43jF7ZUOGvF0eE2jTJ6Phf0I3By56DtD05S70TipU1oU1Wp8duM82pJQ6?=
 =?us-ascii?Q?J8/2g96gAE54wzxjuShXbUi3sJkBGHRrjxTVSNfmXj4NJ8+ZwEfCcrcO+dX2?=
 =?us-ascii?Q?zv41ZEp2WlGDGa3BEeWafnOwU4kZMSxpaGtYvAzqaXdtj63ma76zE0BdG0uJ?=
 =?us-ascii?Q?P4ADYM+Db5sHMDaER8Q997bpCL6MoxCkyZpZRoyHmBXsWFqb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee0f2895-7f45-4b49-fc01-08de5cfd5e3d
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 17:07:21.2103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: noeFrr/wE9sAc/3oaWD8CPJzDWoddTQE9uKyszt2CIdVSx84Xu0bVxiLfcdX6V+E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8858

On Mon, Jan 26, 2026 at 05:08:20PM +0100, Danilo Krummrich wrote:
> On Mon Jan 26, 2026 at 1:07 AM CET, Jason Gunthorpe wrote:
> > That's the whole issue with DRM right there - allowing driver code to
> > run after the driver has unregistered from the subsystem is
> > *dangerous* and creates all these bugs.
> 
> Unfortunately, it is necessary (at least to a certain extend) in DRM. I think
> there is space for improvements, but I don't think we can get rid of this
> entirely, especially on the KMS side AFAIK.

From what I saw alot of the issue with DRM was how it works the fops,
instead of the core subsytem managing the fops and calling the driver,
the driver managed its own fops and called back to the core.

Sure, the issues may be very hard to fix in existing code, but I find
it hard to swallow the idea that a subsystem couldn't own all the
fops/etc and guard every driver callback with a lock to generate the
right kind of fence..

> > IMHO since rust has the Device<Bound> stuff the revocable should have used
> > rwsem, because the expectation should be that the majority uses access, not
> > try_access.
> 
> Yes, the majority of uses is access(), not try_access(); not sure if rwsem is
> the better solution though.

rwsem is much faster on destroy and somewhat slower on read. Which
sounds to match the use case here. Ie you wouldn't need to do special
effort to bundle the synchronize_srcu()

Jason
