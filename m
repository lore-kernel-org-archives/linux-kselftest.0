Return-Path: <SRS0=uG9B=DW=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9706CC433DF
	for <linux-kselftest@archiver.kernel.org>; Thu, 15 Oct 2020 15:23:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2CDE32225A
	for <linux-kselftest@archiver.kernel.org>; Thu, 15 Oct 2020 15:23:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388686AbgJOPXw (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 15 Oct 2020 11:23:52 -0400
Received: from mga02.intel.com ([134.134.136.20]:38073 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388357AbgJOPXw (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 15 Oct 2020 11:23:52 -0400
IronPort-SDR: 5VNsMZPMPj/ihkTpIwqFwLrXiUpSPndjoUGJT4mb7vNuYPQhi0SqsiBUDzAaa26ZkZ/C4ztisN
 DYjvhEkpMMpw==
X-IronPort-AV: E=McAfee;i="6000,8403,9775"; a="153310302"
X-IronPort-AV: E=Sophos;i="5.77,379,1596524400"; 
   d="scan'208";a="153310302"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2020 08:23:51 -0700
IronPort-SDR: dn/ljhlB8c9QC6H9sB12mpg3TmMvlbhmRfVNaCeqxVzix7TAsnt1doeyQZQ98kykogn+cz7s2a
 +WYqr4G4BwmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,379,1596524400"; 
   d="scan'208";a="357755410"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 15 Oct 2020 08:23:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 2A1E5B8; Thu, 15 Oct 2020 18:23:49 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Brendan Higgins <brendanhiggins@google.com>,
        linux-kselftest@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        kunit-dev@googlegroups.com
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/3] kunit: Do not pollute source directory with generated files (test.log)
Date:   Thu, 15 Oct 2020 18:23:47 +0300
Message-Id: <20201015152348.65147-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201015152348.65147-1-andriy.shevchenko@linux.intel.com>
References: <20201015152348.65147-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

When --build_dir is provided use it and do not pollute source directory
which even can be mounted over network or read-only.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 tools/testing/kunit/kunit_kernel.py | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/tools/testing/kunit/kunit_kernel.py b/tools/testing/kunit/kunit_kernel.py
index 412dc5e3102b..3a68dc51d33d 100644
--- a/tools/testing/kunit/kunit_kernel.py
+++ b/tools/testing/kunit/kunit_kernel.py
@@ -21,6 +21,7 @@ KCONFIG_PATH = '.config'
 KUNITCONFIG_PATH = '.kunitconfig'
 DEFAULT_KUNITCONFIG_PATH = 'arch/um/configs/kunit_defconfig'
 BROKEN_ALLCONFIG_PATH = 'tools/testing/kunit/configs/broken_on_uml.config'
+OUTFILE_PATH = 'test.log'
 
 class ConfigError(Exception):
 	"""Represents an error trying to configure the Linux kernel."""
@@ -89,11 +90,12 @@ class LinuxSourceTreeOperations(object):
 		except subprocess.CalledProcessError as e:
 			raise BuildError(e.output.decode())
 
-	def linux_bin(self, params, timeout, build_dir, outfile):
+	def linux_bin(self, params, timeout, build_dir):
 		"""Runs the Linux UML binary. Must be named 'linux'."""
 		linux_bin = './linux'
 		if build_dir:
 			linux_bin = os.path.join(build_dir, 'linux')
+		outfile = get_outfile_path(build_dir)
 		with open(outfile, 'w') as output:
 			process = subprocess.Popen([linux_bin] + params,
 						   stdout=output,
@@ -112,6 +114,12 @@ def get_kunitconfig_path(build_dir):
 		kunitconfig_path = os.path.join(build_dir, KUNITCONFIG_PATH)
 	return kunitconfig_path
 
+def get_outfile_path(build_dir):
+	outfile_path = OUTFILE_PATH
+	if build_dir:
+		outfile_path = os.path.join(build_dir, OUTFILE_PATH)
+	return outfile_path
+
 class LinuxSourceTree(object):
 	"""Represents a Linux kernel source tree with KUnit tests."""
 
@@ -192,8 +200,8 @@ class LinuxSourceTree(object):
 
 	def run_kernel(self, args=[], build_dir='', timeout=None):
 		args.extend(['mem=1G'])
-		outfile = 'test.log'
-		self._ops.linux_bin(args, timeout, build_dir, outfile)
+		self._ops.linux_bin(args, timeout, build_dir)
+		outfile = get_outfile_path(build_dir)
 		subprocess.call(['stty', 'sane'])
 		with open(outfile, 'r') as file:
 			for line in file:
-- 
2.28.0

