Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402883F1665;
	Fri, 22 May 2026 11:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779450880; cv=none; b=Y8gi2pbAzpzCk6wkm2WeGiBbErF91jX+ZNKZbPI9HTimEnea1Dy9eYp+4ESxcgURfpEZNn77J9fLLBvb2hOKfYW1bNtpzq42K4lMggCeL72JweWtZsOSbPpFz4lpVZbxjO/HH3oVRhwcp4ZD+Mi5CxmG+qGrsZubP7KjyJg+i/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779450880; c=relaxed/simple;
	bh=Fd1XevUti5siz39tfguTapy38Yaj6svZHWG+xHmOHVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pQjKHoihstHnXhKF+KhHlCcG2S7urB/mmHf3KF9tlvLOPy1ESqJv7gmy4Uug+eTmyNoNdLQr+mt8EkUZgr/oo0XclYFibv9ZFA6Xx+5txTU65A4/fW5HC0UGbPAB+lcCRcAAiQYcm+CrLkrl7H2EG0kE7BBtntCX7DbKUboQuHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H4XW0otR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H4XW0otR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B817A1F00A3D;
	Fri, 22 May 2026 11:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779450878;
	bh=PpepI08SYDEeWPPfpeAjN4xDKgycayXRMO1YjS9AIF0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=H4XW0otRInAKI/CGAowTjklxnulimbGBvuNTLzl/tuvH0fhLr948uGgb5sxxGoTh7
	 aOBV3IBvkWdxfEdDx83qd/5ZaI3SfVwsYCXDa/ShDEbN2rgVuD6QLG9X4M0XWqX6YF
	 D+FL0QhqqhThqeb26UbzCcurlNokadMCJHXRWzIK5qib4fBO5PAFUNublE2oRrbtsS
	 VewqN9jE5u/DtjHNmCigtDDkqMAS8CvAywUTci5mlHQi64XQs9bGkDNqTOPl7iyKEH
	 4BGKHnBRUPuJjXwWTrmGflbnjoXJaIpEZDrwtMpuqekOYvKrLf0oxuaR8cvV3sqXQP
	 nIMSkegA6YmSw==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 22 May 2026 12:54:23 +0100
Subject: [PATCH v5 1/3] kselftest/filelock: Use ksft_perror()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-selftest-filelock-ktap-v5-1-8d0e3c012a36@kernel.org>
References: <20260522-selftest-filelock-ktap-v5-0-8d0e3c012a36@kernel.org>
In-Reply-To: <20260522-selftest-filelock-ktap-v5-0-8d0e3c012a36@kernel.org>
To: Shuah Khan <shuah@kernel.org>, Jeff Layton <jlayton@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=980; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Fd1XevUti5siz39tfguTapy38Yaj6svZHWG+xHmOHVE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEEP5hqpK42tGaIpI30BWIkgKmnqmmGdH03iWv
 mWxt+xc0NKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahBD+QAKCRAk1otyXVSH
 0CHrB/0bPcS7YkYxn7nklCH5TIz8n7cFILL/WfRE00+leUcEbuzkE8cntvzECpaKAzHIyCvvKPA
 r/1w4ir8zZH+JmiFI7HI5cUD49kvOB54SFMlm1NrrjAwZEecmmcmmx8KTwTn6hT8DAcVZUtgLC1
 r2zmbwaAJo2CNxmPa1v+j3yDHDd2DXm2Mafvjn+CGsnZ1+7pQVhIVbWvwBdCdS4gXhH8NbxT5RP
 d5WnT4gstHLZRXGMgOA3wg+uHVvlxw7HAtZqSeV7Oai4W6CSiFAoCA8w5ihethX/FEW9b7XczL3
 bh5jw4tkxHKl413O/tAlSwrI3eIq011SxaPnRnoCak/JogHd
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

