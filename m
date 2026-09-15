Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010030.outbound.protection.outlook.com [52.101.228.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991B747A894;
	Tue, 15 Sep 2026 09:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464477; cv=fail; b=DlsipBEMbc2we272lOclTqVRLJS/4GVHD8JUxkLIvtgQXVL91HFA/Ql3aTIYpHU0RTfYs8UWY8uBIAKS28BNLMIQJ0ITOBLVzOXLhulB3Lq1v2DgaavG2z6TKgAfSV2TyE0xj8rCPANCggP0fBFJ0rYy9a6uKCs10RFa5Rh36Sc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464477; c=relaxed/simple;
	bh=QG926t0eDXcNpKo79cGWH+PMpXq/mR3E3lyUSWxn124=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KLRgKeaBQs+avpGO/0AT6aYhqW+hee7t7x7ttsUNzDLasHmz90qwGn70jQuEH2+5xTnsMffjTqu8KTXGkBTOq2SL7gFA4Z3/vlt4LRbr8hwIgO66hb4HSrMRpiScyaDQ0XQzsH+5pNN54QtHgyNUmsVqQdGGpxSOs4W6UjMSYss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=JarXZbEY; arc=fail smtp.client-ip=52.101.228.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="JarXZbEY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WRpRRhzA3+hKrmO9b442uPwbE6zs9dQboBOoDPevFhIzvtiDic9nW+gUSPClrB6opjDMOhLgot7yhLOWekGBZshd3Teb/IXwQHKLAqT5a/b8Q+f6ldrEvUlxDSWO6zLsXRY8eZPQZq+x0t3cUvJn1TFvJc39GYLrMDW+g764NumkW58wuEAaz1ONq0aWpBErRXKZoSZNIePvlROvinoD488MJ3WU+zxWPWEnoN7iqhm1CqGBqO5+9HuTm6Hl3+NDrtZOzCdFwveuZZtY4X+rgH9y4LSMgL86pasbSosL1UgFoLIABzd/K/a/k5WXGIbrRtZIeuM+c6zJzU8ZLfjFdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QG926t0eDXcNpKo79cGWH+PMpXq/mR3E3lyUSWxn124=;
 b=XhyjuDnXJ5y1YMTzuBu1NqMuQKnhwUXB1Of8d+db3ygPBj1+plupFrZrEYEDwWNUj4l9ceUAiOliQHorvT+NiOw/Xy3HKYcMlwF2zwKNBeaLn4cWbprykYn0icnCAE5iT63GW33fCLI81RY2tYFdGyJVyxBUkLQXSJvrIoajvo2vJY7CJhzUYeHWYaeq+USjO7KhBsuNrewVcmWylXuyabLjnGaI3n6LpKB3OruHW8kedlNtC9aa87G54FCn3kmae1jDTshZbFSLNXqMaeGxLMYLWzr6POARh+PTQCc7UEJHuXlhKmvKYLhzfXL7LgQb8Lmm9wFVaioHs7tHqSmC+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QG926t0eDXcNpKo79cGWH+PMpXq/mR3E3lyUSWxn124=;
 b=JarXZbEYACwf7pZHsMAtLd5y8bkNCs2gI2j6INQN22Tmfams2HrVOJcMo6ka4uYhTELyPftEBxGHZf4EJ+LK/c9Hr09ExRPmZTehlKYdbz/zkEHg7P39HAPRKCsupaw5K1cd5HACqLDKcoMl0prH23z1mYnnY7MQdx8JValQzYE=
Received: from OSCPR01MB12769.jpnprd01.prod.outlook.com (2603:1096:604:33c::9)
 by TY7PR01MB14443.jpnprd01.prod.outlook.com (2603:1096:405:23f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Tue, 15 Sep
 2026 09:27:51 +0000
Received: from OSCPR01MB12769.jpnprd01.prod.outlook.com
 ([fe80::aa72:ef1b:2a85:fc2f]) by OSCPR01MB12769.jpnprd01.prod.outlook.com
 ([fe80::aa72:ef1b:2a85:fc2f%5]) with mapi id 15.21.0406.012; Tue, 15 Sep 2026
 09:27:51 +0000
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
Subject: RE: [PATCH net v4 3/7] net: stmmac: Rework S-VLAN handling
Thread-Topic: [PATCH net v4 3/7] net: stmmac: Rework S-VLAN handling
Thread-Index: AQHdP7FBHec8YOvxvk68IcIebRlwK7bPZRCAgAAAqgA=
Date: Tue, 15 Sep 2026 09:27:51 +0000
Message-ID:
 <OSCPR01MB12769E621C234C53F33FA88F7D3BA2@OSCPR01MB12769.jpnprd01.prod.outlook.com>
References: <20260908164309.59282-1-ovidiu.panait.rb@renesas.com>
 <20260908164309.59282-4-ovidiu.panait.rb@renesas.com>
 <ybotecadvx2x3ucgqjunv77fuyeaxmwl5tn77fswraztiklrdo@ajhpl4c52hcy>
In-Reply-To: <ybotecadvx2x3ucgqjunv77fuyeaxmwl5tn77fswraztiklrdo@ajhpl4c52hcy>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSCPR01MB12769:EE_|TY7PR01MB14443:EE_
x-ms-office365-filtering-correlation-id: 2af55dc9-96e7-48ab-e355-08df130b9d4a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|7416014|366016|376014|10067099003|22082099003|56012099006|5023799004|11063799006|4143699003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 7otVuJNKeG27jEMPBaZQIHnDgQPSNp4dS+4oMBsB3wPcJvL27x02j1tq140llNr9Q+ZXTBiWYvLAWEmz1T1u3m5XikgThzxrNJZBKnmlb/FAKibirxDbkFjuWsvZUCLUZ6wWQrLTzcsgBOeOt+JRuJjwYTdaRTbgK1LoSAaUN72zjgNP3CH09HLiUItCSo+y4TORzfGH5yXsDJKGbbmcN1RrieeFJTT6DtLmw5Qy0JV6JSjqLppGRWp6yRy2rC7w3HXR0EzYzZ41BWnJBpVHuHaKbcTduHBlXvPV183kwYINStMtEIfvHkwaMiCN9feT2D49h1urAbdWOTCBXl/Kn4BKAe0LzbQW/CEWSn9IhSJrplgAb7emm05cTNDn4vu6W8El4WT1NSKBOyvAucOf6cJ5X4d6ytKw2WdgUEojdT9yED7Ai44iujPRXZ9cNsldbCLOZJstYSDJ6YYz2gk+TXf7m7UeZU0dQeN9xzyUQyTLaG/DQTIotnyOfKa0sH2qn4/9d//EYp526+pl4glwSmBVKnbAxjF1seYBfcqKhYQPyeDpZiRH0/zahvz5xExADbXYyGSqxgWiAJ65c3hExFZFLACKLlvEEnBeahP8UaaXmpQSETd7hdnZ+N1qHhF1xfn9mtbJJT5rgMn107GL5OH+RxR8tLSH9Gs9lnq1NM4WociVU1ajT102mzLdWlbZ1u9apBcVQa1h02dmR/bDldEjjmlIuwnOUtqWW+OHNwo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSCPR01MB12769.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(366016)(376014)(10067099003)(22082099003)(56012099006)(5023799004)(11063799006)(4143699003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?c24PCWcCqUJQWT2f7Q+xSG0uOohJwpq/7fvRLRKfGvlwk8cnsg7PvXCf2M0U?=
 =?us-ascii?Q?xRNXSZ6pIHTCgwk3I/ij9QrStjXRvD36ux0m7Q7UaGdcC/zylB+yE0wcvcSK?=
 =?us-ascii?Q?qhXhbzhWzPNAZucj4eHH8sjxGCy9hWGCb9UzFwOX8iIneVTuWI6Q3wGKfn2h?=
 =?us-ascii?Q?Mi6RqKAdvDD7JdHIv6NBTKnr1zCxZZlTxI7yHOc7ZKHEk2yTgLe7mnOt4SSZ?=
 =?us-ascii?Q?s/LlXnj9BvBPj/uvcuLJKW+mz55MUkf0qpY5IGjdKvspSHzeT5UI5r/nDJaR?=
 =?us-ascii?Q?+J8Dh2pUWYNpyvCaJw2+9ZYgHs/Mr4Ssg9ZzOEvUlSDSsNhOiKGFhP89jZKv?=
 =?us-ascii?Q?UfKlFQahK5kekOv68r0XHUXI+8xW1ItC6mku1Kr8xOw5yukieGNmwyhlX2UW?=
 =?us-ascii?Q?mdGppc2/AKcScu834AgZH1w8dTt+cKsQka/grpcQaRB0+sQkjEpvAylz7Qqo?=
 =?us-ascii?Q?laMOspj5yMAeYoDtBC5y5MvIqQE2OuktzTKdA2m+dUzJgbGnz8Mex/ogQemc?=
 =?us-ascii?Q?4kvdUNABHD4vUnsoiO/9TvxiOsWUsFkhGdac1Dtr4l54XQB0iMFQ07aLJDfR?=
 =?us-ascii?Q?lEb8Z1bN3sEfsjc10LNhSYRvxChBM2zJv37DpyGq6aqcVNjB6hUIv28VQJ6s?=
 =?us-ascii?Q?RlTKrzKhCfcmButdTHyCgawuVIw1vEumjfQyS0x7gKYv7Go3dj2IVa9ma2I6?=
 =?us-ascii?Q?Dhe3MDupXFeC7mJbIT56SJtHiwdF/jnm16yJ2nx4ze6Ris9bhFjfFqY7tJIL?=
 =?us-ascii?Q?shfm8qy5bJjmi9y24t2jvSTbzBKK5IzdWdKbQfKirO7RVdU1Ij+Hv+TwAPTQ?=
 =?us-ascii?Q?nzk8hPsvXgwgKMu5VDcKoqEixnNJDlICO/pMZ6o4XcqfhaNOtzoYmE7q7bWX?=
 =?us-ascii?Q?yGSf5AOU+kp+nUfojD2im6RwOJ/mrpbgLA8oL8VFWHyNtqagfcf2vkHIOTD6?=
 =?us-ascii?Q?9MHAygKoUzBUFzV8HEn2W7UJfaZDd3SZf5ZVOBmC29DMvHFGLGse4HHORPLw?=
 =?us-ascii?Q?lup/5pxfB4dCQzuNtPOAKi9aOolQkuX0uZXAFCHdRRPbIHu4qUQNhSwtqzft?=
 =?us-ascii?Q?Z1wR2X8GmwP1oZQ79qoCOKkcFT8lEpXIv8/vkPnLBV4bs2UPphQFb4tDmgBV?=
 =?us-ascii?Q?wV8Ri+ZkfLWa6rlJMwARkD7ViiZZvHtVLbdZIA0URmz1z4Rd/zvqOn/UFrFU?=
 =?us-ascii?Q?2BvQE6tXLkzWnEEek0bAY7cVQH8L6+9SRmVFbqft36ZZbWsFFYnluPP5GV0T?=
 =?us-ascii?Q?G/92g/qR181Ce09SZ74MRyu02jCbVBRhQa0tYk5+VztVRk6SuzPZVRA3qu5b?=
 =?us-ascii?Q?q3T1ypQ8mGP5CBADvIBOk/w3fw4pX0VEO8yUUeQis8d1iGz0WYPoExjFU8q4?=
 =?us-ascii?Q?IXAIylaBl8fRp1L7oGxRcqdGb31AE6g1vJsnRZRmGb50z2ck8tHS4aGDr5AO?=
 =?us-ascii?Q?QHTE7pGX4FNa06Qps9WPaGiR1dZR1+9w9Je47NspLIomZwQyaXWTzRW+iLDl?=
 =?us-ascii?Q?qfw2sxyWbNopHMw4EqDli5AT2c4SvMScZuN5fyO36xbCQT9tUYKrGr7RQFkL?=
 =?us-ascii?Q?r9mb9djNjQK6KXVElkuPzSxgMkcHWnp9yU4tNEDi2jTiv8/8SNzSL0pNimkY?=
 =?us-ascii?Q?QsFBlXz4zLgMDJcZj3SP12L0XJN+BgcVFw1bZxwemoIzZ679qkb3QJwmLPl5?=
 =?us-ascii?Q?f5Do1Te6VN7kUBhIGgKo3tiMotk4//xSXSiftuuRA0XJzCCL9UtCCaRJcc6/?=
 =?us-ascii?Q?9Ji1yljT27Vn41sqoTbGJvW//USNrwU=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2af55dc9-96e7-48ab-e355-08df130b9d4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 09:27:51.4363
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lBmBoFk5GlBh6Nd11etGGOyUCYuNrMD+b+KcLjnI6wdi3BACCCJwVEFdGCBrBWx+b+knLaEocpajVw1KpeIPdJe0PRzSfM16nBtzDrwivBo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14443

Hi Joseph,

>=20
> Hi
>=20
> On Tue, Sep 08, 2026 at 04:43:05PM +0000, Ovidiu Panait wrote:
> > The ESVL and DOVLTC bits control S-VLAN tag processing and have
> > nothing to do with the double VLAN feature, which only provides a way
> > to process an additional inner VLAN tag. However, the driver code
> > that handles them always refers to "double VLAN", which is unrelated
> > and makes the implementation confusing. The driver does not use any
> > of the inner VLAN tag features, and the networking core does not
> > support offloads for the inner tag anyway.
> >
> > To simplify the logic and to reduce the confusion regarding S-Tag vs
> > double VLAN handling, drop the is_double logic and add a hw_svlan_en
> > flag that is set when S-Tag hardware handling is enabled.
>=20
> I believe I suggested to just change the "double" word to "svlan", and
> not to drop the respective logic completely. The number of S-VLAN tags
> added/removed must be still counted, otherwise any subsequent VLAN
> S-Tag removal will disable S-VLAN processing even if there are S-Tags
> left added.
>=20

While working on this I realized we don't actually need to toggle the
S-VLAN bits on/off whenever a S-VLAN tag is added/removed. We can just
keep them always set as long as the NETIF_F_HW_VLAN_STAG_RX or
NETIF_F_HW_VLAN_STAG_FILTER features are advertised.

This simplified the S-VLAN logic quite a bit, by getting rid of the countin=
g.

Ovidiu

> -Joseph
>=20
> >

