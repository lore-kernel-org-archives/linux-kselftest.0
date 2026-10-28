Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.1.0
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793199132;
	b=WoOTvZti6HTgKpMVolO2oZ4Ms3iEOxqoWITD9KuKxL7ej31m2Rq0J9Pd4sRStXWq4Sdp
	 KhYcWJXx5G7Slna9Y4T84Rd8jyQ/J34C/9u74Tzw6WPj2mR2s1BNqmiRZQDuC9CZkJZex
	 uYam1C7db77LtNncbuu/ESLs4JgS02CwD6M2o9CtD2HmnMeeOQDuJ5NTAJKGxwdwpB9qa
	 pQFL3ihaQ/olQyxwdPjUsqn+qsGNAd68wk4xyFdg3NAkj/k0bG3R0mDHMmIrYDtkPW6Zm
	 B8jS2784ktNPwxGqcNRZ0rhd3QIJk7KHSDdg3Dcnp70i8E+3LDFGfAvrpUJRnrNSKyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199132;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
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
	bh=v2ZCjfWiao1HzCX/ed44UphydcT5U8UM11zkpUGhWbI=;
	b=OfN8nRy73ntqBfCVfNfB1KkjvUbxT0eudLHafzaP19QbxDzfGj1ZvFAZ9SCEwL3Tc/SC
	 XJElWt0s9CVA+Mo+FQwsPvu26ZAEeYB0mFIU49Sw+9tPJtgIFO70hBMh/8EfXHrcstMLD
	 nZytkLbxynIRwLLUdzMINRar9DMcX5vo+07Oo/46ZWSCaUr/af0SoMF0cHk7VM8H4GGDf
	 zngv7ii4Wtdb8IPzxJbjhZO2fOdJmjDKfAJtw7jHRlWTjCmuQlRVXw7fon4q+ZTZA04Ov
	 h/n0q1T7cApj7Og4+YrFvheBadE8jdiaK6PGTp0Y/E7R8VkSL6KpFQddy1Vl9S0AbVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=EGxPmHZF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.1.0
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazolkn19011000.outbound.protection.outlook.com [52.103.1.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FE5606A31C;
	Wed, 28 Oct 2026 14:52:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20FE5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=EGxPmHZF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BWXAMrNHfI1GTJ2GQbGMbL+/RCbXO2no7kF+wEYB4CSmi29K2PUkzr0GkSPWkAYd8AD6CZQus17CGmaQEE7rE9U1NjB7NCAGfRjWP/VcibOR1SWzXtgzCMd+iYnh06h3sN1Ep0bDI3/74z8zWTUCzI4wer2lJIG8/b1SKzjOIaA3lBUDw9MJPhPKpjoY9M6ggNgpBK2fi7Mdknq0C8IOxi8vq2DfigHJpQ7uHkh19DY8WGUs2/jLVN6welKUkChz1nGpPvJMSAAHhun8utVeytxP2tTCebDSRQBqrGhA3GD2pbX5G7Gx7cofMihVXrO/pQTrznhi0ceAchpa1900Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=v2ZCjfWiao1HzCX/ed44UphydcT5U8UM11zkpUGhWbI=;
 b=vK1NTlzE5KuL++7bGljZBGSFG79PtHhBjXbtgxugzz/v3Sx+z3gyG7Hs5l4Y59swncuNZhaOY1wzlo41T6QT7fYeeYkdwd0qCELvoDKlFh6WpXtGMBTDHK6464bEBukMZOc+ILbfVJrSAUKTZ8OFuF0mH1QBarQbCl6vONgugQlw24UvLqe6+THTKXdUjcXfo+T7BCN+T1okzDCPA/gvPlV5u7h2xrMbwwpwihz95oZ5I2JXkzXOmHlNFBnsUGASGvDgo48ShXjI5/kcl0S9JFvGSW7tjGkYUCxnzIcp0mrKYxBSqfpRYE7uA3wMneV6D6yI5+BThRKco3BRXro/eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v2ZCjfWiao1HzCX/ed44UphydcT5U8UM11zkpUGhWbI=;
 b=EGxPmHZF2K+UE9/QpnwXZmZP9U02t8p6nvhFxeo/y0SumhmpdLF6IRRW0YrBXPiV7xYpxKfKOqOvYzPm/TsP/zH9L1sjKR321qSY6Cep7kk7gWC1olT0CpWOoxNQmsBWHDaRgv7/8SW9yLiADy3hzcNaasQYbRHNOhgUFOwLHf2CrcBDSHK71Y+IUpZmycMrniQTz9fY+NzphUn5Tf1MMtsYdKZu6YAvdmSjVAfCswwZStRxBp+5VMSp3TXvQ/jmMuE2n7hyRJxFw4aBnL0LQ273BNv1hoYd5vs0/CFU4nQ8KEt3yz6LnSKb63mdCh5Odo6ulnE4sRZ9lIwowRcJCA==
Received: from SA3PR05MB10385.namprd05.prod.outlook.com
 (2603:10b6:806:39d::17) by CH3PR05MB10278.namprd05.prod.outlook.com
 (2603:10b6:610:15b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 14:52:09 +0000
Received: from SA3PR05MB10385.namprd05.prod.outlook.com
 ([fe80::e22f:a0f5:fcb0:9b0d]) by SA3PR05MB10385.namprd05.prod.outlook.com
 ([fe80::e22f:a0f5:fcb0:9b0d%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 14:52:09 +0000
From: Yingjie Wang <x-professor@outlook.com>
To: "netdev@vger.kernel.org" <netdev@vger.kernel.org>
CC: Yingjie Wang <x-professor@outlook.com>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@kernel.org" <edumazet@kernel.org>,
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"horms@kernel.org" <horms@kernel.org>, "shuah@kernel.org" <shuah@kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH net 1/2] net: preserve rps_default_mask on failed writes
Thread-Topic: [PATCH net 1/2] net: preserve rps_default_mask on failed writes
Thread-Index: AQHdZuvoclGgdlF/xEixD5tLdELjjQ==
Date: Wed, 28 Oct 2026 14:52:09 +0000
Message-ID:
 <7fc32d133404c078352f0b8fbcc80a67861bf2c3.1793199118.git.x-professor@outlook.com>
References: <cover.1793199118.git.x-professor@outlook.com>
In-Reply-To: <cover.1793199118.git.x-professor@outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR05MB10385:EE_|CH3PR05MB10278:EE_
x-ms-office365-filtering-correlation-id: 32395860-a2fc-4c31-0da1-08df35030af1
x-microsoft-antispam:
 BCL:0;ARA:14566002|31061999003|25010399006|4140399003|38102599003|24021099003|51005399006|24121999003|22091999003|15080799012|8060799015|19110799012|8062599012|41001999006|40105399003|30101999006|26121999007|102099032|440099028|3412199025|1710799026;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?EYPLyS6JLUbHEbkYGLjUUiTWMJrWDbHy43X9v929U6ED6nlQk40C3DTw5M?=
 =?iso-8859-1?Q?rDlnKL8/6/WXCbBhIa2EOglvgw/cBYsTU41dW0xmEM23f7XlMGLOvHe++q?=
 =?iso-8859-1?Q?Adi2ngb75OkBnfIao7tLCPPrT8rw42PmP4Pwa+HhiawdVCijr5dGG2rcNf?=
 =?iso-8859-1?Q?HNqGxdy/CcP+jMLQulyrE1shmQmhM7dWgTcaNeRJSObGjqW5HoL/3tVJh4?=
 =?iso-8859-1?Q?ucZutpa5KO+XaWCrGtmq5rWw9dzOfKo2OyH+/K9BUIO1ccsyxA0bKRiAzR?=
 =?iso-8859-1?Q?/Wabr3/lDMbOKwPm0ynu7lEhzF3QXCnO5x7lqSsz9QmbzYG8RlY0BIRI0V?=
 =?iso-8859-1?Q?OTUWF7ZbUN05daLmmvhZ39JBxRqBsO5oSkFweViz2SzT+ezLtBzede/CmT?=
 =?iso-8859-1?Q?jHkhxjbS6p00iwqatFTHfLVcjh7DDE7xGiEu5p3dUnP+hfNvNm1ShMh/u6?=
 =?iso-8859-1?Q?266xWVkGttY7XQ9xc5ILRGibL9K39CFL/0SRmfgBZgk9gg19xnoBolGtFA?=
 =?iso-8859-1?Q?mBK1UqrJ0FnE1bP+lrvAyuM5JamMOFuIyUYZjSM4Db2euWUOxmJnlVyNL4?=
 =?iso-8859-1?Q?ysHy2/r06tjZ6cw+zldfVMa95uO0kKbmlC+0NtTSC8OlB9Ah36Hx5K/CYa?=
 =?iso-8859-1?Q?NJ8JSNfAth3b5/pFF1ZBdq5yMynNd1pibnWtATj3TFVYQefASI0x5hvhsJ?=
 =?iso-8859-1?Q?pH+H1KKQ4oB3Rs5xlRAlSdLZtOfshkBF2Kes3ZlnC9dDFREofU+9FkgQq2?=
 =?iso-8859-1?Q?yT7t5wNmUXpAfkNbfiutaztZz4IVBqv25i4bJWBh1mBg/N4dSKGVOM2QJJ?=
 =?iso-8859-1?Q?TXceY3ArxT82lH+sYL4roAUA/XbqGsEqWtQ+Wbgx0AxMzUox4oZCVQmBeZ?=
 =?iso-8859-1?Q?Mm7wRVfHhYnKG87gvUbesIugWu4wPWYnUos49fc8pdpQoTh1DKABLTNqV+?=
 =?iso-8859-1?Q?+gGf3Eq4rWi7+v+ylEWKLA/QoA3P4HkffusW3kg2/CnZuiqQCICwLoTxhx?=
 =?iso-8859-1?Q?VKsp8FUk0X1E7EidQPptZ8yTkClVkjZQ90ucuJiQu+h7HvvgonaF1ZjH7c?=
 =?iso-8859-1?Q?30vOPzRJZkkn+l6XrXAir0/O5IGibUyIhWXuLJouVts6iZbAHH/X6uk1wA?=
 =?iso-8859-1?Q?FEGyvTI2iPk1tMwzRrnveXjfTGKBgrdrejXPxlATNyyiAPV0594+1LBLxK?=
 =?iso-8859-1?Q?Q9E7vcCR02+L+g=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?0J4oWDFoW7hx+lSk2O0y/8OwQY3DjZNgxA6yTOvTdWtip14MfTePpLZqn6?=
 =?iso-8859-1?Q?NDILwDbx/mr5sYeobBB6u7Wem5sMycuVWqXcn4PoQIydS2jLfL87kMtQu2?=
 =?iso-8859-1?Q?sUxaD6cBjARNjS4lbw0Q1FzOMNOJn9MgIM989adhkcZ3C2/pGpxZGaYzXu?=
 =?iso-8859-1?Q?WYG/73c2SxxyNExgTl9Ql08Wma9wA76qZQgJVbD7tVGM6PFW9rPDH4ezVE?=
 =?iso-8859-1?Q?GjYpde4hsU3orMfLR5JX3Y8vkKR4Eg+5ulqGnNqFvzsVrOdnFWTpO+tUBz?=
 =?iso-8859-1?Q?bf3IEzFHfQxYnwR20SBH33EfD9E2jCoztQnTSsIAp96wcktEuIsU7UB3/P?=
 =?iso-8859-1?Q?gERrbhAUvofE1I6+HrQC1/CH+nyEatCNHwGX/Om07tvWU6tgiyE2/DUzI5?=
 =?iso-8859-1?Q?kkKax9nRZ+J8S6dB0fuwg585w6DCNwXYDoQ6tJZwx1zp8iwxFiQ0ZmVf/D?=
 =?iso-8859-1?Q?w6m9YUkbtD2ZniuRpkUMMK8fvxow5RfEeGZnmznOq5eLLfN3wQzKGmgmYq?=
 =?iso-8859-1?Q?eh1hgS6RepvsFO+HH7G7/2dHZZ6RYrJvLb6viCkRdcvUb9isPNw7sed262?=
 =?iso-8859-1?Q?pl0ZoTXJViELJTH24Ea6TRJEDZ6N1p0luTi4PyUeZL684XbQ5F+99hlN3d?=
 =?iso-8859-1?Q?jAMN8hltafPOBd6fpcBvgedf9sfyCac3NfuZBNsyphHLjfw9URrMCP+1nM?=
 =?iso-8859-1?Q?Z063u8uaa1h6SoBrn9k+W+dP+UFvmVEXrX8+HpfwhCpvuXGv2htOtv0c3j?=
 =?iso-8859-1?Q?3y0yZrTyuQEQrzx+41qRCKtnlOXSmMvzANmqkhfLaIUq1/EKASxExSu2qW?=
 =?iso-8859-1?Q?i9RaR1s1wgv5hh5RCCrIen4X7hfeT5BYseD2dOX3M2Wa9GgOW0ab9yc8JE?=
 =?iso-8859-1?Q?DXclHz/OKJrVba4BHyN78oKyiAEXj+0k4BvTosHEUH1gS4JLxelQcd9atq?=
 =?iso-8859-1?Q?M0vUvMK27/hyyLZDMDD/rju5/o6SEMRRlP4yw18fwq+U666nii1JlGYE8l?=
 =?iso-8859-1?Q?5SMUazG5nUrMIDgifLQfPtsQZBec+3zFuwxCHJ7F1u9k+2MRcLyaHvZqrg?=
 =?iso-8859-1?Q?MroQMJ0Nn9tjngYmUK0hwHbsvyQd/WKOoIJIXjGFLDGigqW9Sr7fWnZFJL?=
 =?iso-8859-1?Q?d/PeiEkcGCpW1zWjJKRzXE2O7UlaVr0n78MGIRUNbqwZhifU0N86VPkidK?=
 =?iso-8859-1?Q?S+JYAkNAy69REwAlJTQ/tXhZCw6PFNSSva8B/THohVM4RJQYakysQAxsrZ?=
 =?iso-8859-1?Q?z7r3HiP5zaBn8w9nyolQv7s4PWOiSapoMp5zPxrKqffezg4kgU0DLY7j7G?=
 =?iso-8859-1?Q?6o9qIlkmvquQC1IzJ53eumX7aQd80A68/kCae5MxjxDWP+xpkkoUuIs9Tq?=
 =?iso-8859-1?Q?K5N2Cnk5svK3pY3DdtCWpRJWP/8gBujqcY8JYr5otFZ9E7+Dx+t4sTkpJq?=
 =?iso-8859-1?Q?oA/twTPkbtloVY+j?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 32395860-a2fc-4c31-0da1-08df35030af1
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2026 14:52:09.4388
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR05MB10278

rps_default_mask_sysctl() passes the live per-netns mask to=0A=
cpumask_parse(). bitmap_parse() stores chunks as it scans from right to=0A=
left, so a later error can leave lower chunks changed.=0A=
rps_cpumask_housekeeping() also intersects its input in place before=0A=
returning -EINVAL when no housekeeping CPUs remain.=0A=
=0A=
Consequently, a failed write changes both the value read from the sysctl=0A=
and the default copied to RX queues created later. On a four-CPU VM,=0A=
after setting the mask to 1, writing zz,00000003 failed with EOVERFLOW=0A=
but changed the mask to 3. Writing a mask containing only isolated CPUs=0A=
failed with EINVAL but changed it to 0. No kernel modification or error=0A=
injection was needed to reproduce either case.=0A=
=0A=
Parse and validate a temporary mask, then replace the live pointer only=0A=
after both steps succeed. Readers access and consume the pointer while=0A=
holding the same mutex, so the replaced mask can be freed after dropping=0A=
the mutex.=0A=
=0A=
The rps_default_mask selftest failed on the base kernel and passed with=0A=
the fix. The fixed kernel also kept the mask at 1 for the overflow and=0A=
housekeeping failure cases, while valid writes of 2 and 0 still=0A=
succeeded.=0A=
=0A=
The issue was found while fuzzing sysctl write error paths.=0A=
=0A=
Fixes: 605cfa1b1090 ("net: introduce default_rps_mask netns attribute")=0A=
Signed-off-by: Yingjie Wang <x-professor@outlook.com>=0A=
---=0A=
 net/core/sysctl_net_core.c | 23 +++++++++++++----------=0A=
 1 file changed, 13 insertions(+), 10 deletions(-)=0A=
=0A=
diff --git a/net/core/sysctl_net_core.c b/net/core/sysctl_net_core.c=0A=
index 473c162736d69..6abd77ef92c86 100644=0A=
--- a/net/core/sysctl_net_core.c=0A=
+++ b/net/core/sysctl_net_core.c=0A=
@@ -105,27 +105,29 @@ static int rps_default_mask_sysctl(const struct ctl_t=
able *table, int write,=0A=
 				   void *buffer, size_t *lenp, loff_t *ppos)=0A=
 {=0A=
 	struct net *net =3D (struct net *)table->data;=0A=
+	struct cpumask *new_mask =3D NULL;=0A=
 	struct cpumask *mask;=0A=
 	int err =3D 0;=0A=
 =0A=
+	if (write) {=0A=
+		new_mask =3D kzalloc(cpumask_size(), GFP_KERNEL);=0A=
+		if (!new_mask)=0A=
+			return -ENOMEM;=0A=
+	}=0A=
+=0A=
 	mutex_lock(&rps_default_mask_mutex);=0A=
 	mask =3D net->core.rps_default_mask;=0A=
 	if (write) {=0A=
-		if (!mask) {=0A=
-			mask =3D kzalloc(cpumask_size(), GFP_KERNEL);=0A=
-			net->core.rps_default_mask =3D mask;=0A=
-		}=0A=
-		err =3D -ENOMEM;=0A=
-		if (!mask)=0A=
-			goto done;=0A=
-=0A=
-		err =3D cpumask_parse(buffer, mask);=0A=
+		err =3D cpumask_parse(buffer, new_mask);=0A=
 		if (err)=0A=
 			goto done;=0A=
 =0A=
-		err =3D rps_cpumask_housekeeping(mask);=0A=
+		err =3D rps_cpumask_housekeeping(new_mask);=0A=
 		if (err)=0A=
 			goto done;=0A=
+=0A=
+		net->core.rps_default_mask =3D new_mask;=0A=
+		new_mask =3D mask;=0A=
 	} else {=0A=
 		err =3D dump_cpumask(buffer, lenp, ppos,=0A=
 				   mask ?: cpu_none_mask);=0A=
@@ -133,6 +135,7 @@ static int rps_default_mask_sysctl(const struct ctl_tab=
le *table, int write,=0A=
 =0A=
 done:=0A=
 	mutex_unlock(&rps_default_mask_mutex);=0A=
+	kfree(new_mask);=0A=
 	return err;=0A=
 }=0A=
 =0A=
-- =0A=
2.43.0=0A=
=0A=
