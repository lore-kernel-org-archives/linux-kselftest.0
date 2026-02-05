Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C5A3D3D00
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Feb 2026 13:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770299928; cv=none; b=rJTHpNqKo4W2NpARG7fznzAahG88HQG4QUYGGJPlJwokxno6YLiX5jtPnR1y9sMX/2vjI2Bl0pY1Jj0YcCO6iiPjq2YuoVF8WCZ+QkseQnMXlyn+7PEPW92G1/RYvcfaoUAefJBQZebH5lJ/oc6yYq0bwLrB8v2JuXHRw4Hd594=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770299928; c=relaxed/simple;
	bh=E4HFJMThakiyZ3PNDQdEq1HCxaDForK49Da5ZoVfT3A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iJeWiMjGCjhVqAxxBm90+QFi9GPz1WXwxBm0DFz5FVB7pIQYCpfhdZpb+iTAe21BWEzM4cEHdRwX+kn0i75JJHn3nBLJPmK5FAJIgcsdZOsCIvKIKKmN5uzRn4i3eR4K0IFb6F5exmWIGAH8/kkl688OqxOg/1Dt4kq1Hu1DlRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CWKingNP; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CWKingNP"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8c710439535so58255885a.1
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Feb 2026 05:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770299927; x=1770904727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rSpavQGrbW9Sk1NhHLCmCOMh7WCFB8hsxDAgv+wU+rk=;
        b=CWKingNP+Qtnyr8iyFrjElg98FlHwRcI9yu3xSF+kPA0jJ2v2uePllJVV2VyCrVidW
         SM04oyW7ifsuu36YDEocnlUj7vMW1HVnFuicYtIGViWdUbVVrfPkqnxx2+FZgtxXi326
         QHtB3wYgNcF1AtaE9Dk8aCGvk/9/td6BkLhdvXpFtcu5SZrKZ2gHEuP+w3eY0pAunieh
         0guo31hDLF9gJ/KmvrTRMjqrBvUi7G+Z1l+FpfzGv1fazeqBcF5xBwr8g2euiRP++vmx
         0T49yOwkXNkdiDRXQKElWcauFsGqQHJSW5EC+tH3UfMGF+OiTfFUi8YXqNOLZT4GJbVg
         239g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770299927; x=1770904727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rSpavQGrbW9Sk1NhHLCmCOMh7WCFB8hsxDAgv+wU+rk=;
        b=XFJlhIFaRhP94/ljaDuSH9pgkz8k+qElgWprWyWPJu9gRnIQKLda5d6VzhQmYrl/0c
         TU/a61BU11/rPG4q8kQ1qGTmyyVwFA/mvkaiy+jOQs4VcYM5Iujoi6HQFsPDzj8g5BEJ
         lWB4mwzDSrFzn9ciHaSleQCBJLb4p9z9vBJKP+MWhr6EPFfv0vIZvw+B3l5vpEb9eI/T
         A04S3OKQiFjJn+o9KlJYB040h2t80KHPr3XgbB4WJ8qXlmRP/Eva+0kO7yVFzm2VFXuT
         9OBG3jknsUuyEGwCJSrDSzZWEPGMCdpzDt45oZrW9EmioS/+1wB7kaMC1j+ozJechrMJ
         NT2A==
X-Forwarded-Encrypted: i=1; AJvYcCXa30wYwSd7NpesTkdTxA95Mslpxf4JqH7WiQ7ICgSrxhYRFGtgOIHMLTOW4LiEq7UpT+GFNUqh3yah8cV1IvE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfriix0t8CTKsq7Xqa5ShrzbZTKFk4CZbwMhK/I3hHQlulmHsJ
	rFAG2f/W7bz36or4FhQ7RmjCc61bnvwpcDog+GrAKorx/F+Q9bQtTBs3
X-Gm-Gg: AZuq6aJk/tAJhVNVGnUED+IgH3+IlzX1UDEFHD69oH584hiqnd2/SAeqRW5poqsy/fe
	Gs68Lqazd5E3xK137p2vJBv6KC2hzr/D8QgdBpttcmT53KIUaQIyhGGcMNGjvNLA4ptfoIirjmx
	HQtB8afkLvcjQU5Nb8CfhKpodyBnbEUrfvpn8h9zdnE0GoOLoMptWwuQ5CjVj52ChdioVi254Rg
	n/8361mwW56j3A+gDRVtBmN5qpRmsP8LKpqbYlrY1GfJ3rFZRYLlYxVOahcxGKcn6Rf+T0TYq80
	PR2QJ0OhAbaoJXzsZ4Z/gz+Zp6xedv5LHYG/PHTNNozDf6pwHH9lWsLxyV0l0EvYRVTjdnk5gGS
	ELYEtvRLKulXQeKAmhMZBKB290FsFwcO/XJ02QXWs6kmyNoQklgcL4R3X5YwVGv6ID+tYF6SqkA
	4G4mqN49XO/+M/9IbvH7pZamcywKx9pnxYPaBXSauk+bB04VdNbhldqzIMpvzAfh4oBAzJdnpnb
	PiX40P5CQ==
X-Received: by 2002:a05:620a:4146:b0:80e:3af7:7a0c with SMTP id af79cd13be357-8ca2f9bb02emr906508885a.43.1770299926871;
        Thu, 05 Feb 2026 05:58:46 -0800 (PST)
Received: from pc.mynetworksettings.com ([2600:4041:4491:2000:87a6:ecbb:44f:b3c1])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ca2fd40f9asm404975985a.41.2026.02.05.05.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 05:58:46 -0800 (PST)
From: "Seokwoo Chung (Ryan)" <seokwoo.chung130@gmail.com>
To: mhiramat@kernel.org
Cc: rostedt@goodmis.org,
	corbet@lwn.net,
	shuah@kernel.org,
	mathieu.desnoyers@efficios.com,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	"Seokwoo Chung (Ryan)" <seokwoo.chung130@gmail.com>
Subject: [PATCH v6 0/4] tracing/fprobe: Support comma-separated symbol lists and :entry/:exit suffixes
Date: Thu,  5 Feb 2026 08:58:38 -0500
Message-ID: <20260205135842.20517-1-seokwoo.chung130@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the fprobe event interface to accept comma-separated symbol lists
with ! exclusion prefix, and :entry/:exit suffixes as an alternative to
%return.  Single-symbol probes retain full backward compatibility with
%return.

Example usage:
  f:mygroup/myevent vfs_read,!vfs_write,vfs_open:entry
  f:mygroup/myexit  vfs_read,vfs_open:exit

Changes since v5:
  - Fix missing closing brace in the empty-token check that caused a
    build error.
  - Remove redundant strchr/strstr checks for tracepoint validation;
    the character validation loop already rejects ',', ':', and '%'.
  - Add trace_probe_log_err() to the tracepoint character validation
    loop so users see what went wrong in tracefs/error_log (reviewer
    feedback from Masami Hiramatsu).
  - Remove unnecessary braces around single-statement if per kernel
    coding style (reviewer feedback).
  - Extract list parsing into parse_fprobe_list() to keep
    parse_fprobe_spec() focused (reviewer feedback).
  - New patch 2/4: add glob_match_comma_list() in kernel/trace/fprobe.c
    so register_fprobe() correctly handles comma-separated filter
    strings.  Without this, enabling a list-mode fprobe event failed
    with "Could not enable event" because glob_match() does not
    understand commas.
  - Reorder: documentation patch now comes after all code changes.
  - Updated selftest commit message to note that existing tests
    (add_remove_fprobe.tc, fprobe_syntax_errors.tc,
    add_remove_fprobe_repeat.tc) report UNSUPPORTED because their
    "requires" lines still check for the old %return syntax in README.
    Their requires lines need updating in a follow-up patch.

Tested in QEMU/KVM but I am not too confident if I configured correctly and
would like to ask for further testing. 

Seokwoo Chung (Ryan) (4):
  tracing/fprobe: Support comma-separated symbols and :entry/:exit
  fprobe: Support comma-separated filters in register_fprobe()
  docs: tracing/fprobe: Document list filters and :entry/:exit
  selftests/ftrace: Add accept cases for fprobe list syntax

 Documentation/trace/fprobetrace.rst           |  17 +-
 kernel/trace/fprobe.c                         |  30 ++-
 kernel/trace/trace.c                          |   3 +-
 kernel/trace/trace_fprobe.c                   | 219 ++++++++++++++----
 .../ftrace/test.d/dynevent/fprobe_list.tc     |  92 ++++++++
 5 files changed, 308 insertions(+), 53 deletions(-)
 create mode 100644 tools/testing/selftests/ftrace/test.d/dynevent/fprobe_list.tc

-- 
2.43.0

