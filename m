Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011047.outbound.protection.outlook.com [52.101.62.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4BF2F6571;
	Tue, 27 Jan 2026 23:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769557960; cv=fail; b=K5t+qyjMwBv/uTIzLhIAGrGxT1ecZTrSYan5zw8z3BUZGKPpYVglJcQwV2ZIO23bjP2OIX6jxei4YpwgWnPJewQRtwrsNT/0SldacAUEJfFff5ad5rVXdCC3PwGQD1cSQQvlqMS1COMC/wfbOrHj6+xf2MBlPfddkXC8eizQoN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769557960; c=relaxed/simple;
	bh=ykiq+rjcCY/Osa7UJYcUJ/2uv/X597w5uuFOCwa0bHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ct730sLz8x0ykKT5B8heg8GmhEsIIf+dMwcEpIBk/GMmarOF6wF/VJLxN60FpU3MVxox0fLyv5nZ9XIpL8vB2gZjWld/HKBOR+FgLcjlwtIYGWb3w2f0l/WhghZf2mpmcphOxqs/aRl+3Gld46t4Bl6dg5nW9Kb7dIinD09y80k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Q5Xl8MSD; arc=fail smtp.client-ip=52.101.62.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Q5Xl8MSD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FIjDl/C4e2wrRpoG7q9DtzxEaIKoyZ16CAyl/eZyZFGj5ia1ZLkfaa3e8PFe0Uwt4bvC+4W1xS4HmJ/+G7nLlMDE/2NmCiHGo6njJkEqLL3lC1ickS8yBzVdtOESYJT2pbhAd15eUuqIm3lyjItMzaPReiJx34eBDTun1JPWH5rpk7IXR54Ik1lYQWjIAgEfNDyH7//jwV8hxIjqlesjyF2BJwD3x2oV+QmtK0D3RRRhUd6hZZUQ7iwLvnjEFmkKNajuUzeEMTSUmvi3/BTrkmEXtJJjM2eiVFnmAieuEgaDGSeulYBAukpGPB6yGHUy7A4r32LocolHvuSOz6Q9kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R7sAM7D5SxCD9X+A+3dzLomUn8Fb/hxvOj++4EHkeBQ=;
 b=KRfStw0x0x/wWnKxijPjSbuSSuehe6DHyUfa+N6h9pPjd1GrloqcMynw0x48Us7Hc3dzDPHRWoyynRMF0DxA3Dg/c9zgKsWDJB6pwTVVFUCeCjhih5ruR2vsm95l7bU1UA2AiMeCmGuR5eqKRgvMGX1muU0RINo1YCgruBCByte1jwJXWm9/Xb0Uuq52tKmsritSIQBSU02MaBEmPmBqhe10TgMbOfBgvYLqjFff9suWDNeFlsMdEJJ51P9O/Eq30RuQOrJnsWjOFVLE6PHhcwTp5XB5EqI90PlzW3lQQqY7gcxVec4WleOrDCmTElvrkqWa/l68pVyljdqW0OcPvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7sAM7D5SxCD9X+A+3dzLomUn8Fb/hxvOj++4EHkeBQ=;
 b=Q5Xl8MSD/E87Jo2RQAWpzCjo+38YoRimssmkWU1U1wXK6bqsSpx/F8ZpmfkKxlWk2F2Pq13i2J9s4kyb/xgUCjdJ6+RZ81rab1ffHLy2WIJcvaLKKI+NnR+M8UkrSm9C56iRUep+1wb3yFlFXQLBkqYdaRsZ/MLf3l1ei46ftJa27UVFqtiMmmQ53XoR25uDCephksG3G5JN7oXsplx/lrEEB/H76WJkAu6GpBvHYVK/wj3ktvMJAp79qwwqIRF3Z99FAS7ZDpXyOFDFrp0sVRJ0qFFfAKe3eYWPW9+Je4bUZZy1I5rBZ1M9nAVkKUmfk7rsWYufS5wdt2IZWNJThQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by PH7PR12MB7818.namprd12.prod.outlook.com (2603:10b6:510:269::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Tue, 27 Jan
 2026 23:52:34 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%3]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 23:52:33 +0000
Date: Tue, 27 Jan 2026 19:52:32 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
Message-ID: <20260127235232.GS1134360@nvidia.com>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
 <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
 <CAESzEGiA2DSp79pkjxBA5X-DWmSAAgyAF7usKn253jkGpYJMew@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAESzEGiA2DSp79pkjxBA5X-DWmSAAgyAF7usKn253jkGpYJMew@mail.gmail.com>
X-ClientProxiedBy: IA1P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:464::8) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|PH7PR12MB7818:EE_
X-MS-Office365-Filtering-Correlation-Id: 1552ca33-3997-4b4b-b630-08de5dff2423
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bD+UkoJLSSRXCUA7QvoxtzzeFju0/bFS3l4AomZnt7TJHkl+B0ND77eIZ+jW?=
 =?us-ascii?Q?ha07q+VFAcEKp3QiGCzwngkte1SsmMd4WmsOSkGMgOJnXY/EyC/L3M2YRL1M?=
 =?us-ascii?Q?2b1vK7LBu5viG0oKEMLUzvAabt3cJ3AaE4LNXE7ocKtboR9fq172jlf7Z2K5?=
 =?us-ascii?Q?EAQtl7Nmw2lk/VGHIRSVNCB4q5Woa0aiU18CyDfBujkeX3NrtrdOkRKlQ490?=
 =?us-ascii?Q?72M71MVVLxblincapY/+huRWppo5Of8o5u0zcy0X6KrNadNCR5pJw9aKF3Vd?=
 =?us-ascii?Q?2cIP8VQTUNfxVTcwU+HqaUSS8I7DrHufRBboDYn/scdgxlVOu9u9SfmdsoR9?=
 =?us-ascii?Q?V2pD+pD8Z/GBdnFNdRg/Oja0qWshcxtkMygvz+r6pm7g3P9H5/MajLMPzQuc?=
 =?us-ascii?Q?RRc/V0bfKsqldiT9AzyqPQg24ZrRAGS8zVaQUC4IiTaPkOUTaUWXxzd2NL54?=
 =?us-ascii?Q?gbhZStg/OOTNbGWwOMWpPXXaGla92pblvfmDhMrbD2qGLNhy/S+S+MB9yEEc?=
 =?us-ascii?Q?2XQ/tmYqGSLqSPllUaO36EjxzPzORwGoM1YKvdcmaL8aX8PwznYq7pWFJ0LN?=
 =?us-ascii?Q?DhvvZYSl7AFsW4dYawSDlI15YWsHZBrlY2xVP52eWt+Zv7dtM+6CB+Vt2IfW?=
 =?us-ascii?Q?Bn8wg5q2igSRspUy1dgMDsZgdcxvyWkYd818tE0ae0gxHzNJo48sbQTijntW?=
 =?us-ascii?Q?PC8Kk8wHDNvAkjDB0F+/1iMYlbd+ztsELlaWcllwXqDXSUs0Ox37BijKi8+P?=
 =?us-ascii?Q?i7mBKrn5xGeM2S5fghNbeZwm+pToQbtEBzTJiNId9lY3givHMyFOzTm/NVUf?=
 =?us-ascii?Q?oN3veHYKaQnZk3v0KFRFIPHOadZ9iIHitiOM2mJqNERKxl3y7llMu7JxBKNO?=
 =?us-ascii?Q?ibBqvgUTBZ7mI3KP/oKUhh168eUlZiJ1p+3BdBPPpPiczBskb9neX+b5urqJ?=
 =?us-ascii?Q?RV4kdNnzoNRJa1hpYD1cpWLcbt6t/ESuKoTq+a4zc6/Hn2MUc96AMWnn8cvw?=
 =?us-ascii?Q?jewBz+1Cn+yUkEp45byMJHvXDHkxascnKINhqAqhWrcmIm9/pb8rnQ9maNVy?=
 =?us-ascii?Q?QBdKaImJA1MgpRn1C0zo6tvwTfyYJFUg4YI4hnNn1jMCuS1KWuXLema/QK4c?=
 =?us-ascii?Q?Q2kYhQMZDHh2R6N0o28YDtznLsFKzl99VXDR2CTFCkDbAOylwDHsSk9V5qiJ?=
 =?us-ascii?Q?n+Mi7L5ich6YHSoX19ciSC1ejkuOhhAsrU2KemH8hwoTkCfcjLcbL87awNwZ?=
 =?us-ascii?Q?TzAyFPqweXoz079MDJqzwtButN/Z1V8asiFcctoRNA1Af3rqKdP3rlvZriou?=
 =?us-ascii?Q?1siNJxQxKFHkGiOd3y3p6lXTqocbfX/XOHhkAln3bDjICEVBekvEG3Wgwt4G?=
 =?us-ascii?Q?PX8YrjNP0OWNk6suf+UMLwOnj89n9+IyIs5sRqwtKnUZ7TWJHkBKYlTFIj90?=
 =?us-ascii?Q?LZmyd5ADxzdTrLlD3RjaWq5mkVHxx7OKE/EQppFPTBF63mrB3yfHcDFP8Lsj?=
 =?us-ascii?Q?E/xTub2pt81u/p8PF9U8n9Ebu3O8vnPdpTot13rbxA/32bbD4Hmcu+sYQ7rN?=
 =?us-ascii?Q?tm6X9KFv+kwY/jjQCK4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BsKY/Jfo6cjtkI3/Dbyf5NsDBbCvC64ukyIUiQ5gA7iXFspQCOTZzIfDk4l2?=
 =?us-ascii?Q?vJ743TOZ4JODpjUdP57yW15V3cUlmyNNq9DGUN6wQD0mHoWER+EBdw9JxHLe?=
 =?us-ascii?Q?3mrzarjO0PtLuAn3EUtUWBjCNLWM4KscUf2YcCrLuXOsR0LQJ6DGt/HcTXLC?=
 =?us-ascii?Q?V2AkIQ29YmmorRx8yu6PwGsAmd+HT6AUAo/36gFHmbA8bj/5wAQjkNzcEQhW?=
 =?us-ascii?Q?TfCZBZAYzNjxJach51ozt230ksFitZ+G9Hiv/CE1z1j5ATt/E/RPSPbSQR+g?=
 =?us-ascii?Q?cCdw91WSV8xfaylV2pW6prAoqvDWThi1Qfu7jq1rDfVWRFmK04ebKVgqt0Kf?=
 =?us-ascii?Q?3dP4etmeTy78l4BRJWBo5Lme7pkOPQT5RwZ6gM80NQeZ0dkhBmNdBvigAFnM?=
 =?us-ascii?Q?24fuD0jn9e4NorqhKL3xDsYcXLW859oEppuP7hzKbMPJRlMOkAoEbAS70l7f?=
 =?us-ascii?Q?9zTL+NkHJip6oDmJs7EByD3Xr1Mjrja92HaWF9G67DahmAOqXO3QA2eVAWG9?=
 =?us-ascii?Q?CTGEcNVclnGBmc6C0IaWLDZ7AnzXYsL+6SqNWAGEn8SrAA5ysKgv+qyJHc0U?=
 =?us-ascii?Q?Hi53kZ+j0cxQ7yZtKLmghXVAyq+bgo1UQAAE6zDogsbBhbsxOHrYN5VFoVh7?=
 =?us-ascii?Q?sTs986CRFPXdqJGMpIHGY7XoTPeuj5XK968k4BmI/HazHC8Ti7o5eJxtcpsR?=
 =?us-ascii?Q?r8BNup8Xty3ffavVaa4Q3LnUCGLJN+0gCqj43vsZh/kMW778Pm2y9uYmwqek?=
 =?us-ascii?Q?BVormHGtIGSzfUVxHZP8t5vh/vbn0AyX3g8eFKZ7K03L1s2VvFawYs2s3AKM?=
 =?us-ascii?Q?I2Z0czO7/tFLTEGrXzAGvu3fTzSEG2HGcvalhgsgCq6Dts17InghlrNcVcg0?=
 =?us-ascii?Q?m5AwgEDbmYR5Xr3Dw2eXJCcGBZVExgbnaX2MIyo4ZPp2Ujl/MRL71LFtTHZY?=
 =?us-ascii?Q?PrDlq3javcFtIryd6qnXVdZ/6Ko0ycynAdknEozYVFFWdaDtpkC5TuHL9uBn?=
 =?us-ascii?Q?9lYF2jDxFywixXpALDgk2f5kx1io2S4I6/4MZjjHO48rPomVeTMLG1wNLoIF?=
 =?us-ascii?Q?2JzPxIy8tHy4fgLhZI1alfWR2r/MtfOkR+U6lPN75OxNcdZXJsFugv0MndaW?=
 =?us-ascii?Q?teKofrXXolKc5rRB6bc0lkYwjwxrn1SUBqLcWrSRpLuxvM01CKZl0E/cs0GT?=
 =?us-ascii?Q?lowVsB32UdZv89kxtL+xPKhBzjkMr40zefDoMNavhblli/fmpVyS/Xme9+dm?=
 =?us-ascii?Q?+prHy97oDzJKkrgGskAXqRjmRKVWrLVG5gk9amLtg+A3gmDuN5iEkMFUBkNZ?=
 =?us-ascii?Q?YdISuqPpLtDAUAcKwz4m9JubvmaVzvqJckNHhWyuXOnRsELHycHsmUqtmp65?=
 =?us-ascii?Q?KSLIsTTD1trF+TOr+RyXMw+tOXW12qaHJo39LLyHexY6nuM9/mZHICdBvm9l?=
 =?us-ascii?Q?Kc7D78ek9/vBEa33Mu914NGJ9P9QGgrOu2Jwa3x3kez9zhlQQYO3IRKNj8b6?=
 =?us-ascii?Q?eD7IEsj07gMelWklZ1vJhT84fYlS26dbX1l3n+H0qa1hS6kH9vZ/LusPB3Q1?=
 =?us-ascii?Q?9exQp+XNY6IdmFUIe6BcMLZ98N5EthvXGzjPqgiqiM3TBa0kiw6zZumO6nwy?=
 =?us-ascii?Q?SZZVhuba+yxegonTF/dCVd87aFXvNIXqZ2vtkXX23ZhExX7ETmJQt0bunP+g?=
 =?us-ascii?Q?HZU00Wyi42cInB453f2q9QrBRmkxqr5VAB6Lt/Ri21vZcQxCWpL19KbSxe9a?=
 =?us-ascii?Q?5lmsmmwUww=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1552ca33-3997-4b4b-b630-08de5dff2423
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 23:52:33.8884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DhJheIdcrGxTdFeVh/h1ZFC5mXfI9MNTRt5npi5dHjtg7+SWmoxDRPdN2Yy/SNDk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7818

On Tue, Jan 27, 2026 at 10:18:27PM +0100, Bartosz Golaszewski wrote:
> maintainers to settle an important question. It seems there are two
> camps in this discussion: one whose perception of the problem is
> limited to character devices being referenced from user-space at the
> time of the driver unbind (favoring fixing the issues at the vfs
> level) and another extending the problem to any driver unbinding where
> we cannot ensure a proper ordering of the teardown (for whatever
> reason: 

I don't think you can defend any position where the user can do

  echo XYZ > /sys/.../YY

and the kernel has an oops.

Meaing in this discussion if the user does
   echo ".." > /sys/bus/XX/drivers/YY/unbind

The kernel shouldn't oops or warn.

I've seen many kinds of bogus arguments over the years (especially
misunderstanding what the module refcount does!!), but ultimately I
think this is the generally agreed expectation.

However, in practice this isn't a common work flow, it is quite alot
of tricky work to understand how a subsystem works and put in the
necessary protections, and frankly many subsystems have had these bugs
for their entire existance. It isn't urgent.

Several subsystems do get it right, it is very possible and the best
practices are much more aligned with the Device<Bound> stuff in
Rust. ie guarantee in most contexts that remove() can't run.

I'm not surprised to hear pushback on trying to fix it, especially if
the proposed fixes are not subsystem comphrenesive in
nature. Sprinkling SRCU around as partial patches, especially in
drivers, is not a good idea, IMHO.

The reason cdev keeps coming up is because there are few common ways a
typical driver can actually generate concurrent operations during and
after remove that would be problematic.

File descriptors, subsystem callbacks, work queues, timers,
interrupts, and notifiers.

The latter already have robust schemes to help the driver shutdown and
end the concurrent operations. ie cancel_work_sync(),
del_timer_sync(), free_irq(), and *notifier_unregister().

Many wrappered file descriptors are safe. For example the sysfs usage
in a driver is sync stopped during device_del's calls to sysfs remove
functions.

IMHO the largest systemic issue in this space is people making their
own fops without understanding the lifecycle model and without
hand-rolling a special a "_sync" kind of shutdown around it.

A managed fops with a sync destruction operation would go a long way
to closing these issues.

ie the gpiolib example was basically all fops, one work and a bunch of
places where the protection was redundant.

Yes there are other cases, and certainly I've commonly seen cases of
drivers reaching into other drivers, and subsystem non-file ops, but
these cases usualy have other more fundamental issues with remove
races :(

So I would probably also take a strong position that introducing
something like DevRes where you try to wrapper MMIO or other device
resources is adamently not something we want to do. Not because I
don't care about these removal races, but because I want the drivers
to run in a Device<Bound> context with very few exceptions.

Jason
