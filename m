Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C0C4A0EF0;
	Mon, 21 Sep 2026 15:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005970; cv=fail; b=k4ZMIV/UKz4QG51GzMmkoz6xLICovr2cNX3qKX+cYPqYVKAZjcGLSFVDOKbItVsYD1vINRSV5F6VGcLAdYt9wd01ancq7a3JkIrgi/C42ApWFtjr9HPAfnplWcZKdZDs0TSIFk68KRd4KhBfhmA7+hppwTaY9GeouNTVeIisQjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005970; c=relaxed/simple;
	bh=q+4Rw5q4YnTBgDXQ0u96sN4t3OJTVrlmUy0Sk6w/X+g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Un+xn8XqmVOMjqLmyEJVE9BM50sAE0kKe5MUfLSJZvLyob1kBqHpgfpokOkUD1rdUAlqj816Hx04NiGnWWrV8TE9mghZ92uLXlqXXM5wS7jO2o8N2/sEOedyvBqI7/eH9oNfSloCHxxFf723D0Cbem2lwx9Nm3j5yfxsVewcCWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iwVSHt0Q; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=oj1FsEx+; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iwVSHt0Q";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="oj1FsEx+"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LDtkJx1832020;
	Mon, 21 Sep 2026 15:52:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=q+4Rw5q4YnTBgDXQ0u96sN4t3OJTVrlmUy0Sk6w/X+g=; b=
	iwVSHt0QlzZZsWvpxbBKnvaasDardIqS9ei7zrOwTKJdEmSMtc42fNYCaWOrvNl2
	gOjNCpd3PVeaudWOQzuKncvma45gtx7cFFhPTauX+OR6iA8eVZpSjUyvu/Ic9k83
	8CJOZDK+H6qIE5SyZ32l7+4KDDzR4iYphVPHSvu16WVa08wYwgrfqcEoZXxJ9H7t
	MLab84lUl6kP9hT6dlBqKIWIg/s6i1WtoOP8n1f1Q3cFhet/qw2cPgKbZdxmFWEm
	UP25M+l857fNGYk164mnYhrJhuh6RxBQEwErIyo9JgDgc+rW0/0GPQyyCnp7FyfZ
	adL3oM476TkGea58l9/zSQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gsk2d2hu0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Sep 2026 15:52:27 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 68LFo6kU007013;
	Mon, 21 Sep 2026 15:52:26 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010063.outbound.protection.outlook.com [40.93.198.63])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4gtehyu1s1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Sep 2026 15:52:26 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ULxInXOKzB1ziGaoDNOiwEHL4H0DDaUQ3TSyDJ4wgCAz7qhMN5+cFv//ag30Fe7r/DX3VY3HvSngy7TzyKvBJh7CiNRCOTLSUPJzzSLZfL35cdnNsCyuYVTwD2N37ADmR1HZBqQ6255cwoaW6xKRxzsFOUWCxeNys+gb2hvOqwbmzYc9OfT/QH4ZSR5V2wE88pyKwsZxj/QhDYMkdn+ky3/3H3zeERb2eE+kLA6s87mX/QT8C6fbODAe0oLpab/SML0rkihhdH461Ht3KiN9nPo/ayoXMxg2GlXPDi6lhfmVCSpk5D9Jdcyk2gDdj5TEh5IFMwl7ZOwpZIXs6FPL0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+4Rw5q4YnTBgDXQ0u96sN4t3OJTVrlmUy0Sk6w/X+g=;
 b=HBjmJUtNPSI/Hv9+DHpJIxBcOkh/F7zBiPtemZlIywYBSEGcbP/jYx4v3C19eSMIH43wYaUwk9MwGbePXDplwnIQS1rjyMcER48VvN648jevtDTVgFaznWsFI0cMndtDv3LjJISc2ulGpI9P13WYvKc/RgBIsgbmzNmTe4ZyhOe3vHAJgtOdXAL0LalAxRKB4L2TaB9HGDPl71m3PH7shgjXUTtg8Yhd0QrcnZ416oNRvN1jBGw4pxDz5la+Sar+7EUKVu3YF3VLRy8HWDj9M8iDgsSzeoxEjy5cnHwkznwyqTsYYWEWPkfTEiu3zf1ESLtCZOTA7c06+GaAXt9OjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+4Rw5q4YnTBgDXQ0u96sN4t3OJTVrlmUy0Sk6w/X+g=;
 b=oj1FsEx++W0jgKGv02rrlkLp57yT2uVWiVqe1Waofe10E1UZZxUub5gtYQa/TB1E0Pw8NyI0sxTcT327oi/2Lni+R2NXVDegYOc8Bl2CncK4IKuV2tfqvI5PQYnRA5gh4LP7tb4x2nAabFEEMhlCovnSSk/yYJiq7okwnmVgoIY=
Received: from PH7SPRMB0087.namprd10.prod.outlook.com (2603:10b6:510:2b1::12)
 by CY8PR10MB6515.namprd10.prod.outlook.com (2603:10b6:930:5d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Mon, 21 Sep
 2026 15:52:23 +0000
Received: from PH7SPRMB0087.namprd10.prod.outlook.com
 ([fe80::527f:36ac:6913:b2ae]) by PH7SPRMB0087.namprd10.prod.outlook.com
 ([fe80::527f:36ac:6913:b2ae%6]) with mapi id 15.21.0451.012; Mon, 21 Sep 2026
 15:52:22 +0000
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
Thread-Index: AQHdLkjXOr5CvJFeb06L+v9F7yCyjLbN/EOAgAAxYACAAFDCgIAASG6AgAqe74A=
Date: Mon, 21 Sep 2026 15:52:22 +0000
Message-ID: <CD410360-BF19-4736-B12A-6BF4C0F012EA@oracle.com>
References: <20260817130239.343594-1-haakon.bugge@oracle.com>
 <20260817130239.343594-2-haakon.bugge@oracle.com>
 <20260914103545.3db6eb45@pumpkin>
 <6546A220-4B85-4780-8B45-F8B35D24139C@oracle.com>
 <A1E4F810-7A75-4AF8-9DE4-11BBA101F5E5@oracle.com>
 <20260914224045.5fdfac58@pumpkin>
In-Reply-To: <20260914224045.5fdfac58@pumpkin>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7SPRMB0087:EE_|CY8PR10MB6515:EE_
x-ms-office365-filtering-correlation-id: 5224a5a6-cdca-434c-e9a8-08df17f85327
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|10067099003|56012099006|6133799003|3023799007|18002099003|22082099003|4143699003|38070700021;
x-microsoft-antispam-message-info:
 O8hywFodfZ/vLH67DnfdNKBYIkZR6u2chHlE8C7RsCAFJUCQZAk0F7Wt9U+X8c+bZA3roiBQDiVF95Kciuq1NlhjJql2IgGmfTL8O0RRa2Y//AMwd683Nz8qESAF0WVrpizF5LBpfYjrOndb0p6uiZyOo1G7JmsB7yuaHFi9TO3F241atr+Tg8mKi+BBLjACBw3Idn/NYZ7So3Fp+TnL6+Lql/hQyuxIQDn35hutZYJogCy/6zS5cgKWqBchrBcd8VEs9AVHawL8S9alZ5FpL8bBnzusnhpf4Yta0bGjV2OMyb/7HVe88dilkK77RHQGatUSjzkEf/FSAUebaUY6ogIZYCJPBnUFuaGb35KInefUWoCtbhVGY9EMDeOf3b66S+gvDwkA3DXCuUH3493avBAkcaYmKv36aTBC7Hs6n/SGyBSH8BF3lUasraMXwXvNzRqFUNLFRAu3hlqge6RdVR9f8BEtrrxM1K38V1jFtaZ8VrM0g2DQJB/EPkmaRStnL4GSfzJH6rICwT6QxGudgjU/Ie3Lc8sEHLdq4raD20+UGy/pXNsenl+AYToIx47VX24TcFiLIy63A/gBfnRnx4zXaMcJCpOuF31CqDsGoiw8CibVm4JOMemVGavOLNOkI8SbyyhU/KY2pRyDAnMrSmPzrq1G8iM5Gim3/ODdaRWVNGoudh9T1n/76AdPKjCK42lrJ6dEg1BaMVmTgoyLGXO+6aHaEzSTH2dIg9+TnPg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7SPRMB0087.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(10067099003)(56012099006)(6133799003)(3023799007)(18002099003)(22082099003)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c2ROaHJtZGNvdkZqdU9lUGwrRm9QY2hrczFsVlVONXVMNjdNMlpVNFRkUjBp?=
 =?utf-8?B?RHZrYWtQcFdIamJuQS9SK1ZkM0cveHJHU0UrQlV2L1JER01HNVpBMHpIKzlB?=
 =?utf-8?B?S1A1dzQ5RUJaUXFNNk95bDlmNWxpZG5HS3NSeU5DYjhsNktiVEdoMjlKUHZy?=
 =?utf-8?B?WXI4L09SM0l6WkFXUC9oS2dPd25QdXhDaDdROGZoL3crcEx0V0JGSmpQeXNJ?=
 =?utf-8?B?azNLSXQvQjFEdUJvYmhoYWljQWd6RnA2bkdSUzlGWXJFMWF6WnNPZlk2Tzdk?=
 =?utf-8?B?Zk5YWDZwVmVFNlIrbCtuMVlsYTNKRVJrYnZDamJIVmtvQks4ek1OYkpSV0ZK?=
 =?utf-8?B?NGtsSHpXSzNybVhQaEdDYWo1dzNtekVOdGNBVjN0K0Y0UTVLb001NTJSSTBF?=
 =?utf-8?B?dUtRR3hYSnRXdjBmaXNzZUJFUmQzNllIR05vUUFDQnFWNTdQQUEyN29KcG9H?=
 =?utf-8?B?V0JHMzJpclYxZGlSOWhweTBxR0ZDQTNYdlA5clk3NVNiUmlITUlBQkJLaXNa?=
 =?utf-8?B?dnRtcFZJSVl6TTF4eTlTdUl0QnA4QUNFUWdSdXNQV3YrN1dhOSsxWG1kMytU?=
 =?utf-8?B?bmxOQ0h0L0wrcHBlZks3NjhIVFZQK0FaWE00TFpiRmpFYWk5MFRQQzI4TXps?=
 =?utf-8?B?VDg2KzhkR3RKWXd4aFgvb2IvTmRVNUtKVU1GYkFhdzU3eEhUam5pZWJPQXp2?=
 =?utf-8?B?UFRaak11dlRDQ0ZCanN4VlpZWjYweUcxVmRzaHNkNkZ5N1RjOW42NFpzMm04?=
 =?utf-8?B?bE41WlM1UTkyZjY0V2k0blhCeWhBTS9VNHZSYWYrYlZod3V4QndrUUJJL2Zu?=
 =?utf-8?B?VEU2SUE5YnQzR0V6NTJyL1JrYldOZFd2d3pGU2ExaCt1bXVmV1lkMjZGc1A3?=
 =?utf-8?B?RndheEhMOWxxb1pMMUdGdWJJQlROS0xXMFU3eXBXRGJrNjV3RjJsUnB6R1Zy?=
 =?utf-8?B?c3gzaU16TzBpUFZ0NzYvQUQycWJwWkJFY3ljekpySCt2UVhxVWV1MEpudGlj?=
 =?utf-8?B?OFdHb091ZlgyQnVSOTNMQTdFR2NMc2NmRmFJNUhJdzVmZG1aS3E5TUYyYzR3?=
 =?utf-8?B?cHJpYnI1T2d1Y3RKaWlwYXc0aVNQWlpNc25qKzJTYXNKUmo5U29VQUlvS3dh?=
 =?utf-8?B?RTFVb2FJUFEyWFhsRjJjK21yY3Zyb3JRWUZWU3ZMcDRBYmlabkR2NkJueGVQ?=
 =?utf-8?B?S2tmelJtbDVNcC9ZUmdQNlZJdlhDbHR5Y0dCWDlqYWpIMVNMcU1abVZCa09C?=
 =?utf-8?B?UHNLWk1OOEpESVRsZGtlOGc3OHlyVGxYa3NYQldKamtSYXlIdnNwcWdCdUVY?=
 =?utf-8?B?aE1VdlhBbU90bnBvWElzYTlyV0xxWnN1WW5Pc2JPOG9rZFg4R0FFOVJFaXhj?=
 =?utf-8?B?L2FNdnkwdWVjMkppV1I2d28rVFcyOEF2WjVWWFNucFFObkFlUzA0YnhXTlJ2?=
 =?utf-8?B?OGdNTk1UdzJQaW5EWk5DdUYrRnNHZVJ3L0VKYVVyZi9IMlU0dkVuMXFZeklh?=
 =?utf-8?B?bUd2ZkMzT1prdThMblhoTVdwOFd4ZXBsa2JrMnFrbjl3a0diS0ljbUpWcDUr?=
 =?utf-8?B?MDR4a1g0SUVoR2NpUTNMWm5vNEhtbEhqbEtTZVRDNmloU2R0TmNlN1NkZWti?=
 =?utf-8?B?ajZYVTEyZm5Qc1QzbkVkUWRuWHRpajBTZjA0SlFWR05ybUc2MlBjVGJWQkYr?=
 =?utf-8?B?ZnhmMTcvMkRxcEVJKzFKT0RXeTlSeWRHc1RIdkF3M0dmazkzdVJ2eStEWFVu?=
 =?utf-8?B?SHc1d2wwVFZTMmVBSEczcWR1T3hkMzVRUXdhY2t5Zi9JeGZuejF2ai9FRmRU?=
 =?utf-8?B?ODNqV2Z2OTYyeFYwb0lOZi9naytMYVpaOFVmM2ZOTE1aY2M0Y3o2Umd2bCtD?=
 =?utf-8?B?Vi92a05Pa05CeFc2UkRiWnJtUHM5VWdMU0J0NVVQOGlVK2h0d0ovM0U1Zldt?=
 =?utf-8?B?M3lLNGNFRE9TN1NIUHJENFFvaHhMRTRvV2ZwU1lxR3d6eStmbzh5d0srb3BE?=
 =?utf-8?B?Y3VFUUZPS3VCU3l4SktTTkxYbDk4aGxuY3diOGJNUEk1NFpaZldSOVMxTE8r?=
 =?utf-8?B?a0RqUjR1aUY5M2FIb1l4VWJvdkMyZk1ickNRQzl0b2g3angwYlB0alZNT2lY?=
 =?utf-8?B?RnNXeXl4eUVtK2E1WldtY0VYdjFiRGtjOUltcDVtSXFmd1BZR2Y5eTBKUytB?=
 =?utf-8?B?ZGNCY3hIbkxqWFcvS3ZVeU5jeGt5SVBEcStnWXArWnpDSGlEMW5QdDFJSUtL?=
 =?utf-8?B?eVZpMGpZU2dnSjUrb2hMQ0lDUkdiV3dDVENmQWxNYms0ajVGV1padmFXT0NT?=
 =?utf-8?B?cXkxeVJCeWVTbjh3cFowRWJpd2JEamxwSVFOQnp5b2k2YmxPL1orTWZmM2pB?=
 =?utf-8?Q?3LHVR38QnevpWW3w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <74F53FDF64C4454894D379138C699AF4@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	4RFyXC1ZqC2qTB9KeTnlZaZxQbnYuR8Nfh9B2qA+DHXhoMTqxnrgIXsJPTnNuzL+Wo7mzVqym/NVvWroa63GgRTLF6WjNsohnbfzjnSripcDKlresDnOTBPVcdqsbAyh/f6MtmBQ8qG/tC01spK/z1AOAjYUCLNPuol61WvYjdprlhDKRjv+CXuMYNZ7IV6daMVLM9TZTVh3kFtVtnoL334mZvJofFvPlzbzrhAgQPSETgc2GsTtFmgPTRYEaPnTHoRxV09CQX/MvosjXRlYSMDZ+j+URgKbTmtsgeEtGmRzX36K/eeSTknLQ2JFFSujTsGKVISQ/VUJm+1VhDPiCw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YEN63ah3xAoxCZTpM2zaxdTMH86LUe1fDqtlTXPE8F1bvVhm6Ft5reXZi4z46V0COs+XUhvFgAYLN9Rzy+CRUx8fGMXd5h2YTFUzFMSsjpd1S0hgA6W17jLUgqY1ZEm8zj6kOfdvDwgVbuTDvtyqN6lUSmgyzv4+TXABUMVigrMy8djjDo3vrAmiTojrX/rfTHHM1FqwY6Uhw5TWTJK/WveFWGKG5vgLtF/3+tYwPZg1tYEIJ4iqLgFn9tRHMJk08Ej36r6yFWuJy1suXjFsqUDPzI11WncW6O7GNNvpRbtDizenLPpqHAwpXxvsNwUDwBH7+hQyImEX119fNexYJJslI/2k3xIO07hN1fXWC1KW1m1hE6DOn3p67LPwYdhr1cogyfEKGt51A9aVP/Xdflibya3BPCYiCMECkZFRXfdsxdxYH/zCMWQH1V0l6/zttZLe3oh44IEVVYqms42ewpOp/OA+BA7MHMBYXPdVqfE0GRnNNjwZZc24lo3cdlgPwtIrQgClwD4FT2vxBEhH6gzE57AO+y1Ow9EE6ymVwBHkKvaNwjA365/C+CZJkukDc4WoyxSmIpC1mL/wcFf4ZbCj5uD3QXUhzvwiCyPmbz8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0087.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5224a5a6-cdca-434c-e9a8-08df17f85327
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2026 15:52:22.3929
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /m8uH8l9whBLDlES+8V4SzegmYGN7B0fAIdULh/Ypr8T13LX+JnzkIoQrlYXmSUf1S/1JM/QZEolFyaFjDAAqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6515
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2609040000 definitions=main-2609210231
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIzMSBTYWx0ZWRfX8aJtTkNOpXXt
 rUA3P9wht+6jDGxNTjk4K1hXs3379FbOZdcAVSuS/JG+lb/wqlCGWPhRELl+z6JWMWlPuBl/jlu
 SW1jgFBrBZ+yzhcNywC4LYy34h7uAxHsltSl0/qgFFRd3SP1s1xqtUILnzOdOHY/ZV/+Ja8WbOb
 mbh4R+zhxMtNDsixqRushTKPbC1U1nUAxvJqnriIPdk7QPxEN52bHFGSV4pAHdyrf3zIaVUyL6v
 g+eYU/WKR1cGp+KAABVUDlMfBL6Vm/j7m7D/P01R219d8kUB7q991tVK43HIfaJvKg09RvpAYvP
 Yv5d6kyajM+tRcIks/UM7TWabS836qJA5KsTkvprauuYm4wguqxYGmJBM3rEcnZ4s2kaye1WV0H
 NJ5mjbVX/wYrUdctu1w+QaNyk8QEzFNhIkLOjwDBNoNHUrFmL/B6/druShsNiUJCNwlfAAtCNd7
 bA7meF54WLqd5vv0yHg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIzMSBTYWx0ZWRfX9xASsVvx5ESZ
 0QdHlXvMcnngPooDcBjK/RQfMQjWFAyDsUMa5ijccnQcuPANNn/Uo4e4Pb/Xv9xk/NZ8JlAVfKO
 o8yXNFFx+6PdC4DTym2MPBibhzuAcWvalfiBKqdxQo1ww3r6lgs3
X-Proofpoint-ORIG-GUID: Jv4CEyqTBvUjCsDlw1G8wjIFFcjY28ZJ
X-Authority-Analysis: v=2.4 cv=f+Ddl+yM c=1 sm=1 tr=0 ts=6ab152bb b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=GoEa3M9JfhUA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22 a=EIcjfB9IiI4px24ztqRk:22
 a=pGLkceISAAAA:8 a=fKRiGPEwzoD32-9nciQA:9 a=QEXdDO2ut3YA:10
 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-GUID: Jv4CEyqTBvUjCsDlw1G8wjIFFcjY28ZJ

DQoNCj4gT24gMTQgU2VwIDIwMjYsIGF0IDIzOjQwLCBEYXZpZCBMYWlnaHQgPGRhdmlkLmxhaWdo
dC5saW51eEBnbWFpbC5jb20+IHdyb3RlOg0KDQpbc25pcF0NCg0KPiBJZiB5b3Ugc3BsaXQgdGhl
ICdsb25nIGNvdW50ZXInIGludG8gYSBzZXBhcmF0ZSBhcnJheSB0aGVuIGl0IHdvbid0DQo+IGJl
IGluIHRoZSBzYW1lIGNhY2hlIGxpbmUgYXMgdGhlIGFzc29jaWF0ZWQgbG9jay4NCj4gVGhhdCBz
aG91bGQgbWVhbiB0aGUgYWxpZ25tZW50IGNoYW5nZXMgYXJlbid0IG5lZWRlZC4NCg0KWWVzLiBJ
IHRlc3RlZCB0aGF0LCBhbmQgdGhlIG1vZHVsZSBmaW5kcyB0aGUgc2FtZSAiZXJyb3JzIi4gQSBn
b29kDQpzaW1wbGlmaWNhdGlvbi4NCg0KPiANCj4gV2hlbiBJIG1lbnRpb25lZCBhIGRlbGF5IGlu
IHRoZSBSTVcgZm9yIHh4eC0+Y291bnRlcisrIEkgd2FzIHRoaW5raW5nDQo+IG9mIGEgZmV3IGNs
b2NrcywgcGVyaGFwcyBzb21ldGhpbmcgbGlrZToNCj4gYyA9IHh4eC0+Y291bnRlcjsNCj4gZm9y
IChhdXRvIGkgPSBjICsgMTA7IGkgIT0gYzsgaS0tKQ0KPiAJT1BUSU1JWkVSX0hJREVfVkFSKGkp
Ow0KPiBPUFRJTUlaRVJfSElERV9WQVIoaSk7DQo+IHh4eC0+Y291bnRlciA9IGkgKyBkZWx0YTsN
Cg0KRm9yIHRoZSBsb2NrLWZ1bGwgY2FzZXMsIHRoZXJlIGFyZSBhbHJlYWR5IHNvbWUgaW5zdHJ1
Y3Rpb25zIHRvIGJlDQpleGVjdXRlZCwgdGhlIHJldHVybiBmcm9tIG14X2FjcXVpcmUoKSwgdGhl
IGNhbGwgdG8gbXhfYWRkKCksIGFuZA0KdGhlIGJlZ2lubmluZyBvZiBteF9yZWxlYXNlKCkuICBT
bywgSSBhbSByZWx1Y3RhbnQgdG8gYWRkIGZ1cnRoZXINCmRlbGF5cywgdW5sZXNzIGl0IGNhbiBi
ZSBwcm92ZW4gdXNlZnVsIGZvciBiZXR0ZXIgZXJyb3IgZGV0ZWN0aW9uLg0KDQpJIGFsc28gbG9v
a2VkIGludG8geW91ciBzdGF0ZW1lbnQgdGhhdCB0aGUgZGVmYXVsdCBudW1iZXIgb2YNCmxvY2tz
L2NvdW50ZXJzIHdhcyB0b28gaGlnaC4gSSBjb21waWxlZCB0aGUgdGFibGUgYmVsb3cgZnJvbSBl
bXBpcmljYWwNCnRlc3Rpbmcgb24gYSAxNjAtQ1BVIEFybSBiYXJlLW1ldGFsIHN5c3RlbS4NCg0K
Rm9yIGVhY2ggZWxlbWVudCBjb3VudCwgSSByYW4gdGhlIHRlc3QgMTAwIHRpbWVzLCB3aXRoIGVh
Y2ggcnVuDQpsYXN0aW5nIG9uZSBzZWNvbmQuIEkgdXNlZCB0aGUgIm9zcV9sb2NrX2J1c3RlZCIg
dGVzdCB3aGljaCBpcyANCnRoZSBmYWlsaW5nIHRlc3QgdGhhdCBpcyBsZWFzdCBsaWtlbHkgdG8g
ZmFpbC4NCg0KICAgI2VsZW1lbnRzICAgICAgICBwZXJjZW50IGZhaWx1cmVzDQogPT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT0NCiAgICAgICAgMTAyNCAgICAgICAgICAgICAgOTAN
CiAgICAgICAgMjA0OCAgICAgICAgICAgICAgOTUNCiAgICAgICAgNDA5NiAgICAgICAgICAgICAg
OTINCiAgICAgICAgODE5MiAgICAgICAgICAgICAgOTQNCiAgICAgICAxNjM4NCAgICAgICAgICAg
ICAgODUNCiAgICAgICAzMjc2OCAgICAgICAgICAgICAgNzkNCiAgICAgICA2NTUzNiAgICAgICAg
ICAgICAgNjYNCg0KSGVuY2UsIEkgeWFua2VkIHRoZSBkZWZhdWx0ICp1cCogdG8gMjA0OC4NCg0K
DQpUaHhzLCBIw6Vrb24NCg0K
