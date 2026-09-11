Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFC94A1E17
	for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 16:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789142830; cv=none; b=GQgx/AHDyBM0i9H6HAMnYLyt54NTg5mgYoQDGwtzf38iucm2TxCpknyihPVAn/bezh4mamYyUlAFCEY0g0FYlvlw90EUzRAQQA8Jcn1wHjhsd3OUkEL8/8slAg9tTJo/5FGGbmqGSvOGjBC8ihaCp9tc+cgepVNg8epboSTUDqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789142830; c=relaxed/simple;
	bh=d0b26vmiDa6XjATQQbrbQCkSzbGsH3WL8tT83agm6AA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qyYIs4o+6GWdmZQWs3NjK7B7k3JvJdK+pSVvw4w2fRw+B9dE8hen2Sw3RFWTi9EmNXhgfsGXHwHJPauuGUvAzN9jYPRLL//dp53ZiQekEIcC1Btn075Lfm28DzDtXZVjVV10dGvntcK1RtQgZLtqInxe12HmjU3XSO0oxyH/Pt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gs.ncku.edu.tw; spf=pass smtp.mailfrom=gs.ncku.edu.tw; dkim=pass (2048-bit key) header.d=gs-ncku-edu-tw.20251104.gappssmtp.com header.i=@gs-ncku-edu-tw.20251104.gappssmtp.com header.b=a4Sjrt5n; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gs.ncku.edu.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gs.ncku.edu.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gs-ncku-edu-tw.20251104.gappssmtp.com header.i=@gs-ncku-edu-tw.20251104.gappssmtp.com header.b="a4Sjrt5n"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2db710396ffso19769555ad.1
        for <linux-kselftest@vger.kernel.org>; Fri, 11 Sep 2026 09:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gs-ncku-edu-tw.20251104.gappssmtp.com; s=20251104; t=1789142828; x=1789747628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AtfvJ4AyUB763MDcXdj9s80UgaBQitUqnV2ZMujP4B0=;
        b=a4Sjrt5nJQXK6KOXRiSTmXJ8jd1Bfarx5Hf0Qx6EwcT2jFjo199FRfj7epQINyvs5/
         qHjlSsqXkBJwTcH4lidzpBDjBa4b9EGtXjJ+NjpzoyWlD1XczPYumXvBIL8dxDp3bOsM
         ZneiWRJAAgUnwi/9k24eXY8OaE/IoOzroCUmeKGi7oaHNcz20RZ5ZcXkxxq5YXiQoMLj
         +4nG8EboqM/hAuMnV0o7aSb0nniyG/gsa1XrVSbzQFR/I3MsQiSPD0mF8ViKXj15dQZ/
         LWHmgnKtGCk8arW6NxvhnNIMJCeS9IW9xnVS9NFOHdLAys9A7BZl5g3a2czJKctl2NRr
         slmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789142828; x=1789747628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AtfvJ4AyUB763MDcXdj9s80UgaBQitUqnV2ZMujP4B0=;
        b=LTLl1ve1jf2gRUO1SwjzjAw2h5tWNjrmGc7pwbzdgILG9mYoaSUnz+NyUd5p+JeKpb
         e8ljDA13fmsqR4rryHsjQQKFtgiW7AciSd/UqMmfXGN/3kFbhKIPvpo9YomKEM85ba7f
         lmyLBFteEMa1DoW0zaY018BYF2aAwme5M7Q71sGatdmSoCnP6OJuTj4AQnzJglZ8SbW0
         o0X2PfMgHn93a62HJ1oqWdjxHL96jK8FmlrhE8PgJ1nlYaVc7LtgdTrmYOuFQ5sZZ2R9
         6Qov9a09ZW8UQ4Ld5HOsA9DTlL7Zcrb+O3XGPv/yQu/1HXB1pgXrodtIpYJ4MuMfPYJz
         KKqA==
X-Gm-Message-State: AFuF++noGi/5Aofa2x7Esk49zTaa5EMRm0FJD+chv6FmtnSUAQJhDesJ
	ef90n0zsE8pKviwi/HpQXsr7WF2XSirkBrh2Y2Wk7Q2YGsH4LZ1EC1IIM8Yo2UkY6yE=
X-Gm-Gg: AYBFou0ndbKjuJsRjJlLO5uEJ2YVbi6rQc2EP/BacEYoYFsfJ32T0UNKec8pfDDKbm9
	7rX8Fk/EfPbX0jGR76RneLs0eCGcGT069/J7cjxIk74PB5Qa3Mr2LdtV4sKMhE3JCcn9vDt5+le
	b5G6FtoN+MSMRLGiL7Sbnhd09rP9+G2GGi+r1kLsahl4FLIFq816K8e08Qj5qGzex6TF52q/RV8
	i3jSnngJcwSV6PqefN9JScTJbYgb4oBbhFn+wBwHI+SaO7BmoPQB0FnF/umGTbqDSTO2v47ezkk
	zBC4JeLlpgAdjNzM18w2RizifyGu896J5/d0LyUJoqWtxT0DCFjI7O/SAi7Vu1glcmDnYsxlUJW
	5xAjvTDbFe6Af/pO/M/BXYiaSZ5F+dxJiK0wH9GOGvpTNmvyPe+tPaPlO4tfgoaPwTNnRV6N5/Q
	4CM0LUD66ql8CpLL8kZ1rlQ5Ce5NwzVxB0aIS2hqIgpubTzJxLn4QAM5yYMhQEJ2DzBSzIuHNJH
	cWEQWM0/TWXHhWJF7KUocQRkJhkDj1FHjHToBc8fg+3d2280wUNDZCcIw==
X-Received: by 2002:a17:903:3d10:b0:2d7:5da6:2af4 with SMTP id d9443c01a7336-2dd0e8a4603mr107761555ad.4.1789142827893;
        Fri, 11 Sep 2026 09:07:07 -0700 (PDT)
Received: from localhost.localdomain (111-240-145-155.dynamic-ip.hinet.net. [111.240.145.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfcefb6sm13883055ad.56.2026.09.11.09.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 09:07:06 -0700 (PDT)
From: shuo huang <f64116045@gs.ncku.edu.tw>
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	jiayuan.chen@linux.dev,
	f64116045@gs.ncku.edu.tw
Subject: [PATCH net-next v2 2/2] selftests: net: Exercise TCP payload verification in udpgso_bench.sh
Date: Sat, 12 Sep 2026 00:06:49 +0800
Message-Id: <20260911160649.51863-3-f64116045@gs.ncku.edu.tw>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911160649.51863-1-f64116045@gs.ncku.edu.tw>
References: <20260911160649.51863-1-f64116045@gs.ncku.edu.tw>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The benchmark script does not exercise TCP payload verification.

Add a verification case for IPv4 and IPv6 using 100 4 KiB payloads.
The payload length is not a multiple of 26, allowing the test to
detect missing per-payload pattern resets.

Wait for the receiver and propagate verification failures. Bound
both processes with timeouts and leave the existing benchmarks
unchanged.

Signed-off-by: shuo huang <f64116045@gs.ncku.edu.tw>
---
 tools/testing/selftests/net/udpgso_bench.sh | 34 +++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tools/testing/selftests/net/udpgso_bench.sh b/tools/testing/selftests/net/udpgso_bench.sh
index 88fa1d53b..d02f206ec 100755
--- a/tools/testing/selftests/net/udpgso_bench.sh
+++ b/tools/testing/selftests/net/udpgso_bench.sh
@@ -8,6 +8,8 @@ readonly YELLOW='\033[0;33m'
 readonly RED='\033[0;31m'
 readonly NC='\033[0m' # No Color
 readonly TESTPORT=8000
+# Avoid a multiple of 26 to detect missing payload resets.
+readonly TCP_VERIFY_LEN=$((4 * 1024))
 
 readonly KSFT_PASS=0
 readonly KSFT_FAIL=1
@@ -79,6 +81,31 @@ run_one() {
 	./udpgso_bench_tx -p "$TESTPORT" ${args}
 }
 
+run_tcp_verify_one() {
+	local tcp_rx_pid
+	local i=0
+	local -r timeout=10
+
+	timeout -k 1 30 ./udpgso_bench_rx -p "$TESTPORT" -t -v -l "$TCP_VERIFY_LEN" &
+	tcp_rx_pid=$!
+
+	while [ "$i" -lt "$timeout" ]; do
+		ss -lnHt "sport = :$TESTPORT" | grep -q . && break
+		i=$((i + 1))
+		sleep 1
+	done
+	if [ "$i" -eq "$timeout" ]; then
+		echo "timed out while waiting for udpgso_bench_rx"
+		return 1
+	fi
+
+	timeout -k 1 30 ./udpgso_bench_tx -p "$TESTPORT" "$@" \
+		-t -s "$TCP_VERIFY_LEN" -M 100 || return $?
+
+	# A successful sender does not imply that payload verification passed.
+	wait "$tcp_rx_pid"
+}
+
 run_in_netns() {
 	local -r args=$@
 
@@ -123,6 +150,10 @@ run_tcp() {
 	echo "tcp zerocopy"
 	run_in_netns ${args} -t -z
 
+	echo "tcp verify"
+	./in_netns.sh "$0" __verify_tcp ${args}
+	kselftest_test_exitcode $?
+
 	# excluding for now because test fails intermittently
 	# add -P option to include poll() to reduce possibility of lost messages
 	#echo "tcp zerocopy audit"
@@ -149,6 +180,9 @@ if [[ $# -eq 0 ]]; then
 elif [[ $1 == "__subprocess" ]]; then
 	shift
 	run_one $@
+elif [[ $1 == "__verify_tcp" ]]; then
+	shift
+	run_tcp_verify_one "$@"
 else
 	run_in_netns $@
 fi
-- 
2.34.1

