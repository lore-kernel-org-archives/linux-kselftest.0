Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794921058;
	b=wdV3aYF/OC92Tm6V8BlZ13cqm/LolYg6z0nFzDFySZjq1S1of0wl2zJGAsFmU12odhJp
	 Py2tgvnO/Sk4w5Wu1XJoyS+Zj6OANV9HsrjcnGmUkCv1V7oeJhaNnWdPO2Ss0ruv5T+ME
	 U3Ldvx8yfjYvILolZ6H0YZ24vz5jTZ1Nyl0XT9WlmP2M1boRoeIOWXC+p3HxunUJtXivz
	 X+0W3QdD6TPd78kEU00clcCEibbBWJXJLvbxpo1nGXOE4AinY5dmgQaFFax7J3oCy36FQ
	 etaZtx/f2nGi4MvIE/QhM3Y45V45S2sqsVqZ/onv9io0Gqe9C/CmaqTmKoqijtmxYKw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921058;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
	 In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+9kWJxr11lO+YgJRCHTigsu9Kn69Ixo2swPXgrPw//c=;
	b=vK2iBwu3LcqfEXrPI0LAB5PjW2qPc0DzfcGZ0zMSWm3qEKxHpPq9Emi683gIRM8AtI80
	 eNTkyooe83/fSeIqV0QyB+K0LHujZfd5wayrn5PIQov+ttYAG+/dGZqhpLhmUQ9hekeIO
	 bG1rLzbb7l3zzAcM3O6il6XTNrh3XJV6URBo0wJ98iVf9DwSVof9hol/84LZH+HrpuBPq
	 ZQnXsIfPuj3t5TJErdrbVNzQDBxvMZamCcUU4Dq6LhX95sb4fXTKLGpeRX+TvNuD9UxZd
	 z+K1z6+QtajE8TqjFg7eoeatbelBYGO/tW736Zrezd3bYLb9LBLQTaXIr48oI7faEiQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qti.qualcomm.com;
	spf=pass smtp.mailfrom=qti.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g68O0WDJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC170606A31C;
	Tue, 17 Nov 2026 13:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC170606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g68O0WDJ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC10cR3048152;
	Tue, 17 Nov 2026 13:10:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	qcppdkim1; bh=+9kWJxr11lO+YgJRCHTigsu9Kn69Ixo2swPXgrPw//c=; b=g6
	8O0WDJ2BOytMxOkpFXMOUjYWHnX455Xf2nnHMb73XKgVp66ApXQk9KOKU3Kmy2FX
	HjRk1ml19YVOia0GiPtEjNuYbrUnk9KMKmaH7SjFcGa1siyNRNnAPHByNlamBy5y
	j+bdRANwybfWwIGok47Sf33LyToTI/tr7E3uGXzYfEirXcgoywYyozBGmgGvgvqN
	wUFvPoF84hrheC9eIF7JyoeYddsvsCHmOj7BkJPw0sIMufHzC95/cEI1B1XgUqVL
	4jw1TxdebUGGrmkwIUsW3wzZpxsVQw9lWCvvREWqJnb0NYaBg046IhmRZ0/HKdrA
	nDx44tTWa9cUQmuZ0gkg==
Received: from ds2pr08cu001.outbound.protection.outlook.com (mail-ds2pr08cu00100.outbound.protection.outlook.com [40.93.13.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0mv10psr-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 13:09:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KD/ctHSQN4Qq23rHXjATog8hJ2DruAIMgRWUKQcoROKLRbHUXdUU/a8HkRXzvx2dwUiLEzuUsCiOEr4mhYrTueCqKNs7R+HrpLotXCZo0GmB2sZ4Or3KO0wD9AMHkCdcjr4Msoi+Apu7PC4kbWk/o2xG4/dVzz2pbL8P4nOUm5zQWi2aDn1t7ciSYdP5S6IbUKGbebDPDO9CCNTtij7UDKInO2JzQW2JZCmGNrRyA2laAuEul3GDyAy/I3kXJTj+Vn5bAUeX8E95scGg5btouK4eHF7+ttVx9+ps5pf5DsyBuptcXe9RDuqIg6XnSrTAV8JYNSlm1398YwXqmRTuOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9kWJxr11lO+YgJRCHTigsu9Kn69Ixo2swPXgrPw//c=;
 b=JjfB57AijIXEigB+bBCBNyy1zTHQYGFeGpTqeoHvjgTfuM0/L6u7XDVNw8z2JxNAS4OgybO/pMkDWH8P+tlFSFevGLE6VkRJ1+NkpvihDy95EeggeEXF4lBs+gCev6s/fz3TJ2NN84ETHkt21hCZXWOTSQVg/avpExRUIHdcLjMriXEiPJ0eNcl2AKGFi1fkRQgCi5//ah7vyHpqt159dJT63NITuk9wv7+Uf5OuIXl8TmthOIhq0w75KIzOojYSRf8cwVvOT3D3Dy6fEGDV+yW2D5+KeV+mriubMMH0uGmdYB11jxJ62ThZBVGBAv/9pbT/l5njPgAhhrxqsh0peA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from DS7PR02MB9628.namprd02.prod.outlook.com (2603:10b6:8:da::9) by
 DS0PR02MB9151.namprd02.prod.outlook.com (2603:10b6:8:13f::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.10; Tue, 17 Nov 2026 13:09:47 +0000
Received: from DS7PR02MB9628.namprd02.prod.outlook.com
 ([fe80::c55e:2187:1013:66d8]) by DS7PR02MB9628.namprd02.prod.outlook.com
 ([fe80::c55e:2187:1013:66d8%5]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 13:09:47 +0000
From: Radim Krcmar <rkrcmar@qti.qualcomm.com>
To: Guodong Xu <guodong.xu@oss.qualcomm.com>
CC: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert
 Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Randy Dunlap
	<rdunlap@infradead.org>,
        "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>,
        "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>,
        "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>,
        Andy Chiu <tchiu@tenstorrent.com>,
        Florian
 Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Andrew Jones <andrew.jones@linux.dev>,
        linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v9 3/4] riscv: hwprobe: Introduce rva23u64 base behavior
Thread-Topic: [PATCH v9 3/4] riscv: hwprobe: Introduce rva23u64 base behavior
Thread-Index: AQHdcEiWiDRZftbL5ESEOEwGp9ZFobcySUOA
Date: Tue, 17 Nov 2026 13:09:47 +0000
Message-ID: <DMXIDXA2V2S5.M1C8TT9U62FQ@qti.qualcomm.com>
References: <20261109-rva23u64-hwprobe-v2-v9-0-ae846c5c7178@oss.qualcomm.com>
 <20261109-rva23u64-hwprobe-v2-v9-3-ae846c5c7178@oss.qualcomm.com>
In-Reply-To: <20261109-rva23u64-hwprobe-v2-v9-3-ae846c5c7178@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR02MB9628:EE_|DS0PR02MB9151:EE_
x-ms-office365-filtering-correlation-id: 8235319d-4501-45b9-c75d-08df44ac0e64
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|22082099003|18002099003|6133799003|11063799006|4143699003|56012099006|261026140227099003|261028144727099003|261022075727099003|261009223027099003|10067099003|261021121427099003|261102123227099003|261102124527099003|38070700021|261026121527099003|261022105027099003;
x-microsoft-antispam-message-info:
 FWW8nszB0kz5xi+czZAAB3MMfG0SFvRycrW1L8i7nC43/DQQGR/1yywO7VA+nP3+oAlOF7Q5P2dfZmVtbPAe4/QGTSEC7CkyFeYu4LTl+fc+yh9J/6slTlBAMsrX4GsPH25L5D+9TYBK3osacmoBLvwLVpMw9AUlDVBpEm0lUOBlSYNZbviQgGtnZZ0EgRcTj2o/uH0dmUKgeGBkHw/l96V1WgUgR/hb9C0KsNI614CyuF2WkFw+jadkDFnmng2cgluyckjBcbR0htJt9N9pBBrDvAaYhXaG6WZsSQ3UhAyzSsQEnDitwm2qQXbQ7PN9/GxekEzBOXUEilKzfBWm3t4uuOAl+GFUfP314Y9TWmeZidXGweKDT2ey2z8tDzGmmCYdRuaO489Ar4EAAIdUAHe/bPqVvjwv5W4PDxpEGtK1oOy5QqNIap8ndEuZIOx4tOiq3rWREusgAT9srFMnAGkLQ/N2FCU0LAh+YaCkYmGlzj7Yl1OGPxrqvoI73ndtUu+ZXKqJZWR6m0bKjKRx9HFhgAXAvsYyvV95hUkLZP3q92z+vgfilSfDA+Q+/nN5O1c12cZlKM0PD2bnJCZKvD1qE5MZ6fKvP6ZTTWyProNyUwxRg044FFvEL+2MPDJOdjSN5orlZmIphi/pYz2BprhYysTrf4Ff7o65e6mfRhQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR02MB9628.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(22082099003)(18002099003)(6133799003)(11063799006)(4143699003)(56012099006)(261026140227099003)(261028144727099003)(261022075727099003)(261009223027099003)(10067099003)(261021121427099003)(261102123227099003)(261102124527099003)(38070700021)(261026121527099003)(261022105027099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YitjeTZhbGl2R1NKTGZ3M3p4dkJwWUJhbUVqd0c5TEhhYlBUdUl1M2xNbW4r?=
 =?utf-8?B?TVY1MWsvOEtQSGxaT2tEVElPL3o5NmNHVVdNbFJTQzRKUUl4My9ZK0FqQnE5?=
 =?utf-8?B?WFF2Q1dxS1ZFWTZVT3c5TXVFYWxnTVNrRHRyMnVKLzZKRENRMFBkKzFKT1Jm?=
 =?utf-8?B?M2djdURiUngya0tUZTFJQzk5bTN1TkpZRGlxVU5jUldEQ1Izbm9sdWwxZGU1?=
 =?utf-8?B?cTlVVlpQdEhUNUZCWHl4YW1BVHYxUXFtenhrR21KUTlMUEs4VG9rZjFFSHZP?=
 =?utf-8?B?S01zNkFvTnVmTW84S2lDWGY3eXM3azc2bk1acThQdVhCbDF3Um9tWlJWNmRC?=
 =?utf-8?B?YlNSMGc3WVZGRDQzWEZlNmdQTmRab29VcWcrSEVKeVpLaEZGbDg3UWdoL2o3?=
 =?utf-8?B?K0VzRXd6aFVVV2lWTEZWN1NoSkNsU3lUZUlFNW9KL1hrR1lQY3lMZ2JGQ1lC?=
 =?utf-8?B?ZXhSTkh1OEozQkFKYVNvR21GS1pzbGtaQnZtdTJWN0k4SXVPZ3Q0R0xhZ01R?=
 =?utf-8?B?Qk1ObDkzYS9tVTNCLzJkeEdDL1YzR0dzcHJRYm5pQ2tucUk4bGZ1N1Iza1M4?=
 =?utf-8?B?bWYyV0t1Z01IMEVsMURjcnZxYXNJNmE5ZmloR3FIN0h2eGwyanlZeWVHbm0v?=
 =?utf-8?B?K2IwbkQ0UFZwV0xOTGZzUlZhTC9QWGZ2d25CWmZBS1RRTjROa3owUUpLQ1Z4?=
 =?utf-8?B?QS96MjdTZUJNaHdSR2JGTE1SdHRHSU54RFBVQnV5UkFIU3ZRMXVqWW1VbzFE?=
 =?utf-8?B?dmExSXZrdGFaSTJmeWVSVll3VytaRnI4bHhvV3gvTWgxM2lqR0FpVm9xWlI5?=
 =?utf-8?B?a3I5YXBYdVhqWXhuaVBTdkwvRERGWkZkT1hUMXpDWlpUN0tJTStvdWhvU2N4?=
 =?utf-8?B?ZUJZSS84cE5yUUwwYmVTZ3ZSdFpheDlyc25ldHN0dWMvWHR2c3NMY3A1am82?=
 =?utf-8?B?QTRtN1R6WGk2ZllmS05vSURIVmcxam5sNWJ5a3E3WG5ZMWVrbitoYW9RMjZu?=
 =?utf-8?B?Y0N2YlAwMHdKbndnNFNaN3NSQXVWYm5GK3VkSFN5ekxwaWZxa1pGendRM2xn?=
 =?utf-8?B?Z1dOdEZzUE9nZjE1b3NtNlc4Vk5lSE5ZVU1mcFJ0OWVTZFRma080a3cydzZE?=
 =?utf-8?B?dE5SaENiYVE2ek1RakhZZkJvYTFzVHB3Wk0vOGpZVk0vWm0yL0Fob3BRcWMv?=
 =?utf-8?B?V0xhdTdFVWFvWVhhcGtrQThPRXRSZUhLNU9Kcm5tN1AyVWFNZGpRdzhYTGF5?=
 =?utf-8?B?eE1WWEt2Q3cyUzN1dnlTUW14T3ZYSk5xU0lmUURXelIvQjg4cmozUHZ2ZFkx?=
 =?utf-8?B?eGNFUTN6UTBad3JHbEFsTkw0OVhGeFV3a3grMFlyUWI5NDY1ei9wNUQ1bW5K?=
 =?utf-8?B?VjVhNVVIaVp2VWFPMENtUTBVVHJRcXpJeVdGdWxPRm50YnB3RDhzekxjQk9a?=
 =?utf-8?B?NlF3emlHRktOR0NIeUt2Q3R4eVVRU0VaNUV2T1pFQU9MdEFRZFM1OTVhMUVt?=
 =?utf-8?B?T3pMUjRqNVNSdGJiSDlBUVlaajRVcHVjTDlTdXdkUG41MnpTU2MxRm5EM3h0?=
 =?utf-8?B?ajQ3ekNnQ0pwcjlQRjBuRSs3ajZra1BNVGFrbmxxZmx0UFBlT001ZHlGeWlZ?=
 =?utf-8?B?VVRJbEtLVGwyKzZrTkJGSW9FZDJIL2VuRG5pOGFlZHpBSXcvRkJPTkh2U245?=
 =?utf-8?B?NHQ0dTA1cVhvSVFoY1cvaHlzd0Z3R1oyS0lKdDRHKzllb1dOUU1XY25qZkZk?=
 =?utf-8?B?a3hWUVdkcFZZcEpjVVo0ek5uclk4aFZXNFZ5bkd6SEpvR0p3VFAyMC9pMGw1?=
 =?utf-8?B?cjlpOE9yV09VWVBLdEQ5NzBIWHBoRkF2VTJqaG5BUUsrNkRSVFFkZ1RrOWdz?=
 =?utf-8?B?OCs1dG1Uc0VFQzlUbGszZkorN2tBdXdTSEwrTmdrWlB4eVJqSUU1ZHY4YjV1?=
 =?utf-8?B?ZFhkM1dIa2VrbGJxa2FLZTFoUldqWnVMSG1vOWQvcnZXbU5EQkkrRUNlK3VQ?=
 =?utf-8?B?aGtneU1GS0gvZFJnUVNiZi9aYXFFUHZjVEVGWEtjOEdyekl4WGUwVVdrREsy?=
 =?utf-8?B?SlpWckFSa0RLeW1yVnB1M2I4OEJRRWZFNzFLSFpxZC9ZemlVWTNNb2c1dFFa?=
 =?utf-8?B?RXNBT2JxQ0QrUERnMFBZYTRwcWFRSlVNMjJCV255K0k4eWl0MEZYYlFlOVhP?=
 =?utf-8?B?ZENNSXEwa3FTc0FLNUNRVmxZT2ExdjAwOVB4bFR0RFJZbXFzVTIzaXI2cDh5?=
 =?utf-8?B?aEUxdWdxcXVOTjV1VUQzcWFZVjN2RGtzS2w3WEF1bmJFUjlhUlRLM2ZoblY1?=
 =?utf-8?B?UndDTDBJWlRqTjIwdU9XQVdia1BFOGc5Wm9VWlpHRy9mUm5ydXdrMVYrT3ZP?=
 =?utf-8?Q?MxRUcUESLVbH3kIc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <17C9CC70F58E2E4EBC28EA7F59E109FD@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	g5cLTn4gqQwZl9h+zGH+55gytherLN2Gqlmf/cOTxwQQsQc+NrchbBhcQXtrh0AbE4NqzmC/CHRvLTPgVViSzNQcw2LQY/wGchd3EmkxEPpmCcP/+fODM72wBE3zpT8aiDr5NN+8+YAcuFuNwKHSNrKYwDHC8eyY2d6583GQdDJFbkR5pKEwFkuIqPHq4TUQevhbt/Te4tNFL1Hend1pKEmskmFIPAnTr896KvdpR7ZiupRBxuqCpWNLIDiqmKmR9bmezxSijTOeB6KRWBoDDXTQIgIELvCQS/AQ/QH2wHoLQqJmQoXDamuOAqQPOIySNt5n45HjcBqGgZWe2n/9Uw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5smfjXhnNSoIOmRTrR9CyiRQP45GSYc8nxji2w1gpwPXJ7QCTr298K6p3GJ/bPE2gKjdpGt6EhyHyTXQSkeJPNB9YM7DHgP8p02HLIMSLMva8T2ltJMsSdsL0fB0mOtigyo/9/ePt6QYZgwcGJQePp0tHvFBUwc+LuU0MbdPjTpzJ5b2Hftwg5dkoKUvzQYG7Ny+09v6JEK9ZNuNLfyq7fqVoP74OlqrXTuQXIW6DN+EsbN+2wB8+mAsw8wAaMtSLgnP5NF6ii/RlXG/e1b/7XHAbAHFtDfchRAubAdz8Tknf0j3NngQHNb6MdPng987p1Ff0TsrEwIUe4ijkwIKKgOets8CaXsnmgyCbJdSUj9rW+z38OpAGa4d74xQFid1qb4HnofpbN1Ukwc78rSgqtKSB5HPnn1xjtvaDW37SLD2GxCngAXPW7I2TWGRk5LXVAQsx5fj5elqIrWAsCRI280xxUGD9+NrJFDg8fuC3iBUKDh3mb5q9CxQGLfblavkV4MFwFYnF1dInEDecvEqFfwM8rknBHLAjmeNwb6jmxyiTOclEzfBvLfrlUEC24NK7tJGyQRtw4B++wufFOORWr8hZV8Yp+1lxa7/NRR6rb7yjyIJr9TIFoFot+P8E5Bu
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR02MB9628.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8235319d-4501-45b9-c75d-08df44ac0e64
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 13:09:47.6253
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B9MMHlr/z4w5M0PKjbbv3mLMUskxwBGFuTROoYLerupxsxzXbWKvBW+Yx4g5x7/HAF3y2MrX4iqOjZrei455S0E5fsEpIXCdI51raIqZ+I8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR02MB9151
X-Proofpoint-GUID: M57QbB2J1HJKygXvZG1tX_E_62RBbyzV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1MiBTYWx0ZWRfXzSJb55pxJpTL
 IqZnnQcYLexyHrIKJza25iax3UMvFwNiFT9OFc8E3cdrlB4x5+Isp3d9GBvxFyBAVchcv1amBfQ
 tM/2jOWlX0lx73T3EsyKSwxuNBRePhw=
X-Proofpoint-ORIG-GUID: M57QbB2J1HJKygXvZG1tX_E_62RBbyzV
X-Authority-Analysis: v=2.4 cv=Cuwq4X4D c=1 sm=1 tr=0 ts=6afc5226 cx=c_pps
 a=K3WqU0CFElt1sixC1y5dJg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=f7IdgyKtn90A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=5GukrH6rrJpwUPyuye8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1MiBTYWx0ZWRfXzH8LQ2QGSe7W
 jlkxgFs6ceHpVxflUYvA9L6k8N3yM4LnSloyqsOgdOp3a9kYrWwL9PFmQmUVA2oBRwiiPTAqL3Z
 gAI9V5mOxMPjoKmfBOL/RBy24J2DIRinuo9zDICLTsbpBecnaNkBIXpn/o3ZMl+sn156aEQFU5Y
 OPkTzU8ZJlrLFi3xWVjyp0IDXibMNhS++G2Wd76dXRPDLiSjuJk8zB/BDWo1nOJFhm5enKy4bMo
 5xIs/W+88ycVd93PNk1LqC43z8SGmq6J5xFvVpQDxv3CJ1Aoz8cdfXCsohSUA/6mQv/KtU1BXah
 MGn2sxn7K9rK0kNKvTMEYxfn9Ibnwsnf8Zx2HJojmfhsnVyBTHx7rNko1W1E/I+roLtN78vevI2
 AKFUlzeq1fOY28g2t6BYh9Ctl9vdBTa3ZYMLCC8/lqilVZM/VurxI/jkOo6Rt3hAKTGCEhpM9DO
 H2Y/x/13Hsqf4CkDBNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1011 priorityscore=1501
 spamscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170052

MjAyNi0xMS0wOVQwNzo0NzozNi0wNTowMCwgR3VvZG9uZyBYdSA8Z3VvZG9uZy54dUBvc3MucXVh
bGNvbW0uY29tPjoNCj4gUHJvdmlkZSBhIGh3cHJvYmUgYmFzZS1iZWhhdmlvciBiaXQsIFJJU0NW
X0hXUFJPQkVfQkFTRV9CRUhBVklPUl9SVkEyM1U2NCwNCj4gc28gdXNlcnNwYWNlIGNhbiBjaGVj
ayBSVkEyM1U2NCBzdXBwb3J0IGluIG9uZSBjYWxsLiAgV2l0aG91dCBpdCwgYQ0KPiBjb25zdW1l
ciBoYXMgdG8gdGVzdCBtb3JlIHRoYW4gdGhpcnR5IGV4dGVuc2lvbiBiaXRzIGFjcm9zcyB0aHJl
ZQ0KPiBod3Byb2JlIGtleXMsIGFuZCBzdGlsbCBjYW5ub3QgY29uZmlybSB0aGF0IFBNTEVOPTcg
aXMgc2VsZWN0YWJsZQ0KPiB3aXRob3V0IHByY3RsKCkgY2FsbHMgdGhhdCBjaGFuZ2UgdGhlIGNh
bGxpbmcgdGhyZWFkJ3Mgc3RhdGUuDQo+IFVzZXJzcGFjZSB0cmVhdHMgUlZBMjNVNjQgYXMgYSBu
ZXcgYmFzZSwgc28gZXhwb3NlIGl0IGFzIG9uZS4NCj4NCj4gVGhlIGJpdCBpcyByZXBvcnRlZCBm
b3IgYSBzZXQgb2YgQ1BVcyB3aGVuIGVhY2ggb2YgdGhlbSBoYXMgdGhlDQo+IFJWQTIzVTY0IG1h
bmRhdG9yeSBleHRlbnNpb25zLiAgRiwgRCwgQywgViwgWmljYm9tIGFuZCBaaWNib3ogbXVzdCBp
bg0KPiBhZGRpdGlvbiBiZSBwcmVzZW50IG9uIGV2ZXJ5IGhhcnQsIGFzIHRoZSBrZXJuZWwgaGFu
ZGxlcyB0aGVzZSBhY3Jvc3MNCj4gYWxsIGhhcnRzLg0KPg0KPiBDby1kZXZlbG9wZWQtYnk6IEFu
ZHJldyBKb25lcyA8YW5kcmV3LmpvbmVzQG9zcy5xdWFsY29tbS5jb20+DQo+IFNpZ25lZC1vZmYt
Ynk6IEFuZHJldyBKb25lcyA8YW5kcmV3LmpvbmVzQG9zcy5xdWFsY29tbS5jb20+DQo+IFNpZ25l
ZC1vZmYtYnk6IEd1b2RvbmcgWHUgPGd1b2RvbmcueHVAb3NzLnF1YWxjb21tLmNvbT4NCj4gLS0t
DQo+IHY5Og0KPiAtIFJlcG9ydCBSVkEyM1U2NCBvbmx5IHdoZW4gRi9ELCBDLCBWLCBaaWNib20g
YW5kIFppY2JveiBhcmUgcHJlc2VudCBvbg0KPiAgIGV2ZXJ5IGhhcnQsIGluIGxpbmUgd2l0aCBJ
TUFfRkQsIElNQV9DLCBJTUFfViBhbmQgdGhlIGhvc3Qtd2lkZQ0KPiAgIFppY2JvbS9aaWNib3og
ZW5hYmxlcyAoUmFkaW0pLg0KPiAtIFVwZGF0ZSB0aGUgUlZBMjNVNjQgZW50cnkgaW4gaHdwcm9i
ZS5yc3QuDQo+IC0gUmV3b3JkIHRoZSBjb21taXQgbWVzc2FnZS4NCj4gLSBSZXZlcnQgUklTQ1Zf
SFdQUk9CRV9CQVNFX0JFSEFWSU9SX0lNQSB0byBoYXJkY29kZWQ7IGRvIG5vdCBjb21wdXRlDQo+
ICAgaXQgZnJvbSBJLCBNIGFuZCBBLg0KPiAtLS0NCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a2VybmVsL3N5c19od3Byb2JlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jDQo+
ICtzdGF0aWMgYm9vbCBod3Byb2JlX2hhc19pc2FfYmFzZShjb25zdCBzdHJ1Y3QgY3B1bWFzayAq
Y3B1cywgdW5zaWduZWQgaW50IGJhc2UpDQo+ICt7DQo+ICsJaW50IGNwdTsNCj4gKw0KPiArCS8q
DQo+ICsJICogRiwgRCwgQywgViwgWmljYm9tIGFuZCBaaWNib3ogYXJlIFJWQTIzVTY0IG1hbmRh
dG9yeSBleHRlbnNpb25zDQo+ICsJICogdGhhdCB0aGUga2VybmVsIGVuYWJsZXMgZm9yIHVzZXIg
bW9kZSBvbmx5IHdoZW4gZXZlcnkgaGFydCBoYXMNCj4gKwkgKiB0aGVtLCBwYXJ0bHkgYmVjYXVz
ZSB0aGVpciBlbmFibGUgYml0cyAoc3N0YXR1cy5GUy9WUywNCj4gKwkgKiBzZW52Y2ZnLkNCQ0ZF
L0NCWkUpIGFyZSBtYW5hZ2VkIGFjcm9zcyBhbGwgaGFydHMgcmF0aGVyIHRoYW4NCj4gKwkgKiBw
ZXIgaGFydC4NCj4gKwkgKi8NCj4gKwlpZiAoYmFzZSA9PSBSSVNDVl9JU0FfQkFTRV9SVkEyM1U2
NCAmJg0KPiArCSAgICAhKGhhc19mcHUoKSAmJg0KPiArCSAgICAgIHJpc2N2X2lzYV9leHRlbnNp
b25fYXZhaWxhYmxlKE5VTEwsIEMpICYmDQo+ICsJICAgICAgaGFzX3ZlY3RvcigpICYmIHJpc2N2
X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKE5VTEwsIFYpICYmDQo+ICsJICAgICAgcmlzY3ZfaXNh
X2V4dGVuc2lvbl9hdmFpbGFibGUoTlVMTCwgWklDQk9NKSAmJg0KPiArCSAgICAgIHJpc2N2X2lz
YV9leHRlbnNpb25fYXZhaWxhYmxlKE5VTEwsIFpJQ0JPWikpKQ0KPiArCQlyZXR1cm4gZmFsc2U7
DQo+ICsNCg0KTG9va2luZyBhdCB0aGUgY29uZGl0aW9uLCBJIGZlZWwgYSBiaXQgdW5lYXN5IGFi
b3V0IGNvZGUgZHVwbGljYXRpb24uLi4NCg0KPiArCWZvcl9lYWNoX2NwdShjcHUsIGNwdXMpIHsN
Cj4gKwkJaWYgKCFyaXNjdl9pc2FfYmFzZV9hdmFpbGFibGUoaGFydF9pc2FbY3B1XS5pc2FfYmFz
ZXMsIGJhc2UpKQ0KPiArCQkJcmV0dXJuIGZhbHNlOw0KPiArCX0NCg0KQ291bGQgd2UgYXZvaWQg
dGhlIGlzYV9iYXNlcyBoZXJlIGFuZCBqdXN0IHJlcG9ydCB0aGUgYmFzZSBhcyBhIGZ1bmN0aW9u
DQpvZiBvdGhlciBod3Byb2JlIGJpdHMgKGFuZCB0aGUgYXdrd2FyZCBQTUxFTik/DQoNCkkgdGhp
bmsgc29tZXRoaW5nIGxpa2UgdGhlIGZvbGxvd2luZyB3b3VsZCBkaXJlY3RseSBtYWtlIHVzZSBv
ZiBhbnkNCmZpeGVzIHdlIGFwcGx5IHRvIHRoZSBkZXRlY3Rpb24gb2YgaHdwcm9iZSBmZWF0dXJl
czoNCg0KICBzdGF0aWMgYm9vbCBod3Byb2JlX2hhc19ydmEyM3U2NChjb25zdCBzdHJ1Y3QgY3B1
bWFzayAqY3B1cykgew0KICAJLyogSU1BIGV4dGVuc2lvbnMgYXJlIHJlcXVpcmVkIGJ5IHRoZSBr
ZXJuZWwuICovDQogIAlyZXR1cm4gcmlzY3ZfaGF2ZV91c2VyX3BtbGVuKDcpICYmDQogIAkgICAg
ICAgaHdwcm9iZV9leHQwX2hhcyhjcHVzLCBSVkEyM1U2NF9FWFQwKSAmJg0KICAJICAgICAgIGh3
cHJvYmVfZXh0MV9oYXMoY3B1cywgUlZBMjNVNjRfRVhUMSk7IH0NCg0KV2hlcmUgdGhlIHR3byBS
VkEyM1U2NF9FWFQgYXJlIGhhcmRjb2RlZCBiaXRtYXNrcyBvZiBSVkEzMlU2NCBleHRlbnNpb25z
DQphbmQgaHdwcm9iZV9leHRfaGFzIGlzIHR3ZWFrZWQgc2xpZ2h0bHkgdG8gYWNjZXB0IGEgYml0
bWFzayBhbmQgcmV0dXJuDQp0cnVlIGlmZiBhbGwgZXh0ZW5zaW9ucyBtYXRjaC4NCg0KVGhhbmtz
Lg==
