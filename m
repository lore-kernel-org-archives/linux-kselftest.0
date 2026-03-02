Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD4E401490;
	Mon,  2 Mar 2026 14:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772460829; cv=none; b=iNDWwV8SGq4EpMYg0+y9vASszveq0te3BUxmvtOqtWjdLUup7VgUipVu7ctXtT+q2WG3QyuoH2teND4JxIh91aQ97Yf7gKbUeOqloj3PPGUqJn2fCkGXDFBzdyfWVgidqyPnQ1Wsafqj5p/wNJ3Zm8qElgJi4f4xzjn5lKZPCwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772460829; c=relaxed/simple;
	bh=jnLplW2RSbMejFkZ7e0CfafIL+qcW1ehsMmlyoyXM4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O0BoZy/JRej255zMR0tkLFIATtbjiuxR4TXG3SxzITWBtsIJjAs/iaLv04LehLW7flqV1pYdFbHdua7s7xL8OOChNEBK+pycAbzE4RNrlVq92AvaNbnCCXRYvnMxG7WIbh9b8nfyvrf8FcF523GzOPBR+h0rBlJsRWNdWAxOHp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=twNWq7WY; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3WyBdQOF; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="twNWq7WY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3WyBdQOF"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772460825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=amKHRDjcBb059S7pHir3E4X/PvDTUgafXu6Cdhxwago=;
	b=twNWq7WY3ANYd2tSVtrw+5riukKIyeKuKbSwbyqDdcvPCAyBKUSzZ4gzpSj4xTQBbYiUdn
	RL4emi4FPtQ1e196nhyo1QsEKvaAcDCAY1xn5ImE+0hoxqbRTVeuqGSYcv/aiu8zdYV4eI
	u7nfplEI9tv7ymu6CLj0Dg7b20ElqUefBei98zHcO5VIbFm486SFu1l2Wt4TqrF+Ko5ocG
	LYnhhCezMzApC9gR7ybTwK/gij8VCo19vwrGH3/JrDc+0EWZ8ICJr2BSFhaPl5aHN1yY+j
	Q6igPdlLQ+SqZtQOSSqUDeyTBLTmAzfXG0VmWm2LAK7jE//dpKWU4mscHx3WpQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772460825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=amKHRDjcBb059S7pHir3E4X/PvDTUgafXu6Cdhxwago=;
	b=3WyBdQOFR5NidypxuvSEa23gN1meVzlnnjsWKS0Vwd8YOSRUkaKLzeT/GskKr/LiOfr/GY
	t7b0mxz4rxOCchBQ==
Date: Mon, 02 Mar 2026 15:13:30 +0100
Subject: [PATCH v2 3/5] selftests: kselftest: Add ksft_reset_state()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260302-kselftest-harness-v2-3-3143aa41d989@linutronix.de>
References: <20260302-kselftest-harness-v2-0-3143aa41d989@linutronix.de>
In-Reply-To: <20260302-kselftest-harness-v2-0-3143aa41d989@linutronix.de>
To: Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
 Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772460823; l=947;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=jnLplW2RSbMejFkZ7e0CfafIL+qcW1ehsMmlyoyXM4A=;
 b=t2EeKcEMJ83k8Edj1IH8WXLF6Opdf9G7qjLT2DkIYwhoKyYTOsxqVtBCtoWhNKKWTdZCxdu/w
 F7CH2BY6hgiB745qDEcTOgkoVA7HIJ7h5+FCS+n6oyfFgqURXvR7yW3
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Add a helper to reset the internal state of the kselftest framework.
It will be used by the selftest harness.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 tools/testing/selftests/kselftest.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/testing/selftests/kselftest.h b/tools/testing/selftests/kselftest.h
index 1e7e73f77fa7..6d809f08ab7b 100644
--- a/tools/testing/selftests/kselftest.h
+++ b/tools/testing/selftests/kselftest.h
@@ -476,4 +476,15 @@ static inline int ksft_min_kernel_version(unsigned int min_major,
 	return major > min_major || (major == min_major && minor >= min_minor);
 }
 
+static inline void ksft_reset_state(void)
+{
+	ksft_cnt.ksft_pass = 0;
+	ksft_cnt.ksft_fail = 0;
+	ksft_cnt.ksft_xfail = 0;
+	ksft_cnt.ksft_xpass = 0;
+	ksft_cnt.ksft_xskip = 0;
+	ksft_cnt.ksft_error = 0;
+	ksft_plan = 0;
+}
+
 #endif /* __KSELFTEST_H */

-- 
2.53.0

