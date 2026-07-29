Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazolkn19013073.outbound.protection.outlook.com [52.103.35.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD73A4119FC;
	Wed, 29 Jul 2026 16:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.35.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785341992; cv=fail; b=XCFD7z+tpM6xtjLZVJFBd0NSpNyeNWEDJ4y+j26KE3xyAXGhqGdcx6jWjO4EWAoGqZ4WY2frQkeS+URmkCoe4VvGIcKjm0TjiHMhpjBlBjb6uLTC0gB4RZBWB3nuArObrKZbLftdASKcA0cguYEmIWOQf3DZJ8RLUsqt2tp2Tz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785341992; c=relaxed/simple;
	bh=ERm1mN75E5q4HP20F9BgQE7AwPdK6pqYd9lOHLGhR8U=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Pr3M96Vo65i4SkjT96lqfdQqGDqRcFtDhe5p+gsK6+ch7ZLDCV/6Z8MMU7It55Ua+uTCa5B7LfScW9DKn1G2NyWfa7Q/56P7fPzLLw43MUz6TKnnnATwVmqqccfD1Hp4E/+o1ePPIfTvNc5Q8SA9SDCb/N4SUKu4ky16iD2Y/Bg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=cizQ004B; arc=fail smtp.client-ip=52.103.35.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="cizQ004B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FhxOlgXXYSbhB3/TZK3tSFBXsTVBE+iXcaCy98LI3xu10GEUc80g+OskmJwc0VEwsrtoULUnwGZ2ZfrQpJ1BsNxAm9Wa5jxdmCObRdUEvEbDCRFvoYqIiL3Rs8AWkCx++aBsvxV2O+iMX3Un4gNz0UQceKKad08DTmlVv3PKyZgej6UBwEmo3ziqxcmDe+hiXJsY7l+VrehXpHGhiv0kzDJvQhAyEfDcnBUo8bjJISbjG2Zso/5bOtWBNyliK7oQuFK7OzesdpCdOUM94/EV384bV+i8FvSS84r9trYwhjB302W7tuAHVqb0r8MGjYqkXzQggFIPYcZQaoqRyco4Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRaO948ptd/K92rOrGdWoBQVqFjUkdatCE0f3psTt84=;
 b=QT3ibsBSFcPJ0vM4Go+CynDI1jSoaleSoJWBs2FtCxL6MYVpOUNWlnYOKoEeYcKGA+nkWijindnscdBZ/LLVqQKmqSR2rAZB8MJlniQcE96uShPLTg8NJxJXv1CGKiMyR0yBryiz5JZVs3yeCR1Os02FaWPer8/ZzDwBO3Kc4mGLujiFbPTvEPt4ahEZbw6FFNhX4A56OsvLM+fIm6apJorRt/9RYsfLvgFqULPrYhUSkTP96ymEnCsqYttUyKufiSHxNN5JqV0yCBnCZx8midsrptLDCiINvqLAmlirJe48uFYf7QN2QjUfW8IdIimrMN8a4PuDGC4kIg8vCOQNCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRaO948ptd/K92rOrGdWoBQVqFjUkdatCE0f3psTt84=;
 b=cizQ004BxdlEU0SO3pUm3/ZTHgBDiWKIx6cmZFNqPO+Y7nfjwGgFfH0v1maLuuQJFX8NTFa7P3moBuYhrpT3+DUDZ1IT/pn1XobpDjEbha1TfJSbF/SpuYk9UrYPXvj4lI4jFuZ5pmfJDhrZBynaT+/TzzpWQ0JQ7ZZGG2ujEoEloSGXXtvh8KO6d5Jhx7VufVri9bEw1Tpd3HLH3pK+16cqGLui89q7Pg26qvdXc8Qx5C+yA2+rJiNh2TOY3yGvfjzjD1+Nio5vxoGdz/GDl7gBiQ6S0eagmKVlL5rmzwHGKVnhNR1ltklmalnrKPXEVPpaqhDbbICFutUHTaN4jA==
Received: from DB7PR10MB2249.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:46::29)
 by GV2PR10MB6405.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:bb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 16:19:46 +0000
Received: from DB7PR10MB2249.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b098:308e:73ed:c664]) by DB7PR10MB2249.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b098:308e:73ed:c664%6]) with mapi id 15.21.0245.012; Wed, 29 Jul 2026
 16:19:45 +0000
From: mohammad.abukhader@hotmail.com
To: brendan.higgins@linux.dev,
	david@davidgow.net
Cc: raemoar63@gmail.com,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kunit: tool: fix _list_tests filtering wrong variable when list has TAP prefix
Date: Wed, 29 Jul 2026 20:19:02 +0400
Message-ID:
 <DB7PR10MB2249CF29AB83F5BFBEC0801988CA2@DB7PR10MB2249.EURPRD10.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DX0P273CA0017.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:5b::8) To DB7PR10MB2249.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:46::29)
X-Microsoft-Original-Message-ID:
 <20260729161902.59654-1-mohammad.abukhader@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR10MB2249:EE_|GV2PR10MB6405:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fe19549-7ec0-4748-acf9-08deed8d3420
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799012|41001999006|20031999006|24021099003|15080799012|8060799015|23021999003|39105399006|4140399003|5072599009|25010399006|5062599005|25031999004|24071999003|40105399003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IvdWKKMXc1spsfo0eHtG3ZrwyLD96hWklAWbcRrvq9iO3Wt+X0cHnxkdDARB?=
 =?us-ascii?Q?Ahj6ZvZQWVZ4ERt8qWT1c+VY47m/YhnWWgSmOhWlYSvBZRxI2F9Pfp+cfFWs?=
 =?us-ascii?Q?sW71jhyn0CvKaCLIrAv+pMFvog2Flt/3rLAoGgJWWNUroDiYy4/Tf8ZppOp7?=
 =?us-ascii?Q?+LF+2R89WW2JfsJxYtmPmL4waKqEcnnpJIPj7BVvt+oTfhkgymb+TNE5JSy5?=
 =?us-ascii?Q?vmT91glalGIzAPglx1WYRymJWKON3Hk4umZdC2NJnSi/Nsu5C3oQH0hBggHO?=
 =?us-ascii?Q?S8DthqGpLYtTvUpILWrGmoYtDf9+vgoYO/1imBFWJ84fw924McJT35fFKV4y?=
 =?us-ascii?Q?0tP699hItenQ2D0/YQxxTvNNEfe38FerbavIEr90/pdVR+MduEZH0yFqxBQi?=
 =?us-ascii?Q?XBfO5/6/WV5Wc43DEGzAp7xxmdCywbvrbShzp8zgHSJ3TZ1XIKzAmlf97bVp?=
 =?us-ascii?Q?2912mhbr8io8IfSk35BcFq/8HQv7xdvNOJgyQjkQ9qeSsNfSg+cMrK8kBizb?=
 =?us-ascii?Q?4ankf2ItcyUTWUYEBb+w7FYDZ5UHAcb4+zIya+vKrJTHZMF63w0lVEdcpMyB?=
 =?us-ascii?Q?UH8lUkuRv0wjximRE1TA0r8W3lDfU0N0pgt5baH5MjNwIdFdKwNGCDu1jppb?=
 =?us-ascii?Q?8hAtNPSU3vE3J5jkAq5XTfOR9/S7oTySdUD0QwvUWQs/i2Xe93SKH6dHS5sv?=
 =?us-ascii?Q?e/xahvizViTIf00tViNd+4iSUVri2UOPz8fwbNKKwLCX0ArnDibwl+HvkIdN?=
 =?us-ascii?Q?ygTrP0i4buXAnojjNcg/NG2N/p3VbJkz8G1Cv07/Fgq9OtuSdQb7eZ0JQJBX?=
 =?us-ascii?Q?VDp2NY8VmyS6LijNsUJKqUQzwIC/GarD+4HTOz4F6Ahv6oe6erNwIGxRaFZR?=
 =?us-ascii?Q?1cCYbMpcezi3yST5nAcSj78GlmbYDDzkzL3+Ta2PpHEAFmMceOkisXuUNd/u?=
 =?us-ascii?Q?14y5we0Cce7yW0D94PLZurVRf+/04RZehXLO2dluSvIHP9CC4CSZsNkvHdTA?=
 =?us-ascii?Q?zfMmxf9VkzFCBL/v8OR7QkTbNHhOBwckqhmNaFygZRhmTrZ5XPfnEbt2pTmI?=
 =?us-ascii?Q?qGh1kZPYnB7ETqWrL6/omAI4QQECXPRh2u0cbz1DGxEk6pLyg1A=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?flMZZXsh/gZ2VuFFMR+oqutOhnhyxSRAS8XuHpW5tQ3mVya0gtwZQjbNgypa?=
 =?us-ascii?Q?9Mhk6OojaKz+sOPsI3I70w7ISbqzJaQUpVkx+Gzq+5tK4eK2XSHfdffHEIIQ?=
 =?us-ascii?Q?oU7rnZNNYR962zQJXY9dJNEJsYR8HbDEO2ZELTY9oyklYDkl0i4Hi4sKbWAL?=
 =?us-ascii?Q?oba1hlwpPAPMwFUtVTx+NkhYBMkYOOtZB2Qh19jstj5hp7PXNuI+FvUiAPKQ?=
 =?us-ascii?Q?ne7/hNrmak5T1RS/yEOBkrvgvkeu7gYVIy2x6j0InpQIfZnHawop5CrHSmk4?=
 =?us-ascii?Q?228KkkyuH2ZlO45CgOyxbFOLTa5weUmOd75ZKEjVi544JY4kTO8aBHur3asi?=
 =?us-ascii?Q?lc3ZxD23jk7WkDBsvLb08wiuaURjvsAMncLXSTVFGVSmFmrsSsupvcO4j9Sl?=
 =?us-ascii?Q?j8BehyWf4EyAeX4XgiM/8xmzLI/u6Pk8UCsXm3STRLUgumm+jzj4TV6/tEiR?=
 =?us-ascii?Q?f+SKYRqKvRF1gRywjGNrUtbkg4ueVqk7Q80GiSsWD2RH8PeOJjwLVmEiS0ml?=
 =?us-ascii?Q?u5OPiFbREdr1ji5HR59ysqlZpYPWyrTRKwH0/pVXahi31z4qXom3h9wZRq0l?=
 =?us-ascii?Q?a59ixYfQEoG8EnZxN/zFgGtg869NizVKNP21kcbrj5jWSS7tSfz4akZd4Bh3?=
 =?us-ascii?Q?IOkQV9dLoD49lHOFNvHxN3W0lYNhTVUbgCIiaVbgE7ffhblpFv+1Po+ttPFM?=
 =?us-ascii?Q?OcO/kyYVpuH5iMGGAGWSPZyXYsCOq2rIV9rl/7icD/T+BT31UL2+g2USUZbC?=
 =?us-ascii?Q?qYbb/XHZuEc6iBtLeqxmnh0wC4Nijmui9p5gSjF7cq81Ra9bwBhVzM4UWDau?=
 =?us-ascii?Q?pS/MKagifZ0tMD2RkXzlWfAb+8xy+exCTQGuhDnx4mH/Ga3DkRhZTmVqML59?=
 =?us-ascii?Q?GU3pZ+6HkHO8VP8CCl3nFRtPhOHdHsxfWd1ZyStgZFKjCmoXalzgZfLuYvjl?=
 =?us-ascii?Q?cHX/yc2x7wA9IPP698FhpBjhaP7ryI0wujeNPCC4baMuasZqi+qrXn7Ge3aH?=
 =?us-ascii?Q?7hgsNVUZY2zaI8d2TNpEDVONaR6dwsta6a/t/JNN1FnsOa4iqLEA5oUXQjEK?=
 =?us-ascii?Q?L3JjRiqGhOjRxwIvIqoU9nxu+EgaitsDf6U0e7uX/UbKL21ZlVfwoUJbBriv?=
 =?us-ascii?Q?7Pjlobf0W4fKV+AjClQXzE9zpFpICsOcXdWpN//v0anXtylx1Z+yIC1+u0hK?=
 =?us-ascii?Q?rERpy6aCpujS9yfhk76ekA02MqXvqcfV9UnzawUmGDkQS77+sFsC4er4lNWx?=
 =?us-ascii?Q?FWbmBXfBj9egksTc060Km0Y6ffj7Ni/D+Z3U+nabzJxrt8g+6ceqh5zT/m5x?=
 =?us-ascii?Q?ferrHs2v4kXKi8HBTMjdT+yhsn50koSeJmGYKQl/dLlGpAQPtcGXHGzcI1rw?=
 =?us-ascii?Q?fTf+3xDZKBQXw69ErbYkR84IEBZlTW+kLtw0e2WVW0eVkSFcVw=3D=3D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-d3deb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fe19549-7ec0-4748-acf9-08deed8d3420
X-MS-Exchange-CrossTenant-AuthSource: DB7PR10MB2249.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 16:19:45.8272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6405

From: Mohammad Abu-Khader <mohammad.abukhader@hotmail.com>

`_list_tests()` runs the kernel to list tests, strips printk timestamp
lines via `extract_tap_lines()`, then drops the dummy TAP header from
the cleaned `lines`.  However the subsequent regex filter mistakenly
operates on the original `output` instead of the cleaned `lines`.  When
the kernel output includes timestamp prefixes (common with UML or slower
setups), e.g.:

  [    0.100000] suite.test1
  [    0.100000] suite.test2

the anchored regex `^[^\s.]+\.[^\s.]+$` rejects them and `--list_tests`
returns an empty list.

Filter `lines` instead of `output`, matching the behavior of the
adjacent `_list_tests_attr()` which already returns the cleaned list.

Add a regression test with timestamp-prefixed input to verify the fix.

Fixes: 723c8258c8fe ("kunit: tool: Add command line interface to filter and report attributes")
---
 tools/testing/kunit/kunit.py           |  2 +-
 tools/testing/kunit/kunit_tool_test.py | 12 ++++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/tools/testing/kunit/kunit.py b/tools/testing/kunit/kunit.py
index ac3f7159e67f..91d234ac3b57 100755
--- a/tools/testing/kunit/kunit.py
+++ b/tools/testing/kunit/kunit.py
@@ -126,7 +126,7 @@ def _list_tests(linux: kunit_kernel.LinuxSourceTree, request: KunitExecRequest)
 	lines.pop()
 
 	# Filter out any extraneous non-test output that might have gotten mixed in.
-	return [l for l in output if re.match(r'^[^\s.]+\.[^\s.]+$', l)]
+	return [l for l in lines if re.match(r'^[^\s.]+\.[^\s.]+$', l)]
 
 def _list_tests_attr(linux: kunit_kernel.LinuxSourceTree, request: KunitExecRequest) -> Iterable[str]:
 	args = ['kunit.action=list_attr']
diff --git a/tools/testing/kunit/kunit_tool_test.py b/tools/testing/kunit/kunit_tool_test.py
index da88c3a1651d..85ae21754bdf 100755
--- a/tools/testing/kunit/kunit_tool_test.py
+++ b/tools/testing/kunit/kunit_tool_test.py
@@ -979,6 +979,18 @@ class KUnitMainTest(unittest.TestCase):
 		self.linux_source_mock.run_kernel.assert_called_once_with(
 			args=['kunit.action=list'], build_dir='.kunit', filter_glob='suite*', filter='', filter_action=None, timeout=300)
 
+	def test_list_tests_with_prefix(self):
+		want = ['suite.test1', 'suite.test2', 'suite2.test1']
+		self.linux_source_mock.run_kernel.return_value = [
+			'[    0.100000] TAP version 14',
+			'[    0.200000] suite.test1',
+			'[    0.200000] suite.test2',
+			'[    0.300000] suite2.test1']
+
+		got = kunit._list_tests(self.linux_source_mock,
+				     kunit.KunitExecRequest(None, None, None, False, False, '.kunit', 300, 'suite*', '', None, None, 'suite', False, False, False))
+		self.assertEqual(got, want)
+
 	@mock.patch.object(kunit, '_list_tests')
 	def test_run_isolated_by_suite(self, mock_tests):
 		mock_tests.return_value = ['suite.test1', 'suite.test2', 'suite2.test1']
-- 
2.55.0

