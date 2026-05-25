Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036E63AB298;
	Mon, 25 May 2026 06:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779691990; cv=fail; b=J3kpZjj3uC+9kBYEPo5Gh6VHoZIagSZSReUT8h6awjB7TKnSHlujn8Ei/bmsDH6doWgX1QCBLNZ+FRTrMIwE6Gfs/l8mstaskYVgz64FBKhy3lPqP4b50g+XVTJWwuy8rJEmklN+AuACtZjRJJWMFWrOHH4h1tf91KGURusJZsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779691990; c=relaxed/simple;
	bh=Hrbo/5riu4kRyMu0BmU/TEYag0QuzXoyzx7QoHz8/uE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Zb/W/cy/hC4r3fzfVTrbkybSdDr8+hzZqLSENOVK9fDQ1BBWY5HRsE8ir5tErC78VA9fDJ3wbj946YG3yOFnosp2/ru8n9U93fnrgKzRy0DNs/IvYCXzi4xIotKuz2BfFwZzQo6dQYrbH/afrCxfMOntwv0Hd2xXxvUL5sOeITY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZFQpQkHS; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZFQpQkHS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779691978; x=1811227978;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Hrbo/5riu4kRyMu0BmU/TEYag0QuzXoyzx7QoHz8/uE=;
  b=ZFQpQkHS2MkJkevjdCiiHwoSSUtCFlJqGnzYvPDEO5xXiwcaieavgk5d
   0d/U1uFoxlL/l0CSewFITR7ZVOP/xeKQnh851FD+PUwwN0laK+FWJsnus
   +UlQ3ysT4rl+tpIkX3zOEr2+/RdRaKW5+eKhIuy9grQBonRr1if6qEitH
   EbiumSGIlkVKA2XJSJXp0P9eVh3Yh10jPZHrsQKwtctF1nxxt7gvD45D/
   w3ptrTSnojWEfNykoAErmRPAyzHiFPkYKjjDiT3dzHDdjLXjKp2IkvUwF
   WbQIE5D2JYROzFMPBd7cbMpd+mb0VFrmyVGkvawy17e20K4pmxhcCSmmL
   A==;
X-CSE-ConnectionGUID: +/oEphehTn2wwgnZWcY0eQ==
X-CSE-MsgGUID: fbJd/RcZT9KrC5J624IssQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="80627866"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="80627866"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 23:52:54 -0700
X-CSE-ConnectionGUID: fe9UW87sT2aeqGaty1+Ekg==
X-CSE-MsgGUID: GeZI473KT96RV4640bf3xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="245796917"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 23:52:54 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 24 May 2026 23:52:53 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 24 May 2026 23:52:53 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.43) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 24 May 2026 23:52:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OrPdN3P4X4W01pNxg3p+X2M9dpkp8Npac210W1stFn2Ijbxhie06HSDIVM+03uRk1o6ITxmyKi4uwf0XCdqlSIDHfk4iu9mgTwbTduSaf5cFRdmznpszexOKF2d7cF2ZorgoGma5SQVnJ1aGObHeNeMSJc6qhvOmQiCAbTsgQGmQ2ZEA/GJDFyjzTu894c0k/NdlbtlOVcUKD2ZRYxJQpPGqBKsBQ/Tce0PlQ6gMIf9Rl6AwSPhS44ACR7Hee5vgYPuVD7lveUeuQeeH0OQUJaSHjoHTaT06CAx+/4R9JqLw/2YFLjGpetxnGFKd1lAt8ELAODlRNdp5SHMiVVzVZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hrbo/5riu4kRyMu0BmU/TEYag0QuzXoyzx7QoHz8/uE=;
 b=CTYCKjIOxbK6fzmriisJtudlXPPXivCyqnERPK+ogD5G/TcYbxtDTSrmfLxPgszA9jBTDxBhhp6vilSNbSXWgTaCCO0UDS4PsPxANiZjDeAcVqS3w8HQXP6Gpqv3ai7YQF/NyGyXv01j4VEyJwm3yaTj5jiRlpS4L+Dk/i6Mc4JH9UKOH9fencSutsa//AYrSneHsj+YYAl8ADjNvqDXtW77clpDNvSmxZx4C0Ye+0MiCIt2tdRtEbtOZQn3nji36ZB6B18tvMcMZUjlsHFyci8v5hQx0B5sYUlzOsoX3B4WobUllK9ZWlLzCPInpwv6mlf7+JGXhnqm5C8nKHyYvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM3PR11MB8670.namprd11.prod.outlook.com (2603:10b6:0:3d::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.19; Mon, 25 May 2026 06:52:50 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f997:762f:f079:134f]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f997:762f:f079:134f%5]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 06:52:50 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>
CC: "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
Subject: RE: [PATCH rc v2 4/4] iommufd/selftest: Add boundary tests for
 veventq_depth
Thread-Topic: [PATCH rc v2 4/4] iommufd/selftest: Add boundary tests for
 veventq_depth
Thread-Index: AQHc6YMsPAk5HwiFLkidGecO75YK2rYeUyBw
Date: Mon, 25 May 2026 06:52:50 +0000
Message-ID: <BN9PR11MB5276A871A844806BEAD9C9838C0A2@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1779408671.git.nicolinc@nvidia.com>
 <acfa370fa4e89e4626f71954bad7ad2bd64cf63b.1779408671.git.nicolinc@nvidia.com>
In-Reply-To: <acfa370fa4e89e4626f71954bad7ad2bd64cf63b.1779408671.git.nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|DM3PR11MB8670:EE_
x-ms-office365-filtering-correlation-id: 339f9bfd-2674-4bf4-5843-08deba2a3ca9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|11063799006|4143699003|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: dyrtXiAk0LZ6XMed6bpjJJqcTsiTTtg+nqgz847BrvrI78hzee/mEL2oyZE1Z+qtsfShmhPzMdwN5Y0tcwuSXHw0a7Kvz3BbpDhWHh8/wmlhhOPukp9WCt/9Z80J7G/bNSgilWsaVJFNe2BqmBumJLvuhjLeXIRbiFsWfSnKa/pQ63KJEjlgX1ljGEXKExrnvYef2IrxoCXVPr5/ZK59KRYS83HIdZnLxJzdZOGBLCY+O0BiS4ZTnjPyBNntlaB6lh1lXJU1D7CiQrI5xdTlglVLAVVkmLcx6p+OLuXJX4OKAn5Si17WIvAx0SEFM4/Ki19zUBT+48OhcidG6L3VAj8zLmULVrdbvS+DuYEHV+QA2IJHLANdEbmi/lWGz8niHlunN1r48Kv4Q1v6lbMSTIK3wWKhe2oPqR/HrB9eJctqU8Kf+U0zbGLH7O/iE3zZnQAtBufpLU6VaBDVJqmgj526Dk7o+M2uLo/8QAeVnzijZF+GVu41mw7Ks148+35xk1O9x9Kl4hJEwSyshfEkSprValiXtJ3x51KXvtRVWRLyhVH3UCc5AeJ6B9KMj0C8sM0kQgzv2KNGhrz/ngei2rftRlAO307Yn7DeLhqDCe5JoVgwAR1X3U3T2Ib4FwGKbETQhturu/mD/8sUMOjSSPx42NcDEpih/WbLXCAyEm4nuvWDrBg6wHO55xcjlWyNM9yRc77eg7ZEMnZBPBcRivmEffG2E3Pcn3nVrFCpKJdZg21RUyo28JjHNdsJwS+Y
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(11063799006)(4143699003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WHu35RO1ASW034jjOkLtLwACKEODu5AcgXlFI1vR6x/r4wOsErn3Hzi5rtw9?=
 =?us-ascii?Q?KLpHj23Y4T/r375fm4DXQoUBEfhvHuj+oUlv1++CLphCevgquC8QZ2aNwepb?=
 =?us-ascii?Q?OrVwInsU9taECm3tX5pV2D+uqr5dWHq51vW4XNNiAAFI+P8Ltk0XB+AU4nkh?=
 =?us-ascii?Q?d/qlznD5MSMKe4pHVf8YwcljXKyESzRRz4tBN6oUmUfiBKGgVQ7Cpzcbz2Ph?=
 =?us-ascii?Q?Bw3o4gyB0UXR3L2X2KG4FsEfGLy8YxKniaH1rY19DGrY6LKSNO+j/YN6ZPAq?=
 =?us-ascii?Q?fRUMfqJ04kqGiZYE8FcZJfejUlnrdpJyaQIPamAUpP71k8kMyYqVEswWBZMv?=
 =?us-ascii?Q?RRkidnNhaRg3mKKexU4qFFro9l+aBeqZkegDvxaEpYWicEphQBz6bhabAcD7?=
 =?us-ascii?Q?SaHD6u1SZkK34t3Ol7QEVapy3KtvzsQklIeblLHTiNtGEgoatDH1VZoNR39B?=
 =?us-ascii?Q?i4qwKP5Z+CnSuPbBi2xCoX4r1hAk56JIZBUBncjJaAIRwwWxna90415YZoYz?=
 =?us-ascii?Q?zf7rBT/Im1fAEUGYh77c9Wg+zFxLiu/ZJ8CYyZhkYM0tNH+bQeT1878/y5J4?=
 =?us-ascii?Q?VsJGXkLuqvt1ZR6iKJYjPT9ToChi6UJi5Pyq4n/54Xp7fk7Slro4iKb0+ZMn?=
 =?us-ascii?Q?1YcOQPExxj6JUrb2eGKAtwnqW5uGjK7S14RrHyTecKD2HdsH+GN+BsSabOpZ?=
 =?us-ascii?Q?I05q/8VaTCT/G3HaB2AVK1TQ3mn8ZYPs73TPDi0Zj4vSBBxgqtcBYByYsfju?=
 =?us-ascii?Q?ZqbkGJBEZ+QNPIdHUG+7osFFA+bYQGq8OG0GeqTA8kf6myhNskiyOkMWHJ3u?=
 =?us-ascii?Q?MGkTscjYrxWTSqgwc2LaDih5OaYi7W8QpvGb+uv++9BoZSGPHawlJAFfOLfM?=
 =?us-ascii?Q?EYo+5HvzAYx4M21Gx9/4S8ELzoiA0Yi+G1mIQeGFEGrFf34guegEwPR9vcBM?=
 =?us-ascii?Q?Aj3cMPDJBtA+J0w8WknyRrtYC+mf1IiT7Kkc5LMDQGJ8LcX6Jk8WnSi9nMQy?=
 =?us-ascii?Q?faBbJJweT+YYJ02j/6TG7sfPmau3XiQH1cKenirp9MJUcrMte6qeOsJumMV3?=
 =?us-ascii?Q?W6iAQGTisvp0E1SzpYCRHpUCZzSTuYKSQEvnW8FYtITyQY9NUTpFph9hVjkj?=
 =?us-ascii?Q?tzvcm2e81hPdesWEGN8/hP8P2FVJWCozXm50zVETbQbPptifFq1DpaAfpqae?=
 =?us-ascii?Q?aKtxFwJ+f3jX2V92j4OP6SYg1Qb0PJVis0QN6iRNK18e6atZIEqWOZAl+hcs?=
 =?us-ascii?Q?arRzxSjjrmJDkUGRe3rLM58qciaiejFjRXUjO7JzEl3xRksHIHrD6OexkGNB?=
 =?us-ascii?Q?/li+WYUIDEKTv0uf9Qu0gNldLOJ2fBB37EkkTEyBd62Bs51MFVWJFL8/AoeA?=
 =?us-ascii?Q?vAGVqxPYX3SpvW26zDHo11lhUTGBr0/JnPg8tQDprEPApDwP32oRqvTY73+q?=
 =?us-ascii?Q?0OIoOVY3WA2B2K95+5t99/GRvAU9M2m1nggkiqRmtlbc2sDB1gc5KX0Qka58?=
 =?us-ascii?Q?w6Xd0eb1RL434xHYgbDSuYSfQnZnDTU/GVhs8kw6TLpijtlgcRtArPkPpLfe?=
 =?us-ascii?Q?6bgaSXXeAR74caB3dqlNoed8N4D3nQA6e17z6QfBXHbN6wA6MhYcfQ5wgmRl?=
 =?us-ascii?Q?J4WUzQQmYw8Srm2f0uzl6BQM7JvBzSxgpsjtGymkmPtjQiSk6h4P/PWrovMo?=
 =?us-ascii?Q?Stu2MuQzHarmvLSvD7doP8Vn0oqrXvKjEj3AdntdW0c4gcRxqGif77+f+xX6?=
 =?us-ascii?Q?3itRP36xsQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: PjExdcLTbmSMdauQgIO81etkzWAOkp1a4SQCEUt3W+VM0LLNDDfE47Re2DhVIzIsvYiWaJZlxmCms0ouADn6HzGgpCCavjs4weUB0fJVNejYWoo9YWe3Y1plPX3fMmsg1I+QvrNU8Oigys/M5S7UlB9SpZL9O78U1C6h9fPvH+TMkPycrUIDbn6vxQDA9Mi2agThBVvogxWZThr+DJX+2O2sRz71zlEx/rb6vTI7PV3QwPBKpJ0XZFWDUEfmtQJadbEMLbgV2Kg0nagTgc/J/jkGk/lj8+/kn0fFHx7ww6dbW1JEAqlWyHmxzC9cC58n8ol21fBNHaqOnEtNHM5Kmg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 339f9bfd-2674-4bf4-5843-08deba2a3ca9
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2026 06:52:50.2222
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckgfodMZw9lTQ9zl4d496hK1Cg1vh9g2fSrZrHs+BYS0TwTaat1hzvZtC5+NhwFkPEV4tBjxY2dJRuzkKLPPKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8670
X-OriginatorOrg: intel.com

> From: Nicolin Chen <nicolinc@nvidia.com>
> Sent: Friday, May 22, 2026 8:37 AM
>=20
> Test veventq_depth to cover a memory exhaustion vulnerability.
>=20
> Keep veventq_depth=3D2 for the existing callers.
>=20
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
