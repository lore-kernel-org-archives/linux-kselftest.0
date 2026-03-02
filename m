Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011060.outbound.protection.outlook.com [40.107.74.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13DB3FF1;
	Mon,  2 Mar 2026 07:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772436377; cv=fail; b=ILxa6S8JioRBsMwUUGoszBmP/GKkyq+AZxgqsKwsuFXKKek5WTiC8YGxlWMx/x12MTAweUPt28/8tz6kACnilmNnX/T9vqpUOauTOKT5B0yIWWa+u0IHN/SSUDzaMIBc+c0gElmm9JqgWkSgAlBhkusXglN6cj9ZXcm5v0Y8Dko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772436377; c=relaxed/simple;
	bh=AbSpfYZ4anpCRyHd1RyjmE7dqBR7iFaT2llWyO9WzP8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XTHAqxJP//DLMZd/WSwhpwuygKtU/eUkqq2q7YX5hYsbTw/yEmSVVFlGhepDiRc7WIgN5r+av5WpXu5GGVPiL07zt/Hd0Etb7ksDZoPpQ+31G/Vee6BJ0+nbg/G9ZFNQ07uEIld3ksE7YoBXIFkHHj/gy6FU/F+2NUenmOEHFQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=PD8rj7Zv; arc=fail smtp.client-ip=40.107.74.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="PD8rj7Zv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=If6Rh88gAoiXcfqJAheVc/febIdpuYjACA9hGGiMNS79CWguuAx388u9GRJ9C71J7h8bsSpLLyKJRgc8lRViSbqYFVqZiHoGdRlBaLzNqdPCx1KzRtyuKoi7r4abnhTDcdW7X7UzEh5M9FzyTSAXdwtPfF0RDxhun5CS+TXIwbQaWt89dIZ6XKpYqlRIimvJYWyBrDnx7ut8YpyhatNhUMoLxYUj4VvljYb8mMdxIAH4J1fpV/oDvJHB0ddCOeh6Gx1630yQhwF8GSH3Tq+NceMLzzygaXfNA03kvPoaw2u69FFfC2lvY5jTsegKFUwPFeZmms0/kUaGXv3q/sZ4xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IKL24lHKXJ8DU2nicIBEt9Zk/JiWpZqqe8qxSj4nK9k=;
 b=tFARTYStZaE9uskqseBsA8brcoY287UNy8dUY5LlEBIe/goz8LLzzyQ4u0u5zqajk+MNPuHmMbo6b5trHGWkqmDnCZWOgORfY2leMJ1OyeKcj/SMTwfOFHNHPojedPDoqWS7MYunGS3GcZZMLGA2m3/obdRr1P7CcH855QGqY1d0tSuc36pGsawX+b770rNOPY72CJHJS7A+PTQGxqtLrO0SDdgcw0sp7/nGTdknLa+L/pkC460KDyPx5DPbSV5ONpSweIPOOe+P3hFNfacpVYnu7VX1LNI1UcsZaEUd2CIhLN6Wikpx0bKsXvxbO0MQPgOj67e+Ia4tChlaxOxgbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IKL24lHKXJ8DU2nicIBEt9Zk/JiWpZqqe8qxSj4nK9k=;
 b=PD8rj7ZvSX8n2PpvYY7vDJe4j9TFeOme+cwR7Qep/bWO1cnhzd+s8WWI5DNubjNYKkuJQqcqEFuDdrIkhKATLrU2B1nn3dimP9UBUKNYY4SVEpGl42FmZ6ppZf3KqI5oERY5mShcBrVO6hXA3yIz/XDUq6Iv+v3w5F8i6z7TENiap6GX2JqG4T5C4/xvRFTHhbA9cZhcITMP2DZrp0GAvXAdVykcMhONEPXCEbW0gReZf+/JooMS50MlLVofiyBJLjXipNhuCXZgDZP76KJJ1iWaDbs5SApqVuTnQm7jmxtaVZBSAMvWMfNQGL6oPJyEexPu2nh5keSTLEVDEuSngw==
Received: from TYWPR01MB9923.jpnprd01.prod.outlook.com (2603:1096:400:237::10)
 by TY3PR01MB11875.jpnprd01.prod.outlook.com (2603:1096:400:40c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 07:26:12 +0000
Received: from TYWPR01MB9923.jpnprd01.prod.outlook.com
 ([fe80::245:b736:f3ad:80c5]) by TYWPR01MB9923.jpnprd01.prod.outlook.com
 ([fe80::245:b736:f3ad:80c5%7]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 07:26:12 +0000
From: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
To: Ben Horgan <ben.horgan@arm.com>, "fenghuay@nvidia.com"
	<fenghuay@nvidia.com>, "reinette.chatre@intel.com"
	<reinette.chatre@intel.com>, "james.morse@arm.com" <james.morse@arm.com>,
	"shuah@kernel.org" <shuah@kernel.org>
CC: "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [RFC PATCH 0/5] kselftest/resctrl: Enable CAT and NONCONT_CAT
 tests on ARM
Thread-Topic: [RFC PATCH 0/5] kselftest/resctrl: Enable CAT and NONCONT_CAT
 tests on ARM
Thread-Index: AQHcjCGpRV9+PSbap0irvdkrML7zi7Vmgh6AgDSQdSc=
Date: Mon, 2 Mar 2026 07:26:12 +0000
Message-ID:
 <TYWPR01MB9923C04ECCCA9EF4FB49328C8B7EA@TYWPR01MB9923.jpnprd01.prod.outlook.com>
References: <20260123044034.141247-1-tan.shaopeng@fujitsu.com>
 <a3428306-9fae-4add-890e-ed7b82bea0b8@arm.com>
In-Reply-To: <a3428306-9fae-4add-890e-ed7b82bea0b8@arm.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-03-02T07:26:11.513Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB9923:EE_|TY3PR01MB11875:EE_
x-ms-office365-filtering-correlation-id: f2b1513b-a775-495a-4668-08de782cfb61
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|1580799027;
x-microsoft-antispam-message-info:
 L/V0UQsxZwQS0WNp9sA1CNRjQaDV84Dt21lB+NoGpSJQFrvxGWiHk2/6jt/Z3cpggS+DmNXb2hzqgG6zzOhnTcu8VxJ2kTSico98aGyzgvyPUIzjZ3eQeTPz3MigRG5UjCoXQHKqlE9i2RCM/+o+cixC9C95UVjFGfRlUFVCRqp1HilnjwYMjlMkQ0/8lf/1YbOgoIsG9/3L8/IIldHF/0Fm6SqQulPks2yqMEhT+O3nR/v14oaC1Ru4wxNSm7jx3soHWmypJE1FyiQkgzKRQ/xGKbAgV3ji3/tf05wFZSXjEjoOMhGq/XDEafQFrEExtb5FYVTgpiIZNS8Umivomipy3PTjfbkTZabULDnN2EUNOtEcQ376Rsp8zg0OuXNLN7t1G3N+6kzePHKlYQ2LYSRDFUAAvzXipD0XtZ2T/ScFI11x9gE18eIauVp0eNULn3PEiDdNzcxdywJYztpBUtadyNJUd7jL4ec3VCJR1OJgo0zREc3+2Q+PgdwEdSb7nDpRlMtGfrXN61IsD0ZpdtWkalXXB6vDsxdPkSIp9BdygtIeaZ6+7z7IZGyD+5pgVPmJFZNbmJbTCQ3xusYc44zw6nc9UL96u6Dt3oG4pY8NkWl+dLo9SaT60yK6hi8i3S2BG07cl06ShE6FwSPTWqZrpJC5smiUHnnwbUXNhoUHkh0Zc3nBp4tuKaIlmMOHQu2pajngB/X10/3CBOgtw3/wL+FBOLapfOCnxmb0bEu1rc0LpNsZJpJsmMbCRsI4sw0TJkmEhKix5AdTZ5YJEC0TFC2ZM0kF0vQ9t4iHR96EUKkpFtX67d45US+bU+Y4
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB9923.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?NHJscm5GNE1ERjBSUlB3M0o3RlRGMnZhd0dlL01yOWhuQjNLTE1RRU5n?=
 =?iso-2022-jp?B?c0J3dUt6SjRkQzBrdndVd2dvUE5HeFdEWUt5R2RZNkgrMUFpM2UzVjhE?=
 =?iso-2022-jp?B?UUdXTldwVTVIbFZsR3VLdklScVAxQ0Z2V2swYW4wSGtuWnJXUDQ1Vmx2?=
 =?iso-2022-jp?B?RjZ1Wk5YK2VTVFlidUl5eS9RNUxnb0xXbHlFUlpjNDcyWUxlaUkwMDZ3?=
 =?iso-2022-jp?B?UlQwYWJyQkI5cXkxaElsN2YvNTZOT2V6ZUFjUFRza1FNMVJ4L3pRYnlT?=
 =?iso-2022-jp?B?Mm9LdzZTdGgrTmtDNnkwckhoUndCUytlYlY5bDJyS1k5VHNQYzhmMHRO?=
 =?iso-2022-jp?B?ejhpbTFuUUU2Rkh1aVkrSkdMTjY4N2JsL0twcUtPWFFQTTBlQ2duSXBN?=
 =?iso-2022-jp?B?My9URzE2R0ExQlNjbEJYN2s5Rzk1YVJDZyt2cVNEbFBuYUIydjFKbG9Z?=
 =?iso-2022-jp?B?TE5uNHk1S2x3WkFqOVV1VnE2RDIyNjA1K0d3OG80Qzd5R0FwTHF5U1Bh?=
 =?iso-2022-jp?B?ZWw0MG9vcUJmNGdNZFN5dDlqSUt4T2c5Y0NoL3JydlRlbnN3OGlUVk9T?=
 =?iso-2022-jp?B?YS9iYkI0Nk1mUTd2M1VLa096anRVNFZ3d0Z6NlNYRkFpTVlGRDc5MlV6?=
 =?iso-2022-jp?B?MjhYQ2s0NEhJZG5xd3NlVy9ydkJNZ1I5US9sV3MwcVNuNTZHZFkxOGNu?=
 =?iso-2022-jp?B?dUhVbnFnenZkWmJwQmlwemptQmEyRlR6c05CT0xjLzNHeXZHT1A0T0N5?=
 =?iso-2022-jp?B?Z0s1ajIzM2FGZjdFL3VWRE95UWEwY0JQMExjZmJMdnIxWTg0YzlkUGls?=
 =?iso-2022-jp?B?V294OHpGV1RzMkJ2cUorcFpYbWpwd2psM3VGVWZjdXQ3cnVHTC96SkNU?=
 =?iso-2022-jp?B?bWhseGlnSmp0aDZKUVV5anl3emkvanZZWHRxZ1U4bmZxN3FWSnpsamVE?=
 =?iso-2022-jp?B?S0h6KzVsdjc3RDNraHZic2gzblBvMy9DUTBkM0dVUnFTMGdwQW9iUUQ5?=
 =?iso-2022-jp?B?ZnV3VHhBdFNDbU0vVkpUTUlsc1ErQjNzcUY2OE5Odm5VblNKV3YzOFps?=
 =?iso-2022-jp?B?dG5yeFpMaDNlc2JJUS9ldmI2UWdOaUZRTzE4NVBXUlZrVDNPNDdKdU01?=
 =?iso-2022-jp?B?bkpZZGVMZjBjVllNcytlS2FRTmZCRlp2cFROUkFJdVZneEdVdi9sOWlP?=
 =?iso-2022-jp?B?UU92WHFjS2tPUFRJQWpXNnV5Y0twZnRmOHRxUDFUYlpHRmE2b3k4SXY3?=
 =?iso-2022-jp?B?WVJSc21sUlFqb1FVZmpob3gwR2NhbHVEakZqeXBkRFY1enhoUDZRT2pI?=
 =?iso-2022-jp?B?NGU1MmRwY2JlWUFMQmszWitPVGpnSHE3M0liR1lLNXBKaWxGaEVDZU1C?=
 =?iso-2022-jp?B?TUJUd3kwU3I2amlEQjQ5L0o4TnlpRi9iTWY5UDRac3BJZ25yYlgwblhD?=
 =?iso-2022-jp?B?VGhvZDZUMWF1U0UzT3lJQ0ZCdnBMYURLcFZUVlR0WDdwTSt3Tjh3U3Q4?=
 =?iso-2022-jp?B?ZXp2R2h1SkM1MkNJUDFIdDcydk1SelIrdko1eGlGWkNzWEJPa3Y2Q1hN?=
 =?iso-2022-jp?B?MFpvcFZpeitKcEpTTGZFUXE4dFJweStmd25yajluZWhxa1cwK09EOERk?=
 =?iso-2022-jp?B?bzBZNnNsMUxIbzJHSEVHMEhZOE91b1E2UThGWlR0U2lFaytJbFN2NkxG?=
 =?iso-2022-jp?B?WEdmUmtibWhlZDBqZnZoaEVobFN2VkJ1M3loQys5eVQ2cTJTSDBEaVVK?=
 =?iso-2022-jp?B?aTlhSk5PZUVvUnhpbDBkbncreTBHV0EvQ1Nva0NnTFFlbng4ckRiQ1Zn?=
 =?iso-2022-jp?B?cFdXbEYvTkpBRG14ajRpT3BjSjNNZVBRTWF4ODcxUVMwVUwyNHFxMktP?=
 =?iso-2022-jp?B?MUYvUWkyNnVOZ2ozMm1OTFBEcG1IaGc0VUJ6RkEvRWNvRWp3L2JWTkRq?=
 =?iso-2022-jp?B?b3k3dHhlY0tZczVrZTlNWXdpbDh1NlE4bEEya0N1U2JUcTVjSjN1Z1B6?=
 =?iso-2022-jp?B?WGpMVzVVbi9BMENRelF0Wnl1cGt4MEhCWEdtcWFiMlhST0JPNXY0Sy9G?=
 =?iso-2022-jp?B?cnYvVFd2UnFxYktXTmlLN2FIUGpqamJrWHN2NFE2UlFKczdwQ2ZwYk02?=
 =?iso-2022-jp?B?RVE5a2pmeDR0aWVCQzhyNlFwaFZKZ2tDYkpna2tQbFlFa2phaC9VZUhG?=
 =?iso-2022-jp?B?a3pqVlNOdDZzNkVkajVxamxNU2dPdGFzNjlDOXFEMnl6U0x6R0NWSFNl?=
 =?iso-2022-jp?B?UlE4MnN2WUR6bytkWHBSOVdaY1Nud21COS9RSDFFampWTjNrVmk2SnNO?=
 =?iso-2022-jp?B?UUR1b3VWK28wS2lEd0FkQ0RtbFNaT25mcHpnTXJsZDZzVUoyaWdvRi9m?=
 =?iso-2022-jp?B?N3E4aTYxVHBMZzl4NVVvRHp2bmVicEJVZmc5d0JBQU90NGRxQmpBV0FQ?=
 =?iso-2022-jp?B?ajVoOWdNVDNOWTZmOGVFTUdmRkhHWXFHT0RmK09SRXg3VDhmWHJtNDN5?=
 =?iso-2022-jp?B?S21rMGlNUnptN2xUb1BYelZUa2ZNRVB3dDBCdz09?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB9923.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2b1513b-a775-495a-4668-08de782cfb61
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2026 07:26:12.4454
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s3mrHs8qn9+AqnMeK1imy6A4dLHs1dXSAMkOfsNjc0mo47zWRIHqswx2T3iw/aYCHuFvMfHCsbnvyvsGGE6mjNf6MSL8uMmtTCacispbUnk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11875

Hello Ben,=0A=
=0A=
Thank you for your reply. =0A=
 =0A=
I've made the fixes and re-run the tests on Grace, as you advised.=0A=
I appreciate your feedback.=0A=
=0A=
> This is only guaranteed to clean and invalidate to the point of=0A=
> coherence, PoC. On Grace I expect this is L3/slc and so the cache line=0A=
> there in L3/slc is likely not invalidated or pushed to DRAM.=0A=
> The dsb() for synchronization is missing for aarch64 in sb().=0A=
=0A=
I added dsb() for synchronization for aarch64 as shown below.=0A=
 =0A=
@@ -27,6 +30,8 @@ static void sb(void)=0A=
 #if defined(__i386) || defined(__x86_64)=0A=
        asm volatile("sfence\n\t"=0A=
                     : : : "memory");=0A=
+#elif defined(__aarch64__)=0A=
+       __asm__ __volatile__("dsb sy\n\t" ::: "memory");=0A=
 #endif=0A=
 }=0A=
 =0A=
> IIUC the L3 cache is in the nvidia interconnect and so changing the=0A=
> cache portion bitmap would correlate with events from the nvidia=0A=
> interconnect pmu. However, I don't think you are using events from the=0A=
> interconnect.=0A=
=0A=
I used the NVIDIA event  "nvidia_scf_pmu/scf_cache_refill/".=0A=
 =0A=
After the above fixes, the running results are as follows: =0A=
$ sudo ./resctrl_tests -t cat=0A=
TAP version 13=0A=
# Pass: Check kernel supports resctrl filesystem=0A=
# Pass: Check resctrl mountpoint "/sys/fs/resctrl" exists=0A=
# resctrl filesystem not mounted=0A=
1..3=0A=
# Starting L3_CAT test ...=0A=
# Mounting resctrl to "/sys/fs/resctrl"=0A=
# Cache size :119537664=0A=
# Writing benchmark parameters to resctrl FS=0A=
# Write schema "L3:1=3Dfc0" to resctrl FS=0A=
# Write schema "L3:1=3D3f" to resctrl FS=0A=
# Write schema "L3:1=3Dfe0" to resctrl FS=0A=
# Write schema "L3:1=3D1f" to resctrl FS=0A=
# Write schema "L3:1=3Dff0" to resctrl FS=0A=
# Write schema "L3:1=3Df" to resctrl FS=0A=
# Write schema "L3:1=3Dff8" to resctrl FS=0A=
# Write schema "L3:1=3D7" to resctrl FS=0A=
# Write schema "L3:1=3Dffc" to resctrl FS=0A=
# Write schema "L3:1=3D3" to resctrl FS=0A=
# Write schema "L3:1=3Dffe" to resctrl FS=0A=
# Write schema "L3:1=3D1" to resctrl FS=0A=
# Checking for pass/fail=0A=
# Number of bits: 6=0A=
# Average LLC val: 0=0A=
# Cache span (lines): 933888=0A=
# Number of bits: 5=0A=
# Average LLC val: 0=0A=
# Cache span (lines): 778240=0A=
# Number of bits: 4=0A=
# Average LLC val: 0=0A=
# Cache span (lines): 622592=0A=
# Number of bits: 3=0A=
# Average LLC val: 0=0A=
# Cache span (lines): 466944=0A=
# Number of bits: 2=0A=
# Average LLC val: 0=0A=
# Cache span (lines): 311296=0A=
# Number of bits: 1=0A=
# Average LLC val: 0=0A=
# Cache span (lines): 155648=0A=
ok 1 L3_CAT: test=0A=
=0A=
The result of the nvidia_scf_pmu/scf_cache_refill event is 0. =0A=
I have tried various changes to the perf_event_open() parameters, such as t=
ype, read_format, PID etc.. =0A=
Although non-zero results were obtained for some parameter combinations, th=
e expected results were not achieved in any scenario. =0A=
Are there any special specifications needed for the perf_event_open() param=
eters for Grace or Arm architecture?=0A=
=0A=
The perf_event_open() parameters used when collecting the above results are=
 as follows:=0A=
perf_event_open({type=3DPERF_TYPE_RAW, size=3D0x88 /* PERF_ATTR_SIZE_??? */=
, config=3D0xf1, sample_period=3D0, sample_type=3DPERF_SAMPLE_IDENTIFIER, r=
ead_format=3DPERF_FORMAT_GROUP, disabled=3D1, inherit=3D1, exclude_kernel=
=3D1, exclude_hv=3D1, precise_ip=3D0 /* arbitrary skid */, exclude_guest=3D=
1, exclude_callchain_kernel=3D1, ...}, 68508, 1, -1, PERF_FLAG_FD_CLOEXEC) =
=3D 3=0A=
Could you please give us your opinion?=0A=
 =0A=
Also, since this kselftest is for all Arm chips, we need an event common to=
 all chips.=0A=
Do you have any ideas on what event we should collect?=0A=
=0A=
Best regards,=0A=
Shaopeng TAN=0A=
