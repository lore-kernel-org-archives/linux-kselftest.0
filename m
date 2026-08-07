Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB8B399000
	for <linux-kselftest@vger.kernel.org>; Fri,  7 Aug 2026 08:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786090556; cv=none; b=gwq0tVqAK9vtK40zFHgy5LvITlyR+sf8Z40fst4znxiaPeLYYo9vUe0paM3UOHV2GmLmSt+MTMnLoC+UPx5QnIY1/+Q8ctgOp6hIj1GxbFLpx+GJiDFRBodo4ImzwbspPoaIYXIJZWP4vUXciBle+B6mFpAdZw+8Y0O7+8F1QWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786090556; c=relaxed/simple;
	bh=A3hxkj0mnENhQepTkY8vMZbzVGgYvfElGjjdeNE53CU=;
	h=To:From:Mime-Version:Cc:Subject:Date:References:Content-Type:
	 Message-Id:In-Reply-To; b=R4Fmh9IoWV0vcnPAHJFZ8tuWLSskfJuQkvZJKOiMIdQvkZHtBAf7Fwz+RD0FMSe6Vtg+5PRu/w32rqJ+VPsv4ho4IhbHQhGOZyjBRqhLDhP4uD7Dttwedgf71GY8Ejf+xD/NNlSqu4G2hKnxnjDSuo8esXai3JVLZF3FT5NMI+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=m1hnE6f5; arc=none smtp.client-ip=209.127.230.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="m1hnE6f5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1786090546; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=+XWYCvGW0LNdiKWYNV9u+HmtX/DOjOYu6CEy4SzeiMU=;
 b=m1hnE6f5pxGie+9Fixy34qGRkKDJYG/bR1IoXMARlDduB42ReXU6bZlzhrkvbSesEqR0lz
 P2Fx1aSW1eLo3EbKAkDRT4TcZk8md6UiKbyblGQUGhnBn6x5ClXFaLvUyPOWwqxmOi5AOj
 zqQul1FDBhzvLfXb1m/L0ESLxNa9bPw3TG7EaPB1kZUTWS9D/kjcT02hg8mAv+B8iCt+5p
 pIzRyMC0TlQAp+bCG5/UQt4msldx4JxK5y348PXgRgd/lO3L95FmUTMYvHef9Cc882L0HM
 8y7VoWw/nwrKTY4ezF//KV3MlQZaM1TnmS7eFdcLAHfHGmos40mYiWCv/yk+iQ==
To: "Steven Rostedt" <rostedt@goodmis.org>, 
	"Masami Hiramatsu" <mhiramat@kernel.org>
X-Lms-Return-Path: <lba+26a75942f+300c30+vger.kernel.org+qirui.001@bytedance.com>
X-Mailer: git-send-email 2.20.1
From: "Rui Qi" <qirui.001@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>, 
	"Shuah Khan" <shuah@kernel.org>, "Heiko Carstens" <hca@linux.ibm.com>, 
	<linux-kernel@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>, 
	<linux-kselftest@vger.kernel.org>, "Rui Qi" <qirui.001@bytedance.com>
Subject: [PATCH v2 1/2] selftests/ftrace: Force C locale in ftracetest
Date: Fri,  7 Aug 2026 16:15:11 +0800
References: <20260806083101.2651025-1-qirui.001@bytedance.com> <20260807081512.2974757-1-qirui.001@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Message-Id: <20260807081512.2974757-2-qirui.001@bytedance.com>
In-Reply-To: <20260807081512.2974757-1-qirui.001@bytedance.com>
X-Original-From: Rui Qi <qirui.001@bytedance.com>

Some ftracetest test cases parse command output by matching English
field names. Tools such as readelf may localize their output via
gettext, while ftracetest currently inherits the user locale from
the environment.

If a translated field name is printed, parsing can fail even though
the tested kernel behavior is unchanged. For example, add_remove_uprobe
can fail to find the ELF entry point and then write a uprobe event with
a missing offset.

Export LC_ALL=C in the top-level ftracetest runner so every test case
gets stable command output by default.

Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
 tools/testing/selftests/ftrace/ftracetest | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/ftrace/ftracetest b/tools/testing/selftests/ftrace/ftracetest
index 8ad2c385407e..246d7e1d015c 100755
--- a/tools/testing/selftests/ftrace/ftracetest
+++ b/tools/testing/selftests/ftrace/ftracetest
@@ -7,6 +7,9 @@
 #  Written by Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>
 #
 
+# Keep command output parsing stable regardless of the user's locale.
+export LC_ALL=C
+
 usage() { # errno [message]
 [ ! -z "$2" ] && echo $2
 echo "Usage: ftracetest [options] [testcase(s)] [testcase-directory(s)]"
-- 
2.20.1
