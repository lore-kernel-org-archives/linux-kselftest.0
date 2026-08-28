Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD25A37DEA9;
	Fri, 28 Aug 2026 16:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933622; cv=fail; b=pqhM2MDcf66HZTz078rP/KFitBi1pguoKQfHR7RO7cid+5fCvjK69nVQhFwCXq8WpYYZwM10W0HzN875kwFEOhlPc96/WCwJKuM7XsmW3FS7SMTOKh8aakfYMgL1TN6ypCgON+U9Xlg+3CznWbg5ORZiAPzDnOIB3DTrhPtOFcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933622; c=relaxed/simple;
	bh=9OOfGpLzeBBZL5AxIosZ5PQkYT1MLNsWLG0Hbhe1+L8=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RQBFJDgjMLQSxEl5n3im8p84/tW2bxQjez3yBkyBQ97YVmMzYYMC5JRODUKOT4lm/8hLj7LlYcJu2qbea/pWyjwtxwak//7UyzHTvQSxGVErFnHoSElOs3IATFKyQ3y1yunz1V5j/L8R9utaIuaAW+mIaq6gvGVcRfOWVTNWu/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oCuL7vHf; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oCuL7vHf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787933620; x=1819469620;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=9OOfGpLzeBBZL5AxIosZ5PQkYT1MLNsWLG0Hbhe1+L8=;
  b=oCuL7vHferKSzqkDeDwgnshJQiKS7YB49y3qBbQmdYZ+P+6+cVUZAkdS
   g9dZHoTT/kfjF8PEnx53crmefKge07q557MV26zVSUXwp34zSuYg86Nit
   2mXBPNIg6lihU0AZckcOfxliSg70+vl0VQouy+5inck8j8/f8hjz94eOG
   su3utaisI+dbholPzMGB07EOlqRHEKINpV3MbkJYtZvNB5e39Zg0PJsbh
   /cMHnteLUo+AqVBgD2R1MKSZthOjolh4eXpYJEhyv8go09LthQ3wMM/xz
   liwdswP12nyG5qp+JN4tVpcMrZgOaKeNaumM+3lOPJMTonUSx9e1EKk2N
   Q==;
X-CSE-ConnectionGUID: yJAU2QC3QLK0HU+LPMvzeQ==
X-CSE-MsgGUID: y9AlWM7WS8OGWLWk0zLm0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="99957569"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="99957569"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 09:13:39 -0700
X-CSE-ConnectionGUID: 5I6WAz+eSqusHlNMix8zRw==
X-CSE-MsgGUID: 7URJHkO+Q7ad/tKL1mmZkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="265606516"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 09:13:39 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 09:13:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 28 Aug 2026 09:13:38 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.7) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 09:13:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MaBeGBrIsTzW8I7aXdvoJ24S2U46gRuSRMObOCC95Afq7O8vYrlKH9W1IkATH2eY3Pkjgh9LZVEqCdn8tD83Nyatd1Z9ds26EXmCTy5x5213vfEfzRXdkCJmWZQ0ElBSSlGb1oDEP8uJpTdfaa5a/7AXwprJH3iNFslQmWkwpisjMus3datWSkBAXobB/QTvfqnKzxD/1v/9leykaWQyDZLGA08Q5Gb533inhRQfRp2PaQfvCgUq04kNSQvkU8JUMEAKRxQXuX/ro7obukA4v0bS53K7M38kIx8ft0Ep4EQI/I+t+TlFAttqU63wW85JNkW/AEuxR9y2Qw2qMcBWDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bq5+BaMYzMX0hOWHalhJIOVl7C8H8SBDsSqrdlDfh4E=;
 b=Uqf7HBLgjnez+U2NE66TlquD3iAEv3Hne6SFQ2IJzAhanAd5Unp+Tnw7uYMWwSEr14EqdpIJ0hoXJxbFoy0F/f7zv87qrqrn18n2gi85JgwWZ9nUfpzh6eaoiLrhu4kQ7AZ5eSwfUsXFKOckHDeZ2PN9PkIqnZ9LavwIssUkCrFVeYIzQCYLzVigT03IMJBP72hQy9tF+lakcqu7VH4nSVIH28Ed//4vbFhzpfQ54K0c64JUIvViBHK6jMcJKPQ09zeeu+59jAG89cN+nm0rjlzzVoL4FX9WQDEXplj0XuVUkEPYGMEUOIrZhLabbTW4hchUJqqS3WkO64p3amKu4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by PH8PR11MB6998.namprd11.prod.outlook.com (2603:10b6:510:222::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 16:13:35 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 16:13:35 +0000
Date: Fri, 28 Aug 2026 12:13:28 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Leon Romanovsky <leon@kernel.org>
CC: Konstantin Sinyuk <ksinyuk@kernel.org>, <dri-devel@lists.freedesktop.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Francois Dugast
	<francois.dugast@intel.com>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
	<tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<skhan@linuxfoundation.org>, Donald Hunter <donald.hunter@gmail.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
	<horms@kernel.org>, Ilia Levi <ilia.levi@intel.com>,
	<linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 0/12] drm/fabric: vendor-neutral topology
 infrastructure for scale-up accelerator interconnects
Message-ID: <apGzqP6cEZ1miNmR@intel.com>
References: <cover.1787552412.git.ksinyuk@kernel.org>
 <20260826093222.GC42790@unreal>
 <fabric-leon-reply.1787844400.ksinyuk@kernel.org>
 <20260827170911.GG42790@unreal>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260827170911.GG42790@unreal>
X-ClientProxiedBy: SJ0PR03CA0259.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::24) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|PH8PR11MB6998:EE_
X-MS-Office365-Filtering-Correlation-Id: 17ac052a-8240-43bb-5a2f-08df051f4fb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|7416014|10067099003|6133799003|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 33PM0QEM2FlerBvaA3/N5U07qRqdJeFOS//9Vsgwme1uGqB04N+0VWXFuuIGQiJtGfHSf7RoDUk9REz6lz9jr+oUeli6K56rxCRcqjB3iZzc8cGr6Ra+1hgvntNmxIPw3LGqwjBI0p/nDWtU55PU6CGc+/wMjxTRsf0QJuJgCCDt75wbHiP0syhG89hlkm44XFc2QVX2MdRAh2zd9uylJxVvg0M5elJiG80ldaq1DXy2FB0qdkmaa0alCMAd5NHOmo6Qpgk40hAuejUC1IJeY6oWXiahbxRfau7zJVatbZktKdcrbe4xT60CAETJRow56zoa0BmPJ3FMHnvXRp1jqxDJDIjp+BjC7zcYlyEsoYE6YdmnpkZWlwiho9EErK/NoS9h/8ivXds8nzAb0sFUmi1q5NmjZsbyQ34i5iKRGPSx11irIsZXHGv2+SXxoMA4ZSzjTpW5AJHp7GGwX/SEuYpIJm5kjveANJSyslnRMdDsFwEu1mDpyAmzKneOLfua5IDdb0MLxS6bSkq0BgHYUB2vmSoFoIZKMlwP1CIvv0+l6U3OHHHKig8ngK9HXOcI1drWNUJPGaeJeyEQqFD4skggq8nrEwwUSuV6oQB7EfJC+9n9v7tbpycnpxxNLitehNAGv5raoXG8JVPw/6lQRLDyVUpFLLAWCGwA8ybouyg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(7416014)(10067099003)(6133799003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DRHLbB+hG5SKw6lIaNe3WyLFzvpL1kSi7FUt3a7mxfSIXJx9c9Yvpw7QNYME?=
 =?us-ascii?Q?TuWpmLeLqJQUBEByJvpgG9b/9LWB7NQ/Qx4Rk57MfG/CkAbrileO+Pf+UulY?=
 =?us-ascii?Q?EgOXG+tJ9j28bMpzrZBL8fAHKnIkjVlZF6HWVl1FrhG+uLNvmKDyuF+zBGM5?=
 =?us-ascii?Q?wOc87k4Y+QdbroEKKU0GjsTfiSuTJOfEi88TOxecfWFKQJHYSNNpcCtK9RjR?=
 =?us-ascii?Q?/IpvEQV4aUfZFQ34g9QY7UIAi2PsgtESECFJAH7zIDTiXSmgewBrfwm64hVQ?=
 =?us-ascii?Q?ALe2alkb6y5EDFNJ+JXRXtV4PcrFXxg2QNd8zENx2dAfaT7bgBtNm01adusE?=
 =?us-ascii?Q?cXSBsKiHERtUB3yEdG1OXFLzZ6X9gvlhoxEB77CCsDd7k0dv3V5k5zdFmAqt?=
 =?us-ascii?Q?u04oJoEXA1dfD60SSr1jr5A93XyA9ivHlrtD4ecqqit4cguZr4lMugNn5j+W?=
 =?us-ascii?Q?g/sQyyywC+6bqPeWVlhJwBuUWZPZYr7+43xABBhf2FK9tkUKv8Spw54SsdAt?=
 =?us-ascii?Q?yThP7Gr2U47lawNIFG5XwZpsnfmTrYW5Du+7fpHmoI7bLXOHO5DP4aTJySLD?=
 =?us-ascii?Q?FwgtW2vcLR0gSiKZ2k2c+1HTK8rdA7AzJKqXp09vwu0Qqv10giM/pNS/cXiu?=
 =?us-ascii?Q?cCB95A7uGiKQ/tlQpbJygScGw5QCeksD/1cuICC1wQv7i2zJY7+olHHXYuTc?=
 =?us-ascii?Q?LFrBjYWcV2P9xnxDbEl0B30Qfcezg9bIEFdmX+4lmppPnc4x49LS+Cks8dfd?=
 =?us-ascii?Q?q0dzrwrdz56Ko9t9pAHVWyxQ4DhOQ0QDFnSWqAKnAwjTYag7v2dix/md5fcB?=
 =?us-ascii?Q?ZOPQ10o8jLioOoQsHPataz8tP53QqRA5Miu7+tYGcD2bgD0uCvnyVG5ezeeY?=
 =?us-ascii?Q?pN9fjWsuRRBjKSN8XLMjVgW2tqhT7cfOogiCdqoTC28zYIbITHeA/cDccF0K?=
 =?us-ascii?Q?R2p/Q6o1DMXEHIrzFxzITb8My7n3uf3DFiAo75Rd1BXV54XYdmWqyjrpJAKZ?=
 =?us-ascii?Q?q4F5H0ok5I0MOyCJdzMTaneRNugp+vIPqLDyjE4m5vniDdUM8J9MsGmQTaNa?=
 =?us-ascii?Q?Argbqi3zkYbS1FFIyYtvnZf/uVRiF9Ew7+hMi55OcPIP6in0acqIcgvKJOQu?=
 =?us-ascii?Q?ZhYXSEluOGY2DjFbC7ANgGsvW76flwMBRaDGC2FwlzTWZVmLl43cbRSI7FBu?=
 =?us-ascii?Q?VJxuufQPUwG0/+pc2wNimz1RT785gb8fmxjBi0x+UaDcYwzUkb3KGmoo7/g1?=
 =?us-ascii?Q?6MaaUweI9V83lvndp+0w4GJOLi7SHDAVlQa30uiw+f5vKMNGJwd5yI4GbbiV?=
 =?us-ascii?Q?HmsXiDh4M95Olvl03Ihx96xw+15z1qsjxYOExD5DkZL1Nk2L6jyW2dCS9+8E?=
 =?us-ascii?Q?0NFqISHDfmD2J2u8VBS/sG2euz0sOX2ZyECawZqNFMHk2z9TFH7n+M/X2g7I?=
 =?us-ascii?Q?KDj6lwwEsgDEgZ+edVpSRzEyHB5UrDD6TO8foTaq6cBQbUkpS4Rgtd0DHhLE?=
 =?us-ascii?Q?RywjubfTRnsGfBNzWVsW9vZ0a/+MlJ+0XBETpDi6Omia5lgGLppKaZlvxaLF?=
 =?us-ascii?Q?gJpjXtbDM+fQpAGlBmE2wgwJasDZUyVoEdxpLFe4AkmKMbosEsJtscKqU5Y4?=
 =?us-ascii?Q?lJ5s3Rs69aFsUEFISV4NnaB4RE9NPJn0NCy/ExQINSAsyv2Jjji4U4dRQ836?=
 =?us-ascii?Q?5PEG7b0dmPYOJo0CIhi62Y868ptopgkIUKduFZ1S5Pr+63MO7YALeuTglh3j?=
 =?us-ascii?Q?j/geu/zSMQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: s8Nthr39Q8YVM7xNSCS2Vo4/13lCdDzp6NIDjrwXtGLwG7eXg5ccugTbNVZvZiL+wqHBD99U7ZZHBh1PRoIzWaSLHJMMfEl1N2NfsFc5So0NjhYmS8qXGjbYRQI75Ftp/GL+IBw5BPYlIZ0tYcy/86ld0zrpvMXxwpfGiT420PcH/3oXArSwwfOiVYvawfHQM2OOnKRNkGraZnr8zthnk13JSzMMzKP7KQAFpVBz/bBspW2Y+Kxjc2GWr4aih1AXp/7BcaJKTnmUp2PDh+uIfMimLy8vN9IwptNJUCdHisfAgyr204z8dQOhVsMbyml9RW7dpynJH1czdoDNDOB5iQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 17ac052a-8240-43bb-5a2f-08df051f4fb4
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 16:13:35.2992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jeA/EEZGLGO1P9GVO7VxBV5cB5RRAXLsSP8G0u3Rr5Q2eEOIODZzPm3CF6k2kSJCdrPF+otDDpALbwZ0PbC/Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6998
X-OriginatorOrg: intel.com

On Thu, Aug 27, 2026 at 08:09:11PM +0300, Leon Romanovsky wrote:
> On Wed, Aug 26, 2026 at 06:38:58PM +0300, Konstantin Sinyuk wrote:
> > On Wed, Aug 26, 2026 at 12:32:22PM +0300, Leon Romanovsky wrote:
> > > Tell your AI that this is not how things work in the real world. The chances
> > > of multiple hardware implementations fitting a software model designed
> > > without considering the actual hardware are effectively zero. This is why
> > > successful subsystems have emerged from consolidating support for multiple
> > > existing hardware implementations.

Right, but we also have to tell AI that the real world is much more complicated
than this. When various vendors already had multiple different implementations
in place, they will refuse to consolidate... like you stated yourself below:
"which is unlikely to be ported to this new framework"

Perhaps what we missed to tell AI is to add a clear statement that this
is an RFC for future. To discuss the design in advance so when the real
hardware starts to appear perhaps we have a chance of moving things to a
consolidated vendor-agnostic API that fulfills the need of the vendor-agnostic
UALink design.

> > 
> > Fair point. The simulator validates the implementation, not whether the
> > abstraction fits real hardware.
> > 
> > The model was shaped by the public amdgpu xGMI implementation, and the
> > cover letter asks AMD whether it covers their requirements. It still
> > needs validation against production implementations, and the read-only
> > milestone will not be proposed for merge without a production provider.
> > I will fix the wording in the next revision.
> 
> The wording alone is not sufficient. Your proposal should be backed by
> real devices representing different architectures from different
> vendors.

Future Intel (and other vendors) hardware will include UALink.
Please notice this is an RFC to discuss the viability and design for when
these devices start to appear.

> 
> The current proposal is based on a single implementation, which is
> unlikely to be ported to this new framework in the foreseeable future.
> The amdgpu xGMI implementation already exposes the required UAPI through
> sysfs and would need very strong incentives to abandon its "legacy"
> users in favor of this new netlink interface.
> 
> The last new subsystem I am aware of was introduced with implementations
> from three different vendors to demonstrate its robustness. You should
> probably aim for a similar level of coverage here.

If we wait 3 different devices to show-up before we can start discussing
a common API, then it might be way too late.

But of course, we can definitely move this netlink as is to inside
drivers/gpu/drm/xe and call it xe_fabric and if someone else is interested
in join effort we move that outside.

Thanks,
Rodrigo.

> 
> Thanks
> 
> > 
> > Thanks,
> >  Konstantin.
