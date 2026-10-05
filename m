Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E734CEE48;
	Mon,  5 Oct 2026 17:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791221429; cv=none; b=LNR4cvKL+g4PkBfAcF3Rnw5Pfg+Sua4oVdsA8f/n6SqUSPIZx15Jx6Mfe1DO7bCbkWfPD2vYpZHu7L/T7UBPOApMmlmWbMUE0mxDigQ61z+ap++whG31H8xEc6TAHCxFc+C/48s1q6zNOALkDegsnCz9VSlAZ9zGGqqDlWR4ShE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791221429; c=relaxed/simple;
	bh=y80eDF61NqDQ0A/qHnQbb89yvEVcB2/CncyjErSWxdY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MkVWrqoWGnyM4g8vj2LpmRcW0mQrl73PqJDQmcYUcjN5D2hg4sGqSkOIGOesD+w+CYTLnOc+XdM1DBhU4sCL1Q4Ob5tNxUWGofuxkplLHBSVnTfn+126MaoAEdxSWqMG90qyTeaODjAHB3q10VDr6Nfs8XYi+DR8BH1kQq3nWSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fnn/nFq8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fnn/nFq8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5AE31F000FF;
	Mon,  5 Oct 2026 17:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791221422;
	bh=2S8sboOkN30YQsk+3u7LYDimtoghpZTYWEdAeieFXzg=;
	h=From:Date:Subject:To:Cc;
	b=Fnn/nFq8gDkyi/mqILoELEuRVOYUka59OFcCA+TVO8aYMfYIBRVl3mgRwTqzcfJyl
	 S+p04j17tqVP9i5uucXvmFQ7UInN/cHNa1vF42qT/WIigef6KNZW0XQvj6Rkh4tGFV
	 RfOeA2pTmozB1pE3c3Xof+p8Ec8eo9e4X/P1QUstQ3IJsjZDAiQFa7En1lTxx17JGq
	 yBrIkU66ma4MzTUdOpYN3VVKCw4nngHLl71ElCYBjjL0pWcmMolJQdfiDCFB9id6TZ
	 jQPPLWk5aqr+o5XEYafzKbEx1TfFDWAfHDe2/bNRDV7PB/2adEaPFY+1MVq2MJz1cY
	 hdPwMQBarB8Zg==
From: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
Date: Mon, 05 Oct 2026 19:30:12 +0200
Subject: [PATCH kselftest v2] selftests/lib.mk: run_tests: print summary at
 the end
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-sft-run-tests-print-totals-v2-1-29c45c0e2fe6@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42PQQqDMBREr1Ky7i8maEi76j2ki2h/NFUSyf9Ki
 3j3RnuBroaZgTfMKgiTRxK30yoSLp58DNmo80m0vQ0dgn9mL1ShdKFVBeQY0hyAkZhgSj4wcGQ
 7ElhpEK2RZYMoMmBKSHPzwpZ3wp70njimz7G2yCz1X+BFgoTGYWWM0lqV1/uAKeB4iakTj+035
 fz7+FGLgXB0OyZ32xdDuGEd4gAAAA==
X-Change-ID: 20260625-sft-run-tests-print-totals-a18eea814bee
To: Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2472; i=matttbe@kernel.org;
 h=from:subject:message-id; bh=y80eDF61NqDQ0A/qHnQbb89yvEVcB2/CncyjErSWxdY=;
 b=owGbwMvMwCVWo/Th0Gd3rumMp9WSGLIO31ubufPJhytPHz+NVK1hbb407U/4gXUOkouXuOaFP
 lf34Zbz7ShlYRDjYpAVU2SRbovMn/m8irfEy88CZg4rE8gQBi5OAZjI/lmMDAcKVRkusO9IuXVp
 Vd5qtgW3T/YvnWF/u6BvRbncDVNR8X2MDLPaDhZ/699plfl+S/RNxrP3BfOqo+xTlePbK258O+f
 TxAQA
X-Developer-Key: i=matttbe@kernel.org; a=openpgp;
 fpr=E8CB85F76877057A6E27F77AF6B7824F4269A073

When there are many tests and/or many log lines, it is difficult to
quickly find out how the different tests went when running:

    make -C tools/testing/selftests run_tests

This run_tests target executes 'run_many' from runner.sh, which relies
on ktap_helpers.sh. At the end of the execution, the KTAP_CNT_* counters
have been populated, and the total can then be simply printed with the
ktap_print_totals helper.

Now a summary is printed at the end, e.g. here with the two last lines:

    $ make -sC tools/testing/selftests TARGETS=(...) run_tests
    # timeout set to (...)
    # selftests: (...)
    (...)
    ok 1 selftests: (...)
    # timeout set to (...)
    # selftests: (...)
    (...)
    ok 2 selftests: (...) # SKIP
    # timeout set to (...)
    # selftests: (...)
    (...)
    not ok 3 selftests: (...)
    # 1 skipped test(s) detected.  Consider enabling relevant config options to improve coverage.
    # Totals: pass:1 fail:1 xfail:0 xpass:0 skip:1 error:0

This summary is printed, using '#' as prefix to be treated as a comment
in the TAP format. The summary is also printed when summary=1 is used to
redirect log lines in different files because it still looks useful when
there are many tests, not to have to check each line.

Note that this 'make' command will continue to exit without errors
(returned code is 0) when the tests can be executed. I guess it is
better not to change this behaviour to be able to continue detecting
kselftests failures.

Signed-off-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>
---
Changes in v2:
- Fix typo in the title: s/=/:/
- Link to v1: https://patch.msgid.link/20260625-sft-run-tests-print-totals-v1-1-bfe588266249@kernel.org
---
 tools/testing/selftests/lib.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index f02cc8a2e4ae..de15e63bc6b4 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -106,7 +106,8 @@ define RUN_TESTS
 	if [ "X$(summary)" != "X" ]; then       \
 		per_test_logging=1;		\
 	fi;                                     \
-	run_many $(1)
+	run_many $(1);				\
+	ktap_print_totals
 endef
 
 define INSTALL_INCLUDES

---
base-commit: 30af56a227e27b892d34bc44c23298b5274913e3
change-id: 20260625-sft-run-tests-print-totals-a18eea814bee

Best regards,
--  
Matthieu Baerts (NGI0) <matttbe@kernel.org>

