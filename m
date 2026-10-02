Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02ACA370D47;
	Fri,  2 Oct 2026 13:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946094; cv=fail; b=R0tDQ3JCFahz1Y4eQksWTuEKMmpt2XrGvtAc9AWIJcrVyPfIiThqTZ752vBewf7mJWc6XMGq1SINML0Kr7++4BpXyZsAGnJjbP8QolnCJ+fr7xZ5gXElb35l6XMxMsp4Dx7j5EmTDRZscZcVfjKizfacsyr0fC+gGx8Zrk7u/eQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946094; c=relaxed/simple;
	bh=nH4I/cLxFx3lhXEeqT++N0K1Zu8/1pNKHpYBTXFXDD0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=vCEeNmjpmoRNwzZq+4eDBwv+NGxHhYAhFJVqpAxRc2Y5LRPsPj5LKci/HeRxPIENexYVgOcg/pvXDA0b+26naG96fWrPT6m3NLOCrtuzkaQHR8tkmQrcTar/vYLGaTAy35DCQiVSPknyYvQao09sHF+jP3EIk0ytkBtdx5UrlXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com; spf=pass smtp.mailfrom=qti.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CXOrjvNO; arc=fail smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CXOrjvNO"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nZ123935120;
	Fri, 2 Oct 2026 13:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	qcppdkim1; bh=nH4I/cLxFx3lhXEeqT++N0K1Zu8/1pNKHpYBTXFXDD0=; b=CX
	OrjvNOg1VXq0IQaLc7+GHyScKxV6cMsjP6dzmdmGZj+y9ix2ZbYHhb04wauynBbJ
	iZxfhgGkwmee24jXF/8TRSXynmSIJ1CEs5pv2+aP1uR7AxYitWCm7e09E7JrfWWq
	VH63lYwy7bpJfB6QIy7nsmUW5+VVpZKbmcu9ZoAQQ8Fjtvv/bqxbjjCcRBEc7Jz/
	4O2BWk/hFSHtZapQsIyr2gwDvtsT+kxkaCrChOqALrZKJzyT1v7GzFd2nOZpbVsW
	B+BACCg4AD67RHdPWs8x1Zm+ItYaX8+qdvaihWN85XR8C8HjQtC9QDlRHfiND7Ui
	T3wXAtf61QUaXH3tLuDg==
Received: from ds2pr08cu001.outbound.protection.outlook.com (mail-ds2pr08cu00102.outbound.protection.outlook.com [40.93.13.50])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1vxeb4bw-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 02 Oct 2026 13:00:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YSFluMI6r6it9WoQ+TQg+GAsKBPuFu5Z1y+lx5I1lFOkGq2SrumWjBJ+TsjJamtuNVjyt/yf7cKyVj24IyoF/xFDfvPMiOymoYUtanU4umSe/UX0qcLpFLmCWiaNbqCplm7BTVGrvQvV4E0KLuWJEJ7OoFZFQAjlBgAuEILencPoQMp/hc/AbTu3sKa6UYL/PIw0Kmyq6ooCi7AiQsPxAxa/qF+jJqPTQu6c6qfoVFgdvUWUSbBpVDHpxWSULy7f/2WVyqgygnDAkUafa67u/IDu0KqmNoO6w0H1P34Ww/J76jbC+xSF9XaLR1/xEfixsra+yx0zX7yPiXz4qnb73A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nH4I/cLxFx3lhXEeqT++N0K1Zu8/1pNKHpYBTXFXDD0=;
 b=iLrl/RAKrk/qJ6d2GM//a3710qHvYbJzhhwPgIf58xsXQavyhWFVp+f8du1urnc5RJLKo6Y+8N5+kWfhKoF2hxKYciN4Kb0uOYJLuYMpuCOfs/5MTyBqscalxd2eOU4Ndz3hCqcWoBv0jruJV3MM4+oZq/Zhz3nJAK01dXwrbamXD2UexmdynDHKHUEycgH1M8ptB9iN3T0mvTGzJaFuJPYWYK1+z0tcl66s0wmuP5uZdY1gCXvGXDuJLwOuZAggcXwqGQxoiu4Ao8ckkITJvu9iVTDW3qnxJpiDtEXAJFld1DQJHfZy+75swLQ0GoH+imILB3apJWMpC8NQug4EHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from BL0PR02MB4435.namprd02.prod.outlook.com (2603:10b6:208:4a::23)
 by DS2PR02MB243985.namprd02.prod.outlook.com (2603:10b6:8:35b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 13:00:48 +0000
Received: from BL0PR02MB4435.namprd02.prod.outlook.com
 ([fe80::5818:27e:c1c8:7aa0]) by BL0PR02MB4435.namprd02.prod.outlook.com
 ([fe80::5818:27e:c1c8:7aa0%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 13:00:48 +0000
From: Radim Krcmar <rkrcmar@qti.qualcomm.com>
To: Guodong Xu <guodong.xu@oss.qualcomm.com>
CC: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Walmsley
	<paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "spacemit@lists.linux.dev" <spacemit@lists.linux.dev>,
        "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
        "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
        Andy
 Chiu <tchiu@tenstorrent.com>,
        Florian Weimer <fweimer@redhat.com>,
        Peter
 Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao
	<zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien
 Jarno <aurelien@aurel32.net>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan
	<dlan@kernel.org>,
        Chen Wang <chen.wang@linux.dev>, Inochi Amaoto
	<inochiama@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-riscv
	<linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v8 01/11] riscv: Add B to hwcap and hwprobe
Thread-Topic: [PATCH v8 01/11] riscv: Add B to hwcap and hwprobe
Thread-Index: AQHdUCT1AafgZkO7UkSDCQjLkxCJv7bp/tuAgAA87wA=
Date: Fri, 2 Oct 2026 13:00:48 +0000
Message-ID: <DLUDDZSNX0CO.165YQM0WX1AB9@qti.qualcomm.com>
References: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
 <20260920-rva23u64-hwprobe-v2-v8-1-5f14bc5c23d3@oss.qualcomm.com>
 <9d058591-466e-4c06-a820-b8ecc7d319a6@canonical.com>
 <15151b8ab012ca7444d4117e393cf999.guodong.xu@oss.qualcomm.com>
 <DLRWB8R7P6SF.1XIL0OXLZ2F23@qti.qualcomm.com>
 <2f143e2e0698daa43191ff3463e604d2.guodong.xu@oss.qualcomm.com>
In-Reply-To: <2f143e2e0698daa43191ff3463e604d2.guodong.xu@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=qti.qualcomm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR02MB4435:EE_|DS2PR02MB243985:EE_
x-ms-office365-filtering-correlation-id: d0b18fbb-62cb-4638-75bc-08df20852df5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|38070700021|11063799006|56012099006|4143699003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 cSEXizcYjGDwUPNTCXWUrfC0u1ZULTmYKkhoRL3Z2R3yI9ZsEZOilfXIeKmwY1sDH+mbL/Jek9ZPj85iIjGnT6nEvzmaogUNHI2aDeQthoZixNkDUqDZdGjksSd1t1eMZRpcDRh9MOdQ7azlhdES6rtfQJ8S7E7EW4c4QCEYWx+Vi6H44AEXrtMYrS17l3DCIzjARniPFvrz9kJMAMQrTgl7wWf27G7Cgu6J9zyIj+EzSV0InUP2yZDotJNw/u0Kvv5lEGd9cK5ZxrVSRV2BWuYai5gzxV8rpzYRqvH2V/FORrnuyZtqeMwh9Aqmjzu5HFVlmnD3GXnsdxnqFXqfT1acKSP+bb9QQK5SxdEG9uU1PDpMIUYpzB/+n1W7ml3XJpqd5MeISejL3wXXECoCrXlF+IbJ3Cy112OqQXi7NEwrVK/d1zx/Sgn2X2oV+8zVeLU9a1ivaN1DL/PecmW7SRcGWt/ySI859SG3rFg5YRIlWGwhy6diXVbHwkCbvBOkR97vaiVb9jto5JN+ZnwBoE7SaAUNFJJOPgEAuv5QiRraoZu9yg2yjYSrYGOy6P/Iy2zwU+cC4jgjq8yxF9ZQM3eCSjtNQEwx+6rYr2TPEBq5ZyTP3oho8ReuvRdoB/oaITNSeGw11U+QwCXl1xL+orfb3DEtEpmt3GHwM8mch7FZVwsHL9zxYMigcbAlxiV2JNOEMr6fMz8ww0FR3IZVj30hAMsiUZqBm+YTDsyw59Y=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR02MB4435.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(38070700021)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VlRIRndHM0wxOUJQWXNLc2dpNHljTFgvbDhiTHpFMnRnQU1lUWFLVjFYMkds?=
 =?utf-8?B?dHlSNXU5Mkl5Y2lZK1VDellkU3BZUVRvOEE2VUJiZVZ1M2NadmpQb3RhVDlS?=
 =?utf-8?B?ekxhWEFOeHc5Y1RKUTJqcUlUS0g2SlRQcXczYUduQVpSWWwvOEVCVVZJNkFu?=
 =?utf-8?B?UzlMOWpqbDhZVTdDSXZIaWhZSWFSZUZCcHZGTm1ibEZ2TDFhdE1qUTJCcXB6?=
 =?utf-8?B?OGJVdnFMN29IOEFsdWc3Q0U3Qm1iaXdqUlo0TnBkVzZoU0k3NWMvdlg5Q0I5?=
 =?utf-8?B?d0ZUQnZ1K0xyYi80WmQrcEo3clM3c1VEa3VKWVdBeGFCT2YwVnBmWmdEWWpp?=
 =?utf-8?B?MXVuNW9ETVpiTGtOQmFTYms1bUMxKzNuQlhaZUswN0p3M0Jaa3Z4OFpMNVkw?=
 =?utf-8?B?YnJHRVUxZVJVYjNIL3U4SEdoeGFaVHR5cmNlaHpYb2drVi94K0o3ZlJEY0Vj?=
 =?utf-8?B?SjhydVQvS3BjbE1jUWxwTXRkL1EwU25mMGxxL3gvS2t5UXBITWNzalI0QXdv?=
 =?utf-8?B?QnFBam01N3JLQWw0RnU1L21hcHdEbEJjZVVjT21aYVAvUDRJcktXYmVOVkJ1?=
 =?utf-8?B?ZTBCNHhoOVJEZnZGK2tiZjljQ1V2QUtRS0kwZjI0WXp3TENEbzVvUFQ4NnVZ?=
 =?utf-8?B?cGNCY2JSV2YzaHdXZ1ptSVpMc1d1ZnRnMnRaNk9hTzRRTHQzZkE2b3VOMjBr?=
 =?utf-8?B?dFJNMW16aDk3TXY4VlRhMWJIZEYyZm1MV1ZmN2swM09tT2w3MlUybjV4MlFF?=
 =?utf-8?B?TVkyVlB3MlN1REExbTVlV0ZHOTdOZ3hGb0c5UFo0QU5Ed2pBYVdUWW8vWWJK?=
 =?utf-8?B?cmZVY2E4MTB5OG11M09YU1dDSjc5NEJiQ0lkWDlQY1Yvam5OdTlnRjMxbkZK?=
 =?utf-8?B?THFCN0xKd3dyd2xmbVpRSVdKbVNCdEd3d2k1VmZ3emVEQytUajM2ZWtYVUVn?=
 =?utf-8?B?akoxV1pZVk5EUzF3U1phMExGUm9ZUysyV2tsa1d3VVBKeXJSM1hxR3ZPZXJa?=
 =?utf-8?B?L1d5bHhiMFQ3ZFNvcU0rTWxQdUVONHY5NXZGL0JLWkMwd1p0RGkxTitQU056?=
 =?utf-8?B?TGdOUnRWMy9JZFR1Z3Z4cXptM0toR2dqU1c1dWlrSHJDN1Nwd0R6WmxydlFB?=
 =?utf-8?B?d3BUd1UwYnRpTTV4WkZwL2V0dDVVbmxwK2l6ODlnWVdPaXRKUFRKKy9QVDFJ?=
 =?utf-8?B?V2tqdHE5N0RycjcvSStGQmtCVEpMOXc4TTRmZWJjcERKRlBMN05OWFN3SVNK?=
 =?utf-8?B?aVBhOVZlU3pvR28zL2ZEM0ZNMVY5dHgzWUVWaWNURnBQZXBSbThQNW1XK3My?=
 =?utf-8?B?VVZJOWhtZkF2UWZCeE5Bak44aE52NVdrZmlGaDk0OEJsK3MyWi9WWUJ3LzVh?=
 =?utf-8?B?K24zYlhNcy85TlM3SGlOeFR2N2c2MG84enBPNWdiVzBvUzh3VG1ZR1pEYVln?=
 =?utf-8?B?Ny9hN1RJZGljeHkyWUlIWmx2a0dRUk12UkVyT3JVMGVtZkd6QzdYNkZWM1dt?=
 =?utf-8?B?VlIxamtNdERGbGo0bUlEMG5LeGZGOTdheEhBSU1mTnp1aDVqSzlVVU5mL1pC?=
 =?utf-8?B?UDZRbHg4YXVQRm4yUW1LVkZzVUQ1OXN4TnFJQzNDT0hiWW95QktQM3pOVHpi?=
 =?utf-8?B?VG5jM09tZlU2NWUwaUNIQjhzM01GbTFVRENaVWV1SE1LaG1VZU5UK2FNOVVh?=
 =?utf-8?B?RXliYlB2bE83VFFUZHJiUXpRRTNvSW5MOTRpN1E0aDdFY3NMcElGQmxXTDN6?=
 =?utf-8?B?MGR2YWpEbytvajIwblQ1a0RLNW9pejJZWG82Q0ZuVEp5Smo2bFdEVlF0NkFJ?=
 =?utf-8?B?bGF6c2dKeVZUQUQ0VkR3RFFvNkt2UmZDQlQ2OTdMTWorOC9NM3NkaW1Xenlx?=
 =?utf-8?B?bHhzaFBzb2VEa1FJMW9qVGUzVEtTQ3dwdTFiRGJDMXJ6eFVXQlVuMDNranM3?=
 =?utf-8?B?WVlLYXpRR3N6UnNYaWVEeWVYTUdIQmlHSjhqN3ZaMTVBZE5TZE1CNlgwdy90?=
 =?utf-8?B?elpkbmZlZVpxMXNEcTBXQlE4bEYyR2NmS1o3d0NzZTV5ZWU3WjQwTWRIS3p4?=
 =?utf-8?B?TXNtUVJYdm9JN296OW9QcStkNGliRWh1aW5xWGRobmlhNnR2ZzMxNGtTT0Zh?=
 =?utf-8?B?MzA4bGw5RG8vVzFyZ05PMWMwUGsySTFLN0dqTXAzWnVENU9sRFBxMFVmMk1r?=
 =?utf-8?B?cXZhWkZkeVRSYWdRQmpETGFXT2QrenRqRUxFY1A2VC9jdllnSVh1VG04K0FF?=
 =?utf-8?B?UlB2ZG53UlVDdFlOZWc0b3hRYlJnZ2xETkl4OEVtcDFQZlhUMVU3bTVveWhz?=
 =?utf-8?B?YzZUUmpseDFPbTlYajR3QVhFS0xYWjhDb3krbk5vOGJ6dU5UYmN3U0d0R0lx?=
 =?utf-8?Q?n1fQ2eAJfVPGr4Hw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B86B6284649F464F8C7F40067FB1EDC6@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	AtKGwbKXklStj3omlS05SWa1g7N930WDiuGWV/OfAJYzDNYQCBSQiEOb96p+7YmxjmecsugYF7ZLoqbwaUgpSZ7ZZv2V3THDTFnCfkj0upJ0y5e8JwT17QP9oBjGjl1xpqrSrjOxy9qWsfd+/KuJphprVd5hwgdLbKG0kcZhteHXKGxoyqCJj8vu9qXjZczA4ylR3+PxdZ7bookGtAqUnbNCFC451x/18qli/PcCpURcq8v7pxolNEV1Xrum59kty/9+LAgSIoXV3jzK9xG5SajVwLM7TNa5Pb4SCu5167BZyLLkIB19dmnDYP3u92eX6DmJ3t6t66pwvnlTXZrOvQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9V4HE50rFJn1Qfqw9b+iUh9KSMiQpXBVMzKakrKMTAcuqQXqOku+TP+9RWmMQe8WgMZMQYziOXgkcF573OggRBuiGaeUKm4aWRcyz/+P4Ip9rvQkpd5v4IyBadkX7Avt3l8Ie+jBGbaAWMzu2by38Iw98V+jWWqfKFxsdvtb9yqlbTL+7UsMZIuzipL/mpkJD9zBueZOzxa31gLnwD/kD4wLcPz8qdHcVPZmSGNHozOizr1DvNw92Prk8gVN3bYG81RoKnoX1NKUyU77UZcbQU5DGlU68/8nCvVyqg3Mr93MvsOj5EjBv7hHOzFPDypwRCMUHm5SQFD4b9PlyLuYV8sg6I6KOsOxTRnZhVIb/m3VTBSNwP5weJ3UJW1CydJJDSVOKws7wiAdmznui0o5uHulpKF3Rmrf8+jInaBEXn0GO8iOpRh/pVO4xSzGESr30IjI6JOGw2+DYkI2kwXc4EK2rJIr5noynOly0rOBDiKW/ZqQ9ydnBVk0z9K9fjM6i3k9iojT8irS2Sido0z6qF1hfkjOkyeRdc/SrX5ArH9EY7n/G2qbNscF60BWG6dfGH833Malh+qNGavN+yFwwX/DtstietQO6ihfaFlOKJ61YxpZH20bhGXcHSpoyCpP
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB4435.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b18fbb-62cb-4638-75bc-08df20852df5
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2026 13:00:48.3220
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IB+GIIPaKGNebji4qUSrOXbFnDmNzZhaMh0KCfZ+9Ka9njusSqYOuNnCHsqe/QbqeWNUIcx/1eVuNMMa8m0vs2uMmnWLhxcwx8M8YKvPXU4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR02MB243985
X-Authority-Analysis: v=2.4 cv=fdc4WEQF c=1 sm=1 tr=0 ts=6abfab07 cx=c_pps
 a=ITiX5wGoaVWtfJBAqtKqhw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=f7IdgyKtn90A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=MPGxGW8KdBHyhiCmLn8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: BF8ZPDtQaefjI_PEzhV4s1EIO0lysew9
X-Proofpoint-ORIG-GUID: BF8ZPDtQaefjI_PEzhV4s1EIO0lysew9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfX3kp9djJ+tdbs
 Lmh8yVRXjnfQWWr+r5FyjOvsco8KQC7S+7JFqgVjSJFQr+rPysF56neadTsccugJ5aSaOo6+soW
 BtzFq8pPt7naoeONyysPfCjXqppaYvO2dGdY/1DQ6INteNAVIvBE5ZuJ0UWRfp090LSM25XPj6Q
 I4um9d98xsvlDM14vAKb4BdBTmC0vA2v3iD/AxtXd/6bYzxqALr28on63wbFOELVmS0FFTJdI3I
 i/zrDKvVU/lUB1M+mISipA9SFr2D51Xbdfzhor9+rpTEYqSGer4qZkCs547uPSlufqBMDleHe7s
 H7kxqOYcfWAS/50p6CBThKSStN64ENfje56vzAl4kLN3Hu7THUwZDf62ULF+75uf5nHz4jpKuuK
 NQ7rJgmXNU0QaB/uFnQBgOnHwXbV0VttnL3ro4QIyevmOuWH79Pwjbf23bt/ywcUmXPvtK183A2
 sy2p8RebzO0VJ9y6X0Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfXzzsi9fR8uPgb
 9BUEjY+QfcHW+oE47OLE5WZYHd5ImYNBd/z8VMLh7gaWoQjdQytwVVtajVHdrgqlzH4mWlHtu5+
 HPL8A40QWaTuLfuG3ZKHDG4ik5rljDk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020051

MjAyNi0xMC0wMlQwNToyMjo0MS0wNDowMCwgR3VvZG9uZyBYdSA8Z3VvZG9uZy54dUBvc3MucXVh
bGNvbW0uY29tPjoNCj4gT24gVHVlLCAyOSBTZXAgMjAyNiAxNToxMjozNiArMDAwMCwgUmFkaW0g
S3JjbWFyIHdyb3RlOg0KPj4gQXJlIHdlIHN1cmUgdGhhdCBCIHdpbGwgYWx3YXlzIGJlIGxpc3Rl
ZCBpbiB0aGUgSVNBIHN0cmluZyB3aGVuIFpiYSwNCj4+IFpiYiwgYW5kIFpicyBhcmUgcHJlc2Vu
dD8NCj4NCj4gRm9yIERULCB5ZXMuIFRoZSBiaW5kaW5nIHJlcXVpcmVzIGIgd2hlbmV2ZXIgemJh
LCB6YmIgYW5kIHpicyBhcmUNCj4gbGlzdGVkLCBzaW5jZSBjb21taXQgMGNkYjdmYzE4NzliICgi
ZHQtYmluZGluZ3M6IHJpc2N2OiBBZGQgQiBJU0ENCj4gZXh0ZW5zaW9uIGRlc2NyaXB0aW9uIiku
DQo+DQo+IEZvciBBQ1BJIHRoZXJlIGlzIG5vIHN1Y2ggY2hlY2suIEJ1dCBCIGlzIGEgcmF0aWZp
ZWQgUlZJIGV4dGVuc2lvbg0KPiBhbmQgUlZBMjNVNjQgbGlzdHMgaXQgYXMgbWFuZGF0b3J5IFsx
XSwgc28gYW55IHNlcmlvdXMgaGFyZHdhcmUgdmVuZG9yDQo+IHNob3VsZCByZXNwZWN0IGl0LiBS
aWdodD8NCj4NCj4gSWYgdGhlIGZpcm13YXJlIGRvZXMgbm90IGFkdmVydGlzZSBCLCB3aHkgc2hv
dWxkIHRoZSBrZXJuZWwgY29ycmVjdCB0aGF0DQo+IGZvciB0aGVtPyBUaGlzIGNhbWUgdXAgaW4g
djIgWzJdLCBhbmQgbWF5YmUgaGVyZSBJIHNob3VsZCBxdW90ZSB3aGF0IENvbm9yDQo+IHNhaWQg
aW4gWzNdLCB3aGljaCBJIGFncmVlIHdpdGg6DQo+DQo+ICIgUGFydCBvZiBtZSB3YW50cyB0byBr
bm93IHdoeSB3ZSBzaG91bGQgYmUgZ29pbmcgdG8gYSBidW5jaCBvZiBlZmZvcnQNCj4gICB0byBj
b3ZlciB1cCBmb3IgaW5hY2N1cmF0ZSBkZXZpY2V0cmVlcyBldGMuIEdhcmJhZ2UgaW4gLT4gZ2Fy
YmFnZSBvdXQNCj4gICBhbmQgbGV0IHRoZW0ga2VlcCB0aGUgcGllY2VzLiINCg0KR3JlYXQgYXJn
dW1lbnRzLCBzb3JyeSB0aGF0IEkgZGlkbid0IHJlYWQgdGhlIG9sZGVyIGRpc2N1c3Npb25zLi4u
DQoNClJldmlld2VkLWJ5OiBSYWRpbSBLcsSNbcOhxZkgPHJhZGltLmtyY21hckBvc3MucXVhbGNv
bW0uY29tPg==
