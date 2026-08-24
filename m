Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011049.outbound.protection.outlook.com [52.101.125.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB078395DBF;
	Mon, 24 Aug 2026 11:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572222; cv=fail; b=FdBoxqrMd5MJyHBnJMWEaH9Lpi7H8mqsOnS+XFoNFXOL5ZQHC3a69eLqRkHSpqSyOVskhVAvFdeoxCnsTk75A5oa0X2ThwxbjMHv2VHes4X/F4c9wXclXr5uaqk5HifqL/w+Ezi5s55/ZkIdCfFHXV4oXzCNMO7c95kwLe6669I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572222; c=relaxed/simple;
	bh=bhmf/UOTso3DUzYoMHFUrxJJD2lvTla2M6rXr3NOrAQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QonW7SJ60qZXvHvCOE9X7L42UkAFEW1OhXOQQv0Ps97LZViItZQkkG/4W6O7xwWYfxkvwjXK7zs3VFWYajNXXuhn0pw4yjhOn2g6gVNLoJ2i+SWXdGLFZlK+QO7dk2M56izDVRlJ6iUrRsXmBxwuwf9MLMRwGOFGeDHaTXTr6qA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CNPnk+Mm; arc=fail smtp.client-ip=52.101.125.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CNPnk+Mm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TrdyYW2/aZ84A6XNhYp1yGKKRW7T909oVLyDuj7KRE5ljFGy7dyy+5nA9IwQveQywQSy9Gzz3nP6XmKTg7XV9H+eN34AgLfj+T8jA9tjX2ODJOAgv5fx8iKPLD30wQux4ceJvRRdKbNNtVdpARhaLFyP6adl+KlJTyayzKGlhn8Hwpe0UCOUMAbiFE9id+208iXpw5PAgn0JCrRa7feXbrDhfE7FrUOW8im5tN+WA2nhu2dPZ7U3fuUcuPkqTpgkCZQH8y+b3NoY50aJ5s2ucV2BK/9DpGTQ1QSXyDHTS99qP1QrrMDVpWQtE+VNOj0Z2C4D0+gC+e2BNduGcABMAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0wvVMSXAs4RzDkmoBAf3nxuPr3ji9akDJusK5Pi61Vo=;
 b=SaJrRxvOrcYYBr3k3yVD3fafswGsVDhA8LLFDxus13etMgJdlsxVV8ZwFYMMqht6SUT8kYYdHpYFXotZvdnZrWBMKZqjuJpWhSf3M32CLNrGiuSGfXagyWDZ8LNZF0/TGyTTT37W9Qfg2GGJHb5WD8ZMswuNvVWdJYWwIExy6B5tKF7RIrAkoEQ6Q5exrixJXLZGOE6/vNyt6NnxcTEM3LuR2/bdJyVmo7r7ppoM8I3/y1vsGzAldNv/3odgc/EACYTH4KhlU4dgh6NqPoeD4RS7nVLUqS5144KQWT8tp2TXtgy4sQGCMnrbsqiA8MRRRwsRn6JQOGgojQt9yYpl4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0wvVMSXAs4RzDkmoBAf3nxuPr3ji9akDJusK5Pi61Vo=;
 b=CNPnk+Mmh3KhX7NfGbXPYAaPhwP7Y28kmmMXV/bOz0uwFJ2qeTSxm29AOiFrDBAZomAOwrYygSH9bqmcrpM434IA9Vw9ezMEF5IjOP6j+qvU2qJqLYjSEHOT3nfSURSDaViYI0M8hFsY9fexiXnjKNscVGp4xVdoomQL2gjmlWM=
Received: from OSCPR01MB12769.jpnprd01.prod.outlook.com (2603:1096:604:33c::9)
 by TYWPR01MB11542.jpnprd01.prod.outlook.com (2603:1096:400:400::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 11:50:17 +0000
Received: from OSCPR01MB12769.jpnprd01.prod.outlook.com
 ([fe80::aa72:ef1b:2a85:fc2f]) by OSCPR01MB12769.jpnprd01.prod.outlook.com
 ([fe80::aa72:ef1b:2a85:fc2f%4]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 11:50:12 +0000
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: Andrew Lunn <andrew@lunn.ch>
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
Subject: RE: [PATCH net v2 6/6] selftests: drv-net: Add VLAN test
Thread-Topic: [PATCH net v2 6/6] selftests: drv-net: Add VLAN test
Thread-Index: AQHdMZADgRLmEQzLn0qD+IRkGYldyraqwt4AgAJVr/A=
Date: Mon, 24 Aug 2026 11:50:12 +0000
Message-ID:
 <OSCPR01MB12769466CF2256ACC6FCCCDD4D3A02@OSCPR01MB12769.jpnprd01.prod.outlook.com>
References: <20260821170959.79708-1-ovidiu.panait.rb@renesas.com>
 <20260821170959.79708-7-ovidiu.panait.rb@renesas.com>
 <d614d8de-0da2-4673-bd11-02497d8a37e0@lunn.ch>
In-Reply-To: <d614d8de-0da2-4673-bd11-02497d8a37e0@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSCPR01MB12769:EE_|TYWPR01MB11542:EE_
x-ms-office365-filtering-correlation-id: e0f73f51-2ec8-47c6-e60c-08df01d5dacf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|38070700021|6133799003|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 LSuIVAz8fojjiUH7TVy6L6oJnGtR8QR9avtjufQ4eTJ8IJHJxRzgM7PPP81F7rXm9qOBM56amaX1yign4WOTrfKNYRVRXjJAYh7MRjYrrZggNGfbY5Scm9YEa//bIVkWBdfCRYD82dPvxPwqVOd536CXHybkG75olx1TebDRq8yxF4pvG0nOnJ3TtTjdHr1wyLyY1O1uicH2575uURqTrY4N239W+KrvC4RG3tCbVBf2zMWbmC4LBe3n1+WW72TJJEp19TE6pj52OPUiuo3CYWPX5dzKjZi078+6gocd0M7XF1l0wSyRCCUr0o9s65ggXsYi5PVID6koM0nIEw6u/0h2hvUb+1VqIhXNwid26OpcILT1NkzMwsaoi04Ku9okWmqq634iv32AuaDL64OA5Tg4eaDt7cN0Vv+PAToV8xs3BeTsTTIwMKDRr6Ops/Fj2AthGqMi9P2+264ISIVGbM8EXsQvFKwbRT6kv2XLbGm29mog2SzLcK9UoF9UXXCr2M+BzZqFtMbB+OwMOuaIFNYjcBXI6vbzz5oazUgWjzalSrD6FzPF2pNn1k9rAG0aNLdRrAuT1CS36r3CQsByykuBvFjbi/Gwtn50rbxJhceGiRWPk+817WpEBnj2M5x7AZ7q1BGa6Mn95pGuFraY1hCJ6sumR5+/Ro0+N8Z97eBGvv8LqQYQeNN/eyt0A4egy3045qp+qtiP6M4J3CXl8YCkvls5pzTIowLqanIdrNo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSCPR01MB12769.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(38070700021)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?CBWF4ewk7oU5itcSMbYvaXu3nRrDX2FkY2DuTX3nGpo5EBZmea4oQVB2n2QE?=
 =?us-ascii?Q?pwZT2udBn+SZS6zPXagb8mMXG+UODZakJ0fkNkvawtTQnE8tmfbtKhLD3q+o?=
 =?us-ascii?Q?o1d+6T3DpOdI5p5pu5LgP9eHKxU1sz0UD/tBZi/iFbJ1BkTay9z7T6atprVx?=
 =?us-ascii?Q?qIkZQ40237YaQGg3gztLe3eWLegBs0twshGHr0WkM09XNKcculNHCAsLKNAg?=
 =?us-ascii?Q?7VEdXpdE8lX1C9cReFFsnDTONkeom8zKj4NQ7ubUpbj7LgHo8JChbKfMdaBl?=
 =?us-ascii?Q?SGfQXIMuHy7MA9sKfYPzu4OwWQoAMY1vgpsDI3E8gBb72O4Jp/drWvadvkFR?=
 =?us-ascii?Q?T6F8XtlNoDS8AQg68j8aMbXKHoUxDswgFOuyasz9SiQHwHdNU1Ze1cbvcfbZ?=
 =?us-ascii?Q?tieFmhDTobz5mj0EW+R3AM2UBlNjaaF0fNExfwGOEXJOxwyrTw6mtJKzdQ/V?=
 =?us-ascii?Q?3afki2TIQHlm3WiUV+AzmTSXjkQZOoYQ0N8Ldioxm1rr8Hbup2iKKMv1ut8/?=
 =?us-ascii?Q?z0IBTz8gsWZugnI5vWH1aeh0TPAyHMTek76b3hRrqIHgDR8uzvcLo2JNKD6t?=
 =?us-ascii?Q?C3hu+Xi8bf1z9jAiCOkX8jUASzyjX3RA64j9T+mqYS7qk1kE60f4bsmUNOsG?=
 =?us-ascii?Q?eZn11DtT6VY2dSwaSc9sl/ulBEnkbbNFEwICgaKER/sP0NgmelqDlNJ3OJE0?=
 =?us-ascii?Q?mYCA4aXsvH5y/C7EQWmabjvczzgQNpI90JX/BPSFsWday4U3KXLjZ3SLTy/q?=
 =?us-ascii?Q?kTiwsiXGQcGttMfiY9Br7tDdDa2i0GJh1wPFsRI5wSsZq/FRxyiYWi5qns42?=
 =?us-ascii?Q?Xtj+5kioVY4ljgkB/L+fWQe0er03K29sXU+ODa6vHCKJx82zLVfZA4zvP6SY?=
 =?us-ascii?Q?eyTaKMdodvC88wYAaES7VpyoQxQWMW7F926+kyZbnPRiMJfjP1qdm2h/hwFU?=
 =?us-ascii?Q?f08Qo4VV6koglBQMwlfglJfT9IvnFSVBpDoNZt29f6X8P6UVHx45lfyP4D/C?=
 =?us-ascii?Q?oAgyLonJuUyBFkTCr15hwW1eH+RVrKRiZQlNeHmQcLd8j9NPlJn7fhz1LYiA?=
 =?us-ascii?Q?m1MIgoj7lx5K1nzg+IvBW7UqxGSvcAC4V5pB+/HZU8QYcLGjC6bqjJN1WNNb?=
 =?us-ascii?Q?2t+ZRs5Aesi5RvAUovQK1aUAypokNeHidnGhTVcTWcXomcZetUb5c/NiEyFO?=
 =?us-ascii?Q?cx0aQ0Cb4RcoyJYPMuVT168uW03tugGQi5sAqcFKq5TMkQh+uvRV9nFTq8VV?=
 =?us-ascii?Q?YFBcDpcmUjf/hMm6oA+0YmBHlV88CNonk0Az8H90Ih5xXI8xNMTnYe0KLRsq?=
 =?us-ascii?Q?sAk97XllAgotG+uLgEX1WDrrULSfh5omF6oc/ypvDxFjKFL427Z30U2LtNTS?=
 =?us-ascii?Q?4I8i24LZi4/M/Em2qidpfHErCkWfx1D34wzROZg8dnXDm0NvZfZLZuCvw2dB?=
 =?us-ascii?Q?tQWBnhXV5Q+YtExWqLK2sniOZg6e18AwHyC0zBtjbeX+4pkXFobuiZkpBbiL?=
 =?us-ascii?Q?LGkYVyfyugXZ/AdKPNG8gqobhyrQAcJoIXmGc9FkfUj3ZJAdBxYxu7zKtwl2?=
 =?us-ascii?Q?Y63TxT3Q/RosFMxBCGgriNbNrBUQAA95PYN64tPJU0INUMEt5InhhMedyee7?=
 =?us-ascii?Q?lQ9d0t5iypVK+EZbJG9L+pPoOX9KeCUKRwcvgYRVwOlHrGkmGFny2AURqeRe?=
 =?us-ascii?Q?YnmsMt/v09w/zN3+OrKik8u222g7xhiBNPAN9Ipww/jhXg51idoMwfriMITU?=
 =?us-ascii?Q?dgcO16tYm3O9RZmYBSPb0QoQVyn+Mdc=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e0f73f51-2ec8-47c6-e60c-08df01d5dacf
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2026 11:50:12.0538
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4k/feKJq+N7DI1Tj12e3Elelnc1Y/ehmGc6ixgh03R/IXNwPqVZxa+C0aZMyYRXAmH2dMfp+wBJCLXLSJZzndvZk+VCcButnhFO95/Zi8Ls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11542

Hi Andrew,

>=20
> On Fri, Aug 21, 2026 at 05:09:59PM +0000, Ovidiu Panait wrote:
> > Add a test that validates ping traffic over VLAN interfaces. It aims
> > to catch drivers which mishandle hardware VLAN tag stripping, in
> > particular QinQ.
> >
> > Three VLAN configurations are covered, each with hardware VLAN strippin=
g
> > enabled and disabled:
> > - a single 802.1q VLAN interface
> > - a single 802.1ad VLAN interface
> > - an 802.1q VLAN stacked on top of an 802.1ad interface
> >
> > NETIF=3Dend1 LOCAL_V4=3D172.16.0.2 REMOTE_V4=3D172.16.0.3 \
> > REMOTE_TYPE=3Dssh REMOTE_ARGS=3Droot@172.16.0.3 \
> > run_kselftest.sh -t drivers/net:vlan.py
> >   TAP version 13
> >   1..1
> >   # timeout set to 360
> >   # selftests: drivers/net: vlan.py
> >   # # Interface: end0, driver: st_gmac
> >   # TAP version 13
> >   # 1..6
> >   # ok 1 vlan.test.8021q_hw
> >   # ok 2 vlan.test.8021q_sw
> >   # ok 3 vlan.test.8021ad_hw
> >   # ok 4 vlan.test.8021ad_sw
> >   # ok 5 vlan.test.qinq_hw
> >   # ok 6 vlan.test.qinq_sw
> >   # # Totals: pass:6 fail:0 xfail:0 xpass:0 skip:0 error:0
>=20
> > +def _setup(cfg, outer_proto, inner_proto, hw_strip):
> > +    """Configure VLAN stripping and create the VLAN interfaces."""
> > +
> > +    feat =3D ethtool(f"-k {cfg.ifname}", json=3DTrue)[0]
> > +    set_ethtool_feat(cfg.ifname, feat, {"rx-vlan-offload": hw_strip})
>=20
>=20
> +        if current[name]["active"] !=3D state:
> +            no_change =3D False
> +            if current[name]["fixed"]:
> +                raise KsftXfailEx(f"Device does not support {name}")
>=20
> I'm not too familiar with the self test framework, so i could have
> this wrong.
>=20
> It looks to me like you fail the text if it is fixed. But does not
> fixed just mean the hardware does not support it? So i think it should
> actually skip the test?
>=20

I compared the XFAIL vs SKIP usage when a certain hw feature is not
supported and it seems that most tests use SKIP (tso.py, gro_hw.py,
hds.py, ntuple.py, etc). I will switch to SKIP in v3, which should also
allow for some reduction in code duplication across tests.

Ovidiu

> Now, if it does not say fixed, but ethtool -K reports EOPNOTSUPP, that
> would be an error.
>=20
> Having said that, thanks for spending the time to add a test. We need
> more tests like this.
>=20
>      Andrew
