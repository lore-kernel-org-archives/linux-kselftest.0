Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.80
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264763;
	b=TtJfGJbL3WMS7q3VJv7GBIv/HnDVP4Vsp1DCmhg918Mogy23wX/E6LC5DLO7RB50Ef0I
	 4h8DIhLV3jodpvK3Sqh2uoKl/r6hzh1jNEG72Ws+kcIHsxU7pihKItv7VCMguABmnxcH9
	 XTsxe3I5E1p0LwsLG0lX4Ab3xc5tw9JglGwP9OdH2nu2R7wnbpSMmgUH8AqeqXJ+HSenr
	 dXUhxJbQolive0BjGFDU5rAEVGgdiI4BTiEv44VYJ/ANkbILdr4bpb/0R9IuOrpS/mNw2
	 6+XrgyKTKvNwlaJcWE4+CumIXSahfgOV/wzPs3OsL8VhZ2xtOax0ul5k6OtLY6lq+xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264763;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=go4dra+4YH06N3EmUqzNTwrDp7mjFjmaeDVnD3tSruE=;
	b=2lnzssAAsRB66JLAqHLjD71x1HmCZRXWVOU0X4MeFj5UHTH/aQ++gfEtbO1XilEiFkWa
	 AA7h8JoU/XkAp47EGWAKkYsTp/EX8LRCqYR8pvpfEWcIkL+TiN5LTf/oTesEgnSprBPsd
	 wM9Rf66bzDT/L17JRGimxXE3je/ZaffEyslLXAj09ohLDa1hg4W1tvTycKHwTr9HcpZz/
	 57zTEk9x4j38dELdImuvqFNKtrnziWscnBwmLH9VjC9P60EespEkBry+CAKN9o0Cl18Av
	 u5v5rCdSPttJ4cboAwIPw9UhHy1GbQXSPSVOOv2wy+1O4+VSzY0tZmrx/rBAgwEkg5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YuiZSbAB;
	arc=none smtp.remote-ip=95.215.58.80
Received: from mta1.migadu.com (out-80.mta1.migadu.com [95.215.58.80])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D0B606A31A
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 09:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39D0B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YuiZSbAB
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DYXaWemXvBwC95FCj8igDWaYEMt1wgMdHlRzj74nyZo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793264760; v=1; x=1793869560;
 b=YuiZSbABTER+omjjyXPzKhHlur2Uqj1Jta1IouI2KDmN4MHDWjbGkTD5cwLw/5v2XlxD8xce
 kvkXCgD9BomAqNyvzox09YHSQLdTyQ72qUwNZxOrQ4RpZdU25z01QqEljCpeJW3NqRJSc6SevDY
 7AMwL0Z+MaFZrhhHJqa9nH9A=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 44560a5e9cf9788f;
	Thu, 29 Oct 2026 09:05:59 +0000
X-Mizu-Trace-ID: 44560a5e9cf9788f
X-Migadu-Flow: FLOW_OUT
From: George Guo <dongtai.guo@linux.dev>
To: pasha.tatashin@soleen.com,
	rppt@kernel.org,
	pratyush@kernel.org,
	shuah@kernel.org
Cc: guodongtai@kylinos.cn,
	kexec@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/liveupdate: Preserve VM workspaces with run-vmtests.sh -k
Date: Thu, 29 Oct 2026 18:05:42 +0900
Message-ID: <20261029090542.13283-1-dongtai.guo@linux.dev>
X-Mailer: git-send-email 2.53.0
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

From: George Guo <guodongtai@kylinos.cn>

run-vmtests.sh -k keeps the test output logs, but vmtest.sh still
removes its workspace and qemu.serial, losing the guest output needed
to debug failures.

Forward -k to vmtest.sh when keeping logs and update the help texts to
match.

Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 tools/testing/selftests/liveupdate/run-vmtests.sh | 7 +++++--
 tools/testing/selftests/liveupdate/vmtest.sh      | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/liveupdate/run-vmtests.sh b/tools/testing/selftests/liveupdate/run-vmtests.sh
index d656ce58c5a7..6f592aec0f85 100755
--- a/tools/testing/selftests/liveupdate/run-vmtests.sh
+++ b/tools/testing/selftests/liveupdate/run-vmtests.sh
@@ -26,7 +26,7 @@ function usage() {
 	cat <<EOF
 $0 [-k] [-o output_dir] [-h]
 Options:
-	-k)	keep logs
+	-k)	keep logs and VM workspaces, including guest serial logs
 	-o)	specify output directory
 	-h)	display this help
 EOF
@@ -48,6 +48,8 @@ function fail() {
 }
 
 function main() {
+	local -a vmtest_args=()
+
 	while getopts 'hko:' opt; do
 		case $opt in
 		k) keep_logs=1 ;;
@@ -59,6 +61,7 @@ function main() {
 	done
 
 	if [ -n "$keep_logs" ]; then
+		vmtest_args+=(-k)
 		if [ -z "$output_dir" ]; then
 			output_dir="$SCRIPT_DIR/results_$(date +%Y%m%d_%H%M%S)"
 		fi;
@@ -74,7 +77,7 @@ function main() {
 
 			printf "  -> %-8s %-24s ... " "$arch" "$test_name"
 
-			"$TEST_RUNNER" -t "$arch" -T "$test_name" &> "$log"
+			"$TEST_RUNNER" "${vmtest_args[@]}" -t "$arch" -T "$test_name" &> "$log"
 			exit_code=$?
 
 			case $exit_code in
diff --git a/tools/testing/selftests/liveupdate/vmtest.sh b/tools/testing/selftests/liveupdate/vmtest.sh
index 69beda6c961d..bd7032c4b122 100755
--- a/tools/testing/selftests/liveupdate/vmtest.sh
+++ b/tools/testing/selftests/liveupdate/vmtest.sh
@@ -40,7 +40,7 @@ Options:
 	-t)	run test for target_arch (aarch64, x86_64)
 	-T)	test name to run (default: luo_kexec_simple)
 	-w)	custom workspace directory (default: creates temp dir)
-	-k)	keep workspace directory after successful test
+	-k)	keep workspace directory
 	-h)	display this help
 EOF
 }

base-commit: 9a6a70aefe77f6fb9ff2b3037dcf87f6dff65c8c
-- 
2.53.0

