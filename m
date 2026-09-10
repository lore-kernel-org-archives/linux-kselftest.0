Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012021.outbound.protection.outlook.com [52.101.66.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4135C3AEF55;
	Thu, 10 Sep 2026 09:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.21
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033218; cv=fail; b=MMmFUpX9KKiHPeGItDvhGc+aiYz/zyeVtAlu21GE9uEmIPO59YU4/YU7Wjrn57A+8HUJFrDo3JiWjINnSoTsChZx+kgoPyzSy13IA3FqVR2n75vdB4dLwsIjxwGi1sfL42CeMyLI/tjfyocDC1MWLVt2Td9XVk2PNaHxKO5xFto=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033218; c=relaxed/simple;
	bh=d/QdAoAgTTs5OM9nOrRDligRwHEfu1OSjU/QAmOaCfQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TLu4pID0CIZDKNV1GXKxABS2dd8AAq1fNtIvYGTbT4tDWRyD4erWgU0aAuDPw6faxjQnheXpMSOuLh2rAeFFy+8UB9yZ1kJv21anMHTCmJpOHP8eUdytQjugRZZ5kXc5SRHa03VaPRRK/8SF+BPx7pqOE83h44gvb88LSBJyMvs=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=CAoOl99D; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=CAoOl99D; arc=fail smtp.client-ip=52.101.66.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="CAoOl99D";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="CAoOl99D"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=wk8arZAKg8cMsF9xJsu8wm8XSPgpXdjsbX0tSwVsYICFHiQgX9dW4Dq/laBDq53eE5Y3h/dzWnRZO4VeQpAyT7SWZ0PIu3tgm1VS9AfbOIdppQX/kjd77zQn4/39E2k5ou9oXGiGVe/BhZpyGNLn3O94VGj9DQ6IsngHyzEArYoHXngMU6DUerlLTIa/kPyaXKH0JeM10nyIIJ3h1CX5tEdZnWqmtF0xCd2A7c5IYm6K47w7qHtPhtPkLtfuYPDU+/wy/YHwkwmCVahQdAthLA5Z0byT+siGThkr4aQaQL12k/0W3t0KCTBzvnVWzsYex9Q1ZHJKZPJ0gIUlK846cw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqjdpgVowFnG6OYZNDXb+VU56Uo8Hn0Rr7kvi2ves0s=;
 b=bYilgK73DnavITDHFHWBJAkFYbZ/y9yeTX6gHkseJTcqnMEBcYY77dUH/PMilBRYb7daVR99PZEJpWVJpiKe/UFbrJu/tHP8YaQeSRborpcj3oEx/ul73y02TqzWWsLMlEvpKe/sK3+olHEQA9ySPwM6Knf1cxd3y4nYHOsCBc5YN9Bf2o+JT/JsKEQpsx/STH0U20ZaJh/F2AtxHbkIrn5PYUbohk95lCjkDApxQEhLH/5hIVeJal6VKhhYKFRxvDifjJzbdU0TlL765Gcu8/8H9+/DDwpmM/jfd2r1KwQLON9Xp7dG//2E8xBTdj/wqrFKHkoYV+zttlenp6KUFg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TqjdpgVowFnG6OYZNDXb+VU56Uo8Hn0Rr7kvi2ves0s=;
 b=CAoOl99Dnv9ddtqBUkyvSh++efYLAPPwiIwwuYIPKwdDkfeXygndLlPNTt8o4pfm6WiooKBvOBpkQO/+cbD2uikpas9zOWFcSf4WiUDFM9c/xqi1F2i/SYDTTktoP1c+HEBebB1jXaAsMHOTZavU5xQrkNjBj7Bv64OxnhPA3NQ=
Received: from GV3PEPF0001DC07.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::269) by GV2PR08MB10356.eurprd08.prod.outlook.com
 (2603:10a6:150:d6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 09:40:06 +0000
Received: from CPH1EPF00000524.eurprd05.prod.outlook.com (2603:10a6:388::1e7)
 by GV3PEPF0001DC07.outlook.office365.com (2603:10a6:158:400::269) with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.21.406.9 via Frontend Transport; Thu, 10 Sep 2026 09:40:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 CPH1EPF00000524.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Thu, 10 Sep 2026 09:40:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V8KKpq+ZhfkGsXXlN3NLQpp/1N9LyQ2h47Gjhou0kU9up9GHNTTCaYjifwVfmQDI8QsURm5AdnAqZbM+RXFxVDatWajRrgLk7LGiMeICo+9EjdBHmmkALiVhQlZj4WWmlYYheRjEb3yGNRNYJDXHEsouCMhN4PxEgQDemPPIBWC9N01ZD0MzH36Sx49GnEFQb5NbTATILzbCvWw1G+aj32NIUU66Wmkq1aNI4owPhsVB+ShThAACWpFO6ivlDzWTPwo6ZgNIjZBawTXizKN78wsq0GM3fsd1D+nPFzAK/bFD9AkSoEuuZHpnm7dSUgtug2LyeHFCULcJSt90HWpNIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqjdpgVowFnG6OYZNDXb+VU56Uo8Hn0Rr7kvi2ves0s=;
 b=hh+sN/VDluytWglEGhpgJCsFZCNRslwOV0Mh3q0EekPCtCsX3vbbteVKnxeVXvJuiI5L2YYS+bUKhwHgYOceWhrI3pQ0gHcNNefKB0h72bCjcgdIcqRfrjbrW3+0TC/TqPy8YGE0apFCPZnEdgfdbO1OELpH50+Hm7nQIDUbqdrJ3H60QV3l5A5HST6hjgqJ3+aTbNAB2gEGodKsM7ZdRcDQJlhaKWoFq1bPlwYFIkjDWIzkahAYTs8RVOvSxru2EGXka+Seb1ppShxGjVK2UWsemeyQgXEGEkl0b0718kK1Ol982+xA3CC7KHtEN7cariBrc1BleLlLMHryMyASGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TqjdpgVowFnG6OYZNDXb+VU56Uo8Hn0Rr7kvi2ves0s=;
 b=CAoOl99Dnv9ddtqBUkyvSh++efYLAPPwiIwwuYIPKwdDkfeXygndLlPNTt8o4pfm6WiooKBvOBpkQO/+cbD2uikpas9zOWFcSf4WiUDFM9c/xqi1F2i/SYDTTktoP1c+HEBebB1jXaAsMHOTZavU5xQrkNjBj7Bv64OxnhPA3NQ=
Received: from AM0PR08MB4402.eurprd08.prod.outlook.com (2603:10a6:208:147::18)
 by AM0PR08MB5474.eurprd08.prod.outlook.com (2603:10a6:208:187::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Thu, 10 Sep
 2026 09:39:33 +0000
Received: from AM0PR08MB4402.eurprd08.prod.outlook.com
 ([fe80::b968:53f6:cd4a:5dfc]) by AM0PR08MB4402.eurprd08.prod.outlook.com
 ([fe80::b968:53f6:cd4a:5dfc%5]) with mapi id 15.21.0382.007; Thu, 10 Sep 2026
 09:39:32 +0000
From: Arthur Cassegrain <Arthur.Cassegrain@arm.com>
To: Shuah Khan <shuah@kernel.org>
CC: "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, NeilBrown
	<neilb@ownmail.net>, Vincent Mailhol <Vincent.Mailhol@arm.com>
Subject: Re: [PATCH RESEND] selftests/filesystems: include fcntl.h in fclog
Thread-Topic: [PATCH RESEND] selftests/filesystems: include fcntl.h in fclog
Thread-Index: AQHdQQTJkTQ6hnmmaUu2JPRorLMzDbbHipJC
Date: Thu, 10 Sep 2026 09:39:32 +0000
Message-ID:
 <AM0PR08MB4402874569C5F506F332CC02F9BF2@AM0PR08MB4402.eurprd08.prod.outlook.com>
References: <20260910-fclog-fix-include-v1-1-b72bb03eb998@arm.com>
In-Reply-To: <20260910-fclog-fix-include-v1-1-b72bb03eb998@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB4402:EE_|AM0PR08MB5474:EE_|CPH1EPF00000524:EE_|GV2PR08MB10356:EE_
X-MS-Office365-Filtering-Correlation-Id: 90626b36-05bc-4889-100c-08df0f1f7f0e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|38070700021|6133799003|10067099003|56012099006|11063799006|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 oHFVhsxGa8RGIm4THz10SXal6tgpWh3wCO+HYNU1mgwvyYi2PFBZC2IE0xzu+qcCXkBPBCtFgbhSR79pLjDr6txrGQ+UjwCkljU7hjdjdW3hBIjAP4nJntKvC0qFHDWilZEXPy6K3M/fDw9NmOjKeYS+qNlgr340IbssEQWMCL6648E1NSe4wGP953j6vBknD6tsO8HjROmvgNU0lYai1bmF2AgjhPNpdKRnw3k4feX25JIuOtloJ9yqDYocoQSeNBVcWcZ9XQig0FwrMqeXILQJWsYvsOJEawatxLbgrlW7TRDrn2Cffe6owmkZlenMeLEJ40OZrSwrjS9XV99/E+bbBCaVLkzXh0J/YzTBNGZidKh+Mmv6ci1Ti6aWiXxxs8zTW9EhGBbB3Iv8/hiBbg0JA/k5jBRkTb2B67es3PNuoARSDUXbtYHKLWCk7vs+FjFWWXG9OC/T4gTqLFD++FbVS31FZakiYEcPTdRqfyQ0FYpkiFfA8foqPl3ARoqFhfPQ0RTdPRIiacA5pbY3qfjgR0BT0kFGng9Y/d5nMAfqGdICq1NHBc6rbEe8A2nSQX8f/L/vBjr61M5ydkqYYRDAeyt7aXjUzPwK3/CMDG+SeLAb1+LtrVbshih+W268gS+/GYq9xdfTEBTAV2Ypqo5jZ2XM84KXzN6CVI50JlU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB4402.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(38070700021)(6133799003)(10067099003)(56012099006)(11063799006)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 MHh+Ft0S77TZwgkyuX92V59uVceKnwEqkxj9zoG6zdMr9wvUbULPGk992IEYL2Yd1DNAI61ujgz+Rrq/Ji/SXRKf17gGjqxdUVh0IWnFOBVnsSHdS//ti9vqcwo1w+NCDgHPTl3M3BVxtMNwnB4N78tKW0aBdqPe72AlI+EoNawa9gDNOVje4AXRuECRJDg8g9Jm82n6Sm8GHKVnpZGsIQIJoFQ3i7eYsrwAQ5DTtQ3gBvuHUQ7fgrOEGhVdlQjeaTvptQo7KX3DjEWE9Tw8+D7sbGbCS2liLqPrktQhCoeqbEi9D+zIuzEeAuj4yzMH/vDjeuAlnRMwIQt44Si/xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5474
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 CPH1EPF00000524.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	87bbc9d9-4afa-43dc-94ef-08df0f1f6b52
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|23010399003|35042699022|14060799003|13003099007|6133799003|10067099003|5023799004|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/a3VrDL/hvZK9CElk2p/p3/knBOAJIWoQ72GybK+2P1u7KvcD8P/mP2j+tZNCgW5+NzPt8DpSzUEsu1dZVyaijIMXR1UsWNe/K2ND822ZRVvoGhx4JSfdwM3dBgrnYzWkRygZyPQrSZKCQCZRUASO38oX/S/Dnfw9YmkFYaZ/pMrK4bQ7FoHrwV6XNQvcsIAa1FqJBhbZb2Cghm40GRFdHI6xnDCDJ/pUGWeVtoR+L6rdWvt2sse5IlaPJTUWyYsxSuL8vL7lpuu1n0rmhhvtEnmmwvPIu8c1cZBMrlC+AdFHJIE9oOK6e9Y/b7ykauPqOv1fEBDtiG+Dl84XXmVyKr5T2ezxThfBRUlvPZkCmG7Vd5ilpyR8Eoy3Iee5LHZNp2jO4Qmg6/egWkm9BT0/i44/THy1F7CX6HK3t70tSoqmZ3AVs/0sGnH+UTVyfm3q0qVJXwroQcdUaSeSGwOn1OH8W3y8YcK/2wi8Dueu7wZ9r5kkEcFpeN+HP49I/XRBbmRn3oKuEZzZLbiZAdcMOMTqE16JVv2aTdoh33e8wLkLi53cP8HR90PYZPjdaMZhoNebApr9vzjkTSW7cOYyc+/FbD8Xq9kWV80CyNkd+P2UmatcjpvDnOcHfgl06UC2t7if0OIDsCwck9X+yl/Og==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(23010399003)(35042699022)(14060799003)(13003099007)(6133799003)(10067099003)(5023799004)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RLA831gF9bDRgIFqKnCQOjR550ki2UAg/oGG5ydZi88peRYjNrCiLthSwtHM33i2MhjJ1klrquzMynNZZb8RhrCT1fHtTXn/YdQvEg8+Xk/+G3poZk4M+HcisqjdT7op9SnNHNT2YJ+TXJY5sTjPM7rURcpdTw+xQAkN/K+HJDHRFzwnGb+lP0lwvZzgjD5g/AcOubl3aJQuBHzOdWcy/YmbjVobfOwK81Kh17a0O52pXMMe4arZ20LBOwFcoQpGtBgNTO0qOhdPaS/S5XnWLTatxo5VQrRWd+bq9C5qNFfttnkmZSbWT0jTwbTYyWGrbfLayw7hO8a17/irn0+Al//klb/91dhpEOcclGr0kMFyCvNRq6f2gOODRGjgDlavUixsIZsAsMLRgDQWZ33jtXmkbWFCD/B9MolY6gGpEXCI+/Z0sqz3gVSfn2Y27jh4
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 09:40:05.8540
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90626b36-05bc-4889-100c-08df0f1f7f0e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CPH1EPF00000524.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB10356

> fclog.c uses open(), O_RDONLY, O_CLOEXEC and AT_FDCWD, but it does=0A=
> not include <fcntl.h>, where they are declared or defined.=0A=
>=0A=
> This was hidden while <sys/mount.h> pulled in <fcntl.h> indirectly.=0A=
> glibc stopped providing that transitive include in [1], which exposes=0A=
> the missing direct dependency.=0A=
>=0A=
> Include <fcntl.h> explicitly so fclog.c builds with glibc 2.44=0A=
> development headers.=0A=
>=0A=
> [1] glibc -- change 419245719ccb ("include: isolate __O_CLOEXEC flag for=
=0A=
>     sys/mount.h and fcntl.h")=0A=
> Link: https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D419245719c=
cb=0A=
>=0A=
> Fixes: df579e471111 ("selftests/filesystems: add basic fscontext log test=
s")=0A=
> Reported-by: NeilBrown <neilb@ownmail.net>=0A=
> Closes: https://lore.kernel.org/all/178331747789.27465.473960041838751358=
7@noble.neil.brown.name/=0A=
> Signed-off-by: Arthur Cassegrain <arthur.cassegrain@arm.com>=0A=
> ---=0A=
=0A=
Sorry, I just realized that this fix has already been merged:=0A=
https://lore.kernel.org/all/20260710171741.837308-1-jkoolstra@xs4all.nl/=0A=
=0A=
Please ignore this resend.=0A=
=0A=
Thanks,=0A=
Arthur=0A=
=0A=
