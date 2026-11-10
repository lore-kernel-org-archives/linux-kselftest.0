Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794282221;
	b=ol6ySTyFlIAaLNRMjKR1zt9/3CTMNdWOP7YwDdV2JEIww7vb/dil2qF1MztBtrgZHcRE
	 7wfLOKgnyU3Q0NOU9LCcloqcXbBAcMNJorSDt95MPlnN8yq0Z4NaNXcIChQm0ddS2pVU6
	 OLL++hRJdH8af2yIutr691JGYAMQLzIIRqbI4unHjWMnWPBG037N5rNlAy0vPxnVdMZPb
	 jq+/6r8GOoa73zxwsYV4TpTzZKArRFIntdBLVBEAZuNMqDBpE6Z/uYBNoqEB2Y3YbsxD8
	 PAimKgOEWQSlgqSC3GAEFxnhJE1XEPn1cIsBPVkvXlpfI+Glqe/x+QPsqVWhgtErplA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794282221;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dnQ7gTt/o/yOmf4UW5maPDuUi/D+ug66zp+tA7HH7wc=;
	b=wFoM6S/HpCisTVQFamEq+t0iIHNglDr4rk9sNH/Dfo4wiHwQzncDyvlrh4IN+CryFGXo
	 FJy2F9eIaQQFkNbzKiFTrKA0SoxcSk/aH7mhjiOQNJVVmv4ZCHG4AWX9Gil3UEwLD12Xv
	 Vca6BPcNmovcemgOJqwUh3OQ9YtYzNZ7NJ4ez9QpB6N3X7VZGqtFzmcnYbdaY1IhkwkVd
	 0CzCz/9F0s8Ez2NBuxsaH/9mYwlKe1+crKPF9eqcRIqhEgBRon1rXikJFVoolasA7W89i
	 Mz0OqFRjL/8nZRbHorSiI/28boEuzGwZFXAA8P1ivEcfnKnzEDUa9dJiXNbiWV2XzBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=abwjSXIr;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D3C606A333;
	Tue, 10 Nov 2026 03:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29D3C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=abwjSXIr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794282219; x=1825818219;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Tk1YU7iK0lC9QRUia4RaKHRpP7UnPMgGvQ5GsFsmUOI=;
  b=abwjSXIrEMA08PrfwEyuOl13dO9hPdrKBJUw7nBawmQqo6vv9vs4yOo2
   ttUgtqtiri42J9ZRPD2LwQ/YEm6YGFWgo/Fvjol2SuZ5ZG6Os7cnljrrp
   n68LNroG8RiZRupeHheFNEhlm8ofj+W7s0iOxAUPMI9t0A7NCZ5GFhvpE
   2jW1vXa4VdBKxdLp21qXrP1K7wjr7Q7jYV2cltGP22tUhNJjmaSoj8mJ+
   RICPpbc1YjcB1WOuNkaXoJR81Ixz7PKm1VwhTOcp4S+PlQo98UKbicwVn
   xpYXFXCvMez68tUrW1tKrntByuhuCWds4jKMp5y9vbc70Hg0zPzGnDhRA
   w==;
X-CSE-ConnectionGUID: SbkmTvmrQNqAPGdBjlPkYA==
X-CSE-MsgGUID: SzFddbJ1QG66mfhEb4++gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3018027"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3018027"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 19:43:38 -0800
X-CSE-ConnectionGUID: yD+nYNaJRr6d88XEFr8m8g==
X-CSE-MsgGUID: FFoMPWaORXumcojWEZMYbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8218873"
Received: from chang-linux-3.sc.intel.com (HELO chang-linux-3) ([172.25.66.174])
  by fmviesa003.fm.intel.com with ESMTP; 09 Nov 2026 19:43:38 -0800
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: x86@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	shuah@kernel.org,
	chang.seok.bae@intel.com
Subject: [PATCH 3/6] selftests/x86/xstate: Validate XSTATE_BV in ptrace test
Date: Tue, 10 Nov 2026 03:16:00 +0000
Message-ID: <20261110031603.698635-4-chang.seok.bae@intel.com>
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

The ptrace test does not currently validate XSTATE_BV in the XSAVE
header. Add a check for it.

The component bit may legitimately be clear when testing a reset state.
So, ensure the expected bit setting first and then compare the component
bit directly.

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
---
 tools/testing/selftests/x86/xstate.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/x86/xstate.c b/tools/testing/selftests/x86/xstate.c
index 240567e79e96..93ba4b5f1a08 100644
--- a/tools/testing/selftests/x86/xstate.c
+++ b/tools/testing/selftests/x86/xstate.c
@@ -62,6 +62,7 @@ static inline void load_init_xstate(struct xstate_info *xstate, struct xsave_buf
 
 static inline void copy_xstate(struct xsave_buffer *xbuf_dst, struct xsave_buffer *xbuf_src)
 {
+	memcpy(xbuf_dst->header, xbuf_src->header, XSAVE_HDR_SIZE);
 	memcpy(&xbuf_dst->bytes[xstate.xbuf_offset],
 	       &xbuf_src->bytes[xstate.xbuf_offset],
 	       xstate.size);
@@ -277,6 +278,13 @@ static bool validate_ptracer_xstate(pid_t target, struct iovec iov,
 		failed++;
 	}
 
+	if ((xstate.mask & get_xstatebv(xbuf)) == (xstate.mask & get_xstatebv(expected))) {
+		printf("#\tok\tXSTATE_BV\n");
+	} else {
+		printf("#\tnot ok\tXSTATE_BV\n");
+		failed++;
+	}
+
 	if (validate_xstate_same(xbuf, expected)) {
 		printf("#\tok\txstate area\n");
 	} else {
-- 
2.53.0

