Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75873F65EE;
	Fri, 22 May 2026 11:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779450886; cv=none; b=PO/qP3iUWaNzhHEYn14oLvh54tI+jZpoQVd/MGoo049GEPmDn9Dlj+9PCLQ4onuK5bbsa73Yrda78/RHcyQs9VSjLP5SHQituu4lPRWbhec1AP6zWr/bs+2cnvY3jG/SyxauEukTAWrzubX1IxzDXyvsxpK/BGQrE8R7KQ2lANc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779450886; c=relaxed/simple;
	bh=yNM1KucGusRUNSjrZXGlb77jtzoumCtkIOtLUUYrmfs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a5rXLLcXiTcPqac2mGFjHEBeoI6hIY4VRJBmM1j9V5QM7NEczXZbpRCRft0WEKBWYbpvLDnyB4oMxsqniUM0OQKv+lcbJCKRVfMEwl291HFGIIxNxU8/ZjjAM7LMu3zOVA1oVUqUe3Rz8XXGuQp+GPCXtjNDoyzWc8U7hp3LT08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mMoPnnpo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mMoPnnpo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8EF61F00A3D;
	Fri, 22 May 2026 11:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779450882;
	bh=Pvh/z0N03nbghVhqNzihjOvEYAO7Xbnb7fxFzcczsmk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mMoPnnpobVCMp9zt65bVsvsHOh4h/A9sTOyJmaFdb7fhKwKEa9EJVrTcae9zwkAN5
	 9boYPM959BAo9UkD3XM2E8IktlrKGuGxwH4ok8NbNWVNQlMEVE00cyUsLa6VTOvkpe
	 u6IY8iZ4cgAzeI+m0bcEGL+ODxUkfCafh+P/oT3OX73jF9X9CVDKhNJU+2UiDHP7e3
	 41ZwUMuWp6YSdCuPguX3ESidh0BQgazbkxwa1Rw7D7YiZGGojVQqUaNM6HRrHBp8km
	 wNGEs8iRCZ/n6mOEds1JbUmlR4AjpgT0/bJuxtkgR7QeNGQGCTR8FP4rSv45TA2xKG
	 IU5bSm7HeBP8Q==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 22 May 2026 12:54:25 +0100
Subject: [PATCH v5 3/3] kselftest/filelock: Add a .gitignore file
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-selftest-filelock-ktap-v5-3-8d0e3c012a36@kernel.org>
References: <20260522-selftest-filelock-ktap-v5-0-8d0e3c012a36@kernel.org>
In-Reply-To: <20260522-selftest-filelock-ktap-v5-0-8d0e3c012a36@kernel.org>
To: Shuah Khan <shuah@kernel.org>, Jeff Layton <jlayton@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=464; i=broonie@kernel.org;
 h=from:subject:message-id; bh=yNM1KucGusRUNSjrZXGlb77jtzoumCtkIOtLUUYrmfs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEEP7hLr47iO6FpexDczrd4DKRvc3Cm4LRf7L2
 GVbCYaWci2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahBD+wAKCRAk1otyXVSH
 0Fd+B/9O8nsI3Hi165xsM3TepBP5OWfBSGFdWUOwwfEwlFH617UKVWVdaqPkmGIQam1ECxBRmoV
 sJ7l9GFMyEWMGAWbGE4Ypedi63TcevOKrk+7/0cuTZjimUlLGUrSGbyYeWcEc5TCq1BbdKF9sNd
 CtKtgJbm+rWOCYXWJ4Skdr/ZrraTsGrKcZp1NUEnGgg6vJXlwbm4YWdQzB6NGuxxaowpeUqBi+f
 p5uFZemsFXEH83fwoeIobhHzkBVpI6IvJKmjC6KEB0g9c/3OHvzX5xxRx6VZDwUeidC2CBcrrFB
 2XeN1ZRwvwpMXySW7pt09DifAOtAV1P+ZvAS2k7ZLVBqq0kt
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Tell git to ignore the generated binary for the test.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/filelock/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/filelock/.gitignore b/tools/testing/selftests/filelock/.gitignore
new file mode 100644
index 000000000000..825e899a121b
--- /dev/null
+++ b/tools/testing/selftests/filelock/.gitignore
@@ -0,0 +1 @@
+ofdlocks

-- 
2.47.3

