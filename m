Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazolkn19013078.outbound.protection.outlook.com [52.103.46.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A892C3AB5DC;
	Sat, 22 Aug 2026 08:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.46.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787385932; cv=fail; b=FaUAcDrKTvHFqrAXXnMKEWgjitxCbxdbssHkq6aCktXVhEJHqXIw0Wo+BMg+BO/CxGcs1V3W01hg6WpW2D6HqdIyxyMb8E449wVmY8k39KJ46kVyVyGMTobYvD2lpZPgI+5T1LRikyP4/9yQKYh7kUMYL3uI7pcTjArn7RAQHWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787385932; c=relaxed/simple;
	bh=gs6GRjiXvvaVEItm8EgmdrU5vI7a21QmybuLBdbzfJY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WUbX2fyfmuAVjAfQMFHAGTJJybb8BUTsB6A2WpiWgowVnYmq3iFosxRp8vMDjvekhvMhSUSbecHW3EA2HmkO0BUWHVzkrztqxq83kghwLMBqMovqDgnYghNGyYrp5bFo2bZqqcjr4URdUWE9LgKoOVgsy22KychjHSAHh9qHzuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=RZhF5FiG; arc=fail smtp.client-ip=52.103.46.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="RZhF5FiG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nrZeqFQXvXU1h1PjAvZWWif1S2jppnoM/2MiHAyuSvHtjilHPH/Uir12OtYltuRbGVKSZZgluSjSkOSfA/sl7VhGH+FSLu79i+ArelvEpROLYhSuNUweQk9bAlAeMX1MphrSWm4Y87/mos9r33vYft3GgMzarQZCbW2PuGRelIv/NVB0oJWeeFFsZa/QJTaHCLZRFabWMfAIIMUbuNo7asrT/tUMJ8tm9YaHLA9zNgKUYkiQbzSGY24V/Q/j3FB7Yhb5/1ueYOnJJ9m8YP/z3TmIqKGI+eLY7flUErrptxJQv2QeYhmwZGHTsbZe/tcKvVSgJjshKrTDs1tV2x2lRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JSm1sZqIGO5f/krH2QcL1P2XNvfQm+Y41U1Savy0BRw=;
 b=Tdn0sNJu07+WNgIT05fHGYeG1QKV2Jopbeu5Ipnx80Da72dJ8mad1neBoVQkE788C3XcPlsClJmRewRg36WnsTSFVvna3aCKY5zOPESnSMjBdrtzkQg/05KXXkMA1Lbq4CV497OgXAyZugsRNMlShX+IDb7o0OPOsB0w3RrP8cJE+kXzYUtcw/ttg4ZLNtacAqk1Up4bR2HU1I54Vq6zviigu73X5y8S2d2ASWBjixPjrnZ8eiNekeI2YgSqpJc1sM62WLk/yRmnE4GSRgZoTZYuUKZAE1/7LTLzK8Mylu+l1GyxRRsI7qZQate5ZghjMV3i1NL+14OgBkn7lKrfXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JSm1sZqIGO5f/krH2QcL1P2XNvfQm+Y41U1Savy0BRw=;
 b=RZhF5FiGR0fMJYGCZ1HxuBPcmR5edIItuzySWM6SQK8Q66IVTDisOfb/tNt0e7aG1Ga8/huekLlu4eiJMQE5jYaawO4CXVX+9sjNO9GnTMkJbQk6pZCeLqbRikR2F6tl/V9x0s0UdgQjl8EBWsaYhe53CVigvak2PfOuJeyXAA5OuTTWdjUvQ98IAbmLtjnt4XCCFHB+DvsA+B6neERG19v8LkV2LAxWoe9L5udzOyXF49QVAvRvHRV8jaxNt7+XXaO8l3KUXB1fAsC9sXwFGDM06aJIR+ButCBrHDbcg0qYlNDSNjvsl8Znz32ETR4KOQHwnjLFNPSz8KgHd2tLbg==
Received: from DB7PR10MB2249.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:46::29)
 by PAWPR10MB7717.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:360::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sat, 22 Aug
 2026 08:05:27 +0000
Received: from DB7PR10MB2249.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b098:308e:73ed:c664]) by DB7PR10MB2249.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b098:308e:73ed:c664%5]) with mapi id 15.21.0339.010; Sat, 22 Aug 2026
 08:05:27 +0000
From: Mohammad abukhader <mohammad.abukhader@hotmail.com>
To: "brendan.higgins@linux.dev" <brendan.higgins@linux.dev>,
	"david@davidgow.net" <david@davidgow.net>
CC: "raemoar63@gmail.com" <raemoar63@gmail.com>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"kunit-dev@googlegroups.com" <kunit-dev@googlegroups.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v3] kunit: tool: fix _list_tests filtering wrong variable when
 list has TAP prefix
Thread-Topic: [PATCH v3] kunit: tool: fix _list_tests filtering wrong variable
 when list has TAP prefix
Thread-Index: AQHdMgz+QCnOZ8oKyEaycTF9CmJcpg==
Date: Sat, 22 Aug 2026 08:05:27 +0000
Message-ID: <20260822080521.111595-1-mohammad.abukhader@hotmail.com>
References: <e1229319-0e28-4955-9adc-41a56f29c895@davidgow.net>
In-Reply-To: <e1229319-0e28-4955-9adc-41a56f29c895@davidgow.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR10MB2249:EE_|PAWPR10MB7717:EE_
x-ms-office365-filtering-correlation-id: 18be5408-1986-4f93-98b7-08df002420ab
x-microsoft-antispam:
 BCL:0;ARA:14566002|41001999006|8022599003|25010399006|38102599003|25031999004|31061999003|8060799015|8062599012|19110799012|24021099003|15080799012|440099028|3412199025|102099032|2607281247196008|3071699003;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?nFJzWHGQXoD/u9SE2a9ccAbcpqkuFTd4/tBIsTZ1cTfMXbG44gYpxyz0Fm?=
 =?iso-8859-1?Q?iN6IORJlP0g41iEG1j+OLHD0Av23Pli6D+fiYOiRZ1yrm592DlNBGXoJAg?=
 =?iso-8859-1?Q?kEzjT9cXhNp4rEI0fMi+t/OyXiU4B+LJBhBDptOVUdcBkXHrTCPuDdC5kv?=
 =?iso-8859-1?Q?p32CjNWAtYIk2YnY26ibcdQXS1vEldF/nosbcG2W6JFfI0MEsyC6aupSW8?=
 =?iso-8859-1?Q?Ma0+C8Pry4TJ4uFMOAt8CEyilYk+BCdFQpNa9c8G83+xnhtvZjAutZrqER?=
 =?iso-8859-1?Q?8g/PItZs39skNz3eegEpwSr8UEOlKSsu+wbK6JcCsTug5rdIygtmgsODb+?=
 =?iso-8859-1?Q?4oMUL2vwU1+R4VP5ue+v1FTgG84EXGHMII/TlIYyDvwMpt1XYwXL8JYl3V?=
 =?iso-8859-1?Q?ZWvwu6DR1GTQ4xlQZB1G030T5npkOb8dMgEDoxPEDiI71rEIydkG4zhpgA?=
 =?iso-8859-1?Q?jgOXVR/ltmW3kAy/TXBXUz1+aHgi4eYJEQtVxpWkR6nQ4Oqb/71yMWZs4f?=
 =?iso-8859-1?Q?+RnXAST3JCK7lU+3wRr0bqy1wF4DI3E+3i7q/d1ZgIT2yyAbDqsoMwuZ8L?=
 =?iso-8859-1?Q?/zOrpW1r9/9jDlZOZZ8E/E3OOcQoLFJspd9oceD0Posr53SHROlgiCnfMV?=
 =?iso-8859-1?Q?an5UsDTU9x8Kohi6453fFwEE0xwyfjIXhbmZpn4qtpZTXWcOuEA1mUy2f4?=
 =?iso-8859-1?Q?6LPFbyYRy5hCYCUIk2lN5rf+lRjf64c6ZpZ8XU+9kCPtZCOxs5yYtC6a7g?=
 =?iso-8859-1?Q?MuYmKLA55qv4oKlo8WvYBgJIfM+4YMh4yJIVCIkPgZJigx5ERgk8qe4Q66?=
 =?iso-8859-1?Q?ypGJ9HJrbgxTxkLhN6/Ytv/D7hwLLWK2EiVQSn12KWfCnK75yJqGZmVERv?=
 =?iso-8859-1?Q?QPt8tRR1S+YvCKUQIsJwTAY0Bntt0jWKwSJ0azFEw1Fmksto0w3OYEfhrW?=
 =?iso-8859-1?Q?Hz9v0AjkOJwi9GJ4NCeq6qhLnsqJS53D8LWfOabli30paVP9NoBusuwW+w?=
 =?iso-8859-1?Q?SKHz2QUq4pAW5bKjT6LE3POHlArWAA2lXlRfSozoNvEv6ktyQapmO5Sypo?=
 =?iso-8859-1?Q?mw=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?akrNMGn+OHWGAam0jqENFuUDmExn33b3Tq1sCtbeYr+5NQ5hjlYWvQYfL1?=
 =?iso-8859-1?Q?tTSHqwOlDMhUQ910x1ueXNALC7xeRC8/qJipkNTYSU78RaULjBmpD94W2i?=
 =?iso-8859-1?Q?hCG78MhzoRAh+D45Cs6aWrogC02oMSb41Ll9l6oFdHTRIMAhgdon3PRxSe?=
 =?iso-8859-1?Q?P9SWhb1HcpPQv+H4rBBgXiuEd28UOA4qdtVp+MchZ7bRNlVWNLa7a9U8kp?=
 =?iso-8859-1?Q?XHw08xEb5WRwSTvMn6uiGE/F136eoPxi29vgPuh66/3bsin2E+h6PzGnPB?=
 =?iso-8859-1?Q?cuRAMZxM4TPzfYMIj389dpdTiBzpMDz7X8lmUA5PRPOvmKOyOFmbU63jIB?=
 =?iso-8859-1?Q?59peAAiCsof1JYRCBrcgl0x/yvetFJKIc2YsLIpLjM/HsAEATPKYCXiPVj?=
 =?iso-8859-1?Q?tNf7LNYszG0K2k1L4lVMF4zFHkY4LKHe8S1LWAde4xadAH/yY3cXcY4d+i?=
 =?iso-8859-1?Q?AswBFDJl04ZCYukL173LKBhJjNJbEmjoTf20tcGV9SC3XyNaWbtsQRne4C?=
 =?iso-8859-1?Q?bYQOkceAplZIbuD4SI7RF6Wl+U05kIzv8Bd9RspDz+e0aoOw8YL3G4p08l?=
 =?iso-8859-1?Q?kSOt+6n0cb7mPudaD5Vb3uFA1JiMiYErP+nGnGO3f1DiZVC0py/uANZsvz?=
 =?iso-8859-1?Q?c56eocM0VlajvcNicqCedx/9IU4+JvWZNN6ZJq0UxbU1ol1eZx94FUCJ1I?=
 =?iso-8859-1?Q?hX8uaPWN2LRW2YX7X+qLs+OuRP8MhLEFb9oozw2RzF4appekc+UVPqnOBv?=
 =?iso-8859-1?Q?vYEJjxT/QI7OJYq0qQwPXSm5yrfN479j1Q/RUrwceoY10bgfzeAa56MdKB?=
 =?iso-8859-1?Q?eDQwD6rYd8QLbWbAvH/M1FPU1NBnCyIHKFi1qqZOavly0fDJs+z1ezTnCE?=
 =?iso-8859-1?Q?VeT5zlnmTQ4/BakT4oZcRJzlznXZSinZ9F1l7Cecg2X7LS0SkWrYoYQxH2?=
 =?iso-8859-1?Q?Z1uUML2l3SFJ2mk5Fe0NZ1yhugRGb9e1dwxwS53dkWn5YGF7TLtp5EFqXp?=
 =?iso-8859-1?Q?1Mou/1+7q10LrKdk5ZxSXd5kNCRVvqDC1KVS3sNlIHP6XNZ1h32h6/gTQA?=
 =?iso-8859-1?Q?KUc0Pw9V+3Tsy/QUUGDPYtyBSIDsAhrY0JKZJAYQkMGcQJ4JKcO3SclKjo?=
 =?iso-8859-1?Q?KNbhD1Cly1T3VlyuV2MSSVvKv3r44dXKe+Xgq2LDiLs+FqxAcqQurWJKVq?=
 =?iso-8859-1?Q?S9k5Otd47LA/MMOgltTxmd/FemX/qUpG7vhHV8Ej9nEJ/wWF+w7jfscGik?=
 =?iso-8859-1?Q?EcyRZs8AW7ge9WRkBmmaO4xUI14trdozJ5pAv+xcR1e7YqpfCI59SMjqb3?=
 =?iso-8859-1?Q?BcN9chiVzoSB9kNy0wzYunf0aGh+7UWftbt5TlihcOKiMVY6skl9vElxmA?=
 =?iso-8859-1?Q?RTeLPFEstvpRPej84w/ZHKz035+dwQI7MFvYgMolbB39QfI6lrqSsj90zQ?=
 =?iso-8859-1?Q?DtRscSFjKZWlvEHMRojB0PYQrVpAcyR+Bz7QJQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-d3deb.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR10MB2249.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 18be5408-1986-4f93-98b7-08df002420ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2026 08:05:27.6321
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7717

From: Mohammad Abu-Khader <mohammad.abukhader@hotmail.com>=0A=
=0A=
`_list_tests()` runs the kernel to list tests, strips printk timestamp=0A=
lines via `extract_tap_lines()`, then drops the dummy TAP header from=0A=
the cleaned `lines`.  However the subsequent regex filter mistakenly=0A=
operates on the original `output` instead of the cleaned `lines`.  When=0A=
the kernel output includes timestamp prefixes (common with UML or slower=0A=
setups), e.g.:=0A=
=0A=
  [    0.100000] suite.test1=0A=
  [    0.100000] suite.test2=0A=
=0A=
the anchored regex `^[^\s.]+\.[^\s.]+$` rejects them and `--list_tests`=0A=
returns an empty list.=0A=
=0A=
Filter `lines` instead of `output`, matching the behavior of the=0A=
adjacent `_list_tests_attr()` which already returns the cleaned list.=0A=
=0A=
Add a regression test with timestamp-prefixed input to verify the fix.=0A=
=0A=
Fixes: 723c8258c8fe ("kunit: tool: Add command line interface to filter and=
 report attributes")=0A=
Reviewed-by: David Gow <david@davidgow.net>=0A=
Signed-off-by: Mohammad Abu-Khader <mohammad.abukhader@hotmail.com>=0A=
---=0A=
 tools/testing/kunit/kunit.py           |  2 +-=0A=
 tools/testing/kunit/kunit_tool_test.py | 12 ++++++++++++=0A=
 2 files changed, 13 insertions(+), 1 deletion(-)=0A=
=0A=
diff --git a/tools/testing/kunit/kunit.py b/tools/testing/kunit/kunit.py=0A=
index ac3f7159e67f..91d234ac3b57 100755=0A=
--- a/tools/testing/kunit/kunit.py=0A=
+++ b/tools/testing/kunit/kunit.py=0A=
@@ -126,7 +126,7 @@ def _list_tests(linux: kunit_kernel.LinuxSourceTree, re=
quest: KunitExecRequest)=0A=
 	lines.pop()=0A=
 =0A=
 	# Filter out any extraneous non-test output that might have gotten mixed =
in.=0A=
-	return [l for l in output if re.match(r'^[^\s.]+\.[^\s.]+$', l)]=0A=
+	return [l for l in lines if re.match(r'^[^\s.]+\.[^\s.]+$', l)]=0A=
 =0A=
 def _list_tests_attr(linux: kunit_kernel.LinuxSourceTree, request: KunitEx=
ecRequest) -> Iterable[str]:=0A=
 	args =3D ['kunit.action=3Dlist_attr']=0A=
diff --git a/tools/testing/kunit/kunit_tool_test.py b/tools/testing/kunit/k=
unit_tool_test.py=0A=
index da88c3a1651d..85ae21754bdf 100755=0A=
--- a/tools/testing/kunit/kunit_tool_test.py=0A=
+++ b/tools/testing/kunit/kunit_tool_test.py=0A=
@@ -979,6 +979,18 @@ class KUnitMainTest(unittest.TestCase):=0A=
 		self.linux_source_mock.run_kernel.assert_called_once_with(=0A=
 			args=3D['kunit.action=3Dlist'], build_dir=3D'.kunit', filter_glob=3D'su=
ite*', filter=3D'', filter_action=3DNone, timeout=3D300)=0A=
 =0A=
+	def test_list_tests_with_prefix(self):=0A=
+		want =3D ['suite.test1', 'suite.test2', 'suite2.test1']=0A=
+		self.linux_source_mock.run_kernel.return_value =3D [=0A=
+			'[    0.100000] TAP version 14',=0A=
+			'[    0.200000] suite.test1',=0A=
+			'[    0.200000] suite.test2',=0A=
+			'[    0.300000] suite2.test1']=0A=
+=0A=
+		got =3D kunit._list_tests(self.linux_source_mock,=0A=
+				     kunit.KunitExecRequest(None, None, None, False, False, '.kunit', =
300, 'suite*', '', None, None, 'suite', False, False, False))=0A=
+		self.assertEqual(got, want)=0A=
+=0A=
 	@mock.patch.object(kunit, '_list_tests')=0A=
 	def test_run_isolated_by_suite(self, mock_tests):=0A=
 		mock_tests.return_value =3D ['suite.test1', 'suite.test2', 'suite2.test1=
']=0A=
-- =0A=
2.55.0=0A=
=0A=
