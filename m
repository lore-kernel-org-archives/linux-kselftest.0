Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795616219;
	b=zzqpQukVtY0BHKt/fFdtnFu2HA3oySCjnBX7Ww8X1X9ln0vabWUzpYd9zFJkQ91+zBy3
	 3/I19kEwMM9gTOxOo7QptEKXCybaKv1/C7yGaqErM/4Vnc/4LKiqyyTglgbsJiPGocF1B
	 SdSu5CopT2kJL7C8iR7CCs/9+9i1CcX1gKc6g1k/C67733Kb2IceV2rAwPIMUPYxC6GGO
	 7yJ+NTqoOouzwpKsmtrvyOUSk8DVn1ogv3Mjj9AUw59P625bJohk8RkXHdTY9NwOJHvz1
	 sFW/TYshZN0ViieN2ufz7G8JmqMePRfXMe5a5CeIXeFGPlbAmaGdQe+4YW6T8lIbejg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616219;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=BgSgeCj1Y9V/ZEQzNlabPCrpMqEMwnUbANuXkfmT2Ns=;
	b=EyZzJ68jLqrbpjA7IDr6q2LgAaUjYMtpL6tKDRj6pwbM1XdKVmC7pvivxSCoB8ORzU8I
	 eW+AZM8XzuI2+qsbF9EpyiTea5fm8ftu7Ved76UExO0GXIkGLrw+heK3D6W2Z05rNkE0R
	 gTwCUGcRVpVMNgE1SpMpWfqeBzHVlZwxHf1l3RCUBVv8dnsKOWviLrXzpUJ7bVqBexu9P
	 bcQtWmup3t44BqfoWSerch4jz0jH3PywcexwfaPubTrPbIq0GynlqredY+gQSZ7dg2ILA
	 7M+bdplqei1SHn6rAHEgrV5QcwhRU2n4SpDrKJi/u7gg+GsEc+f66fO9uVNxZGv9Kjg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=uOPe2Ijc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.71
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012071.outbound.protection.outlook.com [52.101.53.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3106606A327;
	Wed, 25 Nov 2026 14:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3106606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=uOPe2Ijc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y90+ILq/ydavC8L4/K/BjH8xMb7DFoERq6Cs0SOob4fdI8LxpBgbHe515+v+IaMh04E65uU34WrYI//6jdgmXZtFbPkRNerb852PKGtI9W39J/ynHhJCmApp2JRakV3C2ZsQpljwfZUXtE5ERpPZyi8t/pIuv9PBly0qRUPEMHAgWs9LPYAwseWNCLKfeX+8X093jGnWuM/nS5A/0yu37bunPQixzgn0uiRkZWVjx+2VgThVvXNlnUK9FuNjZs/+Z6XchZFm/Yx2UWiLFpIFBUthkuKLtALKQMN0IVtk7tlGEiFBsPcrqtwJ2S3OttIaY8PkQA7bdat7U9+uLBeyvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BgSgeCj1Y9V/ZEQzNlabPCrpMqEMwnUbANuXkfmT2Ns=;
 b=ubB/oX9jEkL7d93cMmZ3p8ezTV34KPbRJw145iKWEF10Q9+PvYSjiL4SctSTtOTN1m/7E4d3B/mTSaOC6ngLIlRYa0kx/VwFq61n/2odjw2ZOOWW/R5LZErCeE8sD2iwxpX4oQWV/mBhBL1DR8KMwXm/jUZ+j4yhLNmxRHZYJgwuRgto9hwjclpxWrPKwr5U9cbxgUVNo40pGCLNCCIoim6VAsiu8Ztltw1rlBnzIZTo+gGAxga7N55nGdggQPTlddeNiuqeiMKcEDYUfH4Tpyd5IuxrBnil9E8ER9E4CkmfX97orfr2VkGbj/m3T6DMBzh9VEssO7es+dFNplSNiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BgSgeCj1Y9V/ZEQzNlabPCrpMqEMwnUbANuXkfmT2Ns=;
 b=uOPe2IjcFgVm9AoVkKOjiXSQ/+fIzrAziHLSZ21DOrzIujny/yDyGhVPA/p1GPAuOtLeUrtMynx1oI0XQ3MOY1PSdCudGLO2Co+HmiOR753vXB1E1dEqDOT2ACuFCrvGjoIUQiKJKmlccEQ36GlZqN7Fsm8y6YzLOWhcdDbKkwE=
Received: from BN9PR12MB5259.namprd12.prod.outlook.com (2603:10b6:408:100::17)
 by SA1PR12MB6969.namprd12.prod.outlook.com (2603:10b6:806:24c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Wed, 25 Nov
 2026 14:16:49 +0000
Received: from BN9PR12MB5259.namprd12.prod.outlook.com
 ([fe80::122c:cca7:c2b3:90ed]) by BN9PR12MB5259.namprd12.prod.outlook.com
 ([fe80::122c:cca7:c2b3:90ed%6]) with mapi id 15.21.0662.001; Wed, 25 Nov 2026
 14:16:48 +0000
From: "Garg, Shivank" <shivankg@amd.com>
To: "usama.anjum@arm.com" <usama.anjum@arm.com>, "nico.pache@linux.dev"
	<nico.pache@linux.dev>, "rppt@kernel.org" <rppt@kernel.org>,
	"shuah@kernel.org" <shuah@kernel.org>, "Rao, Bharata Bhasker"
	<bharata@amd.com>, "yintirui@gmail.com" <yintirui@gmail.com>,
	"vbabka@kernel.org" <vbabka@kernel.org>, "emmir@google.com"
	<emmir@google.com>, "danjwade95@gmail.com" <danjwade95@gmail.com>,
	"pgofman@codeweavers.com" <pgofman@codeweavers.com>, "david@kernel.org"
	<david@kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"dev.jain@arm.com" <dev.jain@arm.com>, "surenb@google.com"
	<surenb@google.com>, "kas@kernel.org" <kas@kernel.org>, "peterx@redhat.com"
	<peterx@redhat.com>, "usama.arif@linux.dev" <usama.arif@linux.dev>,
	"ziy@nvidia.com" <ziy@nvidia.com>, "ryan.roberts@arm.com"
	<ryan.roberts@arm.com>, "baolin.wang@linux.alibaba.com"
	<baolin.wang@linux.alibaba.com>, "liam@infradead.org" <liam@infradead.org>,
	"mhocko@suse.com" <mhocko@suse.com>, "ljs@kernel.org" <ljs@kernel.org>,
	"lance.yang@linux.dev" <lance.yang@linux.dev>, "baohua@kernel.org"
	<baohua@kernel.org>, "avagin@gmail.com" <avagin@gmail.com>
CC: "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] mm: fix soft-dirty false positives in mprotect() of
 large folios
Thread-Topic: [PATCH 0/3] mm: fix soft-dirty false positives in mprotect() of
 large folios
Thread-Index: AQHdfOGHEUgq95w8VUOHW+Vokl59fLc+zCWAgAAJTAA=
Date: Wed, 25 Nov 2026 14:16:48 +0000
Message-ID: <b6b9d38d9cae1f8684cfe9a13ec224807f7eb94a.camel@amd.com>
References: <20261125-b4-mm-soft-dirty-fixes-v1-0-538e3cdb618c@amd.com>
	 <380e029a-2d9a-43ee-9048-c4b490c11f41@kernel.org>
In-Reply-To: <380e029a-2d9a-43ee-9048-c4b490c11f41@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5259:EE_|SA1PR12MB6969:EE_
x-ms-office365-filtering-correlation-id: 170d065b-0267-4912-ef28-08df4afebe78
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|4143699003|261009223027099003|18002099003|22082099003|921020|10067099003|11063799006|56012099006|261026121527099003|38070700021;
x-microsoft-antispam-message-info:
 jcXb0nEi36UIKoaUIwf7+0UTUClS5qT03BnGJ1q4PzKQscBgJlxZGNtvC4n9AUVGATSJ73A+FdE+X/qVAeNaA1UOBYIzOtZPScXoJxoSnjYST7Kom5FhBw+HhqamnxnkveT8IHFpt6MOszOPMZlhPpp0yfXIUwswGq2Ut/4KqVa7K9KYZr+b2oHjUrEHyuGT2+dpljBlk9YelMVLsXmWENEb/amVKVx3ZxIqJAFTk2dZpdZVV51I2PTk1iQaaW+a1kNKQYmfi6qmVhDEx1xk7j0JTtjcf2mUI2ueEezE9r8mL+dDK8NduLzp2DN4L7tWW3tBxYv0Xs1XYt90FKUKwc8Y5nFVjg3Sn1jRnm5fPBmhBS+aKvxFHUprvfNFWjJvL8p4eJgOFFxKCOfd0Qtbvzv32JtyUe6I6TN/rUX0gliZnQ5QHY82Sy0AGe5eMAqhpkecYN/bK5fbWIdHolal6AItOWSjz/rN7x2AuXH5uoi+TXjLdY4MHRWE+9m/IW5Q6skLqGgeELgz2FfK2RrXL+IPZYQLe8vDib75keKAD/n6hKr8JCr5qq/gLBRkU2PPeVwv7yigQvU/APTKm1yrQ/Go+IZLy8T636e5wT5xcDKwTFr63d2ap+iQxBKwuTbXhV5D6wSe5VdU6eTK0QpX3cWtAMPzgKlhN1zcWADN3kUhjMA52RC8dZU38GiJs7Df
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5259.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(4143699003)(261009223027099003)(18002099003)(22082099003)(921020)(10067099003)(11063799006)(56012099006)(261026121527099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d0V0WGZpcnRIc2FsZHc3c094YXgrMXlrbmhDNTJTQjRWOHhxSUJSanB5OWFI?=
 =?utf-8?B?K0dzdFFCS3dhN2Q4TnAvdGVPd3p1N0t6L1gzK1A3SzVYSStLdm5EZU1oTzE1?=
 =?utf-8?B?b0tCKzArdUlTMVFvYVgva1JPSTlUNTJnTW1KS0VvYUFDemdYZkp4bXFNci8y?=
 =?utf-8?B?YW9KbVY5UkhTT1U0MXpUMkFCNVpva0NKem95MHJ0VE9Xd0JRWHc1QTRZL2Fj?=
 =?utf-8?B?MWVLeml2dkpMcldYS25Ja3VEQ2EwNEthRU5CZkJNd1N6TXNJNm8rNnJwRis5?=
 =?utf-8?B?Z2puTTlDWXk0U2JqU1Y2Rm5PejBHTWxFNDBjSFNxSTBiYXZGbVEzRU1FeTRX?=
 =?utf-8?B?QXZxQkNMTEY4ZXQrdWlqbVRvUy9xQmRyVHFraVdlYmE2YVRDMEtNR3pDUzhX?=
 =?utf-8?B?c2N3R3RrM3gxWU9oWDZjTHlkNTFDSjZyWGFITWFEbjBnSW9oT0tEQVlMUU1p?=
 =?utf-8?B?eE8wSjdXeWlHd1kvVUtsNHdVemN4eVdKTS83WHB0VXNsTVhCc1JGQ3pBemta?=
 =?utf-8?B?Zko4c3ZqckEvd0hROWpmOXJ2ZTUvQTQ2ZjIvMDlreDNOUzRyTVhMM0xLWm0x?=
 =?utf-8?B?eWlmcng4WVd0dStxWjRIa0xGQlg2OFVobUlSaUJUNmJJTDFVRU9BWHNsRnlj?=
 =?utf-8?B?b3gxdXdaQXlKQ3VhRmpXRDdPM25FajlRTFRHeGN4VGFkei92dFJsUGllOGJv?=
 =?utf-8?B?Nmdsazk0R1VwZU9DOUlKWDJUcDR1NjVXaENYV296RG1HWk9YTDB2eXVHTWVp?=
 =?utf-8?B?QlJCNkFHbmJKbTREb2g5UDVvcVJMZnpjUGZWL2ROam9mRzc5TzBEakFZYTFP?=
 =?utf-8?B?UDdDZ0RyT0MraDczNVNRc1R0UXpqVnYxM3dtcmdrTDlFOElZcFAzdkJldS9M?=
 =?utf-8?B?VmdHUzdGd1V0VFFHcWpGSWI4VUZEOGt6azA4OTZ4cklIenA5TWNRR2FmamRz?=
 =?utf-8?B?djBCZUc5ejB6Z09ydndpN256SDE3ZU10bFV5N2lJRGU5WkJlVWxOdmtRMmpY?=
 =?utf-8?B?dElBOWhIYnJpTFA3ejZzcGpBdjlhWjZYSGxpTXo2WW1YMURadnlmb1l5Vklw?=
 =?utf-8?B?bklrTVBIZFc1aFRXcDdNL1JkVFV3TENxckxmZWw5cC9DZjYzSGYxSmJXeHlC?=
 =?utf-8?B?WkFrQ2V3ZUZDallGSW0vTGgyZGdhL3FuaXhvbHRwaTRxbDdjcHYzQW94SXp0?=
 =?utf-8?B?M282UEZHa0FLVnZnVDh6K1NyMWtHU25OOXoyVUNRYW4xYUJkc0hjOGZCSi9Z?=
 =?utf-8?B?VGlxNUt6ZHY4QndQaEVFWlZXVXJ1Mmd3ZHp6REY2VEtNME5FdUtkajVFM2pp?=
 =?utf-8?B?QUd5VkpWa3RqWVpNUWpnZUszRWhJcU9mdDFXZ1FTN1ZSN2RVZHJwR0IwSnhC?=
 =?utf-8?B?YnZLVFpJbkcxeVFuTnhUT3c3bzRiQWdRWk1TQkNTbVFkbDVsWis1ZldQZGNw?=
 =?utf-8?B?RUdPK3Q4d2RUWHJrZ3M4NFljZUtCbEJNbTVEVGhoLzNpQW9iTFRtUW5KaWlo?=
 =?utf-8?B?VUY0V1IzV292RkZZdFhXWkg0OXphNTFHZU1uaWI2dXR6djhKNWErZ0x0ZUdY?=
 =?utf-8?B?Z0hnTEV1SjRabHdhWmhqOEtxSzJRcXhXZGhBMFR4bXlZSUMyTGFtOEdVN09i?=
 =?utf-8?B?OW9sdktoVkRzUlB3STNDT0hZcHkxbUhLSnhaTFlFYTAvRWpueFlMOVFuT0Iy?=
 =?utf-8?B?Rys3WFZncU9Wb2dDT3JGVU9UaHhtTUswYkd5clhnK2NoeVhHdUxZcmlSRzFS?=
 =?utf-8?B?dkRrNzZRTUNXOHlEeGxMSzBPRVZuWW9DdFNwM0lTaGZrRjR0K1NkL2Q5aTU4?=
 =?utf-8?B?WW1mWjE0cnZmM3cvZ0t1VXlPdUFlZnJVb01VQmtxc2tkclJmM01nZURaTCtR?=
 =?utf-8?B?eDliNEZ1U1p5dGRZcTdGbExBQkhBN2k2ajU5OG4rcFdPcG9oZUEweGRERW9T?=
 =?utf-8?B?YVpKc3dYYWMrS1IyRGJhUitzdG8vbVlPWEtEMFgralpNQ1JhUzNuV3RnMlNo?=
 =?utf-8?B?OWN6NG5ZRmd2THBqcVBhT080UnpGbW9aYklHc1g5UTMrVUdVS1dWV20vYnQr?=
 =?utf-8?B?Wlp4U3JpTkJwSnFSVWs4WHZ0NDdxbUJ6ZzZsak1xaGlLOGJMaEthTC9Qdjdt?=
 =?utf-8?B?YlhqY3ZmdVhQVmFIU0IxNFpwRHpHcHViTkRFZ1R2WE94YlpUR3FlU3F1RDJk?=
 =?utf-8?B?dzM4dVk0YjhOY1JObDVvR2ZPUWg1UlppV2tPTkJPN2xPRnB1Q0J3cUNqYkRs?=
 =?utf-8?B?Q3dBWG1CeWdEL3QxSGM2ZE1GS1BURzJtdGVSc0kzTkNTTWI4WnR6bWY0WnJo?=
 =?utf-8?B?WDYrcU8zM2tDOG4xRVEzRW9VRmswWEIvMlRNOGFKR2MxNXF6VkpVZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF8F273301A74D438167B9256DB13469@namprd12.prod.outlook.com>
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
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5259.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 170d065b-0267-4912-ef28-08df4afebe78
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 14:16:48.7153
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2+o8S28WeBSoh8lxznmhADXXqQXIkR8FY3elhqa2yfe5hLLTBwBaX7Zf/ODFnXTnCLEYsirRwhVFFa3124WlVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6969

T24gV2VkLCAyMDI2LTExLTI1IGF0IDE0OjQzICswMTAwLCBEYXZpZCBIaWxkZW5icmFuZCAoQXJt
KSB3cm90ZToNCj4gT24gMTEvMjUvMjYgMTQ6MzIsIFNoaXZhbmsgR2FyZyB3cm90ZToNCj4gPiBt
cHJvdGVjdCgpIGhhbmRsZXMgdGhlIFBURXMgb2YgYSBsYXJnZSBmb2xpbyBhcyBvbmUgYmF0Y2gs
IGFuZCBtYXJrcyB0aGUNCj4gPiB3aG9sZSBiYXRjaCBkaXJ0eSB3aXRoIHB0ZV9ta2RpcnR5KCkg
aWYgYW55IG9mIGl0cyBQVEVzIGlzIGRpcnR5LiAgT24NCj4gPiB4ODYsIHBvd2VycGMsIHJpc2N2
IGFuZCBzMzkwLCBwdGVfbWtkaXJ0eSgpIGFsc28gc2V0cyB0aGUgc29mdC1kaXJ0eQ0KPiA+IGJp
dCwgc28gYWZ0ZXIgY2xlYXJfcmVmcywgbXByb3RlY3QoKSBtYXJrcyB1bndyaXR0ZW4gcGFnZXMg
c29mdC1kaXJ0eS4NCj4gPiBXaXRoIDY0SyBtVEhQIG9uIHg4Ni02NCwgYWxsIDI0MCB1bndyaXR0
ZW4gcGFnZXMgb2YgYSAxTWlCIHJlZ2lvbiBhcmUNCj4gPiByZXBvcnRlZCBzb2Z0LWRpcnR5OyB3
aXRoIG15IGZpeCwgbm9uZSBhcmUuDQo+IA0KPiBXaHkgZG8gd2UgY2FyZT8gSnVzdCBvdmVyLWlu
ZGljYXRlIHNvZnQtZGlydHkuIEl0J3MgdmFsaWQsIGFuZCB0aGUgd2hvbGUgZmVhdHVyZQ0KPiBp
cyBmdWxsIG9mIGhvbGVzIGFuZCBidWdneSBhcyBoZWxsLg0KDQpTdXJlLCBJJ2xsIGRyb3AgdGhp
cy4gSSB3YXMgY29uY2VybmVkIGJlY2F1c2UgSSB3YXMgd29ya2luZyBvbiByZWxhdGVkIGNvZGUN
CmluIG15IG1pZ3JhdGlvbiBzZXJpZXMgWzFdLg0KDQpbMV1odHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1tbS8yMDI2MDgxMy1taWdyYXRlLXJtYXAtYmF0Y2gtdjItMC0zYzU0MjRjNTU1YzdA
YW1kLmNvbQ0KDQpUaGFua3MsDQpTaGl2YW5rDQo=
