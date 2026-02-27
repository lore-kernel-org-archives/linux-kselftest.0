Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A33A3ECBE6;
	Fri, 27 Feb 2026 10:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772189837; cv=none; b=JssikZkmpHz5EI06WLhQxvAIPpeEO70VjI4x5tHl08+8GLcMgKb75+lnY1DtqTNN3qFHgki0ZH6zB9WW2D7NfZapkxHDleMjYj88hkqaETJIXsl0MlzKqU4+SHtYZk1YoQHNiRLLnQk1SZezbfC+9bU6bGLGoTQPqG8tQK0Zthc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772189837; c=relaxed/simple;
	bh=JuXKGBqT3xLn+3Syw2pnNhzaXc6uufxdPEZ1bdyp8sk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CDz/my79L4gz266CdCEUzLsT1CwXt/+yKBazZJU04tFUovJsbPGvj7XTw/IgCvEemNZO7W9SeowV34q0n4Un2UB3UYkmd0aXxtZADnewi8RYp2UTaUCueHCn7Ag6SkoNDNykq9t88XnaODkkzkkpNC34tZFs7ZlTFSdFj86ek4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=jri1GLgx; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=CcoGcHKY; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="jri1GLgx";
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="CcoGcHKY"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1772189832;
	bh=JuXKGBqT3xLn+3Syw2pnNhzaXc6uufxdPEZ1bdyp8sk=;
	h=From:To:Cc:Subject:Date:From;
	b=jri1GLgxDCxrj91wzNZQBWpPlBMDtTXrntPpBmpMF0aoWctMB23riP3TeNkoC5E4v
	 lsS04RjUvXdKhZI0ajjO8lUOG4LRtrRJ9OO9Y9md41HXDcsw8ET/WdbsNgIbHGL+uv
	 gu08zC6tLMxRe77+EVd0Pp42TgVevdwBxDRWNvi7rDUFgRdZ26gH8Atz8n2wBE+EcB
	 8C6aTuCZLCXeJtwYe/9rsLOfxN3VbkwvAr2lyQKWERBgmVrZdokMFi77YI2MuGLbLo
	 I6aKbsfCgAJIAaWUD53ZRupJqyT0AMgVu+JwdY9WKBG/PUmy9BtkZTqDfV0xCgqJnl
	 1H49zCtf+6rUUDYIsDPudeoAaguY1fyq2dKLOWY9dspu8GBkO6JG0VHj7nQZ6W9zfW
	 4uQsK8Vkune56q0gQwOqBHYMnC9hG+sZLTyzMBvDyN5sg4MZT8HnprNnHXjK1A1Ok3
	 wjOeYA/PZZUQD0Bfxli7bfe909IN0LQXqISa23VzGOKhFvoCmukJBHhErvjJYx0F5K
	 o0Wz2fOe8RQExhIMQW9JXt3eDzRds9UOOKvNbfcikQDqsPg3f0AVkBXGGAyBhlJfBh
	 KFKYvwOaJoFkOvw2C6GDJLPd8Z9FassKAiAzelOXllg5764DTmdV+x6EUMnYaUuto/
	 T3771BOmaqt3tSP/NBhvf+cc=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 179DB1E7A42; Fri, 27 Feb 2026 18:57:12 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1772189830;
	bh=JuXKGBqT3xLn+3Syw2pnNhzaXc6uufxdPEZ1bdyp8sk=;
	h=From:To:Cc:Subject:Date:From;
	b=CcoGcHKYIcGDseVXTOGyKoL3F0yJI3FtIBlxDlSrq7ZpMKb0hPbmbzZ5sxCJ+QIn+
	 z1kpOgtKVWFFH89Fj8KXJ/9kJChu1jQGnEZmDa6piHPULDk3/wAEUbYeD2nfWw+hTv
	 Bp5/PziVleuSyjmiPfkPYt3KF27zxjPchZ15hZfqlEpJwpFwOn3oI+16QxdwOX2S9u
	 0+8llcIQcVfp9JeZUgui0GwofdSxtHs9jceslTgPzl0hDGOPg0ZeY5DjjAi+0SDHZB
	 /izvuN3YT7Jhg5IJHsYrzqziETzobDSIrvIDp8V4KVqBAOqmIhJwIxgQ40idOzL4Ei
	 hbeCC4HuWh85ealceua+eSm2xcjzh1xcw5nuzoeRK3y+3Eu+VmCgMRT110r44gDXT7
	 3EgaE5bL1B8/3jXSlqLoye9zCy1GSP5dX+sNZWzp88rZZkeo8sIByCBsz+Fyafj3w6
	 4HtQgdkqPbDiL0HgK26pZTHNK+uqa6ZP7Jii1FAi3hsaS7Hnq47qRHWj3GFlZKmtAP
	 1fNxnypaefz2/nc1W2RYlAP0zeM71rCS1PIqzvP9cEJth0xtI6ZO1Fy3XRKUCToZCw
	 U6ArXT+ePn/kzG2fly5t7qcOapOcjTc6XP8EWgBDwVxVQoQekYSoboJn0fFaROv9lL
	 tuC+ZN4bq8m/PjlvXe0BYaZE=
Received: from sparky.lan (unknown [IPv6:2001:8003:8824:9e00:6d16:7ef9:c827:387c])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id B41C91E7A3B;
	Fri, 27 Feb 2026 18:57:10 +0800 (AWST)
From: David Gow <david@davidgow.net>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	Rae Moar <raemoar63@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Shuah Khan <shuah@kernel.org>
Cc: David Gow <david@davidgow.net>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kunit: tool: Recommend --raw_output=all if no KTAP found
Date: Fri, 27 Feb 2026 18:56:49 +0800
Message-ID: <20260227105650.307845-1-david@davidgow.net>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If no KTAP header is found in the kernel output (e.g., because the kernel
crashed before the KUnit executor was run), it's very useful to re-run the
test with --raw_output=all, as that will show any error output (such as a
stacktrace, log message, BUG, etc). This is not particularly intuitive,
however, as --raw_output=all is not well known.

Add an extra log line to advertise --raw_output=all in this case, as it's
a terrible user experience to just get "Did any KUnit tests run?"

Signed-off-by: David Gow <david@davidgow.net>
---
 tools/testing/kunit/kunit_parser.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/kunit/kunit_parser.py b/tools/testing/kunit/kunit_parser.py
index 5338489dcbe4..1c61a0ed740d 100644
--- a/tools/testing/kunit/kunit_parser.py
+++ b/tools/testing/kunit/kunit_parser.py
@@ -857,7 +857,8 @@ def parse_run_tests(kernel_output: Iterable[str], printer: Printer) -> Test:
 	test = Test()
 	if not lines:
 		test.name = '<missing>'
-		test.add_error(printer, 'Could not find any KTAP output. Did any KUnit tests run?')
+		test.add_error(printer, 'Could not find any KTAP output. Did any KUnit tests run?\n' +
+			'Try running with the --raw_output=all option to see any log messages.')
 		test.status = TestStatus.FAILURE_TO_PARSE_TESTS
 	else:
 		test = parse_test(lines, 0, [], False, printer)
-- 
2.53.0

