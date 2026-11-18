Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.121.94.186
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009231;
	b=tKww49l/od7aIkdU+xsPb0/614miS0Ufc3DcarqQIhWN95Jk5J9TrOuzT0Cu4crYeNkF
	 NmK28NKQz1cv2Iue59oL9x5ipL8PdVFg0yj81r+DB6wPLaNvkzSAcv6V2yhCViMBYadM5
	 y7JfJDKNrAN+IYlJr0XJDszQxjROoQLOwmFWdAMZQBySLQGQlygXWKxJrli7HhIGbLokL
	 dUI9S6hUIASKEmdtC7IzPqeUyZ0a3tu4RZto/Y+CT3WCimt+iqApN4q1k1tC1HCxWtR8c
	 ZYHE522Xucy587s0iAQpFmhKRZh8Z/+2ZvF0/VvKm7CuZm8Gx6dHXs7B0D9Cy0K/eng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009231;
	h=DMARC-Filter:X-KPN-MessageId:Received:DKIM-Signature:X-KPN-MID:
	 X-KPN-VerifiedSender:X-CMASSUN:X-Originating-IP:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=BI33jEtvm9hM9cOU720PxHBBYZwTgrd/OsucSEU82fs=;
	b=emx9DTuTjjJM38s7MjESMmGQr0cspjhnY9PxpZvyPiu742Bg0RdBp8d/BkN61IhNeejk
	 98hVp1KOAxu6OTyuHylXIH6HKI3VMDqZxrJIihammXvApQvqkZsptsBt0p2f1Or+8dY30
	 BdhxQjii4qo6hed9G5OnONoEie3bMS8GiEUex4LrPXWnU1tM2a7EnqSs5zj34SK8U50Km
	 MisJwmuSIexsgDzOXy5UMCopDu//UMTNn/hsntS5vGawYUC4/3e0GeiqwH44DRfzHIRW0
	 OP4WOULXTJs87fffUE7c3a8UhWYBr33c9udDonhmfnkd97PyorjwBwhvNKnGFiU81og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xs4all.nl;
	spf=pass smtp.mailfrom=xs4all.nl;
	dkim=pass header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=sQqPpGrM;
	arc=none smtp.remote-ip=195.121.94.186
Received: from ewsoutbound.kpnmail.nl (unknown [195.121.94.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D93606A32A
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 13:40:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29D93606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=sQqPpGrM
X-KPN-MessageId: 9a7a6d09-e355-11f1-a112-00505699b430
Received: from smtp.kpnmail.nl (unknown [10.31.155.6])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 9a7a6d09-e355-11f1-a112-00505699b430;
	Wed, 18 Nov 2026 14:40:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=to:message-id:content-type:mime-version:subject:date:from;
	bh=BI33jEtvm9hM9cOU720PxHBBYZwTgrd/OsucSEU82fs=;
	b=sQqPpGrMZY9DklwBFVM8OEhe6uKKzTlQIL6ZyCYwMNKzO7UawjbhwRTtECOEh+xCSEYCjmJtfXQED
	 a/CJ5LEfCo/1IhP1+8qs3OOnjtiYuJPUcqbXYWErkl5m44unJuFCbj8x7nr/RHol+uWPbhgLh0IdK4
	 XGpvcBnWZRe5u28Vim3nLgj5DTs4x1DyLCQKo09ZmSpqzxpy9clYoxYpsBUrFFdgjNnpaNSf7Ul7ly
	 M8XWi6AqCgXM7kxKl7pOBp0PkdMqA7dm4WdFuEcBqhqWtDZ3PKQXHBEK7j4tzTxm/OVSBAaBcjiiyu
	 4nUq+pBWyv0MZxUVAT4NFQhKW3yoXjw==
X-KPN-MID: 33|xgS2QU7qxHROxxtczZauv9TGyinZmdO6aa3EZqV7N6W1vKKe+WVO/cliyWR6dXu
 vym96Cyd45ly4KDAcK3nH6K6jav2Rv59QH6gV1zwZZFU=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|eoZC5ivwWKUefejEPjzkVFbhemIvM4BT3ODhanwPGda8A8E726wFuPCvqJcM2Es
 4oykWv3jAyxlBY0arxSMkjQ==
Received: from [192.168.122.1] (unknown [178.226.154.85])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 9a61f0b3-e355-11f1-a6ee-00505699772e;
	Wed, 18 Nov 2026 14:40:22 +0100 (CET)
From: "Jori Koolstra (CIQ)" <jkoolstra@xs4all.nl>
Date: Wed, 18 Nov 2026 08:40:09 -0500
Subject: [PATCH 1/3] selftests: use local variables consistently in
 runner.sh
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
Message-Id: <20261118-kselftest-run-timer-v1-1-53a838b2d62b@xs4all.nl>
References: <20261118-kselftest-run-timer-v1-0-53a838b2d62b@xs4all.nl>
In-Reply-To: <20261118-kselftest-run-timer-v1-0-53a838b2d62b@xs4all.nl>
To: Shuah Khan <shuah@kernel.org>, David Ahern <dsahern@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, 
 Hangbin Liu <hangbin.liu@linux.dev>, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <ricardo@marliere.net>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "Jori Koolstra (CIQ)" <jkoolstra@xs4all.nl>
X-Mailer: b4 0.14.3

run_one() and run_many() assign their working variables without
declaring them local, so they leak into the global namespace of
whichever shell sources runner.sh, i.e. run_kselftest.sh or the
RUN_TESTS recipe in lib.mk.

Declare these variables local so that local is used consistently
throughout the file and the sourcing shell's namespace is not polluted.
This does not add a new requirement on the shell: local is already used
in run_many(), in_netns() and run_in_netns().

Also, obey the convention to use upper case names for variables that are
constant once assigned.

Signed-off-by: Jori Koolstra (CIQ) <jkoolstra@xs4all.nl>
---
 tools/testing/selftests/kselftest/runner.sh | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
index 45fb8ec38493..9b1dad5441ea 100644
--- a/tools/testing/selftests/kselftest/runner.sh
+++ b/tools/testing/selftests/kselftest/runner.sh
@@ -58,13 +58,18 @@ tap_timeout()
 
 run_one()
 {
+	local DIR TEST BASENAME_TEST BASENAME_SANITIZED SETTINGS TEST_HDR_MSG
+	local line field value interpreter stdbuf cmd rc
+
 	DIR="$1"
 	TEST="$2"
 
 	BASENAME_TEST=$(basename $TEST)
 
 	# Reset any "settings"-file variables.
-	export kselftest_timeout="$kselftest_default_timeout"
+	local kselftest_timeout="$kselftest_default_timeout"
+	# Make kselftest_timeout variables available to tests
+	export kselftest_timeout
 
 	# Safe default if tr not available
 	kselftest_cmd_args_ref="KSELFTEST_ARGS"
@@ -91,8 +96,8 @@ run_one()
 	fi
 
 	# Load per-test-directory kselftest "settings" file.
-	settings="$BASE_DIR/$DIR/settings"
-	if [ -r "$settings" ] ; then
+	SETTINGS="$BASE_DIR/$DIR/settings"
+	if [ -r "$SETTINGS" ] ; then
 		while read line ; do
 			# Skip comments.
 			if echo "$line" | grep -q '^#'; then
@@ -100,8 +105,8 @@ run_one()
 			fi
 			field=$(echo "$line" | cut -d= -f1)
 			value=$(echo "$line" | cut -d= -f2-)
-			eval "kselftest_$field"="$value"
-		done < "$settings"
+			eval "local kselftest_$field"="$value"
+		done < "$SETTINGS"
 	fi
 
 	# Command line timeout overrides the settings file
@@ -164,8 +169,8 @@ run_one()
 
 in_netns()
 {
-	local name=$1
-	ip netns exec $name bash <<-EOF
+	local NAME=$1
+	ip netns exec $NAME bash <<-EOF
 		BASE_DIR=$BASE_DIR
 		source $BASE_DIR/kselftest/runner.sh
 		logfile=$logfile
@@ -175,9 +180,9 @@ in_netns()
 
 run_in_netns()
 {
-	local tmplog="/tmp/$(mktemp -u ${BASENAME_TEST}-XXXXXX)"
-	local netns=$(mktemp -u ${BASENAME_TEST}-XXXXXX)
-	local rc
+	local tmplog netns rc
+	tmplog="/tmp/$(mktemp -u ${BASENAME_TEST}-XXXXXX)"
+	netns=$(mktemp -u ${BASENAME_TEST}-XXXXXX)
 
 	ip netns add $netns
 	if [ $? -ne 0 ]; then
@@ -198,8 +203,10 @@ run_in_netns()
 
 run_many()
 {
+	local DIR TEST BASENAME_TEST
+	local pids pid rc
+
 	DIR="${PWD#${BASE_DIR}/}"
-	local rc
 	pids=
 
 	for TEST in "$@"; do

-- 
2.56.1

