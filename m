Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAECB380FE5;
	Fri, 28 Aug 2026 16:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787934508; cv=fail; b=K2DXvQmpDmaVLlV7MnoarRPQ45mouGy0txz7qjhpY+JGs1XuFqqVrOsNrnY9uVafcVCpAm++y16OmjV3YbAX7O+mK5sx73a94UzZVmKOQJ4iYxQlO+B4uA82ItzeF+2cPwVu+WR/2UeKJVOuByK3dKvdF3DxdpovICyMi47nC/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787934508; c=relaxed/simple;
	bh=hGz1lnyRnAu5DjwfbxdspFP4lJ992t18H5bNK0pgOf8=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cc5WUZieRztfDPSBKXWZJnPnCS7UkMIx8dUxIUnG2AD4HJxe5CRxbZlVNfHGck3AcVND9aI70/O4MZvkwfXOLXYhOwiw71/hlBRr3TGpmnVmstFcBqP5AAXlv5/lHLQhEACqLxkfaHFDTTbYWBse2+UAjW8zOmC0WiRHE9DhH8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V0bOFrY2; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V0bOFrY2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787934504; x=1819470504;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=hGz1lnyRnAu5DjwfbxdspFP4lJ992t18H5bNK0pgOf8=;
  b=V0bOFrY2BpEswEbBopr8jbczZ5JyKOWn9mIzLTjga0A9JqfIvIT6wNnj
   TomgjQIcX+hev7HBO3hsqNhxz2DN0ICzs4/XlIQSaEd3bGy6+VGuY3xHp
   16w9xGt6UDESGUGAnKX8jRyjQdRBH7o+dWaqdZcc1pVB2IwOW5s02A140
   8WM3cBRWU3e+698fCTtB+suNPU5Rz0G15lx5FTfSIGdFqjLUx1q8okmGo
   ulLVGqhIUln4ne8mpPzHSm0vmPNBy5d38nEjvyd3z0MzZrubIcsv1tHqP
   cZSbRNpSi1Uda+p09Tr1w3WDM5X3794+Tw12SEU0cnNyRuED15Whh8nl/
   Q==;
X-CSE-ConnectionGUID: tzVh7SWSSPm3kM/3Ic6sqQ==
X-CSE-MsgGUID: Lfo2kPO+R4ufr6XPXW6AMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="105972010"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="105972010"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 09:28:21 -0700
X-CSE-ConnectionGUID: mL0FuIYxTWKlf5vDfsuxVw==
X-CSE-MsgGUID: WIojos+QRPShsBnyQSY5Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="263917473"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 09:28:21 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 09:28:21 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 28 Aug 2026 09:28:21 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.55) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 09:28:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I7jpGSFgf6ON3MB+mG+a7lOFaCqWFpYO8QcRnXs7TMEUup6ZQkqRRS08i28RcIMtmlVK7Av1Pb6NTejeSHKAL1LzvBVfEKdS7olORGsBJoBHR1RRsf20587RNDDKcBibtcG5f+lH0VaIiqVe0j4WbV2xTve/WxRlkzSATO31mt3x4tRCXHiTudiOb/JrdQTRgx0mPuRSUjzNZPXdRk80v0NtpG/maPfLbcHHcqUBA1jyx1P2rD3y86IQ2PUei+vNuYsT7Pi24Zaw75EjCP4LmrdvqcT1K0NuejAt6oAso3BAAHz8mH4uLBlJXUz8yHGNBbY0stZFjEQNy5ABWhbtOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4SWdS2lx860uP6nj7qHn702UP0f7wXCF4xVqVT2traU=;
 b=SWlAaROAg0KNVcRegBxMtzt+FulrqjRK7P1aeWGWdEgTXZsW9o0fvktTa8e/8TUz9ixLluWiUUB0jVLNUwFqA7CaJuBILhJlcY2L9BfAMsS7GEhZYTZaRVchTH/vxhBs9iAyNsShMtyUC62o2CG15hsOWUVNQILO+m1Owkyax9d6p+EErikoLJU2Pa797pWSxTzJp0Ql2+5QmlHKwN6zr58dB5+Y7F256E9VwCKQWXr9KxD3iRWNdYthvrt/FpwkJjjCZiY3XBVuw6nw8p1m9JdTAN1an/7hyWO+gMfbnEJj6KINX3md48Jx1oDHj8qdFl3ZApK/PLOsttYM5GgrIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by CO1PR11MB4898.namprd11.prod.outlook.com (2603:10b6:303:92::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 16:28:17 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 16:28:17 +0000
Date: Fri, 28 Aug 2026 12:28:10 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jiri Pirko <jiri@resnulli.us>
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
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, <jhs@mojatatu.com>,
	<jgg@nvidia.com>
Subject: Re: [RFC PATCH 0/12] drm/fabric: vendor-neutral topology
 infrastructure for scale-up accelerator interconnects
Message-ID: <apG3Gsk1TeMD-oCc@intel.com>
References: <cover.1787552412.git.ksinyuk@kernel.org>
 <apAsfOowcG0cTvT8@FV6GYCPJ69>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <apAsfOowcG0cTvT8@FV6GYCPJ69>
X-ClientProxiedBy: SJ0PR13CA0127.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::12) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|CO1PR11MB4898:EE_
X-MS-Office365-Filtering-Correlation-Id: 90495ac7-8ce7-420a-b393-08df05215da3
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|23010399003|376014|6133799003|10067099003|4143699003|56012099006|5023799004|11063799006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: H4AJ4RAoVi4h9MIsjA5tj0jySDXczviHbTld3X5Vu+mXDQRr2RNBP5g3BUuZUZHYCV23ApTLbGxpBGLBhPFIr66qJaNgbuwWlnnw+UX2DvofF1lrqYgV+YmAHOMp0Ov0myhKSWyRH02uJmV6MBqsHmzx2AO+kFxFpCdCdFuXWxcS28ukgJgvJOo71MImXz66Y+W/ez+FX6u7mP8oXZWks0FGNl8GkQOL29lGB3woto0U5MknCEn4UzdynEtnYPnTWSU5cFIDAQ1WeNZ4tOSROxahAwwPGI0ggw4JyuFDsZZchkMm/aCdGdF25VSByk+QLQ6wPBORqKbdSdsknfqtsEWe4dsI8E0axlxJEEAvFKPnim7qcwnxd3FFSW1p2jGFwQ8/Uuo6g3xEL2riQoSQHNTZ8B/hDpuAl71EhH3Qu9vF0hpLsG0+sJqMEE/zuvCrttjKQFwNQzCEos6M6EGQ9PDTBAGr7VhosYCBUYXf5Oz0UdJC/HzaF4goUEccWisdSY5t4yf+/O8ZZA1FkLorZfqq3Jf5A+5smfsdw+uEf6fq9Dpnrvpg74gaGhSyhAUBGdmO1O70drPQae7lv6xAskWaRldn+3Qv/LTWIeimkkAnBvlMjaPduy7E0eASlM2ZkZ08c0J9K2XSimfVe2FIHDG7KoecKPCtinqj5ji6HME=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(23010399003)(376014)(6133799003)(10067099003)(4143699003)(56012099006)(5023799004)(11063799006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KBLF3U3Vvx9shylwECnTflbSU7o5DRmgdjE4+H17ueRuL6etwtJT1fHIAMRv?=
 =?us-ascii?Q?7HfV+B42k7e24VWJLKpAYnHpU7TmXjIlT3N2DcD4Ok4uYrh56tAawxUZJwZN?=
 =?us-ascii?Q?I35yrl8vbz+7Ey/J5SMWPBCCilTwKZe6LM9bi1g1hf44LWi3o+qCsItRNB+2?=
 =?us-ascii?Q?12Sx0Kxy105JKFlSt/SBpwabAapbxB0uw3J24pJdqnAUVnBPbp0RpdUhGpOY?=
 =?us-ascii?Q?++qmq1wbjtM4sG1KQZYjLByt1GSx6KTTLt1BbFM10eywf0MbTcrEC+qBHIq5?=
 =?us-ascii?Q?R0KKwqDaLJzCS17UU36aEy3sk8KHwQcu7TKMqrp/dNFUM3ZywiGSQK+Esp04?=
 =?us-ascii?Q?uZxWCbXg2CqEimgkPLrbb6My6E+G8ePf5XIF1qSy6VhDPlp3hNXSgZ10r/JP?=
 =?us-ascii?Q?fTDrzWDlkBLo5HZqLHdhIKC0FjL6uVzsWOBcSKQOz4Gg+69/KjVH50Yy3Bc4?=
 =?us-ascii?Q?1iKyATAiaZednua4dT/+Q3hIx9NyyBcuBZOYBxgnWauBR1CZ7oOvzYqe99xs?=
 =?us-ascii?Q?3vBVjHZoGlKFDlntHpShL6e+nl86+4bFCmFXHk+HYW96MZc9bRMUE4oyghrx?=
 =?us-ascii?Q?N3cxa3JZOXqVp5pim9F2SRfAVM7g/ZtpCh7ydr3MF1NzCPSht0uG9S6tA51U?=
 =?us-ascii?Q?4CZBg28YVtxi/qOxSyLeVVqesKCTAKzAI2Jw4dWtvF9tiQbd7NeZDMYWlbww?=
 =?us-ascii?Q?BnJnswWMEPubhwq3J87rP6hmsKeWX31oTxgaw1ohbK3Hs+uEQuQ/j4Zzjldr?=
 =?us-ascii?Q?sK1j2dLTItk57ndWFxVPbqoJQY9FAVMJmaKo6FcxWGnOkvqY3/8y/3UxvvUN?=
 =?us-ascii?Q?5GMO1lRXUDr1XVvohk/Q54BchKlUTfCktezf6wVlsC4o4ah91CdsXbWvXNDb?=
 =?us-ascii?Q?BcWycg9Qju5Q89AOPqIFkq0QgJiAKPPyjv47KNNf3uHpJwjTJNZUT8wZfn/z?=
 =?us-ascii?Q?uNUYJdxUzrUJWk6SpT/k5WQ/inQVGd5GG8edcWfpjAOyj0erHdYXg4WV5S/O?=
 =?us-ascii?Q?y2pLXjrtu89vCil9bEhVnlu5zZzb1VIBsZ/HCUK22kx+LY5glIgQuf91k+g6?=
 =?us-ascii?Q?zfEXuJAFAqBFNz5QbZyKNR2RvjraakYEkhwEFsqbU7A8XdBqCgr1zk2ltEn7?=
 =?us-ascii?Q?TYUEzVt2/pPdmie+fn0z4buce9iuVfzFEEMiUNzv76mHe5DpSrVJ+H8qG4Vk?=
 =?us-ascii?Q?LjfwpTBgP3AP2rJCbSqoG7UgKecaSnqQeJoWRdoSYqaI23uUegtSWWcRXj3k?=
 =?us-ascii?Q?R76QlGGW3EoNQHGeajNzFHmzuMg2f7uUquJhotnZmqxKhSGap/APAsPyYBtl?=
 =?us-ascii?Q?iRDSZvApU2+q8cp411cklbOgWEmMnlPzZEpTMk8KqLyHOAzar0m89tazjfem?=
 =?us-ascii?Q?gdgSl93oOCBqbfQAeoiW0me08RkNDs1WjAe9PZQ4EyvlqB0c+nH0DxtHV5Sg?=
 =?us-ascii?Q?j/0FWzGrNP9QPPcVPlKjT1DLUGVAd+R1gJqTeyqfZPv5T+Co+9nn2dmjqK00?=
 =?us-ascii?Q?2eOx2+K4AVWvLT1Z+y5FthPWDv9B/UBb6lEAvo6zLS6vWDU0poesEU8heaSt?=
 =?us-ascii?Q?4IR5xdHAaKNABod3/9w/cH2SubkmPtmuLIykq7GTzjJYPaewBUzhlhNmXkf5?=
 =?us-ascii?Q?9vBA+UPsSlGCvpIrnTj0Ol3ioItbUY3IRjLG55ItdTFq/sWr5FmCCSl5Zfpt?=
 =?us-ascii?Q?mAm0lzooOf44tzHDPf3WCfGIKRHQf2OQ9SvYDetmqKR1+t2ll3s3iNDQuxXz?=
 =?us-ascii?Q?V9OMM+UfnQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: 036KPtMuxXXvYi+CK4qutG5ql79EBo9dWWcsVlaKvwa7N9SHukSmNRrNwnh/XFvfNSSICMgrEmq4HpugF/MOPX66KkTWLBsRPVqSheEwKkkurX93qGuyfjY8Omv0gsN/JtwrHWxYGwuL/j2leWx506u2YTwV3dikY8Q6TG1vkLUZBjckpfa6xKwOK4ZueSdMCq/hUS5NVxrEtsOijrtkrxxjaj74qoZRnG7xW85kMQ41WaiYrwf64ewutzOG1TatC6s46h429T1KwnL2girkaOdTSFM1A+WOuU/j3MXlqyoXfy0nfqzvSH21oj1Fu2T2r1KR47y4aVmY30Vycdeogg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 90495ac7-8ce7-420a-b393-08df05215da3
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 16:28:17.6109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zDdBcSsBjzLYni9kIkRquugj9nBUXxzxnOsepP2BoKJgB9wcZUiaeqshDdIsmxlvc4KIK5lU4i1uXOfE/EvYMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4898
X-OriginatorOrg: intel.com

On Thu, Aug 27, 2026 at 02:35:16PM +0200, Jiri Pirko wrote:
> Mon, Aug 24, 2026 at 10:09:28AM +0200, ksinyuk@kernel.org wrote:
> 
> [..]
> 
> >Example queries using the in-tree YNL tool are:
> >
> >    $ ./tools/net/ynl/pyynl/cli.py \
> >          --spec Documentation/netlink/specs/drm_fabric.yaml \
> >          --dump fabric-get
> >    $ ./tools/net/ynl/pyynl/cli.py \
> >          --spec Documentation/netlink/specs/drm_fabric.yaml \
> >          --dump endpoint-get --json '{"fabric-id": <id>}'
> >    $ ./tools/net/ynl/pyynl/cli.py \
> >          --spec Documentation/netlink/specs/drm_fabric.yaml \
> >          --do port-get --json '{"endpoint-id": <id>, "port-index": 0}'
> 
> Using generic netlink instead of sysfs for this makes a lot of sense,
> but it may be a bit odd to use it outside the networking area.
> I've been struggling with the same in another non-networking use-case
> as well.

Please notice that this bubble was already broken. Netlink design
always had the dream to replace ioctl everywhere. And there are already
other usage in place that are not network related.

In our case we use the netlink API for GPU RAS error reporting: drm-ras.

Also there are other usages in netlink spec that apparently has nothing
to do with networking, like energy...

And in this particular case here, the drm-fabric is a 'network' of
GPU memory... At some point we even wondered if net/ was the right
place for this common API....

> I have been building a framework that keeps the benefits of
> generic netlink, extends it and is fd-based.
> I call it CTLV, here's a link to an early pre-RFC draft:
> 
> https://github.com/jpirko/linux_mlxsw/commits/wip_ctlv_pre_rfc_draft1/
> 
> What are the benefits over generic netlink:
> 
> - No networking in the dependency chain. No netlink sockets,
>   no CAP_NET_ADMIN, and no network namespace semantics to reason about
>   for a device that has none.
> 
> - One character device per registered instance, not one global family.
>   Access control is the file: udev rules, ACLs, an fd passed into
>   a container. The open mode decides what is allowed - actions need
>   write, queries need read - so there is no permission model
>   to reinvent per family.
> 
> - Events per open file description, not a multicast group.
>   Each descriptor has its own subscriptions and queue, and an overflow
>   is reported in-band: the next read returns an event-overflow record
>   naming the first and last sequence lost and how many.
> 
> - Large payloads are referenced, not copied. A blob attribute carries
>   a user VA, a memfd and offset, or a dma-buf fd. Nothing big travels
>   through the message.
> 
> - One YAML specification, everything generated from it: kernel metadata,
>   UAPI headers, userspace bindings and the reference documentation.
>   Introspectio. is answered out of the same metadata the validator
>   enforces, so a device cannot advertise an operation it will refuse.
>   A checked-in ABI snapshot makes any wire change a reviewable diff.
> 
> - Family inheritance. A family inherits another's operations and fills
>   declared extension points. The effective schema is resolved per
>   device and the chain is exposed to user. A shared core with
>   per-driver extensions is declared once, and both attributes and
>   operations can be extended.
> 
> - Introspection is per-device and live. The framework answers three
>   queries on every device: the family chain, one entry per published
>   operation, and any operation's full attribute tree with its bounds
>   and limits.
> 
>   The answer is what this device accepts right now, including what
>   a vendor extension added to an inherited operation and whether an op
>   is currently disabled, and op-changed events carry the generation
>   ops-dump reports, so a dump can be ordered against a change.
>   GETFAMILY and GETPOLICY describe a family statically - there is
>   no device in that model to ask.
> 
> - Fragmented queries are built in, with a consistency check.
>   A continuation carries the generation it started from, and if
>   the answer changed underneath it is refused with ESTALE,
>   reporting the expected and the current generation instead of
>   reassembling a torn reply.
> 
> - Attributes are 8-byte aligned. CTLV_ALIGNTO is 8, so
>   a 64-bit payload is naturally aligned and there is no per-family
>   padding to remember - netlink's 4-byte alignment is why
>   nla_put_64bit() needs an explicit NOP pad attribute.
> 
> - Cheaper round trip. A one-attribute query measured 2.6x cheaper
>   than a genetlink one in the same guest - a debug kernel.
> 
> - Async operations using io_uring are planned as a follow-up extension.
> 
> The framework owns validation, schema resolution, blob acquisition,
> reply serialization and the event queues. All getters and putters
> are generated helpers. A family implements semantics only, and
> the aim is to make that hard to get wrong.
> 
> Would this make sense to use for you?
> 
> [..]
