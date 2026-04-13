Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04AF3CF049
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 14:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776089001; cv=none; b=naSm2Hg4AuZw6j7eY4ylV7qvw/92MRsDn+DVtXgw14BTXxU5Xb0lHvKsyQmypPymoRmpmrWv22opEFiOT393yiLDC5yD1J1SiLptmUtopC51VEicbl3wnHE6rU+RZJ89w4yGgaaa+TDshfIiaNfh97dLu9ypKA37ek4NNd4llWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776089001; c=relaxed/simple;
	bh=2+zaBpZoxOc4dQ+OqY3EpkdDanuzl/Hoc59VwYsZX5g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bi/tN1hqzPNXuZRdi3pKEu1ZxametIuyBjxiCC7ire9HB3eVzf2viQmf8dVo5+QtPlDzmDeN1usW7xT35Wf/uQsIStcEZ7piy6e4sMaWCI3iycFfJ8Bpk/6rwyEEPV2DDaA43QWXKPJID9qjpcrpMuvN6r/QyBrFvlTuMYslbDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=C6mDGvFc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1VBLQIwS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=C6mDGvFc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1VBLQIwS; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="C6mDGvFc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1VBLQIwS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="C6mDGvFc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1VBLQIwS"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 717485BCE2;
	Mon, 13 Apr 2026 14:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776088997; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=FxrXL8N9v9YPiVpGZ39J+cg0zny+iReTqznI7rQsQHk=;
	b=C6mDGvFcTScsbHFHxDPlQREIzpr9QNjHHepg4llQ+vpDPYwc9A2RlLTYLIepnV3NjzdBL9
	meBq3EVmsbR7/eoqrR8S4BvhOoGJCye6Vzx7m9/b0tTQ6dLDZhEwzqsQIt2MxQI9hBbKwe
	z7a6x1gcUxqjb0CiHN7P18iwdPfQ/Y8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776088997;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=FxrXL8N9v9YPiVpGZ39J+cg0zny+iReTqznI7rQsQHk=;
	b=1VBLQIwSfNd0S+PDdAqEk/NMn7gK/Tc4DJUwUIdkcNEooNguQ/d/olMEJUIpa9kXw3u1yd
	PXkMMgDFwxRImIDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776088997; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=FxrXL8N9v9YPiVpGZ39J+cg0zny+iReTqznI7rQsQHk=;
	b=C6mDGvFcTScsbHFHxDPlQREIzpr9QNjHHepg4llQ+vpDPYwc9A2RlLTYLIepnV3NjzdBL9
	meBq3EVmsbR7/eoqrR8S4BvhOoGJCye6Vzx7m9/b0tTQ6dLDZhEwzqsQIt2MxQI9hBbKwe
	z7a6x1gcUxqjb0CiHN7P18iwdPfQ/Y8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776088997;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=FxrXL8N9v9YPiVpGZ39J+cg0zny+iReTqznI7rQsQHk=;
	b=1VBLQIwSfNd0S+PDdAqEk/NMn7gK/Tc4DJUwUIdkcNEooNguQ/d/olMEJUIpa9kXw3u1yd
	PXkMMgDFwxRImIDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2D20C4AF08;
	Mon, 13 Apr 2026 14:03:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VjD7B6X33GmCZgAAD6G6ig
	(envelope-from <fmancera@suse.de>); Mon, 13 Apr 2026 14:03:17 +0000
From: Fernando Fernandez Mancera <fmancera@suse.de>
To: linux-kselftest@vger.kernel.org
Cc: shuah@kernel.org,
	Fernando Fernandez Mancera <fmancera@suse.de>
Subject: [PATCH] selftests/run_kselftest.sh: fix infinite loop on missing argument
Date: Mon, 13 Apr 2026 16:03:07 +0200
Message-ID: <20260413140307.4178-1-fmancera@suse.de>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Currently, passing an option that requires an argument as the final
parameter without providing the actual argument causes the script to
enter an infinite loop.

Handle this by adding a proper check for the number of positional
parameters.

Signed-off-by: Fernando Fernandez Mancera <fmancera@suse.de>
---
Note: I hit this while automating some testing, I wasted a couple of
hours of CPU cycles + energy
---
 tools/testing/selftests/run_kselftest.sh | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tools/testing/selftests/run_kselftest.sh b/tools/testing/selftests/run_kselftest.sh
index 84d45254675c..2755c6aa367b 100755
--- a/tools/testing/selftests/run_kselftest.sh
+++ b/tools/testing/selftests/run_kselftest.sh
@@ -58,12 +58,24 @@ while true; do
 			per_test_logging=1
 			shift ;;
 		-t | --test)
+			if [ $# -lt 2 ]; then
+				echo "Error: option '$1' requires an argument" >&2
+				usage 1
+			fi
 			TESTS="$TESTS $2"
 			shift 2 ;;
 		-S | --skip)
+			if [ $# -lt 2 ]; then
+				echo "Error: option '$1' requires an argument" >&2
+				usage 1
+			fi
 			SKIP="$SKIP $2"
 			shift 2 ;;
 		-c | --collection)
+			if [ $# -lt 2 ]; then
+				echo "Error: option '$1' requires an argument" >&2
+				usage 1
+			fi
 			COLLECTIONS="$COLLECTIONS $2"
 			shift 2 ;;
 		-l | --list)
@@ -79,6 +91,10 @@ while true; do
 			RUN_IN_NETNS=1
 			shift ;;
 		-o | --override-timeout)
+			if [ $# -lt 2 ]; then
+				echo "Error: option '$1' requires an argument" >&2
+				usage 1
+			fi
 			kselftest_override_timeout="$2"
 			shift 2 ;;
 		-h | --help)
-- 
2.53.0

