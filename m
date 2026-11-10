Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794282221;
	b=J8pYJZ2x6YyBhUyW8H8oexVs2lAc/10Wsby5RHnxozmQ+Uegv3/TYopX3F7T2ZFBfT3X
	 7cIZhwmddhVi5pXw4kXPpFOL7GT/GL1F9i5ywS9lQ2ck2ucPQ0v6xIzlmhSYseaYwfsIa
	 q/tInzcFYinAPX29e8Bf8CdtSjYT5CHxn7jwNzI6yQIg60lYVavmHETG7GVhjNYOCw4vg
	 bl+6iDxBm453/B9VnK1ojZuAo2dimJrf7/srcHq577SlIobrRKGF7n5H/LRBeoINw/9v2
	 LgoESItyBfnP3GUi1dDR40tSP9Zg+jQXX349lYMK2I4N5lP1tOjbZYyWqoVWGwWKlPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794282221;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PV/t0EhGA7mrerstOXQueV2ramcF6PvNIR0DITj4BwA=;
	b=T9KFCv84OtXU2eISkyBy+72new/vuzagrCsHkexykDHqeJI9NnLZKoTsa6aG+F71BfXT
	 u4Qsj2AjV5fflpg6Z3hcrSAhUejjinPfd7+4+tDnl+XO7j1nc8uI/hsU00NbJ/wsE5fwX
	 X3GbDOpPdKO5qr8VoTnu8H7yU73ERLSIsANjvIJvbnCtl8iIfOt/Ch8UR4zTyZw1pZCDn
	 eOimdyHGbhdzWjOhFzIAjHz0pk/FCuny7jv9E/8xwjxlYOS0HmFGWZDvnGWhWe4EPJZIJ
	 lbzmC8btxqZOluT50eEdldTiE6MpKdln/4lvUEB2CXf6VNq+X+4b7EoQAIhzzZb2gWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=im4LKKWL;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731CB606A33F;
	Tue, 10 Nov 2026 03:43:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 731CB606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=im4LKKWL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794282220; x=1825818220;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wAK1ho8uqshI8N9vZwqEoS5hi326U5YrIe5n4Mv7+sA=;
  b=im4LKKWL/eaHl2Rx2ux+uz+OJdUZWexSNlCmGP5Y136FC4cgEtZWsGlD
   gEDNu2jUzGf3MSiJsuzd7u7RXJmjbnxSfFmVLPURpS9uSehu4Z19urutt
   rU0oC+bTi1y/Y1zMUfEDKEWMTwHBsb1Jm8oCbYUXD2QqnOlSFDmk+e0d4
   kgK6yfhIg6PJY0Wc0Gl2DgGrpPlSpZaI9MdftblpNiS34dMCTmQw3JU+W
   iI/l3xmU2TcITJoxkFGzxRP6lRyaPC7SyLL08+f2kCEJH92FzTzdn2NEm
   wf+HZ9ZD9Z4GEVF0guUnUPF9C6W/HBwAc22R2LR+yRSdJ2TIgPBGoSNnf
   Q==;
X-CSE-ConnectionGUID: /QIfzAHGTguWDpndOsQdNw==
X-CSE-MsgGUID: gUb4BaFxQ3KMdBkN5vxOMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3018032"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3018032"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 19:43:40 -0800
X-CSE-ConnectionGUID: BEUYYwHbRzS4AptybGYsWA==
X-CSE-MsgGUID: fiOCi9LNTjKj1RkvWMG7ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8218892"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by fmviesa003.fm.intel.com with ESMTP; 09 Nov 2026 19:43:39 -0800
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: x86@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	shuah@kernel.org,
	chang.seok.bae@intel.com,
	Jim Mattson <jmattson@google.com>
Subject: [PATCH 4/6] selftests/x86/xstate: Validate state reset in ptrace test
Date: Tue, 10 Nov 2026 03:16:01 +0000
Message-ID: <20261110031603.698635-5-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110031603.698635-1-chang.seok.bae@intel.com>
References: <20261110031603.698635-1-chang.seok.bae@intel.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clearing a feature bit in XSTATE_BV should cause the state component to
be initialized when the ptracer retrieves the state. Validate this
behavior.

Cc: Jim Mattson <jmattson@google.com>
Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
---
I missed this before. During a review on my other thing, I realized and
now adding... Thanks, Jim Mattson!
---
 tools/testing/selftests/x86/xstate.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/x86/xstate.c b/tools/testing/selftests/x86/xstate.c
index 93ba4b5f1a08..a2f25ca848fb 100644
--- a/tools/testing/selftests/x86/xstate.c
+++ b/tools/testing/selftests/x86/xstate.c
@@ -330,6 +330,24 @@ static void ptracer_inject_xstate(pid_t target)
 	else
 		ksft_test_result_fail("%s for %s\n", __func__, xstate.name);
 
+	ksft_print_msg("[RUN]\t%s: reset xstate via ptrace().\n", xstate.name);
+
+	/* Reset the feature bit in XSTATE_BV only, expecting init-state back */
+	set_xstatebv(xbuf1, get_xstatebv(xbuf1) & ~xstate.mask);
+
+	/*
+	 * Prepare reference data. Note not every XSAVE implementation resets
+	 * the XSTATE_BV bit even though the component is in init-state.
+	 */
+	load_init_xstate(&xstate, xbuf2);
+	xsave(xbuf2, xstate.mask);
+	set_xstatebv(xbuf2, get_xstatebv(xbuf2) & ~xstate.mask);
+
+	if (validate_ptracer_xstate(target, iov, xbuf1, xbuf2))
+		ksft_test_result_pass("%s (reset) for %s\n", __func__, xstate.name);
+	else
+		ksft_test_result_fail("%s (reset) for %s\n", __func__, xstate.name);
+
 	free(xbuf1);
 	free(xbuf2);
 }
@@ -491,7 +509,7 @@ static struct test_info {
 	unsigned int nr;
 } tests[] = {
 	{ .nr = 1, .fn = test_context_switch, },
-	{ .nr = 1, .fn = test_ptrace, },
+	{ .nr = 2, .fn = test_ptrace, },
 	{ .nr = 2, .fn = test_signal, },
 };
 
-- 
2.53.0

