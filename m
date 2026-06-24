Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACFB3876B5
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 11:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782299936; cv=none; b=tgnnVoUlb4xjTMeXtP/qtLAq3sYYLZxe+V1pe+Oh0Zcq2e2eCGOURiddOKYOanvdH+jIVQS6/0/6Ay3o8Xdwxi8cQAcY7w/Wfz8azZnZ/R4pRPEDiOs28FVt136XlIC6LpzCkL/+j9hnUaPlRNtnflkKH3Aa67Sicji18P0S4gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782299936; c=relaxed/simple;
	bh=YcYgvjQQvfdK9csmMpftYfTGyBLTGAHCvrDLZlvhiWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K9XIUCBiSZMYnUFes/IOb0rLCpCRzwGJJ6azYeqtRJXvz/seBq4et4bjmtIUq1Bt8kbwyDfE4ENI9oMMpaunfkCTA9CyBFj7DknTrIGn3cZfKbn5uHbviEKzEX2BrAS1f/5ubN1frj4Zw9wc3GZHxrC/QzuAO2Pecvxd7ACT9rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IQ8UWtsD; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IQ8UWtsD"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-37c867bd3e0so553501a91.0
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 04:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782299934; x=1782904734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OoO02AGMPuVaNHiQsRbyn16oX/4f9DidBoVMmT+JO/c=;
        b=IQ8UWtsD9SJeq744CUTfohNM+utAmHinYBZUR0rkEkh48lRJNi4qHlnPGc4acdJssQ
         G417Q+/dRObSUc2wn0Y/zyfFG1mz3OSeEH+88623KTaa37IM/Uacy/wZ+3OIWXs60X2W
         2SBS5W2h6jJMRMRSkw//o5heUsTzvZxKhvL/ZBnLvp7ijGYp74dE5tDYh8MzhlJEThQN
         7yvpXa0P5MNd0bPaPo7VFx70Awqk+gn6CYMO/zlx0WDVc3gGhU98krDz+oUOpbgVS3Zk
         uP55pAXiq4OXK9o2rjhrHDz5bQH/HVTclTWcYHjRXlz19zz8tT53KNMQz87Kvrmq9bUx
         8URA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782299934; x=1782904734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OoO02AGMPuVaNHiQsRbyn16oX/4f9DidBoVMmT+JO/c=;
        b=hSlnvFk9fj6W4Hg61k70YyjbjHcOeoopDmR7AqF/ieALc89H3FAW0aKYcp2lzTnDaC
         Z6Oa6yXJQWxl5pD0sDL5uycsFzvk3R6+L2lHI70YpgYAAkFdJr66/sDqwZcbHXfJ0SEp
         JS1r3ciWMK3XoEgzJm8vo8L6Lhl5gy4k6/n55v7jIt7oDwEXE68q8HrgnrAPuqVkX9aB
         DxitPHd44qAx3tsE6IJ4/SQde/0Tzyayt+AZoPVr9AvEL7PPyarBX7JSUBafCYgicgNm
         NqLJVbpZ86j9jvj9TReGObptnwnL7zzQOdsFfAERl+sQWy2yn3GIlyQ5CUn26EfAOTrY
         nCHw==
X-Forwarded-Encrypted: i=1; AHgh+RpfKoxSHk7hWt/Sh9DdbCAGXdfTmnKjTTxSsVEaXDonxAueiWTvgoFjWoId2BIy2G61fe8xqEukZZGPUjNoiiI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvmsgs6hfcr+tTX7A4SwaEqNhixuVyvJbDPkyOzXwQqPxrRNXe
	qO+/4kMkx8y7xraiV6FPmY/2DvjepH0gZ3/hgxq7JNP8ec18cDORkDO8
X-Gm-Gg: AfdE7ckyEimXo6zH0Flk19NwEDYMU/v2qGmtQkkK+NKM2KCj1ppascB7WxOhIXZlkmK
	OmHR4AFBoAaWxHNIvLpTZBYZDYHiTZ9Y1Gq4IzH2pTKQeUfiI3sci5hxBwUEACHuAIg38TOZ5M+
	lBXG0L3JLU9u8Azo1RMkiOf/RAteCzwIpf7FXgF9JNC6DnbGkld8QB4mgoW/MHQxl+vEm0O5dEE
	AoYnrplhJXrmXXILZCR3/DQxtJqL+BzYHcJ00Hx4LU0HryOFZWaPY2Bgoa5BWAG3wtjymvYh7YC
	0v21uVP4ql7fXg1ahP6m21/dBbf//DKFobEDQz8/hWBpI6hdDIlAOxhMlvHqS353sP49wlZkoD9
	11zNj8OERWcYWLIreFBIRGYFJvjbkpOHOOLuz1PDwMVJ6dOc4Af8nKPT5cj/PaHzxeSgch7CAfR
	6F+USZPWjvj3U6YTfz4X+NdcGDKGVK7lK3O71FwBojV/SNjgufV3AZpWlfKyq6oof2dnBpJ4V5u
	Do7gDwVucTtsTcqtiVhxZ8XUIc=
X-Received: by 2002:a17:90b:5103:b0:368:a27f:9083 with SMTP id 98e67ed59e1d1-37de41c03b5mr2673857a91.7.1782299934149;
        Wed, 24 Jun 2026 04:18:54 -0700 (PDT)
Received: from u2404-VMware-Virtual-Platform.localdomain ([202.8.105.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37de3aa1b1csm2290385a91.5.2026.06.24.04.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 04:18:53 -0700 (PDT)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	john.fastabend@gmail.com,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	shuah@kernel.org,
	laoar.shao@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH bpf 2/2] selftests/bpf: Cover link info metadata on ENOSPC
Date: Wed, 24 Jun 2026 19:18:37 +0800
Message-ID: <20260624111837.889209-2-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624111837.889209-1-sun.jian.kdev@gmail.com>
References: <20260624111837.889209-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a perf event tracepoint link info check with a one-byte tp_name
buffer. The query is expected to return -ENOSPC because the nested name
buffer is too small, but it should still report the top-level link type,
perf event type, cookie, and real tp_name length.

Before the fix, bpf_link_get_info_by_fd() returned -ENOSPC but did not
copy the top-level bpf_link_info back to userspace, leaving info.type as
zero.

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 .../selftests/bpf/prog_tests/fill_link_info.c | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/fill_link_info.c b/tools/testing/selftests/bpf/prog_tests/fill_link_info.c
index f589eefbf9fb..95132c80b3b9 100644
--- a/tools/testing/selftests/bpf/prog_tests/fill_link_info.c
+++ b/tools/testing/selftests/bpf/prog_tests/fill_link_info.c
@@ -126,6 +126,37 @@ static int verify_perf_link_info(int fd, enum bpf_perf_event_type type, long add
 	return err;
 }
 
+static int verify_perf_tp_link_info_enospc(int fd)
+{
+	struct bpf_link_info info;
+	__u32 len = sizeof(info);
+	char buf[1] = {};
+	int err;
+
+	memset(&info, 0, sizeof(info));
+	info.perf_event.tracepoint.tp_name = ptr_to_u64(buf);
+	info.perf_event.tracepoint.name_len = sizeof(buf);
+
+	err = bpf_link_get_info_by_fd(fd, &info, &len);
+	if (!ASSERT_EQ(err, -ENOSPC, "get_link_info_enospc"))
+		return -1;
+
+	if (!ASSERT_EQ(info.type, BPF_LINK_TYPE_PERF_EVENT, "link_type_enospc"))
+		return -1;
+	if (!ASSERT_EQ(info.perf_event.type, BPF_PERF_EVENT_TRACEPOINT, "perf_type_enospc"))
+		return -1;
+	if (!ASSERT_EQ(info.perf_event.tracepoint.name_len, strlen(TP_NAME) + 1,
+		       "tp_name_len_enospc"))
+		return -1;
+	if (!ASSERT_EQ(info.perf_event.tracepoint.cookie, PERF_EVENT_COOKIE,
+		       "tp_cookie_enospc"))
+		return -1;
+	if (!ASSERT_EQ(buf[0], '\0', "short_tp_name_nul"))
+		return -1;
+
+	return 0;
+}
+
 static void kprobe_fill_invalid_user_buffer(int fd)
 {
 	struct bpf_link_info info;
@@ -200,6 +231,10 @@ static void test_tp_fill_link_info(struct test_fill_link_info *skel)
 	link_fd = bpf_link__fd(link);
 	err = verify_perf_link_info(link_fd, BPF_PERF_EVENT_TRACEPOINT, 0, 0, 0);
 	ASSERT_OK(err, "verify_perf_link_info");
+
+	err = verify_perf_tp_link_info_enospc(link_fd);
+	ASSERT_OK(err, "verify_perf_tp_link_info_enospc");
+
 	bpf_link__destroy(link);
 }
 
-- 
2.43.0

