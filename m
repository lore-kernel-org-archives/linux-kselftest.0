Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A65409137;
	Mon, 24 Aug 2026 12:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787574594; cv=fail; b=AakWBRdHfNJmBMzt/PiqGJdDdlG9q9cnoTifkkrFRfHjRJu6RHOHSQWI6LEgRx+3HGqNFRXhRxyR5f+LyAM32ZFJtTqB74voJQa09jzBXSCeAadMLDHO/EuyRfvm1sc9Ds1Lzh04sseX+BsaoEcHtg6uqZBAY6iK8L1Gyjokm9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787574594; c=relaxed/simple;
	bh=ASNGEiJomzDAKmqQSlpUoJg+KgEJlzAnsHvdwW/3anY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XI3nSNuT/1wi92njyh++Zr3pv7y8O5JNkHYbO/dZV43Fc0ASwCHOogXVJlWX2fHg1HVbXjrsIY79hr6k6fdCsb2ZN94BxVj+wYDZDANm7LJvDmdob2qv7KLG1YMdB1QuHb2cBXouh0inZ1E/kjSmFLpo7/y2LYRLgTJm/ZrR1tU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ozmqNsO4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UJNazI0r; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ozmqNsO4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UJNazI0r"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O0tf8V4153555;
	Mon, 24 Aug 2026 12:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=ASNGEiJomzDAKmqQSlpUoJg+KgEJlzAnsHvdwW/3anY=; b=
	ozmqNsO4SIkrbdjxSKBSVDunfJh0NMqs5CzFpwr9tEkKpSNcrUUAuU8/ckgvZ+bx
	uphHgobsQqC2zQTsULRwSY21aC5X0mitdpWcDDaUCQLrdM1fNHbZGWCIf0viQuSx
	hoQgW+yBBsSlJzz1iXJxgz+AZVGlvmRt4vFfbWdN/6FN+yndX8b0mKg5mo8ZlUzV
	plJ40huKA1w0qNDsSC+4bJQ++1gH8RmoT5FlXq8crJfDKN92hpmkTzYJzjnRl1DV
	VmS3AaLUq2Ioku9yybLSNedukbajfck9657Eeo3YobY8RA8bghGbP/B/ndSfD8lr
	IA/CtuqaHhtdXl3fak1vRA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g72by23mv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Aug 2026 12:29:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67OCPVPV002617;
	Mon, 24 Aug 2026 12:29:18 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010027.outbound.protection.outlook.com [52.101.46.27])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4g86hdnqsf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 24 Aug 2026 12:29:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i56a7aDHd+hE/phSZ1qHkIic+1IoZqglv/nI3P7FySDFi4oOfRVWURYMpyigBM4lffHgN5qRTJJSvSOApiDdbIXPbLHbPl6vH+K4NWLQB4pl3AIr6KtxtWrhcVdx//P4hxWpvqsh+pVe9afZ/kBRo5tpXwCDTGZB39jk3OFEKpUQW23fxdAPIvy/y1aFCSdWIqDugkd5w7QB8L61nnMESwmkqFiaTzNgYA5Cw1/ROE96uYZ+aWp8eaZ9WYTplPFcWj4bBU3sB9UZykaALOk4Q3u/+d4ixoM3Mo4jcC+HbEmsyHOtDpxW8oGJd22xFUmv4Qz4gDcDA/yk12NwBmTWOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ASNGEiJomzDAKmqQSlpUoJg+KgEJlzAnsHvdwW/3anY=;
 b=VFqe1XsHYj2tkAFIbpxvl/f5V63b1/3rc9lj4m/Lji2SvTbHEo+cGdo+kota34TDlF1+l3SFn9ijQ8fNj0SMKjX8KVKDOPl8NMM8ce8JZf5aqvyfalGAigHY6Zu8sewc/QMVdFsO/NAQBxU59VgP1/klX572gc4DSb8WtKAA/pdNlzTCd6JrWsNCzOl22uFGeEU9HgQ41D3IMKGU5U7tiVpez8Y38yRPCMU15ko4cDf4xxTDHIDkYnQATMgncvGNV78ti/aoUSuSu+qrqOhcAqb5mIuzwQWR3QElfFONQne+h5HOoCygDITfQBju/WsnhVgiyonUv/2SGy7tjaBYmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ASNGEiJomzDAKmqQSlpUoJg+KgEJlzAnsHvdwW/3anY=;
 b=UJNazI0r6gyPn424FbG7w7FFC6J+GV4O4uwUO4KRO7kNMMbSHDI042yidR1xWVF2c0gTrrTiig419gty4JFLFcNxGpzyEkEd1btwsjf4KnN0QpSImTay62OnR2sSmGE8I7U+dgkqyWSJYVfjfsFrHM1sD3HvVaQZL0wstJloRFY=
Received: from PH7PR10MB6676.namprd10.prod.outlook.com (2603:10b6:510:20e::5)
 by PH0PR10MB5731.namprd10.prod.outlook.com (2603:10b6:510:149::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 12:29:15 +0000
Received: from PH7PR10MB6676.namprd10.prod.outlook.com
 ([fe80::44db:ead0:2fff:9a8d]) by PH7PR10MB6676.namprd10.prod.outlook.com
 ([fe80::44db:ead0:2fff:9a8d%4]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 12:29:14 +0000
From: Haakon Bugge <haakon.bugge@oracle.com>
To: John Stultz <jstultz@google.com>
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
	<linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH 1/1] kernel/locking: Add mutual exclusion self-test
Thread-Topic: [PATCH 1/1] kernel/locking: Add mutual exclusion self-test
Thread-Index: AQHdLkjXOr5CvJFeb06L+v9F7yCyjLao/qaAgAQtFAA=
Date: Mon, 24 Aug 2026 12:29:14 +0000
Message-ID: <2FB8E129-0EC5-4593-9853-D528854AAA4B@oracle.com>
References: <20260817130239.343594-1-haakon.bugge@oracle.com>
 <20260817130239.343594-2-haakon.bugge@oracle.com>
 <CANDhNCoPDZeXXGn-hKZ_jgE8gkELEaufDXDYWV=hqLWxtD6gJg@mail.gmail.com>
In-Reply-To:
 <CANDhNCoPDZeXXGn-hKZ_jgE8gkELEaufDXDYWV=hqLWxtD6gJg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR10MB6676:EE_|PH0PR10MB5731:EE_
x-ms-office365-filtering-correlation-id: 1b8ecff9-ddf1-403f-caed-08df01db4f38
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|10067099003|56012099006|6133799003|22082099003|18002099003|4143699003|38070700021;
x-microsoft-antispam-message-info:
 4Xi737G8duKAdmiFFRkWY0gJtgIx2tV10JXH9lsIi80yDelF+f83lr/1txcKoXk7Sqg+kah0qZpe7NdD+FSPsWTkh5ND/wfdXS3PSRa7wCyxuKgpStTUKmsO+emeHNatAgBxUVJzTzYDuKyJdC4M6vvBc9nPalTuB6MnFBRa/kE8MNYnCyvYuLj8GVtqAvp/tZTbNht3T9DYCONnut6LobmJKF9SW9ZdLoqxFrVC8w9dqzJCI4Y/oSV20SBxkYHJ+gl+wd1pL7gFjxThkC3WhxA/ubqqAFF4FDZZVjmnVK5FScnO4QXHrfk7LjIZYdZI4o9yGVIdGmUn8Jx+/S9bzuD/R8xfBfjFt6kI0KC6DAa2cpvHKuO42q7dkQrXVWgzI71rbY4cpLGVAmGOAmxJEG1ltXb3aXIhAPV1nl1e6fXaRUEPu5GD3maFlYtI0reypV77VXdPInr4h/8H8WHeh5fBCRvTQo5/WpWmpDKqfe67keRhAlKwOVrv9eSv+kb0IYewsEY+1VMeBAYuUx1XOhGIlsWqQ9O72TQAGtu8FbwH5L+juakEzWmTZvOOTCrSUxykyqDPPEtBh1LJqtaEtmY6RmMj2pimJw5kyOHxS/KDwGWr3hNMx6gckzXTeNj4b1EVX5aLCCnAwrTDU6cTltES8kTQsGErDjsvwof5Hahr8rpBslpxct5/+JU9KesaAFwIB7Oloqz5OyZAkjG7ShO/fiadxlhMhTUA27qfC7E=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR10MB6676.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NTU2cmRaZHVpZExVR3p4QVhTK1RBdFRuOS90dnJKNW9FTGlUTVJzSGxqSVl1?=
 =?utf-8?B?aS9IVmtzOGhHc2xxeFhhdnpIUkN5L2NWYmpHMThwbExjVHorOW5uSVEzektF?=
 =?utf-8?B?aTUvNlN2SmU4b3Zyd21JSjRwanlhWld1Snd0cmVqbnhVOFlJL1RFdGxKdnhs?=
 =?utf-8?B?ek1zT3BRUDJvWTNQK3grdEpkZDFMeW5KbjZJNGRMRmdyZndtWWxOeUFMR2s3?=
 =?utf-8?B?Z2E5d0QwZ003bmJzemg2ajNNNHpZSno0VTFiMlczYU1wZGltQ3lBeXBYNk4y?=
 =?utf-8?B?cnF2UXlzZEFHUDRoZkx4VFdkNEhCTmNlbUEvVlkxM3dtS0wyenBSckdUdXZC?=
 =?utf-8?B?SXJKSEdqY3BJcVlwQUZiMXY3V2R6cncwekZRbkR0ZDdvN1gzdDBSZk8xeXpx?=
 =?utf-8?B?Ry9aNHQzT0RDWmxwa0R6SlI1RlpnZGQyMmpGMnVBT0RUNkFaZ0VZKzFzT1lU?=
 =?utf-8?B?RVV6bWNyUHRER3RyMjlqOGNQbloza3huV3dXdG1yR1EwVGl4aHBqU1JPWXZY?=
 =?utf-8?B?NjdvdFZURWppRzRQL0xrUXpkaHNLc0hTaFhoRkZPdElTL2Rla0VwMWptQm8x?=
 =?utf-8?B?WjVEdW5jbHVocm9jWDg4dU1hbWw4WEJiY2pucWxUcnJCYktHYlhzOFhMQm9P?=
 =?utf-8?B?Ujh5Y1QwR3FJVmdncTBMN2tXSDhYa1NhRXJqNmR6YS9JL21VM3F6S0NUNUF6?=
 =?utf-8?B?eEhUeGYyNUYvaVNreWJtQVlJWFl3U2tjbkk4NENNVnh6eW15S2tCSzRkaTFI?=
 =?utf-8?B?cFQ5bEt6Y2RqKzZheDFrajRJY1ZYdDdjbGw5bEZaNjRQU0Q4Q1NsZnNMbGww?=
 =?utf-8?B?Mkk5N2ZCYmFQaXdPdUdIekhNSlBmYzY5UzNtZGFYVTU4VFBScE5nV3RCRHdX?=
 =?utf-8?B?T1RVVjhSa2ZIbURheXI4WDUrTWlTNlV1YTJIcDA3VzhTSDN1QjFMWWdVN0t0?=
 =?utf-8?B?SWlHcGJjTzVtVFlSU3VwMTJzQkxMSzc0cjhsRHZncS9oaHQ2RXlLRVpRZzdr?=
 =?utf-8?B?czRNNjBqeUZ0dzBzYy9qM1FRYXAzMnBieFh3alBKRENVV01LUVpLanNKZkNF?=
 =?utf-8?B?VHhoL1V2VXVkUTV1QjhwYlNMU0EweTh2dEdiYllqYk85N1VPaVpUZHRNTlJS?=
 =?utf-8?B?NHVjTmNrb0lueGtuMkFmMmJtOU5kelVNdm9OT0VpVlhCSmIzL09vYnBTdExu?=
 =?utf-8?B?U0VJZDk1QnlzbEUwRVFKYmU3TjlmRy9neDdyVkpHUjRaWkdTdHRiODV4dmRN?=
 =?utf-8?B?SnY4ODcvRmljYnBybGtBdWczQXVKekQ4dmNGdjBTazJUaStRWVh5WHQwbEgx?=
 =?utf-8?B?TGxmUGhnRjdJTnczREZ2c0YyVS9PRG5ROE5NMzBLRG9tTjJzcTl2elF1V1RB?=
 =?utf-8?B?ZkpNYnBFYzZpN1BNRmFhZzIxNCtQVUVvL3BCNWNOR1ZzZ0JUU1d0aXJIVm1B?=
 =?utf-8?B?U3loUUU3SGJ0Z25sSjZrRFNLV1ZtM0tPSUJWb3U5RjZuMTBuT0JmTzl1V2lF?=
 =?utf-8?B?b1VDbXVhdGpCOG43Vm8zU1lqUmNQKzZubFRQWWN0Z2pUbmJVSkFyL3AwTE9p?=
 =?utf-8?B?QmkxaDA4b1IrOFdvWDQyWmJRMlAzbUh5NDNGQ1dZRUxPN2dyY3gwUUtsU0pB?=
 =?utf-8?B?V3RuZ1V1cVJMYmZXaHV4ZHA2QldYaUU0ZkkwdndGZFZPNDVsMTVXcWRjbHlx?=
 =?utf-8?B?VjZ1YTlnRU00d3hBTU5pMGhSQTA3dlQxRFBSOHpiSDB0VHplOGtORE5JK2xJ?=
 =?utf-8?B?TWJVSU96dWxDSm5JVDRRSUpHbGJSNnNFb0dJdFV1RXZtN0x1K1JOSUhYeExS?=
 =?utf-8?B?K1pobERHSnZIY1VPWVlMRnVldWNlM2pmM2RpWHZGcG9MRWlzTVRWeG5rL2Fx?=
 =?utf-8?B?bkdqa3o5UFhvWlR5L3ArOWVvNW5kUEl6WjFVY0d3eGFiZEFXWllHZFBuQ09O?=
 =?utf-8?B?Z2JRSFpxdVJ3WTljSHJ1WjJ3bHRTZzlWQVo3QTVuU2tTR2R1eEoySDNJYzcx?=
 =?utf-8?B?dkcyYmJCZ3ZmNnBmUnRUM1E2dm1KMGJZb1Z1RnZjd2hZUzNKMWNhdmNxNi9C?=
 =?utf-8?B?c0Q3VTQ5dTcwdmVWbVRIK01SNzZPSE1tMCtOYzRTaitFN2dZMTljRUk2SXBa?=
 =?utf-8?B?ZmdoRTdrekNNUVlrQXNBWmNZMXlPcWc4TU1oYVNGUzRLbHJGak1Ra09OcGE1?=
 =?utf-8?B?NUFOSUUwUDEwL1NWSUpsVUtqd2g0N3c5ZGdqckd1WmVPdThWVTltZmZMWTlX?=
 =?utf-8?B?bkJEcGhTTkc1ZkFwVnRUM3I5QytlRlhwMUdEelZ3cWlaSXFiTkx5ci9RWW1s?=
 =?utf-8?B?djZjN0ovTU9RSXA1SDdiVjZDSHVVQ2ZWdHVHS2dxZ05mNWVtdGtvVWkyTFNC?=
 =?utf-8?Q?oBv1rEPg76J4MHXM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A8458E46E2D78F43AF8629C01AC88786@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	sGTEIdix16Yw3eHown3GPzV6xbQ5A6+q+8V6/hhOBgNgaa+DL7MRyqe/j+3zLvLjcefps3MXxlLotleqHWYSQIVGg+lQj/6/ocKIGYEUSEA0b9ZVga9P8ivgULxO33+K7x+JTY/t8pnbsiJphi82BmaGB9Ste+Z3dkZ0JS8QF1yW2xhhf6zLLABTaNJv0qfiRi0cmLwYE90rvCzx3tv4Tg3R9O/T2ZLKJqfSvnpJzw08L7GbjVwQVprPQWKuYfiYP6Lc7exS/mQ7VmUAW5BRij6oSksG2wgphzel1gmlRPSLGzxC6Xz70vufrmXmH6dWOmscovT8X6ebngX1ydF39Q==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qnnrVYKeNyrepofphIwzYxrcRlK+aKYscFo+VmMt0//4/Rn4lXtlYLjNrm8VYjbkH2bHnXQXI2W6WP0pdKoO5hMb6FkpDaEzgzBaEuI8YaqppvQGfCa3oPFcAqSReRTKvV45VqLNptRt/+Px6YWVqKPMQrg8JGqhS9xN1pNE2VgHoKi+/Ojn5Ptye1Sp5XAloIJ8Ez8BuEEFbVxL8y1SnKh1pYpSFxA/PbAP+XpLu964uLxchVx0Hr7ruDEzGWWs4v3Mp317eWE4tA/9fxswJh0/qF1C5CabKdNH9XyHRT48gGkrpyPgw3Cx+Ftw3mRtm7Y3mT08aBs92IlgMvewDrAihxvEF7/v2r0ovzG//irbSUxZbno1aZxr6U/HIhTWCc3/XxYaF1vcNA42KX0XjBs8HoE2Y9GW7AjlsDgu9UWMp7btUWQqUkD6pGDbk4ZK4/Db/zFpkZ+/X/+4HZBbj4Dlv9d2eHmlqTLgjYNysS8ii8GtTNpqLkA7kDG1k5lnirnQZ3UXrRl0MXh2+KisO6ekmcw0tq20fwpOTb+aPIjkgmTlMmq6XQAqx3GRKz4tiTUBaWks7bawy6ifF1ljMEJ95gcruG/3PT4Z6ELz424=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR10MB6676.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b8ecff9-ddf1-403f-caed-08df01db4f38
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2026 12:29:14.8299
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DLcf4i0lo46hQLO8Ua5f4YXBMo4i7pvxLD4O3a8P/WH2R+BRD+llBvkG1Ho37Ox9mnubsxPMHqxhg4RcR0x3BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5731
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0
 bulkscore=0 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2608240104
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEwNCBTYWx0ZWRfX84jJm7MANZJf
 si21AC0qVzPgY4YUX6hAM17p8RjfUy4YLVWWcvHxUl30PdhdGBpRsfW2fF6697VfWGC2Sv3QLrV
 fmFKhsAdu3YEOts/XSLSBpytz8uNZg8CeZlN5RC6nU1K1sbcsgK3ZrxxQiAI3s6fwym6osfhGVs
 Lm7Umh8x3iCI1yXFdXaN0T7Qs27WJJ56LiuI3PyUZLgw3WOFDrSqiAv+QXFh/haaAmQV6bCuRtH
 mf+zWwOQ6PNFZhIWNmtJdtl7Gpfk3SOiKIBAd9lkOAW9aSfDg6Pttzz73sk3dDZmakSUoGO18BI
 a3WdLXw5l3LPyxxbwjAV/HqlFA0zHiJSg0rCoGXuawU5FjzPbnTHKvrg4vHV0petSYjciWZdX1f
 dHsLbNnusJ8SJf8tmb3eRpTQ6kG5iExtsKI7bZ+d1y9tHQKniOA7s8kQ25FtxEEG8OoGR4RRyEJ
 Bs44DTqZktPN+MJ3vb3lP/dNa1lcznHb85lEyefc=
X-Proofpoint-GUID: oHc95jwzvMofdYFc25o_yMgS78fs6_5c
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEwNCBTYWx0ZWRfX/ZlfjV91Feei
 u880fKDVFAWrOaS08wt7xu6c1PXVQrO2qzEabyeXk5AjTEm72oTg+0+nTW8sEODaHBauaoDmkuY
 qQjgbWpHkskcBgV9WpRxy9xepkAcxcXelusDAyFPEGp6CLyRrbWA
X-Authority-Analysis: v=2.4 cv=fqTsol4f c=1 sm=1 tr=0 ts=6a8c391f b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=GoEa3M9JfhUA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22 a=RD47p0oAkeU5bO7t-o6f:22
 a=1XWaLZrsAAAA:8 a=yPCof4ZbAAAA:8 a=rp0YrfmrG6UYG8zBsZEA:9 a=QEXdDO2ut3YA:10
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12101
X-Proofpoint-ORIG-GUID: oHc95jwzvMofdYFc25o_yMgS78fs6_5c

DQoNCj4gT24gMjEgQXVnIDIwMjYsIGF0IDIyOjQyLCBKb2huIFN0dWx0eiA8anN0dWx0ekBnb29n
bGUuY29tPiB3cm90ZToNCj4gDQo+IE9uIE1vbiwgQXVnIDE3LCAyMDI2IGF0IDY6MDPigK9BTSBI
w6Vrb24gQnVnZ2UgPGhhYWtvbi5idWdnZUBvcmFjbGUuY29tPiB3cm90ZToNCj4gPiBkaWZmIC0t
Z2l0IGEva2VybmVsL2xvY2tpbmcvTWFrZWZpbGUgYi9rZXJuZWwvbG9ja2luZy9NYWtlZmlsZQ0K
PiA+IGluZGV4IGNlZTE5MDFkNGNmZjguLjI0MDA4NGI0YWJiYjcgMTAwNjQ0DQo+ID4gLS0tIGEv
a2VybmVsL2xvY2tpbmcvTWFrZWZpbGUNCj4gPiArKysgYi9rZXJuZWwvbG9ja2luZy9NYWtlZmls
ZQ0KPiA+IEBAIC0zOCwzICszOCw0IEBAIG9iai0kKENPTkZJR19RVUVVRURfUldMT0NLUykgKz0g
cXJ3bG9jay5vDQo+ID4gb2JqLSQoQ09ORklHX0xPQ0tfVE9SVFVSRV9URVNUKSArPSBsb2NrdG9y
dHVyZS5vDQo+ID4gb2JqLSQoQ09ORklHX1dXX01VVEVYX1NFTEZURVNUKSArPSB0ZXN0LXd3X211
dGV4Lm8NCj4gPiBvYmotJChDT05GSUdfTE9DS19FVkVOVF9DT1VOVFMpICs9IGxvY2tfZXZlbnRz
Lm8NCj4gPiArb2JqLSQoQ09ORklHX01YX1RFU1QpICs9IG14X3Rlc3Qubw0KPiANCj4gVG90YWwg
YmlrZXNoZWQgaXRlbSwgYnV0IGJvdGggQ09ORklHX01YX1RFU1QgYW5kIG14X3Rlc3QgYXJlIG5v
dCB2ZXJ5DQo+IG9idmlvdXMgbmFtZXMgZm9yIHNvbWVvbmUgbG9va2luZyBhdCB0aGlzIG1ha2Ug
ZmlsZS4NCg0KSSBhbSB0ZXJyaWJsZSB3aXRoIG5hbWVzLiBJdCdzIHNob3J0IGZvciBNdXR1YWwg
ZVhjbHVzaW9uLiBDYW4gb2YgY291cnNlDQpiZSBzcGVsbGVkIG91dCBpZiBwcmVmZXJyZWQuDQoN
CltzbmlwXQ0KDQo+IEFwb2xvZ2llcywgSSd2ZSBub3QgaGFkIGEgY2hhbmNlIHRvIGFwcGx5IGFu
ZCB0cnkgdGhpcyB5ZXQuDQoNCk5QLg0KDQo+IFNvIHRoaXMgbG9va3MgbGlrZSB0aGUgdGVzdCBo
YXMgdG8gYmUgcnVuIHZpYSBtb2R1bGUgbG9hZD8NCg0KSXQgY2FuIGJlIHJ1biBidWlsdC1pbiBh
cyB3ZWxsLCBidXQgdGhlbiBvbmx5IHRoZSBkZWZhdWx0IHRlc3QgaXMgcnVuLg0KDQo+IEkgYWxt
b3N0DQo+IG5ldmVyIHVzZSBtb2R1bGVzIGluIG15IHRlc3QgZW52aXJvbm1lbnQsIHNvIGl0cyBv
ZnRlbiBuaWNlIHRvIGFsbG93DQo+IGl0IHRvIGJlIGJ1aWx0IGluIGFuZCBiZSB0cmlnZ2VyZWQv
cmUtdHJpZ2dlcmVkIHdpdGhvdXQgaGF2aW5nIHRvDQo+IHVubG9hZC9yZWxvYWQgKGFzc3VtaW5n
IHRoaXMgaXMgbm90IHNvbWV0aGluZyBsaWtlIGxvY2t0b3J0dXJlIHdoaWNoDQo+IG5ldmVyIGZp
bmlzaGVzIC0gYW5kIGlmIHRoYXQgaXMgdGhlIGNhc2UsIGl0IG1pZ2h0IGJlIGdvb2QgdG8NCj4g
aW50ZWdyYXRlIGludG8gdGhlIGxvY2t0b3J0dXJlIGZyYW1ld29yayBpbnN0ZWFkIG9mIGFkZGlu
ZyBhIG5ldyBvbmUpLg0KDQpObywgdGhpcyBzZWxmdGVzdCB0ZXJtaW5hdGVzLg0KDQpUaGUgc2Ny
aXB0LCB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9sb2NraW5nL214X3Rlc3Quc2gsIGlzIHdyaXR0
ZW4gdG8NCmJlIHJvYnVzdCB3cnQuIG1vZHVsZSBsb2FkL3VubG9hZCBmYWlsdXJlcy4gVGhlIHJl
YXNvbiBJIHByZWZlciB0byBydW4NCml0IGFzIG1vZHVsZSwgaXMgdGhlIHR1cm4tYXJvdW5kIHRp
bWUuIEZyb20gYW4gZWRpdCwgaXQgdGFrZXMNCmxpdGVyYWxseSBvbmx5IGEgc2Vjb25kIHRvIGNv
bXBpbGUgdGhlIG1vZHVsZSBvdXQtb2YtdHJlZSwgYW5vdGhlcg0Kc2Vjb25kIHRvIGNvcHkgaXQg
dG8gdGhlICp1cGRhdGVzKiBvbiB0aGUgdGVzdCBzZXJ2ZXIuDQoNCkJ1dCBpZiB0aGUgY29tbXVu
aXR5IHByZWZlcnMgdGhhdCBhbGwgdGhlIHRlc3RzIGFyZSBydW4gd2hlbiB0aGUgdGVzdA0KaXMg
YnVpbHQtaW4sIHRoZSBsb29wIGxvb3BpbmcgdGhvdWdoIHRoZSBlbGlnaWJsZSB0ZXN0cyBjYW4g
YmUgbW92ZWQNCmZyb20gdGhlIHNjcmlwdCB0byB0aGUgQyBzb3VyY2UgaW5zdGVhZC4NCg0KDQpU
aHhzLCBIw6Vrb24NCg0KDQo=
