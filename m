Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC83F2BE63F
	for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 23:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781740677; cv=none; b=RZdTCw053gSJbjjjCay69M0xMQ1mqNwrRtyTMjiXkcEV8xcb+6OWKR+VNAOeFBjEY7gCReD41JnL4FHynJcNSA/Lr2NZcF/p8kdFo8DLxE+WD/XYXPOuexGpOHfpJbNF/u3zvTaPE7xf7DyD7NLkW0khCSP3VAdeT6dkoLIhjdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781740677; c=relaxed/simple;
	bh=uONPstQ4d6oDyxpvMnrFgUw5bKhUN3do8K+jqvn+XLY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IE7Ux/dF2/g0pQvD30yKkQKRp0rVGrBXI/FM7LsIbwkDxQf8tWJNVB+mVO/w4X7xM3t8LLehIEy8E8KnX21PVPNrcBT63Obpa5aM/24SIr1HLy5OLZyb/hAsFof06iAxtIwh0fLqzp7krjKKN3dA7/F86rcGl62CExnlkwnbu3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rcpassos.me; spf=pass smtp.mailfrom=rcpassos.me; dkim=pass (2048-bit key) header.d=rcpassos.me header.i=@rcpassos.me header.b=drOgPepI; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=sNYQW9Wd; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rcpassos.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rcpassos.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rcpassos.me header.i=@rcpassos.me header.b="drOgPepI";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="sNYQW9Wd"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=drOgPepISOhSApwkGZSLNy4wC+Mru5P5YFr875bZJGsPoNaANtw6VgtTA/KVWibiKZtS76KxySzTSa5aOFORHW9eIUmcgg+o1YpXlQE8lW0BWlvDSbjK3bkZSaSlr+6jFqYAgKozD1sprDeCE9tm43vtaEC1zlfxlKoB8fxgiJxzvG3/sZxWwW8EXcqCU9MzLZmblv10GYiaMSzIau400U3AoEg4KkvfatbtPbfxP87iU9B+9sPzJ6oLpnIO69yqow2I+KDdqZdOrD9kf6x1ZdJ6kbXoQJanGi3yhWsTf6HUX8WXQ1U/xs14WhSb3FZ3wCPBBUkOVxZgR8qJBwuGuA==; s=purelymail1; d=rcpassos.me; v=1; bh=uONPstQ4d6oDyxpvMnrFgUw5bKhUN3do8K+jqvn+XLY=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=sNYQW9WdipBAaK5mC75gG6piPH4QrVTvUVFnaLdesA4CV04aEm2fz6GXTpxLNp5HzrUnUNhVCUkJnkc5+MyIgL5kopwym7f6ijqbbkpsi7xFqi6HmCXW2t7dou14o10xH+80OMH6I0XTRO7OomoTZVaaKlaojozqddplTZstJH7mVws8yrqLPa14VFf472wL+kI5lfmOu2ydizU2p1P8ow3Vrmqwec7botC04EZM30xmMEvfbH6mZtmLid/xO4w31CsLQY8NyFmb7w7MulCw/nQaR3ZagluPMFFV2koOJ0zAdC5qKSfAxYgfGtwq0FYGW2hMwng+1dDDF+RKbdnppQ==; s=purelymail1; d=purelymail.com; v=1; bh=uONPstQ4d6oDyxpvMnrFgUw5bKhUN3do8K+jqvn+XLY=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 45355:7809:null:purelymail
X-Pm-Original-To: linux-kselftest@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -30342446;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Wed, 17 Jun 2026 23:57:50 +0000 (UTC)
From: Rafael Passos <rafael@rcpassos.me>
To: shuah@kernel.org,
	corbet@lwn.net
Cc: Rafael Passos <rafael@rcpassos.me>,
	skhan@linuxfoundation.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH] kselftest docs: remove reference to obsolete/archived wiki
Date: Wed, 17 Jun 2026 20:57:26 -0300
Message-ID: <20260617235740.74029-1-rafael@rcpassos.me>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

This link in the docs point to a wiki that is no longer active.

The wiki was moved to archive.kernel.org, and there is a warning:
"OBSOLETE CONTENT This wiki has been archived and the content is
no longer updated."

Signed-off-by: Rafael Passos <rafael@rcpassos.me>
---

 Documentation/dev-tools/kselftest.rst | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tool=
s/kselftest.rst
index d7bfe320338c..64c0ec7428a2 100644
--- a/Documentation/dev-tools/kselftest.rst
+++ b/Documentation/dev-tools/kselftest.rst
@@ -15,11 +15,6 @@ able to run that test on an older kernel. Hence, it is i=
mportant to keep
 code that can still test an older kernel and make sure it skips the test
 gracefully on newer releases.
=20
-You can find additional information on Kselftest framework, how to
-write new tests using the framework on Kselftest wiki:
-
-https://kselftest.wiki.kernel.org/
-
 On some systems, hot-plug tests could hang forever waiting for cpu and
 memory to be ready to be offlined. A special hot-plug target is created
 to run the full range of hot-plug tests. In default mode, hot-plug tests r=
un
--=20
2.53.0

