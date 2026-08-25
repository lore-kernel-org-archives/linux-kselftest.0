Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A2332BF4B;
	Tue, 25 Aug 2026 16:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787674366; cv=fail; b=V2VPBfhbVGNaiLzqajhF1RlvbGZ4u6I2VsKj+emM4s8QpQO6LzwmNu8SF2lL0ARYzwnZ5cQMzkq2Wn+AMz3MHg2Z8gD4hh2EonO/SbSbsMIkjxpOxzyQOnVmgH4kIYjjQHtNHZnIkDYPnf+H/B0JtsshyFS7wx9jKrjbOhbyNMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787674366; c=relaxed/simple;
	bh=1l1WNaRdJpFbuU4o2ahhikSbEQSm3KpyilfpOKciKDY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BhAgVuIC2KntfcTafEHqCWANRt3ZJpiimks7HFUnJpzqe4+l98FNHfX/M7Me9LVnivonq198IQlkV97h/D5AubF05fVS+k96lPSLbVIPDQk4ggKIwfrlNdnP0qABICRkenqndjrH19Hw8bMRJvfOSCM9wZGxPUqaLr+s0kHbF8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cGCadWNV; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dMQzRPj2; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cGCadWNV";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dMQzRPj2"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PFu3T43998998;
	Tue, 25 Aug 2026 16:12:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=1l1WNaRdJpFbuU4o2ahhikSbEQSm3KpyilfpOKciKDY=; b=
	cGCadWNVDqLGIS5U7B+ET3GGPACLLVRGot+oW6A+qrZCQGrXfUB2x0LUVWDIXeZh
	StluAqslJ6VniYfkZGytVgAqA8l53t3pziUMuw8jnVS86PiovIXMN080VU6xsydN
	64YN+BC5+qwy22W05mVFx7BzSfri9/fRf5d9Ma6sdtAYRnxqyoGEOgzOXCW6tlWY
	rf6vWqqs6I6RAiKbrp2WQMyVOopBlqBHBSpKIjYw6BsMJOgsQYwpSH2E00fXigzs
	AiASEsTyD1fhcFNhBRL39EopFLPEluJgGPrmajD9Kl2ayVXXnat8FmZFFzB7/5LW
	FyE5W5JCtIJc0QMJ9qqe6g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g73csvjvn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Aug 2026 16:12:27 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67PG550s010217;
	Tue, 25 Aug 2026 16:12:26 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011069.outbound.protection.outlook.com [40.93.194.69])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4g846dprgv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 25 Aug 2026 16:12:26 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IoZLAh4MRvYwkOg8AiHaI7PuCdh1NYNFdqDuBW/ZmfmhgyZGNdpbgZ/ZNXMfWnyAMmB4+1mTkuI+V1/QyD/3TcvGPkkbJrSY+Ytef2CkKlF564CwnsdWck2/ClTHVrq6F8uzwHAPLF5AHMfE967wWnLk1iNgzmU4xlM/PXMCZMxHn7QaLgcgUpxVZz6oFY445lKYvbCxmEF1L1BlRJSw8EGSbX46micJuWrJRF652VowfCkupBJLfje/VXFSOWF2CWP1I72zURTObF9tzMOGV8Qm9Mhk8g/u52hNZxMtYS718kzUquDh44n+hjGV2R1vlGcIISHly2uhrb603ATGGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1l1WNaRdJpFbuU4o2ahhikSbEQSm3KpyilfpOKciKDY=;
 b=K2mXIvSgLM0b8ypQeCiWlpJMky4K0MaRRiag3OhL7Uv6SnmzuzoZyUXkcNcFGdq+bjH4A+7yLdmwfjhLlqabfO+dPqfhIx92tDuiL5LSQQk4QrFfX8ZomOaw15vWzlDZwKtQugeGj36V85yvuXoIU8ImsQWX8+qJVY+NRKayJAkGmQD1xBV14A+on9hvolI9/ApLaAorCMRfXMvwMflG2MmKEkOy1hCTmMIx5pkIi42MtyXQhlqoc/ISlwTn8ivG8DgEP/42JjQa470BbRGZG0DMqpRIpfeYHzkU/zj95s9J3mZoBUlTwNognPKvau5U9yl8x2C2Ubse3PY6u4zx/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1l1WNaRdJpFbuU4o2ahhikSbEQSm3KpyilfpOKciKDY=;
 b=dMQzRPj2Ej9aCKe+MgYcOlfrRaUsFFyUyRDzkaBhhp8tymitkVoW940vWJTiHt3BpxCw37qIRLIOFI4Bu1nZberoNrHE19JU6+a/DhhUCzL+g8qEOyxFhYvFS2d0S6xGdiptxZXKTOEOTH1voEJnFZKWCGh/3J3X9dV2CKL/ly8=
Received: from CY8PR10MB6659.namprd10.prod.outlook.com (2603:10b6:930:53::5)
 by DM6PR10MB4377.namprd10.prod.outlook.com (2603:10b6:5:21a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Tue, 25 Aug
 2026 16:12:23 +0000
Received: from CY8PR10MB6659.namprd10.prod.outlook.com
 ([fe80::a09f:da4d:e03b:582a]) by CY8PR10MB6659.namprd10.prod.outlook.com
 ([fe80::a09f:da4d:e03b:582a%5]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 16:12:23 +0000
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
Thread-Index: AQHdLkjXOr5CvJFeb06L+v9F7yCyjLao/qaAgAQtFACAAJxOAIABNF8A
Date: Tue, 25 Aug 2026 16:12:22 +0000
Message-ID: <1DA01181-84A0-4EC3-ABC8-F4097AAD2E40@oracle.com>
References: <20260817130239.343594-1-haakon.bugge@oracle.com>
 <20260817130239.343594-2-haakon.bugge@oracle.com>
 <CANDhNCoPDZeXXGn-hKZ_jgE8gkELEaufDXDYWV=hqLWxtD6gJg@mail.gmail.com>
 <2FB8E129-0EC5-4593-9853-D528854AAA4B@oracle.com>
 <CANDhNCq4k=-Ap-0DUwZTzTCZTTkic3X39vNEpNMi5dCzXLPOXw@mail.gmail.com>
In-Reply-To:
 <CANDhNCq4k=-Ap-0DUwZTzTCZTTkic3X39vNEpNMi5dCzXLPOXw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR10MB6659:EE_|DM6PR10MB4377:EE_
x-ms-office365-filtering-correlation-id: d7e79344-5762-4e7e-9bdb-08df02c3a59f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|7416014|366016|376014|56012099006|10067099003|6133799003|18002099003|22082099003|5023799004|4143699003|38070700021;
x-microsoft-antispam-message-info:
 /xJyTHcgw82rbiLVaNo1+glbX7YfDDYpx50sEqvnbyptxefS/bskL7U+IdJJGPog382fyfBp1/O1ys06LDYYpMfmgjyRg+vLLNibkx7OEtk1vXmi8vR44lc3n1aOwAti6GoIbUE8RM5kVmnthg9CTT3+lii/QeevdE7LmaNvmx+ptjWCJc76k0P2/bvSzjYuDZzgAbFP2df0et9njgCjAz1+6NXJ2WcvcyQUQkv3/mVCQfaBvgbV0WiRGiM9y2kzCyW2bpPqT2cdUwaDwizj9dqlXPVLVaxhIoCLT3+wdQAobYCPLsvwrizVMyNASM8b+bWHUjs99RB4yY1C7ck6U1BHcVWCACGQX8f1VgrDp61kPk47nXsystrko2R20FgIS+FMOxijfyhaBu30rVg/fXUGijjIOUG/QjsE6QJsfg6V9YlwZz57W5NSo1yu+dkufoCwYZd/5csinGBKHaFa0jzy6hu8nLGgCajHjnSx0nAYgwrqN8vJqYv5NfuHjQ08Kw4dMArVTkXDt+fcRUEyCtutlYfSNYyMD8CxS4+sj+3JLtL8Q7rHXtIoAvNI27BsFDjhss0mlpRVhwowPR2g60rYPctHZYyuw5RaLMI98UGBI4dZ25PSjZjFkDV78UQX8Wz/3TJTkfmA98w6gmeAQ49uf8UTEiY6GekoU35Cul4m9a13sHVwBtoOHkmYYvGMT5Muv6HpusSiRRH3RzT1chgRTflTBLU8cWiD9WrL6X4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR10MB6659.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(366016)(376014)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(5023799004)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UlJsd1ltZlR0ZzlGaGl6YnczNWVxYVNjdUZmVTcwWFMwdnI1UTlqSUYyVm9y?=
 =?utf-8?B?ZnNoSWNYTDlpMjNaQnNRNDlZdHhqTmJCeHUvdW1ybDVNU0JJYkI5M0ZYUnZw?=
 =?utf-8?B?aldNVzdxdzVZbHZUNm5BVG1VclhmREljS2dWTjhzVzZaL2RnMHVoZXRVOEIy?=
 =?utf-8?B?eW41ZEN5U0dJYUtrRmFPR1BDZC9iOG1zVU9EYzhnOEo0OFNXYi9QMDdxb1dv?=
 =?utf-8?B?NjVUYUZCR1VwcW1zWTNCZW9QVldZeTRveE05cVJRcXFTdXRXNWlCR3kvL2sx?=
 =?utf-8?B?NFlEWkdWelJ6Ukd6L3NZOGhQQVpqV085UGR5VjFraHhGK3VjbDhVRkhueHFv?=
 =?utf-8?B?QnFSeXVqM3poL3hlRUEweTBiQkpVWis3MzRXZTZvcHZsNTVJN0JpMklTbzdE?=
 =?utf-8?B?U3lqZngxM01EbnFoQjBsRGw5Q0NtRHJCb3ZLMEppbEI5ay9wMGVkV0J4Rlpl?=
 =?utf-8?B?R3ZmWjVVb2NUN091elRubWMyVGpTTnY3dTQwQ0prMGxjR2w5YXI1UUdqOXdn?=
 =?utf-8?B?VVJMZXo5TXlsTmZVRTVUS1N4ZTJEdG02L2IvOVJ4OHMrZ0xFSlRjeHVMYTE3?=
 =?utf-8?B?K1lnbW1JRlhWMG04SVdpbWgyeVhIYVJxQUtBQ0tOOFFndHNFUGlyYml3RWdp?=
 =?utf-8?B?UmoxQlVFQ1ZseWFhdVZSc0t6VkRGYmIyaWhRL0szSTZaN0VienRQR0NzVWMv?=
 =?utf-8?B?SmgzbDM3Wmh3N0VMRmlJb0FsbStjY0tyZDJGSm9paWhleXQyaEYxZXhMNkZD?=
 =?utf-8?B?T1JqR05BSFh4MXh6TnorTlpxYTY5T2pZR3dvaUNlUmhtVDgvWmt6NTgzd2kz?=
 =?utf-8?B?SXVOd3NubWNSd1pGK1J1bzVLamV5YmNWUEJ4d25UNldwMUk3ZktzMm5zaDk0?=
 =?utf-8?B?ZnlWTkFCL3ovb0pGa0hUSTk1SUNMYS82MXNzMWhUMmw5bjl0WWFuVmR3bnlo?=
 =?utf-8?B?UGd3S0twS1k5a2ZmNzhKOHY5UXpMck5PeDBJQzRCSmZKTWZSZ3RTaVIxek5p?=
 =?utf-8?B?UkdjL2RmUmtSQWtydFZRNnpMMnRxQTM4czFWekxpNTBRMVhWd09GYnFwcjJl?=
 =?utf-8?B?bGNTOXZ4U25NR3k2K0tmMjRvZ0I3Rk8wWTVaVW5scUN0WEY5Ukg5bzhPTTVz?=
 =?utf-8?B?eFJ2TEJsNGp0dkVhMGRlY2Jld1RDRzJTM0t6VkpRTjR0amxPUVduNThZYWJM?=
 =?utf-8?B?d3Z6M1JPV1BleG1QYmZlQ1kyYVlmNUFoTGE1VFNXcTYxNDBPM0ZPOTRMV1Nu?=
 =?utf-8?B?SFVFVUJrd1RyNnZqaEg3TWVXN2IzMVcwWDV4ZVlKdTM3bzVreXNQM0wyVFgz?=
 =?utf-8?B?UUhoaUFrK0FSOWxpRjdRbGlhWU5sWUxPcHI4dDVIQzZFZmFNMlJ1OGwvVUh4?=
 =?utf-8?B?THZMWE52RnBkdVM3Lys0L1hOODhpZ2JXb2JNc3dmcFU5aDN0dGlBSUt0Q3Bs?=
 =?utf-8?B?ZzVlUzRaY3N4OWlJVUxDVWd6Mk1qcXIyYzdtN25WYXJWcHBKajM5SzJMVno4?=
 =?utf-8?B?QmlQZnBCNkFnT2tOczFJbXdoMmg1V3NBYzkyOG5pc2JZQVFkYVV0TEhpdld4?=
 =?utf-8?B?RlBoSGFJSWM5ZXRYVmlOdzJoVEdFbDczeUJ5Sy9KQmUrSFREVlB3czZXQzNy?=
 =?utf-8?B?WVBaTVVOTUc1MmRpUXpzS0pES1BpTE9jMFBUWlNFZzIrb1V2bjN5Sk5TNVNt?=
 =?utf-8?B?NGhSTklhVnVRM0M5MHdoZXJZd0VKdFJsSlMycE1nYTg3TDZwNTRRYWtqMjNL?=
 =?utf-8?B?RGZ1c0hZRnordTRqSGMxMUdmV3A1Z201M1NCTFRIUmY1RlgrMHBMbWV4T1J4?=
 =?utf-8?B?dS92QU1zRlZwTCtNY2MwT2dQbW1TUzdodDgvaVk2QzVCRzNJOEd6M0JOQVNt?=
 =?utf-8?B?Wnd6VEJ1SmJxeEQ2SGFLTm00WWVEdFlJNjZVMFpJTkVOdVBWVjR3dzJNQU4x?=
 =?utf-8?B?YWhGcHBRTzhONEx1bHBLd0FtYjYxSmxyOTNhWkM5a1R4bzkrd25wamZ6c1Fi?=
 =?utf-8?B?b3BTdFIzM3pjcTVrUlRiUVRVdVhyRUlKMVFlMlVETWk2TVhySzM3VU1tM1pj?=
 =?utf-8?B?aCtmQXdnVzhDZmUrZlhlV1pvelFxTC9GVjdhTkdPNHlUS0ZCYjl0dDdxbFI3?=
 =?utf-8?B?elI2VlVmYVdYMzNxSWExb3AyNkJHWlI3WnAyZER6Slk0TW80Z0FIOHBTc0dq?=
 =?utf-8?B?MzgwNS9qNDdrcnhUZzdzbDNHY2VDallkRytvM2xRVGU5YTZQMnFBWUcyTjcw?=
 =?utf-8?B?c1BMeHRoODhuU2tNd21FVHV1UFJnNzBTL0NsazZPQzNpTVhCZFN5b3dGRkF6?=
 =?utf-8?B?YWFaRjhXVnQ4TXM1aWpSMDN2YU1oa05KR0xEYXVTMkZJU21MTDdueTVKWHlv?=
 =?utf-8?Q?7UDCOA4NPfnjFcfM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <27AD7C97A179FD4CA6E330B1A805F4B3@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	PYLMr3UydYPU5fytSbR4UvfI6spjF9YPziNP1Ce7xg/jgmvPmlpJ0+P6zE4vudX8lzvYrAlvcNH5XNCTJk12GEDfl6+tPzM2KCtKvGqh+eQDyI8C5kDZ6Fw7hsgXH1NVudUp8l2n+z5gJyLozkcTv0QNCcKMh5+X6yPPEmEbdAdAgV4Nf8/Fgn8o9+D0LqM0P/6tr3t6thN4C7szUiDh24VQSfF1A1pww2UhP8gWy/7L8e2BqK3kebtoO3vr7oOZTdsY4uwcv74QPyDIoT6cAvXsra6SaacXeDdiCs2n6a4+rqPgS3ddpxCBRu1rMeEb9km+jcCegRkKO/BPKPLeCQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qluB1x8nTk/unBRt6qzTA7iUQWrjTELYlrIhY3/s9Hm/BzfNgOEq+mQwkFtLaPh26OOXluhRmzATFTLthBMymkiVWHXBapikI5CWHdNX3Yjw71EBJr8JPNZQ7PZEr4qiPZ0vxnFfy20E97HoSEnhU8SkZNVSQxy5IO1CsqV2dLlWZfCrM9PMfCT+LiT8wcn/PqDO5nzEVYmUaZ4EDeXylcmjJJ66OGtiVvNSfLOo2YZ6thQVFnd50uQCw8S4LbGwIxP6y4CrMjQrqW2f5CXRmIRCy7NSpwCY2MQXEYiexkkZn30HANTLA8Gr9COKUEdBnD7Fc5OcaN35ytEEpUTjQiCDSlWDeVZVmJIF0nS1DghRfDzeQwqRlnK0CyzC+wzNRnsCjdW22I1uBhGQEBWieu4Vq4gWCPOpp9jNKx4JoOCvaLzjJMF0JlC9oWKAwugSGcc6PSfjP6Kammh9aib1EN4SS5EWBWbENCZZ0oW8lbU+TuCioD0b1cu9Yqm6tX+J9/CbqFhKwaEL13CafXADwP4VQpHaAqkbJtZSixxVkZLnJctAx2CFR3kJJeSPjL8Tx0yHIT9xgQKRQnsdEhj1SDDsMlfECABmZwD80EfM4fw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR10MB6659.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7e79344-5762-4e7e-9bdb-08df02c3a59f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2026 16:12:22.9541
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4+SV6zTcMiqAdzCjXmK8yjyWLfSGCV5JXgy7/7D6UF0rYVC/mhB657TrRKm2EGxjvHdamCAlOQi/RHepwfnNVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4377
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2608250137
X-Authority-Analysis: v=2.4 cv=D+h37PRj c=1 sm=1 tr=0 ts=6a8dbeeb b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=GoEa3M9JfhUA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22 a=3I1J8UUJPc9JN9BFgKH3:22
 a=1XWaLZrsAAAA:8 a=yPCof4ZbAAAA:8 a=uxu5Y8ZYboe6QHdux2wA:9 a=QEXdDO2ut3YA:10
 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDEzOCBTYWx0ZWRfX8ugIghqfWUiR
 wDAN9PoxmpqiPi/deAbSHyL/4oW/fo47aFXet/JuScNhb1NaXgQhlUW0MnLq+vWRuHNlnNPB3BZ
 kqkobzw8PIrytaiq+3O3kBd7KQvct4UEVQyHpEukH6ayHOffZFeC
X-Proofpoint-ORIG-GUID: vSAVV22-rnOyqTPUIG4ySyJJ7JE00ec0
X-Proofpoint-GUID: vSAVV22-rnOyqTPUIG4ySyJJ7JE00ec0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDEzOCBTYWx0ZWRfXzHbPn1Y11+Gb
 Ryy5DZ0LmTPbBzwgjAIXhGEUPg8KVoVM9Ph6QlMde9mWTiwB1ovb8MhJx9tuJRI+0+QvBrls/c/
 +XTgxdoSQV0LgDuGYsidr2d7Sdz+ib2VltCoN95GYyHQ2DFFPAoG6BXpm+gG/1gT3X+tgGSKUhT
 ppDHcD3ejwBZzmbu2iyHI7BZ4J0iQGCatSMBdJ61q5LoJnMVRZ/0W3nBPyHnQwJmJr0qsHZYbWO
 jWHJ1ifV5OHGwPhn0yXVCnau5bVzuwgVO+aAilxCoK9d2L3GAYmaAHrjbL5IaKrpWmjiYP3Sd4l
 wVyXkIvOodf9hWL6NKYrWrqUtEmfq38G+Ap+iF9IssTIenwgFZ+ksuWDanOzwrwKYjRLHiMOY1M
 i8oCO8APsP36bFIfvmH1Doz+hgbPYdvWmhV9tIXxBOEFN6yvs+TGdln++725nWeiGxr6/Buwml7
 2x7Tmf99r2/2Co639dg==

DQoNCj4gT24gMjQgQXVnIDIwMjYsIGF0IDIzOjQ4LCBKb2huIFN0dWx0eiA8anN0dWx0ekBnb29n
bGUuY29tPiB3cm90ZToNCj4gDQo+IE9uIE1vbiwgQXVnIDI0LCAyMDI2IGF0IDU6MjnigK9BTSBI
YWFrb24gQnVnZ2UgPGhhYWtvbi5idWdnZUBvcmFjbGUuY29tPiB3cm90ZToNCj4gPiA+IE9uIDIx
IEF1ZyAyMDI2LCBhdCAyMjo0MiwgSm9obiBTdHVsdHogPGpzdHVsdHpAZ29vZ2xlLmNvbT4gd3Jv
dGU6DQo+ID4gPg0KPiA+ID4gT24gTW9uLCBBdWcgMTcsIDIwMjYgYXQgNjowM+KAr0FNIEjDpWtv
biBCdWdnZSA8aGFha29uLmJ1Z2dlQG9yYWNsZS5jb20+IHdyb3RlOg0KPiA+ID4gPiBkaWZmIC0t
Z2l0IGEva2VybmVsL2xvY2tpbmcvTWFrZWZpbGUgYi9rZXJuZWwvbG9ja2luZy9NYWtlZmlsZQ0K
PiA+ID4gPiBpbmRleCBjZWUxOTAxZDRjZmY4Li4yNDAwODRiNGFiYmI3IDEwMDY0NA0KPiA+ID4g
PiAtLS0gYS9rZXJuZWwvbG9ja2luZy9NYWtlZmlsZQ0KPiA+ID4gPiArKysgYi9rZXJuZWwvbG9j
a2luZy9NYWtlZmlsZQ0KPiA+ID4gPiBAQCAtMzgsMyArMzgsNCBAQCBvYmotJChDT05GSUdfUVVF
VUVEX1JXTE9DS1MpICs9IHFyd2xvY2subw0KPiA+ID4gPiBvYmotJChDT05GSUdfTE9DS19UT1JU
VVJFX1RFU1QpICs9IGxvY2t0b3J0dXJlLm8NCj4gPiA+ID4gb2JqLSQoQ09ORklHX1dXX01VVEVY
X1NFTEZURVNUKSArPSB0ZXN0LXd3X211dGV4Lm8NCj4gPiA+ID4gb2JqLSQoQ09ORklHX0xPQ0tf
RVZFTlRfQ09VTlRTKSArPSBsb2NrX2V2ZW50cy5vDQo+ID4gPiA+ICtvYmotJChDT05GSUdfTVhf
VEVTVCkgKz0gbXhfdGVzdC5vDQo+ID4gPg0KPiA+ID4gVG90YWwgYmlrZXNoZWQgaXRlbSwgYnV0
IGJvdGggQ09ORklHX01YX1RFU1QgYW5kIG14X3Rlc3QgYXJlIG5vdCB2ZXJ5DQo+ID4gPiBvYnZp
b3VzIG5hbWVzIGZvciBzb21lb25lIGxvb2tpbmcgYXQgdGhpcyBtYWtlIGZpbGUuDQo+ID4NCj4g
PiBJIGFtIHRlcnJpYmxlIHdpdGggbmFtZXMuIEl0J3Mgc2hvcnQgZm9yIE11dHVhbCBlWGNsdXNp
b24uIENhbiBvZiBjb3Vyc2UNCj4gPiBiZSBzcGVsbGVkIG91dCBpZiBwcmVmZXJyZWQuDQo+ID4N
Cj4gPiBbc25pcF0NCj4gPg0KPiA+ID4gQXBvbG9naWVzLCBJJ3ZlIG5vdCBoYWQgYSBjaGFuY2Ug
dG8gYXBwbHkgYW5kIHRyeSB0aGlzIHlldC4NCj4gPg0KPiA+IE5QLg0KPiA+DQo+ID4gPiBTbyB0
aGlzIGxvb2tzIGxpa2UgdGhlIHRlc3QgaGFzIHRvIGJlIHJ1biB2aWEgbW9kdWxlIGxvYWQ/DQo+
ID4NCj4gPiBJdCBjYW4gYmUgcnVuIGJ1aWx0LWluIGFzIHdlbGwsIGJ1dCB0aGVuIG9ubHkgdGhl
IGRlZmF1bHQgdGVzdCBpcyBydW4uDQo+ID4NCj4gPiA+IEkgYWxtb3N0DQo+ID4gPiBuZXZlciB1
c2UgbW9kdWxlcyBpbiBteSB0ZXN0IGVudmlyb25tZW50LCBzbyBpdHMgb2Z0ZW4gbmljZSB0byBh
bGxvdw0KPiA+ID4gaXQgdG8gYmUgYnVpbHQgaW4gYW5kIGJlIHRyaWdnZXJlZC9yZS10cmlnZ2Vy
ZWQgd2l0aG91dCBoYXZpbmcgdG8NCj4gPiA+IHVubG9hZC9yZWxvYWQgKGFzc3VtaW5nIHRoaXMg
aXMgbm90IHNvbWV0aGluZyBsaWtlIGxvY2t0b3J0dXJlIHdoaWNoDQo+ID4gPiBuZXZlciBmaW5p
c2hlcyAtIGFuZCBpZiB0aGF0IGlzIHRoZSBjYXNlLCBpdCBtaWdodCBiZSBnb29kIHRvDQo+ID4g
PiBpbnRlZ3JhdGUgaW50byB0aGUgbG9ja3RvcnR1cmUgZnJhbWV3b3JrIGluc3RlYWQgb2YgYWRk
aW5nIGEgbmV3IG9uZSkuDQo+ID4NCj4gPiBObywgdGhpcyBzZWxmdGVzdCB0ZXJtaW5hdGVzLg0K
PiA+DQo+ID4gVGhlIHNjcmlwdCwgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbG9ja2luZy9teF90
ZXN0LnNoLCBpcyB3cml0dGVuIHRvDQo+ID4gYmUgcm9idXN0IHdydC4gbW9kdWxlIGxvYWQvdW5s
b2FkIGZhaWx1cmVzLiBUaGUgcmVhc29uIEkgcHJlZmVyIHRvIHJ1bg0KPiA+IGl0IGFzIG1vZHVs
ZSwgaXMgdGhlIHR1cm4tYXJvdW5kIHRpbWUuIEZyb20gYW4gZWRpdCwgaXQgdGFrZXMNCj4gPiBs
aXRlcmFsbHkgb25seSBhIHNlY29uZCB0byBjb21waWxlIHRoZSBtb2R1bGUgb3V0LW9mLXRyZWUs
IGFub3RoZXINCj4gPiBzZWNvbmQgdG8gY29weSBpdCB0byB0aGUgKnVwZGF0ZXMqIG9uIHRoZSB0
ZXN0IHNlcnZlci4NCj4gDQo+IFllYWgsIEkgY2FuIHNlZSB0aGUgYmVuZWZpdCBpbiB0aGUgY2Fz
ZSB3aGVyZSB5b3UncmUgdGVzdGluZyBvbiB0aGUNCj4gbWFjaGluZSB5b3UgYnVpbGQgd2l0aC4g
SG93ZXZlciwgSSd2ZSBmb3VuZCBpbiBjYXNlcyB3aGVyZSB5b3UncmUNCj4gYnVpbGRpbmcgb24g
YSBkaWZmZXJlbnQgbWFjaGluZSB0aGVuIHlvdXIgdGVzdGluZyB3aXRoLCBtb2R1bGVzIGNhbiBi
ZQ0KPiBtb3JlIG9mIGEgcGFpbiB0byB3b3JrIHdpdGguDQo+IA0KPiBUaGF0J3Mgd2h5IEkndmUg
YWRkZWQgc3lzZnMgaW50ZXJmYWNlcyB0byBzb21lIHRlc3RzICh0ZXN0LXd3X211dGV4LA0KPiBh
bmQgbXkgb3V0IG9mIHRyZWUga3NjaGVkX2Zvb3RiYWxsKSwgc28gdGhpcyBzb3J0IG9mDQo+IG1v
ZHVsZS1sb2FkLXRpbWUtdGVzdGluZyBjYW4gYmUgcmVwZWF0ZWRseSByZS10cmlnZ2VyZWQgaW4g
YSBzdGF0aWMNCj4gYnVpbGQgY29uZmlnLg0KDQpUaG9zZSBhcmUgYWxsIGdvb2QgcG9pbnRzLiBC
dXQgSSBhbSBhbGx1ZGluZyB0bywgdGhhdCBzaW5jZSB5b3UgY2FuDQppbnZva2UgYSBzaGVsbCBz
Y3JpcHQgaW4gYSBsb29wIGxvYWRpbmcvdW5sb2FkaW5nIGEgbW9kdWxlLCBhIA0Kc3lzZnMgaW50
ZXJmYWNlIGlzIHN0cmljdGx5IG5vdCByZXF1aXJlZCBmb3IgdGVzdGluZyB0aG9yb3VnaGx5Lg0K
DQo+ID4gQnV0IGlmIHRoZSBjb21tdW5pdHkgcHJlZmVycyB0aGF0IGFsbCB0aGUgdGVzdHMgYXJl
IHJ1biB3aGVuIHRoZSB0ZXN0DQo+ID4gaXMgYnVpbHQtaW4sIHRoZSBsb29wIGxvb3BpbmcgdGhv
dWdoIHRoZSBlbGlnaWJsZSB0ZXN0cyBjYW4gYmUgbW92ZWQNCj4gPiBmcm9tIHRoZSBzY3JpcHQg
dG8gdGhlIEMgc291cmNlIGluc3RlYWQuDQo+IA0KPiBJJ20gbm90IHN1cmUgaWYgdGhlcmUncyBh
IGNsZWFyIGNvbW11bml0eSBwcmVmZXJlbmNlLiBFc3BlY2lhbGx5IGFzDQo+IHNvbWUgdGhvdWdo
dCBpcyBwcm9iYWJseSBuZWVkZWQgYXMgdG8gdGhlIHN5c2ZzIGNvbnZlbnRpb25zLCBhcw0KPiBs
aXR0ZXJpbmcgL3N5cy9rZXJlbmVsLyB3aXRoIGEgYnVuY2ggb2YgdGVzdCBkcml2ZXIgaW50ZXJm
YWNlcyBtaWdodA0KPiBub3QgYmUgYSBncmVhdCBsb25nIHRlcm0gc29sdXRpb24uIEJ1dCB0aGlz
IHdhcyBqdXN0IHNvbWV0aGluZyBJDQo+IHdhbnRlZCB0byByYWlzZSwgYXMgSSd2ZSBmb3VuZCBp
dCB1c2VmdWwsIGVzcGVjaWFsbHkgd2hlbiBpc3N1ZXMgb25seQ0KPiBzaG93IHVwIGFmdGVyIG1h
bnkgbWFueSBpdGVyYXRpb25zIG9mIHRoZSB0ZXN0Lg0KDQpMZXQncyBzaGVsZiB0aGlzIHVudGls
IHY3LjMtcmMxIGNvbWVzIG91dCBhbmQgaG9wZWZ1bGx5IGEgbWFpbnRhaW5lcg0KY2FuIHNoZWQg
c29tZSB0aG91Z2h0cyBvbiB0aGlzLg0KDQoNClRoeHMsIEjDpWtvbg0KDQo=
