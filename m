Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56348411618;
	Mon,  2 Mar 2026 14:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772460829; cv=none; b=g7Ejp5PGLIB+ew5fSMiJTXSpyX5e1b9Urj/Qkq1bgirW7B7cRbMSDxWuVENM6kV08ffqctYTCE/IosmuE3aSEuypeAAScGPjCTDcmuR++evC9hzZ9o8j5zu64MzOeF7MD7swiAtUdL0VmTrQrv2w5+o1wEOYYQFd2a+F30sT8Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772460829; c=relaxed/simple;
	bh=4MPhmuFauddjecmuhKrvYh9Gq/gX6TMzwOAi+PqtoDU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pztl5zJdRP3UCl2lfjH21fb6Khb4oDy0ZD6+l/Tufr+ILTtuXrcwOEfjj56Z+rEfeJIpVnvGZUssh++mGPWWT73xHTbWzHfQ5IlbZBhDOiKEcS9rzvT6UO2MVUzOu226H8jvAAibNKaRBjnryA2GeXO0MuW1fqFdO3yQ8t5Q8Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=J6xAj9bV; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FTx4rgzz; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="J6xAj9bV";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FTx4rgzz"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772460825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nz4S9HMfmE/pxBD+ci9S4gKmVV+qW/+XzEZ/axWn09E=;
	b=J6xAj9bVu/2FB8KXyt5N/T1Q/iTzgB8xjEHT+r13oD+VMcoEiIol8mF7W0WxVJHr0mmr66
	7NPyOqqg6/sibpXePHeuxDnITXos0OfHicF/6qeRl6DCvrYeFLY5vcgHN+A73G98EhpYLp
	mlK3QlslawyC4z2/AsY+RT2wZKef7gLaoDKCV6iuPc+lcwPBJ2mpWjM/KwJgh2taTiKO6y
	DW38SXMq5Lr+wUfPp8pW8qvpTVemMGgZ/YbEpINcUodGvwydVQ4/6hzbyI6rEdBn385EFw
	CC0LxSpD/FEacbfsIEkqeUQ6+Qu0XntYyy5a7EYzyA4WnhBZzBWeReg5CXSl2A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772460825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nz4S9HMfmE/pxBD+ci9S4gKmVV+qW/+XzEZ/axWn09E=;
	b=FTx4rgzz6yZ/No0B/UbUwDHHjgYasMIHTQfuLZ1XsjsnIDWZCVlRaOpQcrVXGKolwixqmw
	GflE35mWmMeUp0CQ==
Date: Mon, 02 Mar 2026 15:13:31 +0100
Subject: [PATCH v2 4/5] selftests: harness: Detect illegal mixing of
 kselftest and harness functionality
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260302-kselftest-harness-v2-4-3143aa41d989@linutronix.de>
References: <20260302-kselftest-harness-v2-0-3143aa41d989@linutronix.de>
In-Reply-To: <20260302-kselftest-harness-v2-0-3143aa41d989@linutronix.de>
To: Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
 Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Yuwen Chen <ywen.chen@foxmail.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772460823; l=1644;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=4MPhmuFauddjecmuhKrvYh9Gq/gX6TMzwOAi+PqtoDU=;
 b=kxqs1WsNQxLFrWuW8rVCeGF90uHB4kMwr3SzOWuGmIip2nrZq9GbAkwvLNy9Pqo1g9uPgbhhq
 1KT0er8qj3wDNp1gFLslPwgAyPJtLsBjd9oo1GL8CVCFH21zQWUYDu7
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Users may accidentally use the kselftest_test_result_*() functions in
their harness tests. If ksft_finished() is not used, the results
reported in this way are silently ignored.

Detect such false-positive cases and fail the test.

A more correct test would be to reject *any* usage of the ksft APIs but
that would force code churn on users.

Correct usages, which do use ksft_finished() will not trigger this
validation as the test will exit before it.

Reported-by: Yuwen Chen <ywen.chen@foxmail.com>
Link: https://lore.kernel.org/lkml/tencent_56D79AF3D23CEFAF882E83A2196EC1F12107@qq.com/
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

---
This is intentionally a Link tag over a Closes tag, as the real fix will
be to the selftests.
---
 tools/testing/selftests/kselftest_harness.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
index 16a119a4656c..53e9e3d259dc 100644
--- a/tools/testing/selftests/kselftest_harness.h
+++ b/tools/testing/selftests/kselftest_harness.h
@@ -1222,7 +1222,16 @@ static void __run_test(struct __fixture_metadata *f,
 		t->exit_code = KSFT_FAIL;
 	} else if (child == 0) {
 		setpgrp();
+
+		/* Reset state inherited from the harness */
+		ksft_reset_state();
+
 		t->fn(t, variant);
+
+		if (__test_passed(t) && (ksft_get_fail_cnt() || ksft_get_error_cnt())) {
+			ksft_print_msg("Illegal usage of low-level ksft APIs in harness test\n");
+			t->exit_code = KSFT_FAIL;
+		}
 		_exit(t->exit_code);
 	} else {
 		t->pid = child;

-- 
2.53.0

