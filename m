Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.10.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794318814;
	b=a362unbxMNLtfB417BiWXmLmM1aiz2CGKMtcJJWE9DpO3uPjmBZ6hggJ5bjfCLDGoH3g
	 7epVfu/GPZ2Nwxxo3gptk6nkpzy7L7ntH9uQpPSZM1jkT5cfgmSouO2ImIyoK8D6+Mcz6
	 y6prrXH15ss6wqI00Ss4zLQkJGkgLwq23Zc4GwZcFH8voNuMdHXjMi+ER6mlMNpisIvQC
	 WhIdrDSPaXxFH4/agH/1d4IPRPG/qeWsj4pABqcI3Xu7Vj/br7+6tOWVD4sWLHBk77NUL
	 qf7yNrcMWf7D9a38GZAARnWnBA49SWMtQnAn95FBXlNLjhgp1Pjn7peoclfGHijW3vQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318814;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-CrossTenant-rms-persistedconsumerorg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ROawDgIsZuj09CmxgITfWhQtZ737OqBj0FNBYbqmbO0=;
	b=Sezv4V7Iq1RMKhg0pYkAsjKTIkKvDvc3Pg37kCSE8KkllMlTK0KquNMe3Y+6wJJpBYJg
	 KqkNo7PdE16S5PmR4W7GJ2HhaeHjLdkTvNDC0QjjZ566dY/lBsX9qPNR/Vgnru9q9g2F5
	 m46eIKjtLK7JtOUO4FLyGDS2CGU9zH9EEzCNR9L7qQTPynsgJfYyg0ihtF3Vz2yfmKgcP
	 FqfcvJ7gf6c5Zti8Hzv3UuVNGJkysXFM5jMAZfzF054TJP6ZUCDHw37EQ1np7IXgaqF4X
	 ryZKsBfkY0aPXAezDvLKlGZOGzkT/ujbaoBBJmAIGQAKPxRs7bp5qLnfA4zTG77jK7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=tqlqr6Ns;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.10.23
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azolkn19012023.outbound.protection.outlook.com [52.103.10.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1503C606A321;
	Tue, 10 Nov 2026 13:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1503C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=tqlqr6Ns
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i0WYc3VwVgKYrjuuL+pJ050ifeKVNFFZLO8Hjy2M2z/XBvz/xkPLPQK+FFZWikvlVJwPjteDqqOYlwIxd+9a2DXA2l349+J6eoaSEp5uRKt42AQa03Iv1kCsntSJcnyME6OqFmG/4Modi9R3acHu5IrPmK+rTbtFEBodiHjVdi3XkpfcHvfc4sxXNyMra6HT/E2xFIzQ2v4TCWkyn3/zqV3YSwOrw1njP+qgMQ7VZJLXQL+SAyDaqJl3QjPXsUnqPjl8E2wMW3P1+Wb45Xs/hJM+TjtXd3Cf0sEWwBvNyhH8lcT7LTpfMH6k0Abgg0DVbI7I117kRZyZMUPBI0toAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ROawDgIsZuj09CmxgITfWhQtZ737OqBj0FNBYbqmbO0=;
 b=Lzo3iaUaFy/pwdPexECN7hpxiRCwC07Pbl2mmcucnrHuoFNevwIUuwW1nx36blTzn529Z8m7V1ZNH0/eP6bwl6PolzmNm4cU0Dyo3HoYOO47PRF8s9Pvs9epX0jjcIEo5Ev7qnbNxx3aexlPuZM63Ii4JPLPsnjTYCihRCJKPBsQ1wzThe2K2Sb290PIno7I5jQrp5vSXEPkXYk1TmmmL9XCNE9Gd8nbIFnUKOuIJgE6AyvcTP+yUsRN5XaTI3BlRCf3IUWwUhIg0jfGShP2BWIggUFWTJ6X1UpFg/MA3iACGYMZ5Rpx3xyw2rSDva4K7Vl/53gZfcqHbj+9FyTH6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ROawDgIsZuj09CmxgITfWhQtZ737OqBj0FNBYbqmbO0=;
 b=tqlqr6NscOb9AHvC/xcmkagfXimztwPq8abQf6Z0M+G3203kT+N5JhyE4QGkbnXFSX5QYPDGqHryZ3Y+uSbmvE8wVXWueFns7wbPvvAZFCy8CF2Wd0HqNOKR9iIDqvFwuLNKeg3UeenQlsvE1pPD0RyxxCEqRlB8vCQeF4rvjCPhEJ8DM0N4mJJoChcMyc5bnO9By9iHcTBX3y9Uwc2/o5B2kGfidE8nQUm/lJL0uTEyu6CTogzqgwjl+HH6v8ohfk57RHYaLTbfxLcSqv9Yik1g0N4CqfflXoyZAyDSvcEPM8buydq6GvUxQSBfwutzv2PBJuNLSLqYiEutpYooRg==
Received: from SA3PR11MB7435.namprd11.prod.outlook.com (2603:10b6:806:305::6)
 by CH0PR11MB5313.namprd11.prod.outlook.com (2603:10b6:610:bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 13:53:32 +0000
Received: from SA3PR11MB7435.namprd11.prod.outlook.com
 ([fe80::3585:3aa0:2453:837f]) by SA3PR11MB7435.namprd11.prod.outlook.com
 ([fe80::3585:3aa0:2453:837f%6]) with mapi id 15.21.0592.010; Tue, 10 Nov 2026
 13:53:32 +0000
From: zhou xu <Aurel1501@outlook.com>
To: Shuah Khan <shuah@kernel.org>
CC: "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] selftests/ptrace: Fix error handling in peeksiginfo test
Thread-Topic: [PATCH] selftests/ptrace: Fix error handling in peeksiginfo test
Thread-Index: AQHdcRrfY3gtImYIp0eMigFGKptXUQ==
Date: Tue, 10 Nov 2026 13:53:32 +0000
Message-ID:
 <SA3PR11MB74354D963936E8B70B80F3DBB6722@SA3PR11MB7435.namprd11.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB7435:EE_|CH0PR11MB5313:EE_
x-ms-office365-filtering-correlation-id: bd92ea14-5d4d-4a6a-60cd-08df3f3201df
x-microsoft-antispam:
 BCL:0;ARA:14566002|31061999003|2604031031799003|12121999013|25010399006|4140399003|20031999006|38102599003|36102599003|39105399006|15080799012|5062599005|19110799012|8060799015|8062599012|41001999006|40105399003|30101999006|102099032|440099028|3412199025|26104999009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?zmNnORanJdBCj0O1SIsGDqf3VdEJjifnKGa4hnecmUOYbflQtPgeuLpApMD1?=
 =?us-ascii?Q?L6RadEpbC/uVM+wxP9veKuEReULnW5t7+qkdB2XTuLId4PbfXIlZ/2tSGWxw?=
 =?us-ascii?Q?XRi72Iblz/GBCZavjfnm8JBryTtxfPyZcoKj+YuvRpwar0jY/1BUC5nWCnxx?=
 =?us-ascii?Q?37T6HNPiJraXyvzQdxUmq5qzwXp+fqryWjb92ZV1KYE38VcUqG/xvBNjoEqu?=
 =?us-ascii?Q?NOG5VXfKsBcdN04f1uvfE1WJbIaO0svyr5ZwhLXXJbGR6fE0f1LcHNlfmx4L?=
 =?us-ascii?Q?PcmkzJi2+sz3guevDKopu9+wG/t6eKJlxL35j1Jc6nU4+J7XrkTOCEk0Qstd?=
 =?us-ascii?Q?MArrH/IYrq8T922HRw2D2AG+F8/JNVbIlHcLIw6ib81Y+dEwDq/E4Ypkg8eg?=
 =?us-ascii?Q?E3UYw29qqwkRb3I/gsu/RjNoCMh2mvygsjcMFt1rzQnExgfZ/jARQVpJ66LF?=
 =?us-ascii?Q?7D4g840BYyQgPaqHL7czAukcZOYFJ3eArBpyep58ZhMlk5z8pHuyQhV0n3Pb?=
 =?us-ascii?Q?6bmhra4r+mzy/ujjJBiVpvEbVWAj8ADZdCvsB44t3ly7AezhgxiuLV8pZFZd?=
 =?us-ascii?Q?Ae11jHCp3C0aywixzt251658yv9XR3prj09Z1BQy8GByab2CbBYIoEjAG/vy?=
 =?us-ascii?Q?Pg7RxgPUDfnz4Bx2F6ST7yWCoELGogzgvFJMG78fUwqDsMBhXoop5JZuL+Hx?=
 =?us-ascii?Q?aBGCw2WRfL8ICcYjA7T8yR8BDIAeXOuOH/U4TbPBicL8FPnk62FV5/HZvdYd?=
 =?us-ascii?Q?Xj+gCR/Xrj+aUrBtmxftCc+YQQCpVK1ntxEpPxXuZCoop5UwYVt4p3BXdOYU?=
 =?us-ascii?Q?i/bcvyqEKUDMtxPXWe3wCTwPsfm31cqcSQxwIi7jNWWGqD6NjIilvaFL6+Ib?=
 =?us-ascii?Q?o0WmkWHPcGZaW2Hy0MXf/wzz3oVoYxBNQ2WQqmtVMVuRcrw5fFIDkQAndBD/?=
 =?us-ascii?Q?Nr1Q1+4xYYVPv0PzCRU7R1lCUCRJG2dQbZnHbc535Q5DqrM11dih7M8UAeF2?=
 =?us-ascii?Q?/M0wLJ+DPVVBYVFyvzzqh+AK0jnJ1O+gBqdcVMLl6aMJcwW0/P02fqLmfjfP?=
 =?us-ascii?Q?5jhfhrCj1Zfg10NAvLmxIOIpNf6XTn81teUTyCxoe2qIw9A1sWkZveDrG8gP?=
 =?us-ascii?Q?1SpCCp+MtdDeMScvy5NSCPzYlEMWw7fUIb3TQ8UZSzMr8xYubGCgu7M=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ibWwzLd3B6GMK2h7z8tkR1FBnMkVxlUJLoc2uBmytbFqyTS3estN/Y9V0aNX?=
 =?us-ascii?Q?GHBoGxT6BzjdjLkMELMfaUaKo1v4COD41YASOh9SUtdaW0DZX2C6Z4DcCNNX?=
 =?us-ascii?Q?8qcnqqyEdQNgaB24KagUKxtB1C6vkV/mepCT1MTPANYabI7+CFGHXKLmIQ2W?=
 =?us-ascii?Q?xxPKj5F7bnCBpXRancj3vNqvlZaCe8j3ZnJ5sQtOMjvBOV9ajRCk7ghJ0pyt?=
 =?us-ascii?Q?xVFM2qBoWsAXwUthscWSG4A9EiS6xA7xsHwm16SuoG7GFfrU6QTqH9CAurpK?=
 =?us-ascii?Q?5kBv5GWs8307eKUVN1JQCOlKaSC/SYM5VNFeqEWYltt62Yi6D+ResF5AXADL?=
 =?us-ascii?Q?Nhngh3L0Xce94R77+yMv+df+8tiniGRdKNcDnh4ZH1ae9ehH1dTh5ISjumeu?=
 =?us-ascii?Q?Uy7k7B1d7OfemNj1LvHg1MQI70JV5Rme+ab5UmJqnqDMw3z3/UWWJC9lr0FG?=
 =?us-ascii?Q?1pvWXQKC9CJRjp6DBvxhi5Dne54yBGYs4ONe0U+2HO3og8zYYABWWnBGZMVR?=
 =?us-ascii?Q?kqLC0icFjpHscSVEGpC7ynEnZ+iU5zWrBRCVx0nYqnIeLASPEbT91wTv6Lye?=
 =?us-ascii?Q?AZWNDkK8HqUXTeYoOQi5PbFmTLOSdGHU1l22SvcyBQqjApxmk2aHF2UZzd3T?=
 =?us-ascii?Q?Edjga9n1xQCdO7C+wh7lq8pdR3VbH7i+e9Ga1lbws2fKnmO0pNub8/Zuf/Lx?=
 =?us-ascii?Q?B39qS+NaJ7EG2OPSBMonjR5qZPHP1b9D5zjjqC/LuIrStavH6CJOWaG1mX3F?=
 =?us-ascii?Q?IyjyP3VbvgobyG42GIGB7N8Y85qHE27Fl94AV2ZAA4L60z9XM2ymNjThgnhT?=
 =?us-ascii?Q?3n+ga/tC7bVl99dQa4BEsI355img9noI8B/LGljr/QKG9pCXwK4DT27ezYjg?=
 =?us-ascii?Q?grjLNBQgkkC6cvjN9C572BJZSdUh9Owrp74GxeADJqFWD5jOFzkCdkJplLyu?=
 =?us-ascii?Q?YzgElv6ayT9DMZpQfvZXm86vLAbkyFkcEcS9BevveRvcrSpxqLJbaNIgnASp?=
 =?us-ascii?Q?9b832MwohsBdUwnm8VHX83070G1nxheaeAuOXLMY90n9npuXFANC3gSNOikI?=
 =?us-ascii?Q?0OVy9Bnpb2brgO40NjHb2DW3YRl4PD9t4vTz3BTtryyU4NBIdN+YCs7zmY1V?=
 =?us-ascii?Q?HYCJ7rKUe2GRMt71Pbi0lMTZvDXiKSAwX9Ngw+NQ2O1BXiMHBTzhmuWafoJm?=
 =?us-ascii?Q?wpFpapaHi1mMllTucPNTP/6qrGmxMlEPupujrYaQdVj/dzSKCkpUbm8Ymapm?=
 =?us-ascii?Q?AMhRnR7xVZ2pdXlHzzTt6GFWYyBrSB5iOdcxDttoh9lJUi4+YdlCfYMOBk03?=
 =?us-ascii?Q?PuxwgJC0FK0eq1Ts0ggUo4TZpRBm1nAPmOUKW/lnDIXD8vbCJ7OYakYKa5IM?=
 =?us-ascii?Q?nB18ORaHaOWcwVhBOErEHF6uZKLe?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7435.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: bd92ea14-5d4d-4a6a-60cd-08df3f3201df
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2026 13:53:32.1648
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5313

From: Zkingom <15024777017@163.com>=0A=
=0A=
check_error_paths() expects PTRACE_PEEKSIGINFO to return -1 with errno=0A=
set to EFAULT when the output buffer is read-only. The current condition=0A=
uses &&, so it only reports a failure when both expectations are violated.=
=0A=
It accepts -1 with the wrong errno, as well as an unexpected return value=
=0A=
when errno is EFAULT.=0A=
=0A=
Use || so that either mismatch causes the test to fail.=0A=
=0A=
Verified all four return-value/errno combinations with syscall fault=0A=
injection into check_error_paths(). peeksiginfo also passes on x86_64=0A=
WSL2 (6.6.87.2). The full ptrace suite has the same two failures before=0A=
and after this change: set_syscall_info returns EIO and vmaccess.attach=0A=
times out.=0A=
=0A=
The requester supplied the suspect condition, proposed replacement and=0A=
required return-value/errno cases. OpenAI Codex assisted with the history=
=0A=
and code checks, applying this one-operator change, drafting the changelog,=
=0A=
and preparing and running the temporary fault-injection and selftest=0A=
checks.=0A=
=0A=
Fixes: 17afab1de422 ("selftest: add a test case for PTRACE_PEEKSIGINFO")=0A=
Signed-off-by: Zkingom <15024777017@163.com>=0A=
---=0A=
 tools/testing/selftests/ptrace/peeksiginfo.c | 2 +-=0A=
 1 file changed, 1 insertion(+), 1 deletion(-)=0A=
=0A=
diff --git a/tools/testing/selftests/ptrace/peeksiginfo.c b/tools/testing/s=
elftests/ptrace/peeksiginfo.c=0A=
index 2f345d11..46fed27f 100644=0A=
--- a/tools/testing/selftests/ptrace/peeksiginfo.c=0A=
+++ b/tools/testing/selftests/ptrace/peeksiginfo.c=0A=
@@ -89,7 +89,7 @@ static int check_error_paths(pid_t child)=0A=
 =0A=
 	/* Read-only buffer */=0A=
 	ret =3D sys_ptrace(PTRACE_PEEKSIGINFO, child, &arg, addr_ro);=0A=
-	if (ret !=3D -1 && errno !=3D EFAULT) {=0A=
+	if (ret !=3D -1 || errno !=3D EFAULT) {=0A=
 		err("sys_ptrace() returns %d (expected -1),"=0A=
 				" errno %d (expected %d): %m\n",=0A=
 				ret, errno, EFAULT);=0A=
=0A=
base-commit: f66469d9905b39d2c260a15d7d6db450f4db67c1=0A=
-- =0A=
2.53.0.windows.1=0A=
=0A=
