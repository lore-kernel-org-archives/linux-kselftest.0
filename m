Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08844B8DE0;
	Thu, 26 Feb 2026 16:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772121937; cv=none; b=S0Pp6Ic+B55RGAjAn8aiv+yKA+LMzeBMtJ8DoM8WLZ/mRimsewJBENuQxfVVhcHvyLacmPTWoUBjsozwQykYEcLV1MpuVWYNboqdtIKC1/krzThsEfB7GSk86jFI/OZuDpFFyA7F6XS2LMcjrB7edEUOv1lruhMmN8tbC1+22Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772121937; c=relaxed/simple;
	bh=Fd1XevUti5siz39tfguTapy38Yaj6svZHWG+xHmOHVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nAkzbrHQ/RUN6RNAScBWAZDq0GZOu3ZBC86WZOrNPo6qGWBamnzRG1aEDI/63cwd/MBid493ftpz5LfvKywHDvtPSRBPWquvHntHzhBaT/wIiyGqDkbdMJASth7CC0BZyGr1K7B8j6CQJRkASz3rTpFD1gmo8asdXvxp65jpmQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SkF1OeS6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SkF1OeS6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 424D0C2BCAF;
	Thu, 26 Feb 2026 16:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772121936;
	bh=Fd1XevUti5siz39tfguTapy38Yaj6svZHWG+xHmOHVE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SkF1OeS6270v9ZMylWGwekI2myV8XGUZ0GtSbAAJSypZImlDDWk0mV6kESVXn7AYJ
	 gp3CMnSa+m5ObngdUl1fHIrerHI0cSeAUSpOdkBhmHeUQgFVdqISb8Y7GwneXIj3og
	 6p6VDvSx5diA7WZv9V8NUvFDQ/p5Fe9oflQ5w+BjMhxU+FCvrC+lPUdHSEKTLoog4T
	 kGUN+ZKqh5CKwNeYwliTW0GzVG6/XipM15Yd0+5uzNt4NI/gc+m6Uwmhx2SJu4HfBv
	 10senB/+J6Zs21QKr0kgeMHZyeGneLJ8KPY45Ca+FVmIUz8+/fsdqrX0r9luc6RwNC
	 vpMwSH34LsWew==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 26 Feb 2026 16:05:25 +0000
Subject: [PATCH v4 1/3] kselftest/filelock: Use ksft_perror()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-selftest-filelock-ktap-v4-1-db8ae192ff42@kernel.org>
References: <20260226-selftest-filelock-ktap-v4-0-db8ae192ff42@kernel.org>
In-Reply-To: <20260226-selftest-filelock-ktap-v4-0-db8ae192ff42@kernel.org>
To: Shuah Khan <shuah@kernel.org>, Jeff Layton <jlayton@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=980; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Fd1XevUti5siz39tfguTapy38Yaj6svZHWG+xHmOHVE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpoG9LYsa9Yhk4Q2glo+hpT7L9Xw66PypUhXqI/
 HHu4KhPDx2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaaBvSwAKCRAk1otyXVSH
 0IXCB/4kmPVeEwO72d0jQ4o7nvH7KUGbUkTceAEgKvyufvEEpe6+vQEzo4gDuW0snpxKu1758Ow
 OLe6VgEoJqHCUhYcrQ9gZYSAyQAV4V2pZk50Ksb+EIl1s11rEVIE/W1oSzvL7zUZ+nvmJfc/J5C
 LfuG3HnmBbcOMMquWYPHnG6QsOTfoQVYe3/eJptu+00k+8chNxv5KM80sdUzWTHIlh2cd/ACNXG
 mFzUJBTl25v8eVoUBtmX5Rj6qwj1cz9o5wSdT6a+l2K1c686xfuz5gpluDJSNDSNGrPo73y0CcV
 PX4+5jBQ2QU+gmyKnXDl6GDpH/juGodn4EjqZd5qqYqB1Rbq
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The ofdlocks test reports some errors via perror() which does not produce
KTAP output, convert to ksft_perror() which does.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/filelock/ofdlocks.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/filelock/ofdlocks.c b/tools/testing/selftests/filelock/ofdlocks.c
index ff8d47fc373a..2d3b06ce5e5e 100644
--- a/tools/testing/selftests/filelock/ofdlocks.c
+++ b/tools/testing/selftests/filelock/ofdlocks.c
@@ -16,7 +16,7 @@ static int lock_set(int fd, struct flock *fl)
 	fl->l_whence = SEEK_SET;
 	ret = fcntl(fd, F_OFD_SETLK, fl);
 	if (ret)
-		perror("fcntl()");
+		ksft_perror("fcntl()");
 	return ret;
 }
 
@@ -28,7 +28,7 @@ static int lock_get(int fd, struct flock *fl)
 	fl->l_whence = SEEK_SET;
 	ret = fcntl(fd, F_OFD_GETLK, fl);
 	if (ret)
-		perror("fcntl()");
+		ksft_perror("fcntl()");
 	return ret;
 }
 

-- 
2.47.3

