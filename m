Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013055.outbound.protection.outlook.com [40.107.162.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6153CD8B8;
	Wed,  5 Aug 2026 17:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.55
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785950226; cv=fail; b=PN++Gz5xyFjAO3EKRgeMDYa+3jPVoebnPeHDlF0u1KrPHASg1hM41qa3fVx47O/gjifgDHfE3JK4sCkmuU2saGAvTG8oQ5fTDB+5g0rx4WZoRskfcYL4O1LDGRzOYv64VV3nV3QiMKhE2UCr95ZGsjOv5zzeK1ihGn8GwEaLnck=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785950226; c=relaxed/simple;
	bh=1Dr0iBpKtvwW8WJEhqzcf0KNScztc8pJ3dKLM/PaH+c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bbBpIC5xyg84btWrdCnFMZSRsW8HU3z78nAmHqO7Yz0pd5UKb6Bn3/+tG2CBZ1GsG3nhdmhd/2j0cFrDXXOstRl48q+6DIyGbiV6pUJmXpHu/DiZ1yV0pFaJmOb/zijg+GjI2PaggObIGFMFc9sc+kQIP0iOx2VOXy6ivXDzT/8=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=G/xphMqe; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=G/xphMqe; arc=fail smtp.client-ip=40.107.162.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="G/xphMqe";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="G/xphMqe"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=tIsbDKmYMX9mmD6mtCSHqkXP12p3A+6fAR5BBVGcP5WRfR3N94r9iaQQJFrMGmu2hiNP+O3iY+BX2zTFrIA2ScIbSKWz4oYzj4JNMVZKGSWzzeDrh3s6pfLX/BvyidYR3sB1myTyLOaIc1W0cv3xIH82aAZjQknRIuPq0k3P4jjPatpWYXxRjAYQWVI6aX6qRH+HeJgVY83niGjn0ttfDyGgAaM6pxAQfXHMOrvRVDdqUjafLWaWzgDrX1T81Z8rQkGvhdgq0RzOrgqEiygbkJcj4N0dy6IXjWRBhzjaC6jGrWsytaUANl6jIHQNF3JBMWVs4pRwkOVxAAGBpf40+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OR7dRvgp3BAF6wm96XaOqo7mg+rUat9Z4GlWD1IufUQ=;
 b=MJVknQCgcmwxVciRyZuz8QdtpRBHJaRBoc5sq9/3Ogw/mWaL3MkrANR9lMKFwiqXqVnKTW8xoZmRb+jrezsMZOCwGcEOAQdDw7esN6hj0Mj+TkgSaSdyi7nlFUAla7eZtFVmtDl6WF2IcHTY61v13SWVrKGC23bHbAozCLFzpFdEJwql15i87113NAJNCGAwJuJdi92Uq/DSPKoArSHxy1p99Y2yBeMbU6G68reMWlKMlTId68TStMicZsAj6QaZ4SUhAJzD1qA47KzODiziGS6JGfcwvnknf4aw7utTy9ogz8lwU4KElr48/w1Jg4s27ZxRddKCUtHW8zS+I8NZfA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=intel.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OR7dRvgp3BAF6wm96XaOqo7mg+rUat9Z4GlWD1IufUQ=;
 b=G/xphMqecmfhtWlikplKdyxBWsL1ZP3y4iIEBMIn1Yg6VzWvZCztQ9sO5AA47PPUBQVqA/Kfi04TVQwOoWiN5uF9cCLW2hCtFS8rBsTSx2oV7Mvb+u9o/9zBxQcUuKaAIY0RC+ZajaicPWbNO6IZ2/z8zuw/RxPv6Tg0R8bv9Kc=
Received: from DU2PR04CA0040.eurprd04.prod.outlook.com (2603:10a6:10:234::15)
 by AS8PR08MB8568.eurprd08.prod.outlook.com (2603:10a6:20b:565::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 17:16:56 +0000
Received: from DB1PEPF0003922E.eurprd03.prod.outlook.com
 (2603:10a6:10:234:cafe::5c) by DU2PR04CA0040.outlook.office365.com
 (2603:10a6:10:234::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Wed, 5
 Aug 2026 17:16:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF0003922E.mail.protection.outlook.com (10.167.8.101) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Wed, 5 Aug 2026 17:16:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RyHM+qNcsfzkTU4EdwMRanrAuvDuds9fpNkzFVeGZEeXBL9BTBAWhvJtqzcr4WjO0jhOfKmxk+XiOeo7uV31beIabKakyDwUp2Sai13K9N1TSLXVhcwaBrARfz4yE5VPeavfUeGzCbt8FLd7Q3tUTkGpmW83gDaqFWUm+JsUoxw4B73z7rPi+fs1qtASNMd0bg2Crp4yLd9o/pbYoIdmNaEFBSf+5CcioTIoI0Vxxxz5btChgdKbdT+k7eX1FHdcp3htZNL5ZIKhymM3gBLNteIO4TLC/PKes2gjm8uQIExltJfZ2rvTy2/FoHJRCXm54zyk9Uf/BRntm3EGVDqYEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OR7dRvgp3BAF6wm96XaOqo7mg+rUat9Z4GlWD1IufUQ=;
 b=V6N0SiJnAsEOIspceyKwdHaNoLXBpWIOtwYYXIIBOx/8S6srzt8Q2cBeGzKOoLtQCUq9AycuiyrtdW9gKbN6jJMUyFfeFfXac5G6teGkfEU405QW9DVVo4riMNdolFPlryPwJwVHU5udljfpYOoGNd8XIZEDmhTTjjxqTNDBe8suSZ9MhbIEIJHNjzXevscorVxP83hScJLbLZWzxzxHv1gEZBnI0NKULwciyB4jiwrpMXTQi3OIMzuTAiSOnTiQv6GLp91OLVSMnGXF/hcgP5SsMeHTde0Ik6uz4lYUK0zVkYP1XidEzVUZEb/0XpudWXZulbSyZGs39yL5JBGOvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OR7dRvgp3BAF6wm96XaOqo7mg+rUat9Z4GlWD1IufUQ=;
 b=G/xphMqecmfhtWlikplKdyxBWsL1ZP3y4iIEBMIn1Yg6VzWvZCztQ9sO5AA47PPUBQVqA/Kfi04TVQwOoWiN5uF9cCLW2hCtFS8rBsTSx2oV7Mvb+u9o/9zBxQcUuKaAIY0RC+ZajaicPWbNO6IZ2/z8zuw/RxPv6Tg0R8bv9Kc=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAWPR08MB9829.eurprd08.prod.outlook.com (2603:10a6:102:2e6::10)
 by AM7PR08MB5414.eurprd08.prod.outlook.com (2603:10a6:20b:105::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 17:16:21 +0000
Received: from PAWPR08MB9829.eurprd08.prod.outlook.com
 ([fe80::5cca:dab9:827e:c7bc]) by PAWPR08MB9829.eurprd08.prod.outlook.com
 ([fe80::5cca:dab9:827e:c7bc%5]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 17:16:20 +0000
Message-ID: <fe450c3e-a7fc-478e-bcf8-1b63ba560146@arm.com>
Date: Wed, 5 Aug 2026 12:16:13 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/shstk: support via prctl
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 "x86@kernel.org" <x86@kernel.org>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "bp@alien8.de" <bp@alien8.de>, "pjw@kernel.org" <pjw@kernel.org>,
 "hpa@zytor.com" <hpa@zytor.com>, "mingo@redhat.com" <mingo@redhat.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "shuah@kernel.org" <shuah@kernel.org>, "tglx@kernel.org" <tglx@kernel.org>,
 "alex@ghiti.fr" <alex@ghiti.fr>, "palmer@dabbelt.com" <palmer@dabbelt.com>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
References: <20260714154740.140431-1-bill.roberts@arm.com>
 <20260714154740.140431-2-bill.roberts@arm.com>
 <33ac05a617a26b3d9c4a374d14a4f210bba0a991.camel@intel.com>
 <51064f94-be8d-4901-845c-9f4a5e46a337@arm.com>
 <ccdeeca8fe9c6d3e0378891953ba9249557fea2a.camel@intel.com>
 <030bdb74-7938-49ab-809c-5fefae4316b1@arm.com>
 <5ed7d0f5baa920bb8feefd64444939c33397bbb0.camel@intel.com>
 <17d39558-14d4-484e-9395-29d4d20d5011@arm.com>
 <2844b9a7811fba20bbd33631035ef6854b58c598.camel@intel.com>
Content-Language: en-US
From: Bill Roberts <bill.roberts@arm.com>
In-Reply-To: <2844b9a7811fba20bbd33631035ef6854b58c598.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0063.namprd11.prod.outlook.com
 (2603:10b6:806:d2::8) To PAWPR08MB9829.eurprd08.prod.outlook.com
 (2603:10a6:102:2e6::10)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAWPR08MB9829:EE_|AM7PR08MB5414:EE_|DB1PEPF0003922E:EE_|AS8PR08MB8568:EE_
X-MS-Office365-Filtering-Correlation-Id: e015f7be-6cd0-4507-1ec2-08def31559c6
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|22082099003|18002099003|5023799004|11063799006|4143699003|56012099006|6133799003|10067099003|921020;
X-Microsoft-Antispam-Message-Info-Original:
 t/G9JHDrn8t+GQFKr+47CDAaR/oVXDXPE519xNGM6/Uum+/2uLZThSDHgrJiH8s9AOXT6aGQ6H2vI2aHUREOgyL7nQRrxcWzPzD24XrymvYYY2Zm7F3q6A9tUh6FV8rz2mCjSVh1Pqdu/x5M2qAPwWTAou7gpilx9WH07wJElqA9SYOiBsj716BZKFvswWSXveJpfrweGCKDphyOFzASCSIhOpRxcTH/LLOvoPK+jn1mljj8bCSvlH2Rs1A0ZMuR8Mgh8dcK5jUK2pBWhYTYi0ougcNOI3WDVaxCHMCwwlyBQ7sR/nBgBWmMu1lAEMKrdaef1kO8yTE5B9V72UsDg7rOEoA9P4BDkn/2C/IOb1/xMB7app89oFPFfn2xAsXZiOH5gVihSsilmG+iWRe9+g3d04MrkD3du1z0H1NgkVAGCc25LhM29NQZ0UX1cIQXFOFd5eyeJodW+tFVbvnIF3AGbOoDf0iSs49lutKswPdUimKlcwB7o35ersk+BrmVNmJhkZ3eodvQoFB1e+rH4tz/AVDF9j/0yvt0oR6CFd2fhqCc1cCtFq82312POh3WFNxA1sV/MCAcjHDc1sU7TiV6nXrSc6IuLK1Z03aLS4nlCxgDvVseNNq/+ZWJT3wBtc75UxkuVf0F2p6MSBmyQBT9uTn8Y42BnKA0191poJOxQWpbXjRNsNMTuKY9anqabMaFod2YpUz6nlhuvQ6MCg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR08MB9829.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(22082099003)(18002099003)(5023799004)(11063799006)(4143699003)(56012099006)(6133799003)(10067099003)(921020);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 s9IECYzUjA4iD+5CisCfI04nSJu2N0sB9B3YnMW6clAMmNwpyh2XeUcYeorfDl9tApcpdoVTxEKMZi+graYtxfWj9gce5+qSGMNHPHYcsec8n2MBi7b+4FwtlQ5culSmtyd3ghiEOZ1/coRqlyanOtIBzaNunZi/vWdUcJRcNGnHVraLELR1dZXi3qNh1pFvW+eZgFbUtMmEibcrT+QbcWGbKGB1ANSRVEIafEFIpTNhMoBmKATHA576l9J5QoF6s0eOzZseBL2xULRHmgP283t1wEuDGQynTZEqFlN0rjU22SRCdk0rDmWU8Qo8zk5E3cP8SVQ7o98Tp1wBausjYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5414
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF0003922E.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cb12117b-2587-4277-5f55-08def3154497
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|14060799003|82310400026|1800799024|23010399003|36860700016|7416014|376014|56012099006|10067099003|4143699003|11063799006|5023799004|6133799003|18002099003|22082099003|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	bh8usVXiprwlbbYpamdGlvtOe6nSIpgc4tQilsOJ0X7UaTgSoMo+S1yf7qMNL310g/nHY+sOhAPzVwt1TjSagTdPKPCrOgjLxyq4en5v+wK8csGxM6hazDFSnAo+FpSA5pojk3gEk2qlV61KkBmqhyGaEQpMEi+soaVk/vaB28JvQVlgeSFp8WMrM9YtRS91nMFZbySClzatIKmT2i2O9/HxixoeUlfM+7ajhpodM2LjGXsi/LAm6vQelldfpWcNI7Ip+eAA/Ax25QJv3Ik576AQw3/+FRmwxoYKXUv6MrJRzOoJVtoGtrwP6N2SbRn1hYp1gF//luNM6uBq76YvOJCNEIfJ7V4nNBAud3bARt0SYBeWsrIuuGivm3hHT47QL8q5PVN9im1auxPn7VjzlZtZrvXdDGyx8flePAms0qok6x8ihXmxYLs1F+F2I7ubRBkrI0MgyBcNeDRZfjbNP8GMvF7xH5ZI/4prQiHkBsiNeUOjVXFdoP/68JhDTGeVgo7/pEMK0bwnIzD/TZ8zcve0jOQVJx9GT2ld/7yqo698WRuDClF0UJEztt98gJog3FnJqFDuckiT84HPaUu39kFTNsyfVql4czjf0ef05mDO5CGoQVFUim9aevkkCPwfrbZnw5OYNp7sPcN0+1XNXoG1O9nuY6kbr/mLovwiY+Tmik2FmlbhLjc4v5DI889bc3UbxQkzSvWs6F7xoXjHYbuESXqSEPBjpcIojRo/7MWgcoBXQbYYSc//hh6bDl+B
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(82310400026)(1800799024)(23010399003)(36860700016)(7416014)(376014)(56012099006)(10067099003)(4143699003)(11063799006)(5023799004)(6133799003)(18002099003)(22082099003)(13003099007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	w/w4EHDb/pePTPTRQ++19A8TsBi9OZ+c4Gp+gAx8zwMEEc/nG/30Yt1fKYvozhx81VmJWKMQYHwuBRQVmhTN1IqHDFQL/r/3qvNcP6zs8tSt7j4gI0RCRlzZU5gXqkNw7EgYAOMmWKF/OWuvbBF9fXVd2Rua3VQ/6tvKuqkweCp8Wk/3ammM+lU/A+F+KQGC5sHnxJrRhdP72A7Xss1br2J81tCudbkMVMo2Xz56e4B48jMtcMh16tNaKWpDEPIqW3vPXysRiEW1rWF+l/vTSCJ4hNTxfyj5OTZFqdPbGQWfHcDe4chY5ulhL78+6TwFyVbcwyHjyVukeehM776lNYqaX6R7w0Ji5I6bLb3oon5EUKNGvKOB/+DIUdmgNJbtF75+8O225Aw44981YqeTwbPo7UvNpD/KBkpJ7xAz11yg/qB5vT/w0B6I+fTfRn5r
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 17:16:55.8086
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e015f7be-6cd0-4507-1ec2-08def31559c6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF0003922E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8568


On 8/4/26 4:59 PM, Edgecombe, Rick P wrote:
> On Tue, 2026-08-04 at 15:43 -0500, Bill Roberts wrote:
>>> IIRC CRIU needed to unlock shadow stack during the save. Because it's tricks
>>> for
>>> saving the process involved messing with the stack. So it needs to be able
>>> to
>>> unlock but *only* via ptrace. Apps cannot be allowed to unlock themselves.
>>> Because, well, obviously..
>>>
>>>     As MUSL and
>>> others get patches, it would be much simpler to have one interface to do
>>> this in, and right now
>>> unlock is unused (even in the test suite :-p).
>>> I think I raised this on the other arch's APIs originally. x86 went first,
>>> and then later arm/riscv wanted a unified approach, but didn't solve this
>>> ptrace unlock part. So we didn't join. AFAICT the situation hasn't changed.
>>> So I'm worried it's too soon to unify. Or we might need to do multiple steps
>>> of unifications.
>> At this point, the only remaining semantic difference is support for
>> unlocking a locked shadow stack during ptrace/CRIU restore. Arm64 and RISC-V
>> don't currently expose a generic unlock operation because they use
>> architecture-specific ptrace mechanisms for state restoration. If those
>> architectures eventually converge on a common unlock model for CRIU, I think
>> it would make sense to unify that interface as well. Until then, I don't think
>> the lack of a generic unlock should prevent unifying the parts of the ABI that
>> already have equivalent semantics. Especially considering how it unifies the
>> loader/libc side of the house.
> The locking needs to be done after the linked DSOs are checked for shadow stack
> compatibility.
Correction, "Locking *may* be done after...", this is a policy based on 
per-arch tunables.
>
>>>     Also looking forward to understanding the security module problem
>>> statement  better.
>> Right now all the controls are opt in, and requires support in glibc, via
>> per arch tunable flags for both enabling and locking.
> x86 glibc was originally supposed to have two modes for shadow stack. A normal
> mode and a permissive mode. The normal mode would first check all the ldd DSOs
> for shadow stack compatibility. If they all have shadow stack, it enables shadow
> stack and does the lock on the main thread, which then gets inherited by all the
> child tasks. If dlopen() is later made with a DSO that does not shadow stack,
> the dlopen() call is failed.
>
> In permissive mode, it did the enablement checks like the normal mode, except it
> did not lock shadow stack. Then if dlopen() call was made with a non supporting
> DSO, it would disable shadow stack on the calling thread. This didn't really
> work, because the other threads in the app still had shadow stack enabled. Why
> didn't it just disable it shadow stack for the full app? Lots of races with apps
> doing shadow stack specific stuff while the support gets disabled out from under
> them.
>
> To fix permissive mode, there was a proposal (I don't know if it ever made it
> into glibc) where the shadow stack would get disabled on the first dlopen() to a
> non-compatible shadow stack OR the first thread was spawned. This was
> questionable to me. But there was a desire to minimize the compatibility hit
> first so it could be enabled widely. Then tighten it up over time.
>
> But in any case, lock is still needed for the normal mode right? You need to
> decide in the loader whether you want to have shadow stack for the app. Or we
> are talking about another mode, like a forced-on mode where the app will do
> something else if it finds the linked DSOs don't support shadow stack. Like exit
> with an error or something. But if that's the case, it's a decent amount of new
> stuff to me, so please explain.

Everything you mentioned here is correct AFAIK. Besides background, I am not
seeing how this is relevant here. Some of this is more a conversation about
policy vs mechanism. Am I missing something you're trying to convey?

A lot of this conversation is about the other things tangential to the patch
which is good, I just want to make sure we don't get too off topic here.

>>   The glibc folks are
>> starting to balk at the amount of flags. Additionally, it would be nice to
>> have MAC controls on them, and the best way for that is via LSM into
>> SE Linux. Normal applications can be placed in a domain where
>> they can never remove protections, and things like CRIU will have these
>> elevated
>> perms, if they are ever needed, since right now they go through a
>> different channel.
> This sounds like a new paradigm. If we have enough shadow stack support out
> there, seems interesting to me. But I would like to hear more details about how
> it works. I'm just speculating above.

No, it's not a new paradigm, the "permissions" around shadow stack are 
granted to
domains, ie groups of processes, based on a collection of tunables. You 
need an
elevated permission domain granted by CAP_SYS_PTRACE to unlock and then a
call to disable the feature, like shadow stack.

The only difference is, that we can do this with SE Linux controls. Plus
we can also limit what can have capability ptrace to even touch that. In 
SE Linux policy, it could be something like this: neverallow { domain - 
criu } self:process disable_shadow_stack; allow criu self:process 
disable_shadow_stack;

>> The LSM actually removes the need for lock flags in essence, but yeah we
>> can't count
>> on that.
> ?

In selinux, after my changes, nothing on the system will have the 
ability to disable
shadow stack via prctl or arch_prctl *except for things explicitly 
granted these perms*.
Because of that, it functions as an implicit call to a lock. However, 
that doesn't mean
we don't support the locked feature via prctl/arch_prctl, we need to support
non-lsm and non-selinux systems.

So that begs the question, why hook it via LSMs and add support to SE Linux?

LSMs - Opting out of shadow stack is a security decision, so LSMs should 
be able to reason
about these state changes.

SE Linux - Central policy, auditablity, logs, least privilege, etc, all 
the good benefits that it provides.

Now that we have multiple arch's in tree doing this, with a generic 
interface, it makes sense, and good
hygiene, to rectify this division.

>> The lore is here:
>> https://sourceware.org/pipermail/libc-alpha/2025-December/173636.html
> This seems to be about other shadow stack knobs. Stack size, etc.
>
>> For the following LSM piece, there is no hard dependency on this. I can
>> put the LSM hooks into arch_prctl for x86 and things would work fine, in fact
>> there is no getting around that or the arch_prctl interface for x86 wouldn't
>> get the LSM protections. I want x86 to get the LSM protections. I also want to
>> coalesce what we can around the around the current generic interfaces for
>> glibc. Work could be done there to start dropping arch tunables around this
>> too. I am sitting on these patches right now, because they have a soft
>> dependency on conflicts.
>>
>>>> Ill spin out a v2 with the comments, but the one thing left to be
>>>> addressed, afaik, is the testing patch
>>>> do you want that? I'll drop it, but I think that's a bad approach.
>>> Yea, I hear your point. It is good to test more, but #including c files with
>>> pre-processor switches seems too hacky. Is there anything we could do to
>>> make it
>>> in one c file? Like not the templated tricks to generate two test binaries?
>>> For
>>> example embed the switch between the two APIs in a macros in the single
>>> file.
>>> Like say we have SHSTK_ENABLE(). Inside it does either ARCH_PRCTL() or
>>> regular.
>>> Then have a global or something that switches between the two behaviors.
>>> Pull
>>> out the parts in main() into something that could be run twice?
>>>
>> Anything is possible, but is the juice worth the squeeze here? This
>> approach is used
>> already in tree:
>> - bpf/progs/arena_htab_asm.c
>> - bpf/progs/test_cls_redirect_subprogs.c
>> - bpf/progs/test_sk_assign_libbpf.c
>> - kvm/lib/rbtree.c
>> - kvm/rseq_test.c
>> - livepatch/test_modules/test_klp_state3.c
>> - powerpc/vphn/test-vphn.c
>> - x86/test_shadow_stack_prctl.c
> Uhh... that is your own changes. :)
I literally went back and forth including my change... I just included 
it as a,
"See I am joining a long list".
>> I am generally a fan of doing the simplest, most obvious thing first
>> that follows existing conventions
>> unless a really big reason can be made to not do it. I can refactor it
>> if it's a show stopper, but IMHO
>> not worth it here. But if you want it refactored, sure.
> We'll we can leave it to x86 maintainers to weigh in on the style thing. I don't
> like it, but won't throw a fit.

Could you nudge one of em?

But lastly, I just want to get back to your non-structural/style 
concerns around this patch series, which to paraphrase
and summarize poorly are:

What about UNLOCK and how does that fit in with the future and whats the 
risk of not being able to rectify
that gap?

To answer that, unlock can be easily rectified by mirroring the 
arch_prctl interface into prctl when/if needed.
Considering that this split between APIs using arch_prctl and prctl was 
initially discussed when adding the generic
prctl interface, and the arch_prctl interface was very easy to map onto 
prctl (in this PR), I don't see any reason why
unlock would be a problem if we need it.

In full disclosure, unlock will remain a blind spot to LSMs, and things 
with ptrace capability, will be able to unlock
feature bits. But this is no different then the current state now (and 
it's idempotent with an LSM involved), and we
gain the ability to see/control what domains in the system need to 
actually twiddle the shadow stack bits off or
make it write able.

But back to this patch series, it merely accomplishes a unified prctl 
interface for shadow stack locking, status getting
and enabling. From there, libc's and other consumers can start to unify 
around generic interfaces, which will help
promote things like generic tunables in the case of glibc while 
preserving all backwards compatible interfaces.

If I don't hear back with concerns that would block this, ill spin a V2 
later this week if that works for you?

