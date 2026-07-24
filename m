Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F0237AA94;
	Fri, 24 Jul 2026 07:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784879254; cv=none; b=DQT2WDgGntZba7no1h9LVUVjtQPdzi3lkcSWoSwpUGsMOsZLwPbfXnvVZ5OCgutlcm/T3tz48hhCZu6ZtvY+tdqPCUoDx73Oy6kx9BCfxjGKkivWDKpCmx/k5/QB6nX7sx22W05cCGOHFSgc7cRNLNLXbqMA23y1GNjFLjDFn80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784879254; c=relaxed/simple;
	bh=ETTJmnZ6YcUUCVdM+3Ly4RYk5JWNUQ+p+Y7PmCkO3Dg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B/d3N1rBkQeB4ocC17AJRGXJlE6sHrukBtxDsSbCviD34Lo+rWuJ/7BP336niVaIvrZ96pRmYzQlj7wDzTDSnYHPYPkAl/qAw2OvRMDj4hUGYqRovUm4iR6qJNQh3Vk8+3rX3qprtm2Rwq9WZbKzwp0nLzEelr/n1RwQRPy9ww4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=XEp5H2Mh; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="XEp5H2Mh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1784879179;
	bh=jvFc24TZ3mLvfxxnDzgAFIY8NxhmAYXL6YmNdDZ73vM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=XEp5H2MhkZuk07bRvEAvbNG0Sf/dpGKtcOIqmA5TZ1aCJzmKkzTfdDcqx1oGYnapT
	 2L++BCLAvhCOg5zyCmziahhV5Im/klPbhnB1VM6IvFoIDZU1Hj4RrI1tMRZnRA78r0
	 tPuFDoAMaupmq76gnYU894YjmvqZYLn4Om4oEp2k=
X-QQ-mid: zesmtpgz4t1784879174ta9d19419
X-QQ-Originating-IP: WUXYcae5nEufZ1rlLXj47kWA3ZOFt65COWJNWGkcdKo=
Received: from zzz-PC ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 24 Jul 2026 15:46:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 16488411257486240047
EX-QQ-RecipientCnt: 11
From: zhaozhengzhuo <zhaozhengzhuo@uniontech.com>
To: David Hildenbrand <david@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Sarthak Sharma <sarthak.sharma@arm.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhaozhengzhuo <zhaozhengzhuo@uniontech.com>
Subject: [PATCH v2] selftests/mm: fix gup_longterm EINVAL error message
Date: Fri, 24 Jul 2026 15:46:03 +0800
Message-ID: <23557F4CB8CF36FF+20260724074603.1479243-1-zhaozhengzhuo@uniontech.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <8A3ADC563A32EF67+20260724065929.1474539-1-zhaozhengzhuo@uniontech.com>
References: <8A3ADC563A32EF67+20260724065929.1474539-1-zhaozhengzhuo@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: OJDPILheKkFdcZV9/gLCRTZNY2yeQ0HO3o0Qy1NPZeW4UQV2lt0Hx39P
	eU34YhmmOoMOLC9HpjhN2q6YsAfJDIOKn1DKWFdV0bBk7g2lugPCywqJVZOyQ7osOMHM5Gx
	sh9SvahUMMwHh6d0tmxdqp9QDlfuwtw5wM76CgoZwdK+pslJUacxV/r0cpUme5Ed6VpSFJx
	/6AYvjJI62OCYkjckPFQr4ukkOIHfV/1hGZjTSequMhnBrj/Bn2aFSFUv/FnFTOgMzslKsj
	T7OfQma1vDWbnvcdJd20uD+d1bzMv84cKoP1sh98/o6IUTYuXkDtslGACeyvQrPQmXmP2gj
	gtAPpRl86BR/ryQUH13NYgsJpLFGB9ARP8NRcCbjTa47TUgWAMoy6JnNvz0E/ch6sce3Xc8
	2IDYM1FtI2boYuMNy5A5Pev9isrPhoqowPUOC/ulfnOawXKofenoCPRBgWoQYetvcKp9nOj
	nwlrIHQLR12qmPY5t6EZIopMw/aBKybEpyJx9qi+grFDgFzgic5djp6dpNCo6NCDEvUrC2m
	W34l6KrAoSBySt3/wzbpYwAzBqPISq1MLJ4GFmXhnOs1NmUepFPFYxT95yLxel6JBAcRdwv
	0q/uOtx+y71QUH1tXzYSQxkNpm1FEZ+Y4L5ATr3SzAB6B+RpEUTqmp5FsqcxqVWqTNzCN+J
	lphhJ8qRdmAdjwwX3gPXk/ejkGSK94ulxx+/tva4SU1gxRtnSWoufcIm6AQ2FXrlc8S06G6
	/Q1kPI6M1z46j3mzaPhuIyc13C+lh1Ux9e+5VpPwPNw2EWAkcGuE1Le4q5sySytfVt8wxF1
	V6MZ9pgEvKd+STv5X5H9EciBFnDNdIugP7U8I0kGWRJ5qssYJ4lkBBxDNNMhdh1lMWeRL5q
	bQqU+mDcSwfciW4c8qFf1z5xObrR69L3Pw0CTO4YVNdihlt9pWLb/vk0v7j8KL3EBa2LuOy
	q9Y8y5YjVNQy1a2pxt2FobaUxTHwIAh4b5WPcLo3A1WxW9rDMuvcUAHEMz4bKXPPnMvGYws
	5MrEyB3nQcceHH7dqfG/OsN9ffsJwfoyzf5UVoapeJsCfYBXhuktuwSaJ26vymNRZO/jpNh
	w7KDcwQ8qa18KoYrN2Wqw8CVU33c6Fpt2lh0dBux4e08S3IjhGejL7H2R2szq0orRKBSNJ3
	FOi2nJuOTMAUgrg=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

The gup_longterm test prints a literal "n" when
PIN_LONGTERM_TEST_START fails with EINVAL because the string is missing the
newline escape sequence.

Print a newline instead.

Fixes: 800ddf3cd74b ("selftests/mm: report errno when things fail in gup_longterm")
Signed-off-by: zhaozhengzhuo <zhaozhengzhuo@uniontech.com>
Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
Changes in v2:
- Add Fixes tag as suggested by Sarthak.
- Add Reviewed-by tag from Sarthak.

 tools/testing/selftests/mm/gup_longterm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/gup_longterm.c b/tools/testing/selftests/mm/gup_longterm.c
index eb8963e9d..c03b4f891 100644
--- a/tools/testing/selftests/mm/gup_longterm.c
+++ b/tools/testing/selftests/mm/gup_longterm.c
@@ -196,7 +196,7 @@ static void do_test(int fd, size_t size, enum test_type type, bool shared)
 		args.flags |= rw ? PIN_LONGTERM_TEST_FLAG_USE_WRITE : 0;
 		ret = ioctl(gup_fd, PIN_LONGTERM_TEST_START, &args);
 		if (ret && errno == EINVAL) {
-			ksft_print_msg("PIN_LONGTERM_TEST_START failed (EINVAL)n");
+			ksft_print_msg("PIN_LONGTERM_TEST_START failed (EINVAL)\n");
 			result = KSFT_SKIP;
 			break;
 		} else if (ret && errno == EFAULT) {

base-commit: c04df384b55dd9dcf72c36b661becb5aaba371a9
-- 
2.51.0

