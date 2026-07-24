Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC07B25B0AC;
	Fri, 24 Jul 2026 07:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784876585; cv=none; b=Tr8wlM2GLlAqZHAzVgajLISybKWlAWipePwh+NqSPPs81Z7uBwsxlpAaWWdprpj57trxql4fK3E1TRwqfdVqh2SaYvP+VXM8QRba+Xm0Vn+Stis+qlfidD9mdty5f+mhgtHBWM2QUwruU21xT0iwLSL6k7F91qw2N0O8cuzVoms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784876585; c=relaxed/simple;
	bh=C+ekNd+q4jyEm+YrVEfBl2PVJ/ikt4RfDLDldD6Y7Y8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XbaE7GMOWAGLmspXB3qP9ko1WA31s8jwU1wWsOoM1yv74aocM3yRXJ68v+kmunNerdVouOtp8dUssD6oszNzCYY84HfozIPpxpJaw5gpEBxgQ2d2pC29cadPYhGkrdfHj1Q7A4SXOxZzeD69gRhYS2Q2+9OCvBFrCTXViXJE9fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Cj8RwvZk; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Cj8RwvZk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1784876438;
	bh=W7eO75WQ6Iz53aPxHGA+pWTqSaMtwGzSjlsEmYlxr0g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Cj8RwvZkBDOPWBOxGGiUhn6GEuh1EyhTf2CL2OHxYYI5ArPZVDca1kD7R6OW9Icu8
	 LDtCXGPoz02DhLFLXkP8ySBu+WCdlS1Pb6jCkR5wYiVACsGgq7RsWK77zNTxC/SBDB
	 MgIr1lZxJwqEZa3VpXyG2EbQ2I69UvVdS5W8YORI=
X-QQ-mid: zesmtpsz3t1784876420tbd8998f7
X-QQ-Originating-IP: Vyt5qy7KqQvsjOwB9C0qk1I1TDMXxLRBNON0HVtOncQ=
Received: from zzz-PC ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 24 Jul 2026 15:00:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 2749011430090212202
EX-QQ-RecipientCnt: 10
From: zhaozhengzhuo <zhaozhengzhuo@uniontech.com>
To: David Hildenbrand <david@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhaozhengzhuo <zhaozhengzhuo@uniontech.com>
Subject: [PATCH] selftests/mm: fix gup_longterm EINVAL error message
Date: Fri, 24 Jul 2026 14:59:29 +0800
Message-ID: <8A3ADC563A32EF67+20260724065929.1474539-1-zhaozhengzhuo@uniontech.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: MvdkdJf/zMeNq6Gdr4/GWj+x1cjfk1QMJLKvHmyo69uiV16HwW/Mv8IZ
	Uo7/6bLwpXMwrcos5nVAv1BtvISXRiFrL23rhEm8O+90SMpoEpgPzHsTtvbn2Y+OB/CY+G4
	kJaRIpStOw4GndBTLfch0XJyFahuhRzKohyvQEBX8pXVikHVtQkGAuUakjhYdaGVRNR7Lz8
	wci0ZxWFYGvGpPDrhMV0iZGLlfdSVsI/srezOvxFj8FvwtTcbxB8EaNabO1YO2wmpROnVxL
	RAewdLKd2DQKF82lZhY65OJqTz6BDJsxS9HQYkZac56ULBUrbOr0gOB85aHvflbTFEQVp7M
	5Pp2qcKgorX8tSjCCxL/6s9WRjsocgfj7DMiYvMl4tfpey8o8z4oMc/imqep19zazyNDx/5
	MXRQJy6m7Itoqz9gdZQ59Kal+hzGDzHmvNPsp9TIrUxMapL17TMIisE6P8A4waCvSgmzrKb
	vCFHQtZCaG9M4ip4xfdF/zVm5Xmo2r/Hc+jhU++Pboaep2KH9W6rZT3G+oU1MhzEMkKEwAU
	LB1NbNkWF+RrOc/ObmDpVZ1NvtFNwf3jMBGieeyTmqDv/lRY46uevCHQ0zRJgljZ7ZZxZ9s
	8OO7zeyGxbLC+BJll5lcqvIsHHYU1H3/9032DcEXDanlmDIPDjN2demNZoXVM/KeKLf5UZw
	ZbbpLXsZUE6rMwrWQkLaOteusL/1ew1ivL1KpogeyxeYk2/55nGDsEvWS0jzFisMwgJKh80
	1+0yu3NgcXyZCTD0UTD63mOoTUPvpkjxUQ5HTHriDSk4GaFQ40hxqIBSc76DIhKwsemZ27J
	RfSy+Ki87E86KO2wrI0tMtZAnzw6wezawJ57Yj8HfOB0iv6Nj9WIDUtorbbch5F9XCiICg6
	2kvTBMRcT3vgJVGFFnlCgezAYStZ7g2iJ5nqXenDEyDqfIWO55W096R3+a548G/w1lKfOMY
	JlCL+52DQmuKAOd83xGY9zQMF6HryPMSuRXWfWLwELEMbJayGqEf5mtYv6Idcli6doFsT9D
	kwYX2Qp6khjk3VjtuaRK0e/jFyETlrxbHuq55FvdQ4bantRDGSec1qRDoRpgB19z37FiXeL
	lU6TigE7DHEly1KhyTxuLncYoW3ekcyGg==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

The gup_longterm test prints a literal "n" when
PIN_LONGTERM_TEST_START fails with EINVAL because the string is missing the
newline escape sequence.

Print a newline instead.

Signed-off-by: zhaozhengzhuo <zhaozhengzhuo@uniontech.com>
---
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

