Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023125.outbound.protection.outlook.com [52.101.72.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B732F12AC;
	Fri, 31 Jul 2026 13:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785505978; cv=fail; b=tLZiQ9pegf8bNhQCo5BkZRCSIMmbs0uEaUALp7iKFtXQoUYU7Fiuf9VTNpR2pXBJhHOfpd56i+qElH2HrkBW2CtEAgoQMu7rkRZ2WjK7gg57Jz51h53h6edrvHMHtK9D8gmajfjy6LpSckyDAkRpPu7LhuWRrK+98lDv1yvh6e4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785505978; c=relaxed/simple;
	bh=dUgQEW1KomhUEVjrey6dzjGl5v+0MPTlQ6N/+70SVY4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ftkvcpKjFGEGKREzZSOqz7LVTAMJz7qN3mxugNNQKDYzfM1yNVbHwPIvh79FZnU8NkNMLiHR0LP4raviwpBpzjQOb4wEdk5S7OWLyV9UbaeOd7rNtobjch0UtDrxWOBOtgks/kG46ubQfDK3c3+1rjgHbtJ2kDdz2kwLREBrV3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=codasip.com; spf=pass smtp.mailfrom=codasip.com; dkim=pass (2048-bit key) header.d=codasip.com header.i=@codasip.com header.b=zrXVhvQE; arc=fail smtp.client-ip=52.101.72.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=codasip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codasip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codasip.com header.i=@codasip.com header.b="zrXVhvQE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G8XrqzFdaEb81MB1cSLvrccwTY72trrw8XlgaSaB2pffJNkhc7D5gPzAWgEie+592itqEa2+DLAf9zdL6WN/gqLSnV9UYjUaafjkpM2b0St4owP7zxALEtFEc2pgCNobLYmNBxDwoo65FCKDEtHrG4XEcJz7/11iAhLTMFLZ5ETNvxipmzHu9ROr5JMNhkAzoCB2Vuuv5cOLSxXmxTsdOZBXtbWcoSVEzHYZYB86s4jekirBjgzn06pIwZym07JH3SxhXoXXuLOXfGN8sO1lZGVH1bBArvrrdtfpluxlw0hmiUkOp1FpEgqeJHwfzPZd+hiqSMwOylpm54yavc+HZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HnFM2hKPu9H3Oxy2eLM5x8VZaLy7QppVRowyfQed+ag=;
 b=pTsvsJcL1SX1tmkTZqHUmVmzbmduik59+jfD/8kkp2bQD5SqP7d4AsFNGjKQmyqx6BJd+5xn0Cg/hZEg6Q1lZGUy3yEai1RrUPA4ZV4DD9m72kk9zmCIrd1BwTY6n4YhBzcrN03eb/50mA3y92JwahtIIDvuxDDWuGB0ssrk1pVdHfXPbxblbM3zOyX5u48g2G9ZNH967C7xCX+0mCxl7STSNwkh44uh0MR66gvSRq7bMez5J9oS1tq/z6QwJSKx4Wnu0Sc1MNcK5mzpvTvNrm1zHolB/WUHvrPW5AwC5lJ2JTuvKOrMlqGkvhVtXhDcXhSfnjgS9WCsd+qyz+77Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=codasip.com; dmarc=pass action=none header.from=codasip.com;
 dkim=pass header.d=codasip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codasip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HnFM2hKPu9H3Oxy2eLM5x8VZaLy7QppVRowyfQed+ag=;
 b=zrXVhvQEhpSGh4+ps828inlno8UezxBP7z063vHl317EWSO8w8ojAkWbG6kSm+Ea62oO/kyjlAc2d228a+KlBe7OjO86iVUbEA8zn2E3PJrvWcb0llEYt5dXq8Kcs3XXEr7rsDY6xOfKr9q+W7jia3zsIO8KjLavVAdTiQB9ireIeVAH870h2XD1h3VbrthqGioywH4zgqhr6ckUKsnFFp9HV9JaFjkec2aJWyC7baO7mtqlix3/MV8rphcZL7OKlYS/JUPkRmqBlXlf3giAxLrDGo57gweZ7lbFjX6kC3N4lLpzzf7iOTSj9dJckLAQElsagB/p6GEiR/YpiU2LKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=codasip.com;
Received: from AM7P192MB0787.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:17c::14)
 by DU2PPFC1CA99706.EURP192.PROD.OUTLOOK.COM (2603:10a6:18:3::9a4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 13:52:50 +0000
Received: from AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
 ([fe80::c1d1:f20d:9fb5:72d3]) by AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
 ([fe80::c1d1:f20d:9fb5:72d3%6]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 13:52:50 +0000
From: Chris Gellermann <christian.gellermann@codasip.com>
To: shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Gellermann <christian.gellermann@codasip.com>
Subject: [PATCH] selftests/mount: Cater for /tmp being a symlink
Date: Fri, 31 Jul 2026 15:52:42 +0200
Message-ID: <20260731135242.1581797-1-christian.gellermann@codasip.com>
X-Mailer: git-send-email 2.47.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0148.eurprd07.prod.outlook.com
 (2603:10a6:802:16::35) To AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:17c::14)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P192MB0787:EE_|DU2PPFC1CA99706:EE_
X-MS-Office365-Filtering-Correlation-Id: b98eadd0-06af-4233-1be4-08deef0b02c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|10070799003|3023799007|10067099003|56012099006|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	r/qYFWclroIXSIIzYXDhQJG+w49qJR1DiiRWdlAP0wCa9ujmo+AsVyw62BwPIFjD2x51ChIh4MgZhoWBfDYKxjA72E1cV9+ekd67OqqpiO0y1N4UnVNlgqrkrN27l+1HXya7/beShNBa3U9i6//BLpgBjNKmxPnVD+/cRPzA8QpXztzNS5kq1ERfTL7Xw4ypYOxkMuPgln8P08Z3poivqJpZmtKe/QVy0QXV2PN8ZAJlDB75a0FL9iXyauHX4zslsH+Np6a5QKNBj0YEqsRhIxeSHv2wFWjANfsWJ96Yel1dhLrT4DP/B05FlE006ixFjoa1RXGreakZihldLcDEF6rkn7QUT0oDoU+4VBi4HvJGIPKW1bCf89ixuy4u/sOfmXYaKJah8hoyHLegKNf/S8SPaD39KucCk72RlOWVoNfzkQg3KD5RN1GviS0XklGDmX+O+JENmCTcMqsahqAmnTKOubXJq52HU4qE9BWQ23fnb2P0d99yr+vgqwIs45+QmVCSMkH0Cg/Gc/n4f3xhhdmMrigeOj7uZz9OiHsBxePnCxn+r0wV3RdS5beu/Z8wrdaLDK5mIflH3dqaLhfjdsrETSeC2caYP8F4ivHBMiWGht9c8CH3cbcihg9JBewj1dhffAaBIRTjDgg5P6L+1yW0hDH+SwgbCJX8SAI+awg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P192MB0787.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10070799003)(3023799007)(10067099003)(56012099006)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FGG1ZOBpkgkkkXX6uR/KzZUbaoFjbVLPkxqVkg7GQZLvsbiwL5A/bW04R/xm?=
 =?us-ascii?Q?+DTvpvfEXjm4hAHwA4pTYpp5MKsSHshW1UYsBxl6/LPI1EGooUVpHNptCM7o?=
 =?us-ascii?Q?wtSXEEb6EKm76LDLLxd/tRkB/+Lq3TUk1gohpcrrELFdBFjX/pptB9fI57OE?=
 =?us-ascii?Q?OW+dy4YoOgtTXsRsMltxAxXbQFoaYYsaXQRTF/w+jt7LefM7jeG6DAeuADJY?=
 =?us-ascii?Q?ZfW9hB6v/e1AuIBCSrUvlOh19fkJABIPSg/MJlX+Uln97dThVmheLDUzJvq8?=
 =?us-ascii?Q?sRjEAxYBZoox4HYH361w/4swBy+TzyKmPbdBeE4E6iVaYR4l72sSUUJClJsc?=
 =?us-ascii?Q?a6NcOwSI0Q4XDvyLDXECRzpWxdvhqfGnUXcUY2gx9bDudKsfH5kwrE6lLt0E?=
 =?us-ascii?Q?1/g4crWH38OpF9Z79yGFETaBBv6wzcCyUuvfnpOJs0IvfFhi7Oq2xDcT3IxE?=
 =?us-ascii?Q?C/7MPLeb/n+x1ItVGsHGrVDzL4ZlGS0w+bdPEI30u0hZl2qr1V1Pk2opR+N8?=
 =?us-ascii?Q?X2LccvF2i2Rh4/Ao6IuGj+Q64xOBY3X6l3RUwXPgEkEzG+t++hPHz7Gdgf+C?=
 =?us-ascii?Q?mm3+3LCBFCT7vgnAYTo7DZhyjZkYWSQBC1Qy9zWcizI3WVuavlcjXFapLnjJ?=
 =?us-ascii?Q?u8BI/GDRfV9zp87JcXiWIleiDIeK7+P8qEnGIDd3QNiLqPRcDXIzsSL9gGr2?=
 =?us-ascii?Q?/ypheLlEh1xseVKesCuShyejMyQVFQ5Xnm0zn4D0h5JAubMqEREjrLhmzrQq?=
 =?us-ascii?Q?eKBE/HtdPq1QfG2t5vNICPid4j51BUS6rnT4CmCXvvDKbhE+KzgWH9od7D0h?=
 =?us-ascii?Q?Q/va4nWmmu2E56ZZwEsDP7AlOFjSkFtUnJ14WZeWKUyTF0Gl7A5OukeRG+tB?=
 =?us-ascii?Q?vl6GrSOxgck4O4w8+eBSui1Iq9pyS7HxwiQFZvAGSksWVE2SHyQGZHFkkzsv?=
 =?us-ascii?Q?aznRY1pnaFbdXeUaR+aBOQalRnJoiiUfnV/sAc8QIPnQs7S4YY2iRzj4Pgyd?=
 =?us-ascii?Q?MVVRBGcHHk5U8aqpXERpr9dKPPRYf+h+MXF0EqFd9W7VlYLyIuONXGT+b1xK?=
 =?us-ascii?Q?pXZjq6viYUzFprk9HUfV1IUll70YQpX8Meb7Gi5fjgnjeClBlDSZBxnH9UBb?=
 =?us-ascii?Q?4zrUfRQcxGEMj/Er53dJhPC63Xy+Sy22BwSSpjzx6I+dgRiqHLczhPPQ2eeQ?=
 =?us-ascii?Q?MdAxSGfSgkZJAuOHBDKwf0RcLo6AwHuMnjqtqyj9Wmp5bTuYqc+vysTdZz9s?=
 =?us-ascii?Q?xPAyQIDzRHYdSG3Inc99PptHy1LJycX7Ipi6bZKlSWvFkYL9DQwRBPjV+f+C?=
 =?us-ascii?Q?/bIO0SrIH7qmCIfkkDoKwHVqt4+4o4AoLw+mm1lqGT6DMz1UOxVr8DrIHd/j?=
 =?us-ascii?Q?10ZLFgpiJS4eTZzuaseOVCi3QE9ouU0Qi+mpjgFYThbpGo1+WRA1DBae7OKk?=
 =?us-ascii?Q?X5yPVBti2lLuYwHnf9xCC3yTHky+MSbsQiLD5slLbWEf7/H4uZ4Nnz+iH6od?=
 =?us-ascii?Q?ceAdnF4FTzKj38CkfLvE+q/tKMLT/von47GsW2A57+U/VLaPTHQ4SxPcIvJQ?=
 =?us-ascii?Q?ocLvg9HnOVq/EcZvnhS1q4N77okFxpnYq6UZRDRCb1YgiAP+Ak4eWCLLApcS?=
 =?us-ascii?Q?F2bDnzmRCGBk7Xc1OJ1l8IwEoEo5ArST2IFT+Iq27GjPGLN7jpd9M4tH8O5j?=
 =?us-ascii?Q?Oj49I9Iiernmd/S6HUqiM7FONMg6CJn62lFp65XkSfa0Wr3h2GFmzE0et3p5?=
 =?us-ascii?Q?jsVO7n+69hrbGFE7NmVtuMzFM8Kw4XN2TFI9oY5F7ZqDuRGC4UMzSg0yOXt0?=
X-MS-Exchange-AntiSpam-MessageData-1:
	wSyvNA2+R7ll4BCilv50JaIjYSdYV7/hfl2axeloYLYEFlmcnQvs6gBj
X-OriginatorOrg: codasip.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b98eadd0-06af-4233-1be4-08deef0b02c6
X-MS-Exchange-CrossTenant-AuthSource: AM7P192MB0787.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 13:52:50.4763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d91ffef-bb81-4cbd-b9b8-552583685f20
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fnxf5mC15B8So2vas2y/aXO3jLp0aTeK+btqND8hE3RD2+Mem4FVXugfk1SK4dvpHxbdnvAPzAEB+G9jO8ZpDXFn7SFJmVI7fWuX8O9Ud1pWDkX9+mfSj1QvbNKvhu4f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PPFC1CA99706

The no-symfollow test creates a file /tmp/data as well as a symlink
/tmp/link to the file on a namespaced ramfs mount at /tmp (or whereever
/tmp points to). Then, it checks that the path output by realpath on the
symlink matches the file's path, regardless of the mount option
MS_NOSYMFOLLOW.

If /tmp is a symlink, the real path of /tmp/link will no longer match
the hardcoded file path /tmp/data. Fix this by determining the real path
of the mount point and prefix the file and link paths to where the ramfs
will actually be mounted in the file tree.

Signed-off-by: Chris Gellermann <christian.gellermann@codasip.com>
---
 .../selftests/mount/nosymfollow-test.c        | 56 +++++++++++++------
 1 file changed, 39 insertions(+), 17 deletions(-)

diff --git a/tools/testing/selftests/mount/nosymfollow-test.c b/tools/testing/selftests/mount/nosymfollow-test.c
index 650d6d80a1d2..441ec7cc2a50 100644
--- a/tools/testing/selftests/mount/nosymfollow-test.c
+++ b/tools/testing/selftests/mount/nosymfollow-test.c
@@ -23,9 +23,11 @@
 # define ST_NOSYMFOLLOW 0x2000  /* Do not follow symlinks */
 #endif
 
-#define DATA "/tmp/data"
-#define LINK "/tmp/symlink"
-#define TMP  "/tmp"
+#define TMP "/tmp"
+
+static char mntp_path[PATH_MAX];
+static char data_path[PATH_MAX];
+static char link_path[PATH_MAX];
 
 static void die(char *fmt, ...)
 {
@@ -112,27 +114,46 @@ static void create_and_enter_ns(void)
 		die("unshare(CLONE_NEWNS) failed: %s\n", strerror(errno));
 }
 
+static void setup_paths(void)
+{
+	int ret;
+	char *path;
+
+	path = realpath(TMP, NULL);
+	if (!path)
+		die("realpath on %s failed: %s\n", TMP, strerror(errno));
+
+	ret = snprintf(mntp_path, sizeof(mntp_path), "%s", path) < sizeof(mntp_path) ? 0 : 1;
+	ret |= snprintf(data_path, sizeof(data_path), "%s/data", path) < sizeof(data_path) ? 0 : 1;
+	ret |= snprintf(link_path, sizeof(link_path), "%s/symlink", path) < sizeof(link_path) ?
+	       0 : 1;
+	if (ret)
+		die("Path %s too long\n", path);
+
+	free(path);
+}
+
 static void setup_symlink(void)
 {
 	int data, err;
 
-	data = creat(DATA, O_RDWR);
+	data = creat(data_path, O_RDWR);
 	if (data < 0)
 		die("creat failed: %s\n", strerror(errno));
 
-	err = symlink(DATA, LINK);
+	err = symlink(data_path, link_path);
 	if (err < 0)
 		die("symlink failed: %s\n", strerror(errno));
 
 	if (close(data) != 0)
-		die("close of %s failed: %s\n", DATA, strerror(errno));
+		die("close of %s failed: %s\n", data_path, strerror(errno));
 }
 
 static void test_link_traversal(bool nosymfollow)
 {
 	int link;
 
-	link = open(LINK, 0, O_RDWR);
+	link = open(link_path, 0, O_RDWR);
 	if (nosymfollow) {
 		if ((link != -1 || errno != ELOOP)) {
 			die("link traversal unexpected result: %d, %s\n",
@@ -154,20 +175,20 @@ static void test_readlink(void)
 
 	bzero(buf, sizeof(buf));
 
-	ret = readlink(LINK, buf, sizeof(buf));
+	ret = readlink(link_path, buf, sizeof(buf));
 	if (ret < 0)
 		die("readlink failed: %s\n", strerror(errno));
-	if (strcmp(buf, DATA) != 0)
-		die("readlink strcmp failed: '%s' '%s'\n", buf, DATA);
+	if (strcmp(buf, data_path) != 0)
+		die("readlink strcmp failed: '%s' '%s'\n", buf, data_path);
 }
 
 static void test_realpath(void)
 {
-	char *path = realpath(LINK, NULL);
+	char *path = realpath(link_path, NULL);
 
 	if (!path)
 		die("realpath failed: %s\n", strerror(errno));
-	if (strcmp(path, DATA) != 0)
+	if (strcmp(path, data_path) != 0)
 		die("realpath strcmp failed\n");
 
 	free(path);
@@ -178,16 +199,16 @@ static void test_statfs(bool nosymfollow)
 	struct statfs buf;
 	int ret;
 
-	ret = statfs(TMP, &buf);
+	ret = statfs(mntp_path, &buf);
 	if (ret)
 		die("statfs failed: %s\n", strerror(errno));
 
 	if (nosymfollow) {
 		if ((buf.f_flags & ST_NOSYMFOLLOW) == 0)
-			die("ST_NOSYMFOLLOW not set on %s\n", TMP);
+			die("ST_NOSYMFOLLOW not set on %s\n", mntp_path);
 	} else {
 		if ((buf.f_flags & ST_NOSYMFOLLOW) != 0)
-			die("ST_NOSYMFOLLOW set on %s\n", TMP);
+			die("ST_NOSYMFOLLOW set on %s\n", mntp_path);
 	}
 }
 
@@ -201,15 +222,16 @@ static void run_tests(bool nosymfollow)
 
 int main(int argc, char **argv)
 {
+	setup_paths();
 	create_and_enter_ns();
 
-	if (mount("testing", TMP, "ramfs", 0, NULL) != 0)
+	if (mount("testing", mntp_path, "ramfs", 0, NULL) != 0)
 		die("mount failed: %s\n", strerror(errno));
 
 	setup_symlink();
 	run_tests(false);
 
-	if (mount("testing", TMP, "ramfs", MS_REMOUNT|MS_NOSYMFOLLOW, NULL) != 0)
+	if (mount("testing", mntp_path, "ramfs", MS_REMOUNT|MS_NOSYMFOLLOW, NULL) != 0)
 		die("remount failed: %s\n", strerror(errno));
 
 	run_tests(true);
-- 
2.47.3

