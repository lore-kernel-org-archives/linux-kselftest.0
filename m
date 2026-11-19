Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115629;
	b=phZPVQQ57nUxxDFzgGRiRAozwvsuhmOF3GFhuG4t8nUYN7zapXl8n9x8JadsWehT1C33
	 NOfuR3+5qoWQIvrKAfPJJbkl9Mz1LU59lzQRqYw5SPvk0LE8nOfuX6WI9mtvzSj/PpHju
	 1jzhUiH7RFtHy5y6y1IgbaWPYb4TrCVfCcQXB9N55HfgDIZejf+DHfBEu9eSZ9kT1d8wA
	 0uc+ll6M8QOCaqCQISEKrsaqbV/HNd/2yp5TYiVaTrHWNgAfWxZuwwwW5cIH+gqiYgWPH
	 TagGDdScBAReyKffGi4rFk9IvhjhUo3gREI7osIvBeY99RmKHu+Oy+vCm4yGegd4kZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2uRzIgoX7QgJ0b9rPImUpCV7/J8FxvsFPO0XMJFT2Y8=;
	b=hWGKAhxEgG05SxVK7QpQTEyI2uGIIZ9p8O1Hgu6xOyW3SF6Rx1W/jiMa9ascBSdB/rIq
	 5fdQM2KXSbnOZkzS74QkeDq7GSABf5warPm+8/H5O0tdy9dYqzFJPSG4tsgro5TvwjWa3
	 4b7OvqwKeTC6+w/bR6OqdpcABIjy0kAMN8LlJv7Fx5dDGLyNUXht1ZfO5yu9e1S44uKZo
	 wBFD0ctec+4zeeXtH0H8R5iBj0te4Vf3w4wWRU39CFl/6LSrxI69tx84k5SQ4Qj97WGl4
	 sjcqPakxRPoeizxxes17GWgz3AKLQ6lwGWNmzEWrqWBqEMlEEB/wGtvCHhhfJsk8JQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=O8gUVyYZ;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B712606A32A
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 19:13:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B712606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=O8gUVyYZ
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso64800a12.3
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 11:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1795115629; x=1795720429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2uRzIgoX7QgJ0b9rPImUpCV7/J8FxvsFPO0XMJFT2Y8=;
        b=O8gUVyYZTWbgA9xuJqGFF9NIQCaahfdGYAt4f9bL37up1YnZ24HDEPn56DSjU7Hvik
         TwNM+UsTENh2GUqQk74oeof6LNXfT7bL84zzZPc6nIyf8i8IJrvzpBfB91FKOY+rWCo9
         4uV55jCvFPaBrb1AY9emFJJ2NI603VY0eiCdhNeu2poMKDJVrq4dazK00kuLuOxsse0u
         ZOM7I6xnUE6QLz3ASz5LWdTUWaXJ6sBjcYVkXiL+rEppa1JdkYRLUUD5zm+uTXxGQntn
         bytqU4kdVLy0oIC/X1QN2ajfonVZ8zXbXToAywgzGR2VYO5g81fEXTMfvPSeFC7Ob8sB
         Nu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795115629; x=1795720429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2uRzIgoX7QgJ0b9rPImUpCV7/J8FxvsFPO0XMJFT2Y8=;
        b=eSXJnUpPWQwS2o3KiujqkYwhIgh0diVJxZy1uThmMeVWRkwBhNB3Og7ihQp06YyV9+
         s3jGXl4j1WaPZYJ7qHtB+PpHRhJIARL5yeQXkbEV1nva5P49k9x13uA6e0FZD4VpqSIR
         uLZO3TM15uUXQ9JDrR/3umzID3XnSUGi9MdpbsB74+4qvPOj+FmCY+7hmF0oZ17frCFU
         lPsEaNSSKGDcEsNTe+tTUdgaiHftd9WRoNZryZ/SHy69sl21rvLj/rKLp58C/JoNI6Db
         GGxP8Zd8R2qdncoHkodKRgWLobXP7ouARA9DpMAWFipR7JC4JJFchpZU4mv8YUMAp3E8
         441w==
X-Forwarded-Encrypted: i=1; AL+hErEVnCcwjrMj5Y7uKqPg8g+CK/pJyP1AlJBTbMPZ4oV5J530AHxlle+IcNErpcSnZUMbwvHsWuk3x+lSSpMqGvI=@vger.kernel.org
X-Gm-Message-State: APuU4Z93e0lFIrIaNyMoukB91cbzDArx3AAAcD5w7pRWMiWZyKYOgJUF
	c3RaDknVVe0CuUyl+k/kmzfsXs/CJdMhLP4faSXwZsNY0V/o4TV7iFZ2t2kRa17o7g9cFuTSagj
	ZSthuHsxjdMlz16X19Vuk4XikHoyVlosrSKiXolf8HQvtDwU6KWDg
X-Gm-Gg: AZFdTZfjGd5coUfMfhr3we7/E0fUl+8yS2T3zCgXKcLaj8G/REFk9naNh075zwS5tXw
	RTIp4ADrEU2if30wh6K0QHZReFxgPvLdNTwGUZvFMyHSLRCDEN+CZQMYoPUtoe0e1ittpXiX2Ci
	/nYOhIuEvRQzKovtrobFMzAy22aRqv0NQSznnTRfv7XsNg03kp5nP07XqqxsCT8mWm9JEcsmv4P
	HBV/MOsLfQaJDmPMv5aiu/VJcY9C/+y+2gpPI+bU97y7JmGSxuNvKl8MfHACaHF10Nd7atsfP4b
	7X9wWzdLwDWhH0T3ONDNuLy6dvULn0aOXEspKmEDb9ho2z6yYf1/0/sLLDLJahEScXg3byowJxN
	Xkzfzs511tJeEdDvMSo0J
X-Received: by 2002:a17:90b:2ecb:b0:3b3:c45e:c715 with SMTP id 98e67ed59e1d1-3b41c95e7bcmr268669a91.50.1795115628581;
        Thu, 19 Nov 2026 11:13:48 -0800 (PST)
Received: from c7-smtp-2026.dev.purestorage.com ([2620:125:9017:12:36:3:6:0])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41d23b49fsm40355a91.1.2026.11.19.11.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:13:48 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-rjethwani.dev.purestorage.com (dev-rjethwani.dev.purestorage.com [10.17.2.234])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 9BD9B402AE;
	Thu, 19 Nov 2026 12:13:47 -0700 (MST)
Received: by dev-rjethwani.dev.purestorage.com (Postfix, from userid 1557719937)
	id 98FE2DC1565; Thu, 19 Nov 2026 12:13:47 -0700 (MST)
From: Rishikesh Jethwani <rjethwani@purestorage.com>
To: netdev@vger.kernel.org
Cc: Rishikesh Jethwani <rjethwani@purestorage.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v2 2/3] selftests: net: py: add a bkg() timeout and kill the child when it expires
Date: Thu, 19 Nov 2026 12:13:38 -0700
Message-ID: <20261119191341.4089157-2-rjethwani@purestorage.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261119191341.4089157-1-rjethwani@purestorage.com>
References: <20261119191341.4089157-1-rjethwani@purestorage.com>
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

bkg() waits a fixed 20s for its command on exit and, on timeout, raises
with the child still running, outliving the devices and namespaces the
test tears down. Add a timeout argument for that wait, and kill the
child when it expires before raising TimeoutExpired as before.

Signed-off-by: Rishikesh Jethwani <rjethwani@purestorage.com>
---
 tools/testing/selftests/net/lib/py/utils.py | 28 ++++++++++++++++++---
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/net/lib/py/utils.py b/tools/testing/selftests/net/lib/py/utils.py
index 1727bc418073..7a3fc39db334 100644
--- a/tools/testing/selftests/net/lib/py/utils.py
+++ b/tools/testing/selftests/net/lib/py/utils.py
@@ -104,13 +104,32 @@ class cmd:
     def _process_terminate(self, terminate, timeout):
         if terminate:
             self.proc.terminate()
-        stdout, stderr = self.proc.communicate(timeout=timeout)
+        timed_out = None
+        try:
+            stdout, stderr = self.proc.communicate(timeout=timeout)
+        except subprocess.TimeoutExpired as exc:
+            # terminate() is only a request, and bkg() with exit_wait or
+            # ksft_wait never sends one, so kill rather than leave the child
+            # running. That does not stop a command run over ssh on the
+            # remote; it needs a bound of its own.
+            self.proc.kill()
+            try:
+                stdout, stderr = self.proc.communicate(timeout=1)
+            except subprocess.TimeoutExpired:
+                # A grandchild (shell=True, ssh) still holds the pipes.
+                self.proc.wait()
+                stdout, stderr = b"", b""
+            timed_out = exc
+
         self.stdout = stdout.decode("utf-8")
         self.stderr = stderr.decode("utf-8")
         self.proc.stdout.close()
         self.proc.stderr.close()
         self.ret = self.proc.returncode
 
+        if timed_out:
+            raise timed_out
+
         return stdout, stderr
 
     def process(self, terminate=True, fail=None, expect_fail=False, timeout=20):
@@ -179,11 +198,12 @@ class bkg(cmd):
     """
     def __init__(self, comm, shell=None, fail=None, expect_fail=None,
                  ns=None, host=None, exit_wait=False, ksft_ready=None,
-                 ksft_wait=None):
+                 ksft_wait=None, timeout=20):
         super().__init__(comm, background=True,
                          shell=shell, fail=fail, expect_fail=expect_fail,
                          ns=ns, host=host, ksft_ready=ksft_ready,
-                         ksft_wait=ksft_wait)
+                         ksft_wait=ksft_wait, timeout=timeout)
+        self.timeout = timeout
         self.terminate = not exit_wait and not ksft_wait
         self._exit_wait = exit_wait
         self.check_fail = fail
@@ -203,7 +223,7 @@ class bkg(cmd):
         if self.proc.poll() is None:
             terminate = terminate or (self._exit_wait and ex_type is not None)
         return self.process(terminate=terminate, fail=self.check_fail,
-                            expect_fail=self.expect_fail)
+                            expect_fail=self.expect_fail, timeout=self.timeout)
 
 
 GLOBAL_DEFER_QUEUE = []
-- 
2.50.1

