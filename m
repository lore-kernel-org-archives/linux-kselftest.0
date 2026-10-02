Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1156F3033E6;
	Fri,  2 Oct 2026 12:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945391; cv=fail; b=OHfDjiP9sL2SYeaxshesgQ9lXefTYNaL/6ZPT0w1dugrELId+Wj58zBWpkZW4oT14Svr4Hgt6I1+PCc6l4wiY0DxF51D1BtPf2Xp9VIhRwGi59Mi5twhMo+5av6RAj/t7IENfIfre2q2g/ysNWfF6w0X7DYNRUHIWx5F0oqMl44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945391; c=relaxed/simple;
	bh=A+m0V2z/IlkzKhwZBfzC1MvdkV2pAP7bWNAlKgnhWw8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L0w9vfzq5GNbeR8aKgwMCpknVTUSem9CRxI8lG9XARmbrPkomnqcK0WHGvp0KziT0ywf0IDcMu97N4AppgLNBYc8ex8hy1mVGXoClhTMcZxJ3NcT3WR4e37256HFTBuchjmYHjLq4tkt+H9412jHpx50c14hLnKpMI7Wm6qKAZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com; spf=pass smtp.mailfrom=qti.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hduN7hHL; arc=fail smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hduN7hHL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nbA21177698;
	Fri, 2 Oct 2026 12:49:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	qcppdkim1; bh=A+m0V2z/IlkzKhwZBfzC1MvdkV2pAP7bWNAlKgnhWw8=; b=hd
	uN7hHL+PNSMp61GL5aPppfWYSV/zQIkgmapNzLywgR1PrF6I1DuSrrFGfYnAirfi
	o0d+GLZQlBuGhL3UGxiy8n+v4jULjjvyN72opIwA1ZubtlHlWfCuX9vk7BEA5z5R
	ziEz5AWD0Mz6doB41s0X+soZA6KM1JreBEoIJkulAhSOG5I4ywMlK4NcmydKE72A
	J4J67mbmv/w051BNNOhFJ7HaebqIZMQj/boy4rvQfcDGyiYwcb+uUFLHhHNzx/ur
	XK3F2xXwL8EeLwr5DAVBNXf9IxDF+3+VFPQ6my/bh3+qHtdiS9pB2lG6JzCo4MO2
	8fGkYmw9Ke1ZSZszJuHQ==
Received: from byapr08cu003.outbound.protection.outlook.com (mail-byapr08cu00300.outbound.protection.outlook.com [40.93.1.104])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h20nft8fk-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 02 Oct 2026 12:49:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Up7/oPB1saLZhBQtGycL+GGNRACDsXv7H4UW21zIBacFxiMf8uy/oVsPWrzqCmn+F7ZvgthnJmBCrataqvFq/IjGPMqYaQCAmZgsWpVxTPc4Ak66EfoScmeQZRwseX3S1bV+kkYIs06Wl/7/X4E1RaG3jfCEkrneUbQW/zT307sXbICajtmATrB8+B8UYN7yIL75SZnyWN+fWogqMmMCgF8RfeuqlnxDb6moUR6++rBXCIZK+BN/jFQVXGwh3Apj9kIpxrCDp6g66mC1tRMnVE0LJE2YwGJoWAxHAS1YI4TpwYDQfGI5jUsJdr23rvFPhRLgWbX5ZJ9L89OJ/P8WNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+m0V2z/IlkzKhwZBfzC1MvdkV2pAP7bWNAlKgnhWw8=;
 b=BmNiMoHzh61Saqx3EwR1zR6lLpT2EzUMz7NkQhR4fnyA9v1WrphCs33rLMdahSfrP+xIXczUiij17hpazOJXVW3oFiT+jXvcq+Mq/9RwMpiKAIep7WqR4VMOcwLG4auP0FE2lr2tfz0iqXDOTHSGnBX8KtME4yYQocW89NkZ8itsgMkQkHxTcgPi3l1+bkCz22vufVkySA7U9VI7W9IjvPA4cqmMk1Vb9IzoP2kNDI1NcdNv0EwVFr6N6weOKCfVoUPvCHuzHdoCpUGfT6XZ6/WJUxnuMW1+ma44mgkj/q1KnzZwq6h3IbiuCc9mDgxbE6QKbubTpi9BOrajfXKydQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BL0PR02MB4435.namprd02.prod.outlook.com (2603:10b6:208:4a::23)
 by SA2PR02MB7674.namprd02.prod.outlook.com (2603:10b6:806:149::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Fri, 2 Oct
 2026 12:48:59 +0000
Received: from BL0PR02MB4435.namprd02.prod.outlook.com
 ([fe80::5818:27e:c1c8:7aa0]) by BL0PR02MB4435.namprd02.prod.outlook.com
 ([fe80::5818:27e:c1c8:7aa0%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 12:48:59 +0000
From: Radim Krcmar <rkrcmar@qti.qualcomm.com>
To: Guodong Xu <guodong.xu@oss.qualcomm.com>
CC: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert
 Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang
	<chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>,
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
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "spacemit@lists.linux.dev"
	<spacemit@lists.linux.dev>,
        "sophgo@lists.linux.dev"
	<sophgo@lists.linux.dev>,
        "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>,
        Andy Chiu <tchiu@tenstorrent.com>,
        Florian
 Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Andrew Jones
	<andrew.jones@oss.qualcomm.com>,
        linux-riscv
	<linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v8 11/11] riscv: hwprobe: Introduce rva23u64 base behavior
Thread-Topic: [PATCH v8 11/11] riscv: hwprobe: Introduce rva23u64 base
 behavior
Thread-Index: AQHdUCuigBDsWrpZLE+5pUF07crdOLbp8yCAgABFT4A=
Date: Fri, 2 Oct 2026 12:48:59 +0000
Message-ID: <DLUD4XZN9F16.2LBMTP1H5Q1VC@qti.qualcomm.com>
References: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
 <20260920-rva23u64-hwprobe-v2-v8-11-5f14bc5c23d3@oss.qualcomm.com>
 <DLRXBUKNNOWW.BHCJX6LQ9LB1@qti.qualcomm.com>
 <7325307a9d029ef3277c343230a46a40.guodong.xu@oss.qualcomm.com>
In-Reply-To: <7325307a9d029ef3277c343230a46a40.guodong.xu@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR02MB4435:EE_|SA2PR02MB7674:EE_
x-ms-office365-filtering-correlation-id: 81d28efd-27d8-491c-a6b4-08df20838743
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|10067099003|56012099006|11063799006|4143699003|3023799007|18002099003|22082099003|6133799003|38070700021;
x-microsoft-antispam-message-info:
 vLYCp2E3x+QjEA+4hWsO44knuFwz9pQ4Q7z0coeQZYh9NgSTGIfQlyJRWkZui43tgQsOQ1tdV9Nu13kyYytDjG9x2spmuS+8Rka2fQ4LHkc92wkhlsjaAzuFNZE8rQew4Sv0fWg4TQ/sSxDVJ4YGOoXQFp9Qr//xaOO553hiXSuiifk3umQXGc8o/rFPMmRXJWLKPzxiqzmcIjh3KJT5r2FeUMsmQ9kbRqph/qPGaE3TgTqFqSUGx+5o/jUZpU+hg8LpvGK8H4NRJo9xzBSmv1xpsCVRNJUam5c+0VzGfBJmgB1CEZhXXrHVrD2ATOonITJvevRoq9oyNSsE0+wWMZ7J27zmBAxYPudynfDMOyKDNYr/y/Q0rR9l7/yWEgGDw0rLhQZ75auLr9Jyk4UTAcmKmGfcj9cWvsn43jxEanKwUarvQHR76QJpDI0uYz28YzIcS5H5JpXSC+9Abmr99zy7bycGY5olDSveVdrS26Pbgf/6+QdzOxFo9iJvQVUnrtwenvyxxxDt7npqEVDrcQIHDcsFZyYRHcbafnxFSyxaWYD8BaIhS56Pw79gyD4xZpGTCQz1IfbhO9r/FGXPxRKxVJ+kbastyqIi/6DXHYhE43Kz2Z0z1d/1cJore9W19M6ETbSItnH4Yy6+4+3dIUFhifw+fgKm362vj6b5eT4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR02MB4435.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(10067099003)(56012099006)(11063799006)(4143699003)(3023799007)(18002099003)(22082099003)(6133799003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bm4xTW1vVjN3RE9KNUt2UHRsMDNFWUF1cWtOdkZ5L0pvM2hDVDIwRUY2RktD?=
 =?utf-8?B?S3psY1BEWnJMY2xrc1QxakJXT1JpakdKS1FabWpaQUMwZTN4Zkc3ZGw4Y0l5?=
 =?utf-8?B?SWJxZWdpOElwMmw5QjJ6VUJWZis0dGRoL2ZnRTZrSU9ycHE4OHRxcmdrVWQ3?=
 =?utf-8?B?QlhLZ1BnMVZDM2R0WVhSSVBOaU1HWkhWdngvY2swcElQTVFvOGFzTkhtR1Nn?=
 =?utf-8?B?L2xsb2paWVZEQTVRSVRrb1BadmVKUmVXM25JOTBrSEV2ZDBPbGEvRkhrbXpY?=
 =?utf-8?B?WWVEeDNoUjJqc2FwejdmZ1pNU0ZaMHl2U3VrUjFCdC9HMXNXY0VYMUxnR1RH?=
 =?utf-8?B?SU15UGV4WUpkY25qSzZyQkNqOHNvWEFjWHo3QlowRWhDMkFWNE5FaFNFeXln?=
 =?utf-8?B?VHFMZlF4a0E0WHNSQm5Od296ZWZOWHNzMlg4bEtvME1ORHAwMGVtU0tHd1Vp?=
 =?utf-8?B?OWUvQmdnLzVZYkhaY29UWFQrSEt5dHpVRVFXQ2I3SEVZSHFxY0dsOFpnampX?=
 =?utf-8?B?OWZINjBFS2FjZUQxRVRzS3J3Q3gzR3hzbk53UFgvVzNYSXozNnFDRVpaVCs3?=
 =?utf-8?B?RThmNkNMcjlDeCtyYUdOZGc4NkxBMVA3S1Q1RXVTT01haHRtUjBMaTlCK3RH?=
 =?utf-8?B?elBSRytXaFRjck5JNkpEcmhzMDZ3WUxRN0tjaTlVZkdFL2lLN0lKTnRuazJ5?=
 =?utf-8?B?andWUFJGV1E1b0dnMjI0dGhpbkc3Mm10aVdCMVZJcERueDJMenFIMzZwcWRI?=
 =?utf-8?B?TGIyVXc5MUhYb0lIWjN6RzVjMENmTHBRV0xVbzhZSjJIbEdUVHovMXYvYk9T?=
 =?utf-8?B?ZXZwUFc2aytOOXlLTHQvbG5KZkFLUjhybDNkTEJxdUlMcWtnRFlVVEJINTQ1?=
 =?utf-8?B?Y0lHK2tvN1gwK2o2WWNkNGJqVzJwSGZtWTRST3hEUVFXa2FUaHVQM0JXREor?=
 =?utf-8?B?NHNnbkFoWk93NlBIWjRkVlprS0VxMEpRbkNJaFcySGgzRFpEQ2F1c2lXTVlI?=
 =?utf-8?B?YWxERVZYQWZWSm4yYWZGdzZqNFhnTldXTE82UnFjRWJaTks0NENaVC9ESG5a?=
 =?utf-8?B?dWJZUUxkb2w2SDhzc0pYV1VTYUVLTjJpaEs5ZWJTWXAzVWhQekljRzUyeW9Q?=
 =?utf-8?B?UHcvU1JJdnFzTE5TbWg0U2M2T1hmZjRxZ0FRcGxRalVDVmZBdGFQcG10d3RK?=
 =?utf-8?B?Y0ZydGtCSXBJYzF3TFpyWnFkS1NBSFlwRy9Vc2Q3RlAyUHdqaVUwcFp4UFpD?=
 =?utf-8?B?cldFWHVud3hoY1JYT2ZsTEN6c2VnTFZ3RURmZmg5aHRKVEZ5aCtJZzNiN3Bv?=
 =?utf-8?B?NnVDaGtJQkZHQnh6Nms2T3JIVVF0VGM4dWF5UVdydnVpYTBBNWp5VnliK1Z2?=
 =?utf-8?B?V2Z2UTNjcFJDNG1BckRLcXJMUnJHMS9NOXV5ajIzNUF0bHRFZEdVbk5ZRkNu?=
 =?utf-8?B?SUNHTGRGSUQ2dXRNd1lkWXA0K2d5U0xXNFl2WEIyUEwrYWVqMHh0NFpuOTFy?=
 =?utf-8?B?WVhHRE42OU1FRjl3a3BMZnAyc1k5bWxDYkpCU3d6SXViVXNnSlNmM05tazY0?=
 =?utf-8?B?bzBjeVRFd2YyR0lqdGwreWI5d2U2MTFlUjVNWW1kNFZmb0kwUEl3eFY3U3dX?=
 =?utf-8?B?cmpQL2dHeGpyRTNrZmR3UzdxdnRzcDN4RnA2QWhPQmUxWi94WS9QSi9POW1k?=
 =?utf-8?B?V0s2SzFrK1lrRnVMU0xkRDFSZHhaT3ZQeGJjQlM3bEJjMXRrU2gzNjNpOGl2?=
 =?utf-8?B?N0sxT0lZRm96MW1HTUtjcWxVN0thMEk5S203V3BGWkpMTE5DcHV2cGJQeTc1?=
 =?utf-8?B?bkJrWXFLZHBVdUhwQ1BxbzBSdVlHNk1GY1k1bVJqK3V1bnphTWdBdlQ5Rk9L?=
 =?utf-8?B?MFhhWHNrZ1pqSHhPTUpOL0x4OFFLL1lWUU1IMXpUaEtUWkpYcmkvRGVYUDJY?=
 =?utf-8?B?OFF2bGNVd2ZFS3BtSW9zQm1kL2F3eGZTWkJKQTVxTjV3N1BWLzVhNkVvOEpV?=
 =?utf-8?B?S09MRVZRaHlJTUd0b3hwTFU5Q29CaTlTN2RsUWp2WDlzdFlINnd3eGU3Rm92?=
 =?utf-8?B?eEtXZVdBaGVVc3EwUmFFSk9vZHRDT0tpcWdDdHdHdS9nS05BQ1NraVp0Nld3?=
 =?utf-8?B?eFlDS2krL1JDbWlmMzhqN1dLeHZHbFNweGJlN0M0OWdDUk5WY1gyRUZ2eDN2?=
 =?utf-8?B?OEhFMmY3a01KamVuRXBnTDBzSGhpUldlSkltdldONFZUOG9QTWtVRmZGK3Vs?=
 =?utf-8?B?S0FKUlorWEovV0lkNnpteTA3dnBnUUdMbEwvTmJsYWlFSFJDUGszK094OEVR?=
 =?utf-8?B?TXp6bFJpRE9LazBYWE1iTEVoZ3VWZ1RQUTBoTUF2TTZEMVZTcUZ5VXNaako4?=
 =?utf-8?Q?zk/Po3xg9wsvt7nI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F4D3555A7BE91A409EE9062936A762B0@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	4nZHhzuvBAeinXmQKT/6UxTXq5swzQnBX5LwD8VJ78QfF8mgykA76HDReRp6RJoLGcpDODYkKYfAHFvn/oPpMxy2eaSaSsd8PFiayN5d2n/Y7HDBYW3miSASPf96Hy1heJGxhcAf9b7+Iq9vxdRao5K+GxVgmONPfhwkDVFqYjB6e4j5/1UOI39qcbcytkA0xyROPspLIh5ar0i386zNFu2cXWqavnfqqkClxGFdzyGC/Z4SpJBaqq8DZA0/MoqSELeiIfUINoSS2uPBYbgYIuyDI4gyQukuMVuxqI4aHPd9MwoBj9olyt85VWKwIcXDaVgLTusoB4e8jYGNlxJI+Q==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gW0gcq6GTqN30k8lvZXi/kb7RqgqxL2cDAwXOfgLinjI0jKtVeW2/oOa0QKZnh1k+MwIi0zrgYN7B1/YlHrsle9oVROzacPTWWqprYJybkZLn1k49uYfLh33Mk+nXUDn8flmNEc+YH+5ZMbg/rm5mWUvyY1ZXGWaZ26WaQVvvbSucaiob2oHJERRiEABEXPbx5D36mgW/9Z6rzuvS07Lb9Y3XP6nlk93+vTs/wEl//r7urjiRp36st96sLiVhGZFxWSgYnX2y3whGZLilLAjxOLoEv0oH5UZ6b2SRcESIFEQqJEUdH03Xnr0z/ufwzfpWO1UsuL89gro7i8tzJH8nGQylWnAEg9mmW4L6s8KUfAI+lv2gx4Jc/7TG67FZaMhsML7OlEXfzT9k3Bqr+luPoJoZIvPqV8dyGVG7LDwx1MLdQ/QJHShit0V2Mm4B9p43+7mvSW84I5Tv1duUfdbLY0sfXnS1QYh/hA5PxZ65HNe0COZ6rCgDkoIQUNIH934KX614qZ+i7y5AxuuW9i1bRbVlYwhpkPKlib6qAdCtGH6UcL3GvRTMPSe4zZRSYNKS8rFIAOMx8UZbn27Gj3cfBtSMYm57oisHh17wKJDdr8OX/xLP4z8nzqKbkKmLwCd
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB4435.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d28efd-27d8-491c-a6b4-08df20838743
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2026 12:48:59.1721
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nax68aUkhl207Qgi41atomwhr0qwnj8ou5QJYd6synoUbQnjGTfIefh9k6zoVWB90xPvxsTINIIuxmEwPd9uKWCusRnYaDk84uppWyrQOTk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7674
X-Proofpoint-GUID: 1oMs6pSG_f_y3O1690SFdSfy9_Vh02aK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA1MCBTYWx0ZWRfX9UgM087Mkoxz
 0YIjZ4y4dQkTLMEOQ0WbshypFkc3sCQ7zOiCvAzXk5LbOy7dKhNOmgIQBFgBQRmBGPxGiVScR2L
 gfhZjE/e4Ob4mZhV3ENdJvOe929zYYw=
X-Proofpoint-ORIG-GUID: 1oMs6pSG_f_y3O1690SFdSfy9_Vh02aK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA1MCBTYWx0ZWRfX5gjv9zZevdhp
 l9XCRys0ueVgwjLdGC3Gfj+pg8kM1fHUZKwIBikf2Qk/c1mI/1D274wnzxCwmH8elyrUJVnEXgs
 pw2quSE+sR1eM9PeMW/DxqFKvYrY1OurE6j2/Kj1zBff7GwSoJVg48KS0BvK2MdYVw8R7BMp1KF
 ifAmuIB0TBc5pohbUgNGisn3vwEIbChaseOEelvg7IOT/MM11Ed288j7lKRDKUjVmRZA/JU8O50
 M4qejlHlF8GtUUxBzkjiXRfyS5dw+7KSalyPDPlI22Rv5XgdnMHMK5NTq7z+0qtrPXZVgeovvHe
 xEav3+rurj+gAvfG0XpCAJC8AntHbBzcqOjjGMjtZtSm1JR/YsdGuKwELdIKePf8ro26ee/MIU+
 EE9DW6WRjzIkGIjFKg5tiejzd4npepqbaFP/xGE2kTyVYFlsjNiFkFTP7cmL9AE4ArTj/kXymSY
 caDz5Eef2Ff95B0srzw==
X-Authority-Analysis: v=2.4 cv=f+jdl+yM c=1 sm=1 tr=0 ts=6abfa840 cx=c_pps
 a=W2rhl5c+35KWs3qLQ/Kc1g==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=f7IdgyKtn90A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=qu7hb3CLATIGZ95TUdsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020050

MjAyNi0xMC0wMlQwNDo0MDo1My0wNDowMCwgR3VvZG9uZyBYdSA8Z3VvZG9uZy54dUBvc3MucXVh
bGNvbW0uY29tPjoNCj4gT24gVHVlLCAyOSBTZXAgMjAyNiAxNjowMDoyMiArMDAwMCwgUmFkaW0g
S3JjbWFyIHdyb3RlOg0KPj4gMjAyNi0wOS0yMFQwMzoxODozMS0wNDowMCwgR3VvZG9uZyBYdSA8
Z3VvZG9uZy54dUBvc3MucXVhbGNvbW0uY29tPjoNCj4+PiBbIC4uLiBdDQo+Pj4gKwlpbnQgY3B1
Ow0KPj4+ICsNCj4+PiArCWZvcl9lYWNoX2NwdShjcHUsIGNwdXMpIHsNCj4+PiArCQlpZiAoIXJp
c2N2X2lzYV9iYXNlX2F2YWlsYWJsZShoYXJ0X2lzYVtjcHVdLmlzYV9iYXNlcywgYmFzZSkpDQo+
Pj4gKwkJCXJldHVybiBmYWxzZTsNCj4+DQo+PiBJIHRoaW5rIHRoYXQgZXh0ZW5zaW9ucyBsaWtl
IEYgb3IgViBtaWdodCBiZSBwcmVzZW50IGluIHRoZSBJU0EsIHlldA0KPj4gYWN0dWFsbHkgZGlz
YWJsZWQgaW4gdXNlci1tb2RlIGFuZCB0aGlzIGxvb3Agd291bGQgbWlzcmVwb3J0IHRoYXQNCj4+
IFJWQTIzVTY0IGlzIHByZXNlbnQuDQo+DQo+IE9ubHkgViBoYXMgYSB3YXkgdG8gYmUgZGlzYWJs
ZWQgYnkgdXNlci1tb2RlLCB0aHJvdWdoDQo+IHByY3RsKFBSX1JJU0NWX1ZfU0VUX0NPTlRST0wp
IHdpdGggUFJfUklTQ1ZfVl9WU1RBVEVfQ1RSTF9PRkYuIFRoYXQNCj4gaW50ZXJmYWNlIGlzIHF1
ZXN0aW9uYWJsZSwgYW5kIG9ic29sZXRpbmcgaXQgd2FzIGRpc2N1c3NlZCBvbiB0aGUNCj4gUklT
RSBQbGF0Zm9ybSBXRyBjYWxsIG9uIDE2IFNlcC4gQW5kIEkgcGxhbiB0byB0YWtlIHRoaXMgdG8g
TFBDMjYNCj4gbmV4dCB3ZWVrIGluIFByYWd1ZSB0byBzZWUgd2hhdCB0aGUgY29tbXVuaXR5IHNh
eXMuDQoNClNvdW5kcyBsaWtlIGEgZ29vZCBwbGFuLiAgSSdsbCBoYXZlIHRvIGZpZ3VyZSBvdXQg
aG93IHRvIGFuIGludml0ZSB0bw0KdGhlIFJJU0UgbWVldGluZ3MgYWdhaW4uLi4NCg0KPiBCZXNp
ZGVzLCBzaW5jZSB5b3UgbWVudGlvbmVkIGh3cHJvYmVfaXNhX2V4dDAoKSBiZWxvdzogYWN0dWFs
bHksIHRvZGF5J3MNCj4gcGVyIGhhcnQgaHdwcm9iZV9pc2FfZXh0MCgpIGRvZXNuJ3QgaG9ub3Ig
dGhhdCBwcmN0bChWIE9GRiksIElNQV9WIHN0YXlzDQo+IHNldC4gUmVmZXIgdG8gWzFdLg0KDQpZ
ZXMsIHRoYXQgaXMgYW4gYWNjZXB0YWJsZSBiZWhhdmlvci4gIFVzZXItbW9kZSBzaG91bGQga25v
dyB3aGF0IGl0IGRvZXMNCndpdGggcHJjdGxzLCBzbyBod3Byb2JlIGRvZXNuJ3QgbmVlZCB0byBy
ZXBvcnQgdGhlIHByY3RsIGFmZmVjdGVkIHN0YXRlLg0KDQpJIG1lYW50IHRoYXQgdGhlcmUgYXJl
IHNzdGF0dXMuRlMvVlMsIHNlbnZjZmcsIHNzdGF0ZWVuLCBhbmQgcG9zc2libHkNCm90aGVyIGJp
dHMgdGhhdCBjb250cm9sIHRoZSBzZXQgb2YgZXh0ZW5zaW9ucyB0aGF0IGFyZSBwcmVzZW50IGlu
DQp1c2VyLW1vZGUgYmFzZWQgb24gdmFyaWFibGVzIG91dHNpZGUgb2YgdXNlci1tb2RlJ3MgY29u
dHJvbC4NCg0KPiBUaGVyZSBpcyBubyB3YXkgZm9yIGEgdXNlci1tb2RlIGFwcGxpY2F0aW9uIHRv
IGRpc2FibGUgRi9ELg0KPg0KPj4gSXMgdGhlcmUgYSByZWFzb24gdG8gZGl2ZXJnZSBmcm9tIGhv
dyBod3Byb2JlX2lzYV9leHQwKCkgZG9lcyB0aGUNCj4+IGV4dGVuc2lvbiBkZXRlY3Rpb24/ICAo
aGFzX2ZwdSgpIGFuZCBvdGhlciBnbG9iYWwgY2hlY2tzKQ0KPg0KPiBBbnl3YXksIGJhY2sgdG8g
dGhlIFJWQTIzVTY0IGlzYV9iYXNlIGJpdC4gSW4gdGhpcyBkZXNpZ24sIEkgbWVhbiB0bw0KPiBy
ZXBvcnQgdGhlIHBlci1oYXJ0IFJWQTIzVTY0IGJhc2UsIHdoaWNoIGlzIGRlcml2ZWQgZnJvbSBo
YXJ0X2lzYVtjcHVdLmlzYS4NCj4gVGhhdCBiaXRtYXAgaGFzIHBhc3NlZCB0aGUgdmFsaWRhdGUg
Y2FsbGJhY2tzIGluIHJpc2N2X3Jlc29sdmVfaXNhKCksIHNvDQo+IGl0ICJtYXRjaGVzIGtlcm5l
bCBjb25maWd1cmF0aW9uIGFzIHdlbGwgYXMgY29ycmVjdCBleHRlbnNpb24NCj4gZGVwZW5kZW5j
aWVzIi4NCg0KV2hldGhlciBrZXJuZWwgaXMgY29tcGlsZWQgd2l0aG91dCBhIHN1cHBvcnQgZm9y
IGFuIGV4dGVuc2lvbiB0aGF0IG5lZWRzDQp0byBiZSBlbmFibGVkLCBvciBkZWNpZGVkIHRvIG5v
dCBlbmFibGUgc3VjaCBleHRlbnNpb24gYXQgcnVudGltZQ0KKGNvbW1hbmQgbGluZSBwYXJhbWV0
ZXIgb3Igd2VpcmQgcGxhdGZvcm0pIG1ha2VzIG5vIGRpZmZlcmVuY2UgdG8NCnVzZXItbW9kZSBh
bmQgaHdwcm9iZSBvdXRwdXQgc2hvdWxkIGJlIHRoZSBzYW1lLg0KDQo+IFRoZXJlIGNhbiBiZSBh
IG1pc21hdGNoIG9uIGEgc3lzdGVtIHdpdGggaGV0ZXJvZ2VuZW91cyBoYXJ0cywgd2hlcmUNCj4g
aGFzX2ZwdSgpIGlzIGZhbHNlIGdsb2JhbGx5IGJ1dCB0aGlzIHBhcnRpY3VsYXIgaGFydCBoYXMg
Ri9ELiBPbiBzdWNoDQo+IGEgc3lzdGVtIFpmYSBhbmQgWmNkIGFyZSBzdGlsbCByZXBvcnRlZCBm
b3IgdGhhdCBoYXJ0IHRvZGF5LCB3aGljaCBpcw0KPiB0aGUgc2FtZSBtaXNtYXRjaC4gU2FtZSBy
ZWFzb24sIGJlY2F1c2UgWmZhL1pjZCBwYXNzZWQgdmFsaWRhdGUgY2FsbGJhY2tzDQo+IHBlciBo
YXJ0Lg0KDQpUaGF0IGlzIHRoZSBidWcuICBVc2VyLW1vZGUgY2FuIG5ldmVyIHV0aWxpemUgRiwg
WmZhLCBhbmQgWmNkIGV2ZW4gb24NCmhhcnRzIHRoYXQgaGF2ZSB0aG9zZSBleHRlbnNpb25zLCBi
ZWNhdXNlIHNzdGF0dXMuRlMgaXMgYWx3YXlzIE9mZg0Kd2l0aG91dCBoYXNfZnB1KCkuDQoNCkkn
bGwgc2VuZCBwYXRjaGVzIGZvciBaZmEgYW5kIFpjZCBpbiBod3Byb2JlX2lzYV9leHQwLCBidXQg
c2luY2UgdGhpcw0Kc2VyaWVzIGRvZXNuJ3QgbGV2ZXJhZ2UgdGhlIGV4aXN0aW5nIGNvZGUsIHdl
J2xsIG5lZWQgYSBmaXggaGVyZSB0b28uDQoNCj4gU28gdGhlIGlzYV9iYXNlIGJpdCBSVkEyM1U2
NCBiZWhhdmVzIGxpa2UgdGhlIHBlci1oYXJ0IGtleXMgZG8gdG9kYXksDQo+IHdoaWxlIElNQV9G
RCwgSU1BX0MgYW5kIElNQV9WIGF0IHRoZSB0b3Agb2YgaHdwcm9iZV9pc2FfZXh0MCgpIGFyZQ0K
PiBob3N0LXdpZGUuIE15IHRha2UgaXMgdGhhdCB3aGVuIHVzZXIgc3BhY2UgcXVlcmllcyBvdmVy
IGFsbCBDUFVzLCBpdA0KPiBnZXRzIHRoZSBpbnRlcnNlY3Rpb24sIHdoZXJlIFJWQTIzVTY0IGlz
IG5vdCByZXBvcnRlZCBpbiBzdWNoIGENCj4gaGV0ZXJvZ2VuZW91cyBzaXR1YXRpb24uIFBlciBo
YXJ0LCBJIHdhbnQgdG8ga2VlcCB0aGUga2VybmVsIGNvbmZpZyArIElTQQ0KPiBzdHJpbmcgdHJ1
dGguDQoNClJpZ2h0LCB3aGVuIHF1ZXJ5aW5nIGFjcm9zcyBhIHN1YnNldCBvZiBoYXJ0cywgdXNl
ci1tb2RlIHNob3VsZCBnZXQgdGhlDQptYXhpbWFsIHNldCBvZiBleHRlbnNpb24gdGhhdCBhcmUg
cHJlc2VudCBvbiBlYWNoLg0KDQpXaHkgd2Ugd291bGQgcmVwb3J0IFJWQTIzVTY0IG9uIGEgaGFy
dCB0aGF0IGRvZXNuJ3QgcnVuIFJWQTIzVTY0DQp1c2VyLW1vZGUsIHRob3VnaD8NCg0KVGhhbmtz
Lg==
