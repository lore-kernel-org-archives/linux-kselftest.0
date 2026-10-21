Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792610818;
	b=mZF6805Hmrjh8cRH2QCLKMhVIU8T43HhtQ+Rg4e9a865yO5eehSoh00TFd5fr1WR/+gc
	 NeTRnq7tw4bJCHYyDBeIHuDg4kMzeeurRiFCFnYKYqOieUA7Y0kIVSFOfkspp22eeK7vr
	 YcZFnPF9Bm1mDhnXbiXM7w1mNxJ+TyFPSEh99IFgQutgZUMLDu15Pp+/2hNd+WVfNJlW5
	 JIPORyUuinOXQD5cEfUy/KKjkgaTBDKJGPGG0B4mIx16tLndvnUyoCLRURzD0O2C0lv/6
	 mXZ+mDkQupOp3RTCtYazvzTwqvSGM83yurUzIwYbR/TaqlMbgaWUMVTknQCtLahA3uw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792610818;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:user-agent:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=G9vn9N03m81sjeGjwXRSyw4fQqV+8R2nlHiVamJRZJQ=;
	b=spHddt8OYlUwkFcXsZ/nIgOSPQfzxBbC+L2UqJAmLNQ7mjH6Dis3B49MFOo0k8vaDBR8
	 zAtNliuZI+8PkH2GhfyX9r8nkkJItydGVMJHUqrl8Wj7po9GH2i5x9JZsHG5PvZP9SibV
	 OIU2J2ZVFwQ1JLE9K1h4MRUkHozUiLwXehqqRWubG/Civ2h0lR/qC9IMGXgb1Mt1+WQaA
	 vY/21XwswofIIQ5AndsJV7K3Fn8bCraxwIK7RL78fDJIDuJOuyA7jfX5/oI4aAxbNXo8T
	 zBb88SeNfCtZWu7xU1Oen5Ivi5ACDIbrLxIfUkc408RPsBToQ67EnY+F+/zhCOcLLug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nKlxm2RH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0F3606A319;
	Wed, 21 Oct 2026 19:26:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F0F3606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nKlxm2RH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792610817; x=1824146817;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=G9vn9N03m81sjeGjwXRSyw4fQqV+8R2nlHiVamJRZJQ=;
  b=nKlxm2RHhHOyhGcE3nf3MAaDNgkfyrh6dJzGP9vfjjDYM5cqsUUjLoGf
   6LkcnGGT8/E7V/pXAOR00A2XdG29gDAPpBraX3213PyXxzAJP4L9Pv+lJ
   ZNHftnt5ihpr9EPzaSeGBzwTf/3oo/IfXiPcwW+aLb3RTWk/Ux1UjPpGz
   VFDG8QCB4eM/Y0aigOZPGaeRh/NhnSDMuAaieVKj5GTWrlq1gQ8KY4uFB
   NBw//GKVdeags7Cxxhf1Gfwge2V+Em4O5EdAwf+dgPglv2g3WSZYfc+Nz
   a3jlnvMs4LygqOvAOum1vRNul9NRaysmyN3LyvlQTDNgPhZOUu+NPmYkr
   g==;
X-CSE-ConnectionGUID: 2sYbqrH6RZ2iBMtFOZYD4Q==
X-CSE-MsgGUID: urlF1thoQy2/C4tJAiYNRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1249655"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1249655"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 12:26:56 -0700
X-CSE-ConnectionGUID: mYFhUfVRRruuL8cKFr0XIQ==
X-CSE-MsgGUID: ZP2SqSoTSH2jZwYvicMtCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3227300"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 12:26:55 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 12:26:54 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 12:26:54 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.19) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 12:26:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vMhFTF18CxiIqpDFTH9HhvB5mkFnv5Ub38SNHqutY0n7C4K8sYJEzKPtnVtzFScMM2bF5Gz1KQsWWOvLJ+iuLs0h0tU5JEeSebUeCt0065YaHV7wX8SUaHgdo3kpqIbJrzSkMOGgaNCYw5j79KF0v+zy0octwGvqqBY2TMr3JcCYPzwPdBtGXNO+iG0gwnoWc82YY2TC7IBSxFkxm38oydjlgQ9YlFWnlLSaMBAy3dqafTR8K6I0PsskYe3G7qQGKhxKUkZOUxAJ/pxskb3Lt6NyrzEI/R9NAUO4c1iSbxlZ7kB31xlxnIl3AqyzXAZPwqi63iVBFmfx7JZM9JihiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G9vn9N03m81sjeGjwXRSyw4fQqV+8R2nlHiVamJRZJQ=;
 b=ZhE4YJDFEA0sxVDfxG9YgBkWLh8aX5mCCIArTi6HKbWiaVk/wH878itNmHdYyA0snHyUH3Rzg8txwl0XJqIdIIscmRSlnbqbgzGfrRdAbQT76PufmZMO2o9vb/cLwdnKN3z8vuFIN8XV6XCw8ofSl+0sPyHqn3U1iuoywtFelh61P6tX1wC9ufRbnuJ2qHV2HKiYTBVYrLI5I3VX29ufGSHCl/6R/pt9gnKAz/nk8diOhqUZD5BdYJADa0FllnPbw7ChZsIz5eILQ+xUgVQB02DEmPXK9iTChYPhHWxX7WVYtzvV4p55qv4+Asi6R6pUtkmaMTCXvTLPKsVNZSP/Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 (2603:10b6:208:549::23) by DM6PR11MB4532.namprd11.prod.outlook.com
 (2603:10b6:5:2aa::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 19:26:46 +0000
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57]) by IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57%5]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 19:26:46 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "x86@kernel.org" <x86@kernel.org>, "ivanrwcm25@gmail.com"
	<ivanrwcm25@gmail.com>, "tglx@kernel.org" <tglx@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
CC: "brauner@kernel.org" <brauner@kernel.org>, "sammiee5311@gmail.com"
	<sammiee5311@gmail.com>, "lirongqing@baidu.com" <lirongqing@baidu.com>,
	"hpa@zytor.com" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "shuah@kernel.org" <shuah@kernel.org>,
	"Mehta, Sohil" <sohil.mehta@intel.com>, "nik.borisov@suse.com"
	<nik.borisov@suse.com>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH 1/2] x86/shstk: free shadow stack when copy_thread() fails
Thread-Topic: [PATCH 1/2] x86/shstk: free shadow stack when copy_thread()
 fails
Thread-Index: AQHdXE1i0FXDEKL+mUaEUBa/H845BLcIa5yA
Date: Wed, 21 Oct 2026 19:26:46 +0000
Message-ID: <948b6b86c6b00199fc7c36779d131ac75d92db63.camel@intel.com>
References: <20261015023147.519257-1-ivanrwcm25@gmail.com>
	 <20261015023147.519257-2-ivanrwcm25@gmail.com>
In-Reply-To: <20261015023147.519257-2-ivanrwcm25@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB634048:EE_|DM6PR11MB4532:EE_
x-ms-office365-filtering-correlation-id: 9ba145ba-9e67-42b7-8bd9-08df2fa93f10
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|18002099003|10067099003|261021121427099003|22082099003|4143699003|11063799006|261009223027099003|5023799004|56012099006|38070700021;
x-microsoft-antispam-message-info: IAFZ0FvaNLUL/YAbRraEBhmYbkA7ZAtuHR4TFtzxvOd3i18/ByEOLsgf2KZZq1zHnvgG+CbO4MFsBlLNVEFrVfPzSPY9DmZHNogUv0c1HjxKGh5f/MkV8XoNHFt13PAn1wO9Oq4iIjQYYH5vO/sHKG+Vi6tFZv6iwi8KNhJw9qT8SVV+VLQAOlljUYTbFn4sMhxJhmhRBwXJjmRdwZlwIV1WqjLj6mETnM1YnWEQmJcoeVPOx9+2yZ8kbWbXEGL3YZfDmSVeqrDsjxrO+d2H49dHdQI07ooHjrDTK7mcyx1KaKlzA45FLV8BHV+zV1qyvQ4q6Vy8k0EtpBqlKjM6pmzpfFwv3lwVWJ2jOQ16W82e5pLKJ4THGosUJ4L3XngGFN305aSueeHhmo3LOj+4loRVvnFgLR8A8tO+zLCkcS8/DAQIs0TmJmO9aB38zkSOfGQT0fjrr73+Hg/MCK9UWcDZTEIbGG9SjuTHMOIjXzmbZj1/lgdN8nY6VECOwgERqi88lTWIvMSNC6X/g6zYfWrgnaiJhQtSNSgMasohz40RW+zC3BG95P0zXVM3FXqQayh2SnYfofH30nxpqQrEvhlBPZCuckx6YeuPm0pT11tCvCUDhPqUb6nRaZ6IB+qNNRYcLdnfL8X2shxO/BxekUXNNbIZD8pFn4EHMPQwf3HZQdElfqgtr3MXGPVaqGtl+JYqhYmLQoOGSHpzYGN9vS0Fa0f7KAyOnzqfQVR3c8E=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB634048.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(18002099003)(10067099003)(261021121427099003)(22082099003)(4143699003)(11063799006)(261009223027099003)(5023799004)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dEs5QmsyVUw4bWpVWlB6NkhsNm9pc1ZkSzFnRE03b0JYbE1pdHcxa3hxOWR2?=
 =?utf-8?B?Z1hMZnBaL1F1Nk1xSkUrTXhHeEhQaWZmbVgvNU1TL3oyRnUzRzBPSDMxNEtE?=
 =?utf-8?B?TXlISnhGRVM0MnN2VmRuTkxBK3lNak9tUDVlSFVIYkh0dll2SzkvMm5UQnRt?=
 =?utf-8?B?Tnd5L04wSit4NHdGdm1JeEZBMnYzM25GeUR3czVuMVF4aWxuRmlzUCtwL3FE?=
 =?utf-8?B?TERJWHJVS2IwT0R3ZEl5TTFrZGlydGkrQkljOVNsZUR4ZUpkbURQbGNrSXlD?=
 =?utf-8?B?ekpvczZZMm9HMit0WGlxRXJsQ25LTk9kN0RZNDdlalpaUjRMZGNVMXczSnpF?=
 =?utf-8?B?K3djcDNXUkVyVkJSb3hYQnF2QTVFaUtRWlE4bEkzNzhPUGw1QmhpeXptZmlq?=
 =?utf-8?B?WkRBTXB2OWwwRkxDM25zeWJHRjJmNVBERDU1aWtUQ3JsKy9FZm1Xem1HVzRO?=
 =?utf-8?B?MThmQzkzV0k4RjlCcEdtVWpSK1E1Z3dONC9SU2djOEwwUUlMandiL0JzVERa?=
 =?utf-8?B?dUhnQmlzVDJOS1JWMXB3Ny9rUXlsTW0yUzVCTkNQT1hrU3R6RzVkVjlhTS9Y?=
 =?utf-8?B?V044ZDdtMmNFcG12a1VQUWFIT1NFdnBPZ0tqYVBjRUg0QVp4eDV2N0pGOFZC?=
 =?utf-8?B?cnI2NU5Pb3N4cHlrTHVRejRnSG9UNEtwSDR0WUZta1l0QXFCZ3NGM0FPOHJz?=
 =?utf-8?B?YUhrMWlkNG5ndHVaUFo5T281aUV2Q0tkcG1NRlJvUkhpc2tDbDBpY2gzc0M0?=
 =?utf-8?B?bW52RXRDL0FuVmRMY3Q1NW1Tdm4vZ1V1V29RcXlMVUdHeUhZZVRVdTNrc1Jv?=
 =?utf-8?B?djdmNGp6cGt4Z2tpa2V1dlA0dXNKREVmcG9nU3BORDBib0paREQvU0pLdjFE?=
 =?utf-8?B?TEZyV1dMellvekVqSS9tVlI5bTNPZ1pYNnpMS3Z0VTd1ekoraERFa2E1Vksr?=
 =?utf-8?B?cmR4T29sM2tiQkp5cGJOS3NXUG4zMzRTa2JMQUNEdjhXWnNSMEhsbFpCNS84?=
 =?utf-8?B?azRDYVUxR0NBbTRIZUo0T0VOLzZSc0wxWlVuTE5ZSmxMMUNMN3RzOUdMVUJE?=
 =?utf-8?B?NWU1bjdlWVplbWFjcWQvSm5vNHhIaWxmczdqQ1A3NUd6aDNhNmw0bUJsaFdx?=
 =?utf-8?B?Tk92NVhxektlUHpTWDlpZ2NZTWs5cCsvWGtIVzN6bjdTelhpekhxWXBrTjFQ?=
 =?utf-8?B?dDhZNHkxcVhPUjBsanV4WnBmM1VqeDRNSm5IVTFMTUROVTMyZGxJNFVLdExo?=
 =?utf-8?B?dzFyMjFXSUp3WFIyeTNEcHVpOXVVYjl5T0RmWk5SOWFZVE9JZXhVbjNIUUlE?=
 =?utf-8?B?eU95S1ZhQkx3YXZ3VHhUM0xwNzF6ekJKSlFXQlcyK0xzTWJ1elJtSmhudTNX?=
 =?utf-8?B?TU5qY3hGVXVReC9uUUprYXk2NktTQm14SFQ1eWlQcjRyOSszV2pFVStxdy9J?=
 =?utf-8?B?L2hjWGxDempiMGw1ZUs2ZHVEOWd1ZjBZTGIwZmlWUXp3Tnp6bzhsbHVKOW9i?=
 =?utf-8?B?VjJPbmMvNURSV3FFeUoxMmxaZ29SSEdvSVY1ZmZFRG9IdVExZDlFUDdKYlFN?=
 =?utf-8?B?ek04ckh4R1huRVJ5MGQvWUlrRW5GUThUYVpsbzNWaTdNNWRMSkJJa0ZTVGVC?=
 =?utf-8?B?VE1BUmtLUWRLaGlZQnlpV1ExUkRTdVM3SStTVis2dkliTG4zWmdMWFFYMi9z?=
 =?utf-8?B?TkxLU2tRQWJhTFk1cDFWck5XclpmYm40ZFppUnN0K1ZNZFNtanBLMzIxR2hy?=
 =?utf-8?B?ZHZaZ2UyWW53S3M0VDlNeXF6Q2Jsbmp5bmJGZmlKUmlWTEtsamJicXlaMFh6?=
 =?utf-8?B?ZnZhY2tNSVhqNHRiOFhQb3VPT0tWZGxWYVAwdTFSK3AyYXhPb2FaSFltaGp6?=
 =?utf-8?B?N3BLQTQrZGZFZGhDblNYNkFqUGlxemxFWnQvTE1FaW5ObUlUaXJLdG4wcEFI?=
 =?utf-8?B?NWwvb0lSVS9Zb3YzcW5yWEVDM2JjRXdvcitmUE5MblI5OC94M3NtZnZoRHRX?=
 =?utf-8?B?RU1NcWVKRmJJa1JRVUwxOVFjTTREK0JtMFgrbnppclI0MHVTWmN5K1RXc1Nv?=
 =?utf-8?B?N2s1c0M5UW9rSExEZHczM1JOcDJtZG04WUNnQjJsbVU4SmpEL1V5S3hoZzVs?=
 =?utf-8?B?RU1jK3pwUnlNM1FuNGswZXpQUi9rWG9pWVNuMUtSaEJwWFgxSVhieHFtNmsx?=
 =?utf-8?B?aEozUks5eitkYTZ5YUxoVUlEL2VMeHRWWnFSMjJRUkFqdjRiTHhiYlc4bXcx?=
 =?utf-8?B?M3JPWm0rYjljUTIvYkxhdXZlRXRtQ2lnclJFUzRIRk1OZDFuYW5BKzZpMHlL?=
 =?utf-8?B?NEY2cHNlSFlqRkdPRkRSWk5HTlV5Smx5WEJVMmxEWU9iTTY5NnFmbkVBQXhm?=
 =?utf-8?Q?HVhXeJnDc2303HOA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <436AB8C42FAF85429115FE7554AE1675@namprd11.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: 3Bqsn/OGMcsWYOPuPJi74Gsd6w3QXlwXtBGBElX8b+tPnA01do7xB0P/lgL5CgHvdWLeHE0Nep9dosg6naxQNJMqtaddYDzhDHd586pvVpzeWIv0J1ya6TcLDF6YFQS38bT66vsWrjl51e7Q3wtNtFBF9T0qRnI0fwWfGFxa7EpqKUoZm9Te6JvEvfYVo466aB0VegixUuu5iYwFjRKB9s3Ir7LjaXzETzMq+tAjSmkiavG3ToCrJbz1JbB6/RhWBhsZI5+D+kFYosYqUrtz3CJP9RSIT9l6fr7t/qJbB9SDiAnHU+IDcYNpm0Ar4o1cEP+/f+7mwPbepz/OsQeq/Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB634048.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ba145ba-9e67-42b7-8bd9-08df2fa93f10
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2026 19:26:46.3888
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DQs0X4HTRX/go3iH0Hq5Bn364x93rGygB+ljyAsWFFT0JEL4bynA2tIY40MgBnJPsOxAdeHxgTOzbcF2suctgV6RSCUQRbNKbqhcXlW/DDI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4532
X-OriginatorOrg: intel.com

QnkgaW5zcGVjdGlvbiB0aGUgYnVnIGxvb2tzIHJlYWwgdG8gbWUuDQoNCk9uIFdlZCwgMjAyNi0x
MC0xNCBhdCAyMzozMSAtMDMwMCwgSXbDoW4gRXplcXVpZWwgUm9kcmlndWV6IHdyb3RlOg0KPiBk
aWZmIC0tZ2l0IGEvYXJjaC94ODYva2VybmVsL3Byb2Nlc3MuYyBiL2FyY2gveDg2L2tlcm5lbC9w
cm9jZXNzLmMNCj4gaW5kZXggMzQ2YzQzOGFjODgwLi5iZTg0MDY1MmQwNTUgMTAwNjQ0DQo+IC0t
LSBhL2FyY2gveDg2L2tlcm5lbC9wcm9jZXNzLmMNCj4gKysrIGIvYXJjaC94ODYva2VybmVsL3By
b2Nlc3MuYw0KPiBAQCAtMjY1LDExICsyNjUsMTkgQEAgaW50IGNvcHlfdGhyZWFkKHN0cnVjdCB0
YXNrX3N0cnVjdCAqcCwgY29uc3Qgc3RydWN0IGtlcm5lbF9jbG9uZV9hcmdzICphcmdzKQ0KPiDC
oAkvKiBTZXQgYSBuZXcgVExTIGZvciB0aGUgY2hpbGQgdGhyZWFkPyAqLw0KPiDCoAlpZiAoY2xv
bmVfZmxhZ3MgJiBDTE9ORV9TRVRUTFMpDQo+IMKgCQlyZXQgPSBzZXRfbmV3X3RscyhwLCB0bHMp
Ow0KPiArCWlmIChyZXQpIHsNCg0KSGF2aW5nIHRoZSBlcnJvciBjaGVjayBoYXBwZW4gZXZlbiBp
ZiAhQ0xPTkVfU0VUVExTIG1ha2VzIGl0IG5vdCBjbGVhciB0aGF0IHRoaXMNCmNvbmRpdGlvbiBj
b3VsZCBvbmx5IGhhcHBlbiB0aGF0IHdheS4gSSdkIG1heWJlIG5lc3QgdGhlIGNoZWNrIGluc2lk
ZSwgbGlrZSBpcw0KZG9uZSBpbiBzZXZlcmFsIGNhc2VzIGluIGluIGNvcHlfcHJvY2VzcygpLiBM
aWtlICh1bnRlc3RlZCk6DQoNCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rZXJuZWwvcHJvY2Vzcy5j
IGIvYXJjaC94ODYva2VybmVsL3Byb2Nlc3MuYw0KaW5kZXggMzQ2YzQzOGFjODgwMS4uZTQwZjgz
YTAyZmRiMSAxMDA2NDQNCi0tLSBhL2FyY2gveDg2L2tlcm5lbC9wcm9jZXNzLmMNCisrKyBiL2Fy
Y2gveDg2L2tlcm5lbC9wcm9jZXNzLmMNCkBAIC0xNzYsNyArMTc2LDcgQEAgaW50IGNvcHlfdGhy
ZWFkKHN0cnVjdCB0YXNrX3N0cnVjdCAqcCwgY29uc3Qgc3RydWN0DQprZXJuZWxfY2xvbmVfYXJn
cyAqYXJncykNCiAgICAgICAgc3RydWN0IGZvcmtfZnJhbWUgKmZvcmtfZnJhbWU7DQogICAgICAg
IHN0cnVjdCBwdF9yZWdzICpjaGlsZHJlZ3M7DQogICAgICAgIHVuc2lnbmVkIGxvbmcgbmV3X3Nz
cDsNCi0gICAgICAgaW50IHJldCA9IDA7DQorICAgICAgIGludCByZXQ7DQogDQogICAgICAgIGNo
aWxkcmVncyA9IHRhc2tfcHRfcmVncyhwKTsNCiAgICAgICAgZm9ya19mcmFtZSA9IGNvbnRhaW5l
cl9vZihjaGlsZHJlZ3MsIHN0cnVjdCBmb3JrX2ZyYW1lLCByZWdzKTsNCkBAIC0yNjMsMTMgKzI2
MywxOSBAQCBpbnQgY29weV90aHJlYWQoc3RydWN0IHRhc2tfc3RydWN0ICpwLCBjb25zdCBzdHJ1
Y3QNCmtlcm5lbF9jbG9uZV9hcmdzICphcmdzKQ0KICAgICAgICB9DQogDQogICAgICAgIC8qIFNl
dCBhIG5ldyBUTFMgZm9yIHRoZSBjaGlsZCB0aHJlYWQ/ICovDQotICAgICAgIGlmIChjbG9uZV9m
bGFncyAmIENMT05FX1NFVFRMUykNCisgICAgICAgaWYgKGNsb25lX2ZsYWdzICYgQ0xPTkVfU0VU
VExTKSB7DQogICAgICAgICAgICAgICAgcmV0ID0gc2V0X25ld190bHMocCwgdGxzKTsNCisgICAg
ICAgICAgICAgICBpZiAocmV0KQ0KKyAgICAgICAgICAgICAgICAgICAgICAgZ290byBzaHN0a19m
cmVlOw0KKyAgICAgICB9DQogDQotICAgICAgIGlmICghcmV0ICYmIHVubGlrZWx5KHRlc3RfdHNr
X3RocmVhZF9mbGFnKGN1cnJlbnQsIFRJRl9JT19CSVRNQVApKSkNCisgICAgICAgaWYgKHVubGlr
ZWx5KHRlc3RfdHNrX3RocmVhZF9mbGFnKGN1cnJlbnQsIFRJRl9JT19CSVRNQVApKSkNCiAgICAg
ICAgICAgICAgICBpb19iaXRtYXBfc2hhcmUocCk7DQogDQogICAgICAgIHJldHVybiByZXQ7DQor
c2hzdGtfZnJlZToNCisgICAgICAgc2hzdGtfZnJlZShwKTsNCisgICAgICAgcmV0dXJuIHJldDsN
CiB9DQogDQogc3RhdGljIHZvaWQgcGtydV9mbHVzaF90aHJlYWQodm9pZCkNCg0KDQoNCj4gKwkJ
LyoNCj4gKwkJICogY29weV9wcm9jZXNzKCkgc2tpcHMgZXhpdF90aHJlYWQoKSB3aGVuIGNvcHlf
dGhyZWFkKCkNCj4gKwkJICogZmFpbHMuIEZyZWUgdGhlIHNoYWRvdyBzdGFjayBtYXBwZWQgYmVm
b3JlIHRoaXMgZXJyb3IuDQo+ICsJCSAqLw0KDQpJJ20gbm90IGluIGZhdm9yIG9mIHRoaXMgY29t
bWVudC4gSXQgaXMgZGVzY3JpYmluZyBiZWhhdmlvciBmYXIgYXdheS4gQW5kIHRoZQ0KaWRlYSB0
aGF0IHlvdSBjbGVhbnVwIHdoYXQgeW91IGFsbG9jYXRlZCBpbiBvbiBhIGxhdGVyIGVycm9yIGNv
bmRpdGlvbiBpcyBhDQpwcmV0dHkgY29tbW9uIHBhdHRlcm4uIEkgdHJpZWQgdG8gd3JpdGUgc29t
ZXRoaW5nIGFuZCBub3RoaW5nIHNlZW1zIG5vbi1vYnZpb3VzLg0KTWF5YmUganVzdCBkcm9wIGl0
Lg0KDQo+ICsJCXNoc3RrX2ZyZWUocCk7DQo+ICsJCXJldHVybiByZXQ7DQo+ICsJfQ0KPiDCoA0K
PiAtCWlmICghcmV0ICYmIHVubGlrZWx5KHRlc3RfdHNrX3RocmVhZF9mbGFnKGN1cnJlbnQsIFRJ
Rl9JT19CSVRNQVApKSkNCj4gKwlpZiAodW5saWtlbHkodGVzdF90c2tfdGhyZWFkX2ZsYWcoY3Vy
cmVudCwgVElGX0lPX0JJVE1BUCkpKQ0KPiDCoAkJaW9fYml0bWFwX3NoYXJlKHApOw0KPiDCoA0K
PiAtCXJldHVybiByZXQ7DQo+ICsJcmV0dXJuIDA7DQo+IMKgfQ0KDQoNCg==
