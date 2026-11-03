Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793748194;
	b=Wbrw7UMMtAQZi0D55ZsBzcK8uyu9wTdFRpUt/ddlXYvdJvueb6elozM9hez0DWxx3uCg
	 7cdQkuqoTFv1qgB5WFBnSSOYK3Vaau66ix20jsunHwxfql1/GVX6LdsrbdlARFitI6ZwR
	 YTJxo5QiCZ7YIKMx+eAJHUIUuq0N5GFNQpJDoktvua32Ue9Yt+1kZIP354N4shUqWmSlR
	 kZgx637BtIVJEo7xX1C72sI3Jr7cTaQ2sJW4Jw+aMHBrIIVkWYbdjGfD1/pSo0hbCbD9D
	 8fJTvBFTTAgHIgdlBvEQ7s9dCpGYpVm2Gr+HdG3a4lVLSqBM2mLaAnud936/X64VmNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793748194;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pzShWz/DzbQg/XkFP5Z/j7rrx7AHmZn5K8WC4q5jwsk=;
	b=2663BkIq64cBjNNZxhHXdm9N+ovv/TGV52HjsM16jPWwAzSFxiHFW1/DJld9WIpiRvaP
	 heUXLwXhm97Y9Xj+qi96yF3b275UwUjXtzWEV18kx0jJ/sSjt9sL2QB0trBb7tiJtkRdz
	 NUwtQbMMrKiWHYOHMDhrBeWwchghLdbRBOU9FljkhOwuTfPe4VT+BhIHbtHqpG2hvvMvE
	 mN+SsBtllYO1Z1hvd5apZGOa2eCWE/d203N405jVijcetplsGap0cxexIUhD9NDD1CUjU
	 DayVNsOca4SP+m5uOH66oARkMqjvEhUEnXhdTuMJ5YoTHms6dpO0B6T9nJahDmwjTTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="mmOw/OfN";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA21A606A326;
	Tue,  3 Nov 2026 23:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mmOw/OfN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 652641F0093A;
	Tue,  3 Nov 2026 23:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793748190;
	bh=pzShWz/DzbQg/XkFP5Z/j7rrx7AHmZn5K8WC4q5jwsk=;
	h=From:To:Cc:Subject:Date;
	b=mmOw/OfNmzugTIUEmmf1i1zKSgIHIsGBn25xC0ohW77PZGEgb5fbKclTqiCtsWKGm
	 tmm3v4PCLpyFxYQKiPLJoidcx+nRp3ir1JaICfab/dLpuQnkDujva7nkTBFZBCUNYl
	 ecXYd2GrkJr965KuZb9oTts2l9NWMnfyJWl2bHZSSeYl2Zeg4+helSPU02IkU2XW0G
	 fSqt9yTYeczoD94JQbi+9eV+FSNW+TJ+mkQ1MlxyDAvQ7ACuMI3hdillB7xUjl3qHE
	 vjF436gDUel2WyB0+dHW+ycyEPhhwM7hist0b76/dD7wBUMf/NtVR+u8bUEEpL1KaN
	 tXzOQ2n771T/A==
From: Sasha Levin <sashal@kernel.org>
To: John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests: timers: raw_skew: initialize mon
Date: Tue,  3 Nov 2026 18:23:06 -0500
Message-ID: <20261103232307.1924618-2-sashal@kernel.org>
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

gcc 16 doesn't see that get_monotonic_and_raw() always sets *mon, as
the first iteration of its loop takes the diff == 0 branch, and warns
once the function is inlined into main():

  raw_skew.c:46:26: warning: '*(__time_t *)((char *)&mon + offsetof(struct timespec, tv_sec))' may be used uninitialized [-Wmaybe-uninitialized]

Initialize mon to quiet it.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
Found with gcc 16.2; gcc 14 and 15 and clang 21 don't warn.

 tools/testing/selftests/timers/raw_skew.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/timers/raw_skew.c b/tools/testing/selftests/timers/raw_skew.c
index dfca3e2d50d2e..ec9e5b2691c94 100644
--- a/tools/testing/selftests/timers/raw_skew.c
+++ b/tools/testing/selftests/timers/raw_skew.c
@@ -89,7 +89,7 @@ void get_monotonic_and_raw(struct timespec *mon, struct timespec *raw)
 
 int main(int argc, char **argv)
 {
-	struct timespec mon, raw, start, end;
+	struct timespec mon = {}, raw, start, end;
 	long long delta1, delta2, interval, eppm, ppm;
 	long tick_nom;
 	struct timex tx1, tx2;
-- 
2.53.0

