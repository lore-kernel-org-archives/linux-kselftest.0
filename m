Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC943E3DAB
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 17:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777916468; cv=none; b=eOmwip5TUK7n7SWuFd/IenLr3DhBpwt55VThidQI0PXvjIknJdBjm+0F1e9xv/tV8ofoww65kW8HzPJpPV7T8MlMGiBVczk3kdJpNF8q6k+9uwONxyZlSEilqhmt4rY20lnWAGLPSzX158ijJx1BanqKR9zX8WJsRPNPoasqSzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777916468; c=relaxed/simple;
	bh=yq71j9wctcNGytKHj/p59ys2+HWuYWPLuioDe7KxcfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q9f4WRIGGO/h399GiKI9BpBybw28lPD0q9Kbc3fH1B82GkFiEGU7/fK4rNiTNVogCsNsM4DOLwakOljy50uEFDCIzO8gMnDZjCVR4Xh/ZU9tXhH2C+FLWtAY5zfhhZAYvm/WwLbBBUx/imJ5FY/n+KuwlQ2f6mpFVyFOzAWFHeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSq8SzfP; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSq8SzfP"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-794719afcd4so39700157b3.1
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 10:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777916466; x=1778521266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eUIUmXE0+wLRQ6+GiVrpuUgnRpPQKDTF515rzrT7DLA=;
        b=iSq8SzfPKz0mX9YyftW9gtPz8BfmQzNheWMZIFgwq5nZjGUKEPccDtZQLss+xOo5QN
         vSWYynvrr6Je2RGD4wVLOM/haSA7OSaNlo/L2uJoqYIgtteNEcbgulf8ztZI7DDJfLUt
         cc6io303Ooz/FRQK7Mbz2NzPC15JGwDwgQKbKCTZYqWCjRlxiJyABisx8gEIqVrZzWDb
         Z1ckWWn9sMZnKT6VdP/mVknn9VO627zZxrjng2dGHZxh0V1vBfa1ANwsWijyrvR6RD9/
         wPdk9LnRvmuRiiLaxnLTYPCEvZJEgYb/EXQ/7RVQPGG/FJqqel8p2MLAGnmkCN2E+Jyc
         a/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777916466; x=1778521266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eUIUmXE0+wLRQ6+GiVrpuUgnRpPQKDTF515rzrT7DLA=;
        b=npdRHKDUQ3YXCTr7sSE0ZzqihFqGq2zweqm2Swzmrx8/a7ENb7+wbucJCYdW2MpMPT
         6EEpNeMStrfxNw7rWOBPtILhx9+x0nGdOejl9+ss4AD0QF1XbugtYEy7R4Fm9i4NchJ3
         N1gcDkvjv4kvenn7w8Lcy17TT04wsJmsTA9OD+9cjPI/tt/pHinp4bvR9eau/OewioyO
         m0fs/2gUOKCNZfDD14KmA85eT7wTjctxR/wDUDu+CUsNmtL5PjsDr9pHnGYdzSZS5kr8
         1YLgqkC0f9DjFju7n3jab9bma2r7jxquGTMBILW9XJn2p1oGGdXEDeKimEPbeFnZ896E
         z39w==
X-Forwarded-Encrypted: i=1; AFNElJ87xZMafXU6vpLpjbxIrge6Ltd2zUUquY8P+Rjab7uj/wFAZvSSgrmk6EslLh8XmaFxVIQ+QJ5iCpIbQBILIPI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTAYENDYPH3IoqUOGKTLynaGvmabtgRBIOxsBKe8wF0YzPWsr5
	1V1FePOF2e1X6dkPT1nFvxtL/SQZ47Hn34y27AD/+2SCBvjQ+zPPQYX/pFYMqw==
X-Gm-Gg: AeBDievj8yeKI3jsTbtvVGM1FJ7tS/l+RWgelZYhLRI7q92Vtb8sQsI1slQ8jH1YhyQ
	8UjyHHjGE8l8IX75p5MsZbfbHx11EHVh1+yFhEgeaMA5QRfGrYN0F6+Vj6p/0pDacjHV/xjpeGm
	A68aONFIDO6w+Ut7zgYSWAOnr1js2B+3mKWy6jjbdlfTNK0k+qx7dL5xnXLS7qQmDN1u4tKrULR
	tj/SfceVL0qJ8J1j6RsFKYE7YjgdEZqYUPELyUJca3aVwob+AlDMQunNobiurQEasrudcYLHkRV
	2OI4bqmQKRs51YY6lORGkpXhVFT2V5EfhC3VMriXjwTTI115CQKkypOkhQ/7ADwVbTVfR1GH0DT
	48zPHRw3Nyzh8spny90CX7uDdJQFPYQ7sPWxARy/4wyxsn/xe5pbqLIkUq5llN+EVrd+W38gUpm
	ypkcBmsodqlrG4CYIUbyu8C/fGb0KDcqGj8exFBFhXTlDo4bM+oYxZ1g8gEiwPHnZ4YwvEvRg3v
	0neQ5QyrN6xsElEqx0cXVXu5QOdUZte7RgaJ9liy+Y2u74s
X-Received: by 2002:a05:690c:c6cb:b0:7ba:f414:cd18 with SMTP id 00721157ae682-7bd7712f9f6mr78850767b3.41.1777916465601;
        Mon, 04 May 2026 10:41:05 -0700 (PDT)
Received: from willemb.c.googlers.com.com (172.235.85.34.bc.googleusercontent.com. [34.85.235.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6685d0cbsm51551767b3.35.2026.05.04.10.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 10:41:04 -0700 (PDT)
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	kuba@kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH net-next v7 1/3] selftests: net: py: support cmd verifying expected failure
Date: Mon,  4 May 2026 13:38:32 -0400
Message-ID: <20260504174056.565319-2-willemdebruijn.kernel@gmail.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260504174056.565319-1-willemdebruijn.kernel@gmail.com>
References: <20260504174056.565319-1-willemdebruijn.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Willem de Bruijn <willemb@google.com>

Support negative tests, where cmd raises an exception if the command
succeeded.

Add optional argument expect_fail to cmd and bkg. Where fail fails the
test on unexpected error, expect_fail fails it on unexpected success.

Both fail on negative return code. Python subprocess may set a
negative return code on process crash or timeout. Those are never
anticipated failures.

Signed-off-by: Willem de Bruijn <willemb@google.com>

---

In this design fail and expect_fail are two complementary tests.
If both are set to true, an exception would always be raised.

This is contrast to the previous approach, where fail enables
fail_on_unexpected_returncode and expect_fail modifies what that
unexpected_returncode value range is.

---

v6 -> v7
  - convert from 'verify_failed' value for fail, to separate variable

v4 -> v5
  - initial version of standalone patch
---
 tools/testing/selftests/net/lib/py/utils.py | 39 +++++++++++++++------
 1 file changed, 29 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/net/lib/py/utils.py b/tools/testing/selftests/net/lib/py/utils.py
index 6c44a3d2bbf7..b68d4607114d 100644
--- a/tools/testing/selftests/net/lib/py/utils.py
+++ b/tools/testing/selftests/net/lib/py/utils.py
@@ -23,6 +23,10 @@ class CmdExitFailure(Exception):
         self.cmd = cmd_obj
 
 
+class CmdExitZeroFailure(CmdExitFailure):
+    """ Command succeeded (returned zero exit code), but expected failure. """
+
+
 def fd_read_timeout(fd, timeout):
     rlist, _, _ = select.select([fd], [], [], timeout)
     if rlist:
@@ -39,8 +43,9 @@ class cmd:
 
     Use bkg() instead to run a command in the background.
     """
-    def __init__(self, comm, shell=None, fail=True, ns=None, background=False,
-                 host=None, timeout=5, ksft_ready=None, ksft_wait=None):
+    def __init__(self, comm, shell=None, fail=True, expect_fail=False, ns=None,
+                 background=False, host=None, timeout=5, ksft_ready=None,
+                 ksft_wait=None):
         if ns:
             comm = f'ip netns exec {ns} ' + comm
 
@@ -88,7 +93,8 @@ class cmd:
                     self._process_terminate(terminate=terminate, timeout=1)
                     raise CmdInitFailure("Did not receive ready message", self)
         if not background:
-            self.process(terminate=False, fail=fail, timeout=timeout)
+            self.process(terminate=False, fail=fail, expect_fail=expect_fail,
+                         timeout=timeout)
 
     def _process_terminate(self, terminate, timeout):
         if terminate:
@@ -102,7 +108,7 @@ class cmd:
 
         return stdout, stderr
 
-    def process(self, terminate=True, fail=None, timeout=5):
+    def process(self, terminate=True, fail=None, expect_fail=False, timeout=5):
         if fail is None:
             fail = not terminate
 
@@ -111,10 +117,19 @@ class cmd:
 
         stdout, stderr = self._process_terminate(terminate=terminate,
                                                  timeout=timeout)
-        if self.proc.returncode != 0 and fail:
+
+        # Fail on unexpected test failure if fail.
+        # Fail on unexpected test success if expect_fail.
+        # Fail on negative returncode if either:
+        # Set by subprocess on crash or signal, this is never expected failure.
+        if (self.proc.returncode != 0 and fail or
+            (self.proc.returncode < 0 and expect_fail)):
             if len(stderr) > 0 and stderr[-1] == "\n":
                 stderr = stderr[:-1]
             raise CmdExitFailure("Command failed", self)
+        elif self.proc.returncode == 0 and expect_fail:
+            raise CmdExitZeroFailure("Command succeeded (expected fail)", self)
+
 
     def __repr__(self):
         def str_fmt(name, s):
@@ -157,14 +172,17 @@ class bkg(cmd):
 
         with bkg("my_binary", ksft_wait=5):
     """
-    def __init__(self, comm, shell=None, fail=None, ns=None, host=None,
-                 exit_wait=False, ksft_ready=None, ksft_wait=None):
+    def __init__(self, comm, shell=None, fail=None, expect_fail=None,
+                 ns=None, host=None, exit_wait=False, ksft_ready=None,
+                 ksft_wait=None):
         super().__init__(comm, background=True,
-                         shell=shell, fail=fail, ns=ns, host=host,
-                         ksft_ready=ksft_ready, ksft_wait=ksft_wait)
+                         shell=shell, fail=fail, expect_fail=expect_fail,
+                         ns=ns, host=host, ksft_ready=ksft_ready,
+                         ksft_wait=ksft_wait)
         self.terminate = not exit_wait and not ksft_wait
         self._exit_wait = exit_wait
         self.check_fail = fail
+        self.expect_fail = expect_fail
 
         if shell and self.terminate:
             print("# Warning: combining shell and terminate is risky!")
@@ -179,7 +197,8 @@ class bkg(cmd):
         # since forcing termination silences failures with fail=None
         if self.proc.poll() is None:
             terminate = terminate or (self._exit_wait and ex_type is not None)
-        return self.process(terminate=terminate, fail=self.check_fail)
+        return self.process(terminate=terminate, fail=self.check_fail,
+                            expect_fail=self.expect_fail)
 
 
 GLOBAL_DEFER_QUEUE = []
-- 
2.54.0.545.g6539524ca2-goog

