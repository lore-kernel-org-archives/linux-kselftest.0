Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147DB2931D5;
	Mon, 14 Sep 2026 17:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789406528; cv=fail; b=kXK4Ii4RSeqkomVCeOn+ooiF48GAltsHBCPgCjVP+djbm04ZPzmzAFmXHGcvbLLNwnVUPtIZSkpQeBkTsIkEiGeOWkSI+4OP/389hijFDoWXCsC7TaSfNYQygzO2km4tE1a1+uX1P1ZPj/RWN880kozXUhMeTKRwtV3L6xpmVNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789406528; c=relaxed/simple;
	bh=IfcYGsTyyj7C+X5QXywBnDeWBwhMfMWtSom3gIoXhbM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mB3VjsiFzmImWt/E7IOKpNm9nWFBtJEMpofHxpSE+aFfcIQssyvD1I740Je7TxKb+RdPs+nLWf5OS8hMm6MAmmorxshZI222wPZDI0Q09zU0Ee7g6/50hw4Mz6V7r0rVomVdZyqno5IAPMi1KKOV4BsCoVpno5ETaNQ077jXoUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hpkvq6XP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=U+wwBOHC; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hpkvq6XP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="U+wwBOHC"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EEQu0M1563493;
	Mon, 14 Sep 2026 17:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=IfcYGsTyyj7C+X5QXywBnDeWBwhMfMWtSom3gIoXhbM=; b=
	hpkvq6XPJTADQn8ZdTKyOm7ATMuhaf+3YYNKkrLR5jDpCJMGaYNNVvy6M0VrPJIQ
	lFA7HypocjtYxAUmi5rnUiClsI0GVulf6IPLet6equ512EcgujaMuTUnmD2vCZgi
	AHajCxbD4BTnqxJLA4chZwKooHTFNMOrw9AEfOJJ6L+er2ZoKEWY3+mkEHhT7X4V
	5ad0Sow1qivS07UUk8mCflBm6KfuFhIDtqJ7ty8T0aZnKYr18+TpW7pxX5P4hPtN
	uEdMPACv4/Nw17U2xqZkvQVEWtkhJ8mgzrycaTb2VPpm+crHKTYX8b+wFprphU5w
	QMCXN/6cRjEbqKHkINzmHg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gmy9rt6t6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Sep 2026 17:21:51 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 68EHKLcV007591;
	Mon, 14 Sep 2026 17:21:50 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012033.outbound.protection.outlook.com [40.107.200.33])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4gmw6n918w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 14 Sep 2026 17:21:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I8JugKdRurucxOGkjdtzSmY0mAmzxDfHCKcPbkl2vak45wqRheraNNpg84XrXv530mMQVEPeoxswcNoDGqVdFcKPPFFGMXoIytYT83drN2lah8haAFmvRuA9ehstNvbo2CDPRVBUNB+wbhXw1xx/X8uV6bFRSUoKsIEt2ERCvG1SPciZeTZC2yp5MSe2cvsUJq+NQyKZ+eFnUxSujUBfHOkXq4+Zu7+MAIutkacfgGdaNKas7XmnsH/9CsVlTOoVIm90APIOYopRdw+vsPd2d6ZUf4bCcr7WcMrcaDA7ksb6ir5G5iWAix8/N4LTXZ+0veNQUyWVrvCQ1G7oLry6BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IfcYGsTyyj7C+X5QXywBnDeWBwhMfMWtSom3gIoXhbM=;
 b=fyqnND5Zipz8S5I0aTe2LvLH/wy/NZ62RO8/ILxxFUEcJsKQGHBYIzZP9iR1uVBNUIPdi/SqTg0YRoAzgkXnDfXKsjluRzY3WL/i11KxX+yfot2EqSGCsV/3JL9eqx9Ki2UVDjh2u1cr5m1yQuNQl7m0pJnlGJL7yC4QekhufePKOLfZ/7t2XVgPQOohfrWaOBg64DOZMB/+oYkmtHpasMcaPpoGSq9L7AG4vXr1xK+fcbDNYNPxa/hCKgCXaIIByiZmQEVlNVIgSAsPrMrvfrzM/39awe8b01VnazNdxZUqgGTm5J09ScMUNxiydlJepHe/YEtpFMjLsH7KfYf2ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IfcYGsTyyj7C+X5QXywBnDeWBwhMfMWtSom3gIoXhbM=;
 b=U+wwBOHC2OXwg2JheQWIFT5jPnJ3juUM7ZHbtpRWYtddmQ7C4fare6RwAO7zhW5n77MxKzK1MbByQymKKjDRW5jwLPSsB7dqZ9IX8jhg5j3hkESAjVeUF1jmbQHcg5jh6UlAM9WJkveAgDnuAoIVvJGwAvKwRmUY79NX4k24xtI=
Received: from PH7SPRMB0087.namprd10.prod.outlook.com (2603:10b6:510:2b1::12)
 by DM4PR10MB6112.namprd10.prod.outlook.com (2603:10b6:8:b7::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.8; Mon, 14 Sep 2026 17:21:47 +0000
Received: from PH7SPRMB0087.namprd10.prod.outlook.com
 ([fe80::527f:36ac:6913:b2ae]) by PH7SPRMB0087.namprd10.prod.outlook.com
 ([fe80::527f:36ac:6913:b2ae%6]) with mapi id 15.21.0428.004; Mon, 14 Sep 2026
 17:21:41 +0000
From: Haakon Bugge <haakon.bugge@oracle.com>
To: David Laight <david.laight.linux@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Peter
 Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Will Deacon
	<will@kernel.org>, Boqun Feng <boqun@kernel.org>,
        Waiman Long
	<longman@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Shuah Khan
	<shuah@kernel.org>,
        "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>,
        John Stultz <jstultz@google.com>
Subject: Re: [PATCH 1/1] kernel/locking: Add mutual exclusion self-test
Thread-Topic: [PATCH 1/1] kernel/locking: Add mutual exclusion self-test
Thread-Index: AQHdLkjXOr5CvJFeb06L+v9F7yCyjLbN/EOAgAAxYACAAFDCgA==
Date: Mon, 14 Sep 2026 17:21:41 +0000
Message-ID: <A1E4F810-7A75-4AF8-9DE4-11BBA101F5E5@oracle.com>
References: <20260817130239.343594-1-haakon.bugge@oracle.com>
 <20260817130239.343594-2-haakon.bugge@oracle.com>
 <20260914103545.3db6eb45@pumpkin>
 <6546A220-4B85-4780-8B45-F8B35D24139C@oracle.com>
In-Reply-To: <6546A220-4B85-4780-8B45-F8B35D24139C@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7SPRMB0087:EE_|DM4PR10MB6112:EE_
x-ms-office365-filtering-correlation-id: 6f973557-5977-495f-0245-08df1284a4b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|23010399003|38070700021|4143699003|56012099006|6133799003|18002099003|22082099003|10067099003;
x-microsoft-antispam-message-info:
 DbAqVIhfaKKdzkbekgvv1j5HPJKXxIp/jTX1D77jg7GuT9GCZ2rOIphZ9oIxUAx5mEBxKIP1ouiLu/2a/gsI7J9vGcXeeWZI9mvAtIa2HHi8QvUlEp+Df+g8TtaajsIBD0b4d8jjoz3OD4zMcMF4PaoTgaimyW8mwE1lDd45t6rtichjg3VwekkRFcXPM/hmXgmwE2VGG1mSp2h58TDOtOk3aGdh/25GeDUUGcJCHzgUOVcRAO9qI4fXbciIaef3whoDTj1lktYRsD2H/ihGxo3yInwobbBv8jikZsV75+8VromuKnR2eoUDgzc9bkv+xMbzVtj8m6vrAdzrrnh6ozbzKPa7jM4HjlR4q1UQv9YbRZRHCBZFSHsFhQXVUFcWHNY5F1P0HcsxfurnHuXJxRTFhF7A30FoTPZU8+SYenJE4px4JQSw0kOi7qul27qeh8r6KShoMquJTnFg4L0FakrKHmGNk6XCGcGpEEvAr1oOhBRZLvlk1y+PO9artn8NSYB2AhAtX0xUMGzPg0ZwcgIdrW07VUw9Ui9ZRNzwTYw5Ktl7uT1zSuWje6rc2jN1ET15HqttdPvHfVR3NQ48oJnrVsVtL0/fjTSHRO/iLYwrUqsBkiwwljSsGPnxG/4sasvd4jOS6PzFReY22t66zyRBBTfDJ74cx6Yf7iPPbvrXBqBme3CcGvGe4YnW1Te9cT/KivFK5uClClbVMoCKVglhr/qBMq3FZAefoFa5zPQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7SPRMB0087.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(23010399003)(38070700021)(4143699003)(56012099006)(6133799003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NnlyaUJXa1hTYVFMRG85NWNPVkhMRTNoeDdPSW9RdWE0MjJ4MjkyVFkwekVE?=
 =?utf-8?B?dWk1MCt4R0YvOThZS2N3Z2dkMU1KeWxwbTRCN0VmOWRZWUZOcVMyM3V5eWNW?=
 =?utf-8?B?T0pLbGh5RGs4Vkd2RVNzWHkxaGlOeTlVV1JvMWJ0SG81RGxxQWg1RXlJMmFp?=
 =?utf-8?B?L3JjWTFTV3hUcnE3QUE4WDg3Qi9HL1ZiOVU5b012KzMvYnNPLzVMSHZFbUEz?=
 =?utf-8?B?WndJVjVDWDN6TFdLckdYVTFrazNYOXFjMmtHcVZ0MTd1bXJlNGFKQjhlR2ZC?=
 =?utf-8?B?Z1lydW1FS2tIT0tXa0c2SDJaR2Z1L1g4dHQ1Z0xvc25EQnljK3lWa1ZsK1BS?=
 =?utf-8?B?NElYOU9xOUh5VzI1WTVaWFhqekZJRWZvNlljanJmWGRmVklTWEYvS3RsdHlJ?=
 =?utf-8?B?STdRaFNFYnJKdlJ1VnpHN3pwVjMyTllzcm9yWk9SRERNZ1RabWJ3RVV6MlVH?=
 =?utf-8?B?WkhoNGJ5YkJRYVBmN0txOThkdHNLZXNMUlE0V0wxclV2OHhXOWtrWlJNeTZX?=
 =?utf-8?B?V3NReG1KMVBqZGpBVDlkRFJGMWhDRWtiaGhTQmR3TmxuaVd1bDZza2M5WHlW?=
 =?utf-8?B?YzN0VXRRNGUwMjNqWFBDQ3FFRXBjRkFtRzFneG5qd2J3Ry9OalVwWnlaK2Vk?=
 =?utf-8?B?eVdwNndKd09OTDMrcXJLOFZydEJrdWJnRmNmQmh6eUd0a09UNDBiaEgrQzNw?=
 =?utf-8?B?a2kxSmVSNmJPcE5JeVAzMUI0cFJVV0pvekpZN1dnMWNxOFBPczdXeTljQ2xI?=
 =?utf-8?B?eWZjTUljcCtXa3N5WEhpdUNHTm1DTkpySjVtUDNRS1FmeEpXUUtkamt0dlpM?=
 =?utf-8?B?WEJ6clZvdVlUaCtJOUtINy84TFNkYytNa2YxdHYzSnBxL2J3S0xBeU1NV3F1?=
 =?utf-8?B?OE0vaDRXa1RxYU1vN2UvU3ZYYnFKSE5RRXpoMmpOc29uNGl5bHVhT2FobWdE?=
 =?utf-8?B?ZjNEN2lCcFlKRXZ6WkgwdGM4OFVyNjNWbjhPT3VhaUhRYTU4TjhzRC9veWVk?=
 =?utf-8?B?U2VYdnNsWVdrNUdtbUtPT2JYZ1FHa281RGZQTnBqeGVxUmFXL0x3UVl5T1ZI?=
 =?utf-8?B?QzFFZ2ZkRXh0UXVJQnhYZDRSZGttK0dVS0N2UGRGNDFTd3F5T2gzNkNmNVdK?=
 =?utf-8?B?MlZ4YUMwZ1NDYUVFZTBiamFBVE4yU2hqS3lWamg3dnlhaWIxV3l6dVllUlRE?=
 =?utf-8?B?OFB6VjV5NmtUODdRamRUM3c3MTc1b2I5MmFjdkNrN1Vzd2dUdHZPL2txa0xZ?=
 =?utf-8?B?VHFBYWtWOVdwZ1V4ZElUVVZzTm53L1hFcGRuNVFETldwRCttRlVBMGFaS0NK?=
 =?utf-8?B?R2lWNUNBVXRJNUgvMEFLQXlJV2x2K2w2YjBENGUwMTVYT0RhR3dTWGRodUdR?=
 =?utf-8?B?am16dXBneG1MMWM2NTRmbWp4UWhYS2o1VTRqVkNBQllQOTdkNEI2Z3RWcTkx?=
 =?utf-8?B?a2JmMVE4K0lUWVp5ZnM0dElFakh4NUt1aEN2eW1aUDhOdDFqZ3lSbDZrdHV2?=
 =?utf-8?B?bnhiY3VKbkxkU0k1ZVFrT2Uya0VRbjhpTjFhT3psSndFWnpERHhIS3d2S281?=
 =?utf-8?B?TVJKcmNaOEVVUDlKcndzMG5uUjdnN1ZYUkJocnJhRlFNdm15RENBUkU0eFYz?=
 =?utf-8?B?UFhNVm9jdU1UNlNMRE5Bc2dINnhUa3VoY202Yms0ajJyc1dGZXlFNGJHNXhz?=
 =?utf-8?B?VUhML0F4Wm54R0txYnB4eWw4S1BERm9WSXd1eVVGYmorYWJPcXFnYk1zYm91?=
 =?utf-8?B?UEZxVXFnak1kTDBqcVNzSkk2dEFQdmo1WGRhOGpNcjdFNHJEMnQ3WVJ0K3NJ?=
 =?utf-8?B?ZFJsU282UStwTXBaNndsSDIzeTl3V3A4dVYybWxhVkpJZWFNZG10aXcxa203?=
 =?utf-8?B?WUYvYVU4aVFKeFRRV2l4SXNKeEthUXhpOGxWNC9pWTdiOGlSQ0hqdTk3bFhv?=
 =?utf-8?B?Nnhmd2FZSE1XQ1BoRmh5LzF3UmtvcmdUTGdpMmdNNnpwV3Y5VWpERVowcnhH?=
 =?utf-8?B?Y2N6emtnbFREY2Y2elUwd1FJeGpCRk1vMThuRUxXLy9mTlV4L2x4N1ZYbk84?=
 =?utf-8?B?VDhMWFhaSk85d2pBdWg2TGJxQXExWkV5T1k2SUVXaEw4a2NFaXRjOXpOMnhm?=
 =?utf-8?B?T1hYL01NMHBmbGhBdlVUcUxUUTlJZnBkTXJ0Tm9wOVhjOUZ2MGFPa0VyUlRL?=
 =?utf-8?B?UktmZTNSKzdMZThOTE52d21TOHdZTnRVaGk4K3JWOGZZYlpCK1REM0ZLVjFX?=
 =?utf-8?B?cjNrSy9RY3Ezdk5HTzBodWJwaDNnNkR3TTROdlFTZVdDTGVDMGhvZ3RkZlJF?=
 =?utf-8?B?TGk4d3poSmlKaitndmkraW0rNDNOZjdoWk9hZVpiVjMzZWdCbjl5aVNBa2xX?=
 =?utf-8?Q?0cHc0i+5ZaLyoTwQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E515E264D38CFF49BE1D59A0CB29F19B@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	29ZdfOTEkYQacloW9WKusrJ6s/H6+jrzgvPLuxCTtByPqXvGRVjyTiHJDNoc1LxYcDhZW2PIfu5fNEcXH9ZETAWfzMP0lGPjKWLQdAewHiWn8RqsRgaIKYMQdrv5qMCVwuhanvxKKqaP1rDmQDXEHSi7b5Lj6E39mr/lWsmW6I8V2lfNKuyZBEKMFvuVkR99urLmQ6vPrb2co2F/XFQxr+RKa+UzjsVBPioWZw9/4hXpuh2XIlK7xCSqSgdUaweh3ieZfGFt3Ft5iD0vbBmZ5Q18BfNWTauj8dcVqp7fobY/JaZaVnxH5kBkIKNY4W0/wIfM9mpnbQ4a8rhz10ml+A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QNhrYbuUbX4uAxZk6YtSv5zXsoEBw/RjQ2Dj4sVDUpaQIk8hQ9lbCHFeGovgke4TI5iSxlqHVr0KjrzbdOex0Mx9O0mlomU8sNjk+vQ26svTLETQAo5jCHLKpjFQ6oPAOxBzSTP9uyW5nu6CvxUO3DWyjefOG/Vy26iTgaO4sCIvOHK4Aspw3ApeX1vOoZAGq3JvrbVuZ0NNPNUtkaoWxRWI1XIFNvzvfbXpGPXxOL1xHe6ie1w3529SPleVsCDQeKlFHIXImI1sL2iAk7AJGkU3MEoZXJw3rEbbwzl41xTR57vWyu/VSxh1X98PSFfXsNTche8Va6JxM+P0UKf8EQuuC8hleH1ioyzosC325VjTu8r7teqhoMs4KF4/+DP+ictohy65JAyIAsUNuLSVpofajTK6l1MdVRLvUXcjIxP34F/rEfm/5UB+axPfP9JqxqByPwWDge9p/M27Xj8ER0pFb1UBK8QuThsR6abCl0MM10R+zvF4nBC4OHzNok4o1x7HYdhKKRR9FPNypGTS61tEI5fhByYYq/X5TXmjSVxT348Kyns2axF6ro6wKoL1dPEIetf7zo2Xf5r5b63nPIkhP2ZoADRsaxX62Ya06t8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0087.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f973557-5977-495f-0245-08df1284a4b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2026 17:21:41.7472
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 28g/PBbgHtHiLeFUIfVFscHHVAnTKbyZ2PrIvlmJUsuR9ig5EWkI88nruhgDp+Xjs5olBbbwMpLt5PsKmEgbsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6112
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2609040000 definitions=main-2609140246
X-Proofpoint-ORIG-GUID: X18JwINtemqcBrj_3Kje-YrmCWVNKfEn
X-Authority-Analysis: v=2.4 cv=MuvHeGae c=1 sm=1 tr=0 ts=6aa82d2f b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=GoEa3M9JfhUA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22 a=7Gl3-_t3PgB9XO-mQDs3:22
 a=yPCof4ZbAAAA:8 a=pGLkceISAAAA:8 a=PQQCu37YQEPq-72wBFcA:9 a=QEXdDO2ut3YA:10
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13533
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDI0NSBTYWx0ZWRfXx6zRf2u+vJZe
 b1AQpVNcFxQqup7wSFQpEcfPQSzI6hwHAdOyLuDLe2LyTyHEjeBCkJYgxc5z7i8NIeO1Ll6DFTg
 iyRNXxa9aXhNN1yef0DFdniLpFQunGD8RNsHQNETjifGj43MQJ2j
X-Proofpoint-GUID: X18JwINtemqcBrj_3Kje-YrmCWVNKfEn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDI0NSBTYWx0ZWRfXys+nIK8LR1kV
 yg+bvXEkheH/VCSeRtIaNt/NtUqrDwPBRCMzSNxsPZeeFF/YuCz3vaBrTGvCCtmXtrX4ksxVRzD
 L4xeEj6CvQ9AjPzeC2rvD+Yk82Zziyr2tAdRO4PrJn56oUKy/3EbJikH3Fum2oGDOqC1e1h5LDo
 4f2nnrEcgtCDt/VRneeDxcUufxTmhj056r9jzKo3lIwqYD4DZRaHMMpapzPeAt/tLxUOMlBymDM
 vVf+sLhHS4G/3g6AsN19ydLP7amcmQbDLCewALftCaKaPI0ljgJgh7TIguO0C4eUaVDvB9gGbj/
 p3vTsRkGkE7RXHpZsGRNFYCrvLxrqAy0qMfGtnv4N9qQ8euVhCecmdImwpez5FJP25jXdAO34jW
 vbI1ZDyuIjqFeiztVYmZSV2jAjBIT3EAFORQTMNiwueCOoGTA4/LMSlP2MqzYy/nnFjee+Beo3y
 y6SDPdRZoxciKEL8BLTuu5pDy/HY3Z8XHDd0ePnI=

DQoNCj4gT24gMTQgU2VwIDIwMjYsIGF0IDE0OjMyLCBIYWFrb24gQnVnZ2UgPGhhYWtvbi5idWdn
ZUBvcmFjbGUuY29tPiB3cm90ZToNCj4gDQo+IE9uIDE0IFNlcCAyMDI2LCBhdCAxMTozNSwgRGF2
aWQgTGFpZ2h0IDxkYXZpZC5sYWlnaHQubGludXhAZ21haWwuY29tPiB3cm90ZToNCg0KW3NuaXBd
DQoNCj4+IElmIHlvdSB1c2UgY2hhbmdlIHRoZSBNWF9BVE9NSUNfQUREIHRvIHVzZSB0aGUgYXRv
bWljX2xvbmcgZnVuY3Rpb25zDQo+PiAoSSd2ZSBmb3Jnb3R0ZW4gdGhlIGV4YWN0IG5hbWUpIHRo
ZW4gYWxsIHRoZSBjb3VudGVyIGFyZSB0aGUgc2FtZSB0eXBlDQo+PiBhbmQgY2FuIGJlIHJlbW92
ZWQgZnJvbSB0aGUgdW5pb24uDQo+PiBUaGUgZGVmYXVsdCAnanVzdCB1c2UgKz0nIGNvZGUgY2Fu
IHRoZW4gYmUgbW92ZWQgdG8gdGhlIGJvdHRvbSBvZiBteF9hZGQoKS4NCj4gDQo+IFRoYXQgaXMg
YSBnb29kIGlkZWEsIGJ1dCB3ZSB0aGVuIG1pc3NlcyB0ZXN0IGNvdmVyYWdlIGZvciBhdG9taWNf
dC4gQnV0LA0KPiB3aGF0IGFib3V0Og0KDQpbc25pcF0NCg0KSSBlbmRlZCB1cCB3aXRoOg0KDQpz
dHJ1Y3QgbXhfZWxlbSB7DQogICAgICAgIC8qIFRoaXMgdW5pb24gY29udGFpbnMgbG9ja3MgYW5k
IGxvY2stZnJlZSBkYXRhIHR5cGVzICovDQogICAgICAgIHVuaW9uIHsNCiAgICAgICAgICAgICAg
ICBzcGlubG9ja190IHNwaW5sb2NrOw0KICAgICAgICAgICAgICAgIHJ3bG9ja190IHJ3bG9jazsN
CiAgICAgICAgICAgICAgICBzdHJ1Y3QgbXV0ZXggbXV0ZXg7DQogICAgICAgICAgICAgICAgYXRv
bWljX3QgYXRvbWljX2xvY2s7DQogICAgICAgICAgICAgICAgYXRvbWljX3QgYXRvbWljX2NvdW50
ZXI7DQogICAgICAgICAgICAgICAgYXRvbWljNjRfdCBhdG9taWM2NF9jb3VudGVyOw0KICAgICAg
ICAgICAgICAgIGxvbmcgY21weGNoZ19jb3VudGVyOw0KICAgICAgICAgICAgICAgIHVuc2lnbmVk
IGxvbmcgYml0czsNCiAgICAgICAgICAgICAgICBzdHJ1Y3Qgd3dfbXV0ZXggd3dfbXV0ZXg7DQog
ICAgICAgICAgICAgICAgc3RydWN0IG9wdGltaXN0aWNfc3Bpbl9xdWV1ZSBvc3FfbG9jazsNCiAg
ICAgICAgfTsNCiAgICAgICAgLyogQSBjb3VudGVyIHByb3RlY3RlZCBieSBvbmUgb2YgdGhlIGxv
Y2tzIGFib3ZlICovDQogICAgICAgIGxvbmcgY291bnRlcjsNCn07DQoNClRoaXMgYmVjYW1lIHF1
aXRlIHNpbXBsZXIuIEknbGwgdGVzdCBzb21ld2hhdCBtb3JlLCBhbmQgc2VuZCBvdXQNCmEgdjIg
dG9tb3Jyb3cuDQoNCg0KVGh4cywgSMOla29uDQoNCg==
