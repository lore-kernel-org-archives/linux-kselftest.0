Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29EB3A784A
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 10:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772101939; cv=none; b=uqctDemhbmym7/kaCk08Si8Lr1whI7Z/4/rFqTkGiEQvbXiPjV/Zeqc4/XqaXj3ttJdeP8WkObWIcCPGi2/sEYY66bGQb+sxGc/Sq4J6bbcOVZRVQ4EDHNakU2zY6SkU+28FUrEa13Ck99dekHxsFMLhpecLj45UO+pFIc6od14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772101939; c=relaxed/simple;
	bh=wkHeT4XUoOFy4GFofBPUPqusWE2E1I31xRkD/rzy22U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:From:To:Subject; b=U7GvbeoC61CMDmSU2gocjVqTieQA9J/HkzD28+nl8p/dA8Ww1iGzm1YUzTeQ/t+SboGIfChl2lMxOL4ArhzLke6h/h8bSVuL6XTJxG9bx+BIlI75nYZN2WPWF/DoEHb/R+ylnb7uF3H7aGYkbY3Jz9PHEdsAfYrbkW9gr3A448I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KF3Rg13U; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KF3Rg13U"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DE0234E41165
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 10:32:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B412B5FDEB;
	Thu, 26 Feb 2026 10:32:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A8C331036932B;
	Thu, 26 Feb 2026 11:32:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772101935; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=zzZoj4BBEM+jIwZkGV9NPQ5xf+aN6E8yHWj58EAW/ug=;
	b=KF3Rg13UMahOBUwtYdSFfaJIs/AMrvAjFIYBW+huADM3ust7AuQ+BEv1iKaqMy2uH8Hvpl
	Rk7n5k0oDZx4wM7BvJNKH9cMU5dFQHymDL89whoIMT9HiD9uxRio+5GhbxaxAAW5xHnV2T
	NDapNkBH62/E4rb95qLcnz/u4yyVcFardq6ShjMcPWUUepj1E0wFzv4oQGT6GCmlYhOgJE
	7eo4BSaplhq1XCIASdi+eI2j31jipzTPQvBYA0OA77Yp1izm4qbp+HxezaKdzQd+QRybAF
	Ur2kDhiFjHAgcwk7lgi7lMy5vma0uHJrpDlMfFQrTMJpddtDzO3EkJCYjvR67g==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Feb 2026 11:32:14 +0100
Message-Id: <DGOTPHTTR5ZE.Q7ALRR86ZZ6N@bootlin.com>
Cc: "Quentin Monnet" <qmo@kernel.org>, "Bastien Curutchet (eBPF Foundation)"
 <bastien.curutchet@bootlin.com>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "bpf" <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: [Question] json parsing and bpf selftests dependencies
X-Mailer: aerc 0.21.0-0-g5549850facc2
X-Last-TLS-Session-Version: TLSv1.3

Hello,
I am pursuing my quest to convert standalone bpf tests (from
tools/testing/selftests/bpf) into the test_progs framework so they can
be executed automatically by the CI tooling.

I would like to continue on the bpftool tests, especially
test_bpftool.py ([1]). This one involves quite a lot of json parsing on
bpftool output (to validate that some entries are present in the
output, depending on the used command), which does not seem to be a use
case currently in bpf selftests. The first tests may be handled by some
manual parsing (eg strstr'ing keys in the output, that's what I've done
for the recently converted bpftool_metadata test, see [2]), but that's a
bit fragile, and there are more complex subtests for which this loosy
strategy will get even more fragile (eg
test_feature_kernel_full_vs_not_full generates json output with two
different commands, and tests the diff).

I then face the need to have some proper json parsing in test_progs. I
kind of understand that there is a will to keep the dependency list
small for test_progs, so I'm asking here what could be the best option
for this:
- is it ok to make test_progs depend on a new json parsing library (eg:
  cJSON) ? and so add the library to CI images ?
- or some implicit dependency on some CLI tooling (eg: jq) ? and so, add
  the cli tool to CI images ?
- test_progs is reusing json_writer.c from bpftool ([2]), should we
  rather write a custom  json_reader.c as well (even if not needed at
  that point by bpftool itself) ?

Any opinion on this ?

Alexis

[1] https://elixir.bootlin.com/linux/v6.19.3/source/tools/testing/selftests=
/bpf/test_bpftool.py
[2] https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/tree/t=
ools/testing/selftests/bpf/prog_tests/bpftool_metadata.c#n49
[3] https://elixir.bootlin.com/linux/v6.19.3/source/tools/bpf/bpftool/json_=
writer.c

--=20
Alexis Lothor=C3=A9, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
