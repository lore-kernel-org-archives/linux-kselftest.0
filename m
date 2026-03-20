Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517DE3EAC71
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 18:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774031382; cv=none; b=jlNT3S9kQ7Wqht88QDb679DMuf8YoSiFfucLsWzD4eHQin7HYnucNCb+8QT/uax2PqA3xEBUSnf7slNvaY2i7GuOu0MXmiJug5KtOtOoAXl39hUwiMVI9Vtc020dzN2S61yxZkSwvzpSLPEyooxjrc94UlcOUDgqAydsIHYYdgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774031382; c=relaxed/simple;
	bh=CNCvVk8M6cXHeuhKo9e9N7wSVZT50Sy8YkEIIck7oxw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kdsb4UxCh+RThFQw9C150IW80ozN4ARCV3eNARF4rsI9EVo0YqXGNJJDnkYn7TUStusQdcnbB8n5pr1fAOkYD8Oxy7/hAiAGiiiGAZV0jJYTyZJO/Ab1LcwpUv+GajCRQeDIGaO72EUb/b+hdZcZEYUydbZehz49/sNv+mdaApI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WPj7X55w; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WPj7X55w"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486fd27754bso13944355e9.3
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 11:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774031378; x=1774636178; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xhj6iK9mxvXqiBpyK8tX4BgiBzUUg/ToJ+/LCEiKyk8=;
        b=WPj7X55w+Y6s2MWVQlCI8Yj+owhrOT5jlZGwcgAsQPKRj/nN8t4LIfKBwGWF116k/D
         4WSe26YFYdjuJbeBRaQld/VIH7UhTEDwO8ZmXwRAlvdtjfJdBfEn9DlV4W4C4kA8o911
         VVNQs4Wanf5RXLm7aLZrBmklaSou2Hd33vuJRHg963dfJDpZWhKPLeKcEnzV7cSc0Lp+
         M2LCIcTIq/qca4eghkMvRMzGlMaFuGTXJQRsl/lSZM5CRW5clBw0EBoZ0EPC2DE7+MLX
         wOrZ0ZMm2wxbIKABkLXqJzZbTPrp17bvIBFdVeGj24QFGexkZwmhwzECx4RcN69XkNr6
         /31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774031378; x=1774636178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xhj6iK9mxvXqiBpyK8tX4BgiBzUUg/ToJ+/LCEiKyk8=;
        b=mVgSdHoXR8evf07zUNKQiBhzYxY3PQ2skjHWDXisxhSaXeoGQlsahjcIs5x+z/f7UI
         MiZGPMlKmCrBLHOMoKzNkll82gMaiB8ThZ65cST2ICoR5hLHLn98XKDwFjkUi1WvTH4+
         JvD1tgw+Jaw+3PVbk/ynnjaER3tO1LM3fJZbcAQvNKdqZRXjnatUGBqhI3fkKF5S0CHl
         RSx8nJgBBbmcqi0jJedKcK7LC7LZYa4Qvu57B7Z/RgRrFeudbJb0I4xtDPzYsaUuL4Uq
         XLhhrXZKXHsHhcmErD7x2vHHmwolGQAAMw8q8fy9pQCbRnoOnkKmvk48cH80PmheDM3R
         hyeQ==
X-Gm-Message-State: AOJu0YzxEKGuu/O9f74oxMTKOBerAS1yGpFCLOPRlVVdFUXGNPOIBdHG
	nQH43HGZiA/vlviyKrdnZdqBz2GG32xmGQTzMx2vnJJGwGY/+Yuj0rk/a6OoVht9rnkkJwESjkm
	WtbIE
X-Gm-Gg: ATEYQzzkKJpK0fIhH+h+z+bYfIGE4neqyfLNAyAatQzOKR6h8lHXG0efADUcih6BIoX
	NyEASm5mIJMXCHNd6BVk/ATplK5mFApLv9YkdvzgcUZt3PJsMu4YH6NID812iC0NPbnirkd/Ldf
	Y4dq9NXhZidDz61b6eLIQueZlD5X9cvlyXchQIsHstyR+TomIFG/yz4KXBZssBXESVxlvneopCg
	vIhdOxy+7A8ryIrURHzN4518J4xkRXEW6M1VU7kUl1dQEs+fqClO21vI5LLvGv/vQpAJK7T86OU
	tFMA6XMjq7E6rhmbWvTaTA8FMk9oDcwRRaank8A1nHBzLRUI/0f0HUVMAOleV1aW5TtZzhUFmcj
	RsO+UmLrs0ZOllPKIoCcyIURC+BG/KwiYQxDg9OdbeOOS/gEKi+SWrLJS1FvxoctTVC3rrjyLM+
	rUwFZfNZR+NQ==
X-Received: by 2002:a05:600c:c493:b0:485:4388:3492 with SMTP id 5b1f17b1804b1-486fedbd0b0mr62060455e9.11.1774031378372;
        Fri, 20 Mar 2026 11:29:38 -0700 (PDT)
Received: from localhost ([189.99.238.44])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64eabd6dc60sm1903545d50.6.2026.03.20.11.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 11:29:37 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Fri, 20 Mar 2026 15:29:19 -0300
Subject: [PATCH 4/6] selftests/run_kselftest.sh: Allow choosing per-test
 log directory
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260320-selftests-fixes-v1-4-79144f76be01@suse.com>
References: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
In-Reply-To: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
To: Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1774031363; l=3675;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=CNCvVk8M6cXHeuhKo9e9N7wSVZT50Sy8YkEIIck7oxw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGta/eA4GB0RU2QzWdbG6D7/tTx92qA+t+0kDc8F5W+598SHiw+WPZ/kiCt8flBMjTE4/+7KpIW
 5TyEdF0vKTwA=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

The --per-test-log option currently hard-codes /tmp. However, the system
under test will most likely have tmpfs mounted there. Since it's not clear
which filenames the log files will have, the user should be able to specify
a persistent directory to store the logs. Keeping those logs are important
because the run_kselftest.sh runner will only yield KTAP output, trimming
information that is otherwise available through running individual tests
directly.

Allow --per-test-log to take an optional directory argument. Keep the
existing behaviour when the option is passed without an argument, but if
a directory is provided, create it if needed, reject non-directory paths
and non-writable directories, canonicalize it, and have runner.sh write
per-test logs there instead of /tmp.

This also makes relative paths safe by resolving them before the runner
changes into a collection directory.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/kselftest/runner.sh |  3 ++-
 tools/testing/selftests/run_kselftest.sh    | 30 +++++++++++++++++++++++++++--
 2 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
index 3a62039fa621..6e13818fe433 100644
--- a/tools/testing/selftests/kselftest/runner.sh
+++ b/tools/testing/selftests/kselftest/runner.sh
@@ -6,6 +6,7 @@ export skip_rc=4
 export timeout_rc=124
 export logfile=/dev/stdout
 export per_test_logging=
+export per_test_log_dir=/tmp
 export RUN_IN_NETNS=
 
 # Defaults for "settings" file fields:
@@ -189,7 +190,7 @@ run_many()
 		BASENAME_TEST=$(basename $TEST)
 		test_num=$(( test_num + 1 ))
 		if [ -n "$per_test_logging" ]; then
-			logfile="/tmp/$BASENAME_TEST"
+			logfile="$per_test_log_dir/$BASENAME_TEST"
 			cat /dev/null > "$logfile"
 		fi
 		if [ -n "$RUN_IN_NETNS" ]; then
diff --git a/tools/testing/selftests/run_kselftest.sh b/tools/testing/selftests/run_kselftest.sh
index 5f7bce9a640b..fdbbe5b8b079 100755
--- a/tools/testing/selftests/run_kselftest.sh
+++ b/tools/testing/selftests/run_kselftest.sh
@@ -22,7 +22,7 @@ usage()
 	cat <<EOF
 Usage: $0 [OPTIONS]
   -s | --summary		Print summary with detailed log in output.log (conflict with -p)
-  -p | --per-test-log		Print test log in /tmp with each test name (conflict with -s)
+  -p | --per-test-log [DIR]	Print test log in /tmp or DIR with each test name (conflict with -s)
   -t | --test COLLECTION:TEST	Run TEST from COLLECTION
   -S | --skip COLLECTION:TEST	Skip TEST from COLLECTION
   -c | --collection COLLECTION	Run all tests from COLLECTION
@@ -50,7 +50,33 @@ while true; do
 			shift ;;
 		-p | --per-test-log)
 			per_test_logging=1
-			shift ;;
+			if [ -n "$2" ] && [ "${2#-}" = "$2" ]; then
+				per_test_log_dir="$2"
+				if [ -e "$per_test_log_dir" ] && [ ! -d "$per_test_log_dir" ]; then
+					echo "Per-test log path is not a dir:" \
+					     "$per_test_log_dir" >&2
+					exit 1
+				fi
+				if [ ! -d "$per_test_log_dir" ] && \
+				   ! mkdir -p "$per_test_log_dir"; then
+					echo "Could not create log dir:" \
+					     "$per_test_log_dir" >&2
+					exit 1
+				fi
+				per_test_log_dir=$(cd "$per_test_log_dir" && pwd -P)
+				if [ -z "$per_test_log_dir" ]; then
+					echo "Could not resolve per-test log directory" >&2
+					exit 1
+				fi
+				if [ ! -w "$per_test_log_dir" ]; then
+					echo "Per-test log dir is not writable:" \
+					     "$per_test_log_dir" >&2
+					exit 1
+				fi
+				shift 2
+			else
+				shift
+			fi ;;
 		-t | --test)
 			TESTS="$TESTS $2"
 			shift 2 ;;

-- 
2.53.0

