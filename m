Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.1.0
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793199133;
	b=H5axV2lwJDuwzunh4SQqXXuU367Sa0yGNDyU7URB9/lihxVk0iixqqFa/CevuBmTHUlz
	 zsWEfcgLV/xzhlo5xFcaG7lfoRmnGQlKepk4fYeWxEtIGTmYrnaJdujGnvd18KzbgKxXN
	 2S8jDXVIUpAHx20GKi1epgNNaIkLbpI6c36F/DRmztXFhQAnQXtYAQ10utdE2xmDVYRdB
	 gvfe0Gfuy29UsiEceTlVFc2pQbd5n59qekjm4irSU85cOqDUz3+MscB06cy5gqKv651Gd
	 G4pw8QipGIcDuwlSIuAB+2kA0eAJ0aER1ec6XrWyngaS/CwqWvsY9QG6lxnhL5vYvWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199133;
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
	bh=erm5AleF36XOQ9QPTnTIWuYXJMDZHYY8bbvWGI4lXl8=;
	b=Vokox/KLzCriL4W5AcYBKGId0LE+BF3vLEaj9eyyWpGtJSOlGXARbv1offL2liX/Oyo7
	 lwhewkHNWWYYw9NmcRDnzYtF2sxQTZAngSZ/0q9ybGsNxFrwHM020e1ThqJrKdlaWWGZZ
	 U0ctQ23WMcvKJlVEjLiSd2tRGc1Hob7bF4qDwWy3ldtUgUWa5waYZe5kmsmpZwHpDWmsI
	 TNHrYsr/XW3uQN+47apg5WzwpalA/NaYIX5/yaie4EtA5kina4ulXLT4NRo78HuOC4nxX
	 AG5789qlaHbok3R+jjYYBV0HPS4JFguaicfQMH7Ej9o5hHqapEGU1JKd7gwslJDf5bw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=N4nfvSX2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.1.0
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazolkn19011000.outbound.protection.outlook.com [52.103.1.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE981606A324;
	Wed, 28 Oct 2026 14:52:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE981606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=N4nfvSX2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CtHo4LT0oOovNS+KsrRQgGeeYEmmghA7GLew/YJkrNUpdTkNFv6UO6gdkG/f2G75ZjeGX8ySqlIcRAUVPRREh4Kd+Ymgb1dsuzcXilzZ17v/7cx08X6zCKk4ro+eZBkrMpB/w/Jy+KC2wcavqvIL/7wCjnPrnUX+pZRGPTnI7NZkrrRI5ZIs6KEol/e7i4FN1ihbBE/vgRJNy1yCC0AoPNCOhoZnSt4Wq863R1np+YzxlndJV3+cC/VRWquVsz3Aa3aqck8qLPqLmYYDZZ3Ooa5dWVt8lpkDB0QUHNw6SJVI+DMmutdaT4MHPNlE1ZhJbNZfNEHRNw16o4oA8noOsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=erm5AleF36XOQ9QPTnTIWuYXJMDZHYY8bbvWGI4lXl8=;
 b=HRf3iBLoPIaQNq4uLAbXItVHC3o3aoiEY0b9Bk/xgeBT6KPPUKFHDmNaOyLF43/Z472jxEpKmt6N9v4vHgsBu04gpj6bAEyxSDI5mDHzG7uCm/dIbQl0nTjJBqYKL0/u+WWdoXlMnWMG0y0wL3qsxIP1eCOKj/U+Huuk1EoCbV1ruNpmFsbqMM9+7DG6tqk9EZeVxpkLEjCaWyG7kVZ7ZY1FAt3ghF3P+f4c5d7NonhIE+hTkbZb70hMxDJdF2OJG1N3e/Yp6kXCw7mhtNZDfeiE4JJ5QCs4DDfkk8xW5Ljy4AiAz2feox1eAPKFWMaFRITNtshljCYI6G4xU+kpgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=erm5AleF36XOQ9QPTnTIWuYXJMDZHYY8bbvWGI4lXl8=;
 b=N4nfvSX2IpfjAZPKkxUgZmBt64mBnncoIHIb1gxebq8ACBT9RusPeqBZ6cgKjxpQSrWaBQT1GTgHhrarfqQ2MgyQvkBKbe/y9BUns6amvsYSpNMCNSwiyV4tAw+zFjSTEeZYIagk4F28JpZN80u3iVieq/9Plu5lfUixl/qxgtcVXqqJKk6WAdKbq9bWyObQwaiQOWTzLZ6asgrBbyFH7QwLquavAUPLB2UBKlx1h8Huy5SMlSrtSlvmCYP7QqdFrZhNQUT+1pBCcYWu2uqv+1hj9SbrMiYW1YhYa7Z2y0wNtBgTaQsOGACakwH/oKtwMhx4h3U9Dvv7qE3Ytyek0A==
Received: from SA3PR05MB10385.namprd05.prod.outlook.com
 (2603:10b6:806:39d::17) by CH3PR05MB10278.namprd05.prod.outlook.com
 (2603:10b6:610:15b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 14:52:11 +0000
Received: from SA3PR05MB10385.namprd05.prod.outlook.com
 ([fe80::e22f:a0f5:fcb0:9b0d]) by SA3PR05MB10385.namprd05.prod.outlook.com
 ([fe80::e22f:a0f5:fcb0:9b0d%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 14:52:10 +0000
From: Yingjie Wang <x-professor@outlook.com>
To: "netdev@vger.kernel.org" <netdev@vger.kernel.org>
CC: Yingjie Wang <x-professor@outlook.com>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@kernel.org" <edumazet@kernel.org>,
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"horms@kernel.org" <horms@kernel.org>, "shuah@kernel.org" <shuah@kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH net 2/2] selftests: net: check failed rps_default_mask writes
Thread-Topic: [PATCH net 2/2] selftests: net: check failed rps_default_mask
 writes
Thread-Index: AQHdZuvpVUmXBY1NmEe39gUOINALTw==
Date: Wed, 28 Oct 2026 14:52:10 +0000
Message-ID:
 <5bb0db50ac86f1efec375f6ae95bd972ccf42742.1793199118.git.x-professor@outlook.com>
References: <cover.1793199118.git.x-professor@outlook.com>
In-Reply-To: <cover.1793199118.git.x-professor@outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR05MB10385:EE_|CH3PR05MB10278:EE_
x-ms-office365-filtering-correlation-id: 8f5afba7-5999-4de6-4d7b-08df35030bc5
x-microsoft-antispam:
 BCL:0;ARA:14566002|31061999003|25010399006|4140399003|38102599003|24021099003|51005399006|24121999003|22091999003|15080799012|8060799015|19110799012|8062599012|40105399003|26121999007|102099032|440099028|3412199025|1710799026;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?3k3ywo8lszhKoA27mrwJCFXG8e0pbvqPjfHSKliZn+RaiweJGxerw+1QYO?=
 =?iso-8859-1?Q?9Ht2I5G+edB7JhL7cysiFaTeUxcvTJsv1Y/zFnqnZEDtQOtrM/zts1hujF?=
 =?iso-8859-1?Q?vj8Rxif4RAcp/RRnZKiDiRuzXutaQfcYzi6dG6Rag3XK+zi9c+OS78phNY?=
 =?iso-8859-1?Q?PIS3FxUx1OocJT7Y5asqxRtYM5i6Lzss2ok0FwSNfaycrQ5wdPzreV5Q1g?=
 =?iso-8859-1?Q?i7nTtrY2uOT3W1Vj+Et+SVxHgYk2Hvf+eJiTio2E8XxpXWR11hEdoN9S7+?=
 =?iso-8859-1?Q?DkApNG7fhwQ49PyQ0VIafhJtA14/trbozfHv1jFjxfsAoRBJZ0oonjeFKD?=
 =?iso-8859-1?Q?KkOxEe0cQ5JRUmI0F9eIaQSm9gvIWI4o18xtdEO0MfkRf6Tse3feGuBdad?=
 =?iso-8859-1?Q?WnPyS1LfkPvWFxnN/sGaDfuCqjRPSUVkd4SMdiNKVmCaHQLfULz6WCsisc?=
 =?iso-8859-1?Q?KIj1sYdCRMbHABrYPK05O7BBUZzsX4N2bZ2M1Q5sRTZWAOMjuugIVvnYjt?=
 =?iso-8859-1?Q?aaGEOfyv8Uo3laNvlbc9tONAQSF2zjWBErpqJmcWxh2MO8OS3f/wlSHAkV?=
 =?iso-8859-1?Q?SJ+aD0PmbRAsjK6bVn7W6KRSM1HVHIpFYJD2GwoEj8akFk2pk801Z92m+z?=
 =?iso-8859-1?Q?XJeqEkxtpHtyTHfMilgayPWqlIIpq/Yb5wTGWoPuA9MYTDx1+NvWAkPXwV?=
 =?iso-8859-1?Q?EMiUwAhEb52nKaJ57zuoxHq8SL23ccOYB9CqAb177yS8QM/UHIJHuvqYd0?=
 =?iso-8859-1?Q?P9eSXuKnsY0fn4wY+ZKFDeSDEjY0i7hZmr1EXo6BmdiWDJj2xxkaSjaMFv?=
 =?iso-8859-1?Q?2pxL5uYe95BpW8l1FeIa6B5Jh24h9PvVJQaTzNmvgiSlO+OgWOzyzfd6Dw?=
 =?iso-8859-1?Q?889h/TOFN6nioUt9lV5yLqaj8RQP0kLucRmreCOVdJLIsbd6m+Pj/5mSuC?=
 =?iso-8859-1?Q?5hTI4ilSDqgqhLuYp8lqNRLvQQBTCksy9BghaIeu7NGUlVszi18vKYTnWT?=
 =?iso-8859-1?Q?ipziUe6JYEXrp+4dpbjvJX/1T6a26MuBHVkRLkao2skUNxkdPUeE1Llw0c?=
 =?iso-8859-1?Q?+Eg/FCTLuwEx8dSmIyDFdb17ljnNmbpkvkH1ybqvKR9liXzaxwCOSZtXge?=
 =?iso-8859-1?Q?Ny4LO1jg=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?374skq7e+H33K9HimnIGJkDcOBUG+FtftUpWoV6mWVOyOZwSMoXHSYGW0p?=
 =?iso-8859-1?Q?gtLShC2rgbL0vKWsUpdgCxT2JHulHpR/fd0P8QDj2OEThFH+PR/3wVWdVM?=
 =?iso-8859-1?Q?TJVQkWwmkyIOuJoPRNSXtGvRwczdXeBVxs/sCcUjIpCZuL5Jbcdomdrqfp?=
 =?iso-8859-1?Q?MeNfOf6KmT3T5y9ThJ3LH5YMkNC1dXgRps2jDOkfdtRZ7/pdhtUERQAqX6?=
 =?iso-8859-1?Q?5S7pPsesRYjBfoe7jwBa5fOi6bf21hfVn4c+u6VvTbi2aXTIjwZwpK2MtO?=
 =?iso-8859-1?Q?UkWzgylbs1Ieq7zvT58qeWLIZBkDI21sVmpFaY8+avSmSFVSnSrY/RSF2v?=
 =?iso-8859-1?Q?7Jjz/ZSEj/gDeQHm2J5An8ziooH3Tc/8vOc6B2x9DFxUAujCN40av8g2Lk?=
 =?iso-8859-1?Q?ZpZ7RXWfqr8ss1TdYDXoDl2PwKogiEn3iJ+KTPL2hRCPmPGnVWZ7P6TpOY?=
 =?iso-8859-1?Q?kl47G8dzCJXz+6Y3tKR9dH1ZO/03UyVj6Mp/4G+jfLiW1ERlXKn6ihf4UR?=
 =?iso-8859-1?Q?SIpWdk90ERlAJ7dASHpqM11T1TULhHnFokbkj5IZ4cVIkB3cICzwCGDcsE?=
 =?iso-8859-1?Q?c24znXmInGFEzHLoQQ/R2VB4kF+yJUpMl9eZxa7GuwwooXK17RWZ8HUvXh?=
 =?iso-8859-1?Q?BcaK10GbtbkC/YsHJ3fyNA+WjtfNEGW8Msv8u4N4HMKSi/3mGoFI0N49oj?=
 =?iso-8859-1?Q?8JdqWjaW17PFizhcXssBwO5ZSlOC/Po4zgnghDUGhgzjzoLbUxVa1yp5JB?=
 =?iso-8859-1?Q?I+s/6xFII1hKaIUfR9fd68GAGbBvvysR+Psnjqdbp38KtJKRZ2RyTwDNJT?=
 =?iso-8859-1?Q?1llTZsTouKrlZgsXZUMIXfLDr+8xuX0nD8phXkn4dsYafUHhhrzQQ++VtG?=
 =?iso-8859-1?Q?Okx5K5KtJ4MLnlppaAlFgxrnV7uerXUqZklnsjtJN/C7+JFdAgZeqwpJw/?=
 =?iso-8859-1?Q?o4Xd0Wdw9neezhbNFT69ySXzArap8tYL4F1j9banMa6Q03fRwzTpdUv4L3?=
 =?iso-8859-1?Q?A2w5bwS4LyOj4iKbuheqbbPviaA8mqgSShSemInU9SHwIN5dAurZyTAWMY?=
 =?iso-8859-1?Q?QRXDVYxt0M8sGsdvPg23s1ogB5tiCYeen9/RP6uAl+y8Y1dy0Yv9rPWzdM?=
 =?iso-8859-1?Q?em7vX8pzbJjZ9930xqVMTwDnfVNa265NzC4SXZQ8nM4OguLRXjCgmfPzmm?=
 =?iso-8859-1?Q?se27wPPzqcr62NU3jFmjM8a7FPS3pj+g9b5kpBUBBDzjNyMbcabQycrMec?=
 =?iso-8859-1?Q?nEylrrAU9jlIBT87OWVaN/ShB9ptY3FdeIekznpzS9m/klV5ayoz4mpW2a?=
 =?iso-8859-1?Q?5vWseZWmz4vDBhxj71ExCugIG1mGGj1se0ZFi0/Phv2qeqwWUW+vXhNTDU?=
 =?iso-8859-1?Q?D+Vkx0ufSdOlyzfW+VI2DBGlX8pLh2xKsGKMQcSS34fVtYzDtWh03M94h1?=
 =?iso-8859-1?Q?H+u8MX0+7Fvgv5BW?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f5afba7-5999-4de6-4d7b-08df35030bc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2026 14:52:10.8126
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR05MB10278

A failed write to rps_default_mask must not change the configured value.=0A=
Add a case with a valid low chunk followed by an invalid high chunk. The=0A=
old handler leaves the low chunk installed before returning an error,=0A=
whereas the fixed handler retains the previous mask.=0A=
=0A=
Signed-off-by: Yingjie Wang <x-professor@outlook.com>=0A=
---=0A=
 .../testing/selftests/net/rps_default_mask.sh | 23 +++++++++++++++++++=0A=
 1 file changed, 23 insertions(+)=0A=
=0A=
diff --git a/tools/testing/selftests/net/rps_default_mask.sh b/tools/testin=
g/selftests/net/rps_default_mask.sh=0A=
index b200019b3c80a..91e163fd25450 100755=0A=
--- a/tools/testing/selftests/net/rps_default_mask.sh=0A=
+++ b/tools/testing/selftests/net/rps_default_mask.sh=0A=
@@ -45,8 +45,31 @@ chk_rps() {=0A=
 	fi=0A=
 }=0A=
 =0A=
+chk_rps_default_mask() {=0A=
+	local rps_mask expected_rps_mask=3D$2=0A=
+	local msg=3D$1=0A=
+=0A=
+	rps_mask=3D$(cat /proc/sys/net/core/rps_default_mask)=0A=
+	printf "%-60s" "$msg"=0A=
+=0A=
+	rps_mask=3D${rps_mask//,}=0A=
+	if [ "$rps_mask" -eq "$expected_rps_mask" ]; then=0A=
+		echo "[ ok ]"=0A=
+	else=0A=
+		echo "[fail] expected $expected_rps_mask found $rps_mask"=0A=
+		ret=3D1=0A=
+	fi=0A=
+}=0A=
+=0A=
 trap cleanup EXIT=0A=
 =0A=
+echo 1 > /proc/sys/net/core/rps_default_mask=0A=
+if echo "zz,00000003" > /proc/sys/net/core/rps_default_mask 2>/dev/null; t=
hen=0A=
+	echo "invalid rps_default_mask write unexpectedly succeeded"=0A=
+	ret=3D1=0A=
+fi=0A=
+chk_rps_default_mask "failed write doesn't change rps_default_mask" 1=0A=
+=0A=
 echo 0 > /proc/sys/net/core/rps_default_mask=0A=
 setup=0A=
 chk_rps "empty rps_default_mask" $NETNS lo 0=0A=
-- =0A=
2.43.0=0A=
=0A=
