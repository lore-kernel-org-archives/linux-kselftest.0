Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB744AEBF9
	for <linux-kselftest@vger.kernel.org>; Thu,  1 Oct 2026 12:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858569; cv=none; b=P3MKDswA6t0/HaWckXzblZHudzRe+KYcnTf8YwPI58ChHO+51+vgjiFp8TNtxMJviyaKqMbzvVuIZUzR7nYggejaGyQcWmRHbJoLGsVE7sQzCQrn9e8qpHr+2459i84cvNsVpZbk2p7r8fA821a+BLtSDOh4Vl2hc8nI/Oz6Wig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858569; c=relaxed/simple;
	bh=XIAoed3+o40QYExmg0oCK4ZBv5lI1TLgsmQ+TOdV9z8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yoc8qXWnguagUWtH6jys2r/LV+seboDxKH+C4jfmPbW4x6pV/ziNav1qve92JaeshcPVLEQNxVooeYDjLxMLLbycbqH4mi7OTYrrBdyApP9aRm2lqPiXgBuNdKuLGs+S4ScfK72soyyzuMLpDspHhCzO74D/i0hs07cWCVi+wbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im; spf=pass smtp.mailfrom=fastmail.im; dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b=OhURReT5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JBifoMzU; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.im
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.im header.i=@fastmail.im header.b="OhURReT5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JBifoMzU"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 13AC17A0119
	for <linux-kselftest@vger.kernel.org>; Thu,  1 Oct 2026 08:42:46 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 01 Oct 2026 08:42:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.im; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1790858565; x=1790944965; bh=gvGOj8FYFaYncgbJJ2r9i
	KS9P9a+i7X1V+ToEWq2tMQ=; b=OhURReT5gZTMSclaJSzkpG0fbZN1IPBgO/ex/
	Lfj3bX5IzaK1g0IQW5oufhvt0rg+USg0m3Q/cbgSSjAqHNYpT7meHTb/Gfd9YZcK
	8qdc6XSCybJSri8z3NRqcJVdU993qdqDnwj+BjsVDZGAapbuGHz4MbknBuqYFiCO
	SSGkoow/PqGd8dvOHJBjkxzHRTrHBNbehri4piLZAOBPoODZwHEmlgn64vMpAdWv
	7vMYsaRYkgyXKO/TijNCKicO02dfwSpIZdvyutHr69hj+ffgPTpSf0/J9PXcoZvh
	iJ7SKPULTmJ65rG0tYuvZR6ZrNeksyr0cxa/lU2vVezqX0NeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1790858565; x=1790944965; bh=gvGOj8FYFaYncgbJJ2r9iKS9P9a+i7X1V+T
	oEWq2tMQ=; b=JBifoMzUnsUKLH4vQiCHL8Rx2onyNl44v7np6dO2xwmY9qbMSRA
	Xacdysswbx1LNFkEsS919ipKpjxCmKaKU4xYKpPAVdhNu8B5Dsa4kYH4cNHerYnW
	eQaugqRut6ndGL1nZJWufFpMNtrJ3VeXZJjClsiEFc5k7bePq0Z8/OcK99swuRId
	eGCHid2M4a6pea6cQjK+3xu20NSAYAwEcaUL5c/6oTPZjnuk1nvLiAWYT9tUbrPA
	9dQGBwxUUHeLlDSmUci708UC614PqjNB2ffMdMOp/g5Lu5gjuRXHJefrOHR/WjQV
	FS5PfUVgE6ubsHqSrDk6ztVhrV+W4AJwgrQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=fastmail.im a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1790858565; d=fastmail.im;
	mf=PGFsaWNlLmtlcm5lbEBmYXN0bWFpbC5pbT4=;
	rt=PGxpbnV4LWtzZWxmdGVzdEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:mPNSmP7o1JfKI7h3SYfNRRuKC8v6xO3w377FoAeKcvVm3IX
	bEnTFDZubVMWvwfw08GqPbGvoisitzIT0O+WM48cPFOK7WZox8YQ1ovbNKBcvsqc
	cvHhIwgcweqAMwFkOPIVqkulPE4ht0qhgDRhTyJLjVPyvzP2JD1eCEhgMwkxgiBp
	XRDNAEnBFvEgYMfHlYBB02eBdvbXHnEjar0T9Qxx5tz8YliTsEmJk6CaGIVymMPD
	1N2X9vM5oD28rNeI7Ys98tNHS6nufA4TeO2j6yMUlieGCe11WF4kv2zOyEn8gP/k
	1UHv6ENBsNpxXdmNMmDVjHW5mhucDSHI50DkDHg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:ELYptm4kSkzXMRTMZLgvvN6gdpXm2BSqQGAP2a+6EGc=:XIAoed3+o40QYExmg0oCK4ZBv5lI1TLgsmQ+TOdV9z8=;
X-ME-Sender: <xms:RVW-aulTiSKAB8ClP1uNTY7WEdfV-9u_wI-rH0NJD06ytwCTEGavAg>
    <xme:RVW-ao4RHa-Jtd6bRBZiLE5wVXRnkdwAjPuAhvBAg_YY-7GfBAFJFQk3-x9q0aUr-
    RtdHGkHHNKdT6coyK_Q8ITtQA6t-8sFIEtpDcKawyFywZTsU34vKA>
X-ME-Received: <xmr:RVW-anTlK1wXccPVDJSbubjtrKSbvKL4tD7CPbcfekKvE3S4tRbc_dLW-Mg>
X-ME-Proxy-Cause: dmFkZTEfaSjVVGLAe9v7rAXjOnDEFWL2R0rBpIfrEFOtXQAj/NV3uHhUPKjMfIl3XdTUWu
    hZ49EMCdUngJjcWpPuePLJHjAmRXZq6TeInaH0Q7LXAeDebfG5v6sEbmOXEuETTI7fCjm3
    zSvhq3iOrmn8HdBncMPi1f1rGLuNxgitbdIaQZzQyRVSlp7j5S42hRuj3eTNv8je9MPFQx
    foCI3dogT34yghT9OsiFz226zSMwbqck3ZWucwbFzWvcskCehNDST+ExxD6YCTug6Vnem4
    EuGrrXOfB4V5KmvVh2a+cFHJH1cdpW5p/rN8onkpiG+Z4gvxSWBfUDSUcDaGsDvWjtVUUV
    VzvgINVHt0tkXwaTKVNfFzP0J7WcSrl+wHqp+lHqKbZ1zdWFsabo7N6iHRxKAHXl3j+4UZ
    YEyhdBmWLxt+yup7Kapys1/mcKsNGb0j/Ow9Q6japzh36NthqahMYnD6uR9stgsH96uOel
    k/kyIsHum5gK9cIxJeA5CBU+dW6BMoblqazzde7XJ94v9qo5iQQlAGMPAdOmtmLiBkujMy
    xdbva2oEzOPO2VSG/ZoRmM/M2eL6d1I94fdJRpgxiDaAlK1x7Uwu3uBpQUGolbkTbe4b8e
    FCtANV3IGi1s1a8yAHnVpz2eJiSwpquvsRVy+xZaPnoTQtVKzDX70M85MWDQ
X-ME-Proxy: <xmx:RVW-auxhyab0t7s3z02iRhoKHT1EIkjm79_czEnhBogZMQMfmf1xuA>
    <xmx:RVW-anoiCXPhqe2q-4VFzJGLvqDlRZsNUJubKIlqeJbawB98_Y1PYw>
    <xmx:RVW-ap1ax4YQ5--8un7CYq3k1CBBwYtM1y0Lo9GwlIdVzabJPvnbHw>
    <xmx:RVW-avxkgbaGkU802lODD2WeMcOuytpqSN1ZS2ShszrX5YBJx4AVhg>
    <xmx:RVW-apvfFFplNHWUb09WKbDfG1rfME25WvFe88M6D2PWfmlUWIIFmr14>
Feedback-ID: i559e4809:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Oct 2026 08:42:44 -0400 (EDT)
From: Alice Mikityanska <alice.kernel@fastmail.im>
To: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Alice Mikityanska <alice@isovalent.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH net-next] selftests: net: Fix minor issues in cork_fragsize.py
Date: Thu,  1 Oct 2026 15:42:01 +0300
Message-ID: <20261001124201.584805-1-alice.kernel@fastmail.im>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alice Mikityanska <alice@isovalent.com>

return None is unreachable in check_kernel_config, because the try block
always returns a True or False value, and the except block continues the
loop. The return None was supposed to be outside the for loop, to make
pylint happy by making all the flows of the function return a value
explicitly.

While at it, make the docstring of check_dmesg_clean clearer by
explaining the return values.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260901195714.673548-1-alice.kernel%40fastmail.im
Signed-off-by: Alice Mikityanska <alice@isovalent.com>
---
 tools/testing/selftests/net/cork_fragsize.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/cork_fragsize.py b/tools/testing/selftests/net/cork_fragsize.py
index 7afd643d07ec..ae6be804b7a2 100755
--- a/tools/testing/selftests/net/cork_fragsize.py
+++ b/tools/testing/selftests/net/cork_fragsize.py
@@ -54,7 +54,7 @@ def check_kernel_config(option: str) -> bool | None:
                 return False
         except OSError:
             continue
-        return None
+    return None
 
 
 def assert_debug_kernel() -> None:
@@ -71,7 +71,8 @@ def assert_debug_kernel() -> None:
 
 def check_dmesg_clean(func: str) -> bool:
     '''
-    Check if the given function produced a WARN in dmesg.
+    Check if the given function produced a WARN in dmesg. Returns True if dmesg
+    is clean, i.e. doesn't contain traces of a WARNING in the given function.
     '''
 
     with subprocess.Popen(['dmesg'], stdout=subprocess.PIPE) as dmesg:
-- 
2.55.0

