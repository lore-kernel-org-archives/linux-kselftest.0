Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819892D97A6
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Feb 2026 08:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771315447; cv=none; b=J7bhPgvnAVc+rMcSRkZEGIw/ha0IhmVXjTMFbp/q2dtcqE+PYFayvzo/lG1PmgxFAa8lIEKMs+0XmJ98KQnWpfT02CT0vHDzhKbrlIMes7oUtI/koqPFTVWNeCCc0sTyct9uiUqA1HVbE/U4vnLc4SR+7iiOHHjjrlvNv6LmI2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771315447; c=relaxed/simple;
	bh=Yweqh5Ie4qKFEMSdJJSbslC8AC9nlGFb9nntTg3vI9E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Tb+yoC87/Rmz7ZLBqAH/TA7TsU+uEKC0PN0RgcEZGGJr+Y9dRQm4NI4+2ny2MiVK+nPcUr/4p3aHaQt1kwGtcIOe+emq1uSBPCNpze/PpKRZ0/Sxz9HganI3SO4GFvf1MQ+oU0SeBd8VI76g+aRsFygXJyXP+U8chpE7ASrcoKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h5IJXhWe; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5IJXhWe"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4837907f535so26118465e9.3
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Feb 2026 00:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771315445; x=1771920245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rwu0RtjJnSjfYWXl8NymM6GUAIv3FYMND1I3ZXXKY24=;
        b=h5IJXhWeXPgNXBaJqsmQEZad1xmCvDSjgV/fe7sHT8JajF7LsbPVsZld2vFsIe9GkH
         elKXbnygIo+o8PPR0myZIaJx9w0ybb5J9KhJ8EN/FDOp1+sjp3mDjf6R0RzxgIrooRTf
         iBcnfJxv09kWEr9w0vgNsSLbpDmtO6Bay59o7CX3gA7gpbCqyfYJGnLXPzZ4SKtCGaJU
         KF86HmTULY288/ZSJz7blkXGQ168Q2wEzATv9EdDqKDyA/B46ILMRNCEyOZj0TK6QcQA
         W7Vn9UcS+SIWJDtnVFKjSfmpdUWNFTXEldr9FhpgaIcUZ6EjQyzVjEQyIlymN24PA85D
         3V7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771315445; x=1771920245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwu0RtjJnSjfYWXl8NymM6GUAIv3FYMND1I3ZXXKY24=;
        b=QN+jQ8tu6T6tdIFTn/LY9NQDLeBVGgHKK3OwrEfxyJYFYK7R/cmT9VBrU9qWSwvFtC
         iZjjrGQPQ5RJw7CgZ90gHqNCZNAOBacLL5kqVVXkXdQaCgv77A541ffAJsaokoD6C+3Q
         PtNNj++e6L40dUajKsYL9kNfDm6eldeiVr9RzDXlecmuf++bbH5OcAbB4/Vc3TrdvJ/J
         gBdDDaPsL22pb39hr0yZxpg00OfYnzGL0NPR6a8qoudqQ6uXaBtSx2nHswl0zSpr+Bj9
         iiGMtzaEFentFPug8RJ+Er6sz5MltA0PhmmQ0cwv7WR+N2KDJOr6yv2ss0xyRMS0Q52L
         ejkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHf5YDjGiR5wSTMVVcK3uxiNQTMrcNdzSrlI11EPI6tYxlAD5WT5NGSewSmXG8oAee/9TLvb7DkrtfPyBTkKI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrkn80xBhnaiNwWCPjFGG9obS4I3IJQ5nJ3upzcHuXFBxLc98b
	SITzYFmUkVCP6f9A/+YWW8G6J46WXmGQogxafZkp2ylGp0VCm1oqSiru
X-Gm-Gg: AZuq6aLRdeMneQeXRyvgWl50nQC20eLoHTDPxmikAGWuL8edn2Cl5n61G2WvHAx/u7e
	cUQj0hekzzp8x4EOndmkVBbKAchtQfMITPpzMcNEvRvKltAF1uuhXXWXeIalINU1skBLPu/QXvR
	dT+GL7XHiBiag/BGZXQ3oShWIzV1mkHFaI6lumKMoPPpf3+JoSflCfqQlIc4KM4JUnyFsGpqV9Q
	JIdPncsW4/3wxbkiU+4Ttjm8CtCGGUdxZ/8TEP8N5ocnOqMDBiD+n1QppWqYsqY1AfM7tshjRtN
	gkCuqq4t9pAJART1MN7fg8gkm7chFeYFAqFB9+8Fh6iYA+3jbNgSlXDHSzZY5253wGDu3H5xd5S
	Vw6vBx+w2idvrVh2RcSRj2vP/WLbfz2gaHWuolhKowZhaJF3A/Y25fMgFDr9aZyl7TajZNbsFTS
	DkrhgCmGEB5fhI2HO33JDquf3EoFwIMJ5uADtx5DhWLFlUqYhnVqqlr2cWIgIr
X-Received: by 2002:a05:600c:3496:b0:47e:e779:36d with SMTP id 5b1f17b1804b1-48379bd72a9mr155342395e9.23.1771315444665;
        Tue, 17 Feb 2026 00:04:04 -0800 (PST)
Received: from wdesk. (static.169.76.13.49.clients.your-server.de. [49.13.76.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48370a3f077sm102996985e9.2.2026.02.17.00.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 00:04:04 -0800 (PST)
From: Mahdi Faramarzpour <mahdifrmx@gmail.com>
X-Google-Original-From: Mahdi Faramarzpour <mahdifrmz@gmail.com>
To: bpf@vger.kernel.org
Cc: Magnus Karlsson <magnus.karlsson@intel.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mahdi Faramarzpour <mahdifrmx@gmail.com>
Subject: [PATCH bpf] bpf: fix selftest/xsk single test selection
Date: Tue, 17 Feb 2026 11:33:26 +0330
Message-Id: <20260217080326.50564-1-mahdifrmz@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mahdi Faramarzpour <mahdifrmx@gmail.com>

This commit fixes the integer parsing of -t option. The cli parser
only relies on errno to detect parsing errors. The manpage for
strtol (https://man7.org/linux/man-pages/man3/strtol.3.html)
states that the said function "MAY" set errno to EINVAL in case the
conversion fails. Currently on some systems, this leads to a silent
failure with return value not being exactly documented in the
manpages (probably zero). The reliable way to validate the input is
to check whether the endptr has been bumped all the way to the end
of the string or not.

Signd-off-by: Mahdi Faramarzpour <mahdifrmx@gmail.com>
Fixes: 146e30554a53 ("selftests/xsk: add option to run single test")
---
 tools/testing/selftests/bpf/xskxceiver.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/xskxceiver.c b/tools/testing/selftests/bpf/xskxceiver.c
index 05b3cebc5..f2d5c4dd2 100644
--- a/tools/testing/selftests/bpf/xskxceiver.c
+++ b/tools/testing/selftests/bpf/xskxceiver.c
@@ -247,9 +247,10 @@ static void parse_command_line(struct ifobject *ifobj_tx, struct ifobject *ifobj
 			opt_print_tests = true;
 			break;
 		case 't':
+			char *eptr;
 			errno = 0;
-			opt_run_test = strtol(optarg, NULL, 0);
-			if (errno)
+			opt_run_test = strtol(optarg, &eptr, 0);
+			if (errno || *eptr)
 				print_usage(argv);
 			break;
 		case 'h':
-- 
2.34.1

