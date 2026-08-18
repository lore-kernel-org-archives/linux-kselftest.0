Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380C7274FE8;
	Tue, 18 Aug 2026 08:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787040891; cv=fail; b=ivJJKeCeTeQQlYmMVWsSiiNjCP57pQxYyAtZrAyECqjLxyQ6WmYHBk0HfKq4TzE5uCDa+QIOSGP7B1c0fhfpltvJq8/qpYlgaV8dJBWu167pYu5DOnGnni3PRlGYsNI6RHu2gqw+ReNu7Vmw4/yV8NUtv8q7bfEUVds1t0/+C18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787040891; c=relaxed/simple;
	bh=2s48SL3/bo1or9jPteuG5cyWufrYop5UriQYfdJ3Q6w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=isWd3wvnhifmZNm5VRXgLqRSNLwUUtQVwO6nRmaqv1wZ1enx+axueHdqap6qar8VsGlhBkMT+gzTev5BSXNdc01cgEAz5/EZKB43Wu2J2tHt4V8djmkcfOUYiE7BH/tgSdmif4zGwENjZnetfnJF/4z0AO4BhujC3E3R4I7syvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lVhrwGeR; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=TrhIde92; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lVhrwGeR";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="TrhIde92"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HLNQgc1414983;
	Tue, 18 Aug 2026 08:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=2s48SL3/bo1or9jPteuG5cyWufrYop5UriQYfdJ3Q6w=; b=
	lVhrwGeRUBRFB/wHcX+4x6BM9kHfFL51Lp4SXs7P/zz3kzWEyOdL/vBVsWCb4drn
	Kn+OcmD6Y90+67OdlJCzjjaA+hsQwYMFVr8mrlO18/5A7DbNPwGtuwlI390zvZaw
	F9m9OrYduk9zX7zh/ZzXnklD2a/zydxA6avqqDJfbppG7yVq67HP/qpPC+FMJldX
	qeKAFvcUXgdvCjU2MpInSePeJdAVoSFVwXSJ2qQQ4kZwA2T+u5mtaKZ8gdbupPu0
	PpzFU9pdfIYOtqE3vxt7aBuwazz8K/RIgrFbDITT8L5cCjHSYsbFlXNW++u5JxF7
	M/sCHV3Vcl9hpJxb9bCTfA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g2epy40fd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Aug 2026 08:14:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67I85oZD014394;
	Tue, 18 Aug 2026 08:14:34 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012049.outbound.protection.outlook.com [40.107.200.49])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4g32hqfmy9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Aug 2026 08:14:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PKm3Yp32YJOtNHrbtaSahXj5PK73PwFdBLCT+83poq225EtYgAtVFjXq4ey7DgxOvmjhtEkHBuTXq8x+NevIGNvXTuxCIolvXWzhzER5wCXbBe88nHfqvfqfcsM6r7VNaKctuOsti2zOckJEwBxVqw8peXSQZlWLg7pjNGncCyRq57mJhDoHyDEEzITcMH/2F3ThwcTyJTTjI3qSMS3Af+9f0xqsUyi+qHOhpWRfssijxeprVo/bVHfJ10mnFZKShD8qWahwkDtsaBCvrpKji8ZZ6D9Q1YTYZ3/vg3ks/cSRKYjKgkK00gjkh1KJU+0yI3+Jency9q4NbR+n5jNpkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2s48SL3/bo1or9jPteuG5cyWufrYop5UriQYfdJ3Q6w=;
 b=FnsZ8xt/i46We9SdVD+ahke2HVPiOhNZdgKMtKU0AB5t6zM1LcIvNXCbouVc+mOlBhiaoN76YOpZxMXC6/Y+duksUjwRihc7CzY/pBW0lmTmthbQVZxZsXabl6AbtB3m61/43ufljU3zFXsDgGFoxbIFIxFfVXMnZCmpFRHbzmDZyrZkS1/YiwTRv3eCdEFOKZrZRhh30lzkoh0hAZQO8uYTZR39kp5BcR/z6/uhCZK/XTocw98Eoiem6IJewZGtAt9EnXRgImdKlgALr+2CjWq4lnZE//n3LRmACy8jx/0NdNnobaW7Lp26IBKkbc8+21NXDRtGHf80DPX64QAUVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2s48SL3/bo1or9jPteuG5cyWufrYop5UriQYfdJ3Q6w=;
 b=TrhIde9221DGlYreMnMQxQErRlknJoJIKnfp14XdMPFIscKRPJXPkfWyzO0dGqhVPsBr3d+uZkRIz0KpeMwHzibUqYm3pO4tPKWthmePdBDxZX2XFcIvqldtqrcHjcfxy5hheHw3H3AOCAUI5boCk3u8LC9FAKGbJfGf26YYLoo=
Received: from IA4PR10MB8326.namprd10.prod.outlook.com (2603:10b6:208:56a::7)
 by LV3PR10MB8154.namprd10.prod.outlook.com (2603:10b6:408:290::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 08:14:30 +0000
Received: from IA4PR10MB8326.namprd10.prod.outlook.com
 ([fe80::7da7:fa97:9791:4aeb]) by IA4PR10MB8326.namprd10.prod.outlook.com
 ([fe80::7da7:fa97:9791:4aeb%4]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 08:14:29 +0000
From: Haakon Bugge <haakon.bugge@oracle.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Ingo Molnar
	<mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Boqun Feng
	<boqun@kernel.org>, Waiman Long <longman@redhat.com>,
        Andrew Morton
	<akpm@linux-foundation.org>,
        Shuah Khan <shuah@kernel.org>,
        "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
        John
 Stultz <jstultz@google.com>
Subject: Re: [PATCH 0/1] kernel/locking: Add mutual exclusion self-test
Thread-Topic: [PATCH 0/1] kernel/locking: Add mutual exclusion self-test
Thread-Index: AQHdLkjKW1Ho4Y+vgku39nN0CUkp8LajcQkAgAAFh4A=
Date: Tue, 18 Aug 2026 08:14:29 +0000
Message-ID: <08D165EA-24DD-4432-9E6B-E0000C6D0B02@oracle.com>
References: <20260817130239.343594-1-haakon.bugge@oracle.com>
 <20260818075432.GA1247881@noisy.programming.kicks-ass.net>
In-Reply-To: <20260818075432.GA1247881@noisy.programming.kicks-ass.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.600.51.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR10MB8326:EE_|LV3PR10MB8154:EE_
x-ms-office365-filtering-correlation-id: 3ac65079-3870-4210-486b-08defd00ba32
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|38070700021|10067099003|4143699003|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 3Ov1wee+D8qcjEIW/Gb7/kp+BvHTINCEg31lDeVvMFJy4meMTIlQw6cDjDgnTq9Ei3LN41L9M846qYLxiOL647pBvgqkIBse9UYnapZbH2vRN8fdIETHXuRogiD7fccA0aLXT4JaP0wKramuBfIYnl946K9Qz7mEW4CKM7TIJFaeTmj0jix1A330LaeIj0gmDtvl+bBQ01oPHPamRiRU8TxBNm/qMNzDysq2oVDccX6W6PvC4vbtNM5xbLwBsa+ouY1SW+xnjfQQxPYbU+bhu9WrUzAhs3qSjf0VIlG8OqfEl79G/X6DV9TyTiMzH38davt1MZZocqVDALxtCR5UVqh4q7VqXEWQKjPlPZDKPg9RaBBsmbzI90EoxS3g/8MEza4y+hCkQYyscaP3y7UMChsAXwIH3gKP11aXf1+lmx9tHxi8+uV8kPKGlc0Zw3HOHArnChI3bM1xJmpXEP02VtZtjLZjWujw7QfTgLApSQfEbikNfxUYHnbUgskR7/wywVwS19sR2Go1hesxtBeMdWe2XFCdFAiwoLxw81BVbCbvvHDq/g7FDf4oOGAS11/yVsWYrFuCyh2beA4P0tEpI3+mqAf69SNECi7+LvdfmnoMQKXmJFSwxeOReRImHN5MCV9itSfnma/yTAVfHeWP0RmfSWHj6QuuzZQQe+GMSYuHZwTeZlh4vZ8AeEKKbUpQIzV7PAkkXR3KggznajyUWdKKHUgf8jxJXeZnA0vGGP4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR10MB8326.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(38070700021)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TDdocm9yZldrZ1B3THNFa0crODlJUVpDZlppQlVXbWpxb0VVVFdQRm5FWVpt?=
 =?utf-8?B?eW9uSkZtdzlUKzBadDJFQldyN25CVnhNZ1Z4Z3RCb00rWUZ0RUhhMVhFOXZQ?=
 =?utf-8?B?UzRCM0ZSeGF2L09McEwydXFhV09FR2VBb3lrU2RZVDZjV3Z2d0J0VHg1VmZa?=
 =?utf-8?B?bHozc2dKYTVsU3l1a3VsOU5YSXVDYVkwRERDVjhEazY4bm5wSnRQcVFxNjJm?=
 =?utf-8?B?OU5vS0h1OWVPV3F0ZzRLL2NIeldzazE3QndwRWFyZUFKeUdtSWFERURVV1la?=
 =?utf-8?B?Ri95OGd0cnMrUWdsVmkySlJRcDJ3MFgyT1hYckZiQ3VYc1RmSnFvVWI2U2FO?=
 =?utf-8?B?UExIYkpDWjhCTnB0MDFKKys3N0pkWDhjVHdWZDlHNm55SWViV3Zvb2o1UVFk?=
 =?utf-8?B?RG91SnkzSzJham9UT1ZUVGc5SjhWMDZ4MWJpcHk0MElQUzUwUENGNENYWnlY?=
 =?utf-8?B?SkR4YlVHK0c5VG5RUEtubzIwQTVZdkpwaDBmc3UwVk4zeEoyS2htVnZzNG9m?=
 =?utf-8?B?Z0pFTXBPSjRzQnpoMlhPL2xiVkNlWE8yQ0tjQy9oVkdmNGdNSkVuU2hPOUgz?=
 =?utf-8?B?SHdCemNXdHlzOWpoRVlqWVVGRUVwRWJ3aVlvNzNPUUtFSStYczVRWHhiSGg2?=
 =?utf-8?B?a0VnVG83Ynozc3BjejBzQ0lhTjZBb0xvdWtRaDdjd2xDd0dyMGpUVVk5bmRz?=
 =?utf-8?B?a0t6YTdjMWdqV01JWUtMVEh3aEN3RTFaaUNjV3VRZkU1SXArcEN2UjNQMm9M?=
 =?utf-8?B?TXBHMFFIVEVCQ2FiZFRYb3I5bGZTaXRoSjlEdnl4Wnc4TUQ0YkZDczA0V0F2?=
 =?utf-8?B?c1NSaytCQkRUMzFLSjlZa0NjRERnQytUTHJsZStmTlNJTDVDQmpFcjVnUFNH?=
 =?utf-8?B?dHFocXQxNHdKR2lWdWVkakNaL2FJSVVOYzE5RWVIV3h6aXgwdlVmL0dzSm5q?=
 =?utf-8?B?dmUzbks2SWNPYVc5S0ZBTXZ5VDlDYnVlVHpyTTVKRjQ5MUtoNmVpK0NuQ3NZ?=
 =?utf-8?B?dzdXMGtVNlB1dE5UeU1FSkw3emRxdGd0dGdjdkZ1TGF1cHBpeTFFQXpHaXoz?=
 =?utf-8?B?VnlWSnUvbkJHd3JxTjJxR2xiRWQ5emFMVlpYOThGUFQ3Y3JLVGNrNEkwSHVp?=
 =?utf-8?B?RVVqNlhxeExEemtSa2k4YTZVekxEMFIvSDNtZnhGTktTN2hDQ1V2bURvK0JD?=
 =?utf-8?B?SDFyYXhTbjlXNldxMFl3RlVkaFpUcXFkUmVTeTRjbHZwelBCWnNwdmdBYzBs?=
 =?utf-8?B?NDN5OTFQYlgyOUJucjE1UzJ0ZFJnZ29pY1hmVjl5R2oxQXJsVTRBWms5OU8w?=
 =?utf-8?B?SkNkcCtUdkl3LzJlbEN1SE9LelE3dHcyQkZXWnBkUmdHbnZQeGFPYi9sMHlZ?=
 =?utf-8?B?QkJENGhwQnhMdFBGOVByeU9BZVRici9qbXJDWjJiSEtLTmVKbkZTbkZIWkRt?=
 =?utf-8?B?SXRKdjFPMVhhc2ZsZ09QbVQ2bjhmb01ycUlES3pHVHBpWXlYUmhnVUc0VTUr?=
 =?utf-8?B?TE1OMzNLbTRyM0pZLzRLRzR4d2Z5L2FUVUU5R2YwcmFEY1QrczdyWGQwdEtM?=
 =?utf-8?B?a2N2WUpKV3RPWmJKYkdwOGpwOWhWTzlRQjVPeGIxQTBnU0kxZi9qMDlEbGhS?=
 =?utf-8?B?ZzRUK1hTckxEMFdpcDVLdk9BaVZDdnQzYkZlZmlJK2N3NlhTMXlTempoTkph?=
 =?utf-8?B?d0RxTks4ZnFSNHNUUmFaUWtEbllDWFJwU0hrSk1lMFh5Uk1QdWRBUkY4bUx3?=
 =?utf-8?B?Tm9YcGRiMVF2Z1FVMk0ycytCUGUzbHF4WjhWQzM3bGhKVDgwTEs4NTNjVlIv?=
 =?utf-8?B?RTh3bHFFMGpkNHRCN3hNQWlYTHNMWTROTkFSNmhtOFBwZW5aTEcydjF1RU1k?=
 =?utf-8?B?ZUFxVVgxK2U3Y2NmMVRHMGVOcmxVM0o0L1kwN3BNV2tHRGtXMlkzeTVKTkx4?=
 =?utf-8?B?dUhKU0VVVHNMck9xZHZmU3I0dG9KMzJqaGx0WXJGL052YUtzVEQxWFl0OXBW?=
 =?utf-8?B?azZiak5IMjRCWk40ZDZ1cFUvWGlOYm1XNnZwekUzdVUzV01YK3V4OWs3Yjk2?=
 =?utf-8?B?aC9KTmhRSms0NlYxQXNjSTVQQmdzYm1PMktsUElFcVA0MWxaeWt3RWpzdVpC?=
 =?utf-8?B?bklza0NYUmwyd1djblNUMTM1NlBjZHdLOU9RYzVNYzh4Rzc4RzFRLythcmJj?=
 =?utf-8?B?TGtlOTFXQXJVcTdtT29LTjgrY3hQTDVucTlwMUpOVUlDbUtld09CbEJYMktt?=
 =?utf-8?B?OE9LRXg2YkU1b0lGNytsK0RyQnh4QmM4VE44V3k3ZmNzQ1ArUHJ3Tkx2ZTlQ?=
 =?utf-8?B?aDF3ZVg3OGVHTW9leXlDV2dMQWlsdDIvNDM5d2RGMElLaDIwWG80UURaeTlG?=
 =?utf-8?Q?GwE6KRbn0ZLMHxE8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <90A791D93C5E0D4092164E1C93997570@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	sHdHzMMAeEr8PM3V9+QMo18/7v0oY36z2oEx4KV/DekcrRU1bnNqhemjuYsbwxXmJClNPPuQlrqT6BK7TIb704QdVE/PGQpN3+5lIUWKl38G4ZuHDrnPLL8uo7b4arKmRXTPKgvG2yWw3f8iASwyDIld0KiocmEC8Hq0SkocKb7j57ZYbuwGQ0Is61Q8E3XdI0lB+O7zw4mGROsZ4+wjqXafIXtzw80R3niqBBN2uvxnk10zcXd+u8jmrsuteQxAESR7qEhFWpjhyweNOH/CgghD3PASi6FFbmzrZKIuZ7OiUB5Z6DEhhKiWfhv1KEP9YTrC4BQPS0Jn+kZ9Tb9DJw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AY0TMtlf6eMxxsU1Y88ic0xiianRWDWjd2f4EiUmKSqBGTc43kdj9t/n29lfwm/Buq/88nQSGC3nCAFghYiMC+nGcheUjySe+YhsxNye3JPQa90Xqq/r9zfPyVWuu37hk/WXJw51AS9xLllUOnU44few6Pd8Stq5UsFmBmNpwY0JUArAjrEGoqJN+ts0DR5v3z7gcjM/qLR8gWLp+4tUINd4OLCzqZ8lGQ7W/1RmQpmBq5957mWdpoXymQrQqkJJ4uEkuAHqqQZWuhr+WCN2owYZlyBTnxaoW5iBi/TyZZ4K2vlBbayvbJsxsx5s38K4g5uLT9aSYBWc6+4Nc9kQz3rmUKnpFCoOgpcsA2aiSWZ1Av6U4BQydKSved/zZoyQOgckFZvixvayQP1AQhqaKqtj8/E7gdD/2VKw5knBdAlQQEaOgWoyUptqUgYJEDnu/274cZbj+h1UkGTOyKO5DCrsgXe5Ms59FNWW+6zPOgmPWzBzjDGgMFd8OYNeA9faZvm9qsbLF/5T4o6OBoMeg/hCbR8bG/QWuuSt6r/HD6A4z+3/rPNS/bLeQhK/pnIWkvPOEIzsq6DX8uda2a096GfyFeQDJQgJLW9PGs9Wj08=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR10MB8326.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ac65079-3870-4210-486b-08defd00ba32
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2026 08:14:29.8426
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KMxDWHxJCMoPtknytOnOHNDEgi5fhJiqay9S0WmLz5Abw0og3s6Uu8oUOQLL60Gj8rplJ7EXxzgtZk4HHle1Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8154
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 adultscore=0 mlxlogscore=737 lowpriorityscore=0 mlxscore=0
 suspectscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2608180059
X-Proofpoint-GUID: q7XnFl4xjG4csmq-_2xXTjAey5MxmwDb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2MCBTYWx0ZWRfXwMtBX5thC41n
 lR5LKNhKJHEsYHIaFYztPmRKZfXEosFXnJSf6ZmuCD3u35INwEIq02RPHNMA0bCj9CPTq1q0uZL
 Z/179VK3uhRsfODKAMfpMJvCP4mluM1qX/Cf1/VrnQCatw8Ek2OU2LWYNyRf6l64EsPoodrqNfB
 DTvtJtkRQwWm80xCbygqnYODj+XX0HC//03krhGS6dlmiIigKCqEtS8I+lYKH2sqzoWsgw8jCDD
 7UK/sX+tyNL838uqiO/dm0Bxwjl366PqrFrLMCXXeUSwfzegVPQtuBReODPPBgSr87wTj4o2lhb
 6C47pMSrtdP9x6jBrzdFhatHA+EL4RzXutTrwNZBjU9pPbHdkQZqB0bc6iUSbzCs56Jj0QFzLDZ
 FY2GipHXWEKlZWUmbbenVauMfy/QVWblhsNaN7f3NTNDvbdUYdOTxH8w0FJ3botU6Y9gJx7eKj1
 8JvfuaJdUROefLKsvikS/MAYQZp6YSu+IQvrhE4A=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2MCBTYWx0ZWRfX5zJpFksvcWPd
 J2yk2fdAeoKmTwFq2vRIByLaBR/LUj6re+cWAnHIPGaZOUUChpA70MSIEM373XprdHCEjE2iGbM
 Qjf5gYSG9nr2F1aYkc1ujwbhTF+2HVqAZ2M7ORhA5wAPrKjrPiqi
X-Proofpoint-ORIG-GUID: q7XnFl4xjG4csmq-_2xXTjAey5MxmwDb
X-Authority-Analysis: v=2.4 cv=EP02FVZC c=1 sm=1 tr=0 ts=6a84146b b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=GoEa3M9JfhUA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22 a=RD47p0oAkeU5bO7t-o6f:22
 a=JfrnYn6hAAAA:8 a=qx4PkYxgqHk1XwT7I6cA:9 a=QEXdDO2ut3YA:10
 a=1CNFftbPRP8L7MoqJWF3:22 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22
 cc=ntf awl=host:12099

DQoNCj4gT24gMTggQXVnIDIwMjYsIGF0IDA5OjU0LCBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGlu
ZnJhZGVhZC5vcmc+IHdyb3RlOg0KPiANCj4gT24gTW9uLCBBdWcgMTcsIDIwMjYgYXQgMDM6MDI6
MzVQTSArMDIwMCwgSMOla29uIEJ1Z2dlIHdyb3RlOg0KPiA+IEhpLA0KPiA+IA0KPiA+IFBsZWFz
ZSBjb25zaWRlciB0aGUgZm9sbG93aW5nIHBhdGNoIGZvciB0aGUgdjcuMyBtZXJnZSB3aW5kb3cu
DQo+IA0KPiBZb3UgYXJlIGEgZmV3IHdlZWtzIHRvbyBsYXRlIGZvciB2Ny4zLiBBdCBiZXN0IEkn
bGwgZW5kIHVwIGxvb2tpbmcgYXQNCj4gdGhpcyBhZnRlciAtcmMxIGF0IHdoaWNoIHBvaW50IGl0
IGNvdWxkIHBvc3NpYmx5IG1ha2UgdjcuNA0KDQpPSywgbXkgYmFkLiBBbnl3YXksIHRoYW5rcyBm
b3IgdGhlIGRpbGlnZW50IHJlc3BvbnNlIHRoZW4gOi0pDQoNCg0KVGh4cywgSMOla29uDQoNCg0K
