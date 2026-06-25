Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E9D2571C7;
	Thu, 25 Jun 2026 16:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782404551; cv=none; b=rOOQVnbgS9QZJoajgyIOWyhJBuTV08IPtKI+hNjfn763598bxmyHb1O6o/MkHWozX5bzDWFwMxUe0GP/GONjWLhTsZsBONbNZr/6IjGvaHU2i+mEgm3lATb6bz6bEJjbCihrcRpk1AXfF8PGUXCuPFtHNdhAv64nXHffygDt2hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782404551; c=relaxed/simple;
	bh=T8RZ3gFWOmkDasPbxpoWABA5v7ZLPBob4Kp+1s6ipiE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=o+wBe87k3zOc0vVRIGrUaSTCJirM0E3Bk+yF1Yol8EeQyYaBYdtJ3JaUCT2OCZvLPqi+DZ7hd3I4YsjEP6SEHVUmAU/IJMQPy6UmtYNaKJG66sX8Do7RzOK+/F9/NX6Xt3+KbCdbLcskeOqeHTwyh9wcojMJ4R56JGAlUjqO2Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hTMpWOwj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hTMpWOwj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A7DC1F000E9;
	Thu, 25 Jun 2026 16:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782404550;
	bh=V06r9ZgnSN924V95EjH5zvwyaDfwj2yllSPcDLfiFkU=;
	h=From:Date:Subject:To:Cc;
	b=hTMpWOwj0nxnotPw+6gfu0ZRm3Z2KUw4NPbFkeOUNw7tTTNb2Jc+tXnfSay9/cXKM
	 YAbgJ6d4nP9nrzgve1u98xFVVanjTPwLoqTb82RTJfxFm46o5mhWwNaHsi8ZUbGuO1
	 Ydt5Iadno2MEsjel2ug9CtIJ4kDu0LSZw8OcRUP4At2RkFNDLa4xeAvCQGewa6gb9x
	 6V2DSZjqxhNQxbtbCL81i9WjrBWS+MRvG0nEHW15pV1ZqKYHP8T7iP7+NwI6eoDd29
	 BYrMZdvNgBesKcnPbGr/IxEN9U6F44M1VsDKX6sYLp3rs3byf/tC7BD0vu1H35lg5J
	 Y49NdzQXPHhyw==
From: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
Date: Thu, 25 Jun 2026 18:22:19 +0200
Subject: [PATCH] selftests/lib.mk: run_tests= print summary at the end
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-sft-run-tests-print-totals-v1-1-bfe588266249@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/xXMMQ6DMAwF0Ksgz7WURCVCvU2AD7iqArJNF8Tdm
 45veRcZVGD06i5SfMVkrw3x0dG0lbqCZW6mFFIOOfVsi7OelR3mxodKdfbdy8e4xAEoQ3yOALX
 gUNg5vjH5f6D7/gF4LpAnbgAAAA==
X-Change-ID: 20260625-sft-run-tests-print-totals-a18eea814bee
To: Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2313; i=matttbe@kernel.org;
 h=from:subject:message-id; bh=T8RZ3gFWOmkDasPbxpoWABA5v7ZLPBob4Kp+1s6ipiE=;
 b=owGbwMvMwCVWo/Th0Gd3rumMp9WSGLJsQ4/EHFtc7PS0svqQ8rNX8/JM5ktpzXzaYuvcGrfGQ
 +N806JJHaUsDGJcDLJiiizSbZH5M59X8ZZ4+VnAzGFlAhnCwMUpABNp38vIcJLHOLpG+/ObnJ3z
 9QOXL8ufsHFSn9eXz/EH34m8vqW8UYKRoUW+r8nk3EZ90y2GfaqLJkkovi0uFJj435pZPbvtg1M
 vLwA=
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
base-commit: fbb7ad31ab376c5101b2ac7205fad0344fd2de60
change-id: 20260625-sft-run-tests-print-totals-a18eea814bee

Best regards,
--  
Matthieu Baerts (NGI0) <matttbe@kernel.org>

