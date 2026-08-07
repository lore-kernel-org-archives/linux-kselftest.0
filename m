Received: from va-1-111.ptr.blmpb.com (va-1-111.ptr.blmpb.com [209.127.230.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D38391832
	for <linux-kselftest@vger.kernel.org>; Fri,  7 Aug 2026 08:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786090577; cv=none; b=NzmplRfqb056tPsnXsa2kA5h5GKXs76C8owbC8shLquseYCio/hKCwwXoiBhmRGJ0fC9oMpVNjFAWb70JM0b3iLPs8BYKBQhaOj+Ql9o9dFzeMfnQDmlqsqcH6zE8aeudXUqK8amijVfCXDXBe9P7ypL55kI0McjvlcOiNrthlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786090577; c=relaxed/simple;
	bh=qozgKeqjQY8jqxFJp3ds9EO0gAHwRe1fjjWm2OUEFWo=;
	h=To:Subject:References:Content-Type:From:Date:In-Reply-To:Cc:
	 Message-Id:Mime-Version; b=iDwpvZQfb/oUu4Hljfboe48tQJB4QT3KAQaG8cJUl5Sy4T3F+/wJ2SdEUQUNwJtjwbjxfhMD+qGdVpBN1HFAJQI1nTYXjrkpWmlyydkEO/MxLuCPB95lpbD5NhVlXPmz+p8/xt8saRMEDz6cwunNsABiFYS22YyDP49q55o3Oqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=K1ZQW0zj; arc=none smtp.client-ip=209.127.230.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="K1ZQW0zj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1786090558; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=m5Q6pj+2aZgVsaFgFCzX1cAV4lDF7uuJhuFlfFc6gII=;
 b=K1ZQW0zjVX4NN8CQGedGheeuZV1HmREEodC3vLQr9i6Ox171LEfslXA59eHoQ3dpTiTffD
 J3vupKOLpRn6ekZHLF0AuJ0TSbzN45722NpGs9alvNawbuDnAotwNWLjV5NWRBgJNZg4bJ
 IixkktHa28uo2oFEoSMQf5buMqngNfktO4SUJaCaXHHMISZnVXMgvd6j4BaFY7n5Yo5JM+
 Z1Lx9BRyKXuAGyUe9nxr7vozyzrce+1uoE6GPRjpvZ2fDSTUQDe/bmHfSUePC6WS/06I8C
 eNtixQpNUNCDQgApokrC0QF5nvuRhFiDyTQtvjBNTln+I/NmCRTicJw98/hxyQ==
To: "Steven Rostedt" <rostedt@goodmis.org>, 
	"Masami Hiramatsu" <mhiramat@kernel.org>
Subject: [PATCH v2 2/2] selftests/ftrace: Convert ELF entry point to file offset in uprobe test
X-Lms-Return-Path: <lba+26a75943c+ab6dd3+vger.kernel.org+qirui.001@bytedance.com>
References: <20260806083101.2651025-1-qirui.001@bytedance.com> <20260807081512.2974757-1-qirui.001@bytedance.com>
Content-Type: text/plain; charset=UTF-8
From: "Rui Qi" <qirui.001@bytedance.com>
Date: Fri,  7 Aug 2026 16:15:12 +0800
In-Reply-To: <20260807081512.2974757-1-qirui.001@bytedance.com>
Cc: "Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>, 
	"Shuah Khan" <shuah@kernel.org>, "Heiko Carstens" <hca@linux.ibm.com>, 
	<linux-kernel@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>, 
	<linux-kselftest@vger.kernel.org>, "Rui Qi" <qirui.001@bytedance.com>
Message-Id: <20260807081512.2974757-3-qirui.001@bytedance.com>
Content-Transfer-Encoding: 7bit
X-Mailer: git-send-email 2.20.1
X-Original-From: Rui Qi <qirui.001@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0

The add_remove_uprobe test uses readelf -h to obtain the ELF entry
point (e_entry) and passes it directly as the offset to uprobe_events.
However, uprobe_events expects a file offset, not a virtual address.

For PIE binaries, the virtual address happens to equal the file offset
because the first LOAD segment has p_vaddr == p_offset, so the test
works by coincidence. But for non-PIE executables, e_entry is an
absolute virtual address that can far exceed the file size. When the
probe is enabled, uprobe_register() checks offset > i_size_read(inode)
and rejects it with -EINVAL.

Fix this by converting the virtual address to a file offset using the
ELF program headers: scan readelf -lW output for the LOAD segment
containing the entry point, then compute file_offset = e_entry -
p_vaddr + p_offset. For PIE binaries the result is unchanged; for
non-PIE binaries the offset is correctly translated.

The conversion uses only POSIX shell primitives, with no dependency on
gawk or perl.

Fixes: dc4b165855f2 ("selftests/ftrace: Use readelf to find entry point in uprobe test")
Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
 .../test.d/dynevent/add_remove_uprobe.tc      | 27 +++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/ftrace/test.d/dynevent/add_remove_uprobe.tc b/tools/testing/selftests/ftrace/test.d/dynevent/add_remove_uprobe.tc
index f2048c244526..19430bd5864c 100644
--- a/tools/testing/selftests/ftrace/test.d/dynevent/add_remove_uprobe.tc
+++ b/tools/testing/selftests/ftrace/test.d/dynevent/add_remove_uprobe.tc
@@ -12,9 +12,32 @@ echo 0 > events/enable
 echo > dynamic_events
 
 REALBIN=`readlink -f /bin/sh`
-ENTRYPOINT=`readelf -h ${REALBIN} | grep Entry | sed -e 's/[^0]*//'`
 
-echo "p:myevent ${REALBIN}:${ENTRYPOINT}" >> uprobe_events
+# Get the entry point virtual address from ELF header
+ENTRY=`readelf -hW ${REALBIN} | grep "Entry point" | awk '{print $NF}'`
+
+# Convert virtual address to file offset: find the LOAD segment containing
+# the entry point, then compute file_offset = e_entry - p_vaddr + p_offset.
+# For PIE binaries this is a no-op (vaddr == file offset), but for non-PIE
+# executables the virtual address is much larger than the file size and
+# must be converted, otherwise uprobe_register() rejects it with -EINVAL.
+ENTRY_DEC=$(printf '%d' "$ENTRY")
+OFFSET=$ENTRY
+while IFS= read -r line; do
+    set -- $line
+    [ "$1" = "LOAD" ] || continue
+    VA_DEC=$(printf '%d' "$3")
+    OFF_DEC=$(printf '%d' "$2")
+    FSZ_DEC=$(printf '%d' "$5")
+    if [ "$ENTRY_DEC" -ge "$VA_DEC" ] && [ "$ENTRY_DEC" -lt "$((VA_DEC + FSZ_DEC))" ]; then
+        OFFSET=$(printf '0x%x' "$((ENTRY_DEC - VA_DEC + OFF_DEC))")
+        break
+    fi
+done << EOF
+$(readelf -lW ${REALBIN} | grep LOAD)
+EOF
+
+echo "p:myevent ${REALBIN}:${OFFSET}" >> uprobe_events
 
 grep -q myevent uprobe_events
 test -d events/uprobes/myevent
-- 
2.20.1
