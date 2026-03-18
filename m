Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406483793B1
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 08:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773821315; cv=none; b=T2AxOsZxebO9uie2SD84sp4W/KT74S2PHukNud/wJaKCCYkz4yqvFzZl2WAyOtrtfRciMPvaP3tbcWTYnBgsOXbvvdsy4Xi3clv3Sl4wfwujBbZC0vjUDytgDC7+6wy9gycVWe59ILqUiWtHnZdLq6ZNDiVyJOZoXWQl578uKss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773821315; c=relaxed/simple;
	bh=WZCLNBZHWWXdL1zyBg1VCFFXE4RKSCCftTWDOxU/ID8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Lx3O6krpnnS+a3i8v4wkXGIMyP0GWGVbcztAsIniHl9n1GTkYaGEBvfqEyJ7vmZR/UAPBthUUZioF8Xsm2ZB4SMmDUWVd5SkGnq0hz4pbswLkvzXdd2gXphErehJJrN7O9AEEEp9vTHSRi6l07zP08Gd7SNq5v9C+q0Zndrj/SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--hmazur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EV19E+wN; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--hmazur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EV19E+wN"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-485350666bfso54658845e9.3
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 01:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773821313; x=1774426113; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=z8Gha2+WTAeSMujj0C8T883d3UysVnYoJpLxN5p/t4E=;
        b=EV19E+wNiBKlQVlWMT8l8lqPH7KLIREENFd4GV+06UBYlj4vk2cHsYXV7KqOtLBDWh
         OhcnBGYS5YHiBMXWPwuJ1ykueLeRdgyG9C4dNRN45QDdCyNSRhsnX7jZX/2vclAf5rJE
         WllKnE8p15uid8f+Bw+s161Sa+2TYRFNYOv5wZSA2vsjKqZRKQsy/hmJSmSVyo2B52u2
         25WZURtXvjT6UgXKH0aTmm9wtsfJ4Fkvfxu4jiUhMIPTRrs589crYoVxBWwT7/ciU/c7
         2DrkKFzRXKT/GFVFsLBRnWrHpszQTNMQFb1pfVgkp9ZfRqUu65UgQJmiEzm3VCjyJ3pe
         Z0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773821313; x=1774426113;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z8Gha2+WTAeSMujj0C8T883d3UysVnYoJpLxN5p/t4E=;
        b=cS1hac4spQmHgvYqcmwZfaY8coDUkkXBAis95i574iS8jl44aa3pwgKiYffC3UU7l+
         Q+KDaA/mpVZAgtb4IzYBlSCkUy9BREy/VxoIzOIpDUyC2AcK4iTCDFJ1uBlsbOlHvKKN
         ZaiYZaAhA48TfKVLcyHQkesAL0u/NfqL8V+iuTS4GIvYsxIzcT6dBfZA2D66Ast/q5Yc
         gwxoQxCbFdYvnIBgxcCqIMIikv3qafucKNcE4uHZBdoBLIWiMAnGynYbfThd/0yYTQSg
         yTBjXQJNSlKbb3jq5uw3DS8D/nf6Q9SuznQklzvH7CQ4UO/uEBemnvv3UB6LW8bGaKOG
         0erA==
X-Forwarded-Encrypted: i=1; AJvYcCVSEujEDEUBe/afK2jC3pJceheUfHbFDSVmqXOMQwqgpEEDznJ17kvO/LIcsZiAhu0ecOLFdHs7ECGRANwh3rw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5HsgCq+t3NGb7oJHQ6hPBVXXYTz+1hQaHDyoIaDQXsQ2+Vgj5
	b94gXOOR94X36y/TyA2/IIvTwJDbGPc1PWZgst8+1rjaZZhMn6ZsHEUkYoGcKK5yBi8I22kgxx2
	KH07yCA==
X-Received: from wmcm13.prod.google.com ([2002:a7b:ce0d:0:b0:485:3f41:e111])
 (user=hmazur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b14:b0:480:2521:4d92
 with SMTP id 5b1f17b1804b1-486f445e260mr35699725e9.24.1773821312556; Wed, 18
 Mar 2026 01:08:32 -0700 (PDT)
Date: Wed, 18 Mar 2026 08:08:25 +0000
In-Reply-To: <20260318080825.3063959-1-hmazur@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260318080825.3063959-1-hmazur@google.com>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
Message-ID: <20260318080825.3063959-2-hmazur@google.com>
Subject: [PATCH v1 1/1] selftests/cpu-hotplug: Make the script complaint with
 sh shell
From: Hubert Mazur <hmazur@google.com>
To: Shuah Khan <shuah@kernel.org>, Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: Slawomir Rosek <srosek@google.com>, Lukasz Majczak <lmajczak@google.com>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hubert Mazur <hmazur@google.com>
Content-Type: text/plain; charset="UTF-8"

The script uses by default the bash shell that is inaccessible in
the x86 embedded devices. This leads to the syntax errors. To mitigate
this, change the interpreter to /bin/sh and properly assign the
FUNCNAME variable for each of the functions as 'sh' doesn't set this
env. Change the conditional check for being a root from not
existent UID and replace with command execution "id -u".

Signed-off-by: Hubert Mazur <hmazur@google.com>
---
 tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh b/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh
index 6232a46ca6e1..9d5d61413443 100755
--- a/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh
+++ b/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
 
 SYSFS=
@@ -10,7 +10,7 @@ prerequisite()
 {
 	msg="skip all tests:"
 
-	if [ $UID != 0 ]; then
+	if [ $(id -u) -ne 0 ]; then
 		echo $msg must be run as root >&2
 		exit $ksft_skip
 	fi
@@ -99,6 +99,7 @@ offline_cpu()
 
 online_cpu_expect_success()
 {
+	FUNCNAME="online_cpu_expect_success()"
 	local cpu=$1
 
 	if ! online_cpu $cpu; then
@@ -112,6 +113,8 @@ online_cpu_expect_success()
 
 online_cpu_expect_fail()
 {
+
+	FUNCNAME="online_cpu_expect_fail()"
 	local cpu=$1
 
 	if online_cpu $cpu 2> /dev/null; then
@@ -125,6 +128,8 @@ online_cpu_expect_fail()
 
 offline_cpu_expect_success()
 {
+
+	FUNCNAME="offline_cpu_expect_success()"
 	local cpu=$1
 
 	if ! offline_cpu $cpu; then
@@ -139,6 +144,7 @@ offline_cpu_expect_success()
 offline_cpu_expect_fail()
 {
 	local cpu=$1
+	FUNCNAME="offline_cpu_expect_fail()"
 
 	if offline_cpu $cpu 2> /dev/null; then
 		echo $FUNCNAME $cpu: unexpected success >&2
-- 
2.53.0.959.g497ff81fa9-goog

