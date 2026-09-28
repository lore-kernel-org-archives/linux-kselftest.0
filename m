Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184964E56CB;
	Mon, 28 Sep 2026 15:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790608677; cv=fail; b=ITU2atBlnN84tXENVbYbHkSTbkkXJwjsIPCUwoVMeawenBgwpaq4z9F89z5id3FJ65OiIUh1ukcVifCedLEyYH/Xr01yHz3QkcAYYK7Cx841Vng9sac/D3avvyM0EJJ06X9SpGN4a65ftELa/GWVNhMHCUOlOZ2M4QX3VMxFaIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790608677; c=relaxed/simple;
	bh=oPBLTEW7m48vVIf/mv90t6Gr7evXG59/XRW+Qkd9ags=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dVpM6WB0aWwT1zQmE84AxAGlN5XyZsMTatAbxjNOa2+6FzLjBxX0x1dLF4erJ6IrV0nG0qb5gvbal0f5Ba9rxt4h5gAvYhLx0ItfkVcFaqEVOWRYwRNk5S8NCOc8jTCH/YdqrafMauIG/GfuSPnc0MZjzU2Hf/MssCCVlYItDAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VE8QRO12; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VE8QRO12"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790608676; x=1822144676;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=oPBLTEW7m48vVIf/mv90t6Gr7evXG59/XRW+Qkd9ags=;
  b=VE8QRO12ahqz51ZVad5yvTN6Kv6FawEtsjhu71trrLhwsxotqGw2qWfN
   w5NCIxRkTeGkHJqdgmpC/GZ/gHjISYNY5hv2Wisgkv8nRrDxSALPAbqxv
   0UMEUeOatQJ9bEtJUasFHp/2Zuf4hp7sGojyzgKGeGE/icK8RdYlc7wb8
   LpDGS++dmwEuzm/cso7QO+jcWhFou3AMv40IFyp/g3t5Ym0LtKwQVxGcE
   SeUeD75WUvtv/eLhnlFsH0iS8KLYDp9N6XTNu6qbUVVwN4+iHJPhn5aGd
   Yb1GGhd/tBqfSkCY7PesWj1VV/k1ngWviChuEFhoOz3qRgStVeH9zPCs9
   g==;
X-CSE-ConnectionGUID: s72iwZlyQ326d6Ezn/3dYg==
X-CSE-MsgGUID: raIFkhp4QyGz5tsY5ayN1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90528241"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="90528241"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 08:17:55 -0700
X-CSE-ConnectionGUID: MBMbgjrZRlOdEgcqCoX8yw==
X-CSE-MsgGUID: XQX0lbLJSJadLQd6JlHVzA==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 08:17:54 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 08:17:53 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 08:17:53 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.50) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 08:17:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PQBpghBuq5LkbXnrw4PxqhEly387375CegCoxLoqZARfdD/dvOpYj6iKAcSGYIIYNo1S+GDV2/jcL89/6cQqN5r5PmcsWw882iwjbKon2cuE9PJtjce4MHVsRvXVtEnBCaIVOHK6Xf716Th8kJmS83MJn4K19i9E4kgL0pVGY/DvISAAj/rCgysMC/X88CKEqKreBccil1+wXDHFA7staCwQtip8h+ro1nzJ80HjrcN7BXYNEa1VWoe0aYHpW6mrYBR4w6MOF6SMsaNjtzyikHxhIhH+/8AcqqzLcKWlahg24EAn7SX6fvxBBrlQGl+n42LC9rGkRWFY3wQUzgLVwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ml/dzb2rOyg5HAOoVlUDrHp3dKgFGEzoPjx1fIgSe44=;
 b=c1HEnQtfKCwkVwmT5fFuzIfduCVpSyTTjEURwQvYafJzLpla5GsPUxtfdiWLDfNzVsokxi6YzZyx1JHIvh3p2fmh90t7C5xA8hAw9OoX9P+JHiHcNPa6/IVWfoBlBXBth1ZSIgTpyfyuGJiXtXo+ERJUjMQQ5tOCsMpORyjAjFeTz3L3MMqPtBrGd79htt5HLuayFUfC2AgruJ8B8ollHoDWMcNNUOX5YfgSbHjq13d5zmV2FhPjpBPFnfTPyx4tghogPJ44FYQmkxxrJW9I+B4jtDhbYMsfXvus3qduC2aJUdmYHKn7qeMmLSoRoSjx/SHaLRzgKz0qsEKTSwTIVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8986.namprd11.prod.outlook.com (2603:10b6:208:577::21)
 by CY8PR11MB6915.namprd11.prod.outlook.com (2603:10b6:930:59::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Mon, 28 Sep
 2026 15:17:51 +0000
Received: from IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c]) by IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 15:17:51 +0000
From: "Loktionov, Aleksandr" <aleksandr.loktionov@intel.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, David Ahern <dsahern@kernel.org>, Donald Hunter
	<donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>, Ido Schimmel
	<idosch@nvidia.com>, "Keller, Jacob E" <jacob.e.keller@intel.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, "Nicolas
 Dichtel" <nicolas.dichtel@6wind.com>, Nikolaos Gkarlis
	<nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>, Sabrina Dubroca
	<sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, Simon Horman
	<horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>, "Willem de
 Bruijn" <willemb@google.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>
Subject: RE: [PATCH net-next v8 1/5] netlink: specs: rt-addr: fix the type of
 target-netnsid
Thread-Topic: [PATCH net-next v8 1/5] netlink: specs: rt-addr: fix the type of
 target-netnsid
Thread-Index: AQHdThaiilWVVPeVV0ew69IyB6r757bkHNCw
Date: Mon, 28 Sep 2026 15:17:50 +0000
Message-ID: <IA3PR11MB8986B71C69D1E74847FA3622E58D2@IA3PR11MB8986.namprd11.prod.outlook.com>
References: <20260927002427.4519-1-sigefriedhyy@gmail.com>
 <20260927002427.4519-2-sigefriedhyy@gmail.com>
In-Reply-To: <20260927002427.4519-2-sigefriedhyy@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8986:EE_|CY8PR11MB6915:EE_
x-ms-office365-filtering-correlation-id: 492cb5ba-cdf2-4426-9b4d-08df1d73a95b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|7416014|10067099003|56012099006|22082099003|18002099003|11063799006|4143699003|38070700021;
x-microsoft-antispam-message-info: DkjRA7ft4fJkaM3VSmgABlX9Npu4RqvTlA/HG+LGUDjNzNihe7vAduOJiPgCVWiUvQU2iNOyb0mwsKKkg+KVZY8fxCiS8FPRDtuOSETjCaaIt3c4YY1GabNg1x/qMWU2RERnKI1yyJjC5pK6UR0VNUdpkAu7qQZEvVIAnC72COnNktYzqAhTvDm9WMZBBIO1V2XF2C35vQB4j4hr1qeoFxbKkYWqQZSpeCMWdjctrEbeyjpmSuR0Dr3bpvKfezD5S0Gr6dgvPhvqlo18zzSA6QFAdGWShRyOt6WPJLUXbAlGdflSehrEDh/0usKJGdumvuuX/0NM7LiXng0NGeNghURFaivYhlOX8P0zvMrQqbHS8gB8AhWoCLKxm7U1LHix9UipuPYoURHWEV++vIwdKAYk7jipnvbh8r1Q+jKV3nc0HgBqqMxZyp/rjq+Y4jXZU2IKNUexVr84DHeSs4iuOKS5nrC4wWtEMbvWCJAzzebDCmTTLynIq0EoWNvonrIaJMVF1Up0oHXrgTuwlyszFKFkLNCl36NRuS5fmGxwpM04Bcn9AOgUnCRpEn/7fz7SpW6z68xiT6dZ44QNR6aaYpxyNoO2e1i4NXKoAgHT9WKQlY8OMHr2HQcBbdAXJoZ9IkIF/QtXiMGDhtNN2ETPKDn3yODPvvvrtgDVwiTMuFgj+XY/SMbGGU6d/R5IuCdlyf9SUCyCJ1FEko2Hzv5XSd1lVkTi0M3u4yb8ovPmNcI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB8986.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(7416014)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pY823ABqxn++wz+hEx/q3TEe3+lloiUha+x+X0yOCIw0JbYXXmjAfZakmuvG?=
 =?us-ascii?Q?wud12UkzyHcGvsp98pNoeT/3sr/fq6IgkW/WuE7ncL4gGGHZMxkoS8zfjfDW?=
 =?us-ascii?Q?i0ILQcPEGS8FC+MpA/ehyFbnHyuLFb0zUg0Lkz9amE5NSoZcTV3wJgFSapYx?=
 =?us-ascii?Q?re0enylam6CT4zai7jMj2xDBt0YS3LgPfm2TQ6TjCdbuW6W91iOH67Jtv35K?=
 =?us-ascii?Q?WUAsMBq4X8jS2scrNvuxSwlUC0OOLeE83FWfKq3JVPDand4iJApWXF5vCwx9?=
 =?us-ascii?Q?rImCweeUYU3kenWobiwLZIpZMdAFCzDNTg90kUhnogpgMJjQxG8jvgGUl/gR?=
 =?us-ascii?Q?YuxQnLBDOZFCzY7xm0Meg9zwwxVCoJVtNN3mAGlaiWh7Yv+Io9ALplmHuiXH?=
 =?us-ascii?Q?z9q8FYcpJlpPjnhrnXpMi231BGEl4G8N0D4nyBZGcwjkyBxzK0iXHlS5TE5D?=
 =?us-ascii?Q?lsX65u55znY8HMPxxuOIgF5+sbzoGbt/4VHPJIzxb4G6sTk2EbLqCk58okyH?=
 =?us-ascii?Q?mck2d7EmLZ/d2lt4ndakB28sMaNnIMTAg/yOYzdu5hKjRsdOh0R6IMHLYhqk?=
 =?us-ascii?Q?WjQN1PC0fSi0Nwb8EDJZP1bfYDJvo8OkGhmLo21RgeDplFGZE4vHyOMA8Zau?=
 =?us-ascii?Q?KmmZlPciqPSC4OOYE/03nBDhxUiscJTTO/4x0bTPwU9Hxgvd6HsIvGVCItM3?=
 =?us-ascii?Q?L9EerDPlTg8yvBjzzHJBV2Z14q19eeoMPLQSSR23EnmScP6WpA6sXb1Ug/hd?=
 =?us-ascii?Q?ubzpngFCdA6ZkMwZKjhzEORBNy6b18ArVFYc/ysL9b2P3WJgAgyjb8J2p4Zq?=
 =?us-ascii?Q?meHz0xph6IpD5oiWICnn5U9/+ksMXjO2ruwoMdZxV48JSovASXdyGLEpr+JW?=
 =?us-ascii?Q?D/3n9ZTAXp6cnVGOpzwem4YRfCZVpVD38QNz//tmenluNFVNs0tHydF1Swgl?=
 =?us-ascii?Q?bIjacsl2xB2fWxWGRVi7T5rC0r6SrUGbuvH75gFzIXbUlV6+f9zR533wCeJS?=
 =?us-ascii?Q?CGubEqYUL91YWrjdkceexflsGU+7OTdGXiUgk41/HpS7KRSh6dWFdd8m4ltU?=
 =?us-ascii?Q?x/e/RtuX18DJI2l6yRWjrB7d2p1yVg96A0mv/y18fkIOZs35JnYR1+KqHZXg?=
 =?us-ascii?Q?un88KRYQQt6QMK3FB25Kj2ZbI1iTnT3FtvpKvBm8XqFJDg9frfvCPmrkpm6b?=
 =?us-ascii?Q?ggo9Y9U0me1UNyOqEByP0TfxYvIMHXwEmwzC0HXYce5+zAHiOl0tz2/Sd7hb?=
 =?us-ascii?Q?b+FWHZi1YPkiK8CzRKvwSJTMsuRa5k6bvkBKUjCTrBliqNb0mYmU+BXY2lCr?=
 =?us-ascii?Q?ycBmjMQrs0WERPzRNVZO73ynu+L7mB+PFWAXS46G1THjuRkH35vQgGfnvfPW?=
 =?us-ascii?Q?vtEPBrRuvHOaUIOLiEaD1cbCS3zWyXjiWoOwfO6dx3316OHoIoPzcpW7Pyad?=
 =?us-ascii?Q?qoAXpIZmWk5db4LdMT4yWVAnbWN9Djkx9+gDzr5VWLpTvtqtKzGQJnvXa2H+?=
 =?us-ascii?Q?wujDontyck4ZtmO0adx00Q9Gsfox1Ui4nBu9wI+vyPSeOwLSg1APy4+tQtqf?=
 =?us-ascii?Q?+M/ZwH0lXhL17ekPW2OU9eDERA7WqAWRyeiCrwAup9h8fQ0lPJPG7aA0kDpC?=
 =?us-ascii?Q?SF2B+9rcK2v1DTRtwpUIVDRi2NeoDfoq0HW1AJ8mInpOu+mReEPt21c+FPdJ?=
 =?us-ascii?Q?JCa99OcJuFT4Ws27iWOqCId9fgN4FL8DyDv4u36sqs1R51i0Ac8iBflgV8Xy?=
 =?us-ascii?Q?3BS4r8bzIMA5RTSEqPlmsdWxibz8lks=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ruGLhUU8dHewThTVYW+jO+Syd1j9ML96yb9Hn7aUUUzHlHlLjrNSKjBhadQ9rW4WDdspnFp4gQAl5EvB9xOvtE84f3BIU0sdVIQgIrhnFuZhWpXeoIuIJozmQqz8v+NR8pxTKAvw4Gl8AC6c1BYvwyZMsUXY+XeBhpAfFulus3qggabsmcu1NLlYVhL/ytWCipQUQTN6IMP236lyuxrgmipOHFHY8i9qW/hLBCzPuztbijf5DPkqEjEfKaAMfXOV22zM1hLwy6JZYCL5OScUOPtbFNhuazPu56XpyIiPZegO086gNEDq0ENNBXBRS9y5nWBLxoyTC7WTAXqkq569TQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8986.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 492cb5ba-cdf2-4426-9b4d-08df1d73a95b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2026 15:17:50.9097
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kPEvAvczvfc3etnZlod3ICS9pdWzNxFqUAkuy99A2NvTp8NX7jU4JvBL1IHfwxPYLML/+2aLHOUkRIkvR2BqgHsBhUS6PhwzH01ozVKtkRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6915
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Yuyang Huang <uyoko90@gmail.com> On Behalf Of Yuyang Huang
> Sent: Sunday, September 27, 2026 2:24 AM
> To: Yuyang Huang <sigefriedhyy@gmail.com>
> Cc: Loktionov, Aleksandr <aleksandr.loktionov@intel.com>; Andrew Lunn
> <andrew+netdev@lunn.ch>; David S. Miller <davem@davemloft.net>; David
> Ahern <dsahern@kernel.org>; Donald Hunter <donald.hunter@gmail.com>;
> Eric Dumazet <edumazet@google.com>; Ido Schimmel <idosch@nvidia.com>;
> Keller, Jacob E <jacob.e.keller@intel.com>; Jakub Kicinski
> <kuba@kernel.org>; Kuniyuki Iwashima <kuniyu@google.com>; Nicolas
> Dichtel <nicolas.dichtel@6wind.com>; Nikolaos Gkarlis
> <nickgarlis@gmail.com>; Paolo Abeni <pabeni@redhat.com>; Sabrina
> Dubroca <sd@queasysnail.net>; Shuah Khan <shuah@kernel.org>; Simon
> Horman <horms@kernel.org>; Stanislav Fomichev <sdf.kernel@gmail.com>;
> Willem de Bruijn <willemb@google.com>; linux-kernel@vger.kernel.org;
> linux-kselftest@vger.kernel.org; netdev@vger.kernel.org
> Subject: [PATCH net-next v8 1/5] netlink: specs: rt-addr: fix the type
> of target-netnsid
>=20
> The kernel parses IFA_TARGET_NETNSID as NLA_S32 and rt-link.yaml
> declares its target-netnsid as s32, but rt-addr.yaml has it as binary.
>=20
> Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
> Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
> ---
>  Documentation/netlink/specs/rt-addr.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/netlink/specs/rt-addr.yaml
> b/Documentation/netlink/specs/rt-addr.yaml
> index 0ecbd24c890c..17ead2203451 100644
> --- a/Documentation/netlink/specs/rt-addr.yaml
> +++ b/Documentation/netlink/specs/rt-addr.yaml
> @@ -119,7 +119,7 @@ attribute-sets:
>          type: u32
>        -
>          name: target-netnsid
> -        type: binary
> +        type: s32
>        -
>          name: proto
>          type: u8
> --
> 2.43.0

Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>

