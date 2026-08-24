Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011011.outbound.protection.outlook.com [40.107.74.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1282B4334C4;
	Mon, 24 Aug 2026 14:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787580412; cv=fail; b=Vm5D4J0TCQcTBGf1/ccABH3kAn0bm5niLfKtrUPVLUTszw5uzRs4TA0ZOHW1E8+QcoUFZToVgBbso93C1MmDMX4g1KVfQVQz1yPAO4Ak5vOv68AhJzErXIQZya0aPzKATgdd+Zw+wwVK86qpF/nr0H8t4bVyqg8euBLJAqfwAFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787580412; c=relaxed/simple;
	bh=eGvU5T9P3TmDdNKBenQoe4l7vvMgw3UgsDHEnvIB74c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NQTkYNa4LO6dncbg+lonoG+ii7w7l92KTjEeYsMgAycmoXUH6RNfAJylQJA2Elm4quDGc5gbJ1qmQ4jngDwclyeIaLikDRPm+bSSwzGE0HSUu3eyUVpjfRS3uAjLufvwYpXn8VTGxj2FOeuv7y0qT61OHIxpWWev4wagTI0fXT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kfMK6lFt; arc=fail smtp.client-ip=40.107.74.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kfMK6lFt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rcaj8D+RcJhdovN5NWrRHMc7CPblfbNeD1fp/pgzj1fXyiqTaIYfMRZhB5tLJLCrg0JgLs9gATe1WEPtDb1LCfOZkHum58dAbxHRTXLF+q5HPGNPpzXZ5gFuoI/dnhS8YBeVPprw2wwoG/r6/9XIE2j6ccfW+k3AISMEjs2X0nFP0IeBMMOocdEqCNmi0suhPqG4BAzUCnBx/Q7EXDCC55VvdZLexnSiqCJqTgKl0QDhmSP7ObR8x1EHXQ2fkD10FCcBTVVPwUDQe9hTs9yTzcawg22fom1RPa7uZZTMb2E8UB2SyoqTrnaK+UDf4ICgTFunmMHOPu0Dfhn4V5uAAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eGvU5T9P3TmDdNKBenQoe4l7vvMgw3UgsDHEnvIB74c=;
 b=oyCijYh0aKqwP5I3Mv48ZKztGDRjpA6yUh9uDNtiLln7emYCHXB4E6uFDtxwQE6m5Pqua03ISZeT5ZTMy5CZmE4mrspb/wfzkYpzDF8d17LTod7kIb7PFzaZYhNNX9c4fuBr99EuaspmmA6HL/ftIJ3TZS5F0ASal6V0Qn2ycVI3mB6iGHHWKpSt8ZIRGU4f1BPtK+reLcbECSE60aXyRNMjdmRfyXUMugZt8ARb8GJ+946G9m7Qs/9B0tnbGIw4byrkyj8174UYCbRbkeNHFy4Q1KJFPAzYjbavWIglrJaiL86BLKeVeYEIqRF+OcdSF8uFv6Z+n8hbUOznYLep6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eGvU5T9P3TmDdNKBenQoe4l7vvMgw3UgsDHEnvIB74c=;
 b=kfMK6lFtCkuyAPSVRvJ3knNXA6gFAJZO+oBqLRQ37FRtaBWZKHKDN7wWbP2gCDmUKbfy3pXXpwCnBMIkEckjhfwFDE+y3GySM8qbSAg1NCCG3vmk9deEjeiGfmCSxHRdV/npXX9jwE5S5S17XRk1kFQZLR8g7wT2GNb/MXl/WMY=
Received: from OSCPR01MB12769.jpnprd01.prod.outlook.com (2603:1096:604:33c::9)
 by TY4PR01MB17766.jpnprd01.prod.outlook.com (2603:1096:405:388::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 14:06:45 +0000
Received: from OSCPR01MB12769.jpnprd01.prod.outlook.com
 ([fe80::aa72:ef1b:2a85:fc2f]) by OSCPR01MB12769.jpnprd01.prod.outlook.com
 ([fe80::aa72:ef1b:2a85:fc2f%4]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 14:06:45 +0000
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: Joseph Steel <recv.jo@gmail.com>
CC: "maxime.chevallier@bootlin.com" <maxime.chevallier@bootlin.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
	"alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
	"shuah@kernel.org" <shuah@kernel.org>, "joabreu@synopsys.com"
	<joabreu@synopsys.com>, "yi.fang.gan@intel.com" <yi.fang.gan@intel.com>,
	"jun.ann.lai@intel.com" <jun.ann.lai@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>
Subject: RE: [PATCH net v2 2/6] net: stmmac: Enable double VLAN processing
 only when supported
Thread-Topic: [PATCH net v2 2/6] net: stmmac: Enable double VLAN processing
 only when supported
Thread-Index: AQHdMY/0dgo/tiEIUk2Xug2eWJ/wF7asxd6AgABVIZA=
Date: Mon, 24 Aug 2026 14:06:45 +0000
Message-ID:
 <OSCPR01MB12769D2A80BDC392C42EC63C9D3A02@OSCPR01MB12769.jpnprd01.prod.outlook.com>
References: <20260821170959.79708-1-ovidiu.panait.rb@renesas.com>
 <20260821170959.79708-3-ovidiu.panait.rb@renesas.com>
 <a77cwrdtjmzi6zextnlg7llrqh56behj6zl6jkon4ta6gwnbdj@unwirtt36qwn>
In-Reply-To: <a77cwrdtjmzi6zextnlg7llrqh56behj6zl6jkon4ta6gwnbdj@unwirtt36qwn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSCPR01MB12769:EE_|TY4PR01MB17766:EE_
x-ms-office365-filtering-correlation-id: c2f29df1-4ed2-4301-f8b8-08df01e8ee5a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|38070700021|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 r1h8JGNg8zpi6eoCHzaN/ghRiY6fsV9oOxl4AgjYsV/eHP9EfKSXwhb6HyFlPn53yY/mMkWpnSkoxRDmjgb3U8uutubX/c0WYAn4AzT0pYLda7J77IUl1Tx4c8SLWMRA0K673ELpL5p8495OTCzamFhUvEyv2jfTwdKGDI5uT4oPh80TTXXzy8E+XCy+CYeYDiQJDXf11n7ZOLxetXJq88LDtPDE2KULB/M7rFMMDZ5O500dj7x4XRg0jP2AFlsvnp9W6PVl/A+BwYXZQlzsPUPuBPy0uubjDZ0Ua9c/iAyEVqPATz3wp8NWZOZRi9Y4tKJl5+EyNyGC3LVI0JdhyeLsf9759bHBCwqMnPpm4lANb2RXRgll3LUxGTmAMQhui6QGsSd43Ci1tW+DTX/3tQN7AEapSGtw5JQ/z0oct0a0CywXi1nU4YOR4L9UFJP8EFgx/cZloZF6sWBsOecJmlbQe85KVHhoMy28gl81wof03LswcoIh5isFzzXnf+dmqAygRsZAFQ/JAfCSV+z9ZsCW6pcsfMMJJRUIKkMIdiHFlw4nvG2WtAS6g8e5nrIZx59i6jp8gIonI+c+x8KRAUPssfxUzP6IfANpJyMGBEXlPP/kkVKQbc+jXQw7DV+t/bvsdycYIs4HWSxC4+Sn+MokXoUHZtiU/w471e18sunvhNqBEyUaWiNWujItEQUJ6k+R4PRyrk6eu1fzlejAwtbL3NqsCTgoFA0TxsIHpl0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSCPR01MB12769.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(38070700021)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?9yFF44GZNK9PE9AOJ3bjSgQi8AWGMrPFTfvnR2W/9o1KTyVB/qwUprpgxthj?=
 =?us-ascii?Q?I0CrSzxbwjbiIM2hewMOV+YgC6ckhh6GZ0dzYXX7dkfTYViNR3ISjd7yAiZg?=
 =?us-ascii?Q?ZX1+fbFkHk2apPu0iX9aQd4pi5NCHmJSgrjl+IFjjrRjisoMSfsYUCELzzxp?=
 =?us-ascii?Q?snQjQrdCLPWWTIowNYX/Y3PB7k59w3dYdjs3qs6y8xPZyjuGCCAU3RY13k5S?=
 =?us-ascii?Q?8KV8n7LIHFbWOqf9QvezF9oK9t7tr4IJgfkXMBoARgzX/fw2KLrSX/ZctWdU?=
 =?us-ascii?Q?cRpopoNrRATCrNMU1E/pHVOJWjQb287Lci13ZkfjzoV9jY/4MFSD5RHe3jFe?=
 =?us-ascii?Q?lYN0yq4RsH/jGONcOvxGECtRo6K2ek7bEzZboDwjxhpHJsHcKrgGvf+FiwEC?=
 =?us-ascii?Q?Mrh0qFMsBJGm8ZoCJO7+jje1msWsMs6zfAvLndavSSqpLX9HSGj5XjWqcBc/?=
 =?us-ascii?Q?Bq8eSasIKuFpIOtCWW0ISs1wO7ttsrW2m7vf2JAfTdTXm+7bXxqra9UYzccQ?=
 =?us-ascii?Q?Y14RavhiQ4q44rw6DGQNrweg0HsNeoWQOM3YjXpyg6taBUzEtM0CZxfjvX5O?=
 =?us-ascii?Q?8ZIK0l6PUrREUdPSQYeJ48Z0RsQ7HrXeetOQdEiL5xUjpuy4Xn0mz0yVIHDh?=
 =?us-ascii?Q?0L/UusASdrtNRQJGBB/LXHBQD0xjTASLuptuYBGxT9Bi/WRTcVsEvrz1tDBR?=
 =?us-ascii?Q?dVz1+aIA3OeC0YS01wFmqPgpgSwsa2JZoEaEaScBoK/j9tR1pu+MNRL/YN1c?=
 =?us-ascii?Q?vD7ID9Og5v+LY5ThP5LYmwsBEcn2gUfwaLhEV8qILhigztbRS44MvDEfnR+a?=
 =?us-ascii?Q?sKf8vMw0x4g1gOKzwRUv6gMpwJZkfTKZWS93fH3TxwuBVJo/9yhH5G2VTyib?=
 =?us-ascii?Q?FUwrnuC9n+t/0R32vRaiRnewvvobzOUYuBC1YYOv7ML+NoMoToQ8H6c3ycr9?=
 =?us-ascii?Q?jhRjewM9CCmLN9cT6p97kbQ5LpU/BtGh79E0t/9jnoHQoM/7Tl/EMtfu3/w8?=
 =?us-ascii?Q?P6K41JIQ5qnMZKfxEAWnSRKpj9/W8e+OayOXf1nvVNu9PIf/arUPhAR19tJR?=
 =?us-ascii?Q?AqA2H3P7dCa3ZmfSMvNLrrQpjuZNZpwVb/xaoQr4afybpMCT+eR+5UwEv1pZ?=
 =?us-ascii?Q?MpSdox7H7owDfKnDcYOEwBwcr72fM+0EJEr9poCpowxnQdAU+lGdMh8NF93/?=
 =?us-ascii?Q?TqItPkgDHkLYbCl1m7drlbHEjqsiyudY7qkDSKFLeHSUgv9Ejw7hGYZfqSAy?=
 =?us-ascii?Q?N/jTfO+ajakVnuYzsNGKWTHPWeRfp+EJAK7wTNIVheu6LdFyDXyDSOLDIXzK?=
 =?us-ascii?Q?Ox3tXC9CxAvSfSrQujeP60hSGEg0BCthEOujHyKL5bH0rrbHxFa7yow4uv4e?=
 =?us-ascii?Q?mQP9E5fDrpfASnEGmHonRgNMhEZ+kQqoJQdKQQBliC3n9M73sGcG19kzE9NY?=
 =?us-ascii?Q?TTwJL8chAU7SflEgw35TDmfwkNKtkYYrjjMU6e0Lb2R24eORzt9AIVP0jY9x?=
 =?us-ascii?Q?8h894IZnE0+rUEj2dEaR1JIArPRZcx5i7RriOeEvtLmJuJkqejcfoALFmTpB?=
 =?us-ascii?Q?JIpLM4tGU5FkYLQEhAxnCNzvgV6Z9mAPRMoKB28ccfNbUyfYZCwGfRLyjJF3?=
 =?us-ascii?Q?gmin/Z3mPFQzmh9frIOvZWmT8+SrwuBhnMGh8x48yhAPsIex+iao/gIPmov1?=
 =?us-ascii?Q?4g8o1j3UyUXXxUi5Zl2s0whuOhgUBT87pe7DMx4RW64dKyaxFeFaRFf2tBbT?=
 =?us-ascii?Q?EiJC0YvscCXr1Kk15nfKJfsjC9yOXXc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSCPR01MB12769.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2f29df1-4ed2-4301-f8b8-08df01e8ee5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2026 14:06:45.2841
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 90YRFKTGfmzeMg0Qmdthxzho7UqWQOMV3zhR2gERc+tQNcg2xI6F3cacSXH/6KUORxJTxxIbjKezmg5HwVcxuxKzTpAGqezzvVWKZAZiWp0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17766

Hi Joseph,

>=20
> On Fri, Aug 21, 2026 at 05:09:55PM +0000, Ovidiu Panait wrote:
> > stmmac_vlan_update() turns on double/S-VLAN processing whenever an
> > 802.1ad VLAN is registered, without checking whether the MAC actually
> > supports double VLAN processing. That capability is reported in
> > dma_cap.dvlan.
>=20
> This is not true. S-VLAN is never reported by the dma_cap.dvlan
> feature flag. Double VLAN tagging and S-Tag VLAN features are fully
> independent.
>=20

Right, thanks for the correction.

The EDVLP bit, which is currently set unconditionally when an 802.1ad
VLAN is registered, seems to be the only one that truly depends on the
dvlan feature flag. Taking a closer look, setting EDVLP shouldn't be
needed at all, as the driver doesn't implement any feature it gates
(inner VLAN stripping/filtering). I guess removing it should be part
of a follow up cleanup series.=20

For now, I will just drop this patch in v3.

Thanks,
Ovidiu

> -Joseph
>=20
> >
> > This was found while investigating a separate bug in the double VLAN RX
> > stripping path. The outer 802.1ad tags were unexpectedly stripped by th=
e
> > MAC (because the ESVL bit was set).
> >
> > Check dma_cap.dvlan before enabling EDVLP/ESVL/DOVLTC bits, so that
> double
> > VLAN processing is enabled only on supported hardware. Also, advertise
> > NETIF_F_HW_VLAN_STAG_RX and NETIF_F_HW_VLAN_STAG_FILTER only when
> > dma_cap.dvlan is set.
> >

