Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.1.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793199130;
	b=knJT8l+0/aGY90yxvhiPivVucHFJKdrXZP339mONGs7WkjG1zWkFEDCbZYgEuBR1ERjU
	 3/qZGdLWuPAlRLPp6poWj3TiiBISVxipUWF1tSX/OiuEovLKU7ehHvdR++S2LOlRED8WY
	 e/CTgCGWwKTX0DvpRfkEOThuABUtcxxsSvOwY26yog+bFfFQCgRK7VuGxXKtvG2lZfYo8
	 Vq+juabvy4Y7Xd5BbvvgxPi+6fBDnY57u2n6SjoSz6WhPqgBj0JeSS+fUeLI8Nk1G9eOG
	 6xHw6qbXtmS1EoPGy0DbnHfx7KmVt+bJFy9QOQTrHL8LS2n+lAx1uZfVYhLia9K8DmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199130;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-CrossTenant-rms-persistedconsumerorg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=JegYKsCuUo9CsvsD6bNpxDO1/tKR0vUcbbg2Kff3eCU=;
	b=RLSfH/5+GgK4zJa1CbQMPN94N/CmeMVaiJ5vCQFLs2t5/Prl27orUUCLjo8S7Ncx7z62
	 2m50hc2jnN25DVciEUSsAUNVunty7rnm+G2M4BPUGOUF4iTKlISrK1+/Pl/JjSnKU37Ct
	 rFG4CQG+V3adiKXcG2NNy/0pJ32yoktg4vEui7k4xGBDImBt+AhCudVCINwCTq4bflvBG
	 AHRbw51e792u3Sl8RQVAQRcqS1WgAKFBwZpgmweunXg1mlvetGoanZzcV/Fq0l8ZcCgJu
	 o/VX6GvucuwuuxPPLlgTTax2VPjpG81ntnU6CQt7+0O4IYOEc6pqPk6p8hhqqAWNGng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=ngS3hssM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.1.7
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazolkn19011007.outbound.protection.outlook.com [52.103.1.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACDA606A31A;
	Wed, 28 Oct 2026 14:52:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EACDA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=ngS3hssM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JHikXUGZ/C5dABZs3kBeA38u+PnrW2D7ftD+e1M6ziqHENckcPJU3Wfi1Gep1xWDvn6J1n1+wi8CHPDEs/kPuvtZfqj0+gARsBp4nALPtb2EZ2tHreggfNLtb/JIuqzYNUn/7n7opL/SoXJsz0WrB1b5X0yLIjUQM+upz/LFd78imxh0JK8HTy8nXkgs1wU8cVId9oMnyoUTHjcqBKjq4aYQYWHkxx70j0VsU49Q45Ud3bdgS3Pct4RThz34epOs+8Sfm1vCVIilvWWka8FCnW8rdwY9ElueLiMu+RYGHzDc++3lcCVOHdf8ZUocgI1c+JrGQA2xEeSpN4OsyQt3Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=JegYKsCuUo9CsvsD6bNpxDO1/tKR0vUcbbg2Kff3eCU=;
 b=a0aZct7UEYiekl1kGHeiRrOuuGCX2xXVr7LlOieCnyWcRs9qio1FuA9UiNQrxeMmR0Mc4iMz8DJioqqhXzIzQhyilXqJxWd2PfPR2ML+QBoENYix0tZKT3Ch9mo5fkCao1N0iS9CEtMGJhb7eIs588Hq85QDPPhrb4CvzwrMsugUrW4fO1NP546otumi/zhMVbBfEbCwciejc8w6mY9Y2eb5Gsod9hEP3ldHgH6bvdNz4a00gc1+1UZYmJIXhxYgCIx3xmFUWtgcTzH1bKh1Gfff+ZnvrDDETyFbIvx80QAKtC7NFMGN5p8nj63baaQgSnOotr+MvO4H4JQURRsrjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JegYKsCuUo9CsvsD6bNpxDO1/tKR0vUcbbg2Kff3eCU=;
 b=ngS3hssMkuLJWoIZaoOkSaFFnLrmdX2LihN19Rxjmmv6gjsNbSER+cZ5cCifTfEJVPgjiXQtQPFEdkWKG8uFXb5sjFEciRnRxfiIpbaPA5ZbvaB9Koc+GdUpCNyUxEUrnFW4Lvak8KyZJYgu7j3f99RmJROPQvXObftZiZKjbNsxQ0yeCc77Aai2ZoxV7Zrp0CdwoCs7QUWJ+mYNGUMw1w+HWjZV8HSqQBOhtpIej9S90vXlSOG7iO8UYC0FpfgJVo092VAxx4X3aByc+EdxQedQnGbvhiiAr6+GRvce3xunY+fy7lnv78WZTJ3LsyvbXTpL6ehFUmmf/cELwOc/XA==
Received: from SA3PR05MB10385.namprd05.prod.outlook.com
 (2603:10b6:806:39d::17) by CH3PR05MB10278.namprd05.prod.outlook.com
 (2603:10b6:610:15b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 14:52:07 +0000
Received: from SA3PR05MB10385.namprd05.prod.outlook.com
 ([fe80::e22f:a0f5:fcb0:9b0d]) by SA3PR05MB10385.namprd05.prod.outlook.com
 ([fe80::e22f:a0f5:fcb0:9b0d%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 14:52:07 +0000
From: Yingjie Wang <x-professor@outlook.com>
To: "netdev@vger.kernel.org" <netdev@vger.kernel.org>
CC: Yingjie Wang <x-professor@outlook.com>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@kernel.org" <edumazet@kernel.org>,
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"horms@kernel.org" <horms@kernel.org>, "shuah@kernel.org" <shuah@kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH net 0/2] net: preserve rps_default_mask on failed writes
Thread-Topic: [PATCH net 0/2] net: preserve rps_default_mask on failed writes
Thread-Index: AQHdZuvmhzLwMDZPgE6Wb+0ypBAEAg==
Date: Wed, 28 Oct 2026 14:52:06 +0000
Message-ID: <cover.1793199118.git.x-professor@outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR05MB10385:EE_|CH3PR05MB10278:EE_
x-ms-office365-filtering-correlation-id: 53b02d89-9a09-44a6-1d13-08df35030985
x-microsoft-antispam:
 BCL:0;ARA:14566002|31061999003|12121999013|25010399006|4140399003|38102599003|24021099003|39105399006|24121999003|22091999003|15080799012|8060799015|19110799012|8062599012|40105399003|18071099003|26121999007|102099032|440099028|3412199025|1710799026;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?UK8aZHH8PVHLz2WxaXtZhknrAlDAn2HVJnkKw+5T2xauAActWAI+RrsfRY?=
 =?iso-8859-1?Q?57hOOQjEN2CpUepWA3tinWGDntuyywLst7ghNS91FRL6rP2Vo18oZF0SQA?=
 =?iso-8859-1?Q?YhFgu+L+EWAXHbjoXZA6ilOKg25VXNJWmQHDqPRN1wadZMcm6B/ez053PL?=
 =?iso-8859-1?Q?mvFX484Z7nOwhCTAm0RhSPuiKpqEAZLL4jBE5RuIbvBAxtYi0bPNgCbX+p?=
 =?iso-8859-1?Q?TMagyYe2WCUZhk0PHw/P/4yJuTbOg8p9LL2L7USXwsesBWvpsx+0q4u9hq?=
 =?iso-8859-1?Q?hmroIShTV8nwRNzKiyijvIjxT/VkTeJkhcaHQf0u2JftkZNOmwPYnM+eqA?=
 =?iso-8859-1?Q?562jF9voY7BDmei7XgM33uOGnCpxvZpNNhDlEYJ9hflcWcKDWV5ShO5TGB?=
 =?iso-8859-1?Q?rJ3ZMEKd+cOwxFXtaiarQhhDXPqtZAaPk5NgCzRWQf0Bns0Hu7qwh4Zb1P?=
 =?iso-8859-1?Q?uAP9FuGHdqmeZl5VgUnNZXm94P3CKfEWv74JVr8f2C0dvfR4zANJ9/XV+Q?=
 =?iso-8859-1?Q?Y22IRkhxCnQKNPSxH5B/DSOkC/1cZ+Ojk+sRlx9DCHyCEv+mY5m2Tw1ZIa?=
 =?iso-8859-1?Q?+dW6p7Vk4pGPI8vesBpenxkl6v1fN8aPvyG42cvyiSnL/qfPZFQQ1sS9QA?=
 =?iso-8859-1?Q?y9QuKlOlHkYCdB/adhpLR2Tr0ujRJ2hTktY1ignUJqV/XauZrkjAgk4Ekh?=
 =?iso-8859-1?Q?wbp5gGiX8tyd9TWre3J05/W0+DUx5Y6IMcp+vV6yj6X3E0JR3n9aFJ7ye6?=
 =?iso-8859-1?Q?YYXXTG1xhQ/84/L0vHBiak6SKfC0isxIO/snYRHwgSLAOAukC5XnlU+JGP?=
 =?iso-8859-1?Q?lPS1wedykc++NMDNXpsVr90AEhKdPnRDBnuBfjGVfldfzG9koLGgBGiegW?=
 =?iso-8859-1?Q?EwOEFuFR31MzJbxJowcCIIAIkaTVvIPopkx5Y33Mkh+3R4zQqfnJOiPOnm?=
 =?iso-8859-1?Q?zerdQ0JhNmsSv7aE+bfwXwpN6yPx9T+CXIQFpcij3sSPS5yCURI4gJ3ULy?=
 =?iso-8859-1?Q?t5awERH61VpiLZ1EryADfs4MTn2eKLHfUKzS3VhpBPcSO6BEDh1dN2n6P+?=
 =?iso-8859-1?Q?XnhwVHYM8tzz7vrIGOXI+g8YS/GV2wCO4M8W1huktJMcY4ukuLVOW4VgNu?=
 =?iso-8859-1?Q?Q5h0eZvVViN97qPFN/3Prpfei0AI2KfY5ixyAgE8mCkJzqqX1QACEhdVhe?=
 =?iso-8859-1?Q?dGOSSYcuCs6xQA=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?GohChezOWlVhp3T7oy0O5PD81E6oRuVOwCx28+6J5RyKIx1zmys+RMg2qw?=
 =?iso-8859-1?Q?8ikxzzAWqOOwSeD8rgApRddawf3bAVebXkp2zb7KoHfzOOX6wL1c0EoX8w?=
 =?iso-8859-1?Q?e1MLHwQLIYLvdyQo/aHvJ46iKPuyZWFyr8cqvVdKSBgyMpIU3GOqulgXPl?=
 =?iso-8859-1?Q?yLbYZdslxQw9A7ci3kj+yoSWbOjLUs8Q2N5nj2YYoXWPZ13UV6pwBz/BD8?=
 =?iso-8859-1?Q?mWtsOS6UsRwB7hEOevumRKuJXqBB9K1JGJAZMJuit7bVvajGii1PuYhx9h?=
 =?iso-8859-1?Q?hzipMcgP2ExlnnJly3DdUxVAYhWxHgjIdySKH1yuj73cjNefF4m92a/32j?=
 =?iso-8859-1?Q?1HooVB3dQ6OSPJMRn1KIAJtEWMO8TFEfq+vlYAqdNe7cHfdp7aZZBKPvlm?=
 =?iso-8859-1?Q?mBeMdhQ72ZoWjwUVX0XwiAA01uyflcQSfnspgJakN+m29jwixhHl1baYsO?=
 =?iso-8859-1?Q?E+2OjjxbncqUnmO7x09WAePUD+xjfmZqeHzeAKRVP2XdExBmeXCP6ZaEbp?=
 =?iso-8859-1?Q?2EL92JVRtXiSAR2oVhX00Rst0BO4Af8CG8GaFwwK0EP2lWAm8qVA5dnSvN?=
 =?iso-8859-1?Q?TcURMnWBQiYhKnLKRo5Gi1KSjSulxy0LCKcE28Ls2oEZjn8sevviLUknGv?=
 =?iso-8859-1?Q?U63hcyd9qI5OVrynXXhm8PgtB8V0UHD31BdT456OzSUpAhkpfeRDlerfNa?=
 =?iso-8859-1?Q?VxcKkgvYAKF8u5Sls+/GBHJLAqiv13gET8SgIGKjWm0Fw9fwnRvSdSGB/q?=
 =?iso-8859-1?Q?Hk8g97lNmfJsWNcxYhQfIph4QFeW1qTTn4YxkRpACkIIY525X98P6LI8zQ?=
 =?iso-8859-1?Q?hBc8x5kAsr3kr+pZMvfpVY+L0zQ7lBbv+K5SiYR5rBtj8ciNf79+N5y/p5?=
 =?iso-8859-1?Q?mmtV72PUOiKodVFUx8XgtvF/9MA4sbCQXROFL5okW3+M0zjkIJo3calBDC?=
 =?iso-8859-1?Q?Juy+JuGSN08p2/ki7cmwQftrSL4Ysy6eXpm3bzWGld+P/I5tTSGXAvWIyG?=
 =?iso-8859-1?Q?DrWHXIsucpFOqrOQiXoSPM4NEViitPiGsrlVIVmwcaqaE+IwCp3jWccLjG?=
 =?iso-8859-1?Q?Auxr5j+65n+obsdG/jaqeyxYVGycxvSeRGWx+NQNpPjFa2HzzGSdmJGS8w?=
 =?iso-8859-1?Q?g/rKZU9B92YU+kko3U7nnkij7dIgK89QJVGgNNoTDdpSmlFc+nwGq88BHV?=
 =?iso-8859-1?Q?sgf8DbnZjNGF2mq0+nSLvbG9GFtm8GTIMTTaLz7t2uNe7wkGUernBE1O0/?=
 =?iso-8859-1?Q?fntdYKLoYsdLKUW4Ye/HOjZfeqUCkILx+hCvtK2MGyutT8IyVt5Fmntwoe?=
 =?iso-8859-1?Q?Flrez63T2SfRM8oaWe7ETZNAFXQSOoUSj+3NFQXv4gdJykze8n4BGDHZzz?=
 =?iso-8859-1?Q?d5qgX8o/PX8l337Sewqs3n9odECbWqVzqHO5X1O/reSThLAlljtvfA3J51?=
 =?iso-8859-1?Q?nB2s2B/iL2DQUsaS?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR05MB10385.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 53b02d89-9a09-44a6-1d13-08df35030985
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2026 14:52:06.9729
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR05MB10278

rps_default_mask_sysctl() parses and validates writes in the live=0A=
per-netns mask. Both the bitmap parser and housekeeping validation can=0A=
modify that mask before returning an error, so a failed write can change=0A=
the default applied to RX queues created later.=0A=
=0A=
Parse and validate a temporary mask before publishing it, and add a=0A=
regression test for a partially parsed invalid value.=0A=
=0A=
On the base kernel, the new test fails because the mask changes from 1=0A=
to 3. With the fix, all ten rps_default_mask selftests pass. Tests with=0A=
isolated CPUs also confirm that overflow and housekeeping failures leave=0A=
the mask unchanged, while valid writes continue to work.=0A=
=0A=
Yingjie Wang (2):=0A=
  net: preserve rps_default_mask on failed writes=0A=
  selftests: net: check failed rps_default_mask writes=0A=
=0A=
 net/core/sysctl_net_core.c                    | 23 +++++++++++--------=0A=
 .../testing/selftests/net/rps_default_mask.sh | 23 +++++++++++++++++++=0A=
 2 files changed, 36 insertions(+), 10 deletions(-)=0A=
=0A=
=0A=
base-commit: 94cea342e8915812b45f93c56e134041c7fdb4d7=0A=
-- =0A=
2.43.0=0A=
=0A=
