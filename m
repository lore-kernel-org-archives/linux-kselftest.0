Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.121.94.185
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173951;
	b=dd1Cqcy7PSstQRJP1bQTAjSjl/+fxmzMmXpprBbaz2KzXa6q6IGPF0ktGj0yU0GufvK9
	 qs+W4/1yB8gi+7Y5bmqA9orRvPT0FrRFwPmeIi3IVdZNqo5Gx/uy7tyxcWQYGWhWInrRu
	 y/AaozQar0y+c9qSFMN0psPl9LvE/22lTxbDZUv+OQkU3IoHxNnArTliJHMI8MtklGckO
	 q4LKaejRjTKjwRpvpC0Sa4OaHW13hj7QCTas6Wda4RlplfA47EUpIhn8QRaKte3EP5BeK
	 DdofAkr0bWirmsW4P8fbOlqfNw5PK51SCxl7aqkD/xsPqawLrHuN/easFS3QXZr+5Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173951;
	h=DMARC-Filter:X-KPN-MessageId:Received:DKIM-Signature:X-KPN-MID:
	 X-KPN-VerifiedSender:X-CMASSUN:X-Originating-IP:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=X4VnXpj8BOp/84RYSqb9RD1NR26aXGdG+62mqsHgG2I=;
	b=J2KuHu+8iuv9UcOTriiIhp3DacLub7VvZ+iO8n72U/X2EAIkeQAt9kwCMfBsXwlo4yHx
	 o2rMKFqjQ9PnPYfmUCZxgvwWNNQZOvw0ZM0qY+II3hYQSdi404Pv6Cd1aLUQS+IKo+Mw6
	 YBFmaYDRku76dihdi3tR1feePZB92/uyi4Ugw1Y9v3CMjLb48eMl8p/8pOk0e8cqp4nTB
	 9QOyMY0DdpKUo577NJ/snEIfo1gY47TLX00dMNIB+YYJdGzmIvtiG938r/wfc7VFDeFSv
	 e2s4m0evxWIwIxJyVQQ2Ky5x4Z8qUFLmtP5WS/45klDlFERwrIor2rpzv5TPa//bAKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xs4all.nl;
	spf=pass smtp.mailfrom=xs4all.nl;
	dkim=pass header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=DhToyD9h;
	arc=none smtp.remote-ip=195.121.94.185
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.185])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1297C606A33F
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 11:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1297C606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=DhToyD9h
X-KPN-MessageId: 1f3febcd-e4d5-11f1-964c-005056999439
Received: from smtp.kpnmail.nl (unknown [10.31.155.7])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 1f3febcd-e4d5-11f1-964c-005056999439;
	Fri, 20 Nov 2026 12:25:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=to:message-id:content-type:mime-version:subject:date:from;
	bh=X4VnXpj8BOp/84RYSqb9RD1NR26aXGdG+62mqsHgG2I=;
	b=DhToyD9hTuwJAok+CijUGf+gou/w2wHowMs39YRlFWslxQsJsztzLXrb0MHOd5YZgoHU1jBmE1OSd
	 dyvPwRRA5iyKcNgGZ8Hhc0/z6ce8QAMrcpucJ8gJm4E/F3GNRfjMZz3krJ+kCmrOySLpg58iLY6mxC
	 6zgXyO2UFse6/AvQ3+rI9AVxZpYsI3VTDOdReMib7ZaTUYp6V+QPcjKSGv1b/a7h2svLtpf2ucrx3J
	 DQdAim+mZydiSQ9LM2eTdf331EkX7zaTf+8gJY1BtTnpqPBWEhO1yV02jnCBmoXaNmdMCyItQXDTmh
	 NkNYrLcNvRqmoIi9laDvbYsVhk4dbXA==
X-KPN-MID: 33|AfKcGodE8Ks4PDwAX4ZoyD6fS84MGEA8DT4fXXhyL6lp2a8cv0VA1NqSM1A//xu
 1/YUMqbamdTvynde+1lMyuha+t4oXtqT5BbjvP5r9cjQ=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|8I44amXvY1qoWATXCzW1o6BQSfTYdiVdA4yq7N9zxPrmy9xHUhfKcP1p+yteCPu
 2KRxwF+vF8+WAjaGlcE6VzQ==
Received: from [192.168.1.167] (unknown [178.226.154.85])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 1f234144-e4d5-11f1-92e0-005056998788;
	Fri, 20 Nov 2026 12:25:42 +0100 (CET)
From: "Jori Koolstra (CIQ)" <jkoolstra@xs4all.nl>
Date: Fri, 20 Nov 2026 06:25:29 -0500
Subject: [PATCH v2 2/2] selftests: add option to print the time spent per
 test
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-kselftest-run-timer-v2-2-9802690a370b@xs4all.nl>
References: <20261120-kselftest-run-timer-v2-0-9802690a370b@xs4all.nl>
In-Reply-To: <20261120-kselftest-run-timer-v2-0-9802690a370b@xs4all.nl>
To: Shuah Khan <shuah@kernel.org>, David Ahern <dsahern@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, 
 Hangbin Liu <hangbin.liu@linux.dev>, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <ricardo@marliere.net>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "Jori Koolstra (CIQ)" <jkoolstra@xs4all.nl>
X-Mailer: b4 0.14.3

There is currently no way to see how long each test took when running
kselftests through run_kselftest.sh. This information is useful for
CI/CD systems.

Add a -T/--timed option to run_kselftest.sh. When it is set, run_one()
prints a KTAP diagnostic line with the elapsed wall-clock time just
before the result line of each test that is actually run, e.g.:

  # selftests: timers: nanosleep
  # time: 12.34s
  ok 3 selftests: timers: nanosleep

Signed-off-by: Jori Koolstra (CIQ) <jkoolstra@xs4all.nl>
---
 tools/testing/selftests/kselftest/runner.sh | 20 ++++++++++++++++++++
 tools/testing/selftests/run_kselftest.sh    |  8 ++++++++
 2 files changed, 28 insertions(+)

diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
index bbb2e61f323c..e4d05c7bfcd4 100644
--- a/tools/testing/selftests/kselftest/runner.sh
+++ b/tools/testing/selftests/kselftest/runner.sh
@@ -16,6 +16,7 @@ export timeout_rc=124
 export logfile=/dev/stdout
 export per_test_logging=
 export per_test_log_dir=/tmp
+export per_test_timing=
 export RUN_IN_NETNS=
 
 # Defaults for "settings" file fields:
@@ -56,6 +57,16 @@ tap_timeout()
 	fi
 }
 
+# Print the system uptime in hundredths of a second.
+uptime_cs()
+{
+	local up idle
+
+	read up idle < /proc/uptime
+	# Prefix the fraction with 1 so that a leading 0 isn't parsed as octal.
+	echo $((${up%.*} * 100 + 1${up#*.} - 100))
+}
+
 run_one()
 {
 	DIR="$1"
@@ -140,10 +151,18 @@ run_one()
 			fi
 		fi
 		cd `dirname $TEST` > /dev/null
+		if [ -n "$per_test_timing" ]; then
+			start=$(uptime_cs)
+		fi
 		(((( tap_timeout "$cmd" 2>&1; echo $? >&3) |
 			tap_prefix >&4) 3>&1) |
 			(read xs; exit $xs)) 4>>"$logfile"
 		rc=$?
+		if [ -n "$per_test_timing" ]; then
+			elapsed=$(($(uptime_cs) - start))
+			ktap_print_msg "$(printf 'time: %d.%02ds' \
+				$((elapsed / 100)) $((elapsed % 100)))"
+		fi
 		case "$rc" in
 		"$KSFT_PASS")
 			ktap_test_pass "$TEST_HDR_MSG";;
@@ -170,6 +189,7 @@ in_netns()
 		source $BASE_DIR/kselftest/runner.sh
 		logfile=$logfile
 		kselftest_override_timeout=$kselftest_override_timeout
+		per_test_timing=$per_test_timing
 		run_one $DIR $TEST
 	EOF
 }
diff --git a/tools/testing/selftests/run_kselftest.sh b/tools/testing/selftests/run_kselftest.sh
index e11b0e93ba41..0f2a8c619a9c 100755
--- a/tools/testing/selftests/run_kselftest.sh
+++ b/tools/testing/selftests/run_kselftest.sh
@@ -32,6 +32,7 @@ Usage: $0 [OPTIONS]
   -n | --netns			Run each test in namespace
   -h | --help			Show this usage info
   -o | --override-timeout	Number of seconds after which we timeout
+  -T | --timed			Print the time spent on each test
 EOF
 	exit $1
 }
@@ -101,6 +102,13 @@ while true; do
 		-o | --override-timeout)
 			kselftest_override_timeout="$2"
 			shift 2 ;;
+		-T | --timed)
+			if [ ! -r /proc/uptime ]; then
+				echo "Timing tests requires /proc/uptime" >&2
+				exit 1
+			fi
+			per_test_timing=1
+			shift ;;
 		-h | --help)
 			usage 0 ;;
 		"")

-- 
2.56.1

