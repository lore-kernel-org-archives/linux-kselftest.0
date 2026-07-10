Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5CB3845D0;
	Fri, 10 Jul 2026 18:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783706739; cv=none; b=ged0in46Croao4P5M4TawcI/So4Nyz/xNIPSYw42ypxFtpGvkWP86DXyKhtm61Z6ViNzo8OeZAttbVkVh8V6e4jVeteyEo1Zie1l2ow5d2vkVWtw9IPrAfDo3IW/4AbE6RmphEPPA4ZL7YP6FCkHDQJJgF6fBwB+KWgS5nct9Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783706739; c=relaxed/simple;
	bh=/UfvinGjUKzQZZtwXFBpxnI8oZyMN8LjK5sOgdx882U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qQHc7tM/4CNGq1XXtqRzl+2/aupTle6cNPFONuJXMOHB1eaaPmPel1dfGWpplbr9yeuRiEDYOk39uSf9x+1JZ+Irs0VOElPsRFGpVpIOmwOw25OvBfui3aKBRVdw7Tcn0hyJX6Td/+K2xf0OiwPXXhSrC7dhc5wD0fOjioa/JQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KWskom/Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KWskom/Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7CDD1F00A3A;
	Fri, 10 Jul 2026 18:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783706737;
	bh=6eGa3Yug+9t29482TOj94SVTS8HfGqHTxEBex1s+pkE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KWskom/Q+ZsZMTLzDK8txAlb903tDEUit2Y7pJETGFya/HuI+yOoTZezP9DlxJ0+a
	 sMDItU55yGHyQUR0z20HAEW7wzrdNAZmnQn/8rmFEAFJiYf/rY5/ulRd9Zzzndi+ta
	 hJIjBI4DaYcHUhIyBBHF8NQuOgr/A6Sk8CiSEnjpthdtWsfEaiNCZVceIthICkc9bo
	 5ojpE51V49IMdtvtNmlOq5OTcqhO1IxMQMtMmDWrN8cGP3hoWEozi5aWycca41IlEC
	 FLquHKP05s0qYhYGvR6C3MhIIzAQrgZdQ+actpJpH6rFCgurFOWFKdpYOKtwTMmlY9
	 XCUWbNHhbOc2A==
From: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
Date: Fri, 10 Jul 2026 20:04:47 +0200
Subject: [PATCH net 7/7] selftests: netconsole: ignore busywait errors
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-net-sft-fix-containers-v1-7-a2915c294ef5@kernel.org>
References: <20260710-net-sft-fix-containers-v1-0-a2915c294ef5@kernel.org>
In-Reply-To: <20260710-net-sft-fix-containers-v1-0-a2915c294ef5@kernel.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "Matthieu Baerts (NGI0)" <matttbe@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Breno Leitao <leitao@debian.org>, 
 Andre Carvalho <asantostc@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4108; i=matttbe@kernel.org;
 h=from:subject:message-id; bh=/UfvinGjUKzQZZtwXFBpxnI8oZyMN8LjK5sOgdx882U=;
 b=owGbwMvMwCVWo/Th0Gd3rumMp9WSGLICTaKCygWXLv44/0+bo+Pk9z5y7JYXQw7Pm398ioFIV
 QLT65b5HaUsDGJcDLJiiizSbZH5M59X8ZZ4+VnAzGFlAhnCwMUpABOZ/I6RYZPIhF1au7zKTWV4
 rp6a+Dep9sG7PczPb9Smhz7O+fzgoQ0jw9KWH82zP5xb9296rrq/xNsHOedqneUj4vfsDyiVidr
 tyQgA
X-Developer-Key: i=matttbe@kernel.org; a=openpgp;
 fpr=E8CB85F76877057A6E27F77AF6B7824F4269A073

In these netconsole tests, bash is used with errexit (set -e). It means
that if the busywait timeout, the tests finish without printing an error
message.

It is fine to ignore these errors, because the following validate_xxx
helpers will check the content of the output file, and exit with an
appropriated error message, e.g. FAIL: File was not generated.

Signed-off-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>
---
To: Andrew Lunn <andrew+netdev@lunn.ch>
To: Breno Leitao <leitao@debian.org>
Cc: Andre Carvalho <asantostc@gmail.com>
---
 tools/testing/selftests/drivers/net/netconsole/netcons_cmdline.sh     | 2 +-
 .../selftests/drivers/net/netconsole/netcons_fragmented_msg.sh        | 4 ++--
 tools/testing/selftests/drivers/net/netconsole/netcons_resume.sh      | 2 +-
 tools/testing/selftests/drivers/net/netconsole/netcons_sysdata.sh     | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/netconsole/netcons_cmdline.sh b/tools/testing/selftests/drivers/net/netconsole/netcons_cmdline.sh
index 96d704b8d9d9..4436567abc94 100755
--- a/tools/testing/selftests/drivers/net/netconsole/netcons_cmdline.sh
+++ b/tools/testing/selftests/drivers/net/netconsole/netcons_cmdline.sh
@@ -50,7 +50,7 @@ do
 	# Send the message
 	echo "${MSG}: ${TARGET}" > /dev/kmsg
 	# Wait until socat saves the file to disk
-	busywait "${BUSYWAIT_TIMEOUT}" test -s "${OUTPUT_FILE}"
+	busywait "${BUSYWAIT_TIMEOUT}" test -s "${OUTPUT_FILE}" || true
 	# Make sure the message was received in the dst part
 	# and exit
 	validate_msg "${OUTPUT_FILE}"
diff --git a/tools/testing/selftests/drivers/net/netconsole/netcons_fragmented_msg.sh b/tools/testing/selftests/drivers/net/netconsole/netcons_fragmented_msg.sh
index 0dc7280c3080..fc3db40c1df5 100755
--- a/tools/testing/selftests/drivers/net/netconsole/netcons_fragmented_msg.sh
+++ b/tools/testing/selftests/drivers/net/netconsole/netcons_fragmented_msg.sh
@@ -104,7 +104,7 @@ wait_local_port_listen "${NAMESPACE}" "${PORT}" udp
 # Send the message
 echo "${MSG}: ${TARGET}" > /dev/kmsg
 # Wait until socat saves the file to disk
-busywait "${BUSYWAIT_TIMEOUT}" test -s "${OUTPUT_FILE}"
+busywait "${BUSYWAIT_TIMEOUT}" test -s "${OUTPUT_FILE}" || true
 # Check if the message was not corrupted
 validate_fragmented_result "${OUTPUT_FILE}"
 
@@ -117,6 +117,6 @@ disable_release_append
 listen_port_and_save_to "${OUTPUT_FILE}" &
 wait_local_port_listen "${NAMESPACE}" "${PORT}" udp
 echo "${MSG}: ${TARGET}" > /dev/kmsg
-busywait "${BUSYWAIT_TIMEOUT}" test -s "${OUTPUT_FILE}"
+busywait "${BUSYWAIT_TIMEOUT}" test -s "${OUTPUT_FILE}" || true
 validate_fragmented_result "${OUTPUT_FILE}"
 exit "${ksft_pass}"
diff --git a/tools/testing/selftests/drivers/net/netconsole/netcons_resume.sh b/tools/testing/selftests/drivers/net/netconsole/netcons_resume.sh
index cb59cf436dd0..cec6afaba4a3 100755
--- a/tools/testing/selftests/drivers/net/netconsole/netcons_resume.sh
+++ b/tools/testing/selftests/drivers/net/netconsole/netcons_resume.sh
@@ -107,7 +107,7 @@ do
 	# Send the message
 	echo "${MSG}: ${TARGET}" > /dev/kmsg
 	# Wait until socat saves the file to disk
-	busywait "${BUSYWAIT_TIMEOUT}" test -s "${OUTPUT_FILE}"
+	busywait "${BUSYWAIT_TIMEOUT}" test -s "${OUTPUT_FILE}" || true
 	# Make sure the message was received in the dst part
 	# and exit
 	validate_msg "${OUTPUT_FILE}"
diff --git a/tools/testing/selftests/drivers/net/netconsole/netcons_sysdata.sh b/tools/testing/selftests/drivers/net/netconsole/netcons_sysdata.sh
index 3fb8c4afe3d2..7089f7bd1e34 100755
--- a/tools/testing/selftests/drivers/net/netconsole/netcons_sysdata.sh
+++ b/tools/testing/selftests/drivers/net/netconsole/netcons_sysdata.sh
@@ -197,7 +197,7 @@ function runtest {
 	# Send the message
 	taskset -c "${CPU}" echo "${MSG}: ${TARGET}" > /dev/kmsg
 	# Wait until socat saves the file to disk
-	busywait "${BUSYWAIT_TIMEOUT}" test -s "${OUTPUT_FILE}"
+	busywait "${BUSYWAIT_TIMEOUT}" test -s "${OUTPUT_FILE}" || true
 }
 
 # ========== #

-- 
2.53.0

