Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FCF43A812;
	Mon, 14 Sep 2026 12:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789389184; cv=fail; b=BCvRX1FtXPrm8sKu6oNc8xmw66c/wrV5y+u/fOqlOVNyz6e43QYjvpOmH6G5rX+ZpgRmASr5voy8jzs23lUDiaci+m+nYrBCVfG/kD8wfEX8NuYMp1XtAwtGqe4DuFetnDg5uqieSrAW2jyKKo6j6evaeb8zOmvN9CAYfJdP0wo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789389184; c=relaxed/simple;
	bh=i4K3zjTrMuX4JmnLYywOYPZ/hHhPj1nEqD8SBNNAyAI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KwpEAwL3CuzXpJp5yY73RVOn7CZ/zBX8M5PT34RdWHJrgSZ1f6Djy5LPYtBZIaw0LPokawgiiqgjY9FboXousSsg3XGRFmP+Q5XZPud089homkREvZvBrQUKp90VSwekgnxiFeWpVTWnMfzlolb6rjSU70RsQ6Jb/iQyPLRMgb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=C6v+9TNN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=bcEmHSAi; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="C6v+9TNN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="bcEmHSAi"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E0ZRvN268988;
	Mon, 14 Sep 2026 12:32:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=i4K3zjTrMuX4JmnLYywOYPZ/hHhPj1nEqD8SBNNAyAI=; b=
	C6v+9TNN+6ECememfeCU4KC4Z2QCRqCRapCuP1KiPjOs9GL7E84DMCrZT+QEGSA1
	tiqL0J1HlaJknB780dGB4RbbqBb5Vo2sb+qpTQgGi2dE4m2JNw9rS8ADV1Zl0iGh
	/cetNGUv8gCvYomvjthyW2EauWL2sTq2L46Iv4RdWx3lngDxOj+M8+Fdma70D+77
	nE3l1wI7znkDWerIlElketxHgV9d7yWP3YiRMv0N901ehOp/Jcnuka3QrgVpNUPi
	fNYZSP47QkrPM8RAvbmWOORlIV2zivkMJotZ4q9lm4FnN7OzQtA6WFm6ekXBgyuL
	MrnPJXUTmQqluK2hBD4IUg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gmway1t2u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Sep 2026 12:32:43 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 68ECUNGV031087;
	Mon, 14 Sep 2026 12:32:42 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011025.outbound.protection.outlook.com [52.101.52.25])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4gmw6muvrw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 14 Sep 2026 12:32:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I7hE+ypX8qlXPgQidScbM9gdU6pJkHENtZYXTXD4j97IZil3kunAxvNjGyu7KmrZ2lvjAZaYmNNYRD8XeqBtXgpREHgUWVjbfDfcndWKn0iiZRIxzkaObsjwvn+FgPR4QWvTJNxXgMpCJOSHhp/T6sop1ICIovTwrYknWJB7vKfPnBVxAiCA4WKVhwDl89AkualY6MoMhkqXqoStdDlNUilcvIRBbL7BGrm66/6RcQlLBZUSKbSjtImfvw3VhiQZ3w3tUWnuGa13v0y11ZMJtGHJbFYB3dQtRUaTJlYPuvRK6SDl9tLt+14U6gaqPMjXlE84l8Nbb46kvgLXBvQCBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4K3zjTrMuX4JmnLYywOYPZ/hHhPj1nEqD8SBNNAyAI=;
 b=qoWE56koU4FE4uZr9LQz6FXn9IwJQv20cpBdberfathpD0ZcPb4qEoOiRibUN8bpuT0d8O3VBnw2l6IgUt6kahUeHFUVLFB7bg7N4OmI6r/6o9lNnpNeul/jyNGBajuqIZcAbE3UARmmW48QE6e7HgJtcWCMlwo/SjOCPEV3n6a8jX7NirS4VA6Gb4keFNrAvZEv3o75GaOOHF/nBLu3V9Xtxnwb2TU0qp9j5PlwohDAmoKTGnMZ6eKNTQFpXPGZeXTCMMWMHUaVkxh4ImFL+65uwM3X63gXe9jxHuFof+/ZMlvJHUWhDplLgQfqujX02MvZ4LBL9rgNuG38hDmZtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4K3zjTrMuX4JmnLYywOYPZ/hHhPj1nEqD8SBNNAyAI=;
 b=bcEmHSAisa2DRhCPLqATbZ1HVLrhgYuzeHij14SU1xELaSqFNpbqHWAroNNiPbhtjEul3rNtlz5Ow7s2hP9aKR15+DUOY9ToadppMCsIEHW2s2pWm9HAYSgr5S/du/saJzXqofMIe7bF21XOjbjLSW5Iqwr1Oceu/+/S4CJt6n4=
Received: from CY8PR10MB6659.namprd10.prod.outlook.com (2603:10b6:930:53::5)
 by CH3PR10MB6764.namprd10.prod.outlook.com (2603:10b6:610:144::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Mon, 14 Sep
 2026 12:32:40 +0000
Received: from CY8PR10MB6659.namprd10.prod.outlook.com
 ([fe80::a09f:da4d:e03b:582a]) by CY8PR10MB6659.namprd10.prod.outlook.com
 ([fe80::a09f:da4d:e03b:582a%6]) with mapi id 15.21.0428.004; Mon, 14 Sep 2026
 12:32:39 +0000
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
Thread-Index: AQHdLkjXOr5CvJFeb06L+v9F7yCyjLbN/EOAgAAxYAA=
Date: Mon, 14 Sep 2026 12:32:39 +0000
Message-ID: <6546A220-4B85-4780-8B45-F8B35D24139C@oracle.com>
References: <20260817130239.343594-1-haakon.bugge@oracle.com>
 <20260817130239.343594-2-haakon.bugge@oracle.com>
 <20260914103545.3db6eb45@pumpkin>
In-Reply-To: <20260914103545.3db6eb45@pumpkin>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR10MB6659:EE_|CH3PR10MB6764:EE_
x-ms-office365-filtering-correlation-id: 7a26da82-9eb1-4159-c564-08df125c43b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|38070700021|6133799003|3023799007|10067099003|4143699003|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 Fqx35pvdIreGSS1ml5z9wYSelG6Ot75M9XkcOHx8JSv21XavdaMzrb3fVaqfX4SM6zcLuy3A3rFCYJ/m1BUhYuWU1vlD2wbOm7etgUdWAeleMO0ucoZ5MWUF33FFD3wc4WPnyxZqaacQ7bGvfgL59/yf+6KS1n9P/Dyz9/hVHzf+KAuvdCI5RsvRAJdB0+G8G7VoQ6uZMZTstCa7S2mnEahfR0p3fAnDgO4ShUeBX3IJtCDUrNgeAPxNqaTIurjibIdddk6TwEfzlL+hrN0EbAc+rI0aQ+5Zy6D8/d861bjXJw3tp3O46jdFig6rkt3DAa0Xd6zKskpkYke8kZOOlc16Vw+WXSaD1eWUDihkyddCNDSqvkMUXdi0NmzaqRQkPH0HNP6N3+g7tt/b2C1FftfCCNBiSY4077V9gMuksg7XLVfhjjGV+oqbwE2IyCrz4n5bbJhuBC6sf9Bb9UpFHyw/eKQQNdeIS2tbqvhWIigz1Jw1RN4f/q3W48w5I/Aa+gUQM9j/u6PelhHcBsAtKdirriY5RQ3Wh0kAL2NiCu683Cpi0AlxqCqmKGSO6fLU/rtvcK6uFBvq2C220NRYhmaM+wj4rC36uJ5N7xfippvq633VHClwkmHRvWZ+Wp+Myp5PgxeIlzv4HmPXyFDMxGBENtVnuf91CUVnvh6g1Yxo7b2D7HqydS8f/uU43PppN51OuMUruRE+LV/kk/J/BjEzVssO1CDo4bpwYG1iBmw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR10MB6659.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(38070700021)(6133799003)(3023799007)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cWFOL1pnTkxaelFoa2g2YnV3L0w0SkhCTXBiN1NQL2pleHJMajBiOHNpOVBT?=
 =?utf-8?B?L0NlSWRGMUptWmVJQjR3ZE5WenpXblVOWEdUdGc2VjZvejZSOVJ5cU4zc3kw?=
 =?utf-8?B?OERUSXJXZUZrNGlwN0RMWnhXeWk3MmFtRmpCb2tMWlFTdEE5dEhSdlJvT0cv?=
 =?utf-8?B?V2p3Sm4xYTFYM0FyS2VpOVFtTVNBRFVUdGhJRi9jQkhKS1pGaVZNMk5kRzU0?=
 =?utf-8?B?YmpDa0lOVTNuRXB5blR2RmZmS3hOU0xyTU0wYkYzNDNXMHZKNkxOZHB2V0Yx?=
 =?utf-8?B?R2dTclQxdnhQYlVJMzZGdGpZMkw1ZThUZldoZUJUOGlGYjJZZHIwMVhWOEpI?=
 =?utf-8?B?VVJuZkFoWkphVzVNQ0IzVVdHTDFiVG1wRks5MzgxbmRuVWtmWGlOVmswV0hN?=
 =?utf-8?B?WThKZkdKT3FKM1Jia3RLdk8zQUVqY0hlK1h5T0JucFI5aXlHU3ljVmhIeU0z?=
 =?utf-8?B?UFRac0lSQU5hU0h3SXA2clFzREl0TVpCWTJSWEZwVldIaVJIWFQ0QkpFL080?=
 =?utf-8?B?SFFWb0x3M1N2Q2VoT2w0aHB1NlNtSWlmNk8yZUR1OHhPNGoyWUkvR0lOSDZS?=
 =?utf-8?B?QWp1czQ5RVZmY0xXdkgreUdNVFFybmx0azlLRmNLVW5iMDl0aDBBNU0raTg4?=
 =?utf-8?B?czd4d2JvcDlqV2twUEZJL0duY05rcEpjbXE4ZzBKU2twMHlKcU12c1VSK3cv?=
 =?utf-8?B?ZysrejFkYnEzNzBlNlUxM3hwQjhzMUZXZUp4Q3hHa1pSZE5TaFhsdDNlRC9m?=
 =?utf-8?B?ME1xQmNRYTJRSllDWFlkQzlBMHp2cFEwZmFHSk5iaGY5L2FFMGdHeGt1ekla?=
 =?utf-8?B?SEFxS09qT1FMY3loTFhjTCtkV0hRdWZqR1psNThWd3ZHYlFGY2doNkFBbGVp?=
 =?utf-8?B?VXBZVi9xUXFKQVpIRENjQnA3OUMxSDlLRDZMYzlJbXhIVjhjTGxBTlpsbjJM?=
 =?utf-8?B?dnR2cmRReGpwMEFuaXBWSHJMVG50WmxYVDVJSFZGWHBxV0xlZ1V3dDZ2a1lK?=
 =?utf-8?B?aFQwRk9vdTVXL0F2TDRsQlo4OEo0S216TGVpR210RHRsdVhUdEFjM1RydFcw?=
 =?utf-8?B?SWgzYnZnSmx5eUVrKzdlN0oweTQxZEJqc0YzWVhDT29lWmhHQ0pIUk51b1pw?=
 =?utf-8?B?UWN6cVgwQkJvdXVLSXluUGRya2s4NHAxNWpNcVM3SEtUV1BsL0FxamlZWTMv?=
 =?utf-8?B?Rmh4K0s0ckRhelpqU0Nhc0c2OVRJMWwza1ByU3FSeVgyL1RHNUZZN3JTdEE1?=
 =?utf-8?B?UzdYQWVhZ3RwRGdpSkNqdlJDbUF3Zm9uRWx6TUFGVEFVdUtnUW54cVV1U0lG?=
 =?utf-8?B?amtWM3NvdUVBcGVrQnp6UThWQjRVckJicmdYQ3A4VTZ4bHQrRXUxeE9UbHZX?=
 =?utf-8?B?UEo5ZkM3MmVLaGp0S2RzV2JzaVpLVENObDJOWm9lSytMZlpVTWNLeVhubE83?=
 =?utf-8?B?eU1zZzJvNTBYZUU2eDdXczNmNjFidmlzaURPNDltbEpPWG4xYi9BSm15UlRT?=
 =?utf-8?B?ZGdsWTNFRE42MlZSamZibFpnUm96bURZblUxS200SDdXRUdyYUxwU1Nlc1hJ?=
 =?utf-8?B?OXF3clowR0Q2eWVmM1diMlBsUUQrd1N1MUFkSmhacHNpRWxwTzVFbTZBYXow?=
 =?utf-8?B?NjZvblAyUnVCaERpNDAyNkF6QUZGS1EzWU1GeHhHRjk4eDZRSGFudmV4Sm51?=
 =?utf-8?B?bTQyaTBmdDR0NUFYSDlId0pHYUtlNDNqblQrWldqc3RYcDN5dGZkMUpwMlN2?=
 =?utf-8?B?U3hobjZSa2tZM2tocTl3UkgwdjhEaFdQNXR2aWMzdXJTSXVjTE4wYy9kMnl4?=
 =?utf-8?B?dFd6VzNOK3hEYkoxVzNaMEYydTVsVkEyZ0JaZ09WTm8vWm5uRmExVkt6L1ND?=
 =?utf-8?B?ZkhpNFRwRnFNSnpNY2pNVGpmZmxkK1dZVkJvRWNaU25lUTZrOUJZS1VKNlgy?=
 =?utf-8?B?bzkzMmlGRXRQbXNnWmIvWDFXTCs2ZkJNbXRFNVo2ejRTNDVtWjlab2k1c3Zq?=
 =?utf-8?B?TGZTU2ZrSXBnZEQrRXlueE1ld2lwcDlPejZpWHVFY0MyaEtBdWpGNHdxRGRZ?=
 =?utf-8?B?UFd6OWw5WmIzT1NaSFBDVGRCUE5UeEJnNWVkSVltU2oyU3VFTElmRldKdFBH?=
 =?utf-8?B?eWVZMm9uaWdRYVBHNU9hWFlPNHdtSGkrQzY1YkQvVXZJdVE5YTlJb29TNEZS?=
 =?utf-8?B?TE9rWU4vdk9qWk9wV1lRK25XaUx3SGNiOU4xVkJKY0hWaldKckhrSjRKUFJw?=
 =?utf-8?B?bnJ4eUU5b3VEN0wxNG96ZHhMU0ZQY0srZzR5TWZ6OFhoTnBOT1dBYlhHT3ZZ?=
 =?utf-8?B?UEtzbWJ1VHU1dnkzU1lHTlg3NVMvQng1WFQxTlQ5ay96clAxc2t1WWNVWS9P?=
 =?utf-8?Q?8kgkELS0rRY81dUo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C0E10E19CB1A904BB858F6376E9B2029@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	zPT1Aqw0jXycU2C1CIRXg/o125bcZtOjUJUk03a2Se9jhiD+RdPs46dqVkY+GNkN0IaaPMYFgq5GSce6u2aXEvNGgQpBTICEGsgWomXB2jOv8mN3ZAsf/jh0WWhx/bXq2qfqGGhNVaTurLyCxflp2ZpqoLL1YOUppq4UtteAjWqIAMG9nBLCh1msPUV8MAx+ZA3hUqet68RiQZeQzUxIp+U2J+jdvZ1tg34OehYjIvDkojMdDK8Lz6tmmlLNJTIBiX2rc5uUfyJqRmHCfsnzLxUkt+zKjac3h+vE8jREelU0w/rJn/Ns4vVY/BOJRZRm+XiZpHmfaQpwEBbTDaTQgA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	y8FZIZDrMFdgorcSFVlH75A2tlaiOcaCUX38l45siPwstRAyaejOZ4fvF8eTr18pIQEeB+VkjH4N2kL+R+B9xPxvqgM3obgiGAFR0G1RgtaHUflCdX3Xq4RlsujeKkqQjhu8aKdGHfJRgk9P/oeiQB9m0lSk8xaBJYbx3hgEgEfeRJAs8DPexf9PF7RihMTVosqeOmTkW4gIADd9uTesuWYd2TC4jIYtZByEjoNhNFAVq4JTvVhaMrxnBZP+z7Z/9e3JGSLG1j2/n+oTpsb/wGkI6NDBE3+S+KpsFbRLFQq68S6r9Qd1sdAmURvLYJmMihqE0DRxYHJvOIij5O00oPmwFjMdVzpz41LMyen9t33NJ6F9jydk0F5SKBKR4Q7TIKleb3u1ioNTF0WQQW/704yWiIoWX6Vg6AoGPXqUmR3yX9Zq5ppczRFfZ622Fqu8BMhXrnU5Met944xfSXi06jZ7W/RFQt3hu3tsopn8uw8pxTphWC+nToZV8+DKilzxkk+42klbur5mhv3XrlH0LsxXhVe66Pvjf7EwEmZWH0EuSMkbL58vA+dh5rQTANKqYsztI6oo1D4Caz2pn/vmPWcY2dayIgjBFje1vO04hHY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR10MB6659.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a26da82-9eb1-4159-c564-08df125c43b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2026 12:32:39.1820
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sspczoh9c9Hv8CQ62ryaJi0MgvQbELARMlTZPmpk9twsJzAhtNV2sgvxT0n4ImiMCbyD6FQRbS4aKMnJboJ/Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6764
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 spamscore=0 mlxscore=0 mlxlogscore=999 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2609040000
 definitions=main-2609140178
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3OSBTYWx0ZWRfX+WIoQ8whlnB/
 jAkyPPoVJOaiTpKq1QwnvpSXnqGlEfyt4Ib1smAH8IJAZNAFsMfOtaVvTDraIh/UypiiHlbMMFD
 OOXr0gbpxVUH6jKfYR+s3VsETsqXnS5+llb80k+xjuS8SDwimk2N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3OSBTYWx0ZWRfX0bc3zzHr08c0
 jZlmPTipC2DkDAlg/fygWcnUI5AncJ0MDtFPqSJcfTxfk4nG4cz/nTGg8hhNBKA8D9lVq3M0jMn
 0uVegMjdCT4vQoDcnVka5dt0936rFZYxLj1fQU4xy3tr8RX2/zynlIEZxK9eEvz/FR0SXE682B8
 +JxoEAbLQBH3g7xoS7RY8NEXgQBktmWe0cfX/DUlwrkYGklIACKcHA3WUFk5me00b8ayoZbAjAU
 uWrWynkUB0xXH6mdxN7R6OMh8jHZ5BqNhmbx+y48vogiebciFqIwL3nVE3yDb0UqaOmZE56I7q+
 1AgkbnLXj+DEg11iFKfIEIKeKT+S3zgSUmB7ErNRQMneQINGxhM5AhCEqzwRtPGeCM7FZXPTmCl
 HRG4XuF8DPWHbJdbE3u6daW3ytqHRHhhLbTUbPVOFgfYFmtNUurAr/s4oQOJQGdfbq2rSWD7l7l
 MzNGcfKbm61m/p3kVvqINaBf23AjvPymUfRTtuSk=
X-Proofpoint-GUID: mYxTKoJmA3Ic4baiV-sao4Dr-ZIMq_PE
X-Authority-Analysis: v=2.4 cv=GIadgeNK c=1 sm=1 tr=0 ts=6aa7e96c b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=GoEa3M9JfhUA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22 a=RD47p0oAkeU5bO7t-o6f:22
 a=pGLkceISAAAA:8 a=yPCof4ZbAAAA:8 a=6Gn_LzqnzLPgVX-r_u0A:9 a=QEXdDO2ut3YA:10
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12106
X-Proofpoint-ORIG-GUID: mYxTKoJmA3Ic4baiV-sao4Dr-ZIMq_PE

T24gMTQgU2VwIDIwMjYsIGF0IDExOjM1LCBEYXZpZCBMYWlnaHQgPGRhdmlkLmxhaWdodC5saW51
eEBnbWFpbC5jb20+IHdyb3RlOg0KPiANCj4gT24gTW9uLCAxNyBBdWcgMjAyNiAxNTowMjozNiAr
MDIwMA0KPiBIw6Vrb24gQnVnZ2UgPGhhYWtvbi5idWdnZUBvcmFjbGUuY29tPiB3cm90ZToNCj4g
DQo+ID4gQWRkIGEgc3RyZXNzIHRlc3QgZm9yIGxvY2tpbmcgYW5kIGF0b21pYyBzeW5jaHJvbml6
YXRpb24gcHJpbWl0aXZlcy4NCj4gPiANCj4gPiBUaGUgdGVzdCBtYWludGFpbnMgYW4gYXJyYXkg
b2YgZWxlbWVudHMgY29udGFpbmluZyBjb3VudGVycw0KPiA+IGluaXRpYWxpemVkIHRvIHplcm8u
IEl0IGNyZWF0ZXMgZm91ciB3b3JrZXIgdGhyZWFkcyBwZXIgb25saW5lIENQVS4gT24NCj4gPiBl
YWNoIGl0ZXJhdGlvbiwgYSB3b3JrZXIgY2hvb3NlcyB0d28gZWxlbWVudHMgYXQgcmFuZG9tLCBp
bmNyZW1lbnRzDQo+ID4gdGhlIGZpcnN0IGNvdW50ZXIsIGFuZCBkZWNyZW1lbnRzIHRoZSBzZWNv
bmQuIEVhY2ggY29tcGxldGVkIHBhaXIgb2YNCj4gPiB1cGRhdGVzIHRoZXJlZm9yZSBwcmVzZXJ2
ZXMgdGhlIHN1bSBvZiBhbGwgY291bnRlcnMuDQo+IC4uLg0KPiANCj4gSSB0aGluayAxMDAwIGVs
ZW1lbnRzL2xvY2tzL2NvdW50ZXJzIGlzIGZhciB0b28gbWFueS4NCg0KSSBkbyBub3QgaGF2ZSBh
IHN0cm9uZyBvcGluaW9uLiBNeSBleHBlcmllbmNlIGlzIHRoYXQgaXQgZG9lc24ndA0KbWF0dGVy
IG11Y2guIEZvciBleGFtcGxlLCBtb2RpZnlpbmcgdGhlICJhdG9taWNfeGNoZyIgdGVzdCB0bzoN
Cg0KTG9jayBhY3F1aXJlOg0KCXdoaWxlIChhdG9taWNfeGNoZ19hY3F1aXJlKCZlbC0+bXhfYXRv
bWljX3hjaGcubG9jaywgMSkgIT0gMCkNCgkJY3B1X3JlbGF4KCk7DQoNCkxvY2sgcmVsZWFzZToN
CglhdG9taWNfc2V0KCZlbC0+bXhfYXRvbWljX3hjaGcubG9jaywgMCk7DQoNCih0aGF0IGlzLCBy
ZW1vdmluZyAiX3JlbGVhc2UiIGFib3ZlKS4NCg0KVGhpcyBmYWlscyB3aXRoaW4gb25lIHNlY29u
ZCBvZiBydW50aW1lIGZvciBhbGwgdGVzdGVkIG51bWJlciBvZg0KZWxlbWVudHM6DQoNCjINCjMy
DQo1MTINCjgxOTINCjEzMTA3Mg0KMjA5NzE1Mg0KMzM1NTQ0MzINCg0Kb24gYSAxNjAgQ1BVIEFy
bSBCTSBzeXN0ZW0uIFdoYXQgX2lzXyBwYXJhbW91bnQsIGlzIHRoZSBwYWRkaW5nLiBOb25lDQpv
ZiB0aGUgZmFpbGluZyB0ZXN0cyBmYWlscyBpZiBwYWRkaW5nIGlzIHplcm8uIFNvLCBpbiBvdGhl
ciB3b3Jkcywgb24NCnRoaXMgcGFydGljdWxhciBtaWNybyBhcmNoaXRlY3R1cmUsIHRoZXJlIG11
c3QgYmUgY2FzZXMgd2hlcmUgdGhlIGxvY2sNCmFuZCB0aGUgY291bnRlciByZXNpZGVzIGluIGRp
ZmZlcmVudCBjYWNoZS1saW5lcy4gVHJ1c3QgbWUsIEkgZ290DQpzZXZlcmVseSBjb25mdXNlZCBh
ZnRlciBNYXR0aGV3IFdpbGNveCcgY29tbWl0IDI1NTAwYmE3ZTc3Yw0KKCJsb2NraW5nL211dGV4
OiBSZW1vdmUgdGhlIGxpc3RfaGVhZCBmcm9tIHN0cnVjdCBtdXRleCIpLiBTdWRkZW5seSwNCm5v
bmUgb2YgbXkga25vd24gZmFpbGluZyBjYXNlcyBmYWlsZWQgYW55bW9yZS4uLiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIA0KDQo+IFlvdSBhcmUgdHJ5aW5nIHRvIGhpdCBjb250ZW50aW9uIHNvIHlvdSB3YW50
IGEgcmVsYXRpdmVseSBzbWFsbCBudW1iZXIuDQo+IFBvc3NpYmx5IHNpbWlsYXIgdG8gdGhlIG51
bWJlciBvZiB0aHJlYWRzIHJ1bm5pbmcgdGhlIHRlc3QsIGJ1dCBtYXliZSBsZXNzLg0KPiBQZXJo
YXBzIG5lYXJlciB0aGUgbnVtYmVyIG9mIGNwdXMuDQo+IA0KPiBBbHNvIHlvdSBhcmUgb25seSBn
b2luZyB0byBzZWUgYW4gaXNzdWUgaWYgdGhlIFJNVyBvZiB0aGUgJ2NvdW50ZXIgKz0gMScNCj4g
aXMgc3BsaXQgYnkgdGhlIHNhbWUgUk1XIG9mIGEgZGlmZmVyZW50IHRocmVhZC4NCj4gVGhhdCBp
cyBwcmV0dHkgdW5saWtlbHkgZXZlbiB3aXRob3V0IGEgbG9jay4NCg0KTm90IGluIG15IG9waW5p
b24uIEkgaGF2ZSB0aGUgIm14X2J1c3RlZCIgdGVzdCB3aGljaCBkb2VzIGV4YWN0bHkNCnRoaXMs
IGFuZCBpdCBmYWlscyBpbiBhbGwgY2FzZXMuIEl0IGlzIGFjdHVhbGx5IHVzZWQgYnkgdGhlDQpz
ZWxmdGVzdCBzY3JpcHQgdG8gdmVyaWZ5IHRoYXQgdGhlIHRlc3QgaGFybmVzcyBpcyBhYmxlIHRv
IGRldGVjdA0KZXJyb3JzLg0KDQpBbHNvLCB0aGUgYWRkZWQgc2VsZnRlc3Qgc2NyaXB0IHBlcm11
dGF0ZXMgbWFueSBvZiB0aGUgcGFyYW1ldGVycy4NCg0KPiBJdCB3b3VsZCBiZSBiZXR0ZXIgdG8g
Zm9yY2UgYSBzaG9ydCBkZWxheSBiZXR3ZWVuIHRoZSBSIGFuZCBXLg0KDQpUaGF0IG1heSBiZSBh
IGdvb2QgaWRlYS4gQnV0IHVubGVzcyBzb21lb25lIGNhbiBjb21lIHVwIHdpdGggYSBjYXNlDQp3
aGVyZSBpdCBpcyBuZWVkZWQsIEkgYW0gYWxsdWRpbmcgdG8gbm90IHB1dCBpbiBhbnkgZGVsYXlz
Lg0KDQo+IElmIHlvdSB1c2UgY2hhbmdlIHRoZSBNWF9BVE9NSUNfQUREIHRvIHVzZSB0aGUgYXRv
bWljX2xvbmcgZnVuY3Rpb25zDQo+IChJJ3ZlIGZvcmdvdHRlbiB0aGUgZXhhY3QgbmFtZSkgdGhl
biBhbGwgdGhlIGNvdW50ZXIgYXJlIHRoZSBzYW1lIHR5cGUNCj4gYW5kIGNhbiBiZSByZW1vdmVk
IGZyb20gdGhlIHVuaW9uLg0KPiBUaGUgZGVmYXVsdCAnanVzdCB1c2UgKz0nIGNvZGUgY2FuIHRo
ZW4gYmUgbW92ZWQgdG8gdGhlIGJvdHRvbSBvZiBteF9hZGQoKS4NCg0KVGhhdCBpcyBhIGdvb2Qg
aWRlYSwgYnV0IHdlIHRoZW4gbWlzc2VzIHRlc3QgY292ZXJhZ2UgZm9yIGF0b21pY190LiBCdXQs
DQp3aGF0IGFib3V0Og0KDQpzdHJ1Y3QgbXhfZWxlbSB7DQogICAgICAgIHVuaW9uIHsNCiAgICAg
ICAgICAgICAgICBzcGlubG9ja190IHNwaW5fbG9jazsNCgkJOg0KICAgICAgICAgICAgICAgIHN0
cnVjdCBtdXRleCBtdXRleDsNCiAgICAgICAgfTsNCiAgICAgICAgdW5pb24gew0KICAgICAgICAg
ICAgICAgIGxvbmcgY291bnRlcjsNCiAgICAgICAgICAgICAgICBhdG9taWNfdCBhdG9tX2NvdW50
ZXI7DQogICAgICAgICAgICAgICAgYXRvbWljNjRfdCBhdG9tNjRfY291bnRlcjsNCiAgICAgICAg
fTsNCn07DQoNClRoZW4gYWxsIGxvY2stZnVsbCBjYXNlcyB3aWxsIGhhdmUgYSBzaW5nbGUgIiAr
PSAiIGNvZGUuDQoNCg0KVGh4cywgSMOla29uDQoNCj4gDQoNCg==
